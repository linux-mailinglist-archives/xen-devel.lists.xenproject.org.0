Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6659849DD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803176.1213643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cW-0006sd-Jd; Tue, 24 Sep 2024 16:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803176.1213643; Tue, 24 Sep 2024 16:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cW-0006qo-Db; Tue, 24 Sep 2024 16:42:36 +0000
Received: by outflank-mailman (input) for mailman id 803176;
 Tue, 24 Sep 2024 16:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8cU-0006l4-VU
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff096dc4-7a93-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:42:33 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso955797466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134917sm101862166b.203.2024.09.24.09.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:31 -0700 (PDT)
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
X-Inumbo-ID: ff096dc4-7a93-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196152; x=1727800952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5xCjLUs3pPbWQfdWyUE12cQ5VpHeo8Aa8a68hh3s7U=;
        b=amu5GcfusJyKLzM1T42Z6EOmefResITmUVLZpxhmICTHlX+TvLSZO3Onp1NyOrGmHk
         WR7fyJsJjgJpYWpWlO04TL5jM1mIXa08qN1JFfFuzZwXpMLretmYTxWyHS3Qf+0YoNWI
         t37YJIAQtbg0I1uOStweoFoJCUKyl+ohUOx3/sldmc9sf80aDaJcml6Qq3LaQVYl04ig
         8JmOpDYB5HxXR1thEdHD2WzQtFeOBNkWXseYBP/SgPSaqoVkD4U6UZfPS5VbC6Eu3Twr
         PUhktKBxke3RFI6pBpxtyG2fVXNRMQwclBGRZmpDP8PicAaIYojbv2vJAE944VsaMp1r
         CT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196152; x=1727800952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5xCjLUs3pPbWQfdWyUE12cQ5VpHeo8Aa8a68hh3s7U=;
        b=XOQHG7/LkaBaB3HeI0CZqYPAoT/PrJsXBmWTcgDN0pAlV0qJkv0nzHDLV9PjPLmCja
         qLtksKKEBS8lqNnzmffzgGcABMoJBLsZrh9jLT85TFzrUsRuLhUFzswDrouWk91YaXG8
         uBhPlxQYoUFhJu3IQ2KbBYea2I2z8BB6fVLk6ohUr7CFy9Hi65AAVbYE2eixLwWhvyTf
         5p+dS5xjtYOsfplvGiivE/Xn2RIm+BOcf34xQ/AceBQhItVTmuZjW4Zy6NNfjjtBiOwq
         LlmlX2YZ2mXJMyjTTzilzyDZQp36An+UlFP08BVgflTdDtgYcAKGvGBGROTZfmiDNCp7
         3TOQ==
X-Gm-Message-State: AOJu0Yyc0TDy215MVPAz/5r/ZlGWye56d3irWXGTdXQMJtCTHjMVgpu4
	JacN3d62Ey0+UGHkfzsKBdq6h5Fxm0Jvw9hSa4VDf+loZ3Dwn2ElNGy/sw==
X-Google-Smtp-Source: AGHT+IHD00C3g7Fx0hoscqOIGTJ9K6Y5t4Ql7OetvMHqBuOrmX96dauwfvurBGUOqTg17WX3M5YI/w==
X-Received: by 2002:a17:907:94c7:b0:a8d:1774:eb73 with SMTP id a640c23a62f3a-a90d51841d8mr1870312566b.57.1727196152167;
        Tue, 24 Sep 2024 09:42:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 1/2] xen: introduce common macros for per-CPU sections defintion
Date: Tue, 24 Sep 2024 18:42:27 +0200
Message-ID: <27aba3aae7f4a5d4694ab141dca325d7231f2f66.1727185495.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727185495.git.oleksii.kurochko@gmail.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce PERCPU_BSS macro which manages:
 * Alignment of the section start
 * Insertion of per-CPU data sections
 * Alignment and start/end markers for per-CPU data
This change simplifies the linker script maintenance and ensures a unified
approach for per-CPU sections across different architectures.

Refactor the linker scripts for Arm, PPC, and x86 architectures by using
the common macro PERCPU_BSS defined in xen/xen.lds.h to handle per-CPU
data sections.

No functional changes.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - rename PERCPU_SECTION to PERCPU_BSS
 - update the commit message
 - add Acked-by: Julien Grall <jgrall@amazon.com>
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---

 xen/arch/arm/xen.lds.S    |  9 +--------
 xen/arch/ppc/xen.lds.S    |  9 +--------
 xen/arch/x86/xen.lds.S    |  9 +--------
 xen/include/xen/xen.lds.h | 10 ++++++++++
 4 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index bd884664ad..0987052f1a 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -198,14 +198,7 @@ SECTIONS
        __bss_start = .;
        *(.bss.stack_aligned)
        *(.bss.page_aligned)
-       . = ALIGN(PAGE_SIZE);
-       __per_cpu_start = .;
-       *(.bss.percpu.page_aligned)
-       *(.bss.percpu)
-       . = ALIGN(SMP_CACHE_BYTES);
-       *(.bss.percpu.read_mostly)
-       . = ALIGN(SMP_CACHE_BYTES);
-       __per_cpu_data_end = .;
+       PERCPU_BSS
        *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 38cd857187..0c4b94814b 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -148,14 +148,7 @@ SECTIONS
         __bss_start = .;
         *(.bss.stack_aligned)
         *(.bss.page_aligned)
-        . = ALIGN(PAGE_SIZE);
-        __per_cpu_start = .;
-        *(.bss.percpu.page_aligned)
-        *(.bss.percpu)
-        . = ALIGN(SMP_CACHE_BYTES);
-        *(.bss.percpu.read_mostly)
-        . = ALIGN(SMP_CACHE_BYTES);
-        __per_cpu_data_end = .;
+        PERCPU_BSS
         *(.bss .bss.*)
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d48de67cfd..b60d2f0d82 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -321,14 +321,7 @@ SECTIONS
   DECL_SECTION(.bss) {
        __bss_start = .;
        *(.bss.page_aligned*)
-       . = ALIGN(PAGE_SIZE);
-       __per_cpu_start = .;
-       *(.bss.percpu.page_aligned)
-       *(.bss.percpu)
-       . = ALIGN(SMP_CACHE_BYTES);
-       *(.bss.percpu.read_mostly)
-       . = ALIGN(SMP_CACHE_BYTES);
-       __per_cpu_data_end = .;
+       PERCPU_BSS
        *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index a17810bb28..24b8900ffe 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -151,6 +151,16 @@
 #define LOCK_PROFILE_DATA
 #endif
 
+#define PERCPU_BSS                 \
+       . = ALIGN(PAGE_SIZE);       \
+       __per_cpu_start = .;        \
+       *(.bss.percpu.page_aligned) \
+       *(.bss.percpu)              \
+       . = ALIGN(SMP_CACHE_BYTES); \
+       *(.bss.percpu.read_mostly)  \
+       . = ALIGN(SMP_CACHE_BYTES); \
+       __per_cpu_data_end = .;     \
+
 #ifdef CONFIG_HAS_VPCI
 #define VPCI_ARRAY               \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.46.1


