Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4013BCA3082
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 10:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177455.1501730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5mt-0003ko-P2; Thu, 04 Dec 2025 09:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177455.1501730; Thu, 04 Dec 2025 09:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5mt-0003jE-MI; Thu, 04 Dec 2025 09:38:11 +0000
Received: by outflank-mailman (input) for mailman id 1177455;
 Thu, 04 Dec 2025 09:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SyTI=6K=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vR5ms-0003j8-2u
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 09:38:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efedf93d-d0f4-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 10:38:07 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42e2e2eccd2so531529f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 01:38:06 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d352a52sm2222690f8f.38.2025.12.04.01.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:38:05 -0800 (PST)
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
X-Inumbo-ID: efedf93d-d0f4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764841085; x=1765445885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2W2GSKBzu5ItheZNWHIKOToGLaI2QT0J35dhvTXXxhI=;
        b=Vv/kIpGrxPukHGH2DOewiicJzElZZ0p/9L/17QUEE/butpcd+2ns2aJidlqv48meMm
         mfAwvDnB84j8YOIRbcNjvcoG1hOmfEwXIN9UuataNIhoYpV28RW1hu/YomlwWeHcqY3u
         +LE2iO3X1tWiI1ZNGhOMnTxNCKr1nAPbtqwqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841085; x=1765445885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2W2GSKBzu5ItheZNWHIKOToGLaI2QT0J35dhvTXXxhI=;
        b=AiZE9G8saG9VciU/17oULO/2jQze15yhRYG1z2UgCARYjFsTe82OhGsWbeQJfGQeTF
         93IGM/YRRDo0LLukM/q8o9rBs+D0wppogOYo49HQyXYSZKD+uSXV8KG0UUZ/9extW/AO
         ws9oqlQk7SRGB592aKNx67hRlMtOF7++ntKE/7o00jTNG9JkjNQfGYviM54YkyuMvx5b
         +dUrzaKCPqhLlnLQfI5enBr1W+AyJjDnlhAMyNanje5fguN+vtTAAj7+Hk8NQN5jF9cb
         ER+fcV8tbWYhpnNi6WfyeuipYG2nymGLgtZxFYTAwwcmRtz3RfDl3cURyk725RqSiFWY
         EWzg==
X-Gm-Message-State: AOJu0YyGtn95LYo7NHZQ7kRbMN9VlRzlUzUADyb0N6VYYZ5ft4AVqdnx
	OGdATpLNAU6IolrxgzvjQ8nwoQxX32l5JNLjmydgri3t+v2mxfKjEMH/Qr0xE2PFKXIgHtsWpEq
	7R+O8
X-Gm-Gg: ASbGncv+0m8gzwmstMDBH/rj03bSaYumJeeIRUgRdwZbVOHvCjKQPUGoBW5HMoVe01j
	hEpHhTSTDJPvhEsg1HW2wvTn4nvDoCi1hVTvKzetMoqSDXbh7OMgGcjKGP6mFVLMogEQ1t0sZjG
	ONi5NvzeTztdYSFuvnNvQmpAEBjowlKzvGx/8l+lh71lgtGb+AIDmM01NT28YyqrAApiIFo8UrZ
	V8iax61K7WIUBgBHzTuIA8LIVrqnXXvIAGvUU4Y4WrwjDVZhilx7lwsUP2OhsnRQfb+KdlrPhR8
	4In/nbutfUuDzjuZW7Aijcw6/z3h7oQJFKVBuNC9KMASUpURkGPsUrQvaMNA2QltRPzhDmSMJrv
	3vRBV3Tw2YnuYp5pBUvFQjgSjLuwJh8jhOYOu5PTNgwmcGj8f2AaE4xZ/TL+KMfwllxGuIz7qqM
	GPm+/bUHbvfzhgWJXQf00nO9U6tv3naiW+gMrqjdAQ6j7Weuy1kssHLaojP5cIVA==
X-Google-Smtp-Source: AGHT+IGcuaX9aD3thK7GGoXvmVbhWYzUjT7LqAOvLJqh6ZJxXQQrjIL0OwOjsQzaJhB83QmjvAjjVQ==
X-Received: by 2002:a05:6000:420a:b0:42b:3680:3567 with SMTP id ffacd0b85a97d-42f73172b34mr5580069f8f.18.1764841085501;
        Thu, 04 Dec 2025 01:38:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Hans van Kranenburg <hans@knorrie.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <JBeulich@suse.com>,
	Maximilian Engelhardt <maxi@daemonizer.de>
Subject: [PATCH v2] ARM: Drop ThumbEE support
Date: Thu,  4 Dec 2025 09:38:02 +0000
Message-Id: <20251204093802.1717792-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was reported that Xen no longer builds on Debian unstable/sid.

  Assembler messages:
  {standard input}:474: Error: unknown or missing system register name at operand 1 -- `msr TEECR32_EL1,x0'
  {standard input}:480: Error: unknown or missing system register name at operand 1 -- `msr TEEHBR32_EL1,x0'
  {standard input}:488: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEECR32_EL1'
  {standard input}:494: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEEHBR32_EL1'
  make[5]: *** [Rules.mk:249: arch/arm/domain.o] Error 1

This turns out to be an intentional change in binutils.  ThumbEE was dropped
ahead of ARM v8 (i.e. AArch64).

Xen supports ARM v7+virt extensions so in principle we could #ifdef
CONFIG_ARM_32 to keep it working.  However, there was apparently no use of
ThumbEE outside of demo code, so simply drop it.

On ThumbEE capable hardware, unconditionally trap ThumbEE instructions, and
drop the context switching logic for TEE{CR,HBR}32.

Reported-by: Hans van Kranenburg <hans@knorrie.org>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Hans van Kranenburg <hans@knorrie.org>
CC: Maximilian Engelhardt <maxi@daemonizer.de>

v2:
 * Trap ThumbEE
 * s/Trixie/Sid/ in the commit message

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2195763116

Bintuils link:
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=8c0024ca8f6c01fc45f081f5ef11c9a6a1c24eb0
---
 xen/arch/arm/domain.c                | 12 ------------
 xen/arch/arm/include/asm/domain.h    |  1 -
 xen/arch/arm/include/asm/processor.h |  1 +
 xen/arch/arm/traps.c                 |  4 ++--
 4 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index ab7844433597..3e32a15cac7a 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -111,12 +111,6 @@ static void ctxt_switch_from(struct vcpu *p)
     p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
     virt_timer_save(p);
 
-    if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
-    {
-        p->arch.teecr = READ_SYSREG(TEECR32_EL1);
-        p->arch.teehbr = READ_SYSREG(TEEHBR32_EL1);
-    }
-
 #ifdef CONFIG_ARM_32
     p->arch.joscr = READ_CP32(JOSCR);
     p->arch.jmcr = READ_CP32(JMCR);
@@ -244,12 +238,6 @@ static void ctxt_switch_to(struct vcpu *n)
     WRITE_SYSREG(n->arch.tpidrro_el0, TPIDRRO_EL0);
     WRITE_SYSREG(n->arch.tpidr_el1, TPIDR_EL1);
 
-    if ( is_32bit_domain(n->domain) && cpu_has_thumbee )
-    {
-        WRITE_SYSREG(n->arch.teecr, TEECR32_EL1);
-        WRITE_SYSREG(n->arch.teehbr, TEEHBR32_EL1);
-    }
-
 #ifdef CONFIG_ARM_32
     WRITE_CP32(n->arch.joscr, JOSCR);
     WRITE_CP32(n->arch.jmcr, JMCR);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index af3e168374b4..758ad807e461 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -211,7 +211,6 @@ struct arch_vcpu
     register_t hcr_el2;
     register_t mdcr_el2;
 
-    uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
 #ifdef CONFIG_ARM_32
     /*
      * ARMv8 only supports a trivial implementation on Jazelle when in AArch32
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 92c8bc1a3125..ec23fd098b63 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -411,6 +411,7 @@
 
 /* HSTR Hyp. System Trap Register */
 #define HSTR_T(x)       ((_AC(1,U)<<(x)))       /* Trap Cp15 c<x> */
+#define HSTR_TTEE       (_AC(1,U)<<16)          /* Trap ThumbEE */
 
 /* HDCR Hyp. Debug Configuration Register */
 #define HDCR_TDRA       (_AC(1,U)<<11)          /* Trap Debug ROM access */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 2bc3e1df0416..040c0f2e0db1 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -158,8 +158,8 @@ void init_traps(void)
     WRITE_SYSREG(HDCR_TDRA|HDCR_TDOSA|HDCR_TDA|HDCR_TPM|HDCR_TPMCR,
                  MDCR_EL2);
 
-    /* Trap CP15 c15 used for implementation defined registers */
-    WRITE_SYSREG(HSTR_T(15), HSTR_EL2);
+    /* Trap CP15 c15 used for implementation defined registers, and ThumbEE. */
+    WRITE_SYSREG(HSTR_T(15) | (cpu_has_thumbee ? HSTR_TTEE : 0), HSTR_EL2);
 
     WRITE_SYSREG(get_default_cptr_flags(), CPTR_EL2);
 

base-commit: 62bd4c2a8ee809c181d47098583270dc9db9300e
-- 
2.39.5


