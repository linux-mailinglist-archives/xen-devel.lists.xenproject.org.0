Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E407777DE7E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584337.915034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdl-0007wj-Iv; Wed, 16 Aug 2023 10:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584337.915034; Wed, 16 Aug 2023 10:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdk-0007h6-Hb; Wed, 16 Aug 2023 10:20:36 +0000
Received: by outflank-mailman (input) for mailman id 584337;
 Wed, 16 Aug 2023 10:20:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDde-0003RA-Rt
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85bc32f3-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:28 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fea0640d88so23014235e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:28 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:27 -0700 (PDT)
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
X-Inumbo-ID: 85bc32f3-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181228; x=1692786028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq7tiNqp5YFiMIg50pr6QH9HzTTROsq98vXqhhoTzT0=;
        b=LcVuL0bEeFyXjl0wA4pwWlveYRuKxkQ/43ywwZd9goL35qZccORzZNeG9i/2Uinx+k
         spNMSUEE5GdCGrc/lvzeOhkuDXPejHA4OoV0f7yQOHU2tW2Uur5PUDqRYz5Xt+YQQDjt
         JKm1V9CkR4xGNd6+V7CJ3TM8uTxgMmNH6qtnofzNUEKQRB147uj1grdeoaDptO4t6gnA
         HF+/zootWNGmw1D+MnNdWlst4zS95xkV8yVfgEEIk71iBGPtFldO1RjS9h0FSSFM3sG5
         NzR1osCU+xniF4Z+mQP5f7JKRihOBjO5CLl5czZGeFTuqIIx5QypgjgQef24xsIsiOKD
         AWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181228; x=1692786028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jq7tiNqp5YFiMIg50pr6QH9HzTTROsq98vXqhhoTzT0=;
        b=EbFDj8biuDh7S0Ayenafcvvx0jK+iv+rq5IoA7ayWzDmN/HHXxKc+hjqNXHz4VwOtm
         OIrwYFJuY4Jg3PjB3z41hU5DdKDywzpHC1mUwW9RHljLgfkL1/ir+4tYrFIW42XZIeeP
         qjpDHnWvQIensdVxCQR3TKa9Hhsg01aNWFZvAPbMi6K+m8TQqHxh2rrXzM42KYW/r/Gq
         JE4HE8+TVx5CMG3Z3sgO7OmTIFYYDGFfMgLHI339Vd7n0RH3QS+z7QtDiF93N5s4NQRE
         tHTLcS3/Mwx3fhmKVtvVJhDJtso5M4kgpYsVPRUvZREdoFOHKFsA+moXqgcbtJI8+GdK
         pFwQ==
X-Gm-Message-State: AOJu0YztdcAcWSeBH8fWnnfL/okJcl6O8zlBgh+XXt41WgYNtFH63qU6
	vJr74/eN+divXrridn7RboNOL2Skx0ON6LY6
X-Google-Smtp-Source: AGHT+IE2R65Hvs46ab245kJYtFbTQgd22CGOtNZPRWkNYiYCnpTu6xqpamrl4+M5JhNE/dcRYyoong==
X-Received: by 2002:a05:6000:10c8:b0:317:3deb:a899 with SMTP id b8-20020a05600010c800b003173deba899mr1267030wrx.1.1692181227926;
        Wed, 16 Aug 2023 03:20:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 17/57] xen/riscv: introduce asm/pci.h
Date: Wed, 16 Aug 2023 13:19:27 +0300
Message-ID: <4eb79794a495bc5987a26e939599fbf47ad23113.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/pci.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/pci.h

diff --git a/xen/arch/riscv/include/asm/pci.h b/xen/arch/riscv/include/asm/pci.h
new file mode 100644
index 0000000000..bd1fc54696
--- /dev/null
+++ b/xen/arch/riscv/include/asm/pci.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_RISCV_PCI_H__
+#define __ASM_RISCV_PCI_H__
+
+struct arch_pci_dev {
+};
+
+#endif /* __ASM_PCI_H__ */
\ No newline at end of file
-- 
2.41.0


