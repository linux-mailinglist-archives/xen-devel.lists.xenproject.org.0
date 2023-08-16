Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17B77DEBE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584471.915276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoR-0000dL-H4; Wed, 16 Aug 2023 10:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584471.915276; Wed, 16 Aug 2023 10:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoR-0000Zc-CM; Wed, 16 Aug 2023 10:31:39 +0000
Received: by outflank-mailman (input) for mailman id 584471;
 Wed, 16 Aug 2023 10:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdx-0003RA-1L
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e2f83d4-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:42 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3197808bb08so2361070f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:42 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:41 -0700 (PDT)
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
X-Inumbo-ID: 8e2f83d4-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181242; x=1692786042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nw6XWi8iLvVUaffgykiir1CEfHLlnE+6fW6zVZ1bFEQ=;
        b=dxEcjQviPNfbLKUBq+VfbDzrEjOejt+b0vgYEy2ej9G2ZIIuC2OS8t2vj4t0Mlyt/o
         1SeKIyt1FuEgxcH1glObVFjDsMlsREOSX475HeZTJOEKJhNJfRdcvgjYTUHDdmYpUVrJ
         TxEnI3dvowI6PT/f6TzfEkEyfR/LERhOnTlVoH7EO7X6tGLZhd9LLx476USFEs1GGOlk
         iV+FouZQdIe8qx3jFPmA1LbjOvkcGBb6PF+LKGSHRTi9rNouOnac75kYYrmpfL196lGO
         eLbdRvsnL13sABuKcgDhxo3voAlmp9A7TJGNiltOKYiCwOUTD0st8naCvPxoHZ1mpA1x
         23FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181242; x=1692786042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw6XWi8iLvVUaffgykiir1CEfHLlnE+6fW6zVZ1bFEQ=;
        b=IlaHakYqN6y4Y8Ltjs22qN1ue3GT9z0rdDetpdOedI62hygHvRVVBaPMipWLeez6WJ
         I2ozSAwJuusw05nFYDF7kX4gqGQvSmBOM62kyRR3FAogVEq5tTWFP+br27PJCQjOqHjX
         6QaAFCVASn+eA5sUla+LgrWS1PDWQO27fe2WP8DanhbuVbmzuyR2j9vahnEtq+n6DdRL
         euN6sQ3mSkx5K9Kbj0xHTzyvwWZFA3T39NACARO9Xjo4QIrsTSOgp0TYaUQbLpRyXZPe
         p1LglVCFiW6/meYE6cswXs8djvze1EHlR72JZpysjBvl83kxsWUU39K+bvlwerELpsly
         K+Hw==
X-Gm-Message-State: AOJu0YxUlesL0ih7ICj3+C5vFl4DoVscuimlG+0LbZsmsRZ4h2bihbD7
	ba/ZirwBsL9YIuYyYffPSPJXkRhkVYnTy64x
X-Google-Smtp-Source: AGHT+IEbS34MImoPRNl8aljhie/xx31EHhXK6IIy6ElbXhpKsYXVzlLrbnAlrHjl2SWcV76/KraYMw==
X-Received: by 2002:a5d:456d:0:b0:315:ad00:e628 with SMTP id a13-20020a5d456d000000b00315ad00e628mr1059194wrc.47.1692181242121;
        Wed, 16 Aug 2023 03:20:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 33/57] xen/riscv: introduce asm/altp2m.h
Date: Wed, 16 Aug 2023 13:19:45 +0300
Message-ID: <25e873b11f42bcde65494367ecb022a5f5e04564.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/altp2m.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/altp2m.h

diff --git a/xen/arch/riscv/include/asm/altp2m.h b/xen/arch/riscv/include/asm/altp2m.h
new file mode 100644
index 0000000000..dc72a624f6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/altp2m.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Alternate p2m
+ *
+ * Copyright (c) 2014, Intel Corporation.
+ */
+
+#ifndef __ASM_RISCV_ALTP2M_H
+#define __ASM_RISCV_ALTP2M_H
+
+#include <xen/sched.h>
+
+/* Alternate p2m on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    /* Not implemented on RISCV. */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented on RISCV, should not be reached. */
+    BUG();
+    return 0;
+}
+
+#endif /* __ASM_RISCV_ALTP2M_H */
-- 
2.41.0


