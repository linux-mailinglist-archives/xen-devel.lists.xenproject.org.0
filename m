Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F396A35BFAD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 11:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108835.207640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsfT-0006Tp-5u; Mon, 12 Apr 2021 09:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108835.207640; Mon, 12 Apr 2021 09:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsfT-0006TT-2o; Mon, 12 Apr 2021 09:15:39 +0000
Received: by outflank-mailman (input) for mailman id 108835;
 Mon, 12 Apr 2021 09:15:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVsfR-0006TO-52
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 09:15:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b91280e-a967-4b10-bc11-12c186481f74;
 Mon, 12 Apr 2021 09:15:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84CDCB2E8;
 Mon, 12 Apr 2021 09:15:35 +0000 (UTC)
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
X-Inumbo-ID: 6b91280e-a967-4b10-bc11-12c186481f74
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618218935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmnNfJpaSQJVwrPx1eRc1oEWV+o0kLymXguwsbelPL4=;
	b=VgvTVfBJFw671ZAXzq4c3ucwebyg+7LaHt/UXLkKQ/XLo/jtBPfvyoJGT39XVgBJhQGbnz
	imnawqf/kJF14gE/AN9XVXu8UER+t5hP/1ahEp9hn1brXfMxTp3JvwVxN/1H95v5dg/Pjt
	RS+6Z5iFjwGI9GJ9qapsYweMqf/Y2z0=
Subject: Re: x86: memset() / clear_page() / page scrubbing
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
 <20210409060845.3503745-1-ankur.a.arora@oracle.com>
 <4d8202b3-ffe8-c4e7-e477-d8e7dc294c33@suse.com>
 <df955d0c-b78f-641b-41f6-ed52f9e45cb7@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13709035-2bf6-5dd6-a3f6-1761dde948f7@suse.com>
Date: Mon, 12 Apr 2021 11:15:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <df955d0c-b78f-641b-41f6-ed52f9e45cb7@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.04.2021 23:01, Ankur Arora wrote:
> On 2021-04-08 11:38 p.m., Jan Beulich wrote:
>> On 09.04.2021 08:08, Ankur Arora wrote:
>>> On 4/8/2021 6:58 AM, Jan Beulich wrote:
>>>> The present copy_page() is the way it is because of the desire to
>>>> avoid disturbing the cache. The effect of REP STOS on the L1 cache
>>>> (compared to the present use of MOVNTI) is more or less noticable on
>>>> all hardware, and at least on Intel hardware more noticable when the
>>>> cache starts out clean. For L2 the results are more mixed when
>>>> comparing cache-clean and cache-filled cases, but the difference
>>>> between MOVNTI and REP STOS remains or (at least on Zen2 and older
>>>> Intel hardware) becomes more prominent.
>>>
>>> Could you give me any pointers on the cache-effects on this? This
>>> obviously makes sense but I couldn't come up with any benchmarks
>>> which would show this in a straight-forward fashion.
>>
>> No benchmarks in that sense, but a local debugging patch measuring
>> things before bringing up APs, to have a reasonably predictable
>> environment. I have attached it for your reference.
> 
> Thanks, that does look like a pretty good predictable test.
> (Btw, there might be an oversight in the clear_page_clzero() logic.
> I believe that also needs an sfence.)

Oh, good point.

> Just curious: you had commented out the local irq disable/enable clauses.
> Is that because you decided that it the code ran at an early enough
> point that they were not required or some other reason?

It's not so much "early enough to not be required" but "too early to
be valid to enable interrupts". And then I didn't want to switch to
save/restore, so left them just as comments.

> Would you have any intuition on, if the power consumption of
> the non-temporal primitives is meaningfully different from
> REP STOS and friends?

If power can be saved when caches don't get modified (no idea if
that's possible, as the cached data still requires keeping intact),
then non-temporal stores might be better.

Jan

