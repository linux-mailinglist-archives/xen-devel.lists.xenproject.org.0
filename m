Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E067A76E7C9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576303.902270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX57-0002vW-Dx; Thu, 03 Aug 2023 12:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576303.902270; Thu, 03 Aug 2023 12:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX57-0002sr-BA; Thu, 03 Aug 2023 12:05:29 +0000
Received: by outflank-mailman (input) for mailman id 576303;
 Thu, 03 Aug 2023 12:05:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEIV=DU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qRX56-0002sb-6b
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:05:28 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08974c9d-31f6-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 14:05:27 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe48d0ab0fso1506314e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 05:05:27 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e22-20020ac25476000000b004fdfefdf4acsm3304557lfn.39.2023.08.03.05.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:26 -0700 (PDT)
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
X-Inumbo-ID: 08974c9d-31f6-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691064326; x=1691669126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+DU3kYIXVYlczgnjPIgAblT5y0PqecHU2rZnswjn2g=;
        b=QpM/5DX/BO83ao1VktAURaEd5vCgzt+w0XxW1EJmZXBfkcFVuYv39XZXGen2V/W4T0
         tGVUo5RgkpDe4TE2w+dlXerXCXb8ZTG60Rf1Xp4Oep2MG4X5l/PLahyMovcjcZlONjtk
         BqEQgZBg2fzjkK8GQ1QYllV7nixVPOpRM/MzlfMspE00SQIuskK9asiii0eAkBrluog6
         Ohy+t7XsnC/3L0iDYVdEbl5hTNsTkbutZ5WMefoIPETJUFK73EMT9MzfACcvEsXFvv9P
         fgqhkZ3fYsPp2rwIeYJmEYhPShKTe507oRgPGCj+xKE6cJiQrLgvbsyi9ttpjOSMAT6F
         tNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064326; x=1691669126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+DU3kYIXVYlczgnjPIgAblT5y0PqecHU2rZnswjn2g=;
        b=cnFHttdE7hRW8E9z7ofdcgBRw9I5oWfs+rFw9T+CQLoVL9s1IeZxK55EvihLDj69+L
         tV6ba2vusfsuJb1cmIIsNWUZEYvUBeoieRhVdXWgpn1MCoO7+l681xMBwzqoEk/3Zpm9
         JuOTlmErvCFbrkHduP1Dk4U57QL3ZvLXTMVcLErBBqnXvU5Ijd5KCFUASjpNjW+aff7g
         uGiRIstWQB61k4/q7KjYj5PSzpd4q8HKAesaAMI2DSzzyWlDN0YiEfZxAwlKpFk0bpAK
         ie/bVpEnjVv5G6AFJxwXLFoBXC5K6lwp8jIjbSc+l+I8M/B791Jkoy8PBhhYqgVEgKkI
         ZU7Q==
X-Gm-Message-State: ABy/qLYwxxTuKDyngEqXIYY1BhA2aZY1cNETapvA3vFlFOzw1PGdwvRj
	1XWHwQR0L5BMb9as9M3e/7NvnsJ2Qds=
X-Google-Smtp-Source: APBJJlEbonaD9/0BAPXd1RpRxUS7o9+LRSnGh1aH+kdhyaTHliEbakbUGPrbaDGLYJumlFmokTiuTQ==
X-Received: by 2002:a05:6512:2253:b0:4fe:711:2931 with SMTP id i19-20020a056512225300b004fe07112931mr7480300lfu.22.1691064326389;
        Thu, 03 Aug 2023 05:05:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 2/6] xen/riscv: introduce dummy <asm/bug.h>
Date: Thu,  3 Aug 2023 15:05:18 +0300
Message-ID: <dfb1c50881a7bb21a1b32083f447e31995004f35.1691063432.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691063432.git.oleksii.kurochko@gmail.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<xen/lib.h> will be used in the patch "xen/riscv: introduce
decode_cause() stuff" and requires <asm/bug.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Nothing changed. Only rebase.
---
Changes in V6:
 - Nothing changed. Only rebase.
---
Changes in V5:
 * the patch was introduced in the current patch series (V5)
---
 xen/arch/riscv/include/asm/bug.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..e8b1e40823
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021-2023 Vates
+ *
+ */
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#endif /* _ASM_RISCV_BUG_H */
-- 
2.41.0


