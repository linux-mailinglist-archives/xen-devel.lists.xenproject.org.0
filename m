Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14758ADB5A1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017389.1394392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBv0-0001az-LH; Mon, 16 Jun 2025 15:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017389.1394392; Mon, 16 Jun 2025 15:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBv0-0001YB-I3; Mon, 16 Jun 2025 15:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1017389;
 Mon, 16 Jun 2025 15:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/Gb=Y7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uRBuy-00015n-Fp
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:38:40 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9dca812-4ac7-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:38:40 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso4574630f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:38:40 -0700 (PDT)
Received: from gmail.com (140.red-213-97-47.staticip.rima-tde.net.
 [213.97.47.140]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a57b15015fsm5707473f8f.95.2025.06.16.08.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:38:37 -0700 (PDT)
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
X-Inumbo-ID: f9dca812-4ac7-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750088318; x=1750693118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4alejBC53+f14BfESAdUdsqdGSmpK0SJqs5nxYK3Y5U=;
        b=g/0TBfcqZZpyzl2HxWDOcEikhQHAVDHU5dv/AD9TGN3iZ+l1G2xWHxh4Q6f5GD8aIi
         IlldtUhkA4Mpxy3kDr3yAtZjbG6UyuLHkkveXIGX6VLKVUWeLILahZDgZgeBo5q3Lbgo
         AJxGNG3cvRcLlm/FLXye5VV8YBcoWjgCsTclOcHndooKVUrpAr1Q4CD65WRkanrTWB7s
         d7b0XPj/xXLIDzABUSW3V09fHN8qlxEM2q2YsxuvGlNcb2b49eoeSxxL3WAIQ4kMmEn0
         dSZK8jp1/0dVsQBLgDO5I+i9+U91b4fwdB+SpWSDFEMsIIDrk+dORj7Spp5np5usN8fA
         geNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088318; x=1750693118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4alejBC53+f14BfESAdUdsqdGSmpK0SJqs5nxYK3Y5U=;
        b=a201GfMBFSwVCjOuc1PmDrejcFrQ96JiZTpEvAZURTU2fMoQN1K1PhMgTiKLOhFi2V
         tAK8k9KluoUQ7njslCSdVE6/2A3P5W5XDY8csY1TClcxVOXlUE9OoUO5suQi7X2LzS+z
         ePJ4Eju5wBsdtZ8EjDZvHoGECX/LbEclp1pA/LK/UU7Azri9SsQ4zKtd2FOINyBY0dLT
         lSIKiGMx4v7Zj5TNsj7E9680dlqNZ0SR0WeRp+0KUloMa1hbYYMS8UkXZF/haLBpG7qX
         hYbmJt01vORHsrjMz5/yYC26luIzIZKE0UKG7oV2igaNpsREle+mJh3JBla7zcYO/1qI
         no5g==
X-Gm-Message-State: AOJu0YyCDoXcf5mLw7aEtzu4gJfHJyS2ewd+vSWL/10q4gDHdODeXAF4
	QatxtwNF+epjkatAfxQY3m3jl8IPCGmEbq1uVxxX9Jt+YU3dW1RZ/yfJAKwARlJh9zU=
X-Gm-Gg: ASbGncvck1OpoQ9CyRtBTqfJ3rQuGNZZZxpYDaq+ZH8mvh2UHuQebg51acKQ7DKnfAK
	Zjawmtq6FIxFrkB1F7Xux3+FDKOHJh4T/4DCsCzGuxlxRnFL1DXX4KxLkD0llM5dFcv1o9T1B2G
	4mOMoWVpoSZHMRA7kA3h9gpBGVwDEsFQ6tl4zlhYXG1/C0wVOiko6m/OEusvjOqzN87BSS374Ko
	NExd8IJLUCDaHl2GXpRnE+8t3urEXKmdl1GeRx8l57YXjaJZCiQxZ47n27gF9RvfRrtbuATSnEv
	sWNeeP2xVkOgSRcTYk5EcoYtfS8hsFvVsf7NISnujrpys+VjrXTWxgodq9KMixytlRUMALKpH0t
	F8onmoGlqSUjIS0rSW0a1xvpbIEyWvZVBWStr6ZZL9u4=
X-Google-Smtp-Source: AGHT+IFs2+d0kAx8DgFcFSn1sGMDzQkUp4lDbG4NCVYXHJ39d4Q8R119BVcD6Ndzwxp5cN/IliGLnw==
X-Received: by 2002:a5d:6f01:0:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a572367c78mr9839975f8f.2.1750088318282;
        Mon, 16 Jun 2025 08:38:38 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	rosbrookn@gmail.com,
	gwd@xenproject.org,
	edgar.iglesias@amd.com
Subject: [PATCH v5 2/5] xen/arm: dom0less: Add trap-unmapped-accesses
Date: Mon, 16 Jun 2025 17:38:23 +0200
Message-ID: <20250616153826.404927-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616153826.404927-1-edgar.iglesias@gmail.com>
References: <20250616153826.404927-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the trap-unmapped-accesses per-domain fdt property.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
index 981af5079f..4b285cff5e 100644
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


