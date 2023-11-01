Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E07DDF2E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 11:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626374.976612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy8GB-00022q-5m; Wed, 01 Nov 2023 10:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626374.976612; Wed, 01 Nov 2023 10:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy8GB-000203-2V; Wed, 01 Nov 2023 10:15:39 +0000
Received: by outflank-mailman (input) for mailman id 626374;
 Wed, 01 Nov 2023 10:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZQ6=GO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qy8G9-0001zx-GJ
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 10:15:37 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 992c6597-789f-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 11:15:36 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c6b30acacdso57454601fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 03:15:36 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac25fb0000000b004fe2f085d5csm172870lfe.299.2023.11.01.03.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 03:15:33 -0700 (PDT)
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
X-Inumbo-ID: 992c6597-789f-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698833735; x=1699438535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3LKsTwr8NYl8OkY+753xCgq+RDBzVLZZQcnCl8u+GI=;
        b=OVlk18ehqqSMksbKVDoK4TU5hEKSA5zm14xXKF1Y3CCOqYDWGsk0Q4F+0c9dZwTlly
         n16uGuMS05uxOl0LTmwBoA6RiHpWO0JEYVhscn2r2Fba3AvNtLcxyyFwz/TZG8XzUmyG
         8VMZzy2vsUZiHdcHTvXQpY++QMBdtPNinI9/LXB9lbxaegxmuCEIYiUDlakNX6DMMoih
         PdN7mn84qajZootd1/O9l61s3kfn42MbFZ5yPxk6tQOdTutfW/Qw9Lsd6gRdodsHohQw
         EbrvOiuc1IONEco7//SGJEYS067E+uRQhiubl2ZEI5KuCwRKcgGrfvDk7/n0LyBkh4T+
         pI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698833735; x=1699438535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3LKsTwr8NYl8OkY+753xCgq+RDBzVLZZQcnCl8u+GI=;
        b=Vgubty8j7V36yP32KL32f79L5uHFSHq5zZy8+V6cuW8l1/Zs7rWcgUBjB4IylCk/6L
         gaX5n+11o0pMwgNfo8RXfvf1+YMhjADb616u4W+bUdguJavqWTWV9S86M6VbVrWL4Wth
         75iEliQMjef9dT3MB29i4SQrMWp2MsEOur0VL/jPWP37a/8XqNqQ4RmX3j7KevtCVvNK
         hnuoXe80/WUdyiPgunn6d4hwnLYA3V/pNwA4EudHB0IUgWQSQGMkboEGexp7YI+pOnKS
         R3Y7ZrJFSDBI3YT4LJ6hQseS0nngxE38f/bVThU0ntTd9qnuLFxjGYfs3zIdXgMP6koB
         NOPQ==
X-Gm-Message-State: AOJu0YxqdX4MnuvvFP7xxnBvFYwHVxqpkt2hk496eGKV3dAjw4GeRooL
	o1URvvBNaiRDhtW91S3QEnCn4n7iGa0=
X-Google-Smtp-Source: AGHT+IEdKuhcxVDeTqZa6mSCYsk0VcdRAxVazRx7xwRylybZDiNTdXUec39J7Oy42skYr0wvUog7ug==
X-Received: by 2002:ac2:4895:0:b0:503:3421:4ebd with SMTP id x21-20020ac24895000000b0050334214ebdmr10501351lfc.63.1698833734536;
        Wed, 01 Nov 2023 03:15:34 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH] xen: avoid generation of stub <asm/pci.h> header
Date: Wed,  1 Nov 2023 12:15:09 +0200
Message-ID: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Platforms which doesn't have HAS_PCI enabled it is needed to
have <asm/pci.h>, which contains only an empty definition of
struct arch_pci_dev ( except ARM, it introduces several
ARM-specific functions ).

Also, for architectures ( such as PPC or RISC-V ) on initial
stages of adding support, it is needed to generate <asm/pci.h>
for only define the mentioned above arch_pci_dev structure.

For the Arm-only stubs ( mentioned in <asm/pci.h> for disabled
HAS_PCI and ARM-specific) will be needed
to add <asm/pci.h> directly alongside <xen/pci.h>. Only to
<arm/domain.c> <asm/pci.h> was added.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/domain_build.c    |  1 +
 xen/arch/arm/include/asm/pci.h |  7 -------
 xen/arch/ppc/include/asm/pci.h |  7 -------
 xen/include/xen/pci.h          | 11 +++++++++++
 4 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/pci.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 49792dd590..2dd2926b41 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -23,6 +23,7 @@
 #include <asm/kernel.h>
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
+#include <asm/pci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 8cb46f6b71..7f77226c9b 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -130,13 +130,6 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
 
 #else   /*!CONFIG_HAS_PCI*/
 
-struct arch_pci_dev { };
-
-static always_inline bool is_pci_passthrough_enabled(void)
-{
-    return false;
-}
-
 struct pci_dev;
 
 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
diff --git a/xen/arch/ppc/include/asm/pci.h b/xen/arch/ppc/include/asm/pci.h
deleted file mode 100644
index e76c8e5475..0000000000
--- a/xen/arch/ppc/include/asm/pci.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __ASM_PPC_PCI_H__
-#define __ASM_PPC_PCI_H__
-
-struct arch_pci_dev {
-};
-
-#endif /* __ASM_PPC_PCI_H__ */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 251b8761a8..168ca320ce 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -68,7 +68,18 @@ typedef union {
     };
 } pci_sbdf_t;
 
+#ifdef CONFIG_HAS_PCI
 #include <asm/pci.h>
+#else
+
+struct arch_pci_dev { };
+
+static always_inline bool is_pci_passthrough_enabled(void)
+{
+    return false;
+}
+
+#endif
 
 struct pci_dev_info {
     /*
-- 
2.41.0


