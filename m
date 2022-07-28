Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FCC584410
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 18:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376951.610016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH6Gt-0007v9-TP; Thu, 28 Jul 2022 16:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376951.610016; Thu, 28 Jul 2022 16:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH6Gt-0007tA-PV; Thu, 28 Jul 2022 16:21:59 +0000
Received: by outflank-mailman (input) for mailman id 376951;
 Thu, 28 Jul 2022 16:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oH6Gs-0007t1-FP
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 16:21:58 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 665d558e-0e91-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 18:21:57 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id f15so2821842edc.4
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 09:21:57 -0700 (PDT)
Received: from uni.router.wind (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.googlemail.com with ESMTPSA id
 dk15-20020a0564021d8f00b0043cedad30a5sm997092edb.21.2022.07.28.09.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 09:21:55 -0700 (PDT)
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
X-Inumbo-ID: 665d558e-0e91-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJz3FE30CMUZxePR5Hul4ldsrorD4RAPiwG0AXEy62g=;
        b=l8wAFe4tR4icpFOjTC76vG2xM9yosMH8ldGOfAtBcJDInee7i5GcJ9s5lRaH1a/WR6
         IJlyEl05jXAGvyuZHX/DNyn/9K/eqJimV10lCxHRyrXqD347GmfvUw6LGLfpJU7zQLX+
         vYs9cKtjmOvIvlgGGpNMBdpVSrohyVf2G2In+LBd0HE/HsF9Mf00XE3uECWMDLnjU3Fg
         RzAqzyWa4nX/k+vby3v2uXvtq3FvvsNzcFuhQVhTVcwYRkU1gzA9wXg54dPYhZ/otokl
         G3N1HV7+VBBVjcb3s8fKUhmdXKg/WQkyHySMH+aABk4HE1Os3TSSHxZaet3iePlE8RgK
         THfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJz3FE30CMUZxePR5Hul4ldsrorD4RAPiwG0AXEy62g=;
        b=E+U8TtapYtl1CRPMUEXc0t1/bB6j8vvLwSDFWb25ZeQd19u76GpVY7tjrlgv3P35bo
         JcuBBm+ne+yOLPl5d1RlTEdtSs9DLZl7f0gAlS5HfL34BB4KDKEyZDojnDDKoJZnu3Ld
         ItqcLlPfHjDc1yY86VopW8KX2nCXuY7cY63EkYQRvSDSeD4x6rIv8uWlWsRHtdyuksjU
         mISeIwz8TsnwMb9IWthxTqMe485tV/7jSPfnT8QK3fVuav4Ahq0MkgC7jPesfmcxhlTS
         hBPByhcGM4KExxlEyc07rRNCdfqwf5S2q1JfhRuBDZD7cqPdTuxyal34niccWmNyM7wX
         rWew==
X-Gm-Message-State: AJIora9Qo25pJuH/fsFw+OOcHJ0PB1ywjVAnFZRxR3kPniPZQx/Bs7Oc
	NFKR3xPch818zz1mIKlYhIlcAeyvRnY=
X-Google-Smtp-Source: AGRyM1txPcvTQtajiZSTmJEhcDTSocrmT/k2OKxHh/gPQ0D2fFfEcjxHo/86ZWcdncxhRl5CCx8dsg==
X-Received: by 2002:a05:6402:35c4:b0:43b:fee5:2653 with SMTP id z4-20020a05640235c400b0043bfee52653mr20588266edc.415.1659025315949;
        Thu, 28 Jul 2022 09:21:55 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Date: Thu, 28 Jul 2022 19:21:51 +0300
Message-Id: <20220728162151.1228747-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function idle_loop() is referenced only in domain.c.
Change its linkage from external to internal by adding the storage-class
specifier static to its definitions.

Add the function as a 'fake' input operand to the inline assembly statement,
to make the compiler aware that the function is used.
Fake means that the function is not actually used as an operand by the asm code.
That is because there is not a suitable gcc arm32 asm constraint for labels.

Declare return_to_new_vcpu32() and return_to_new_vcpu64() that are also
referenced by this inline asm statement.

Also, this patch resolves indirectly a MISRA C 2012 Rule 8.4 violation warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- remove the 'used' attribute and pass the function as input operand to
the inline asm statement
- declare return_to_new_vcpu32() and return_to_new_vcpu64()

Changes in v3:
- remove the declarations of return_to_new_vcpu32() and return_to_new_vcpu64()
from asm/current.h because this is not the appropriate header
- place them in arm/domain.c to restrict their visibilty to this particular file
- declare them as noreturn

 xen/arch/arm/domain.c              | 5 ++++-
 xen/arch/arm/include/asm/current.h | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2f8eaab7b5..ce1089f0c6 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -63,7 +63,7 @@ static void do_idle(void)
     rcu_idle_exit(cpu);
 }
 
-void idle_loop(void)
+static void idle_loop(void)
 {
     unsigned int cpu = smp_processor_id();
 
@@ -331,6 +331,9 @@ static void schedule_tail(struct vcpu *prev)
     update_vcpu_system_time(current);
 }
 
+extern void noreturn return_to_new_vcpu32(void);
+extern void noreturn return_to_new_vcpu64(void);
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     current->arch.actlr = READ_SYSREG(ACTLR_EL1);
diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
index 73e81458e5..6973eeb1d1 100644
--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -45,7 +45,7 @@ static inline struct cpu_info *get_cpu_info(void)
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
 #define switch_stack_and_jump(stack, fn) do {                           \
-    asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" ); \
+    asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
     unreachable();                                                      \
 } while ( false )
 
-- 
2.34.1


