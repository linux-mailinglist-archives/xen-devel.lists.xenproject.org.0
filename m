Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA719270FBC
	for <lists+xen-devel@lfdr.de>; Sat, 19 Sep 2020 19:23:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJgYb-0005u8-UC; Sat, 19 Sep 2020 17:21:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjT2=C4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kJgYb-0005u3-2A
 for xen-devel@lists.xenproject.org; Sat, 19 Sep 2020 17:21:53 +0000
X-Inumbo-ID: e6fd7785-4dd7-44b6-a5c7-93d0f99a3bf2
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6fd7785-4dd7-44b6-a5c7-93d0f99a3bf2;
 Sat, 19 Sep 2020 17:21:52 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k25so7614293ljg.9
 for <xen-devel@lists.xenproject.org>; Sat, 19 Sep 2020 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5tRaxQpQ/sm+6gCbUhjRSiyua5OoTog+OhF5hxjwN+Q=;
 b=tjBLQHnlHsMq9dchCtNzgTFnRpMnnYteSFmT3mPL5I7gRGEAtYlownOQg6zIJpvzf/
 KKUqfJUqjF0gLxoQX1zTEfA1Z58IY5X6qqfdJ0pPicZwIdiaBEe1zNsoZg4tBbikPq0F
 KD4MUWMQnYuchh18d4LtRn2rDi+cidlxFx6QamEfnsYq19/ycI4oqaLi1KdpT+82ptNh
 +1ZbgTgsSRd6YpXFkGvtWq16BOI5nNUPzgAJFsQgJTksuteD6BVsK7DM9UeYEcZqZzPN
 JCje+Ok1WrrEWiET95fsN/2BbCsQ+oRShrbyiK8YB9VdU9gfAH9PzT3HH4/5ZvBS6ErV
 tIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5tRaxQpQ/sm+6gCbUhjRSiyua5OoTog+OhF5hxjwN+Q=;
 b=DsdUMA3v6P3bd2GHvBVKXq+4/mXIHY6PF0/X4TnTmziXD0XpjfkczLClN7dQe2sdoA
 HIca0ibvz+DPgi7OIVzCbqIbUMhS0U54PnebUgSdVp23g+nJJnM88ebapLnfYhu4P08n
 RNPfxgm5q9J8I6ELbWzHrVxrFiBbJR9/CR/EWrBGI0nRQLd65H59wxBYhj3BvS8QnXvz
 rqSWFsZ6iho6SXLVsihqbyvoZmxoZjdzOzk74PPH3aB8LmZco/Y9Y/vepr2E6Fpthvjz
 4baIlOWHT5BnGOh21liN40oUTtxDSEFI0p5N4sdkd6QkjKocRwPs7Xh4Khy4KVIPSrHH
 LXOQ==
X-Gm-Message-State: AOAM532GhdjSCfZ+HYRSO7LVH+y7qqUr/Mgjuq0ZTMB8SFvmQm8ubOpA
 +febVmIE8f/UsMS0Yuj0q/eSp+i27DGRZA==
X-Google-Smtp-Source: ABdhPJziosVW4StAxeMltBijUzLUoAralEbSnjSMsOYTyMtysunNj/aoT7Ae996hzt5T/UIHxJmdBQ==
X-Received: by 2002:a2e:86d2:: with SMTP id n18mr12500240ljj.400.1600536110741; 
 Sat, 19 Sep 2020 10:21:50 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d24sm1386457lfn.140.2020.09.19.10.21.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Sep 2020 10:21:50 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH V2] SUPPORT.md: Update status of Renesas IPMMU-VMSA (Arm)
Date: Sat, 19 Sep 2020 20:21:22 +0300
Message-Id: <1600536082-24112-1-git-send-email-olekstysh@gmail.com>
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

Mark Renesas IPMMU-VMSA as "Supported, not security supported"
and remove dependencies on CONFIG_EXPERT.

We can't treat the IOMMU driver as "Supported" since the device
passthrough feature is not security supported on Arm today.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Was "SUPPORT.md: Mark Renesas IPMMU-VMSA (Arm) as supported"
https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg00967.html
    
Changes V1 -> V2:
   - Update patch subject/description
   - Use "Supported, not security supported"
    
---
 SUPPORT.md                      | 2 +-
 xen/arch/arm/platforms/Kconfig  | 2 +-
 xen/drivers/passthrough/Kconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 1479055..25987ec 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -64,7 +64,7 @@ supported in this document.
     Status, Intel VT-d: Supported
     Status, ARM SMMUv1: Supported
     Status, ARM SMMUv2: Supported
-    Status, Renesas IPMMU-VMSA: Tech Preview
+    Status, Renesas IPMMU-VMSA: Supported, not security supported
 
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


