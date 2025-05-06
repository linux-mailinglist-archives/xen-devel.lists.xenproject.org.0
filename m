Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1CAACB86
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977622.1364625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWW-0006NQ-R5; Tue, 06 May 2025 16:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977622.1364625; Tue, 06 May 2025 16:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWW-0006Jp-M2; Tue, 06 May 2025 16:52:04 +0000
Received: by outflank-mailman (input) for mailman id 977622;
 Tue, 06 May 2025 16:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWV-0005Fd-CC
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:03 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e97b02a-2a9a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:52:01 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so9110650a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:01 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:00 -0700 (PDT)
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
X-Inumbo-ID: 6e97b02a-2a9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550321; x=1747155121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyH7+jYUX1HojA9xgArUa6tCu0OjPcD2ug7vub4dMik=;
        b=GENtsU4FRYgUvlOcNdU0wKOW4uzsiaIHUu2TotLCeVh8O/qLEPyKQFA6ZkjvM/57Tz
         YniyiUl+Yd69PMsPOTVlvLl5UQXkEM62BF1i8pIuwtF2dZHb9ExDq8BuCKdybpvexv4Z
         2yQsMo/T0f1iUsxoe4Maox0/nimzfzzuOPxwtKwoqDpI//R71Xx+vjoF/olgWX4Gb4eh
         qPt83Mea0owFaJqMMTbX+liF9QEcY8C8KR3mjKZmcraByaCDdG0vi67jc2T1lgmCEiXV
         v2m4MA4npMOd5dkJswQ/kUdCPVqVN3A5nMqm0ffBbtrN11XfCMeuQF5Ipe5slU5tv5MR
         MEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550321; x=1747155121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyH7+jYUX1HojA9xgArUa6tCu0OjPcD2ug7vub4dMik=;
        b=SEdQdkvKQtSi72nbJyy9TWCg4qhetigczwvXMOsRAEYTrgNdRXavEzNaXLeQDE7ZRJ
         RQQ8AUEt8j/7IdNtwvgR/OvehK44kmGWNL3K6ueUNGDr+VnuxFBM5BWS2h8tSInGJ+P2
         RE1vJ+OqAIqTL7skhU6G8HY4TC9wLZvja+peYp9VweQRDzUgMvRTyfnpOcgDgtq7foTM
         ewlFM0qx6uZ6KRz8xST0BzCakMC0pDokdAtXntFlVZTQDtRnWzDmQ6NsekhCVcLiCPBQ
         vijETvnNlLvBKZBqY/L67hF2nAETz17bzoDeOYiy95ntOGTqZK21/DB/rz64BYT7+XeW
         KX5g==
X-Gm-Message-State: AOJu0YxjoUOgsPO7d7CRnhQeEVt4B7GjykazkMCVEBlYViIYyYyz9Q9Y
	wZYdgTLbIylthd14fDyZIb8gqgQn+n/+bwVF08F2cHKlMOnZ2gCjl8DF7g==
X-Gm-Gg: ASbGncvEs8xfwYRFOSXbT5zwEeBv4MM/WfLL/TdaSVYGe6CyBHejUASLjXORv4RbFzU
	prgbxq0+eVOz2bfAvMm1vVKCSiayeX+5+ISgvZG+32i3ByU9C/W6trSQSmyq1Nxjsu4GQ8CUaFs
	bCIMY4pZkC0ovkyITblPHJptjvyQAhY0oJnNqtopdqftV4xRBu6FoopwlqQw8C2kmcvOucNqaAY
	vX4cypA9vlikse+AHJ3zuED89r00n+l3psSTLBIKKTXubvGuDwgzca+uZAHE72OXX/o9TpTnHr/
	DxuIf+kuf0zVmx+MAyo7PhBczmj4JDmNp1dhknxNliGcuL4P7bvYgJdkt5fWdt23JRDZQ6+iKzj
	Z0L23kx6gjw==
X-Google-Smtp-Source: AGHT+IGGmxCuy3frsT81IH5iVwWAXyfW7soT6GVZbGd9aCkHofw5Csv2YIhMKzuXyZSLhlpIO1JLsQ==
X-Received: by 2002:a17:907:7da5:b0:ac3:48e4:f8bc with SMTP id a640c23a62f3a-ad1e8d54c0dmr14428266b.48.1746550320907;
        Tue, 06 May 2025 09:52:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 05/16] xen/asm-generic: introduce asm-generic/irq-dt.h
Date: Tue,  6 May 2025 18:51:35 +0200
Message-ID: <35c68e57e5348c6610e030890802e967f6be4230.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce defintions of IRQ_TYPE_* which correspond to the Xen internal
representation of the IRQ types and make them the same asthe existing
device tree defintions for convenience.

These defines are going to be re-used, at least, by RISC-V architecture.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - new patch.
---
 xen/arch/arm/include/asm/Makefile |  1 +
 xen/arch/arm/include/asm/irq.h    | 15 +--------------
 xen/include/asm-generic/irq-dt.h  | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+), 14 deletions(-)
 create mode 100644 xen/include/asm-generic/irq-dt.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 831c914cce..87c8821421 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -4,6 +4,7 @@ generic-y += device.h
 generic-y += dom0less-build.h
 generic-y += hardirq.h
 generic-y += iocap.h
+generic-y += irq-dt.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 88e060bf29..fce7e42a33 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -4,20 +4,7 @@
 #include <xen/device_tree.h>
 #include <public/device_tree_defs.h>
 
-/*
- * These defines correspond to the Xen internal representation of the
- * IRQ types. We choose to make them the same as the existing device
- * tree definitions for convenience.
- */
-#define IRQ_TYPE_NONE           DT_IRQ_TYPE_NONE
-#define IRQ_TYPE_EDGE_RISING    DT_IRQ_TYPE_EDGE_RISING
-#define IRQ_TYPE_EDGE_FALLING   DT_IRQ_TYPE_EDGE_FALLING
-#define IRQ_TYPE_EDGE_BOTH      DT_IRQ_TYPE_EDGE_BOTH 
-#define IRQ_TYPE_LEVEL_HIGH     DT_IRQ_TYPE_LEVEL_HIGH
-#define IRQ_TYPE_LEVEL_LOW      DT_IRQ_TYPE_LEVEL_LOW
-#define IRQ_TYPE_LEVEL_MASK     DT_IRQ_TYPE_LEVEL_MASK
-#define IRQ_TYPE_SENSE_MASK     DT_IRQ_TYPE_SENSE_MASK
-#define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
+#include <asm/irq-dt.h>
 
 #define NR_VECTORS 256 /* XXX */
 
diff --git a/xen/include/asm-generic/irq-dt.h b/xen/include/asm-generic/irq-dt.h
new file mode 100644
index 0000000000..5ec46da533
--- /dev/null
+++ b/xen/include/asm-generic/irq-dt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_IRQ_DT_H__
+#define __ASM_GENERIC_IRQ_DT_H__
+
+/*
+ * These defines correspond to the Xen internal representation of the
+ * IRQ types. We choose to make them the same as the existing device
+ * tree definitions for convenience.
+ */
+#define IRQ_TYPE_NONE           DT_IRQ_TYPE_NONE
+#define IRQ_TYPE_EDGE_RISING    DT_IRQ_TYPE_EDGE_RISING
+#define IRQ_TYPE_EDGE_FALLING   DT_IRQ_TYPE_EDGE_FALLING
+#define IRQ_TYPE_EDGE_BOTH      DT_IRQ_TYPE_EDGE_BOTH
+#define IRQ_TYPE_LEVEL_HIGH     DT_IRQ_TYPE_LEVEL_HIGH
+#define IRQ_TYPE_LEVEL_LOW      DT_IRQ_TYPE_LEVEL_LOW
+#define IRQ_TYPE_LEVEL_MASK     DT_IRQ_TYPE_LEVEL_MASK
+#define IRQ_TYPE_SENSE_MASK     DT_IRQ_TYPE_SENSE_MASK
+#define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
+
+#endif /* __ASM_GENERIC_IRQ_DT_H__ */
-- 
2.49.0


