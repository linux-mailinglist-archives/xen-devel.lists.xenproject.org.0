Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384E2CB491A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 03:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183500.1506170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTWae-0006ck-JI; Thu, 11 Dec 2025 02:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183500.1506170; Thu, 11 Dec 2025 02:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTWae-0006bH-GM; Thu, 11 Dec 2025 02:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1183500;
 Thu, 11 Dec 2025 02:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCI8=6R=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vTWac-0006bB-OL
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 02:39:34 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fd86dc2-d63a-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 03:39:33 +0100 (CET)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-8ba3ffd54dbso81440785a.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 18:39:33 -0800 (PST)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4ce55sm101870785a.53.2025.12.10.18.39.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Dec 2025 18:39:31 -0800 (PST)
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
X-Inumbo-ID: 9fd86dc2-d63a-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765420772; x=1766025572; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0SRmNgbUxcC0ay425IGSb4L4pwhla5fRNtxxWeaWLM=;
        b=IBQNECR7bWfrgCdmTDOn4XeFs8tAq7uriHi8irPJIdbl2V6jF3JwzUH/eOAJqzjvsk
         cs7EtEG9HHj/txGWrdsf77V2K/rsOGsgC0vxaMKV/BiqiaM4bDivcHLzF5It8mfCvz3D
         FMvZAoMaR7dt3GPorfCOKlTtzLqvaJ+qDmoHHIspgqXbqM34jy7ZZts2b7DfGaX/QDw5
         umQzGk1NIvRxVQI4UtNmxdqi9Sw4jLu2hKzz/KhvRJ8xJ5zEsbSrqBFvZNHPKaS2r0T2
         Sx8/Eq3KaJ6J6h5RVQJzk9y7PiRe5L4aiBgiKcHnQ3llKdU/EN0/XowAEbfnubfi6X7A
         AayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765420772; x=1766025572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0SRmNgbUxcC0ay425IGSb4L4pwhla5fRNtxxWeaWLM=;
        b=kvIoKEWwV6gdJ5ofBK7UpCMmce73VqFVcPMBpD22e024xIJGeHOedfCkOZZiVPJBqH
         CjL9UETDoiq43YaLjdj3QHeGJLQdGxmM1xb0v4atbiCqBsQJy5lKd8VCvWJ0Km1C8S1Q
         kSq/clIIt3vyn4Sfp9U1YewhHNIjIh5uzskdFoO5Y3gcLETSU4NyWp2Hx6fGu9uDdMXM
         g4LH4V5Jjh+5vA8pg0KQBeNJ4xcrhIlv85T3zJ7HQYa25XsM2xgGt0ntX0yBgrEDfZiI
         vPjNOeaU0pikoGtvg0APnmi8PNsYKOdQsDtiJdLt+RtPorGC1283K/x/HgsIQAvl6dhb
         DgsA==
X-Gm-Message-State: AOJu0YzlXDvBV7rPBs8OK2thCiuAV7SX9TluNtQ7KOghnq4QZ6WysK90
	rKn177ouG5vxsO7KdHfhu5wIy06C51f0tajpQfyyehhvGZ37PngczvPB5i7+OiQ=
X-Gm-Gg: ASbGncvvpuxEplDRljv8zeqQX1nf0dRDXs+opCNC8hgzOTA4TjB8NqSNfT+IxQsL20/
	lDiDWeomYx3r/a8O1/dRfou6qmQru2Z82g4Dp2D0UPBIOWx7fwb6luss5KCDV+ArnkKAJueESgy
	AtQfNx6zNVBSGqos4mq7AEhf9uh7qgUXIc4CZwoKsKsvnsStUR5mgTYzIqkfJhfGCUiSmz1DSyl
	BWHpBW6DdZOZrr2y6p1lZyJH2ygrcwXRiMLtQNS8lR2KdVs6BxyIDX0MceoRoKEEFyaa9aer4PS
	PeTrdAPfcf23AgdmpsQBWpAcvWInhxVAyyMHMS9L2KJogFiqkpsdBYTVla4Z43mxCubojCe3ryx
	cbTIIUzo5nUoP+8+J7tv/Z6xGdwkigwAI1+F0AxL6N6rDAxCEKTG5NFtnIWE9uNzvB313td4S6R
	qtaxx6MySNYHf+R7jYt8TVBmfKA0i/RJ68DioFgaDCc6pLC/BzuDbOqdiMWmJ9/RQJqPeyJOPs4
	KWiRyVk1iW+RkpC3oqk/cQfHs6IfG9JocmQTm6jsrPdam+6bFVj/o7dRpWsRFGNFoAtdNHQDfIs
	rLk=
X-Google-Smtp-Source: AGHT+IEjtr7LjDNnAGOV46d/ZVSuPC+eUKDN9xJFxu4aKbqCdcX6uXABoOdxsTquJx815KMmN2t5Og==
X-Received: by 2002:a05:620a:28c1:b0:85b:8a42:eff9 with SMTP id af79cd13be357-8ba39a52ff5mr677144985a.53.1765420771637;
        Wed, 10 Dec 2025 18:39:31 -0800 (PST)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm64: Add support Clang build on arm64
Date: Wed, 10 Dec 2025 20:39:24 -0600
Message-ID: <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables building Xen on arm64 architecture using the Clang compiler.
Changes include:
- Add explicit -march=armv8 flag for arm64 builds.
- Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
  `vfp_restore_state` functions when building with Clang to allow
  FP instructions despite `-mgeneral-regs-only`.

Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
---
 README                   | 2 ++
 xen/arch/arm/arch.mk     | 1 +
 xen/arch/arm/arm64/vfp.c | 6 ++++++
 3 files changed, 9 insertions(+)

diff --git a/README b/README
index 889a4ea906..67c1aa7fe6 100644
--- a/README
+++ b/README
@@ -45,6 +45,8 @@ provided by your OS distributor:
       - For ARM:
         - GCC 5.1 or later
         - GNU Binutils 2.25 or later
+        or
+        - Clang/LLVM 11 or later
       - For RISC-V 64-bit:
         - GCC 12.2 or later
         - GNU Binutils 2.39 or later
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 9c4bedfb3b..bcf548069b 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -13,6 +13,7 @@ ifeq ($(CONFIG_MPU),y)
 CFLAGS-$(CONFIG_ARM_64) += -march=armv8-r
 else
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
+CFLAGS-$(CONFIG_ARM_64) += -march=armv8
 endif
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
index c4f89c7b0e..51fd2ddc54 100644
--- a/xen/arch/arm/arm64/vfp.c
+++ b/xen/arch/arm/arm64/vfp.c
@@ -46,6 +46,9 @@ static inline void restore_state(const uint64_t *fpregs)
                  : : "Q" (*fpregs), "r" (fpregs));
 }
 
+#if defined(CONFIG_CC_IS_CLANG)
+__attribute__((target("fp-armv8")))
+#endif
 void vfp_save_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
@@ -62,6 +65,9 @@ void vfp_save_state(struct vcpu *v)
         v->arch.vfp.fpexc32_el2 = READ_SYSREG(FPEXC32_EL2);
 }
 
+#if defined(CONFIG_CC_IS_CLANG)
+__attribute__((target("fp-armv8")))
+#endif
 void vfp_restore_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
-- 
2.49.0


