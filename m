Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E587D347
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693998.1082804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBx0-0000m1-2f; Fri, 15 Mar 2024 18:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693998.1082804; Fri, 15 Mar 2024 18:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwz-0000YZ-Kd; Fri, 15 Mar 2024 18:06:37 +0000
Received: by outflank-mailman (input) for mailman id 693998;
 Fri, 15 Mar 2024 18:06:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwx-0005yV-3o
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:35 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1b87cda-e2f6-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 19:06:33 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d228a132acso33502901fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:31 -0700 (PDT)
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
X-Inumbo-ID: c1b87cda-e2f6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525992; x=1711130792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zff6ossjNgY8dZpXRlsy8KdZaJuDQAMnmaMaUR1g5PM=;
        b=fZ3Ab2iIZWUUqT7ZvWrOa/LCIkdH0+Io7bNlY+GkV8o8pov/BU7GOGg3/nVWo1u02b
         EI/EyxFxqi8cABALvNdgvDNy2fNvv+2Rkq4N/7A6AnvgulfLzsVA9jeIOnLytgKnc70P
         5D4mmUfU/TBiIqO/HGpH8IKESDjoCg8NVTDcVC8MKeMtNkZBOFVryx1NXDJ5Q1tsFDcy
         9Iep+RnfdLhrxAj3s8hkSrhtJx8hmGtqCO4H/UZkBnEFqEFD7ZN6yQZXBi6UD0rHFsls
         oZxV438HWcuC2RjrvvornLnXV+4jJJGj9yEAEODyOMg5nmNebT2J7uh4rh1i+8uR2Pj4
         7PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525992; x=1711130792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zff6ossjNgY8dZpXRlsy8KdZaJuDQAMnmaMaUR1g5PM=;
        b=HyuqK+nKXxX+Ohl6VMHvoxpNzuTmHzNsVc59ipqzGckTpkj7Oryv2wNWkNs6ysR5Tx
         5QAvcSN2YZ30+oydGo5gBdT2NvCYTT0M0tiSbdIugjoFf4i/jmYSbv3IICBBLc1Qe3Pw
         ztfxqtf1PYwrINY9RWYI9rhkCVbLT773PSi/EqAuicgLU4zoStsyMJrjcUagL/ZbKnQE
         sxAXuT+w54f/0q16uJCbJpP11/NiEl4ijVPlkUuSesiKxqoixQrGWnweQdVe4QuntHvM
         EKpkAgabFT2tE5tmJ3sPUmRWnhtEfHZoHTi4irbmmh5RoADqxFAx82hzZHgitlmG3hGC
         V40w==
X-Gm-Message-State: AOJu0YzhibP+X0BADT3nEcls9vJMVve4EtITUPFagtHXmNWYvl9tz4ZO
	V7iGX6ZY/qJHoU9oihwW4isEzdfiPPnp49xl+sGxRncsNs6DSO9Usos9Bpg555c=
X-Google-Smtp-Source: AGHT+IEHppgqCqzxoUIQjpZcPx03Rnt4Bd6d0FbIAWy1WybZeWZ+R967IHgDrTEmv0xEfL5fD5+Bfg==
X-Received: by 2002:a2e:a592:0:b0:2d4:6815:fc6f with SMTP id m18-20020a2ea592000000b002d46815fc6fmr4449587ljp.30.1710525992115;
        Fri, 15 Mar 2024 11:06:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 11/20] xen/riscv: introduce monitor.h
Date: Fri, 15 Mar 2024 19:06:07 +0100
Message-ID: <376e3ba3087b4d5d71ca20804abb33129f75bd5b.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4/V5/V6:
 - Nothing changed. Only rebase.
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/include/asm/monitor.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/monitor.h

diff --git a/xen/arch/riscv/include/asm/monitor.h b/xen/arch/riscv/include/asm/monitor.h
new file mode 100644
index 0000000000..f4fe2c0690
--- /dev/null
+++ b/xen/arch/riscv/include/asm/monitor.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_MONITOR_H__
+#define __ASM_RISCV_MONITOR_H__
+
+#include <xen/bug.h>
+
+#include <asm-generic/monitor.h>
+
+struct domain;
+
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+#endif /* __ASM_RISCV_MONITOR_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


