Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98567EB5F4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633087.987639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfO-00014x-Qg; Tue, 14 Nov 2023 17:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633087.987639; Tue, 14 Nov 2023 17:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfO-0000zw-Be; Tue, 14 Nov 2023 17:57:38 +0000
Received: by outflank-mailman (input) for mailman id 633087;
 Tue, 14 Nov 2023 17:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYe-0004wk-SX
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:40 +0000
Received: from 12.mo583.mail-out.ovh.net (12.mo583.mail-out.ovh.net
 [46.105.39.65]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51dedb92-8316-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 18:50:38 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.4.72])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id E7C18293F1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 72C7E1FD24;
 Tue, 14 Nov 2023 17:50:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id aBEEGW2zU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:37 +0000
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
X-Inumbo-ID: 51dedb92-8316-11ee-9b0e-b553b5be7939
Authentication-Results:garm.ovh; auth=pass (GARM-103G0055adfc20a-9646-4e70-96a1-0204e862fa82,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 01/10] x86/spec-ctrl: Remove conditional IRQs-on-ness for INT $0x80/0x82 paths
Date: Tue, 14 Nov 2023 18:49:57 +0100
Message-ID: <a48bb129f1b9ff55c22cf6d2b589247c8ba3b10e.1699981248.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981248.git.krystian.hebel@3mdeb.com>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12928990108487231856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmrhihshhtihgrnhcujfgvsggvlhcuoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepuddtieefheevleefuefgheffkeeivdeggffgleehjeelkeevuefgieevfeejvdeknecuffhomhgrihhnpegvnhhtrhihrdhssgenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht

From: Andrew Cooper <andrew.cooper3@citrix.com>

Before speculation defences, some paths in Xen could genuinely get away with
being IRQs-on at entry.  But XPTI invalidated this property on most paths, and
attempting to maintain it on the remaining paths was a mistake.

Fast forward, and DO_SPEC_CTRL_COND_IBPB (protection for AMD BTC/SRSO) is not
IRQ-safe, running with IRQs enabled in some cases.  The other actions taken on
these paths happen to be IRQ-safe.

Make entry_int82() and int80_direct_trap() unconditionally Interrupt Gates
rather than Trap Gates.  Remove the conditional re-adjustment of
int80_direct_trap() in smp_prepare_cpus(), and have entry_int82() explicitly
enable interrupts when safe to do so.

In smp_prepare_cpus(), with the conditional re-adjustment removed, the
clearing of pv_cr3 is the only remaining action gated on XPTI, and it is out
of place anyway, repeating work already done by smp_prepare_boot_cpu().  Drop
the entire if() condition to avoid leaving an incorrect vestigial remnant.

Also drop comments which make incorrect statements about when its safe to
enable interrupts.

This is XSA-446 / CVE-2023-46836

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/traps.c            |  4 ++--
 xen/arch/x86/smpboot.c             | 14 --------------
 xen/arch/x86/x86_64/compat/entry.S |  2 ++
 xen/arch/x86/x86_64/entry.S        |  1 -
 4 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 74f333da7e1c..240d1a2db7a3 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -139,11 +139,11 @@ void __init pv_trap_init(void)
 #ifdef CONFIG_PV32
     /* The 32-on-64 hypercall vector is only accessible from ring 1. */
     _set_gate(idt_table + HYPERCALL_VECTOR,
-              SYS_DESC_trap_gate, 1, entry_int82);
+              SYS_DESC_irq_gate, 1, entry_int82);
 #endif
 
     /* Fast trap for int80 (faster than taking the #GP-fixup path). */
-    _set_gate(idt_table + LEGACY_SYSCALL_VECTOR, SYS_DESC_trap_gate, 3,
+    _set_gate(idt_table + LEGACY_SYSCALL_VECTOR, SYS_DESC_irq_gate, 3,
               &int80_direct_trap);
 
     open_softirq(NMI_SOFTIRQ, nmi_softirq);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 3a1a659082c6..4c54ecbc91d7 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1158,20 +1158,6 @@ void __init smp_prepare_cpus(void)
 
     stack_base[0] = (void *)((unsigned long)stack_start & ~(STACK_SIZE - 1));
 
-    if ( opt_xpti_hwdom || opt_xpti_domu )
-    {
-        get_cpu_info()->pv_cr3 = 0;
-
-#ifdef CONFIG_PV
-        /*
-         * All entry points which may need to switch page tables have to start
-         * with interrupts off. Re-write what pv_trap_init() has put there.
-         */
-        _set_gate(idt_table + LEGACY_SYSCALL_VECTOR, SYS_DESC_irq_gate, 3,
-                  &int80_direct_trap);
-#endif
-    }
-
     set_nr_sockets();
 
     socket_cpumask = xzalloc_array(cpumask_t *, nr_sockets);
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index bd5abd8040bd..fcc3a721f147 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -21,6 +21,8 @@ ENTRY(entry_int82)
         SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
+        sti
+
         CR4_PV32_RESTORE
 
         GET_CURRENT(bx)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 5ca74f5f62b2..9a7b129aa7e4 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -327,7 +327,6 @@ ENTRY(sysenter_entry)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
-        /* sti could live here when we don't switch page tables below. */
         pushq $FLAT_USER_SS
         pushq $0
         pushfq
-- 
2.41.0


