Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D213883DDBF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672092.1045786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLR-0003Xl-DV; Fri, 26 Jan 2024 15:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672092.1045786; Fri, 26 Jan 2024 15:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLR-0003VQ-7Y; Fri, 26 Jan 2024 15:42:17 +0000
Received: by outflank-mailman (input) for mailman id 672092;
 Fri, 26 Jan 2024 15:42:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLP-0002k9-J9
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:15 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a4d0ba9-bc61-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 16:42:14 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51021ba75edso624467e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:14 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:13 -0800 (PST)
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
X-Inumbo-ID: 7a4d0ba9-bc61-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283734; x=1706888534; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiIkhTp0Ki6vQDdcTozvmRdsu4x2izraQMAOShMyo6I=;
        b=CbxugwRaC9voWQ/OpznBtGC1d8JqSsqtvg7NmGIi/XMZesoMh+usPy3yFtwi+OTtEb
         qAyCjBSjdq9l83fgCRfSv2DBwszKyQDJ1ZG+mLudPGQBWyB0EC7QJA9toRsa+vtAoXhx
         26Lg11Jco7s/j7v0wPGB6oXnSPqCDwRh7ln4fQ4/nc+Wd18BUSrGcwBl6lUrtHNhQXqh
         kvSY8nmm1rZS76K0KEFELrCRQ1Lsi6ln/wBlSGJECWEnaXYv3wGSN172gEwMO5oPtUyt
         iAID87cyI7Hvg/rtjCl94/O1doxucOH/lcS5u9eXIfgIebho7U15R8CI4ij0I7A41Ie2
         C4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283734; x=1706888534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiIkhTp0Ki6vQDdcTozvmRdsu4x2izraQMAOShMyo6I=;
        b=ct36k4+qXVPM7/vdnUSUf9A9DPuVWjhb6ypZAVl+86EeTT3H1p1z5Xvu67Z6tc8M4u
         ZQ4V2wHJXSoKWF++cegUcCaun7KP3PV7T3dwnU40h+tfqd2pB98Sikm5qjlLjn7Mf5IF
         Z0UUMRdNhj3mkZQjeFz0wPfP8WC6pNp1qpfb/6c9MOcrXFpXATdDZMdmBasNgwdkFpZr
         q+1/Yv0l+f4EW1L0DAjtcN6aGw01ZtxRITbdyXGA0fW6ro4OClUz/TE9tVBbelKmcFvZ
         5BckSyyzAYxy9idqLZfWl6GLjznGLoeoS8CMyM2LmPjZXSqQYwdTQONs/9OZLtIlRDHw
         TSSg==
X-Gm-Message-State: AOJu0YyaSALKoWSPKgS+XBdKNi0QnLA8E9lt+/zdgwg8QlvMPt5tXL7C
	JEp554fbKyGNoJKRSUN/RakY9jfte6MHjKgVd+UAoWSeUM7aY+CwKK9iQiZf
X-Google-Smtp-Source: AGHT+IHktIAD+lMcXxk2xM244NybPcZDevc44vTzmfQCMHnEFiX4MqYR1ljD+yj/CMp+vgjVz6F3/Q==
X-Received: by 2002:a05:6512:3b89:b0:510:150e:62a7 with SMTP id g9-20020a0565123b8900b00510150e62a7mr894338lfv.113.1706283733878;
        Fri, 26 Jan 2024 07:42:13 -0800 (PST)
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
Subject: [PATCH v7 4/7] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Fri, 26 Jan 2024 17:42:04 +0200
Message-ID: <30c450ef4141656724b03adcc292fd1ac4b635b6.1706281994.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706281994.git.oleksii.kurochko@gmail.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
 - Nothing changed. Only rebase
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
index 9c10e8f78c..8ddca643d4 100644
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


