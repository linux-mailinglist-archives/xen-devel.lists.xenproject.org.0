Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C07AC907F
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001144.1381358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05L-0003xM-1z; Fri, 30 May 2025 13:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001144.1381358; Fri, 30 May 2025 13:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05K-0003ux-Uw; Fri, 30 May 2025 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 1001144;
 Fri, 30 May 2025 13:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LO9=YO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uL05J-0003es-7k
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:47:45 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9b5a3ba-3d5c-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:47:44 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54e816aeca6so2724182e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 06:47:44 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d2bdsm699791e87.17.2025.05.30.06.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 06:47:42 -0700 (PDT)
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
X-Inumbo-ID: a9b5a3ba-3d5c-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748612863; x=1749217663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNe9ZmmTuaxvmRoPZ49IX9TgiJHW6RloMcao0C5Z1eg=;
        b=dmhP2rXEgnVN7Fsj2ZDLxyb7zdf1L9YrSQE5o8vixQtL1f+agOjF768xZu5kAt8TGt
         nYtPaIhPyGaprEE3EfzjSabp/qbCrAPMTg6IaN3JETv82+k9f9Ev/aAxJw7jsh9zfNgB
         59MGShlJg+Nxns9kiwrp6gEqNWony1A6C4x3rM3tZEhG2JGZ6TN/GzR0DG0A04KdmlXh
         dCnqzcY4+/AqSBGY1MPPzPRpu6afECgEnnZkcyxxiGg3d5bY1Z3nMPI+psVZCUMfAT+v
         xc6+nSaK2ajh5xpQYavVbz8yqWHVDF4DjG1bHSrvWELnAkZZCLShhKgePuuIFComk583
         YQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612863; x=1749217663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNe9ZmmTuaxvmRoPZ49IX9TgiJHW6RloMcao0C5Z1eg=;
        b=iwM0Ut+SP0TTu384FpfPXXIn/P0Ibf4Vvv4l/Hkix8x+mj4WgXjhCpvHBr6U7jTiDK
         P11x7l0sPk92yvjfhFq9DVeBt+6h5HL0FASQsw7hMNWin+Y0igJddMeRNWdVKHakgzfa
         95Xf+aD8j0hgGyalZ2Q5aGOhPtyWTU63+Q8sEcYiM9cRN+6FCoQ5cAWNNG1fKNtqcgk4
         pCO6lQuoYkwvJqZJSEbyh/P3ZcbbExkZF2O97c74E5WERbh+b4Ml3ukpUMGDqeuv0FrY
         kZofu8JfGRylBIiRyADKvQRLpKkw5BrH3E7qtBtdB25CiSryPZtMM63gva6SNrYAXZIb
         sLVQ==
X-Gm-Message-State: AOJu0YxqkzpsIXJ8+zz3V4EaD5f9l7WA/WdHTDbmmpwexxafvFZLGHtd
	sZ91nz+wTZBCOd5jUv5E6PzALvifCdMkJf+RRv4hvofXYtmM/FK1Pt06BRqynAvmkhg=
X-Gm-Gg: ASbGnctH1VkBRZPnGp5yFpHD+01fTqsJtj0o5u+fWNNs3BJpcmIlkaN493JgrT8dErY
	4o4Qif5yYIHYsVQe6ok0zGRHEkD5LKBPi8oleM8HtWTbP6XcYks0mhKlVftYVFIERU/ipnLB3Wm
	SHOJISOshEP839Gv/CBl2hEmkUitLAmwdJTER0p56PvIL+KYLYI2/zKfhV+bho+Fsmt8NGIymo3
	IpwEvLqHUYOE7N7DJJnzOE8D9EmUS/rNew3SmNqIaCiJZXm6pbGD69ZPQZj9sMUm99g4xdfLoPo
	x7tpY65L+PdFvvt9ZAoYzJ6XBAQ/yiIWgwtmD4VL7aGyfSTGUJRrfalv2+fxmJ2x/PqLApt3q+f
	B/PxziTyDVhaY8vOsT12OZFiNyElWkOhd7A==
X-Google-Smtp-Source: AGHT+IGXExmgR5lVqdOZBa0GhHJkmv3bhJquOjOTf0mlELCJBIQfmPSRvw2cRb/63yw5Mpo3FFMfAg==
X-Received: by 2002:a05:6512:2389:b0:553:3178:2927 with SMTP id 2adb3069b0e04-5533b8f3d7emr1492743e87.16.1748612863072;
        Fri, 30 May 2025 06:47:43 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 2/5] xen/arm: dom0less: Add trap-unmapped-accesses
Date: Fri, 30 May 2025 15:45:56 +0200
Message-ID: <20250530134559.1434255-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the trap-unmapped-accesses per-domain fdt property.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 docs/misc/arm/device-tree/booting.txt | 10 ++++++++++
 xen/arch/arm/dom0less-build.c         |  9 ++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 59fa96a82e..9add6440de 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -225,6 +225,16 @@ with the following properties:
     option is provided with a non zero value, but the platform doesn't support
     SVE.
 
+- trap-unmapped-accesses
+
+    Optional. An integer that configures handling of accesses to unmapped
+    address ranges.
+    If set to 0, guest accesses will read all bits as ones, e.g 0xFFFFFFFF
+    for a 32bit access and writes will be ignored.
+    If set to 1, guest accesses will trap.
+
+    This option is only implemented for ARM where the default is 1.
+
 - xen,enhanced
 
     A string property. Possible property values are:
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a4e0a33632..69324aa597 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -344,8 +344,15 @@ void __init arch_create_domUs(struct dt_device_node *node,
 #endif
     }
 
-    /* Trap accesses to unmapped areas. */
+    /* Trap unmapped accesses by default. */
     d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
+    if ( dt_property_read_u32(node, "trap-unmapped-accesses", &val) )
+    {
+        if ( val > 1 )
+            panic("trap-unmapped-accesses: supported values are 0 or 1");
+        if ( !val )
+            d_cfg->flags &= ~XEN_DOMCTL_CDF_trap_unmapped_accesses;
+    }
 }
 
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
-- 
2.43.0


