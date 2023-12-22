Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBA81CBEB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659414.1029073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDT-0000yg-2q; Fri, 22 Dec 2023 15:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659414.1029073; Fri, 22 Dec 2023 15:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDS-0000uP-UY; Fri, 22 Dec 2023 15:13:34 +0000
Received: by outflank-mailman (input) for mailman id 659414;
 Fri, 22 Dec 2023 15:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDR-0000EM-Ql
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:33 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab4a177e-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:32 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e23a4df33so2371372e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:32 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:30 -0800 (PST)
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
X-Inumbo-ID: ab4a177e-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258012; x=1703862812; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eaEZv1HAryfktopbeuG1TkzSBp8f/+fjRQtadDNTpU=;
        b=XRLsqj3EhiSptDcllQbmIYd60N/YxOMkfa2Vqa8h51WnG823WGeSdyBzYEzLDsyw7R
         yaAihnj636sSYv3940f0hYMB4oqwVQIF/WBaVGuP59kZqHwuUUySKmUtJhU+JDEc3w5z
         pqlwJwDxXPH19wKoI7UgY1Rh9UohsX21M2SuTVFeUFYBx9EpZ783JZfx8c7pX+LiuxLq
         0zoOrQdlOj1YmR4A8SlltaCOKNvUihXJmDDv0LbVsnkf3XWO1g1IT7i3XPLZFZfHmO1P
         kysqGdyHjHJ5bFSt3m7i6FFjGa0xEmuPL5ZlJm3FJ0GrTWF0fnZH30VvWLFSvQIsCuCH
         ctog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258012; x=1703862812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eaEZv1HAryfktopbeuG1TkzSBp8f/+fjRQtadDNTpU=;
        b=VRFkcRvvTLcdod4fZF4d14P+xx75saRd8JiQQny8MJgKybUTOXWiUOyUieqH44gRA4
         uWsejXL1c92EmBvFcY4iMMMgSu73z8ePCQLHnFpAU96qkqDBX6HFO2MAcPIQUEHIA7NO
         UnH3xPfVUe4q/zZ9QXpXP+b4JniRjZ47JXvm9VWoXpjsipBNamLrN2nYNbdMl4t0YgA6
         0l/NJUsqQURWS3sHvvHnJHFF5dqCIxY8c5VrCDA36pxCbLo743lNlVC1BBilhnlp95Ww
         6ztkBRQBRDwV4J8F+VUrBwF92mUDW2++N5tpfOWu0Lez0NHJY/UwRf07Wd/8AkrkhbMs
         Aqfg==
X-Gm-Message-State: AOJu0YzTarq2VaToN/hIRfOcBPbcwCSDdulL9WX4vZ8dE2tCYbPiCQle
	RBmKFw+hGIBkkqU0QTrBsUgk3cvu6As=
X-Google-Smtp-Source: AGHT+IH02Zn02LKE6rJvcATfF64zsSsyjcmJ0IcyqBiCbXVbnT80WpfpJ9Rbg/QWuwsok7HmX/X52w==
X-Received: by 2002:a05:6512:20cc:b0:50e:6a09:a391 with SMTP id u12-20020a05651220cc00b0050e6a09a391mr534860lfr.24.1703258011670;
        Fri, 22 Dec 2023 07:13:31 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 08/34] xen/riscv: introduce setup.h
Date: Fri, 22 Dec 2023 17:12:52 +0200
Message-ID: <3fe0275a5a9c73559b77d218b1853d2bd3464b79.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add SPDX
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/setup.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/setup.h

diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
new file mode 100644
index 0000000000..7613a5dbd0
--- /dev/null
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_RISCV_SETUP_H__
+#define __ASM_RISCV_SETUP_H__
+
+#define max_init_domid (0)
+
+#endif /* __ASM_RISCV_SETUP_H__ */
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


