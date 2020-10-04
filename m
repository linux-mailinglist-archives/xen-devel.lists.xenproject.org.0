Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318A282976
	for <lists+xen-devel@lfdr.de>; Sun,  4 Oct 2020 09:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2698.7722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOylc-0002sF-Hd; Sun, 04 Oct 2020 07:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2698.7722; Sun, 04 Oct 2020 07:49:12 +0000
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
	id 1kOylc-0002rq-Ec; Sun, 04 Oct 2020 07:49:12 +0000
Received: by outflank-mailman (input) for mailman id 2698;
 Sun, 04 Oct 2020 07:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOylb-0002rl-Na
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 07:49:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02868a1c-4f92-4777-8d21-18e81fd90842;
 Sun, 04 Oct 2020 07:49:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E294CAC4F;
 Sun,  4 Oct 2020 07:49:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nivo=DL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOylb-0002rl-Na
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 07:49:11 +0000
X-Inumbo-ID: 02868a1c-4f92-4777-8d21-18e81fd90842
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 02868a1c-4f92-4777-8d21-18e81fd90842;
	Sun, 04 Oct 2020 07:49:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601797750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZKPBlisJQ0e/BqVkzd4Dke9AIEZYsp8PmP08KzYou0=;
	b=GOmwn9liJ8WnuwauzIrLFKSNHVoq3Vt0374amLcWvVE6d5e+SmPge7jnezRd3oVK6NNnle
	8EYSWo+X8bDMCKQjUil42LzTUADJOOsqDVJ9C2PvwtLOefU+whmNKAEf7OwUYvH0reUb0U
	455E/jrfFO7hA+va9ty1v/wD0hG3Fhc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E294CAC4F;
	Sun,  4 Oct 2020 07:49:09 +0000 (UTC)
Subject: Re: S3 resume crash in memguard_guard_stack (stable-4.14)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20201003135723.GO3962@mail-itl>
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74e9a18e-4c50-5341-8f3b-e23a5382e515@suse.com>
Date: Sun, 4 Oct 2020 09:49:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201003135723.GO3962@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.10.2020 15:57, Marek Marczykowski-Górecki wrote:
> With this, I get a crash on S3 resume:
> 
> (XEN) Preparing system for ACPI S3 state.
> (XEN) Disabling non-boot CPUs ...
> (XEN) Entering ACPI S3 state.
> (XEN) [VT-D]Passed iommu=no-igfx option.  Disabling IGD VT-d engine.
> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, CMCI
> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
> (XEN) Finishing wakeup from ACPI S3 state.
> (XEN) Enabling non-boot CPUs  ...
> (XEN) ----[ Xen-4.14.1-pre  x86_64  debug=y   Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d040311090>] memguard_guard_stack+0x7/0x1a5
> (XEN) RFLAGS: 0000000000010286   CONTEXT: hypervisor
> (XEN) rax: ffff830250ca03f8   rbx: 0000000000000001   rcx: ffff830250cb10b0
> (XEN) rdx: 0000003210739000   rsi: 0000000000000001   rdi: ffff830250ca0000
> (XEN) rbp: ffff830049a6fd70   rsp: ffff830049a6fd40   r8:  0000000000000001
> (XEN) r9:  0000000000000000   r10: 0000000000000001   r11: 0000000000000002
> (XEN) r12: 0000000000010000   r13: 0000000000000000   r14: 0000000000000001
> (XEN) r15: ffff82d040598440   cr0: 000000008005003b   cr4: 00000000003526e0
> (XEN) cr3: 0000000049a5d000   cr2: ffff830250ca03f8
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d040311090> (memguard_guard_stack+0x7/0x1a5):
> (XEN)  c3 48 8d 87 f8 03 00 00 <48> 89 87 f8 03 00 00 48 8d 87 f8 07 00 00 48 89
> (XEN) Xen stack trace from rsp=ffff830049a6fd40:
> (XEN)    ffff82d040321c2e ffff82d040461b68 ffff82d040461b60 ffff82d040461240
> (XEN)    0000000000000001 0000000000000000 ffff830049a6fdb8 ffff82d040221f9c
> (XEN)    ffff830049a6fde0 0000000000000001 0000000000000000 00000000ffffffef
> (XEN)    ffff830049a6fe08 0000000000000001 ffff830250b66000 ffff830049a6fdd0
> (XEN)    ffff82d0402036cf 0000000000000001 ffff830049a6fdf8 ffff82d040203a4d
> (XEN)    0000000000000000 0000000000000001 0000000000000010 ffff830049a6fe28
> (XEN)    ffff82d040203d00 ffff830049a6fef8 0000000000000000 0000000000000003
> (XEN)    0000000000000200 ffff830049a6fe58 ffff82d040270c9a ffff830250139f70
> (XEN)    ffff830250b45000 0000000000000000 0000000000000000 ffff830049a6fe78
> (XEN)    ffff82d040207064 ffff830250b451b8 ffff82d0405781b0 ffff830049a6fe90
> (XEN)    ffff82d04022b7bb ffff82d0405781a0 ffff830049a6fec0 ffff82d04022ba9c
> (XEN)    0000000000000000 ffff82d0405781b0 ffff82d04057ed00 ffff82d040598440
> (XEN)    ffff830049a6fef0 ffff82d0402f33e3 ffff830252b0e000 ffff830250b45000
> (XEN)    ffff830252b0f000 0000000000000000 ffff830049a6fdc8 ffff88818ce029e0
> (XEN)    ffffc900026b7f08 0000000000000003 0000000000000000 0000000000003403
> (XEN)    ffffffff8277a5a8 0000000000000246 0000000000000003 0000000000003403
> (XEN)    0000000000003403 0000000000000000 ffffffff810020ea 0000000000003403
> (XEN)    0000000000000010 deadbeefdeadf00d 0000010000000000 ffffffff810020ea
> (XEN)    000000000000e033 0000000000000246 ffffc900026b7cb8 000000000000e02b
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040311090>] R memguard_guard_stack+0x7/0x1a5
> (XEN)    [<ffff82d040321c2e>] S smpboot.c#cpu_smpboot_callback+0xe5/0x6d5
> (XEN)    [<ffff82d040221f9c>] F notifier_call_chain+0x6b/0x96
> (XEN)    [<ffff82d0402036cf>] F cpu.c#cpu_notifier_call_chain+0x1b/0x33
> (XEN)    [<ffff82d040203a4d>] F cpu_up+0x5f/0xd5
> (XEN)    [<ffff82d040203d00>] F enable_nonboot_cpus+0xea/0x1fb
> (XEN)    [<ffff82d040270c9a>] F power.c#enter_state_helper+0x152/0x606
> (XEN)    [<ffff82d040207064>] F domain.c#continue_hypercall_tasklet_handler+0x4c/0xb9
> (XEN)    [<ffff82d04022b7bb>] F tasklet.c#do_tasklet_work+0x76/0xa9
> (XEN)    [<ffff82d04022ba9c>] F do_tasklet+0x58/0x8a
> (XEN)    [<ffff82d0402f33e3>] F domain.c#idle_loop+0x40/0x96
> (XEN) 
> (XEN) Pagetable walk from ffff830250ca03f8:
> (XEN)  L4[0x106] = 8000000049a5b063 ffffffffffffffff
> (XEN)  L3[0x009] = 0000000250cae063 ffffffffffffffff
> (XEN)  L2[0x086] = 0000000250cad063 ffffffffffffffff
> (XEN)  L1[0x0a0] = 8000000250ca0161 ffffffffffffffff

Now this one's pretty obvious: The call to memguard_unguard_stack() during
bringing down the APs is conditional (in cpu_smpboot_free()) and hence
memguard_guard_stack() may (at present) not assume the stack is writable
(by ordinary writes, i.e. write_sss_token()). I guess we may want something
like

    if ( stack_base[cpu] == NULL )
    {
        stack_base[cpu] = alloc_xenheap_pages(STACK_ORDER, memflags);
        if ( stack_base[cpu] == NULL )
            goto out;
    }
    else if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
        memguard_unguard_stack(stack_base[cpu]);

in cpu_smpboot_alloc(). But of course the question is whether the
conditions here and there wouldn't better become cpu_has_xen_shstk, since
right now the breakage (afaict) needlessly extends to systems that aren't
CET-capable.

Jan

