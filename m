Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F92AF7F02
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032352.1406030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqn-0002yr-Sc; Thu, 03 Jul 2025 17:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032352.1406030; Thu, 03 Jul 2025 17:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqn-0002wM-Ow; Thu, 03 Jul 2025 17:35:57 +0000
Received: by outflank-mailman (input) for mailman id 1032352;
 Thu, 03 Jul 2025 17:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gwr=ZQ=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1uXNql-00021t-MM
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:35:56 +0000
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr
 [80.12.242.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b8325c8-5834-11f0-a315-13f23c93f187;
 Thu, 03 Jul 2025 19:35:54 +0200 (CEST)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id XNqjuxFR98jLiXNqjuUJqz; Thu, 03 Jul 2025 19:35:53 +0200
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
X-Inumbo-ID: 2b8325c8-5834-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751564153;
	bh=ZQ0aSIIkruxyS5VG7Wq7+L5vmBZtmZ6PRQHg4mDtPZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gRDGE1nZ3NNDO66Ct/nhWmX+978ORto8+Ecj/OeVwD8Ajs2VkL6vgEf76ddx+KLtU
	 rujymNj2t1Qp6gkEYnn3E0RzfqyuAXVN2ZrP8y5/CZ/qS3TrguHTkuE3CsuLqUSduk
	 kpzEmxZ0Sx3fSrogpq+FTtOeNlvRbjjl+ObtVadsa278//bHLXRR+PwrBwOf3z/ftT
	 NUrJRVu12MYz1yRTAYOZm06MPJ2bNhBKcglF8epcZ996boshAtkbARg6G3Z2Zr5QI7
	 YnMTijBeneFqJwb1SZHlBlQBO0x9KEqv5LycitMqqu7irSUs1mNlz64v6lp5RpIKsP
	 4hDILbnKXosNw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 03 Jul 2025 19:35:53 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <f1c68345-a511-46b8-964c-a00bb62274ba@wanadoo.fr>
Date: Thu, 3 Jul 2025 19:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Tu Dinh <ngoc-tu.dinh@vates.tech>, Abinash <abinashlalotra@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
 <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
 <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
 <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
 <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 07:22, Jürgen Groß a écrit :
> On 03.07.25 00:42, Tu Dinh wrote:
>> On 01/07/2025 23:53, Abinash wrote:
>>> Hi ,
>>>
>>> Thanks for pointing that out.
>>>
>>> I haven’t measured the performance impact yet — my main focus was on
>>> getting rid of the stack usage warning triggered by LLVM due to
>>> inlining. But you're right, gntdev_ioctl_grant_copy() is on a hot
>>> path, and calling kmalloc() there could definitely slow things down,
>>> especially under memory pressure.
>>>
>>> I’ll run some benchmarks to compare the current approach with the
>>> dynamic allocation, and also look into alternatives — maybe
>>> pre-allocating the struct or limiting inlining instead. If you have
>>> any ideas or suggestions on how best to approach this, I’d be happy to
>>> hear them.
>>>
>>> Do you have any suggestions on how to test the performance?
>>>
>>> Best,
>>> Abinash
>>>
>>>
>>
>> Preallocating may work but I'd be wary of synchronization if the
>> preallocated struct is shared.
>>
>> I'd look at optimizing status[] which should save quite a few bytes.
>>
>> Reducing GNTDEV_COPY_BATCH could be a last resort, but that may also
>> impact performance.
> 
> IMHO the most promising way would be to dynamically allocate the struct, 
> but
> don't free it at the end of the ioctl. Instead it could be put into a list
> anchored in struct gntdev_priv, so freeing would be done only at close() 
> time.
> 
> Synchronization would be minimal (just for taking a free struct from the 
> list
> or putting it back again), while memory usage would be basically just as 
> needed,
> depending on the number of concurrent threads using the same file 
> descriptor
> for the ioctl.
> 
> This approach would even allow to raise GNTDEV_COPY_BATCH, maybe 
> resulting even
> in a gain of performance.
> 
> I'll write a patch implementing the allocation scheme.
> 
> 
> Juergen

It may be an overkill, but sometimes we see pattern that try to keep the 
best of the 2 worlds. Something like:


static struct gntdev_copy_batch static_batch;
static struct mutex my_mutex;

static long gntdev_ioctl_grant_copy(...)
{
	struct gntdev_copy_batch *dynamic_batch = NULL;
	struct gntdev_copy_batch *batch;

	...

	if (mutex_trylock(&my_mutex)) {
		/*
		 * No concurrent access?
		 * Use a shared static variable to avoid an allocation
		 */
		batch = &static_batch;
	else {
		/* otherwise, we need some fresh memory */
		dynamic_batch = kmalloc(sizeof(*batch), GFP_KERNEL);
		if (!batch)
			return -ENOMEM;

		batch = dynamic_batch;
	}

	/* do stuff with 'batch' */
	...

free_batch:
	if (!dynamic_batch)
		mutex_unlock(&my_mutex);
	else
		kfree(dynamic_batch);
  	return ret;
  }


Just my 2c.

CJ



