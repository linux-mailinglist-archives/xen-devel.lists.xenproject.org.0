Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F02724D8D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544190.849824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm9-0004Gm-GE; Tue, 06 Jun 2023 19:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544190.849824; Tue, 06 Jun 2023 19:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm9-0004E7-9Y; Tue, 06 Jun 2023 19:55:29 +0000
Received: by outflank-mailman (input) for mailman id 544190;
 Tue, 06 Jun 2023 19:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm7-0002er-2B
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:27 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1376451d-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:24 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f62b512fe2so3358224e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:23 -0700 (PDT)
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
X-Inumbo-ID: 1376451d-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081324; x=1688673324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh8BJIh+57sl7bOo0QhYsWa0pXdWsiCtmsxwnxt2RAU=;
        b=OSf8GtFqo2NuhZtcfIkC5FDn0ebuqJ1uQ7XzI6k3YI5keBWCuq9M2u4IyY7MPhvifJ
         t9P+Unj9Do1Vv0q570IxL+3snR23gk601FSsU5RGhzuSEZlMwRgfmMke9h2VcBD0d0Qq
         QAMaRW9r92Ind9Nued7KPU36F1bZdwJRmEodOIYP/Ck9DQ3HQ+W5Kqf/hJNVwsgFiBIQ
         NLahdPMnJ/xo1F+xZOb40fT5Zr2kvYPvnHZcrOZ0hTTahPclSVxkfkSsr0yhskFStN0d
         0iON0sDj0jujKz12uzRbavsPR92hompWo6Fj/neSMErhluLfIW6FyjycSBqYddpXa4EW
         Dwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081324; x=1688673324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh8BJIh+57sl7bOo0QhYsWa0pXdWsiCtmsxwnxt2RAU=;
        b=ibpWWxE2hkbEfwm1K1Liz4MRGgd1HPF78CcNa0a/QZ9IC+mi0fXR/9VyMVlOvxNJ8Q
         H+iHALOMqF8q0QIFOB6mK4tvTyOHB9u6dD90RgYDrDRTQfppXj1kQ8lQ1reDArKbxuvz
         gO7GtcAN6MOJ1nmA0AOh9s8gZYZjWdtC+yO5px5xidCPaDfKFJQIlRRBtkvvpf7eU9yl
         Jm3QtRnvA/QLv7sanPMHcNiESdaMoPsyp2srPFeTK1qJykKypyxUZRZwBLwmaDvfxwpO
         bGWEgjA33xtdeJqO66VIiSVhpZdmzsrnwk7aL88NC3W8hmdTbujMj3gJiKc9VRgd5Dj7
         +Uog==
X-Gm-Message-State: AC+VfDzvBK3Pe8EeEJ/t3MjC3nFTUpjN2NzMHSk+T0e5jKImbklo72SM
	XVvZa1N5mNHrK/PWRsC9Z7hRV6LSNQ4=
X-Google-Smtp-Source: ACHHUZ7ntaUUio4KqesGs58TcVUdN7fp9cmIMj6BHSnc/mxy+bAhUnPCb+zwH0hWVqW0u7H9Bk9iaA==
X-Received: by 2002:ac2:519a:0:b0:4f3:aa73:562 with SMTP id u26-20020ac2519a000000b004f3aa730562mr1307466lfi.2.1686081323644;
        Tue, 06 Jun 2023 12:55:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 6/8] xen/riscv: add SPDX tags
Date: Tue,  6 Jun 2023 22:55:14 +0300
Message-Id: <1034fa44a9b589a18f89b7849877c00ee0a362d5.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/config.h       | 2 ++
 xen/arch/riscv/include/asm/current.h      | 2 ++
 xen/arch/riscv/include/asm/early_printk.h | 2 ++
 xen/arch/riscv/include/asm/mm.h           | 2 ++
 xen/arch/riscv/include/asm/page-bits.h    | 2 ++
 xen/arch/riscv/include/asm/page.h         | 2 ++
 xen/arch/riscv/include/asm/traps.h        | 2 ++
 xen/arch/riscv/include/asm/types.h        | 2 ++
 xen/arch/riscv/mm.c                       | 2 ++
 xen/arch/riscv/setup.c                    | 2 ++
 10 files changed, 20 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 38862df0b8..3ae35f57b3 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef __RISCV_CONFIG_H__
 #define __RISCV_CONFIG_H__
 
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index d87e6717e0..b08f204df4 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
index 05106e160d..c11693bbe1 100644
--- a/xen/arch/riscv/include/asm/early_printk.h
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef __EARLY_PRINTK_H__
 #define __EARLY_PRINTK_H__
 
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 500fdc9c5a..3b04131628 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef _ASM_RISCV_MM_H
 #define _ASM_RISCV_MM_H
 
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
index 4a3e33589a..94190b3c61 100644
--- a/xen/arch/riscv/include/asm/page-bits.h
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef __RISCV_PAGE_BITS_H__
 #define __RISCV_PAGE_BITS_H__
 
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index a7e2eee964..8e8ec9ee36 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef _ASM_RISCV_PAGE_H
 #define _ASM_RISCV_PAGE_H
 
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index f3fb6b25d1..2e896e0913 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef __ASM_TRAPS_H__
 #define __ASM_TRAPS_H__
 
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
index 0c0ce78c8f..7505663efe 100644
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #ifndef __RISCV_TYPES_H__
 #define __RISCV_TYPES_H__
 
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index ab790f571d..b50641a80e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index c4ef0b3165..befbd07fde 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
 #include <xen/compile.h>
 #include <xen/init.h>
 
-- 
2.40.1


