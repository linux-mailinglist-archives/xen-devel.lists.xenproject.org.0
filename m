Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBC474A2A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247002.426022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxC3m-000876-Az; Tue, 14 Dec 2021 17:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247002.426022; Tue, 14 Dec 2021 17:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxC3m-000848-7E; Tue, 14 Dec 2021 17:57:54 +0000
Received: by outflank-mailman (input) for mailman id 247002;
 Tue, 14 Dec 2021 17:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP3+=Q7=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1mxC3k-000842-UO
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:57:52 +0000
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aec6200-5d07-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 18:57:51 +0100 (CET)
Received: from [192.168.1.18] ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id xC3hmDtUWIEdlxC3hmHzWx; Tue, 14 Dec 2021 18:57:51 +0100
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
X-Inumbo-ID: 5aec6200-5d07-11ec-9e60-abaf8a552007
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 14 Dec 2021 18:57:51 +0100
X-ME-IP: 86.243.171.122
Subject: Re: [PATCH v2] xen-blkfront: Use the bitmap API when applicable
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 axboe@kernel.dk, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Newsgroups: gmane.linux.kernel.janitors,gmane.comp.emulators.xen.devel,gmane.linux.block,gmane.linux.kernel
References: <d6f31db1d2542e1b4ba66d4cea80d3891678aa5a.1638476031.git.christophe.jaillet@wanadoo.fr>
 <Ybh5G2ziyRXkz3WF@Air-de-Roger> <Ybh7KgtQt0/MFtyw@Air-de-Roger>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <14dbcf69-afc1-c11b-e1ad-e8453a80cc6e@wanadoo.fr>
Date: Tue, 14 Dec 2021 18:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybh7KgtQt0/MFtyw@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Le 14/12/2021 à 12:08, Roger Pau Monné a écrit :
> On Tue, Dec 14, 2021 at 11:59:39AM +0100, Roger Pau Monné wrote:
>> On Thu, Dec 02, 2021 at 09:16:04PM +0100, Christophe JAILLET wrote:
>>> Use 'bitmap_zalloc()' to simplify code, improve the semantic and avoid some
>>> open-coded arithmetic in allocator arguments.
>>>
>>> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
>>> consistency.
>>>
>>> Use 'bitmap_copy()' to avoid an explicit 'memcpy()'
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Oh, I see there's been further discussion on this to avoid relying
> implicitly on the size of the bitmap being rounded to the size of an
> unsigned long. I think a new version is expected then?
> 
> Thanks, Roger.
> 

Yes, I'll send a patch in order to add a 'bitmap_size()'
I'll update this patch when/if it is merged.

You can drop it for now.

CJ

