Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEEF84FB63
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678787.1056367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBQ-0000ZF-C6; Fri, 09 Feb 2024 18:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678787.1056367; Fri, 09 Feb 2024 18:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBQ-0000W1-82; Fri, 09 Feb 2024 18:01:04 +0000
Received: by outflank-mailman (input) for mailman id 678787;
 Fri, 09 Feb 2024 18:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYVBO-0007AX-Rd
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:01:02 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f2a28ce-c775-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 19:01:01 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so1616287a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 10:01:01 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 fd1-20020a056402388100b00561103f29fbsm984503edb.75.2024.02.09.10.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:00:59 -0800 (PST)
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
X-Inumbo-ID: 2f2a28ce-c775-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501660; x=1708106460; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zSKxQR6kP5WdiwzAdOSjjJwHaQkMg7XYEJePcorDtE=;
        b=e7fpMLN5yYexyw2OYS91p/mZWEZbijXxpJP0vfpegj1CfsDG6mp6yBkmtU7YewqIdU
         xdstB7qVzx/qVzsUcLsp+I0q5NqkooccHXdkq/1X9hPKUh9vdkr9/IlbMRdZ3gQaV6qV
         olB1eNLLK0cXvTG7855zKxJDCuN3so4ImHE7+N97g/e+ovKrZ0bpbV5urPn+1ME03f6y
         bhEfW9R4QWEiSBUwcs/7v1nbo2cR+OKXq5NnUq4+/10L4pC3h4PWQxjBgT+zUytaGJBB
         nnbefpdzhFaLeU3AHIT0aochgPWAI2AAP9CwdQFxjvhhhAFK4fd0SKz9+3qKwcR15zQU
         gKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501660; x=1708106460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zSKxQR6kP5WdiwzAdOSjjJwHaQkMg7XYEJePcorDtE=;
        b=pI/KPXRGVvakDWIXIdH40bI8Ny9uGps9mH8nvtf4FMUjjb3eRlsg/yqX1SUC2RdTDZ
         YuWl/ZkfKhSVi2HrSbGMRbb2X53liIGklXVgGy3gZlDiY+QQGSQBSZ2Z5U/XB9d5E4Ku
         RHVKz0FqU5WYATZXcWfPG+KWQOhyyrZlPko3iucbeXJtYNB6eG0nER9Q5TM+hGjxrgm0
         q6cb/A+reMxtVKV12OFxmAvkseGXP0y1QVnKI/KV/0fXb1gwcQUVqZ+BPoPqcUR77MRc
         JRgM3TeJfS2F5wlEUA4Wd+kRt+8elFje4XCweico93K0BPW3EGoJ5iV7+xYytekFUpNu
         OZcg==
X-Gm-Message-State: AOJu0YxoL5G/Z64mSMAGSyj1zSVzy15BWzBOjo4jh6qs5uHbErbRfItZ
	aNfbXdH1pE7VTnmD83+b2a2w1DMvvJ3OJHPoF/e97PUQEyPc/fpugsEROabU
X-Google-Smtp-Source: AGHT+IFc6L4aoReIcUQhz63N8frIOcSmyo05U0y2uM2pvWezG7stFnF+wJT2FYx1hW0trc4A8v2d5g==
X-Received: by 2002:aa7:c653:0:b0:560:1652:e7cb with SMTP id z19-20020aa7c653000000b005601652e7cbmr1823428edr.16.1707501660563;
        Fri, 09 Feb 2024 10:01:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2XfEhF2CITrZWAeUUDnRihfsVEoFhTeQGycPMEtkmXn9i7lvJyqFe8+PpuUYDgOTj1Tl9SGQGh72urX/KEKYbgmPzIYhb76sjP94Z7FALQg==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v8 7/7] xen/ppc: switch PPC to use asm-generic/device.h
Date: Fri,  9 Feb 2024 19:00:49 +0100
Message-ID: <a7741646285594dcd5e00eb1fb108539f95b4139.1707499278.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707499278.git.oleksii.kurochko@gmail.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
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


