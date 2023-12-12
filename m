Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968E80E7FE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652836.1018869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzIc-0005ZP-Ri; Tue, 12 Dec 2023 09:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652836.1018869; Tue, 12 Dec 2023 09:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzIc-0005Wg-Oz; Tue, 12 Dec 2023 09:43:34 +0000
Received: by outflank-mailman (input) for mailman id 652836;
 Tue, 12 Dec 2023 09:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cChi=HX=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1rCzIb-0005Wa-7I
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:43:33 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e850f948-98d2-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 10:43:30 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1rCzIX-00CPJn-Bf
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:43:30 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id A4B368DA2F8
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 09:43:29 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id DrlNhiRrGMxE for <xen-devel@lists.xenproject.org>;
 Tue, 12 Dec 2023 09:43:29 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 707BB8DA2F5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 09:43:29 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 5F9C33A; Tue, 12 Dec 2023 09:43:29 +0000 (GMT)
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
X-Inumbo-ID: e850f948-98d2-11ee-98e8-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Tue, 12 Dec 2023 09:43:29 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: XSA-446 relevance on Intel
Message-ID: <ZXgrQdVvDuQCbCRP@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

We were experiencing a crash during PV domU boot on several different models
of hardware but all with Intel CPUs.  The Xen version was based on stable-4.15
at 4a4daf6bddbe8a741329df5cc8768f7dec664aed (XSA-444) with some local
patches.  Since updating the branch to b918c4cdc7ab2c1c9e9a9b54fa9d9c595913e028
(XSA-446) we have not observed the same crash.

The occurrence was on 1-2% of boots and we couldn't determine a particular
sequence of events that would trigger it.  The kernel is based on Ubuntu's
5.15.0-91 tag but we also observed the same with -85.  Due to the low
frequency it is possible that we simply haven't observed it again since
updating our Xen build.

If I have followed the early startup this is happening shortly after detection
of possible CPU vulnerabilities and patching in alternative instructions.  As
the RIP was native_irq_return_iret and XSA-446 related to interupt management
I wondered if it was possible that despite "Xen is not believed to be vulnerable
in default configurations on CPUs from other hardware vendors." there could
be some conditions in which an Intel CPU is affected?

Thanks,
James

[    0.374957] GDS: Unknown: Dependent on hypervisor status
[    0.375007] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.375016] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.375022] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.375027] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.375033] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.375038] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.375047] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.375053] x86/fpu: xstate_offset[5]: 1088, xstate_sizes[5]:   64
[    0.375059] x86/fpu: xstate_offset[6]: 1152, xstate_sizes[6]:  512
[    0.375053] x86/fpu: xstate_offset[5]: 1088, xstate_sizes[5]:   64
[    0.375059] x86/fpu: xstate_offset[6]: 1152, xstate_sizes[6]:  512
[    0.375064] x86/fpu: xstate_offset[7]: 1664, xstate_sizes[7]: 1024
[    0.375047] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.375053] x86/fpu: xstate_offset[5]: 1088, xstate_sizes[5]:   64
[    0.375059] x86/fpu: xstate_offset[6]: 1152, xstate_sizes[6]:  512
[    0.375064] x86/fpu: xstate_offset[7]: 1664, xstate_sizes[7]: 1024
[    0.375070] x86/fpu: Enabled xstate features 0xe7, context size is 2688 bytes, using 'standard' format.
[    0.398765] segment-related general protection fault: e030 [#1] SMP NOPTI
[    0.398784] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.0-91-generic #101~20.04.1
[    0.398792] RIP: e030:native_irq_return_iret+0x0/0x2
[    0.398806] Code: 5b 41 5b 41 5a 41 59 41 58 58 59 5a 5e 5f 48 83 c4 08 eb 0f 0f 1f 00 90 66 66 2e 0f 1f 84 00 00 00 00 00 f6 44 24 20 04 75 02 <48> cf 57 0f 01 f8 eb 12 0f 20 df 90 90 90 90 90 48 81 e7 ff e7 ff
[    0.398818] RSP: e02b:ffffffff82e03bd8 EFLAGS: 00010046
[    0.398825] RAX: 0000000000000000 RBX: ffffffff82e03c30 RCX: 0000000000000000
[    0.398831] RDX: 000000000000000f RSI: ffffffff81e011f4 RDI: ffffffff82e03ca0
[    0.398836] RBP: ffffffff82e03c10 R08: ffffffff81e011ef R09: 0000000000000005
[    0.398842] R10: 0000000000000006 R11: e8ae0feb75ccff49 R12: ffffffff81e011ef
[    0.398848] R13: 0000000000000006 R14: ffffffff81e011f4 R15: 0000000000000005
[    0.398860] FS:  0000000000000000(0000) GS:ffff88802dc00000(0000) knlGS:0000000000000000
[    0.398866] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.398872] CR2: 0000000000000000 CR3: 0000000002e10000 CR4: 0000000000050660
[    0.398880] Call Trace:
[    0.398883]  <TASK>
[    0.398887]  ? show_trace_log_lvl+0x1d6/0x2ea
[    0.398896]  ? show_trace_log_lvl+0x1d6/0x2ea
[    0.398902]  ? optimize_nops+0x68/0x150
[    0.398909]  ? show_regs.part.0+0x23/0x29
[    0.398914]  ? __die_body.cold+0x8/0xd
[    0.398919]  ? die_addr+0x3e/0x60
[    0.398925]  ? exc_general_protection+0x1c1/0x350
[    0.398933]  ? asm_exc_general_protection+0x27/0x30
[    0.398939]  ? restore_regs_and_return_to_kernel+0x20/0x2c
[    0.398945]  ? restore_regs_and_return_to_kernel+0x1b/0x2c
[    0.398950]  ? restore_regs_and_return_to_kernel+0x1b/0x2c
[    0.398956]  ? restore_regs_and_return_to_kernel+0x20/0x2c
[    0.398962]  ? native_iret+0x7/0x7
[    0.398967]  ? insn_decode+0x79/0x100
[    0.398975]  ? insn_decode+0xcf/0x100
[    0.398980]  optimize_nops+0x68/0x150
[    0.398986]  apply_alternatives+0x181/0x3a0
[    0.398991]  ? restore_regs_and_return_to_kernel+0x1b/0x2c
[    0.398996]  ? fb_is_primary_device+0x25/0x73
[    0.399003]  ? restore_regs_and_return_to_kernel+0x1b/0x2c
[    0.399009]  ? apply_alternatives+0x8/0x3a0
[    0.399014]  ? fb_is_primary_device+0x6e/0x73
[    0.399019]  ? apply_returns+0xfc/0x180
[    0.399024]  ? fb_is_primary_device+0x6e/0x73
[    0.399029]  ? sanitize_boot_params.constprop.0+0xa/0xef
[    0.399035]  ? fb_is_primary_device+0x73/0x73
[    0.399040]  alternative_instructions+0xa9/0x173
[    0.399049]  arch_cpu_finalize_init+0x2c/0x51
[    0.399055]  start_kernel+0x425/0x4ce
[    0.399060]  x86_64_start_reservations+0x24/0x2a
[    0.399066]  xen_start_kernel+0x41e/0x429
[    0.399072]  startup_xen+0x3e/0x3e
[    0.399078]  </TASK>
[    0.399081] Modules linked in:
[    0.399087] ---[ end trace 94f81cdaf420d02b ]---
[    0.399092] RIP: e030:native_irq_return_iret+0x0/0x2
[    0.399098] Code: 5b 41 5b 41 5a 41 59 41 58 58 59 5a 5e 5f 48 83 c4 08 eb 0f 0f 1f 00 90 66 66 2e 0f 1f 84 00 00 00 00 00 f6 44 24 20 04 75 02 <48> cf 57 0f 01 f8 eb 12 0f 20 df 90 90 90 90 90 48 81 e7 ff e7 ff
[    0.399110] RSP: e02b:ffffffff82e03bd8 EFLAGS: 00010046
[    0.399116] RAX: 0000000000000000 RBX: ffffffff82e03c30 RCX: 0000000000000000
[    0.399121] RDX: 000000000000000f RSI: ffffffff81e011f4 RDI: ffffffff82e03ca0
[    0.399127] RBP: ffffffff82e03c10 R08: ffffffff81e011ef R09: 0000000000000005
[    0.399132] R10: 0000000000000006 R11: e8ae0feb75ccff49 R12: ffffffff81e011ef
[    0.399138] R13: 0000000000000006 R14: ffffffff81e011f4 R15: 0000000000000005
[    0.399147] FS:  0000000000000000(0000) GS:ffff88802dc00000(0000) knlGS:0000000000000000
[    0.399154] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.399159] CR2: 0000000000000000 CR3: 0000000002e10000 CR4: 0000000000050660
[    0.399168] Kernel panic - not syncing: Attempted to kill the idle task!


