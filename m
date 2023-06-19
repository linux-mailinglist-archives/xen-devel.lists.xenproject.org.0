Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8137358B0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551094.860459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF22-00025R-AQ; Mon, 19 Jun 2023 13:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551094.860459; Mon, 19 Jun 2023 13:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBF22-00020g-2G; Mon, 19 Jun 2023 13:34:58 +0000
Received: by outflank-mailman (input) for mailman id 551094;
 Mon, 19 Jun 2023 13:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AnRR=CH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qBF21-0000wG-2P
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:34:57 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135742c1-0ea6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 15:34:54 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b466066950so33046481fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jun 2023 06:34:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f26-20020a2e9e9a000000b002adb0164258sm5222236ljk.112.2023.06.19.06.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 06:34:53 -0700 (PDT)
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
X-Inumbo-ID: 135742c1-0ea6-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687181694; x=1689773694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5CVjF/hqhtai/8e3vIC1wUJzJlWbPdW3j0oBx5KVr8=;
        b=j6YcsFJs1tQo7uxgUdoGnDmykVVLTJzX1VQ93j6Te3N4W5L0Kir/FqkQPdQbCLZIUQ
         3NagYGigQKSR+DF0iSW75CnMxhLnMOZwBVhoLkoaRn1I/b5AZOBCg4aK3J3eXYCy4wVX
         u7IPRmFQ8BhFmpvio9BE0IdRag/ZhYz9A7Es9FR/rXKTuJX24v2TANYO248aD2FbypQO
         VNwkFMescN01bUZkMFjQT92FmTd984ml20I4umjcZU1GWPDOAaXjmY5hWFfuSM+mefJE
         kTw9IvEBephDuwt+vRE9pT54gYXEXkD3iY9Y0lwsMiJaR93sWT9TJogSprBrOSzIrqZV
         UmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181694; x=1689773694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5CVjF/hqhtai/8e3vIC1wUJzJlWbPdW3j0oBx5KVr8=;
        b=iVk2QdDLjBeRY/wRA1F9IcxpNgmv8T6tfQ/+pOhjtBR5R0nlM1B7qoFFhKXQw8EFw8
         LRKI4KCu1M0lqzcB1bAHkwrUO8HyaGURr5wHEaQovy+jh9njX7KnVK9F3uMz2CUpsxej
         oUgCJR1Xdeu7zBPSWaXhR+MHKnyqo6vnsHsA0uQGVyNDhLW2WDeZ9s+/fsqFyc8C4pHw
         JGRS7c6inev7aBHGG8OQSZFg6yMEeqAMUv4+eTMp0OuTOwv1Dw/l+eeleUBzMcBo28Om
         yrNXnrZ6cMr7Dp1w8UrKAPRC+EMCzLlZ0SsvDjMG8aYnBpiWcavTk83oiJEdbdbXS88a
         pf1w==
X-Gm-Message-State: AC+VfDxX5kr2342xhsP1OgJyJrK/DY8bKob2BXf/Ua+sG2ZPcnwTTSAB
	E7bSoAnZ0yPqDOOxiTZwc0N4iejY+uw=
X-Google-Smtp-Source: ACHHUZ6Jm/ZgYJwHq2MaQVAp6h+Ozy6XKDvbFPp0kkAXh/HL30m7RY6IVvCmgU3VQj8w0bau+tbKBg==
X-Received: by 2002:a2e:94c1:0:b0:2af:1817:26e1 with SMTP id r1-20020a2e94c1000000b002af181726e1mr6013828ljh.30.1687181693813;
        Mon, 19 Jun 2023 06:34:53 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 5/6] xen/riscv: add SPDX tags
Date: Mon, 19 Jun 2023 16:34:46 +0300
Message-Id: <19dfd66d1a446bf1f5cdccd74b7a64f56baa8f5c.1687178053.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687178053.git.oleksii.kurochko@gmail.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in V2:
  - change SPDX tags from GPL-2.0-or-later to GPL-2.0-only.
  - add Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>.
---
 xen/arch/riscv/include/asm/current.h      | 2 ++
 xen/arch/riscv/include/asm/early_printk.h | 2 ++
 xen/arch/riscv/include/asm/mm.h           | 2 ++
 xen/arch/riscv/include/asm/page-bits.h    | 2 ++
 xen/arch/riscv/include/asm/page.h         | 2 ++
 xen/arch/riscv/include/asm/traps.h        | 2 ++
 xen/arch/riscv/include/asm/types.h        | 2 ++
 xen/arch/riscv/mm.c                       | 2 ++
 xen/arch/riscv/setup.c                    | 2 ++
 9 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index d87e6717e0..d84f15dc50 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
index 05106e160d..85e60df33a 100644
--- a/xen/arch/riscv/include/asm/early_printk.h
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef __EARLY_PRINTK_H__
 #define __EARLY_PRINTK_H__
 
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 500fdc9c5a..3f694a43ef 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef _ASM_RISCV_MM_H
 #define _ASM_RISCV_MM_H
 
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
index 4a3e33589a..8f1f474371 100644
--- a/xen/arch/riscv/include/asm/page-bits.h
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef __RISCV_PAGE_BITS_H__
 #define __RISCV_PAGE_BITS_H__
 
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 22b36e03a4..95074e29b3 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef _ASM_RISCV_PAGE_H
 #define _ASM_RISCV_PAGE_H
 
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index f3fb6b25d1..3fef318478 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef __ASM_TRAPS_H__
 #define __ASM_TRAPS_H__
 
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
index 0c0ce78c8f..c2cdfd9caa 100644
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef __RISCV_TYPES_H__
 #define __RISCV_TYPES_H__
 
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 2693b817c5..663048c783 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index c4ef0b3165..6593f601c1 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #include <xen/compile.h>
 #include <xen/init.h>
 
-- 
2.40.1


