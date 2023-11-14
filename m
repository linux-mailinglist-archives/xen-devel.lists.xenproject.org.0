Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F37EB5F3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633081.987616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfN-0000kc-FT; Tue, 14 Nov 2023 17:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633081.987616; Tue, 14 Nov 2023 17:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfN-0000Yj-CV; Tue, 14 Nov 2023 17:57:37 +0000
Received: by outflank-mailman (input) for mailman id 633081;
 Tue, 14 Nov 2023 17:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYd-0004mK-H8
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:39 +0000
Received: from 8.mo550.mail-out.ovh.net (8.mo550.mail-out.ovh.net
 [178.33.110.239]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5233b874-8316-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 18:50:38 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.16.30])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 83145294F8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EFD131FDF1;
 Tue, 14 Nov 2023 17:50:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id CGqmN22zU2V/lwcATVRwWg
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
X-Inumbo-ID: 5233b874-8316-11ee-98db-6d05b1d4d9a1
Authentication-Results:garm.ovh; auth=pass (GARM-103G00598bb5702-cfe7-4f88-8cef-640e0a4e1820,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 02/10] x86/boot: choose AP stack based on APIC ID
Date: Tue, 14 Nov 2023 18:49:58 +0100
Message-ID: <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699981248.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981248.git.krystian.hebel@3mdeb.com>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12929271583775369584
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgfdtvdeigedtvedvudehgefgkeefffetfeekkedthfdvveeiteduteehtedvgfenucffohhmrghinhepthhrrghmphholhhinhgvrdhssgdpgiekiegpieegrdhssgenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

This is made as first step of making parallel AP bring-up possible. It
should be enough for pre-C code.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/boot/trampoline.S | 20 ++++++++++++++++++++
 xen/arch/x86/boot/x86_64.S     | 28 +++++++++++++++++++++++++++-
 xen/arch/x86/setup.c           |  7 +++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index b8ab0ffdcbb0..ec254125016d 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -72,6 +72,26 @@ trampoline_protmode_entry:
         mov     $X86_CR4_PAE,%ecx
         mov     %ecx,%cr4
 
+        /*
+         * Get APIC ID while we're in non-paged mode. Start by checking if
+         * x2APIC is enabled.
+         */
+        mov     $MSR_APIC_BASE, %ecx
+        rdmsr
+        and     $APIC_BASE_EXTD, %eax
+        jnz     .Lx2apic
+
+        /* Not x2APIC, read from MMIO */
+        mov     0xfee00020, %esp
+        shr     $24, %esp
+        jmp     1f
+
+.Lx2apic:
+        mov     $(MSR_X2APIC_FIRST + (0x20 >> 4)), %ecx
+        rdmsr
+        mov     %eax, %esp
+1:
+
         /* Load pagetable base register. */
         mov     $sym_offs(idle_pg_table),%eax
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 04bb62ae8680..b85b47b5c1a0 100644
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a3d3f797bb1e..1285969901e0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1951,6 +1951,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      */
     if ( !pv_shim )
     {
+        /* Separate loop to make parallel AP bringup possible. */
         for_each_present_cpu ( i )
         {
             /* Set up cpu_to_node[]. */
@@ -1958,6 +1959,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
2.41.0


