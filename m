Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A414C782DA0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587665.919024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7H7-0007YB-0F; Mon, 21 Aug 2023 15:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587665.919024; Mon, 21 Aug 2023 15:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7H6-0007VE-T3; Mon, 21 Aug 2023 15:57:04 +0000
Received: by outflank-mailman (input) for mailman id 587665;
 Mon, 21 Aug 2023 15:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mH9=EG=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qY7H4-0007V2-M2
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 15:57:02 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c90cd57-403b-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 17:57:00 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-26f7f71b9a7so308867a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 08:57:00 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090ac29600b00263f41a655esm6289831pjt.43.2023.08.21.08.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 08:56:58 -0700 (PDT)
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
X-Inumbo-ID: 5c90cd57-403b-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692633419; x=1693238219;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2S0z9KCvAaRErAryR0gpUbfAsu6gl92wga3E9uUth4=;
        b=Mconjy7Yf+r6vIKYmFbGdiTN6T/DewIdZjYxdi97et9rDNokWyE6VZUBfmUzZy4ut7
         imLiDtywDEK1ZUEkLWsJ61VfccZiaQg+5HofI+IglssYSvK21N6k4lH6ZAXXdmLryN9i
         K08U+NydR8oww2UXZIN3GNDEPoql/SJVEMkA6CHpZLkfgZo8kGqF3uAPeSuyu41ONgy9
         78UeB8MnBdNsENP5aBigo5+OFQk3a3lLHJz1fnPq4FaQdVJwLlqXAHuoCEBcXO/7ce4T
         caOKHOTTLXfpesww9E0SvgnRn7bab3iLcwTKjPesy0/wgYfSCb8X9uS+8bwIWOObGPPX
         KEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692633419; x=1693238219;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2S0z9KCvAaRErAryR0gpUbfAsu6gl92wga3E9uUth4=;
        b=HpqerTCVX9M7VOfzUaJbvI9uS8YLqf/5HH5FfIstLWoPm84e//6CEvMJ1F2/mg5/BT
         wB+lmJWjWPzQzbH7f2KRbKyRid9imZxiaJI0LLRFIYm1aQ61KZNFjs8xEC6bgJ2/TSmo
         NP2GmeJs1dDrhFv26hZ+6fPJlSaouYW9irUWNwyExyk8oos8xn8C3KcO3gbcWb13RsEM
         mAoJ6IYOCnju0+x2uoGdjwvUwEDSYoO9kNsK8uQmQp9B4B9XWNJS5f9VvTVkZ9Kx9LNf
         8JOyCo5zAVwZYYzvidSS5J5OvGtB5kKZKAPTrolLjOWzM1dLmCWxjxPheFZNNGvYwp7g
         b7Zw==
X-Gm-Message-State: AOJu0YyAc9HzLlsKZZLODVh9LZMQaT20r5mq2bxBNF0+7zmAt2mX40RA
	e0Ux0qKc/xbg7lYwTGXiTE7tNP+alL+WXA==
X-Google-Smtp-Source: AGHT+IGcH8j7FW4s549lSLTCMkNwyP2n1sZ3ocgNK1HHJTek8E51XVy8+DH2mzTgO5wUO5bISqDcBQ==
X-Received: by 2002:a17:90b:a03:b0:267:f1d0:ca70 with SMTP id gg3-20020a17090b0a0300b00267f1d0ca70mr6265049pjb.47.1692633418866;
        Mon, 21 Aug 2023 08:56:58 -0700 (PDT)
Message-ID: <eb2a3feb-b226-0d90-51e8-c541b5e2dfd8@gmail.com>
Date: Tue, 22 Aug 2023 00:56:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 1/5] x86: Fix calculation of %dr6/7 reserved bits
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Language: en-US
In-Reply-To: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

The reserved bit calculations for %dr6 and %dr7 depend on whether the VM has
the Restricted Transnational Memory feature available.

Introduce adjust_dr{6,7}_rsvd() and replace the opencoded logic and constants
(except for DR_STATUS_RESERVED_ONE which is (mis)used elsewhere and will be
removed after future bugfixes).  The use of these helpers in set_debugreg()
covers toolstack values for PV guests, but HVM guests need similar treatment.

The use of the guests cpuid policy is less than optimal in the create/restore
paths.  However in such cases, the policy will be the guest maximum policy,
which will be more permissive with respect to the RTM feature.

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c               |  7 +++--
 xen/arch/x86/hvm/hvm.c              |  6 ++--
 xen/arch/x86/include/asm/debugreg.h | 44 +++++++++++++++++++++++++----
 xen/arch/x86/pv/misc-hypercalls.c   | 16 +++--------
 4 files changed, 50 insertions(+), 23 deletions(-)

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
index 86aa6d7143..8be60910b4 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -10,9 +10,18 @@
 #define DR_STATUS    6
 #define DR_CONTROL   7
 
-/* Define a few things for the status register.  We can use this to determine
-   which debugging register was responsible for the trap.  The other bits
-   are either reserved or not of interest to us. */
+/*
+ * DR6 status bits.
+ *   N.B. For backwards compatibility, X86_DR6_RTM has inverted polarity.
+ */
+#define X86_DR6_B0              (1u <<  0)  /* Breakpoint 0 triggered  */
+#define X86_DR6_B1              (1u <<  1)  /* Breakpoint 1 triggered  */
+#define X86_DR6_B2              (1u <<  2)  /* Breakpoint 2 triggered  */
+#define X86_DR6_B3              (1u <<  3)  /* Breakpoint 3 triggered  */
+#define X86_DR6_BD              (1u << 13)  /* Debug register accessed */
+#define X86_DR6_BS              (1u << 14)  /* Single step             */
+#define X86_DR6_BT              (1u << 15)  /* Task switch             */
+#define X86_DR6_RTM             (1u << 16)  /* #DB/#BP in RTM region   */
 
 #define DR_TRAP0        (0x1)           /* db0 */
 #define DR_TRAP1        (0x2)           /* db1 */
@@ -21,7 +30,6 @@
 #define DR_STEP         (0x4000)        /* single-step */
 #define DR_SWITCH       (0x8000)        /* task switch */
 #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
-#define DR_STATUS_RESERVED_ZERO (~0xffffefffUL) /* Reserved, read as zero */
 #define DR_STATUS_RESERVED_ONE  0xffff0ff0UL /* Reserved, read as one */
 
 /* Now define a bunch of things for manipulating the control register.
@@ -61,8 +69,6 @@
    We can slow the instruction pipeline for instructions coming via the
    gdt or the ldt if we want to.  I am not sure why this is an advantage */
 
-#define DR_CONTROL_RESERVED_ZERO (~0xffff27ffUL) /* Reserved, read as zero */
-#define DR_CONTROL_RESERVED_ONE  (0x00000400UL) /* Reserved, read as one */
 #define DR_LOCAL_EXACT_ENABLE    (0x00000100UL) /* Local exact enable */
 #define DR_GLOBAL_EXACT_ENABLE   (0x00000200UL) /* Global exact enable */
 #define DR_RTM_ENABLE            (0x00000800UL) /* RTM debugging enable */
@@ -80,4 +86,30 @@
 long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
 void activate_debugregs(const struct vcpu *);
 
+static inline unsigned long adjust_dr6_rsvd(unsigned long dr6, bool rtm)
+{
+    /*
+     * DR6: Bits 4-11,17-31 reserved (set to 1).
+     *      Bit  16 reserved (set to 1) if RTM unavailable.
+     *      Bit  12 reserved (set to 0).
+     */
+    dr6 |= 0xfffe0ff0 | (rtm ? 0 : X86_DR6_RTM);
+    dr6 &= 0xffffefff;
+
+    return dr6;
+}
+
+static inline unsigned long adjust_dr7_rsvd(unsigned long dr7, bool rtm)
+{
+    /*
+     * DR7: Bit  10 reserved (set to 1).
+     *      Bit  11 reserved (set to 0) if RTM unavailable.
+     *      Bits 12,14-15 reserved (set to 0).
+     */
+    dr7 |= 0x00000400;
+    dr7 &= 0xffff23ff & (rtm ? 0 : ~DR_RTM_ENABLE);
+
+    return dr7;
+}
+
 #endif /* _X86_DEBUGREG_H */
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


