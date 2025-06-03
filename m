Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEBACC999
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004559.1384296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxg-0006LX-Rd; Tue, 03 Jun 2025 14:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004559.1384296; Tue, 03 Jun 2025 14:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxg-0006H4-Mq; Tue, 03 Jun 2025 14:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1004559;
 Tue, 03 Jun 2025 14:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WdC=YS=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uMSxe-00060n-SC
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:49:54 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02b64404-408a-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:49:54 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55350d0eedeso1947244e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:49:54 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdcesm1955678e87.164.2025.06.03.07.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:49:52 -0700 (PDT)
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
X-Inumbo-ID: 02b64404-408a-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748962193; x=1749566993; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxkHOzjLuIxbnoSdUszUdCQGbRM0T87LtQfXfGg3nVA=;
        b=k4D8wJOydaAPhxrctAl973D/05HHpBl/OC+U8O/2fsiafUYtZLC/hTyB8GIImtSHQq
         QXW+7vihgD12Res8y4MOPG4HMjvWxmlsqnH32/riWfko970IZQCEwftIMzlXiU5BvomW
         z4a7gq5BmOQt0OREjJSWbQZ0PTEihJI+26dd+hRjoxywtWUN+MCKV5rG3CFodzGjt3eD
         oNcGekvudHpde4MToFG4s1VLEYr6QnHVl0cO37AQpThaexhkEqnNKNEW+8DfVlBWj492
         J05Zya8Z/Om9mHq+wC7ZJ9efc1aEZgV4ZCXoDXDXkgUeSqboY4PSrUzIH87ZAsPHNYWh
         d8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962193; x=1749566993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxkHOzjLuIxbnoSdUszUdCQGbRM0T87LtQfXfGg3nVA=;
        b=hkTkOGGSMO55XrFWXL5Inv6Rq7xbSDC4dbAGxJmfqcPMXrSDu+aDcg3432/CGizIDm
         C/5gJWeoAVZ8Nb4QSHPJuu8l46J6THzQsAvXSIrRmeEnUIN49qCQXtq8uJJ2rNA2suXM
         eSZxYsUT2pv8UFUlUbssbp/I9YPMMD1kjASTPOQWloBFV5bhxMY+80rO083SvKnR9SmX
         FmqhPQgezTR79V9subOh9eF91osIzEvr8TdgRQLoRyw9BOUkPaUA3sYduDRGKBIXfkA5
         hPQ/rtxZ/PzNTFxo0MgAg57HjyhCnOrIvsaJ3Z2/eXzAj/mDVz4cxC9Wwb1PxM1gujOA
         iq8A==
X-Gm-Message-State: AOJu0YziWGgRsKH7OXkCX/pkPOPvPN3+rqKiFotCS3FYsTH7nfg3Zo8A
	asYdH9bFNvDZxj+mOVpfeVJiniPHVlMDPhchFIKPL+WcVZJdFcJG0PJgMcU3qcwP8pc=
X-Gm-Gg: ASbGncsZKEYYovnW2v9KPModUob1klVjAXNJT+seT/lv/SI0zJ5G8F/3PxxWngM2+LY
	OZrBm/8fpVYD4qdwCzdyoDCLp3Vsc6p0d2QQM56twX5+P01iLEfmSF9EvxyH2LtWwz6FkBDQstI
	ry69FwSg35tuqzbFoAXRfaXDZeRbwxIWSwtKrixqsXr+12jFPEAaKv5rGC3WhFoGCiynsMnXUoo
	0MPRTNmAzhomlQmLxCiOd56nrw4FVm7ElSa0YkhLNC7rvTF4pO0fsYTqV4H2sRYxrIiePsDusBz
	SIr4LDmZ08dfbZiOSgHhIpCJRExrYNfOccNdjPw6HOxd/3l6CUbJmDuC3eZDAUgxxKeUkaj9gJG
	rYq7tAJXhUuBPYX6+XztUHOA=
X-Google-Smtp-Source: AGHT+IEDspcf46WZ+GLaDfcXnfwzoPQcZkL/NMs2D0E3d1fP1/tTD2EkdEVG0kCXUGd8ka7U1V4KBA==
X-Received: by 2002:a05:6512:6cc:b0:553:35bd:d2eb with SMTP id 2adb3069b0e04-5533d16d8fbmr4922174e87.13.1748962193286;
        Tue, 03 Jun 2025 07:49:53 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 2/5] xen/arm: dom0less: Add trap-unmapped-accesses
Date: Tue,  3 Jun 2025 16:49:45 +0200
Message-ID: <20250603144948.1685047-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
References: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the trap-unmapped-accesses per-domain fdt property.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 docs/misc/arm/device-tree/booting.txt | 10 ++++++++++
 xen/arch/arm/dom0less-build.c         |  9 ++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 59fa96a82e..07acc7ba64 100644
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
+    The default is 1 when trap-unmapped-accesses is absent.
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


