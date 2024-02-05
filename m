Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE88E849E37
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676201.1052215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xn-0000Mw-92; Mon, 05 Feb 2024 15:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676201.1052215; Mon, 05 Feb 2024 15:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xn-0000Ih-55; Mon, 05 Feb 2024 15:32:51 +0000
Received: by outflank-mailman (input) for mailman id 676201;
 Mon, 05 Feb 2024 15:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xl-0007I6-Oa
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:49 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0af2684-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:47 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-51124db6cf0so3952831e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:46 -0800 (PST)
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
X-Inumbo-ID: d0af2684-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147167; x=1707751967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBotcF0+SThVpP3W9n7XOyM76ldShQpdZhp7LK29d70=;
        b=bTD2yDLrXJ6LzZXaF0oSRYvepLB07HVyKTqZjqvG8asR7M4nlzZRPwOzZZYMQfuqVx
         MIYh+nWLHzCYi5dKrYB7jG5JcohulixFBi3cnAqxdcVkR2JP6p/oXBxi06XnowVVfYHP
         v6nuJMOAvoYJPs3c7SKLac9swSaoPMaZ95fmvvXe/NiobAO00mU/G7wAGnKgwjhbEGfP
         Afc/5gLKMWL9iVmwhM7eO0dCM6/Nl9AxoWG7nzsZDUgK42cya2zL04rsMdndOvBnFSNS
         bdWRNX3h93QQWXuAJGt/z5Hbci/MqCcYswWIClYjLcCCkvXbrOMdqHznTRQcRopLsLfc
         CW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147167; x=1707751967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBotcF0+SThVpP3W9n7XOyM76ldShQpdZhp7LK29d70=;
        b=Jf2iGiL6juPFl2QIUvagxmAhcnbM47ziJqiND7TwK5qsWnhw5HZP3/jxwdJ7rNuF26
         GDQc1gxAjeCfRHdPOZgE8dYcbeuc1rQK6IZ/KnmYAiatt00vcSwh8P29WUOSK6/mMEQ1
         JINZZ75u9AsbJBD7gvQEnS7FiZk8hH1HxnGQ1lVCMmD8ysQI9854F0Xub7RaY5cYCWcj
         i4cTgTQh9Tgk3htByy9l+ZspPRkBCrx+ZneQK/z60MT4TLDaS1AUEqyWI791ZpbM97uZ
         Yb9R4Zi0JOWwPi6eJXQ8tWUqWvStGee4ZDMZwisBy4IQb1sfIFQ8l1dOLs0kAs5qQrDV
         sYMQ==
X-Gm-Message-State: AOJu0Ywf2KHvJfmCRBVFl+y4Hmj3k5FUU1xuHIb7CFGCs7ysvYjeNo1g
	vGq07zZpU1Vtfc39fCD30YX1tLtre/6MDFvcconp/dLY/xR3/S9e9o4CCWsw
X-Google-Smtp-Source: AGHT+IGlApynLcTSmBkHRExhVCI8u5HUGtusmYhRVxMrylZdRgq9ep6QS77uqsxZ/UfDXjAB9p32hw==
X-Received: by 2002:a19:4f56:0:b0:511:56fb:b2a8 with SMTP id a22-20020a194f56000000b0051156fbb2a8mr122013lfk.8.1707147167141;
        Mon, 05 Feb 2024 07:32:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXnEv4K2PpNuztEqD+bWPCE7ysgM6vo9uLx9ZkjlfOwMNyBtdDQpC4sybGDlJU5awDLLOC6X/EGUrjNzWzLh0Uldqk5N2/moeqwv2MoHDKwb45hlAdvzxdQBKVvdkezRrdzbrDEXg==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 06/30] xen: avoid generation of empty asm/iommu.h
Date: Mon,  5 Feb 2024 16:32:13 +0100
Message-ID: <a94aba19d32bbe8d2fa78d6d8931f9f0ca51160a.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/iommu.h shouldn't be included when CONFIG_HAS_PASSTHROUGH
isn't enabled.
As <asm/iommu.h> is ifdef-ed by CONFIG_HAS_PASSTHROUGH it should
be also ifdef-ed field "struct arch_iommu arch" in struct domain_iommu
as definition of arch_iommu is located in <asm/iommu.h>.

These amount of changes are enough to avoid generation of empty
asm/iommu.h for now.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Update the commit message.
---
Changes in V3:
 - new patch.
---
 xen/include/xen/iommu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index a21f25df9f..7aa6a77209 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -337,7 +337,9 @@ extern int iommu_add_extra_reserved_device_memory(unsigned long start,
 extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
                                                   void *ctxt);
 
+#ifdef CONFIG_HAS_PASSTHROUGH
 #include <asm/iommu.h>
+#endif
 
 #ifndef iommu_call
 # define iommu_call(ops, fn, args...) ((ops)->fn(args))
@@ -345,7 +347,9 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 #endif
 
 struct domain_iommu {
+#ifdef CONFIG_HAS_PASSTHROUGH
     struct arch_iommu arch;
+#endif
 
     /* iommu_ops */
     const struct iommu_ops *platform_ops;
-- 
2.43.0


