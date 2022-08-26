Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C325A2805
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393760.632963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoJ-0003RT-Fr; Fri, 26 Aug 2022 12:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393760.632963; Fri, 26 Aug 2022 12:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoJ-0003L2-71; Fri, 26 Aug 2022 12:51:43 +0000
Received: by outflank-mailman (input) for mailman id 393760;
 Fri, 26 Aug 2022 12:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoH-0001dl-6a
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:41 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d448dcee-253d-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 14:51:40 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id c93so1988472edf.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:40 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:39 -0700 (PDT)
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
X-Inumbo-ID: d448dcee-253d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mumtEpYDzsfqqrj/UQbqekiy0HKBQR3otaMx18E1gBE=;
        b=xF6d3CycQqSXZr5mXMfex5FSMUku5QfnDhd1tcf6hVs4Oi+ZNAeDUydlhx8f0CfXyq
         dkaXsxCUrFBFNPJ7e6aPQciKup8yB72BgamDmYUhJjaH6XslapKtwA04Il5BUOxRFiYU
         PuHPim2R870aUIlOiBurGNfPxumFp/gBY0dwT1d3G+LxcUKIy2ItfJJ0JWIbrt3iqBNd
         zU1FPTnDmSJQ1L5ZFxQmEkfLpj29qa92k4Z0R84HswIdCQAObOc3whqV3XmRxPHrvKaE
         yTB23z2fUcfxiA6C8OVMaxOQDWx+GA+N1zrmqC5Ux4GQ4b0dFoLRJOaPkpQy4GiGN9OJ
         15Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mumtEpYDzsfqqrj/UQbqekiy0HKBQR3otaMx18E1gBE=;
        b=wNe7fNzriQgrKXp3aKEzb+16kSyeUU1PJbAcCCiWHMXpu6IMu+v6gYxfdcJSbhavos
         fa/ajXEUc+NSPhF5l5HvOLZDcsN4zVk1kjokiSpjZTkODD4SGs14T70gxQYxzx7dHA6H
         pd1G7YEsVuocUoBzExFinYLxNLssWY6poorr7E87jIzcIuydHMG3Ww/MEaT7dFr5i07P
         GHeNsVOum8lC8azIziIyzq0ZUuctq8V2269Sl/6NuOLhHblS3NxVuOucUD+Ctw3eSQzv
         b3LbflMZH3fOECpqtygfg97LQnx9hbc+AUkfSXYLjzbGJecgcpgxV5HnYnZPqsCq8qpj
         2CIg==
X-Gm-Message-State: ACgBeo0ki/0NUR0fzG+68lwB9CGUrF0ozrT96baYCkUsE80zikjiteiW
	FuG1UsPw+ujfkYPezOWPcEmRqRxhm6Gbqg==
X-Google-Smtp-Source: AA6agR7lZPkiAL9EKsSHYPBtWPKEClMLiQYt9tN+2HJKmX5UBmoBaXeFRyLfatr9kwkHX1bebvJ6kQ==
X-Received: by 2002:a05:6402:5292:b0:446:80b0:4a5d with SMTP id en18-20020a056402529200b0044680b04a5dmr6771606edb.285.1661518299763;
        Fri, 26 Aug 2022 05:51:39 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 08/12] Revert "xen/arm: setup: Add Xen as boot module before printing all boot modules"
Date: Fri, 26 Aug 2022 14:51:07 +0200
Message-Id: <20220826125111.152261-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

This reverts commit 48fb2a9deba11ee48dde21c5c1aa93b4d4e1043b.

The cache coloring support has the command line parsing as a prerequisite
because of the color configurations passed in this way. Also, the Xen boot
module will be placed at an address that depends on the coloring
initialization. This commit moves the Xen boot module after the coloring
initialization to allow the order of operations previously described to
take place.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/setup.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c02f21c0e6..611c93ad7d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -921,12 +921,6 @@ void __init start_xen(unsigned long boot_phys_offset,
               "Please check your bootloader.\n",
               fdt_paddr);
 
-    /* Register Xen's load address as a boot module. */
-    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
-                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
-                             (paddr_t)(uintptr_t)(_end - _start), false);
-    BUG_ON(!xen_bootmodule);
-
     fdt_size = boot_fdt_info(device_tree_flattened, fdt_paddr);
 
     cmdline = boot_fdt_cmdline(device_tree_flattened);
@@ -938,6 +932,12 @@ void __init start_xen(unsigned long boot_phys_offset,
         panic("Xen Coloring support: setup failed\n");
 #endif
 
+    /* Register Xen's load address as a boot module. */
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
+                             (paddr_t)(uintptr_t)(_start + boot_phys_offset),
+                             (paddr_t)(uintptr_t)(_end - _start + 1), false);
+    BUG_ON(!xen_bootmodule);
+
     setup_mm();
 
     /* Parse the ACPI tables for possible boot-time configuration */
-- 
2.34.1


