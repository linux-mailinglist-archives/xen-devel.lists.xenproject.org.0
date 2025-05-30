Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84BAC8FBE
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000952.1381198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdp-0003tj-N4; Fri, 30 May 2025 13:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000952.1381198; Fri, 30 May 2025 13:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdp-0003sM-Iq; Fri, 30 May 2025 13:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1000952;
 Fri, 30 May 2025 13:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdo-0003ZU-28
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:20 +0000
Received: from 2.mo582.mail-out.ovh.net (2.mo582.mail-out.ovh.net
 [46.105.76.65]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acbbac5f-3d58-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:19:11 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.176.180])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4b83jW1B83z1YBR
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:11 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-sqt8x (unknown [10.108.42.198])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7555FC0286;
 Fri, 30 May 2025 13:19:10 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-sqt8x with ESMTPSA
 id +3vSCk6wOWjKxgAAsdTabg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:10 +0000
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
X-Inumbo-ID: acbbac5f-3d58-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-110S004aa21ae74-13c6-44dd-aa83-995d3ec55e96,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 14/22] x86/boot: choose AP stack based on APIC ID
Date: Fri, 30 May 2025 16:17:56 +0300
Message-ID: <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12704373077045261468
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepveelieehudellefgleegieevteegudfhhefffefghfeltdevhfelvdfgkeefhfeunecuffhomhgrihhnpehhvggrugdrshgspdhtrhgrmhhpohhlihhnvgdrshgspdigkeeipgeigedrshgsnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=ez/L2d75KfUHpHUpt0ebohb99nk9msXfBgDhtfciYEI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611151; v=1;
 b=fi1gQgNbRQp0Yg5FRfZNGxUVBwnr6X0Ko8aZAbamWXVf53GH80iAa1FSdeDs3hGeZZtA2Xqf
 AKTBKxOEnQ+BppxveurAbKecRBTlhfAwskWw5MKwiwx1lKfBmVVu7jL8dvKB0kBpxes1TlhwMHw
 BTN4lfsJO+/8z28AfZguSZX7FYNKKvzOWmzgojHVDsKCcP3e1IpgzckxYR2vE6lnb1Fjg++XMTh
 /XZHFlekMFJxskCLj2QlHAt63YEV56osLIQoWRXDBFsKI2hIF+SEhFtuN0Egyws0ylrBeP6D0IX
 VwGJb2KBdWChpiDnooCKYFV4vO1UeuXMZppTKlFFo4NFQ==

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
index 9a272155e9..7376fa85d5 100644
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
index 6f2c3147e3..73be38da17 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -172,6 +172,9 @@
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
 
+/* MSR offset can be obtained by shifting MMIO offset this number of bits to the right. */
+#define MSR_X2APIC_SHIFT                    4
+
 #define MSR_X2APIC_TPR                      0x00000808
 #define MSR_X2APIC_PPR                      0x0000080a
 #define MSR_X2APIC_EOI                      0x0000080b
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e4638acd12..87e4693a11 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2097,6 +2097,7 @@ void asmlinkage __init noreturn __start_xen(void)
      */
     if ( !pv_shim )
     {
+        /* Separate loop to make parallel AP bringup possible. */
         for_each_present_cpu ( i )
         {
             /* Set up cpu_to_node[]. */
@@ -2104,6 +2105,12 @@ void asmlinkage __init noreturn __start_xen(void)
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


