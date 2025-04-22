Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA51A97010
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962867.1354021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FH7-0007hz-L5; Tue, 22 Apr 2025 15:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962867.1354021; Tue, 22 Apr 2025 15:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FH7-0007fd-I3; Tue, 22 Apr 2025 15:11:05 +0000
Received: by outflank-mailman (input) for mailman id 962867;
 Tue, 22 Apr 2025 15:11:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FE3-0008SP-6W
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:55 +0000
Received: from 4.mo561.mail-out.ovh.net (4.mo561.mail-out.ovh.net
 [178.33.46.10]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca362ab-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:47 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.139.191])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZhlwL2sR1z1bj9
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:46 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-65nmq (unknown [10.108.54.81])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AF9DD1FEA4;
 Tue, 22 Apr 2025 15:07:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
 by ghost-submission-5b5ff79f4f-65nmq with ESMTPSA
 id E/pvGcGwB2hj+gQA5l9ADw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:45 +0000
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
X-Inumbo-ID: 8ca362ab-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-96R00148cda405-a492-42a4-ad09-544000b1966e,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 15/21] x86/boot: choose AP stack based on APIC ID
Date: Tue, 22 Apr 2025 18:06:49 +0300
Message-ID: <219f2eedb59963f92f23c87d691966aa60393826.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12736742698577409180
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevleeiheduleelgfelgeeiveetgeduhfehffefgffhledtvefhledvgfekfefhueenucffohhmrghinhephhgvrggurdhssgdpthhrrghmphholhhinhgvrdhssgdpgiekiegpieegrdhssgenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=b6AA3YS5vl2hqWUdhcK5y1DSeFNonfqn1RmJZfPaJQA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334466; v=1;
 b=HF3TOUQoJvieFLEyz7S6DHqoNM01PldhnbsL1PkLXl1eEi+EFPoEM4gshbbbsDc841rQbOnz
 8fPEq/+JdWEU4ysPFb+ReFPRPNh3PD9tS7DaNywp0xnbqIjcp+16mzYiEhqJZZmfSW8k1QLUTXh
 NP88fun2ETpQBJHuphgF/T70Dzkpetknup0OQAeAg/7FsGm2rWSjcw0vdHuS7NwLP3wPyC3CRy8
 /V0iEbafqAraNPK1sXUKPaonOno41YKDfnf2qhUhLOMTmoSDBe2H3qJujEHallbiZ7YP9/czXZs
 imWYklotkgnmsxxssLoAW0zlhhw85r2OMWWCVOwijuF/g==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

This is made as the first step of making parallel AP bring-up possible.
It should be enough for pre-C code.

Parallel AP bring-up is necessary because TXT by design releases all APs
at once. In addition to that it reduces number of IPIs (and more
importantly, delays between them) required to start all logical
processors. This results in significant reduction of boot time, even
when DRTM is not used, with performance gain growing with the number of
logical CPUs.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/boot/head.S             |  1 +
 xen/arch/x86/boot/trampoline.S       | 21 +++++++++++++++++++++
 xen/arch/x86/boot/x86_64.S           | 28 +++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/apicdef.h   |  4 ++++
 xen/arch/x86/include/asm/msr-index.h |  3 +++
 xen/arch/x86/setup.c                 |  7 +++++++
 6 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 0b7903070a..419bf58d5c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -8,6 +8,7 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/msr-index.h>
+#include <asm/apicdef.h>
 #include <asm/cpufeature.h>
 #include <asm/trampoline.h>
 
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index a92e399fbe..ed593acc46 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -71,6 +71,27 @@ trampoline_protmode_entry:
         mov     $X86_CR4_PAE,%ecx
         mov     %ecx,%cr4
 
+        /*
+         * Get APIC ID while we're in non-paged mode. Start by checking if
+         * x2APIC is enabled.
+         */
+        mov     $MSR_APIC_BASE, %ecx
+        rdmsr
+        test    $APIC_BASE_EXTD, %eax
+        jnz     .Lx2apic
+
+        /* Not x2APIC, read from MMIO */
+        and     $APIC_BASE_ADDR_MASK, %eax
+        mov     APIC_ID(%eax), %esp
+        shr     $24, %esp
+        jmp     1f
+
+.Lx2apic:
+        mov     $(MSR_X2APIC_FIRST + (APIC_ID >> MSR_X2APIC_SHIFT)), %ecx
+        rdmsr
+        mov     %eax, %esp
+1:
+
         /* Load pagetable base register. */
         mov     $sym_offs(idle_pg_table),%eax
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 08ae97e261..ac33576d8f 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -15,7 +15,33 @@ ENTRY(__high_start)
         mov     $XEN_MINIMAL_CR4,%rcx
         mov     %rcx,%cr4
 
-        mov     stack_start(%rip),%rsp
+        test    %ebx,%ebx
+        cmovz   stack_start(%rip), %rsp
+        jz      .L_stack_set
+
+        /* APs only: get stack base from APIC ID saved in %esp. */
+        mov     $-1, %rax
+        lea     x86_cpu_to_apicid(%rip), %rcx
+1:
+        add     $1, %rax
+        cmp     $NR_CPUS, %eax
+        jb      2f
+        hlt
+2:
+        cmp     %esp, (%rcx, %rax, 4)
+        jne     1b
+
+        /* %eax is now Xen CPU index. */
+        lea     stack_base(%rip), %rcx
+        mov     (%rcx, %rax, 8), %rsp
+
+        test    %rsp,%rsp
+        jnz     1f
+        hlt
+1:
+        add     $(STACK_SIZE - CPUINFO_sizeof), %rsp
+
+.L_stack_set:
 
         /* Reset EFLAGS (subsumes CLI and CLD). */
         pushq   $0
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index 63dab01dde..e093a2aa3c 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -121,6 +121,10 @@
 
 #define MAX_IO_APICS 128
 
+#ifndef __ASSEMBLY__
+
 extern bool x2apic_enabled;
 
+#endif /* !__ASSEMBLY__ */
+
 #endif
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 22d9e76e55..794cf44abe 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -169,6 +169,9 @@
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
 
+/* MSR offset can be obtained by shifting MMIO offset this number of bits to the right. */
+#define MSR_X2APIC_SHIFT                    4
+
 #define MSR_X2APIC_TPR                      0x00000808
 #define MSR_X2APIC_PPR                      0x0000080a
 #define MSR_X2APIC_EOI                      0x0000080b
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 403d976449..c6ebdc3c6b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2068,6 +2068,7 @@ void asmlinkage __init noreturn __start_xen(void)
      */
     if ( !pv_shim )
     {
+        /* Separate loop to make parallel AP bringup possible. */
         for_each_present_cpu ( i )
         {
             /* Set up cpu_to_node[]. */
@@ -2075,6 +2076,12 @@ void asmlinkage __init noreturn __start_xen(void)
             /* Set up node_to_cpumask based on cpu_to_node[]. */
             numa_add_cpu(i);
 
+            if ( stack_base[i] == NULL )
+                stack_base[i] = cpu_alloc_stack(i);
+        }
+
+        for_each_present_cpu ( i )
+        {
             if ( (park_offline_cpus || num_online_cpus() < max_cpus) &&
                  !cpu_online(i) )
             {
-- 
2.49.0


