Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2A7A0820
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602362.938961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmR-0004sQ-VG; Thu, 14 Sep 2023 14:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602362.938961; Thu, 14 Sep 2023 14:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmQ-0004bE-U3; Thu, 14 Sep 2023 14:57:18 +0000
Received: by outflank-mailman (input) for mailman id 602362;
 Thu, 14 Sep 2023 14:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmP-0002W4-4W
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:17 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fee7afbd-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:16 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so17205771fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:15 -0700 (PDT)
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
X-Inumbo-ID: fee7afbd-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703436; x=1695308236; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wKxagK2nDf+XL7EhN/Uwr5WmHp5EtILaw4EZ4TwehE=;
        b=GdjR/TkmaNV4oXYhOB6Tuuzzz99+j+GkoOwwF8T6+CdvcCusHEUTNaLKic27Bx0HSD
         Fq0ICP1JLKVCKzX3lBO1bZOMXp3DRnzn4sRwp4vYLm/0CbTM09X87Cq7iUTjGc/2bkgD
         jhc42Ee8yKVcXR3xzH/9YWZPE8pJHrOdRYFAA06QVVpvPFg74WsDZ42a8Fx+Tjy8e7Af
         SYP2qFfZPTa3512gsOe9hMdurcXFHg1GS9W7LlLVD7pnJEaGJ10yX8CtWTWh8+X9BwxK
         JndZBY+f/0ijUw+2aJkTeuuwlK/CbYwXzrSkWMD7ZMsL46iyhVargCFEX50RXwer8cn3
         NqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703436; x=1695308236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wKxagK2nDf+XL7EhN/Uwr5WmHp5EtILaw4EZ4TwehE=;
        b=PRH5MeLYSfWh40/OduLf5Q5nRudWfm/QRlxdAaBytxBRmmEFw+ApMH0cs9runeAAOU
         uLUNQEvGpZh7cSbc3mPfOSWD9zgFzmlshBx32H3VJPgntrF8DR1u0Xf+ABMCONbUSwVy
         Q9z3NtgU7lkns6LmToyDKPT4DoUgk68+dIM4axCa/Tjb6Jjtl8O3ioO/bZLFbF4nTbSP
         CmyYj6ViMUJ5ppRmVpyHjp8VHOKjJPghoZUCye4p9n4l2/BJNaAXJStaRWcLDS2z/VO1
         MXbdbdbiUfR/7K4uOzhRcuM4y4AkfbeS0Fho7HwBb82saMkH0jF0gEH7UJPoNaain8YY
         ldhw==
X-Gm-Message-State: AOJu0YzRrZaQjYtSNwaeG5+SF/NiHOv2RMJG4t2tg7XKyunbdrkT/SMl
	WCIaITKOwuKSkGVwH58MQlCH0jpHq8o=
X-Google-Smtp-Source: AGHT+IGntyE75MEQMEMcUlX34KQSRa218EY5Pqa4vPL3PcOiG88teAQUTEN1CDYGpBYzWH87qcsv7A==
X-Received: by 2002:a2e:2e0e:0:b0:2bc:b821:84ad with SMTP id u14-20020a2e2e0e000000b002bcb82184admr5262753lju.16.1694703435939;
        Thu, 14 Sep 2023 07:57:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v1 11/29] xen/asm-generic: introduce stub header mem_access.h
Date: Thu, 14 Sep 2023 17:56:32 +0300
Message-ID: <79ed96f65e7c7f4036cf62ba6b5b44a371c758ee.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/mem_access.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 xen/include/asm-generic/mem_access.h

diff --git a/xen/include/asm-generic/mem_access.h b/xen/include/asm-generic/mem_access.h
new file mode 100644
index 0000000000..d2a0b545a4
--- /dev/null
+++ b/xen/include/asm-generic/mem_access.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_MEM_ACCESS
+#define __ASM_GENERIC_MEM_ACCESS
+
+#endif
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
2.41.0


