Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9AF7EF291
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635125.990991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuF-0004b0-Qx; Fri, 17 Nov 2023 12:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635125.990991; Fri, 17 Nov 2023 12:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xuF-0004R6-B5; Fri, 17 Nov 2023 12:25:07 +0000
Received: by outflank-mailman (input) for mailman id 635125;
 Fri, 17 Nov 2023 12:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3xuC-0000iK-Mu
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:25:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55588d98-8544-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:25:03 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50a6ff9881fso2809283e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:25:03 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac25e72000000b005094d95e8bcsm209811lfr.218.2023.11.17.04.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:25:01 -0800 (PST)
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
X-Inumbo-ID: 55588d98-8544-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700223902; x=1700828702; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGLHKG6to9Zisdv7aexs3y4v8t2ouBEO3ihJtRG23GQ=;
        b=Jt9XqxXfzI8nlqOL2J8CC6cYViSQpwxIq45We/fVKF97fG7P4H/M+R+S0yB6y5bySE
         BvvhI6NRo6KgpcsJ/2jBvLQCR09Rh0gljK3da6RdGk6X3AMLgnEoLBtYRyHGtwwMfb6F
         pEX3XEVqa297B2lGcvM+PGcF3AVWDAHrn2WwuuRnbbJxGTRFQTPr4vhr0rodFJ7aLLEp
         i7MgeLvJCM+mIZhYvMi2I1kjN6UfTdbFqZDrCaoPmRECDCXrKJ6sA3ceuUKqJS/XOYN7
         Lom29jfkK1z7Bzi74XqKMWv9xYzJN+uOazu63rbiEQSjs1WOrdyMr/A47IgaQknHZC47
         f1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700223902; x=1700828702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGLHKG6to9Zisdv7aexs3y4v8t2ouBEO3ihJtRG23GQ=;
        b=YZFKc/ypUcIFIjVZKFnKUZO+UBDdURcoujd0d/48Pbx2LMYsdHinUbMzkr9H5qT3Vl
         O1DmgmKB6EcUmTiV+vvubiFF+fT6BJ05aBAr2KnAtFXL/7e3IwK+IL6aryay83f/5TBY
         yPYyt3H2M22cxI/oTTFy2ht3I1K7N8KYN0UkHiT/B7knyPwXIWZT4FBGGRxbwlr27M5j
         GqWFhPGXJQGxodcf/sUaPPvx2Svku/5s3WKHl5/ar3Y6LEj7LGwe2gpJjTCF9H2kM3LC
         rJ4ZxPFDEaIEHBjbz4/VdFb4ATmzTl4ivKvLlT0cCYNF2uk5goS3FHqPz84IzOHzTsvX
         l/0g==
X-Gm-Message-State: AOJu0YzR6HdmLX9j1j68T40Gjj2Mz9O8w4LbxM+10btZHV1PqzH2ZVeZ
	Ifo/MrA3CgauCo1s5RIcNB+0os6nMqg=
X-Google-Smtp-Source: AGHT+IFjh6wlNjIdIr5T/LlRtXMPbxEloY6iPAfFEpgECpLHz6O4PtpUnBRcyd5hbT261qKOY6VhOw==
X-Received: by 2002:a19:8c10:0:b0:50a:9652:31d4 with SMTP id o16-20020a198c10000000b0050a965231d4mr6074727lfd.22.1700223902364;
        Fri, 17 Nov 2023 04:25:02 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 14/14] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Fri, 17 Nov 2023 14:24:38 +0200
Message-ID: <12178d67c5e711723bfda55b3f79287f18231282.1700221559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1700221559.git.oleksii.kurochko@gmail.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
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
Changes in V3:
 - Remove unnecessary comment.
---
 xen/arch/arm/p2m.c                    | 1 +
 xen/arch/arm/traps.c                  | 1 +
 xen/arch/ppc/include/asm/mem_access.h | 5 -----
 xen/include/xen/mem_access.h          | 2 ++
 4 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/mem_access.h

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index de32a2d638..b6ea4480a0 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -11,6 +11,7 @@
 #include <asm/event.h>
 #include <asm/flushtlb.h>
 #include <asm/guest_walk.h>
+#include <asm/mem_access.h>
 #include <asm/page.h>
 #include <asm/traps.h>
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ce89f16404..b720b49dd2 100644
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
2.41.0


