Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6E78C655
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592241.924929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0d-0005IH-Ma; Tue, 29 Aug 2023 13:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592241.924929; Tue, 29 Aug 2023 13:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0d-0005Fj-Im; Tue, 29 Aug 2023 13:43:55 +0000
Received: by outflank-mailman (input) for mailman id 592241;
 Tue, 29 Aug 2023 13:43:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qaz0c-0004TH-MQ
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:43:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 171a4fa8-4672-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 15:43:52 +0200 (CEST)
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
X-Inumbo-ID: 171a4fa8-4672-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693316632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lwt51s6Ito3ySluQVz8h02ZUlFLP6IalOealcDGSsog=;
  b=OUWfNOqTaeejN/AEar2TTdphL3cq6hU2JiK5LtNQN997SGDdp/P4ud1z
   vj6J0kaNaSAJmRsPIwRYyqbm0DYN5RQoJc9I0ymcAxBdQiu6lvmf0wlwh
   MyjLvph6v8SnDnh+2Z3YBD8ZD3hp9ktBF6jVpzJevrdY6A+hu83P8iFug
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120249946
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TmFK9q/HIB89JsY3LC3qDrUDqH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2UfWGCObKrZZTHzc49zO4m+8hxQsZWBzd41QQFp/y08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNaoa5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklf/
 6Q9DA1KXyqxxOGJkIypevJIpdY8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxB7C+
 jOXozqR7hcyNtKkyzTZ33SQ3/LxkTnRZZlNBuO1z6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9hRFeo6rgKEzKWS4ByxCW0NTzoHY9sj3OcUbzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsFFVfpYO5+cdq00yJF4w4eEKosjHrMSD6m
 xWukW8PvYdQjvFb6beL5nTkkS358/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZnzv5643CvgbUmD9nXL3xCk4DadcI9Z+1mSz285Y59fKVcFj
 KI+0D69BaO/3lPwPcebgKrrUazGKJQM8vy8DZjpgiJmOMQZSeN+1HgGibSs927silMwtqo0J
 I2Wd82hZV5DV/U8lmbpGL5CiuNzrszb+Y80bcqnpylLLJLEPCLFIVv7GAbmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZKRW3m2UMTXMisw+QOL77rH+aTMD15YxMn6e97KtMNcmU8vrugw
 0xRrWcDkwSj2yCWcVjUAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:wkQUVKNtX5FxbMBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: =?us-ascii?q?9a23=3AwOuoFmuwl+Ghlkb/iHY7EEgm6Is0eCX46EqXEnW?=
 =?us-ascii?q?KSmVWGIOHeUS027F7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEBQ90A1MSAeJggMzs2kogUsEhTUj4aqVCk5RvJM?=
 =?us-ascii?q?64tS6OTZaBizCnmq6e9py?=
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="120249946"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 3/3] x86: Fix calculation of %dr6/dr7 reserved bits
Date: Tue, 29 Aug 2023 14:43:33 +0100
Message-ID: <20230829134333.3551243-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

RTM debugging and BusLock Detect have both introduced conditional behaviour
into the %dr6/7 calculations which Xen's existing logic doesn't account for.

Introduce the CPUID bit for BusLock Detect, so we can get the %dr6 behaviour
correct from the outset.

Implement x86_adj_dr{6,7}_rsvd() fully, and use them in place of the plain
bitmasks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

Note for reviewers: The dr7 calculation lacking BLD is correct.  BLD is is
activated by MSR_DBG_CTRL.BLD.  RTM is activated by %dr7.RTM && DBG_CTRL.RTM,
for reasons best answered by the designers...
---
 xen/arch/x86/debug.c                        | 27 +++++++++++++++++++++
 xen/arch/x86/domain.c                       |  5 ++--
 xen/arch/x86/hvm/hvm.c                      |  6 +++--
 xen/arch/x86/include/asm/debugreg.h         |  4 +--
 xen/arch/x86/include/asm/x86-defns.h        | 21 ++++++++++++++--
 xen/arch/x86/pv/misc-hypercalls.c           | 16 +++---------
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 7 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index 9900b555d6d3..127fe83021cd 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -10,10 +10,37 @@
 
 unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6)
 {
+    unsigned int ones = X86_DR6_DEFAULT;
+
+    /*
+     * The i586 and later processors had most but not all reserved bits read
+     * as 1s.  New features allocated in this space have inverted polarity,
+     * and don't force their respective bit to 1.
+     */
+    if ( p->feat.rtm )
+        ones &= ~X86_DR6_RTM;
+    if ( p->feat.bld )
+        ones &= ~X86_DR6_BLD;
+
+    dr6 |= ones;
+    dr6 &= ~X86_DR6_ZEROS;
+
     return dr6;
 }
 
 unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7)
 {
+    unsigned int zeros = X86_DR7_ZEROS;
+
+    /*
+     * Most but not all reserved bits force to zero.  Hardware lacking
+     * optional features force more bits to zero.
+     */
+    if ( !p->feat.rtm )
+        zeros |= X86_DR7_RTM;
+
+    dr7 &= ~zeros;
+    dr7 |= X86_DR7_DEFAULT;
+
     return dr7;
 }
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 0698e6d486fe..2d77b83c0bf8 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1053,6 +1053,7 @@ int arch_set_info_guest(
     struct vcpu *v, vcpu_guest_context_u c)
 {
     struct domain *d = v->domain;
+    const struct cpu_policy *p = d->arch.cpu_policy;
     unsigned int i;
     unsigned long flags;
     bool compat;
@@ -1186,8 +1187,8 @@ int arch_set_info_guest(
     {
         for ( i = 0; i < ARRAY_SIZE(v->arch.dr); ++i )
             v->arch.dr[i] = c(debugreg[i]);
-        v->arch.dr6 = c(debugreg[6]);
-        v->arch.dr7 = c(debugreg[7]);
+        v->arch.dr6 = x86_adj_dr6_rsvd(p, c(debugreg[6]));
+        v->arch.dr7 = x86_adj_dr7_rsvd(p, c(debugreg[7]));
 
         if ( v->vcpu_id == 0 )
             d->vm_assist = c.nat->vm_assist;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3dc2019eca67..482eebbabf7f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -33,6 +33,7 @@
 #include <asm/shadow.h>
 #include <asm/hap.h>
 #include <asm/current.h>
+#include <asm/debugreg.h>
 #include <asm/e820.h>
 #include <asm/io.h>
 #include <asm/regs.h>
@@ -985,6 +986,7 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
 
 static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 {
+    const struct cpu_policy *p = d->arch.cpu_policy;
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
     struct hvm_hw_cpu ctxt;
@@ -1174,8 +1176,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     v->arch.dr[1] = ctxt.dr1;
     v->arch.dr[2] = ctxt.dr2;
     v->arch.dr[3] = ctxt.dr3;
-    v->arch.dr6   = ctxt.dr6;
-    v->arch.dr7   = ctxt.dr7;
+    v->arch.dr6   = x86_adj_dr6_rsvd(p, ctxt.dr6);
+    v->arch.dr7   = x86_adj_dr7_rsvd(p, ctxt.dr7);
 
     hvmemul_cancel(v);
 
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 673b81ec5eda..bdeedc4c4c99 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -1,6 +1,7 @@
 #ifndef _X86_DEBUGREG_H
 #define _X86_DEBUGREG_H
 
+#include <asm/x86-defns.h>
 
 /* Indicate the register numbers for a number of the specific
    debug registers.  Registers 0-3 contain the addresses we wish to trap on */
@@ -21,7 +22,6 @@
 #define DR_STEP         (0x4000)        /* single-step */
 #define DR_SWITCH       (0x8000)        /* task switch */
 #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
-#define DR_STATUS_RESERVED_ZERO (~0xffffefffUL) /* Reserved, read as zero */
 #define DR_STATUS_RESERVED_ONE  0xffff0ff0UL /* Reserved, read as one */
 
 /* Now define a bunch of things for manipulating the control register.
@@ -61,8 +61,6 @@
    We can slow the instruction pipeline for instructions coming via the
    gdt or the ldt if we want to.  I am not sure why this is an advantage */
 
-#define DR_CONTROL_RESERVED_ZERO (~0xffff27ffUL) /* Reserved, read as zero */
-#define DR_CONTROL_RESERVED_ONE  (0x00000400UL) /* Reserved, read as one */
 #define DR_LOCAL_EXACT_ENABLE    (0x00000100UL) /* Local exact enable */
 #define DR_GLOBAL_EXACT_ENABLE   (0x00000200UL) /* Global exact enable */
 #define DR_RTM_ENABLE            (0x00000800UL) /* RTM debugging enable */
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index e350227e57eb..74fb0322cb84 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -102,13 +102,30 @@
 
 /*
  * Debug status flags in DR6.
+ *
+ * For backwards compatibility, status flags which overlap with
+ * X86_DR6_DEFAULT have inverted polarity.
  */
-#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
+#define X86_DR6_B0              (_AC(1, UL) <<  0)   /* Breakpoint 0                */
+#define X86_DR6_B1              (_AC(1, UL) <<  1)   /* Breakpoint 1                */
+#define X86_DR6_B2              (_AC(1, UL) <<  2)   /* Breakpoint 2                */
+#define X86_DR6_B3              (_AC(1, UL) <<  3)   /* Breakpoint 3                */
+#define X86_DR6_BLD             (_AC(1, UL) << 11)   /* BusLock detect (INV)        */
+#define X86_DR6_BD              (_AC(1, UL) << 13)   /* %dr access                  */
+#define X86_DR6_BS              (_AC(1, UL) << 14)   /* Single step                 */
+#define X86_DR6_BT              (_AC(1, UL) << 15)   /* Task switch                 */
+#define X86_DR6_RTM             (_AC(1, UL) << 16)   /* #DB/#BP in RTM region (INV) */
+
+#define X86_DR6_ZEROS           _AC(0x00010000, UL)  /* %dr6 bits forced to 0       */
+#define X86_DR6_DEFAULT         _AC(0xffff0ff0, UL)  /* Default %dr6 value          */
 
 /*
  * Debug control flags in DR7.
  */
-#define X86_DR7_DEFAULT         0x00000400  /* Default %dr7 value. */
+#define X86_DR7_RTM             (_AC(1, UL) << 11)   /* RTM debugging enable        */
+
+#define X86_DR7_ZEROS           _AC(0x0000d000, UL)  /* %dr7 bits forced to 0       */
+#define X86_DR7_DEFAULT         _AC(0x00000400, UL)  /* Default %dr7 value          */
 
 /*
  * Invalidation types for the INVPCID instruction.
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index b11bd718b7de..99f502812868 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -56,6 +56,7 @@ long do_fpu_taskswitch(int set)
 long set_debugreg(struct vcpu *v, unsigned int reg, unsigned long value)
 {
     struct vcpu *curr = current;
+    const struct cpu_policy *p = curr->domain->arch.cpu_policy;
 
     switch ( reg )
     {
@@ -86,12 +87,7 @@ long set_debugreg(struct vcpu *v, unsigned int reg, unsigned long value)
         if ( value != (uint32_t)value )
             return -EINVAL;
 
-        /*
-         * DR6: Bits 4-11,16-31 reserved (set to 1).
-         *      Bit 12 reserved (set to 0).
-         */
-        value &= ~DR_STATUS_RESERVED_ZERO; /* reserved bits => 0 */
-        value |=  DR_STATUS_RESERVED_ONE;  /* reserved bits => 1 */
+        value = x86_adj_dr6_rsvd(p, value);
 
         v->arch.dr6 = value;
         if ( v == curr )
@@ -108,12 +104,8 @@ long set_debugreg(struct vcpu *v, unsigned int reg, unsigned long value)
         if ( value != (uint32_t)value )
             return -EINVAL;
 
-        /*
-         * DR7: Bit 10 reserved (set to 1).
-         *      Bits 11-12,14-15 reserved (set to 0).
-         */
-        value &= ~DR_CONTROL_RESERVED_ZERO; /* reserved bits => 0 */
-        value |=  DR_CONTROL_RESERVED_ONE;  /* reserved bits => 1 */
+        value = x86_adj_dr7_rsvd(p, value);
+
         /*
          * Privileged bits:
          *      GD (bit 13): must be 0.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 50fda581f2df..6b6ce2745cfe 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -223,6 +223,7 @@ XEN_CPUFEATURE(AVX512_VNNI,   6*32+11) /*A  Vector Neural Network Instrs */
 XEN_CPUFEATURE(AVX512_BITALG, 6*32+12) /*A  Support for VPOPCNT[B,W] and VPSHUFBITQMB */
 XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14) /*A  POPCNT for vectors of DW/QW */
 XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
+XEN_CPUFEATURE(BLD,           6*32+24) /*   BusLock Detect (#DB trap) support */
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
-- 
2.30.2


