Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10E2695BD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 21:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHuIC-0007Ky-Ge; Mon, 14 Sep 2020 19:37:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlh6=CX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kHuIB-0007Kt-0f
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 19:37:35 +0000
X-Inumbo-ID: 128dc4c3-30d6-438d-a2fd-eaef0bbf9f27
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 128dc4c3-30d6-438d-a2fd-eaef0bbf9f27;
 Mon, 14 Sep 2020 19:37:34 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b22so488206lfs.13
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 12:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xs0EYtwOaB1AH0ZX6UXwtC+gooLaRG2NkeWI/cxNIuA=;
 b=qN2JIUZzlVHqAhIjIiC621+/oxA4yBcwsj/sw5eF+BBYHTfFK1S4v8lhrSrEQWcE9s
 CVtjMe/4FO8k+N7Ho9Tn8xbTCnqF9jNEsdQ2IxGdw/zCcg6/mb4ljs6ESlj79/3hQVAF
 H/GlENqhuEea2HlsAQjTq7PCFlakNqr2wP8SY7gR5C/kl3D5AF3x5n3oBmMKiYY/W8tY
 IHH1Sg6ixtfRbT2PwApB5mkO4LfyeDvsyxjXHmdFDjH8ydr+OwbyBL6cFiEvoUKLItng
 tiu/n/FnizkLqmYvxIsfhUSaDrrA14W98+UZOIzwxo91RBWKdZB5Lts6iNihgBLl/KZ8
 2V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xs0EYtwOaB1AH0ZX6UXwtC+gooLaRG2NkeWI/cxNIuA=;
 b=H1pzEO8fuE5ssN716B+AALbZ952aU3X6l61iIZSO7O39YzrdmJtYcytl9suw9PA3Hm
 GZodP+9DM2BzQhQa41Ce/MO1bzFAsZKlQ6yeOEUaChRA8CB5jfWGb1V2gBUCbdI8kuIe
 6YJpj9hAHsbuY5ussDwPq9Ri4LfebL6ZB5KE+2tVVDFEJA/lMlzs/4xsT39DyDkUTeea
 SCpDeLALMLH/b3ZNuQho/hHFq2eg7gZ9O4DERUb+2pflKvVdznCCNAV1NtFWTu0mjW5M
 NuJsZj7+qNXKm4xl/cFc710taqRvblTpohQN3coTpstfQLnpQ8jHCUG90BtPLwJRt1wf
 YPtg==
X-Gm-Message-State: AOAM531WIqmMH/OQ8xBX5NgqTsUxj1/gwSXEQsyqZUHlb+A80ANvoQp1
 3Qn3QlI5Kf/vbkE761LqKqF4MYwO0beS+Q==
X-Google-Smtp-Source: ABdhPJweCgax6KL0a+iT/m8kBfBZwDwP5uqDvBwwotDa+vgtaUpLQo8KMQF42cZwWVVgh6KQEzkaLA==
X-Received: by 2002:a19:420a:: with SMTP id p10mr5456536lfa.513.1600112252659; 
 Mon, 14 Sep 2020 12:37:32 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j12sm3874432lfj.5.2020.09.14.12.37.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Sep 2020 12:37:31 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH] SUPPORT.md: Mark Renesas IPMMU-VMSA (Arm) as supported
Date: Mon, 14 Sep 2020 22:37:20 +0300
Message-Id: <1600112240-31726-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

And remove dependencies on CONFIG_EXPERT.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 SUPPORT.md                      | 2 +-
 xen/arch/arm/platforms/Kconfig  | 2 +-
 xen/drivers/passthrough/Kconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 1479055..5a96a12 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -64,7 +64,7 @@ supported in this document.
     Status, Intel VT-d: Supported
     Status, ARM SMMUv1: Supported
     Status, ARM SMMUv2: Supported
-    Status, Renesas IPMMU-VMSA: Tech Preview
+    Status, Renesas IPMMU-VMSA: Supported
 
 ### ARM/GICv3 ITS
 
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 4bb7319..c93a6b2 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -25,7 +25,7 @@ config RCAR3
 	bool "Renesas RCar3 support"
 	depends on ARM_64
 	select HAS_SCIF
-	select IPMMU_VMSA if EXPERT
+	select IPMMU_VMSA
 	---help---
 	Enable all the required drivers for Renesas RCar3
 
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 73f4ad8..0036007 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -14,7 +14,7 @@ config ARM_SMMU
 	  ARM SMMU architecture.
 
 config IPMMU_VMSA
-	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs" if EXPERT
+	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
 	depends on ARM_64
 	---help---
 	  Support for implementations of the Renesas IPMMU-VMSA found
-- 
2.7.4


