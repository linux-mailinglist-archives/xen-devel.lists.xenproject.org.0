Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609144805EE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 05:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252122.433121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n23se-0002C0-K4; Tue, 28 Dec 2021 04:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252122.433121; Tue, 28 Dec 2021 04:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n23se-00029e-Gd; Tue, 28 Dec 2021 04:14:32 +0000
Received: by outflank-mailman (input) for mailman id 252122;
 Tue, 28 Dec 2021 04:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Zee=RN=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n23sc-00029Y-Uf
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 04:14:30 +0000
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [2607:f8b0:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a670e34e-6794-11ec-bb0b-79c175774b5d;
 Tue, 28 Dec 2021 05:14:29 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id c2so15136779pfc.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Dec 2021 20:14:29 -0800 (PST)
Received: from localhost.localdomain ([47.89.83.13])
 by smtp.gmail.com with ESMTPSA id b1sm20108088pfl.101.2021.12.27.20.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 20:14:27 -0800 (PST)
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
X-Inumbo-ID: a670e34e-6794-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v8xdzRIoEkXuxNemtwcE/47FM5/HgSe5C87RjzNm/cE=;
        b=Px9Mk5QsWmLyPk84TxeGxq8nTLe03hooYhQpZQ4EGRTsUUSPay1oDKCsdsVrJokfTn
         uawiEve7jE763bF/bGaxRriYCkabjIncnnIbYnXb5vx4OrPV1n/yavCosPfp50Hx6v1V
         3XJst0NXn6fXqHrX+mVODyz/rEXm4u1MyuxtbBPXQzC8IuHoZcdpqQpN1AmOsFwGue7P
         q5cf5Ub/3myVfIReySh3W1jsDXBJsYV+rdhXqDBKjxuAPRBR1vFJZipRbBPEOKCbOCwx
         cCLeBu8tzoFSx62ERDvnefaW6EtBdihoBz1NWWLvHVtKPPOys/4CHNHZwoFMgegmVHJF
         WJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v8xdzRIoEkXuxNemtwcE/47FM5/HgSe5C87RjzNm/cE=;
        b=rgIq7bp7/pz8ZGsehAgbdSFB5uOA3qtJUo03Lz7r9tPVADOqxYJxuLz8xxO++NI6cJ
         q70EfWYegI+NEAwt2iKua6OV/WgdnUCn1Ij7K1h422mN56SkaatK6PYMpM8hehymEm0U
         cAUFJEF/4eJX48vQF2FLh2bDRjHhqZ0HIHUkHo4y1mFce92jPlTyYClOs/8IqkQoW75T
         NE+tey92FiM55uFXm/TMFP11vDeXEV9zVb22u8XlxUm6I4wzJvtbAWUsFKN+OJjZxdh3
         Y2+u89BkF1/kQHDEGMcXIQZ7SG9pvo3EJNrCwa7t71v0MlaLmYJBAJStF39fBaONRFq9
         YwRA==
X-Gm-Message-State: AOAM530xj969CXs09PZCbs6rGG8d+gegzoCN4WMJTfimp9rD1CWhdfz7
	M5qZRdqlPFseyQGVGlLeQ2M=
X-Google-Smtp-Source: ABdhPJyHVJdZUEsSMDsVb5r34Vui/WTCCMu3mr7fZPG15S7z2waY+8eVgcuy78zpe0NRjnIijsARqA==
X-Received: by 2002:a63:3e41:: with SMTP id l62mr13381430pga.139.1640664868114;
        Mon, 27 Dec 2021 20:14:28 -0800 (PST)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com,
	xen-devel@lists.xenproject.org
Cc: gengdongjiu1@gmail.com
Subject: [PATCH v3] xen/arm: Allow QEMU platform to be built with GICv2
Date: Tue, 28 Dec 2021 12:14:23 +0800
Message-Id: <20211228041423.2231598-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trying to select PLATFORM_QEMU with NEW_VGIC will result to Kconfig
complain about unmet dependencies:

tools/kconfig/conf  --syncconfig Kconfig

WARNING: unmet direct dependencies detected for GICV3
   Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
   Selected by [y]:
   - QEMU [=y] && <choice> && ARM_64 [=y]

WARNING: unmet direct dependencies detected for GICV3
   Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
   Selected by [y]:
   - QEMU [=y] && <choice> && ARM_64 [=y]

WARNING: unmet direct dependencies detected for GICV3
   Depends on [n]: ARM_64 [=y] && !NEW_VGIC [=y]
   Selected by [y]:
   - QEMU [=y] && <choice> && ARM_64 [=y]

It turns out that QEMU has been supporting GICv2 virtualization since
v3.1.0. So an easy way to solve the issue and allow more custom support
is to remove the dependencies on GICv3.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
change since v1:
1. Address Stefano's comments to add dependency

change since v2:
1. Address Julien's comments to update the commit messages.
2. enable GICV3 in arch/arm/configs/tiny64_defconfig
---
 xen/arch/arm/Kconfig                  | 5 +++--
 xen/arch/arm/configs/tiny64_defconfig | 2 +-
 xen/arch/arm/platforms/Kconfig        | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..373c698018 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -35,7 +35,7 @@ config ACPI
 
 config GICV3
 	bool "GICv3 driver"
-	depends on ARM_64 && !NEW_VGIC
+	depends on ARM_64
 	default y
 	---help---
 
@@ -44,13 +44,14 @@ config GICV3
 
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
-        depends on GICV3 && !NEW_VGIC
+        depends on GICV3
 
 config HVM
         def_bool y
 
 config NEW_VGIC
 	bool "Use new VGIC implementation"
+	depends on !GICV3
 	---help---
 
 	This is an alternative implementation of the ARM GIC interrupt
diff --git a/xen/arch/arm/configs/tiny64_defconfig b/xen/arch/arm/configs/tiny64_defconfig
index cc6d93f2f8..165603f7e0 100644
--- a/xen/arch/arm/configs/tiny64_defconfig
+++ b/xen/arch/arm/configs/tiny64_defconfig
@@ -4,7 +4,7 @@ CONFIG_ARM=y
 #
 # Architecture Features
 #
-# CONFIG_GICV3 is not set
+CONFIG_GICV3=y
 # CONFIG_MEM_ACCESS is not set
 # CONFIG_SBSA_VUART_CONSOLE is not set
 
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index c93a6b2756..925f6ef8da 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -15,7 +15,7 @@ config ALL_PLAT
 config QEMU
 	bool "QEMU aarch virt machine support"
 	depends on ARM_64
-	select GICV3
+	select GICv3 if !NEW_VGIC
 	select HAS_PL011
 	---help---
 	Enable all the required drivers for QEMU aarch64 virt emulated
-- 
2.25.1


