Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF34857CCD
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682188.1061294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV3-0007JQ-U8; Fri, 16 Feb 2024 12:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682188.1061294; Fri, 16 Feb 2024 12:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV3-0007Hs-Ql; Fri, 16 Feb 2024 12:39:29 +0000
Received: by outflank-mailman (input) for mailman id 682188;
 Fri, 16 Feb 2024 12:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV2-0006oJ-Rv
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c9484dc-ccc8-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 13:39:28 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3d159220c7so98511866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:28 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:27 -0800 (PST)
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
X-Inumbo-ID: 6c9484dc-ccc8-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087167; x=1708691967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9oJ766LbpEcU1AnuyDzWxkmbkR4vj0ev3jWEPdVTr0=;
        b=T6AbBBqzW/PkbkoMPR8SFC82svWHO2/Y+EYjo3vVDMzknTETV7wMcY4Xw2gbxL+9Ew
         XVmA2qKPCd+E0jqkjyg05l0mSVl7+/yt+bZrcfI+viAcelxtgNEHd7qAZjBdn/pYp1bW
         T2NSPhQtOMAr8TuShDeFjxRQ8/f5VcCtIdo1U8Dd2sbYW75v2reB3U5WtYm6uw/sOd6T
         y1XZiOHKkI4s6wgcEcoKTmKCVYrT0RqTM1KCvHaAoIektZVWSirOfXeOxgAeLorIHaZW
         wWwEmMZ02e6Gsi6MUMwRaeaIZfeejzvAP/miCXwI7GJB95dLF8f2hZ/hwn8dCGPz0Dz7
         0KpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087167; x=1708691967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9oJ766LbpEcU1AnuyDzWxkmbkR4vj0ev3jWEPdVTr0=;
        b=w7fqXimy4hKSUeecbzJZBNWgqvLN2RK72fxYNlOEgfmp6hANPhwcBWneu0h8u4Zigv
         8ILWsx+JD/09++RaXjmI4CMi8HiFpNuXFdVPlqsA4v9G6gYEJXt2GdMBzq/2bjVgE6j3
         wvsTwoRZlBcbmooaFU2ea98O0+iMArPfGby7gs3hiK2Op+L9D0LXWo0qFP2fh9QBeuzA
         8l6LVvL/FCJcTRgDK02hWosYKBHTZFZtUX3wiaJNFfwzDC6CtLb83cFzXgfDl7U0RQyP
         Y1EAsZYplilOSLYeBR3g3G82arrF3xDLGRT4klo+9GdEzop6V+IUOlUlkOPvdd3F/Igu
         mb7g==
X-Gm-Message-State: AOJu0Yysxa7Uk62yVqWTx9sbzMpFcfbNPPaBf0cPcybKyiQ4RiuG+BsR
	jJrIo4iUJm4R3eJCA3+U+qRLy2bqMZlVoqsLLeMF3ag6RCJrMJSQIM7UBNDw
X-Google-Smtp-Source: AGHT+IFCVznff4oPa0Fh9bza1Xg0r9lv4O6Pdop5CWcmfw+tuMLxmqeMJ9Wsk4s405FP8s0ldCM8Ig==
X-Received: by 2002:a17:906:4ed0:b0:a3d:fb76:cdf5 with SMTP id i16-20020a1709064ed000b00a3dfb76cdf5mr318024ejv.68.1708087167626;
        Fri, 16 Feb 2024 04:39:27 -0800 (PST)
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
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 3/7] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Fri, 16 Feb 2024 13:39:15 +0100
Message-ID: <a61ba4ef7345ba1ff5025f48421de69b20e44f45.1708086092.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708086091.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
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
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V9:
 - Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V8:
 - Add Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
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


