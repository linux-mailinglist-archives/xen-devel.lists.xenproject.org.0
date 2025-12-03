Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D647CA04E9
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 18:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176990.1501420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqSc-00080K-Tb; Wed, 03 Dec 2025 17:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176990.1501420; Wed, 03 Dec 2025 17:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqSc-0007xt-Qf; Wed, 03 Dec 2025 17:16:14 +0000
Received: by outflank-mailman (input) for mailman id 1176990;
 Wed, 03 Dec 2025 17:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dwxk=6J=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQqSa-0007xn-Lj
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 17:16:12 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3edd675-d06b-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 18:16:11 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso505885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 09:16:11 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a8ccbfesm59381855e9.13.2025.12.03.09.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 09:16:10 -0800 (PST)
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
X-Inumbo-ID: c3edd675-d06b-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764782171; x=1765386971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gh+R+SZtQJehKOncYKGKlhzLBvG4VuQxZob9EYE/i0=;
        b=VoGAVoqMlXHLfSeiXQQoqDStCFCT4HlKB6mptNkJ2RAapJAqGcVGSc5YeG0xrUum6G
         iUtarRN2yUs9i9mIjbJXsSEaE85CaKiAi0yYfPV5gZxThC4tfSuvXN/NjhSE9eTam6Ty
         erGtuKx3cwxR5M19SQRRmVeVbhiXHaeatdxkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764782171; x=1765386971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gh+R+SZtQJehKOncYKGKlhzLBvG4VuQxZob9EYE/i0=;
        b=n8lOnPXz+sz71o+yY4bI45DQ+cqSNEUD6dvi0ifXHQfWTrMV5KDTKNRM6S2+GVAPEi
         +C3IAV48FrkS1RXkdEKi66zRm/m6Lr+gjsnH3Wo7awlavLiomJQnShpL9fopqEznH2xh
         9LM4Xx1dmdkm22eLj3oRv6Xu28QfXcJ5ZxMJ4Kmw04PS4ThkX1LcGPj9WiNYIuRwzt4b
         TOT6XQHAzyp1LMd/7YI/R5USTkay9/J+8JQLB8HtredA3zf0pzrm/TUjlcO7a9KnRCVD
         tFWV5Ytl5NJsSf1euUi78m3PMR2lazZLQDbA9I6eMo6rxOTKkbclC5Ue5uJwGxh7EMGO
         8KEw==
X-Gm-Message-State: AOJu0YwkhlORiCGbSll8lzQ4qccTK+ccM1LNhCFbIAx2XrMHcqLNFTvA
	xrxqxycwwGtBIYbBB6zH358/z92Jn1GTufbLf4Kyb6fF/P44wJnSGn2XQ7v0/xoRDm5aFFqUvb6
	/pj1f
X-Gm-Gg: ASbGncvHYzk7AJaU4a9CDp1wRDKZUPS7TcoxKRmfVa95acUfrYz6UPnc3xXyqCNh+gv
	1OFlqapX8A9LabPNkJUzm+aKmH8PqK+aN+rCjaV8/drRzkGB7Jc9RKeWm0Nvg0cjAuCOge0XP6v
	NelMRIsOs9JCkJc/K6g/gToYw/7ajFsNvhw6rRA4LBQkzYFP9cIguwxKtjUC+qrhuESlHVZKfse
	bS7T/3hrzXNES2WDm209sfy9zYqG5Fy6Re6Acbrw8/iAvN8ApQfIUhNWDDv2QjaoK/SJKIjRHG/
	igCVbcpVFvvW0u2wX+N1giMoXGjIxwpKlo0v1Ye72wLh7Ip+9aZDdlCDDyQTRnBknCB0yLRcz+r
	t5+pLPpjFFTbH36nAf+OS7QMoBmggFjorkzVGdXVfH6Z8BVD5lat57u3qOcfG0NI8cSAMT4YKwi
	KB2aAnLu8WJ2Q86W/HfH9Ik1TaWnmWkl4wy9DYwW2QbuyP+B/5yAdIjP40i8CS9Q==
X-Google-Smtp-Source: AGHT+IEQBEinCWx27Txdk9QSdMrtpcEQJUHvNwnF518KE9DHGS+8qWMevRVM52dS1A9+X/6qBNj4WQ==
X-Received: by 2002:a05:600c:46c6:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-4792eb19ee1mr2205375e9.7.1764782170746;
        Wed, 03 Dec 2025 09:16:10 -0800 (PST)
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
Subject: [PATCH] ARM: Drop ThumbEE support
Date: Wed,  3 Dec 2025 17:16:08 +0000
Message-Id: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was reported that Xen no longer builds on Debian Trixie:

  Assembler messages:
  {standard input}:474: Error: unknown or missing system register name at operand 1 -- `msr TEECR32_EL1,x0'
  {standard input}:480: Error: unknown or missing system register name at operand 1 -- `msr TEEHBR32_EL1,x0'
  {standard input}:488: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEECR32_EL1'
  {standard input}:494: Error: unknown or missing system register name at operand 2 -- `mrs x0,TEEHBR32_EL1'
  make[5]: *** [Rules.mk:249: arch/arm/domain.o] Error 1

This turns out to be an intentional change in bintuils.  ThumbEE was dropped
from the architecture and doesn't exist in v8 (i.e. AArch64).

Xen supports v7+virt extentions so in principle we could #ifdef CONFIG_ARM_32
to keep it working, but there was apparently no use of ThumbEE outside of demo
code, so simply drop it.

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

There's been no movement on this and it's urgent.  This (cross)compiles for
me, but is the sum total of testing it's had.

Bintuils link: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=8c0024ca8f6c01fc45f081f5ef11c9a6a1c24eb0
---
 xen/arch/arm/domain.c                 | 12 ------------
 xen/arch/arm/include/asm/cpufeature.h |  1 -
 xen/arch/arm/include/asm/domain.h     |  1 -
 xen/arch/arm/setup.c                  |  3 +--
 4 files changed, 1 insertion(+), 16 deletions(-)

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
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index b6df18801166..bb1629546f63 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -29,7 +29,6 @@
 #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
 #define cpu_has_thumb2    (boot_cpu_feature32(thumb) >= 3)
 #define cpu_has_jazelle   (boot_cpu_feature32(jazelle) > 0)
-#define cpu_has_thumbee   (boot_cpu_feature32(thumbee) == 1)
 #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
 
 #ifdef CONFIG_ARM64_SVE
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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7ad870e382c2..c24e6d01c1f8 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -172,12 +172,11 @@ static void __init processor_id(void)
         printk("32-bit Execution:\n");
         printk("  Processor Features: %"PRIregister":%"PRIregister"\n",
                system_cpuinfo.pfr32.bits[0], system_cpuinfo.pfr32.bits[1]);
-        printk("    Instruction Sets:%s%s%s%s%s%s\n",
+        printk("    Instruction Sets:%s%s%s%s%s\n",
                cpu_has_aarch32 ? " AArch32" : "",
                cpu_has_arm ? " A32" : "",
                cpu_has_thumb ? " Thumb" : "",
                cpu_has_thumb2 ? " Thumb-2" : "",
-               cpu_has_thumbee ? " ThumbEE" : "",
                cpu_has_jazelle ? " Jazelle" : "");
         printk("    Extensions:%s%s\n",
                cpu_has_gentimer ? " GenericTimer" : "",

base-commit: 62bd4c2a8ee809c181d47098583270dc9db9300e
-- 
2.39.5


