Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676877DE79
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584326.914946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdY-00055H-Qi; Wed, 16 Aug 2023 10:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584326.914946; Wed, 16 Aug 2023 10:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdY-0004r5-Cj; Wed, 16 Aug 2023 10:20:24 +0000
Received: by outflank-mailman (input) for mailman id 584326;
 Wed, 16 Aug 2023 10:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdW-0003R9-DX
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:22 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81b7817a-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:21 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso5587202f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:21 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:20 -0700 (PDT)
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
X-Inumbo-ID: 81b7817a-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181221; x=1692786021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SAv1/nVAEvC2eUP+A+JJrfLibXfd0eUAwY7nUEYbBk=;
        b=S79awHNCAcJstJrlgbvuJemfvHPBefJbtszclqjWwn56f5eLYgRVSYVjvWrHIwgzqI
         txeMs8p2B7bmTUuPOPE+ITdRoYJU7SqM+ud0iDyILY9sE9cVTAPP3Q+vy0+MT87WFY1X
         nLHy3QmaJlhp9naRdBGysXUaiSzDlNcoxSG5803284YXZY5qrM+yXgIbMfwp2YY7gStv
         7LjwUCHNKh9H0OBPERmaxXy4A3d8oBtZXOFoK1qShQXezVZLc6N7n6W0G1qPyJdbuANZ
         tud1/cdVgQ4WHmOTKKX/jOuzqX7+HGvtk2bAyhSK937wN3SCBt/biczj+7cqgWgnIKGN
         li1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181221; x=1692786021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SAv1/nVAEvC2eUP+A+JJrfLibXfd0eUAwY7nUEYbBk=;
        b=VYkxwdo8scAU7tcN1KGEdqTJBFzRKgMTccmOTjKYsTFXsj3m17dtnW+FY9dWFeLceY
         dMQWKFiGovIuly10PzG0Bw2zn1itLl7Pu5X8fl4b5xfZi8ZjVbBoIgsKoZ2/WNf1akTP
         gtJAmux60dNFk6sT9aUPZFG05u+JjjgXxS2o3QZjo5jLNDQwuNticadSsaWXCA56DMYy
         CBtlZVL+LQCd3d5EmwQHupl4LrdMfZg9aD/hf5odvgN5GiKv3EggNLyPB3pAmQVBWhQ0
         tKSlnJbKkAD3Twjif4rG6JPwdkW/GMvHmjczV/+476TF5m4K8c5ut+5lm4CH6pj2ko90
         LNwQ==
X-Gm-Message-State: AOJu0Yw3vZ+yMWv6QOCOeRpCh/qOIv82pgmnEyoyaqfI3y4jikrBJlLJ
	sR8XHS8s0V9Ypjng4XGgBTNkDx370zIkXEa7
X-Google-Smtp-Source: AGHT+IGvYv3B7sJqKLRG/GSmInwttmH0aBZVLOI7ZrwlPi8jlwctErMSTp7TPqm2OL7JPvCnMg6ZRg==
X-Received: by 2002:a5d:6552:0:b0:316:efb9:ffa with SMTP id z18-20020a5d6552000000b00316efb90ffamr1091651wrv.35.1692181220817;
        Wed, 16 Aug 2023 03:20:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 08/57] xen/riscv: introduce asm/device.h
Date: Wed, 16 Aug 2023 13:19:18 +0300
Message-ID: <34988d4e9820b4b84a16f7cf72dbc4a908a3a304.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/device.h | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/device.h

diff --git a/xen/arch/riscv/include/asm/device.h b/xen/arch/riscv/include/asm/device.h
new file mode 100644
index 0000000000..e58178517a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/device.h
@@ -0,0 +1,55 @@
+#ifndef __ASM_RISCV_DEVICE_H__
+#define __ASM_RISCV_DEVICE_H__
+
+struct dt_device_node;
+
+enum device_type
+{
+    DEV_DT,
+    DEV_PCI,
+};
+
+struct device {
+    enum device_type type;
+#ifdef CONFIG_HAS_DEVICE_TREE
+    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
+#endif
+};
+
+enum device_class
+{
+    DEVICE_SERIAL,
+    DEVICE_IOMMU,
+    DEVICE_GIC,
+    DEVICE_PCI_HOSTBRIDGE,
+    /* Use for error */
+    DEVICE_UNKNOWN,
+};
+
+struct device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+    /* List of devices supported by this driver */
+    const struct dt_device_match *dt_match;
+    /*
+     * Device initialization.
+     *
+     * -EAGAIN is used to indicate that device probing is deferred.
+     */
+    int (*init)(struct dt_device_node *dev, const void *data);
+};
+
+typedef struct device device_t;
+
+#define DT_DEVICE_START(_name, _namestr, _class)                    \
+static const struct device_desc __dev_desc_##_name __used           \
+__section(".dev.info") = {                                          \
+    .name = _namestr,                                               \
+    .class = _class,                                                \
+
+#define DT_DEVICE_END                                               \
+};
+
+#endif /* __ASM_RISCV_DEVICE_H__ */
\ No newline at end of file
-- 
2.41.0


