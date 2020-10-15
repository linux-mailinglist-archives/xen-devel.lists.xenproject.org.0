Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA328F5AB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7486.19578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4zI-0002Ni-Eb; Thu, 15 Oct 2020 15:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7486.19578; Thu, 15 Oct 2020 15:16:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4zI-0002NI-9q; Thu, 15 Oct 2020 15:16:16 +0000
Received: by outflank-mailman (input) for mailman id 7486;
 Thu, 15 Oct 2020 15:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kT4zG-0002ND-Sr
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:16:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7453203-569d-4d1a-8c1d-b9f8215774a5;
 Thu, 15 Oct 2020 15:16:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB6FFAB0E;
 Thu, 15 Oct 2020 15:16:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kT4zG-0002ND-Sr
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:16:14 +0000
X-Inumbo-ID: f7453203-569d-4d1a-8c1d-b9f8215774a5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f7453203-569d-4d1a-8c1d-b9f8215774a5;
	Thu, 15 Oct 2020 15:16:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602774964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KI5wVx4FRmhvGSkYP6r+ArTuozQ8lzQpP3Xv0BQ96Kc=;
	b=nEaako62Sup5pZxVlPOqzQ3Lntw9r2NNlM8EpvinE6mMROTPDm97eZ1nZvadqcSSRGm1Dl
	btEF2RHfei1ToFu0mLacIbYjt19igqNAVUeVLleHW2HRKKEB6G9VO2SwFSuD+zvhmSSPyi
	4u4nQMPQXXk8MBI4p1fsVpffB61sWZI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AB6FFAB0E;
	Thu, 15 Oct 2020 15:16:04 +0000 (UTC)
Subject: Re: [PATCH v2] x86/smpboot: Don't unconditionally call
 memguard_guard_stack() in cpu_smpboot_alloc()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201014184708.17758-1-andrew.cooper3@citrix.com>
 <0ed412d9-c9a2-194b-c953-c74ee102664f@suse.com>
 <0a294279-5de5-3b54-b1f9-847de1159447@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <578a0afd-693a-c704-317e-477e5e27d497@suse.com>
Date: Thu, 15 Oct 2020 17:16:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <0a294279-5de5-3b54-b1f9-847de1159447@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.10.2020 16:02, Andrew Cooper wrote:
> On 15/10/2020 09:50, Jan Beulich wrote:
>> On 14.10.2020 20:47, Andrew Cooper wrote:
>>> cpu_smpboot_alloc() is designed to be idempotent with respect to partially
>>> initialised state.  This occurs for S3 and CPU parking, where enough state to
>>> handle NMIs/#MCs needs to remain valid for the entire lifetime of Xen, even
>>> when we otherwise want to offline the CPU.
>>>
>>> For simplicity between various configuration, Xen always uses shadow stack
>>> mappings (Read-only + Dirty) for the guard page, irrespective of whether
>>> CET-SS is enabled.
>>>
>>> Unfortunately, the CET-SS changes in memguard_guard_stack() broke idempotency
>>> by first writing out the supervisor shadow stack tokens with plain writes,
>>> then changing the mapping to being read-only.
>>>
>>> This ordering is strictly necessary to configure the BSP, which cannot have
>>> the supervisor tokens be written with WRSS.
>>>
>>> Instead of calling memguard_guard_stack() unconditionally, call it only when
>>> actually allocating a new stack.  Xenheap allocates are guaranteed to be
>>> writeable, and the net result is idempotency WRT configuring stack_base[].
>>>
>>> Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
>>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>>
>>> This can more easily be demonstrated with CPU hotplug than S3, and the absence
>>> of bug reports goes to show how rarely hotplug is used.
>>>
>>> v2:
>>>  * Don't break S3/CPU parking in combination with CET-SS.  v1 would, for S3,
>>>    turn the BSP shadow stack into regular mappings, and #DF as soon as the TLB
>>>    shootdown completes.
>> The code change looks correct to me, but since I don't understand
>> this part I'm afraid I may be overlooking something. I understand
>> the "turn the BSP shadow stack into regular mappings" relates to
>> cpu_smpboot_free()'s call to memguard_unguard_stack(), but I
>> didn't think we come through cpu_smpboot_free() for the BSP upon
>> entering or leaving S3.
> 
> The v1 really did fix Marek's repro of the problem.
> 
> The only possible way this can occur is if, somewhere, there is a call
> to cpu_smpboot_free() for CPU0 with remove=0 on the S3 path

I didn't think it was the BSP's stack that got written to, but the
first AP's before letting it run.

Jan

