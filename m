Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0AD5839E4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376654.609565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyOV-0004Kw-T9; Thu, 28 Jul 2022 07:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376654.609565; Thu, 28 Jul 2022 07:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyOV-0004I6-QR; Thu, 28 Jul 2022 07:57:19 +0000
Received: by outflank-mailman (input) for mailman id 376654;
 Thu, 28 Jul 2022 07:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGyOV-0004Hz-1B
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:57:19 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e66f4fb6-0e4a-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 09:57:17 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id va17so1894633ejb.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 00:57:17 -0700 (PDT)
Received: from uni.router.wind (adsl-69.109.242.233.tellas.gr.
 [109.242.233.69]) by smtp.googlemail.com with ESMTPSA id
 w26-20020a170906481a00b0072b4da1ed9asm99716ejq.225.2022.07.28.00.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 00:57:15 -0700 (PDT)
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
X-Inumbo-ID: e66f4fb6-0e4a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6S9vbWXJDGLHN0JT0DaEmuF3WQSnBWY9TAd3JcK8jJ4=;
        b=cfBscJ7L5Dp7UgSi8DXoSjp0aqOPpe4KGShS9oRQBP4Tx+Zux3XswNBMPF3E08QEA/
         V1bEAQPM38kyL1+y5V3MeyOJGehADiXH9+Rs7Xwewz1NpZedlkExEjyLdpuYpxq1EOQs
         N2v4uWxAmzCdCGnKAPR0N1DVphp4tdGS6fMjSjvxRGFq1wM4aYxqqdBN2CJ/q6fHorEG
         hpH1UPCu6A9nbK5o0zS4GUVlVUpTM38LC9bBt/1MrizTLWZS9+Li5FgbSeI2uebqHDdR
         IWWOb73dvbQm84X1b7nppwrFqXpdkqxD1zkxmU28nCVDugeS09X7Y7SFe50ZpM8zfexh
         tTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6S9vbWXJDGLHN0JT0DaEmuF3WQSnBWY9TAd3JcK8jJ4=;
        b=JPvso3oHnvwULP30rj7Jh8/WhReTZszqWRwMe3khHP8L26GPIxdDPINMEWayEGwxy3
         V7AJuxcAmhUvQYC0VqjuxZH2pCMG0pc1b7TR4ckRnYj69c0aktHUpAP2WP90lLXZe2SN
         H+vy11lIdVCLS02vNnVZKfBQ7wVOj1KNegrYQtqSVxPPETLAyAPCHqVwgRlRDhqsRgVA
         KdtaHhrvrtafBW4cRXluUFDRDks7SDkJMd0OpgGEbQ2SHf4iIpSBCOXjcjmuGHz4wZxz
         T5VfCuApDwUFKXaHpCX93HzIp9f/qPwCVUdw0KJXOu7PLl/UT5btIjwtIkhCfJg5Tl/F
         /REA==
X-Gm-Message-State: AJIora8mZe8bT2krEDtWxpXPCLJC4JNWYRWFt9CsUmJPUgBAPcdwXk44
	UwSmIeArleoEJKmTVPd6ZhRtQst1qw4=
X-Google-Smtp-Source: AGRyM1t+/flxtA298czkQLBiuBgoFtzGQZltUeC3b5qfRow5CyGVH3NkVgYYGAOJ1fq6So4po0g+7A==
X-Received: by 2002:a17:906:7308:b0:72f:3294:8002 with SMTP id di8-20020a170906730800b0072f32948002mr19642706ejc.311.1658995036631;
        Thu, 28 Jul 2022 00:57:16 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Date: Thu, 28 Jul 2022 10:57:09 +0300
Message-Id: <20220728075709.1175445-1-burzalodowa@gmail.com>
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

 xen/arch/arm/domain.c              | 2 +-
 xen/arch/arm/include/asm/current.h | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2f8eaab7b5..780b6bcfaa 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -63,7 +63,7 @@ static void do_idle(void)
     rcu_idle_exit(cpu);
 }
 
-void idle_loop(void)
+static void idle_loop(void)
 {
     unsigned int cpu = smp_processor_id();
 
diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
index 73e81458e5..225e00af71 100644
--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -44,8 +44,11 @@ static inline struct cpu_info *get_cpu_info(void)
 
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
+extern void return_to_new_vcpu32(void);
+extern void return_to_new_vcpu64(void);
+
 #define switch_stack_and_jump(stack, fn) do {                           \
-    asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" ); \
+    asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
     unreachable();                                                      \
 } while ( false )
 
-- 
2.34.1


