Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618EC307837
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77089.139433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58Pf-0006dA-13; Thu, 28 Jan 2021 14:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77089.139433; Thu, 28 Jan 2021 14:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58Pe-0006cl-U9; Thu, 28 Jan 2021 14:36:46 +0000
Received: by outflank-mailman (input) for mailman id 77089;
 Thu, 28 Jan 2021 14:36:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l58Pe-0006cg-AM
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:36:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68a05a8a-67fd-41ba-84f9-fa13906b2294;
 Thu, 28 Jan 2021 14:36:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD480B141;
 Thu, 28 Jan 2021 14:36:43 +0000 (UTC)
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
X-Inumbo-ID: 68a05a8a-67fd-41ba-84f9-fa13906b2294
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611844604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzWmFL4gu1fxl7jDKFC/P4wFaBDkoWjQgCeJZayvpks=;
	b=Oztx6KIxKD0+lSM95UWH+tAEJ+is5y5SkAoItMc4gqp0J8TZ6QR5I+lJLy0X63IFR6OJs0
	niPpRmsEBGBSjcUcn6nppGknkL1RkQqlmIvhF6Dd1xFxfxwUMQ2j/75TZQ3TYbxwTxwVJE
	k5AMcvN3nUR0eLld5puNLH1JYAY1cOw=
Subject: Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-11-git-send-email-olekstysh@gmail.com>
 <2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
 <f4a4cbe6-89a1-3f80-2d03-fd62c5d7eda6@suse.com>
 <61c10e68-d3fe-af16-b22f-bac804a0a70a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
Date: Thu, 28 Jan 2021 15:36:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <61c10e68-d3fe-af16-b22f-bac804a0a70a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.01.2021 15:21, Julien Grall wrote:
> On 28/01/2021 13:53, Jan Beulich wrote:
>> On 28.01.2021 14:41, Julien Grall wrote:
>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> The IOREQ is a common feature now and these fields will be used
>>>> on Arm as is. Move them to common struct vcpu as a part of new
>>>> struct vcpu_io and drop duplicating "io" prefixes. Also move
>>>> enum hvm_io_completion to xen/sched.h and remove "hvm" prefixes.
>>>>
>>>> This patch completely removes layering violation in the common code.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>> CC: Julien Grall <julien.grall@arm.com>
>>>> [On Arm only]
>>>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>>
>>> I seem to have trouble running Xen on x86 platform after this patch is
>>> applied (see trace below).
>>>
>>> The bisector pointed out to this patch but I can't quite figure out why
>>> this is breaking.
>>>
>>> Does this ring any bell to someone?
>>
>> Memory overwriting / corruption? This ...
>>
>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=n gcov=y  Tainted:   C   ]----
>>> (XEN) CPU:    1
>>> (XEN) RIP:    e008:[<ffff82d04041c1c7>]
>>> x86_64/entry.S#restore_all_guest+0x7/0x145
>>> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor (d0v0)
>>> (XEN) rax: 00000000000000ff   rbx: ffff83027c806000   rcx: ffff82d0406c9a80
>>> (XEN) rdx: 0000000000000000   rsi: fffffffffffffed9   rdi: 0000000000000001
>>> (XEN) rbp: ffff83027c887df0   rsp: ffff83027c887ef8   r8:  00000000aaa8946e
>>> (XEN) r9:  0000000000000002   r10: ffff83027c806040   r11: ffff83027c8cc020
>>> (XEN) r12: ffff83027c80f000   r13: ffff83027c895000   r14: 0000000000000000
>>> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003426e0
>>> (XEN) cr3: 0000000273a2d000   cr2: 0000000000000000
>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>> (XEN) Xen code around <ffff82d04041c1c7>
>>> (x86_64/entry.S#restore_all_guest+0x7/0x145):
>>> (XEN)  00 48 8b 93 98 0d 00 00 <44> 8b 3a 4c 8b 8b 68 0b 00 00 ba ff 7f
>>
>> ... is
>>
>> restore_all_guest:
>>          ASSERT_INTERRUPTS_DISABLED
>>
>>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>>          mov VCPU_arch_msrs(%rbx), %rdx
>>          mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
>>
>> i.e. Dom0/vCPU0's v->arch.msrs got zeroed in an unintended way,
>> hence %rdx is zero here (%rbx looks at least plausible).
>>
>> I take it that you double check this isn't an incremental build
>> issue, i.e. entry.o for some reason not having got rebuilt
>> despite struct vcpu's layout having changed?
> 
> I was going to reply back on my e-mail with more debugging information. 
> It seems that this is a build issue as if I clean the repo the error 
> disappear.
> 
> The error happens when I move from staging to a batch with this series 
> applied without a cleaning the tree. It also happens the other way 
> around as well.
> 
> Removing entry.o or asm-offsets.h before building doesn't help. Any 
> other idea?

No, I'd need to know how exactly to repro and then try to debug.

> On a side note, it looks like asm-offsets.h doesn't get rebuild when 
> Kconfig change. I noticed an issue when trying to turn on the perf counters.

That's bad and needs fixing. Assuming you mean the kconfig change
in fact incurs a change to asm-offsets.h. Otherwise there might
be a move-if-changed somewhere preventing unnecessary rebuilding.

Jan

