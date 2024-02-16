Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B890857CD0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682192.1061331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV9-0008EZ-A1; Fri, 16 Feb 2024 12:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682192.1061331; Fri, 16 Feb 2024 12:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxV9-00088H-4D; Fri, 16 Feb 2024 12:39:35 +0000
Received: by outflank-mailman (input) for mailman id 682192;
 Fri, 16 Feb 2024 12:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raxV7-0006oJ-3a
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:39:33 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f1d6ee9-ccc8-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 13:39:32 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso254729366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 04:39:32 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3db1734b92sm1121608ejc.43.2024.02.16.04.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 04:39:30 -0800 (PST)
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
X-Inumbo-ID: 6f1d6ee9-ccc8-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708087171; x=1708691971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zM8XpDaj0bwgFuwnlMqun0OZXmeuznnNGSwY8Hidtw=;
        b=k/X+f+qT3NDcd79wTBrBlAKnwTOjXC249j9A3vqWWUR3StHY9kogDBwzrOcol/kWYd
         1I910uUeXJBUMXr7ijlbH0/051FPHS3fKZTwMt6RK+pHFb/rIefknv/zRl5gKyDUdWia
         bHDLKAZ62ymi9JC2AA54CIO5Jfg91MNX+uej19+pb+0E8SvMtXHOQsf50KueKFZI3+rI
         c2Q452PSu/Xc2bkWdSQq9pFMvNrrGU9s89yd4tjOGKF+C0R49A4/JIGchru8BoBysFlz
         j4u36+5sTi4AvflAWRUEuVk/xD8WWa3NyO9/0+36LAJxLi7Ji/cRBhFmpVhhqQ5uwhVI
         Qrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708087171; x=1708691971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zM8XpDaj0bwgFuwnlMqun0OZXmeuznnNGSwY8Hidtw=;
        b=absOU9t54rQ2FpriOtqcTw+VSg25hXH7LIQ7gfunFjfao4Yn9n66w5OLEuJpspS/F2
         b021vKBjkGkKDqr2ut858jhyMC9RsNjwFLANgqIdFwGqPKttjec4Cb6dWGf5m8NuCm5w
         upYiU3CvZBh6wqRYBHVg+i8MD7j/7sN3/k1yFmv4WImFySAKKItosP26Rmi9HrtLHFYN
         vlYj95vFQeGAbPFXH5YeKtm9IBP80FXgj8lL1gV1HAQIZyHvSP8tXnoO2kRBErtCw/Jj
         kFz7EGQZWn85zav1wlE65+TJ2l/HXDgdE+8nMVXg4wmoBslmxakXuPTQVl1JipJYEQH3
         P2pw==
X-Gm-Message-State: AOJu0YyNkSm4/x9Vvf5NBcPMtgnG4tlMYLCs0UXvWQ6BGrDRehVL4tUH
	HYzwONoY4ND3bxSEHmHGs+I5slZVUK24RkUpfP8kHoTs4b5/O3jCnJneHFvx
X-Google-Smtp-Source: AGHT+IF+iDaRaUHdatlA0i3c5lu7YparT93bpBVp2gnoxYvBLfVtPC1KMpjFtLaILr0DpwOngQTlgA==
X-Received: by 2002:a17:906:254e:b0:a3d:ab64:7524 with SMTP id j14-20020a170906254e00b00a3dab647524mr2778795ejb.36.1708087171378;
        Fri, 16 Feb 2024 04:39:31 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v9 6/7] xen/ppc: switch PPC to use asm-generic/device.h
Date: Fri, 16 Feb 2024 13:39:18 +0100
Message-ID: <222ae66639312712e145bd04d5dd1ebd2c511d43.1708086092.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708086091.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changed in V8:
 - nothing changed. only rebase.
---
Changes in V7:
 - newly introduced patch which is based on the previous version of the patch:
     [PATCH v6 9/9] xen/asm-generic: introduce generic device.h
---
 xen/arch/ppc/include/asm/Makefile |  1 +
 xen/arch/ppc/include/asm/device.h | 53 -------------------------------
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/device.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 3fd893f3e0..ced02e26ed 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
+generic-y += device.h
 generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
diff --git a/xen/arch/ppc/include/asm/device.h b/xen/arch/ppc/include/asm/device.h
deleted file mode 100644
index 8253e61d51..0000000000
--- a/xen/arch/ppc/include/asm/device.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_DEVICE_H__
-#define __ASM_PPC_DEVICE_H__
-
-enum device_type
-{
-    DEV_DT,
-    DEV_PCI,
-};
-
-struct device {
-    enum device_type type;
-#ifdef CONFIG_HAS_DEVICE_TREE
-    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
-#endif
-};
-
-enum device_class
-{
-    DEVICE_SERIAL,
-    DEVICE_IOMMU,
-    DEVICE_PCI_HOSTBRIDGE,
-    /* Use for error */
-    DEVICE_UNKNOWN,
-};
-
-struct device_desc {
-    /* Device name */
-    const char *name;
-    /* Device class */
-    enum device_class class;
-    /* List of devices supported by this driver */
-    const struct dt_device_match *dt_match;
-    /*
-     * Device initialization.
-     *
-     * -EAGAIN is used to indicate that device probing is deferred.
-     */
-    int (*init)(struct dt_device_node *dev, const void *data);
-};
-
-typedef struct device device_t;
-
-#define DT_DEVICE_START(name_, namestr_, class_)                    \
-static const struct device_desc __dev_desc_##name_ __used           \
-__section(".dev.info") = {                                          \
-    .name = namestr_,                                               \
-    .class = class_,                                                \
-
-#define DT_DEVICE_END                                               \
-};
-
-#endif /* __ASM_PPC_DEVICE_H__ */
-- 
2.43.0


