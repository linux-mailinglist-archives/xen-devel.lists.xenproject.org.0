Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D173FFC12
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177836.323557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4e5-000733-LP; Fri, 03 Sep 2021 08:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177836.323557; Fri, 03 Sep 2021 08:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4e5-000711-IL; Fri, 03 Sep 2021 08:33:57 +0000
Received: by outflank-mailman (input) for mailman id 177836;
 Fri, 03 Sep 2021 08:33:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4e4-0006kQ-CN
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:33:56 +0000
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53a80e4d-17ef-4a2f-8cff-1eaa68946a8d;
 Fri, 03 Sep 2021 08:33:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z19so6890788edi.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:51 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:49 -0700 (PDT)
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
X-Inumbo-ID: 53a80e4d-17ef-4a2f-8cff-1eaa68946a8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjlQkuHh6kZKwoZ8mUieXYtJ9esYGLvw5t0GDKDUbQk=;
        b=Xgp3IkxX/SfY/PfG+BOgIO+ADKUy/5Rb8UIuqEw2MjrDLDSn+HntfDhndHbMQEaScL
         FjmrDAnyZcW6+xVcPZwu1EP7ndImdZ0KeimUQLoaibXp19/yI5ifx9Mgd4XDHmgSsifl
         DEvRHIV40w0i9zsWwxea2m9bOGHPSDHt24SoDK7stOg+g1Tdc/9POfAGzlMJ9dfQ3CHs
         Di8p521g87IwoOeOcp2ltO9kq52QKbjG70LiiCsYOZqXZK9/EjouzbmL5WtPRAbiWcCF
         lxvSO0V1GfTAsxF6og3u/5lCxROSkhvfw5FJOZueqx+bwmhq+i8/2CAFs7DUgsQ90wSm
         4KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjlQkuHh6kZKwoZ8mUieXYtJ9esYGLvw5t0GDKDUbQk=;
        b=UdVccc3g9rFVrXh81QNyHCPyMbdBIJTX7yfPGXxwB1o5FwwNVs2xqTL7hK2836W9M2
         35TtrgD+FzboohBUYt9XoxABD8ZjoRPHnejIO1eFgiyprFBi/mKMOvhy/EYoZWvnPEzj
         TmdmGEMGmoHoRTynt3ZY7X7jYsON2SrK/6UPq5u9CY39jk6e1KOvOqBu8kKOCiyXP1wX
         rp/IplvkD4uYtLTDmuwv8m2z9Sqy2mXSqrEplRVV3ZQ29r80+TGdVgMaRuL62IV7YQGC
         70QtshEMrGWbHKpTv6hN0Ep04QyFB+AAkgY/tkAbgAiHxNB+dvjIBciiltTAWZwtDKGe
         k+sg==
X-Gm-Message-State: AOAM530+wApQVPgt820BrvHk0yNdDbrcYVAx4xOuJjqbepovzBkHapVl
	nMDXIPzA7Spq0OXfBKNT+lCyNJPyikI=
X-Google-Smtp-Source: ABdhPJwdIkQ8KNRmfmDrpt7oR/v1jpWaKOTo/d+eapgA54xtdvm5mj3qW6yJP5PMshdGxMxg314tWA==
X-Received: by 2002:a05:6402:1cb4:: with SMTP id cz20mr2815841edb.0.1630658030445;
        Fri, 03 Sep 2021 01:33:50 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 01/11] xen/arm: Add new device type for PCI
Date: Fri,  3 Sep 2021 11:33:37 +0300
Message-Id: <20210903083347.131786-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add new device type (DEV_PCI) to distinguish PCI devices from platform
DT devices, so some drivers, like IOMMU, can handle PCI devices
differently.

While at it fix dev_is_dt macro.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/include/asm-arm/device.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 5ecd5e7bd15e..7bf040560363 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -4,6 +4,7 @@
 enum device_type
 {
     DEV_DT,
+    DEV_PCI,
 };
 
 struct dev_archdata {
@@ -25,9 +26,8 @@ typedef struct device device_t;
 
 #include <xen/device_tree.h>
 
-/* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
-#define dev_is_pci(dev) ((void)(dev), 0)
-#define dev_is_dt(dev)  ((dev->type == DEV_DT)
+#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
+#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
 enum device_class
 {
-- 
2.25.1


