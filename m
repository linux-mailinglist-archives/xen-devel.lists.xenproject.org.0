Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119EB77DE77
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584332.914999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDde-0006db-Sf; Wed, 16 Aug 2023 10:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584332.914999; Wed, 16 Aug 2023 10:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDde-0006Pa-9S; Wed, 16 Aug 2023 10:20:30 +0000
Received: by outflank-mailman (input) for mailman id 584332;
 Wed, 16 Aug 2023 10:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDda-0003R9-VA
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:26 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8468fecf-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:26 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3179ed1dfbbso5547275f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:26 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:25 -0700 (PDT)
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
X-Inumbo-ID: 8468fecf-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181226; x=1692786026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tip3btQnevitBWFE0knEZRoff8z7sNBbm5q30mukKso=;
        b=YadRFyoHgDeEwPbZFsKoOLPl+ujEST5HIAKXwGvymSmOZxC1vSVoDyrnEc5UoTjfCK
         +W8OOyuJ0iXVl10uiATqd410qwhixVlK+iMIsW+4kDyIzdWHKai9zAto41C8lDbwXwk4
         KEcRKKrk52WfZIKBnAO14b3id/a8YBk7+8T9p63CZbAxmT+z8PKBq205qu6y3MTSJccf
         XSgi1ZExlrN6qznvDzaG+UjsNXuZ9FDiZK+a1SIRN/kPd+1PFw65y0Xyw/wDPhZaAGPk
         BqL8YyNvYR9M/FwA4rxjWmr2x6xKR22pplb00rh1lX/xOBhqYAG+0s6TA/BunOcKBi39
         oY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181226; x=1692786026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tip3btQnevitBWFE0knEZRoff8z7sNBbm5q30mukKso=;
        b=GtvBAG6uOd2cITy5fV3+KKupgGdkh3WfnG2OwA1TdU6y+JUMV/jgo/fPTm0TEtaZGc
         5zLsEka6aIMYv+thN1TW1NfYbXAjjn9gosa44ez4UZfxUnLP9Yu54+1k8GWmQEjjGRBJ
         Vt0cew8YVEJcBC45raDiy3OL4aEi+xrwS7jZfngd50CSdfhYDTtchBvJIceT2rv4vSaV
         8QmXTR7wBz4jYTcKmy9Q4smilJG7X2hCup4SLBtHh142Gv4RPlHbUf1KzMAXjiS733rI
         dsOTi77W5ZfoSEjI1SwRokn7JkSo4X7etDkS1NdXdIpVh6labVCtn6c7gNFIJZpAKapl
         l3mQ==
X-Gm-Message-State: AOJu0Yyz+I1wOJFCfS4/aD0hxxuy+0oNfe8XZd30U78mE9u+B5OpWost
	W6TqcHs2wU7Su57VmzCA4h/ioNesqP1mjhRH
X-Google-Smtp-Source: AGHT+IEh6BaojS3I2Gw2A8NMmXWmGZFgcHmfHrVaSQx6GJUXTzF+EmHcTxy8ZpmJ5TL7FuWdYt+4QA==
X-Received: by 2002:a5d:4245:0:b0:317:9537:d741 with SMTP id s5-20020a5d4245000000b003179537d741mr1348456wrr.54.1692181225716;
        Wed, 16 Aug 2023 03:20:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 14/57] xen/riscv: introduce asm/iommu.h
Date: Wed, 16 Aug 2023 13:19:24 +0300
Message-ID: <778623157380cf687de887fbce3d6667d9dde37e.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/iommu.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/iommu.h

diff --git a/xen/arch/riscv/include/asm/iommu.h b/xen/arch/riscv/include/asm/iommu.h
new file mode 100644
index 0000000000..dd823e33ca
--- /dev/null
+++ b/xen/arch/riscv/include/asm/iommu.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_RISCV_IOMMU_H__
+#define __ASM_RISCV_IOMMU_H__
+
+struct arch_iommu {
+};
+
+#endif /* __ASM_IOMMU_H__ */
\ No newline at end of file
-- 
2.41.0


