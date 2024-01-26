Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7883DDBE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672096.1045824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLU-0004XT-Sh; Fri, 26 Jan 2024 15:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672096.1045824; Fri, 26 Jan 2024 15:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLU-0004Uk-NC; Fri, 26 Jan 2024 15:42:20 +0000
Received: by outflank-mailman (input) for mailman id 672096;
 Fri, 26 Jan 2024 15:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLS-00039n-OJ
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:18 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7be94dd4-bc61-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 16:42:17 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51028acdcf0so586918e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:17 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:16 -0800 (PST)
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
X-Inumbo-ID: 7be94dd4-bc61-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283736; x=1706888536; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxncQDdI2JsFCsulM3gJxCAV4/X4oGnUu68SW6S52Lw=;
        b=Oi2pM2om6OLkLP621uCBSz9SMXLAGEF8BSGBrcL/NouvLd+Nd4oG3zi0WnORQ6LH70
         PV7eXNx5agSUytgwllKcJro/bGvnVMHeADLhsHsG8FUGIOvBcWx6I+8QwfAStLuLAURV
         U0/I5Yrnm7JYeF+P7HMpyEFzlcWpSeEX9IijlrPWSJRHZTkd0G23OoWJ+QQ+dOTACReT
         VPHmBSxWheNJa4ELbEcR6PKYYqyYY2JjCmu8ZtwuJGEizby2XDmoF4A/GISeLuev9NP+
         fTY+x7fXWyfvWwfPbYIrJ26bdpdcqS1MF/XLvsUrx2w0MmvMP94qEEkp9WH/dnfl6zRZ
         NTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283736; x=1706888536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxncQDdI2JsFCsulM3gJxCAV4/X4oGnUu68SW6S52Lw=;
        b=Y3KvSrzKiReYp4KGF3Zv7pTPAZHI/Hzj6gmmhyA5ifCjZN6g+8aopdFa8pKZP14xh6
         lTDyxR6DRbtAoNklbVkFjIM+JjtRbtZ20UszeFFTyURVsWDuH8A0PTh8c3uhgR+lDNjd
         HlTmTVwgGCwsW2jT1N86IM0u3hn6F+RIByqBRHlxGJJM6ZC368tGJ3nskVP/R+M8Xvwe
         fRYcBg6swKxq9XyxejaGRT4Hx7itaV+itQAQPIvZw0VaHMcNLuiSH+cSay37kZL9HrPG
         H4prVFDMZFhOEiKySQB/uJZr3XIBlzON80oScw35FeAnwA0g6YFnfzR8IVvrcGgYWPi3
         ELhg==
X-Gm-Message-State: AOJu0YwEV8LnyoNdmCVT2YIXNJvKE86J1z4bXZ6KeOGrtoFXkbwUL+Ni
	Ih0d1pGqzpaV7zXKO++zxacJsLDJb+cbb7wHksBdYiyTHzgom0wLiXt/uNDO
X-Google-Smtp-Source: AGHT+IEPm2wvGXW/m2TZujtontsPVNGD00z83SjsYXEflB16DV3EwQopzspD4Uir5bnYihScvnAzAA==
X-Received: by 2002:a05:6512:4026:b0:50b:ea8e:b42c with SMTP id br38-20020a056512402600b0050bea8eb42cmr951242lfb.97.1706283736575;
        Fri, 26 Jan 2024 07:42:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v7 7/7] xen/ppc: switch PPC to use asm-generic/device.h
Date: Fri, 26 Jan 2024 17:42:07 +0200
Message-ID: <216d88fefb56f0147b5796a3a0327bdaae8b0eb2.1706281994.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706281994.git.oleksii.kurochko@gmail.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


