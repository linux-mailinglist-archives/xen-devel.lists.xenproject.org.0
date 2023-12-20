Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37481A0C3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657921.1027085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFk-00073g-W7; Wed, 20 Dec 2023 14:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657921.1027085; Wed, 20 Dec 2023 14:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxFk-0006xY-PN; Wed, 20 Dec 2023 14:08:52 +0000
Received: by outflank-mailman (input) for mailman id 657921;
 Wed, 20 Dec 2023 14:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFxFj-0004kf-8t
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:08:51 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c352719-9f41-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:08:49 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ca02def690so67130441fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:08:49 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05651c089300b002cc83c337absm593892ljq.70.2023.12.20.06.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:08:48 -0800 (PST)
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
X-Inumbo-ID: 4c352719-9f41-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703081329; x=1703686129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59F7K5RNi8wsdT3N0XNqdjgmsgxFVNgSxjJCoU/Uuzw=;
        b=VZBNY9zGE5bd3hlZYkcXOKF9gYvsyo/jeOBhOWYhNtKRJgJTw5EU6UeW4maIUMsdxJ
         o/biEA0Ec5eEmewOglx9q/NLQsERcYePUoRsEyDMoHJ4/Vmo0C9C5LLC04AeKg9U6gSV
         q6B803wu1VjJ3DDJbbIJTqs/1maOWYB0pawFDK5Azl8zFE1PgK+J/6Gwhulo96878qwd
         Yr/m3bw74NlT43ch6M98avLY4owHqxyoPGpLiV1RgvwelMnnkN4FbUm4mH0jDlVrGVRj
         PwZWSE7KjqN6aI+zpQtOiHRwV9rCyFK56tupp1nfEY5FzU9Y1/z4zJzaPm08ffXTdFPY
         TpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703081329; x=1703686129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59F7K5RNi8wsdT3N0XNqdjgmsgxFVNgSxjJCoU/Uuzw=;
        b=kGeFNYes4YxQmk2sE9MYJmuB9pNjK3sqZjOuMlyVYoI8dlLfNeLjcp7MzycPo/SooX
         KT8buAFRLFbpbsLHsn+lqcL8A9eL33dk3zVxDfaW+vxlVV/Z88QW7bdPSBKd7vIFkn3J
         iRzyy/HF3YC3WZmA1Qhk3qf8kMbHymoCdQ/D+2mzBh0Mn+Celf8XJtGBIkWtd/FgrfCz
         9HORD63t/lTjcEYWeoIb6SfMC1DMk8JwT1B8Y7eyXJj/idJAl/t+vp2LuTzhnEH6bo/R
         JsM30Rx0BMl7vYjmZb4KodX7AMZiyvjfFUnUIqWWpyi8DzB/cLotLsEP/VCqBfPyZPCd
         zkug==
X-Gm-Message-State: AOJu0YyZ053wgw8bASt/LWDbT6m6r1hj9PDFHJHieIP0U2D7PS1Uqpir
	hjEApBLP/Geyf3uiRlEs0GYogJFeN2e2jQ==
X-Google-Smtp-Source: AGHT+IGCP8WMWEHDSvexERJdAvmNWIbOs1nV9wgHM3v5bA664gKzx0U2bnh8LKnfPqAb2V/IT34nqg==
X-Received: by 2002:a2e:a705:0:b0:2cc:3793:5575 with SMTP id s5-20020a2ea705000000b002cc37935575mr4954186lje.93.1703081328943;
        Wed, 20 Dec 2023 06:08:48 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 8/9] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Wed, 20 Dec 2023 16:08:30 +0200
Message-ID: <bc97ed58ba9118042ff60c2cb6edacf4f64419d8.1703072575.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
allows to avoid generation of empty <asm/mem_access.h> header
for the case when !CONFIG_MEM_ACCESS.

For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
and traps.c because they require some functions from <asm/mem_access.h> which
aren't available in case of !CONFIG_MEM_ACCESS.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Remove the way how CONFIG_MEM_ACCESS is disabled for PPC and RISC-V.
 - Disable the config in ppc64_defconfig and tiny64_defconfig (RISC-V).
---
Changes in V5:
 - Added dependencies for "Config MEM_ACCESS" to be sure that randconfig will not
   turn on the config.
---
Changes in V4:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/p2m.c                      | 1 +
 xen/arch/arm/traps.c                    | 1 +
 xen/arch/ppc/configs/ppc64_defconfig    | 1 +
 xen/arch/ppc/include/asm/mem_access.h   | 5 -----
 xen/arch/riscv/configs/tiny64_defconfig | 1 +
 xen/include/xen/mem_access.h            | 2 ++
 6 files changed, 6 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index b991b76ce4..2465c266e9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -7,6 +7,7 @@
 #include <asm/event.h>
 #include <asm/flushtlb.h>
 #include <asm/guest_walk.h>
+#include <asm/mem_access.h>
 #include <asm/page.h>
 #include <asm/traps.h>
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 3784e8276e..37a457f4b1 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -35,6 +35,7 @@
 #include <asm/cpufeature.h>
 #include <asm/event.h>
 #include <asm/hsr.h>
+#include <asm/mem_access.h>
 #include <asm/mmio.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
diff --git a/xen/arch/ppc/configs/ppc64_defconfig b/xen/arch/ppc/configs/ppc64_defconfig
index f7cc075e45..48a053237a 100644
--- a/xen/arch/ppc/configs/ppc64_defconfig
+++ b/xen/arch/ppc/configs/ppc64_defconfig
@@ -6,6 +6,7 @@
 # CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+# CONFIG_MEM_ACCESS is not set
 
 CONFIG_PPC64=y
 CONFIG_DEBUG=y
diff --git a/xen/arch/ppc/include/asm/mem_access.h b/xen/arch/ppc/include/asm/mem_access.h
deleted file mode 100644
index e7986dfdbd..0000000000
--- a/xen/arch/ppc/include/asm/mem_access.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_MEM_ACCESS_H__
-#define __ASM_PPC_MEM_ACCESS_H__
-
-#endif /* __ASM_PPC_MEM_ACCESS_H__ */
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 3c9a2ff941..09defe236b 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -6,6 +6,7 @@
 # CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+# CONFIG_MEM_ACCESS is not set
 
 CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4e4811680d..87d93b31f6 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,7 +33,9 @@
  */
 struct vm_event_st;
 
+#ifdef CONFIG_MEM_ACCESS
 #include <asm/mem_access.h>
+#endif
 
 /*
  * Additional access types, which are used to further restrict
-- 
2.43.0


