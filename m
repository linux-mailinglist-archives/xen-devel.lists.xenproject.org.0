Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1877DEBA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584460.915243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoF-0007Ao-EO; Wed, 16 Aug 2023 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584460.915243; Wed, 16 Aug 2023 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoF-000759-7k; Wed, 16 Aug 2023 10:31:27 +0000
Received: by outflank-mailman (input) for mailman id 584460;
 Wed, 16 Aug 2023 10:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdr-0003RA-0J
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:43 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bbf01ba-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:38 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe45481edfso64405875e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:38 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:37 -0700 (PDT)
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
X-Inumbo-ID: 8bbf01ba-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181238; x=1692786038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LCHRZgc+hBy0s0HZAJ5FU9CXl325alrh/h/y5fRpu8=;
        b=q8QUfkMLEUWB1AYlkq4TxKJf7NFUWjFM2Q9Srg5YPyd8CF3ZT8zxo9MYDIQJHHvccz
         UBATxehA4wcetyVaY/oFFqCfnYkpRLTuejqpnnPf/TaH47ap2RPK3K2zvzk2T96VYyoS
         StN/3C2To+npLOV3a68sEMiwZGKc/wyEbH5anXc4glsLNdrYHtGYbl1GXg/3MRMxQqk/
         E+B7usiTxcMRbk8AqlGz+9pBT2fkyDXXKBbl/OdzQMSGsGpsgHj+qzlL6F91iny2kEab
         SxZapnH0DvrDVA2aEb7bvYPd0aJtyPZ6XUeqwivyr8tzglQuhW37+ZsebQ+nQxOHrGPW
         vCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181238; x=1692786038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LCHRZgc+hBy0s0HZAJ5FU9CXl325alrh/h/y5fRpu8=;
        b=F4d0ZhdzrItH+9gu9BJuh8KfMRzpbFw3Oc1X+sCajTA1yKJdpGYRG4M3RzVuXCn458
         9ZaBlmD63UEywcso2OxHXX3FUI8hKQbra3VctHMP1/JyK3PHxwecWv+Io0+fdjhjuRQp
         V3ACAOsudwNbf+XNRugtYm6wv0UIJiR3esQ18uEaJUxI9wPfnXMz0yaUFbYWX/4KHpH8
         VX6s1anibvRUzP6I5qMd2k5IMeyzPdakcLxMrbgScMfT9SMOkH9EGOEjAPmuIr8vpNY0
         0JkneAUCeTHUiQIEH0ZQnOrRtESiNvAuwaj4OfEIbKvpRM2MV1UFbh/dOQeDNpwaBxTt
         JvYA==
X-Gm-Message-State: AOJu0YxskWhlCNwMtrkXASfl3RB7M6xXdplNEHZMhvq7RBFmDq7esCRo
	cKJ7UNXZJ/FOxwcSV4+oLlfYDA73Zzik7bIH
X-Google-Smtp-Source: AGHT+IGeJTYa8pABFegJPQdgIkMQmx3BC1J499yObXqgc93yhTi+MIemhshAphZSQQUm/xJeOV/uNg==
X-Received: by 2002:a1c:ed13:0:b0:3fe:1446:6047 with SMTP id l19-20020a1ced13000000b003fe14466047mr1048599wmh.23.1692181238058;
        Wed, 16 Aug 2023 03:20:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 29/57] xen/riscv: introduce asm/hardirq.h
Date: Wed, 16 Aug 2023 13:19:40 +0300
Message-ID: <b36444b3cdaa47b14a7344615eb30fb81a72ad43.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/hardirq.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/hardirq.h

diff --git a/xen/arch/riscv/include/asm/hardirq.h b/xen/arch/riscv/include/asm/hardirq.h
new file mode 100644
index 0000000000..467421849a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/hardirq.h
@@ -0,0 +1,26 @@
+#ifndef __ASM_RISCV_HARDIRQ_H
+#define __ASM_RISCV_HARDIRQ_H
+
+#include <xen/smp.h>
+
+typedef struct {
+        unsigned long __softirq_pending;
+        unsigned int __local_irq_count;
+} __cacheline_aligned irq_cpustat_t;
+
+#include <xen/irq_cpustat.h>    /* Standard mappings for irq_cpustat_t above */
+
+#define in_irq() (local_irq_count(smp_processor_id()) != 0)
+
+#define irq_enter()     (local_irq_count(smp_processor_id())++)
+#define irq_exit()      (local_irq_count(smp_processor_id())--)
+
+#endif /* __ASM_RISCV_HARDIRQ_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


