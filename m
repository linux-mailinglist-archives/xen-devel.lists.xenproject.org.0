Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F178740B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590147.922258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDR-0003aB-Rk; Thu, 24 Aug 2023 15:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590147.922258; Thu, 24 Aug 2023 15:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCDR-0003YS-Nu; Thu, 24 Aug 2023 15:25:45 +0000
Received: by outflank-mailman (input) for mailman id 590147;
 Thu, 24 Aug 2023 15:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCDQ-0003YG-3v
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:25:44 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bb09f00-4292-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 17:25:41 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso229585ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:25:41 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 l20-20020a170903005400b001bdcafcf8d3sm12996060pla.69.2023.08.24.08.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:25:39 -0700 (PDT)
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
X-Inumbo-ID: 7bb09f00-4292-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890740; x=1693495540;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GpSUBE0BxjgNJ5EWh0hcmxXI/ck27aV5AJKjaXhveA=;
        b=kxew4z/7A86XHg/cqPrScvBClrUY5tybsKdy4CrmuZYvBw7i6YoHQ2UGYq6pXmXY6P
         wahc9162QYL/x4sQHCZvkiFJJDrtJDZT/qC1R/kZuaGwmOq+Fmsk3SxxPx+ZIa56kEWF
         GQsgF+vELpxY/CtDMsPNKVE6zNZR1AzSkbGcJK7qVzNwy/03kiIJB02G/OINAg9ixDAv
         cMiIG+0tPR43rQxWTT+0EUFM8NcDUCnh3/6V5aHt7gF0/q1KRFU+qdnIatH7xLqQCt2P
         mz6xHzwdgWkDttFprk4ouaFwX32Iw8JULbQtSDPinKBKaZSHkPTUJytm3yMlEe/g16hS
         Vlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890740; x=1693495540;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GpSUBE0BxjgNJ5EWh0hcmxXI/ck27aV5AJKjaXhveA=;
        b=HSWgLMfX+gpaJArEfE5KEbz4iGZ4v5WzTs7bdGIyx7wWWbzuiETaBZ+t+TityVRHPT
         05v3M+ptqx9+lRZDyYzau24/0aBzOR2sVnnDGuUpKsZ9oTgJE9xbmELmk4z3rJUKj/72
         OfnjChHUziN7Psp4z9miMazFvuCSX9ag9lijJf5bhZxKmV/bNFlWBVyhZilenD8qwSI7
         oWKFdbM8K7RtRiap8PwP5XN5fNb2Ojf/LiOnlak5Yv0sHU3La5GG42LGsfsmZcrXYCjd
         X9/gRWCzJ4MqCT7+68+wvvDVdiUldyJVn0YeMm2EyDDEcJyEKD92x4nv+GmCVNjaNryp
         HHmQ==
X-Gm-Message-State: AOJu0YxbhuL2LinzX4QKlShT2SiyjOGjEmBX3pS36JpPMVRyyrLBY6Pa
	7m/7BOlss/B70tW93JQoV4k=
X-Google-Smtp-Source: AGHT+IGTQFvZ7m3kT6Scb7mVL7k/s/JxNEce7jhacvM5mmpTpwL4UyXImzu5lH77LRGJ7spMde8HFw==
X-Received: by 2002:a17:902:d38c:b0:1b5:1787:d23f with SMTP id e12-20020a170902d38c00b001b51787d23fmr13079057pld.5.1692890740315;
        Thu, 24 Aug 2023 08:25:40 -0700 (PDT)
Message-ID: <8e594d08-9489-5446-525a-526a1f79dc07@gmail.com>
Date: Fri, 25 Aug 2023 00:25:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 1/8] x86: Fix calculation of %dr6/7 reserved bits
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

The reserved bit calculations for %dr6 and %dr7 depend on whether the VM has
the Restricted Transactional Memory feature available.

Introduce adjust_dr{6,7}_rsvd() and replace the opencoded logic and constants
(except for DR_STATUS_RESERVED_ONE which is (mis)used elsewhere and will be
removed after future bugfixes).  The use of these helpers in set_debugreg()
covers toolstack values for PV guests, but HVM guests need similar treatment.

The use of the guest's cpu_policy is less than optimal in the create/restore
paths.  However in such cases, the policy will be the guest maximum policy,
which will be more permissive with respect to the RTM feature.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
[ jinoh: Rebase onto staging, along with some fixes ]
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v1 -> v2: [S-o-b fixes. More details below.]

- Fix must-be-zero constant in adjust_dr7_rsvd: 0xffff23ff -> 0xffff2fff
  - Bit 10 was not set, causing DR7 reserved-1 bit 10 to be unset
  - Bit 11 was not set, causing DR7 RTM-enable bit 11 to be ignored

- Define X86_DR{6,7}_* constants in x86-defns.h instead of open-coding
  naked numbers (thanks Jan)

- [Commit body]: s/Transnational/Transactional/g (thanks Jan)

- [Commit body]: s/guests cpuid policy/guest's cpu_policy/g (by rebase)
---
 xen/arch/x86/domain.c                |  7 +++--
 xen/arch/x86/hvm/hvm.c               |  6 ++--
 xen/arch/x86/include/asm/debugreg.h  | 20 ++++++++++++--
 xen/arch/x86/include/asm/x86-defns.h | 41 ++++++++++++++++++++++++++++
 xen/arch/x86/pv/misc-hypercalls.c    | 16 +++--------
 5 files changed, 70 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fe86a7f853..a39710b5af 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1053,6 +1053,7 @@ int arch_set_info_guest(
     struct vcpu *v, vcpu_guest_context_u c)
 {
     struct domain *d = v->domain;
+    const struct cpu_policy *cp = d->arch.cpuid;
     unsigned int i;
     unsigned long flags;
     bool compat;
@@ -1165,10 +1166,10 @@ int arch_set_info_guest(
 
     if ( is_hvm_domain(d) )
     {
-        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); ++i )
+        for ( i = 0; i < ARRAY_SIZE(v->arch.dr) - 2; ++i )
             v->arch.dr[i] = c(debugreg[i]);
-        v->arch.dr6 = c(debugreg[6]);
-        v->arch.dr7 = c(debugreg[7]);
+        v->arch.dr6 = adjust_dr6_rsvd(c(debugreg[6]), cp->feat.rtm);
+        v->arch.dr7 = adjust_dr7_rsvd(c(debugreg[7]), cp->feat.rtm);
 
         if ( v->vcpu_id == 0 )
             d->vm_assist = c.nat->vm_assist;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3a99c0ff20..66ead0b878 100644
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
+    const struct cpu_policy *cp = d->arch.cpuid;
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
     struct hvm_hw_cpu ctxt;
@@ -1166,8 +1168,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     v->arch.dr[1] = ctxt.dr1;
     v->arch.dr[2] = ctxt.dr2;
     v->arch.dr[3] = ctxt.dr3;
-    v->arch.dr6   = ctxt.dr6;
-    v->arch.dr7   = ctxt.dr7;
+    v->arch.dr6   = adjust_dr6_rsvd(ctxt.dr6, cp->feat.rtm);
+    v->arch.dr7   = adjust_dr7_rsvd(ctxt.dr7, cp->feat.rtm);
 
     hvmemul_cancel(v);
 
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 86aa6d7143..74344555d2 100644
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
@@ -80,4 +78,20 @@
 long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
 void activate_debugregs(const struct vcpu *);
 
+static inline unsigned long adjust_dr6_rsvd(unsigned long dr6, bool rtm)
+{
+    dr6 |= X86_DR6_MBS_BASE | (rtm ? 0 : X86_DR6_MBS_NO_RTM);
+    dr6 &= ~X86_DR6_MBZ;
+
+    return dr6;
+}
+
+static inline unsigned long adjust_dr7_rsvd(unsigned long dr7, bool rtm)
+{
+    dr7 |= X86_DR7_MBS;
+    dr7 &= ~(X86_DR7_MBZ_BASE | (rtm ? 0 : X86_DR7_MBZ_NO_RTM));
+
+    return dr7;
+}
+
 #endif /* _X86_DEBUGREG_H */
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index e350227e57..b13ca680c2 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -102,12 +102,53 @@
 
 /*
  * Debug status flags in DR6.
+ *   N.B. For backwards compatibility, X86_DR6_RTM has inverted polarity.
  */
+#define X86_DR6_B0              (1UL <<  0)     /* Breakpoint 0 triggered  */
+#define X86_DR6_B1              (1UL <<  1)     /* Breakpoint 1 triggered  */
+#define X86_DR6_B2              (1UL <<  2)     /* Breakpoint 2 triggered  */
+#define X86_DR6_B3              (1UL <<  3)     /* Breakpoint 3 triggered  */
+#define X86_DR6_BD              (1UL << 13)     /* Debug register accessed */
+#define X86_DR6_BS              (1UL << 14)     /* Single step             */
+#define X86_DR6_BT              (1UL << 15)     /* Task switch             */
+#define X86_DR6_RTM             (1UL << 16)     /* #DB/#BP in RTM region   */
+
+#define X86_DR6_MBZ             (~0xffffefffUL) /* Reserved, read as zero  */
+
+#define X86_DR6_MBS_BASE        (0xfffe0ff0UL)  /* Reserved, read as one   */
+#define X86_DR6_MBS_NO_RTM      (X86_DR6_RTM)   /* - if RTM unavailable    */
+
 #define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
 
 /*
  * Debug control flags in DR7.
  */
+#define X86_DR7_L0              (1UL <<  0)      /* Local BP 0 enable      */
+#define X86_DR7_G0              (1UL <<  1)      /* Global BP 0 enable     */
+#define X86_DR7_L1              (1UL <<  2)      /* Local BP 1 enable      */
+#define X86_DR7_G1              (1UL <<  3)      /* Global BP 1 enable     */
+#define X86_DR7_L2              (1UL <<  4)      /* Local BP 2 enable      */
+#define X86_DR7_G2              (1UL <<  5)      /* Global BP 2 enable     */
+#define X86_DR7_L3              (1UL <<  6)      /* Local BP 3 enable      */
+#define X86_DR7_G3              (1UL <<  7)      /* Global BP 3 enable     */
+#define X86_DR7_LE              (1UL <<  8)      /* Local exact BP enable  */
+#define X86_DR7_GE              (1UL <<  9)      /* Global exact BP enable */
+#define X86_DR7_RTM             (1UL << 11)      /* RTM debugging enable   */
+#define X86_DR7_GD              (1UL << 13)      /* General detect enable  */
+#define X86_DR7_RW0_MASK        (3UL << 16)      /* BP 0 trap condition    */
+#define X86_DR7_LEN0_MASK       (3UL << 18)      /* BP 0 access length     */
+#define X86_DR7_RW1_MASK        (3UL << 20)      /* BP 1 trap condition    */
+#define X86_DR7_LEN1_MASK       (3UL << 22)      /* BP 1 access length     */
+#define X86_DR7_RW2_MASK        (3UL << 24)      /* BP 2 trap condition    */
+#define X86_DR7_LEN2_MASK       (3UL << 26)      /* BP 2 access length     */
+#define X86_DR7_RW3_MASK        (3UL << 28)      /* BP 3 trap condition    */
+#define X86_DR7_LEN3_MASK       (3UL << 30)      /* BP 3 access length     */
+
+#define X86_DR7_MBZ_BASE        (~0xffff2fffUL)  /* Reserved, read as zero */
+#define X86_DR7_MBZ_NO_RTM      (X86_DR7_RTM)    /* - if RTM unavailable   */
+
+#define X86_DR7_MBS             (0x00000400UL)   /* Reserved, read as one  */
+
 #define X86_DR7_DEFAULT         0x00000400  /* Default %dr7 value. */
 
 /*
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index b11bd718b7..e44f2556c8 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -56,6 +56,7 @@ long do_fpu_taskswitch(int set)
 long set_debugreg(struct vcpu *v, unsigned int reg, unsigned long value)
 {
     struct vcpu *curr = current;
+    const struct cpu_policy *cp = curr->domain->arch.cpuid;
 
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
+        value = adjust_dr6_rsvd(value, cp->feat.rtm);
 
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
+        value = adjust_dr7_rsvd(value, cp->feat.rtm);
+
         /*
          * Privileged bits:
          *      GD (bit 13): must be 0.
-- 
2.41.0


