Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552E46830B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Dec 2021 07:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238043.412776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtOzA-0002Pb-VL; Sat, 04 Dec 2021 06:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238043.412776; Sat, 04 Dec 2021 06:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtOzA-0002No-S9; Sat, 04 Dec 2021 06:57:28 +0000
Received: by outflank-mailman (input) for mailman id 238043;
 Sat, 04 Dec 2021 06:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lxa8=QV=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1mtOz9-0002Ni-BH
 for xen-devel@lists.xenproject.org; Sat, 04 Dec 2021 06:57:27 +0000
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb1e510-54cf-11ec-a5e1-b9374ead2679;
 Sat, 04 Dec 2021 07:57:25 +0100 (CET)
Received: from [192.168.1.18] ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id tOz3mtyH7MNzvtOz3m2FTn; Sat, 04 Dec 2021 07:57:24 +0100
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
X-Inumbo-ID: 6fb1e510-54cf-11ec-a5e1-b9374ead2679
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 04 Dec 2021 07:57:24 +0100
X-ME-IP: 86.243.171.122
Subject: Re: [PATCH] xen-blkfront: Use the bitmap API when applicable
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joe Perches <joe@perches.com>, Juergen Gross <jgross@suse.com>,
 sstabellini@kernel.org, roger.pau@citrix.com, axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1c73cf8eaff02ea19439ec676c063e592d273cfe.1638392965.git.christophe.jaillet@wanadoo.fr>
 <c529a221-f444-ad26-11ff-f693401c9429@suse.com>
 <d8f87c17-75d1-2e6b-65e1-23adc75bb515@wanadoo.fr>
 <6fcddba84070c021eb92aa9a5ff15fb2a47e9acb.camel@perches.com>
 <3d71577f-dabe-6e1a-4b03-2a44f304b702@wanadoo.fr>
 <863f2cddacac590d581cda09d548ee0a652df8a1.camel@perches.com>
 <1e9291c6-48bb-88e5-37dc-f604cfa4c4db@wanadoo.fr>
 <a6dd44e2-6ea6-d085-0131-1e9bac49461a@oracle.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <f9a5bc6c-347b-8243-2784-04199ef879c2@wanadoo.fr>
Date: Sat, 4 Dec 2021 07:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a6dd44e2-6ea6-d085-0131-1e9bac49461a@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Le 03/12/2021 à 22:04, Boris Ostrovsky a écrit :
> 
> On 12/3/21 10:54 AM, Christophe JAILLET wrote:
>> Le 03/12/2021 à 04:03, Joe Perches a écrit :
>>
>> I get your point now, and I agree with you.
>>
>> Maybe something as what is done in mc-entity.c?
>> Explicitly require more bits (which will be allocated anyway), instead 
>> of taking advantage (read "hoping") that it will be done.
>>
>> Could be:
>>
>> @@ -440,26 +440,25 @@ static int xlbd_reserve_minors(unsigned int 
>> minor, unsigned int nr)
>>      int rc;
>>
>>      if (end > nr_minors) {
>>          unsigned long *bitmap, *old;
>>
>> -        bitmap = kcalloc(BITS_TO_LONGS(end), sizeof(*bitmap),
>> -                 GFP_KERNEL);
>> +        end = ALIGN(end, BITS_PER_LONG);
>> +        bitmap = bitmap_zalloc(end, GFP_KERNEL);
>>          if (bitmap == NULL)
>>              return -ENOMEM;
>>
>>          spin_lock(&minor_lock);
>>          if (end > nr_minors) {
>>              old = minors;
>> -            memcpy(bitmap, minors,
>> -                   BITS_TO_LONGS(nr_minors) * sizeof(*bitmap));
>> +            bitmap_copy(bitmap, minors, nr_minors);
>>              minors = bitmap;
>> -            nr_minors = BITS_TO_LONGS(end) * BITS_PER_LONG;
>> +            nr_minors = end;
>>          } else
>>              old = bitmap;
>>          spin_unlock(&minor_lock);
>> -        kfree(old);
>> +        bitmap_free(old);
>>      }
>>
>>      spin_lock(&minor_lock);
>>      if (find_next_bit(minors, end, minor) >= end) {
> 
> 
> I don't think this will work anymore, we may now fail if another thread 
> gets a minor above the original (i.e. no aligned) @end.
> 

So, maybe adding an "official" 'bitmap_size()' (which is already 
existing and duplicated in a few places) would ease things.

It would replace the 'nr_minors = BITS_TO_LONGS(end) * BITS_PER_LONG;' 
and hide the implementation details of the bitmap API.

Something like:
static __always_inline size_t bitmap_size(unsigned long nr_bits)
{
	return BITS_TO_LONGS(nr_bits) * sizeof(long);
}

CJ

> 
> -boris
> 

