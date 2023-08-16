Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784277DEBC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584463.915256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoH-0007jB-Nt; Wed, 16 Aug 2023 10:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584463.915256; Wed, 16 Aug 2023 10:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoH-0007dm-Ji; Wed, 16 Aug 2023 10:31:29 +0000
Received: by outflank-mailman (input) for mailman id 584463;
 Wed, 16 Aug 2023 10:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdz-0003RA-1n
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e9fc57a-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:43 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-319779f0347so2468998f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:43 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:42 -0700 (PDT)
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
X-Inumbo-ID: 8e9fc57a-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181243; x=1692786043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbXnYw2fTYXK3djjpoxGKgmG+n8yHQR2q+sqVdKD3LI=;
        b=oHh4cxPQAzxKfe/pRs+V7lFBEkRRgJpyD6is7QX9FNqnTP9nMIJO2fX13HRYTadmMV
         O24PlCv2dVsjHXDqA8Px/9uTJTmyKYkwKUcU08eVnsSa5Tkt6RUVLH29NevwH8mSvzCN
         8wB8Y6uWnkLLsDz2ckBshBwMDeSJR0xTMusWlqQh7JSqCV4s7Lb0C/wA+gsqvLDZmVaM
         upgQUGFz2MAfRQTkbeAFCvCdptg65norp4n39fGjwpQ4BdELlWDlVz0W3Tkf/Z5eNDU3
         rnl4P0ZSYtqGmyYOZ2DoFrkvHcNnbLFe1N3UOKuVjiKtXcYKisVwpUHB6sKdCMrzaQG9
         GMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181243; x=1692786043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbXnYw2fTYXK3djjpoxGKgmG+n8yHQR2q+sqVdKD3LI=;
        b=k0S+IJjAUZu8xp6eJxBM3NSOX3wkCklxkH3P3WlX7wCgYXaANuAtB+7/g7GFU6dSG/
         tKCoW740WHTgme6RmjiwKyC/0z13idmxZAaVJflevDrIQfNIhcpYetc52OZB9FYZEwJu
         UD555QY0JwzR/iFDy7s8d7K13fVd9/89SOVKQWhF6Hx+hQ1bolkDfoI+X5GWHbWA5bep
         TX62XbbuZ9H8IvM7nm6lKMhJFcPPxBK+kGhY5zRMC9kOWK+HFadNMpm+X8vLBlBR7s9N
         Um5JaE3zYAqeLPFXKTLe7/Mf4A7HVq0W99bqUX7fYetCPx/beO7jWSK7UuWS/ochwCmt
         HCRA==
X-Gm-Message-State: AOJu0YzN12GFXzE+JRUs3+juW1Z7NFDWqEOMDIcqn3XJ9F8htaJCTlQG
	WBL2Ysyvy2sTlc0X7mNAAkwBfOGR3HQgB3T5
X-Google-Smtp-Source: AGHT+IE+CBCS+UtMfG6Ir0hhMUgEClxsv0FemiwDCeU+577EY8cOG72e3Iwikgh9dowwuLjxJCUDIA==
X-Received: by 2002:adf:cd06:0:b0:316:ff0e:81b6 with SMTP id w6-20020adfcd06000000b00316ff0e81b6mr1441650wrm.32.1692181242884;
        Wed, 16 Aug 2023 03:20:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 34/57] xen/riscv: introduce asm/delay.h
Date: Wed, 16 Aug 2023 13:19:46 +0300
Message-ID: <02c9ae872feb85cf3d384f0504c6af7040f97c7e.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/delay.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/delay.h

diff --git a/xen/arch/riscv/include/asm/delay.h b/xen/arch/riscv/include/asm/delay.h
new file mode 100644
index 0000000000..40370e381a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/delay.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2016 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_DELAY_H
+#define _ASM_RISCV_DELAY_H
+
+#include <xen/lib.h>
+
+static inline void udelay(unsigned long usecs)
+{
+    BUG();
+}
+
+#endif /* _ASM_RISCV_DELAY_H */
-- 
2.41.0


