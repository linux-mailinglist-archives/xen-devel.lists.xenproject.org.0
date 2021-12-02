Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A45466A27
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 20:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236924.410900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrQR-0004tA-6p; Thu, 02 Dec 2021 19:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236924.410900; Thu, 02 Dec 2021 19:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrQR-0004qZ-3D; Thu, 02 Dec 2021 19:07:23 +0000
Received: by outflank-mailman (input) for mailman id 236924;
 Thu, 02 Dec 2021 19:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wP8P=QT=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1msrQP-0004qA-Ms
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 19:07:21 +0000
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ab2c43-53a3-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 20:07:20 +0100 (CET)
Received: from [192.168.1.18] ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id srQMm8a6iHQrlsrQMmWszZ; Thu, 02 Dec 2021 20:07:19 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 12ab2c43-53a3-11ec-976b-d102b41d0961
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 02 Dec 2021 20:07:19 +0100
X-ME-IP: 86.243.171.122
Subject: Re: [PATCH] xen-blkfront: Use the bitmap API when applicable
To: Joe Perches <joe@perches.com>, Juergen Gross <jgross@suse.com>,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, roger.pau@citrix.com,
 axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1c73cf8eaff02ea19439ec676c063e592d273cfe.1638392965.git.christophe.jaillet@wanadoo.fr>
 <c529a221-f444-ad26-11ff-f693401c9429@suse.com>
 <d8f87c17-75d1-2e6b-65e1-23adc75bb515@wanadoo.fr>
 <6fcddba84070c021eb92aa9a5ff15fb2a47e9acb.camel@perches.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <3d71577f-dabe-6e1a-4b03-2a44f304b702@wanadoo.fr>
Date: Thu, 2 Dec 2021 20:07:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6fcddba84070c021eb92aa9a5ff15fb2a47e9acb.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Le 02/12/2021 à 19:16, Joe Perches a écrit :
> On Thu, 2021-12-02 at 19:12 +0100, Christophe JAILLET wrote:
>> Le 02/12/2021 à 07:12, Juergen Gross a écrit :
>>> On 01.12.21 22:10, Christophe JAILLET wrote:
>>>> Use 'bitmap_zalloc()' to simplify code, improve the semantic and avoid
>>>> some open-coded arithmetic in allocator arguments.
>>>>
>>>> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
>>>> consistency.
>>>>
>>>> Use 'bitmap_copy()' to avoid an explicit 'memcpy()'
> []
>>>> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> []
>>>> @@ -442,16 +442,14 @@ static int xlbd_reserve_minors(unsigned int
>>>> minor, unsigned int nr)
>>>>        if (end > nr_minors) {
>>>>            unsigned long *bitmap, *old;
>>>> -        bitmap = kcalloc(BITS_TO_LONGS(end), sizeof(*bitmap),
>>>> -                 GFP_KERNEL);
>>>> +        bitmap = bitmap_zalloc(end, GFP_KERNEL);
>>>>            if (bitmap == NULL)
>>>>                return -ENOMEM;
>>>>            spin_lock(&minor_lock);
>>>>            if (end > nr_minors) {
>>>>                old = minors;
>>>> -            memcpy(bitmap, minors,
>>>> -                   BITS_TO_LONGS(nr_minors) * sizeof(*bitmap));
>>>> +            bitmap_copy(bitmap, minors, nr_minors);
>>>>                minors = bitmap;
>>>>                nr_minors = BITS_TO_LONGS(end) * BITS_PER_LONG;
> 
> 		nr_minors = end;
> ?
> 

No,
My understanding of the code is that if we lack space (end > nr_minors), 
we need to allocate more. In such a case, we want to keep track of what 
we have allocated, not what we needed.
The "padding" bits in the "long align" allocation, can be used later.

first call
----------
end = 65
nr_minors = 63

--> we need some space
--> we allocate 2 longs = 128 bits
--> we now use 65 bits of these 128 bits

new call
--------
end = 68
nr_minors = 128 (from previous call)
--> no need to reallocate

CJ

