Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706FAB5723
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982932.1369317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdV-0004Kc-JZ; Tue, 13 May 2025 14:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982932.1369317; Tue, 13 May 2025 14:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdV-0004Cn-FV; Tue, 13 May 2025 14:29:37 +0000
Received: by outflank-mailman (input) for mailman id 982932;
 Tue, 13 May 2025 14:29:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sqXq=X5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uEqdT-0003s1-NE
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:29:35 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1476b26-3006-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:29:35 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad24b7e0331so425349766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:29:35 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197ca2b4sm778952466b.160.2025.05.13.07.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:29:33 -0700 (PDT)
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
X-Inumbo-ID: b1476b26-3006-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146574; x=1747751374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZsMZZN4khD+tCxXKeFysBlRlf4LYZbhvhNdRNB+85Q=;
        b=hrw6OBtqTLGaH//R4QOcbTI6RTrcLebiXOXMvh150bIvl6dovdVRtza9/dDCxCKyG8
         rkwo2OIantEho9HUtTtclJthlVJG3XucHnAI3X5ns4qalJL02tMrOawWbGJRoI38G+cR
         FInHK0GeeXFIwINv1USos5fpwpWz2G0nrEl7TgyDiJ9Q/EKmYzIso2om7iRNUgQ3/2Li
         qh2Xi+axYy3h6vtmMEv/x+FCqd3RvOntWMub4LpUckrzY1LF+1tmA7Wly3kD82WbzBHX
         8dPFY2pVaFTa0XYdC7N4ab4yQl8tyN1huc1jHIVVTAume7ok6paoPuyi7GfX+398J14h
         HFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146574; x=1747751374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZsMZZN4khD+tCxXKeFysBlRlf4LYZbhvhNdRNB+85Q=;
        b=LCYY++ilYJj68KTwgz+guDVH2VsR8Koi/I4qlHqeV9ST265ZSrKXK0q6W0cCzdN4ey
         Fee1jTPvKuZPj37uo7j2A8wlMyuJwjhj/UMo3T73drO3NI9lYxOMRYKnGqYf7NsMjRTj
         mo2HMtLHMwjjv7+TO9vaiG2ZEKUtiuxbl5pCL6ycoBreW9MlbK0ZoFYOe4b/sBxhkwtn
         bCKE+OvzpdfRnwX/Cq2g8TdtCNzgw48aox86M3ylLBqDRPObyZs0l8V+ecFZLW4ITI8Y
         DlgQFUFx5/e2shxfo+ge6cnCz+bpoFOtpbG9A0uxarufXJpb0WyRoDqeAUXyRARg/k1J
         kTIQ==
X-Gm-Message-State: AOJu0YzmMHHSdR2RYAeDjVTU+56bsVcdir3Xpx74ach3X17VHejY/GSR
	A4O9UT+v4e5ZGbQYWnkIKJtE8ShxaDmIE00/p08yHMhqeexswiBNEJ/8Qg==
X-Gm-Gg: ASbGncuBqMK+U9vk/SwFcSVzdWfTArNkvBu5dDR3tEJ3qW2tBavKN/S/tIOr0fSoIL5
	XjepoVrSsuQ1poMIUx1T/usLb39tMu47mTTSWIkzu4v26n8ue0J+M0Gy1AKAHFQ1p5l9QQPad/v
	thMzcVbEHpJY+1MNpYbjag6kc2mUgdcbqTr4Hh2etms5bytqzEpPnjaCUFNg+yNpxEJOCigQ2Pa
	08q+NBL2WcyeeGBTtlmDHcR0C9Scbqlgl4veeOTvV8W+in+K1uLl2ynOcrNyfOJ6nrmpLb8oiKI
	oeMwqggAl1XZUyscEDbXbfVx8BXIOdBwnoIViLSTwZf4sxqjrcaProfnAvydIyWrIzfLibKquis
	AmJpq5YyDvCdyR0guug==
X-Google-Smtp-Source: AGHT+IE9cgPaCM7BS6Eml7ivJ9CqmHMGc3KFJlYK/ty0Ha1pBEuAv17nL210cXysSsurYIG1B7W+kg==
X-Received: by 2002:a17:907:72d0:b0:ace:6d5b:e785 with SMTP id a640c23a62f3a-ad2192b6b17mr1575576866b.47.1747146573733;
        Tue, 13 May 2025 07:29:33 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/3] xen/dom0less: move make_chosen_node() to common code
Date: Tue, 13 May 2025 16:29:28 +0200
Message-ID: <9c87738225d48bd1ee9bba6e8d4e018dfecabccd.1747145897.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747145897.git.oleksii.kurochko@gmail.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of make_chosen_node() does not contain any
architecture-specific logic. Therefore, move it from arch-specific
files to common code.

At this stage, there is no need to introduce an arch_make_chosen_node(),
as no architecture-specific customization is required.

This change avoids duplication and simplifies future maintenance for
architectures like RISC-V and ARM.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/domain_build.c             | 46 -------------------------
 xen/common/device-tree/dom0less-build.c | 46 +++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae..9e71cc8cef 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1470,52 +1470,6 @@ int __init make_timer_node(const struct kernel_info *kinfo)
     return res;
 }
 
-/*
- * This function is used as part of the device tree generation for Dom0
- * on ACPI systems, and DomUs started directly from Xen based on device
- * tree information.
- */
-int __init make_chosen_node(const struct kernel_info *kinfo)
-{
-    int res;
-    const char *bootargs = NULL;
-    const struct bootmodule *initrd = kinfo->initrd_bootmodule;
-    void *fdt = kinfo->fdt;
-
-    dt_dprintk("Create chosen node\n");
-    res = fdt_begin_node(fdt, "chosen");
-    if ( res )
-        return res;
-
-    if ( kinfo->cmdline && kinfo->cmdline[0] )
-    {
-        bootargs = &kinfo->cmdline[0];
-        res = fdt_property(fdt, "bootargs", bootargs, strlen(bootargs) + 1);
-        if ( res )
-           return res;
-    }
-
-    /*
-     * If the bootloader provides an initrd, we must create a placeholder
-     * for the initrd properties. The values will be replaced later.
-     */
-    if ( initrd && initrd->size )
-    {
-        u64 a = 0;
-        res = fdt_property(kinfo->fdt, "linux,initrd-start", &a, sizeof(a));
-        if ( res )
-            return res;
-
-        res = fdt_property(kinfo->fdt, "linux,initrd-end", &a, sizeof(a));
-        if ( res )
-            return res;
-    }
-
-    res = fdt_end_node(fdt);
-
-    return res;
-}
-
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index f6aabc2093..1265cadf94 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -434,6 +434,52 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
     return res;
 }
 
+/*
+ * This function is used as part of the device tree generation for Dom0
+ * on ACPI systems, and DomUs started directly from Xen based on device
+ * tree information.
+ */
+int __init make_chosen_node(const struct kernel_info *kinfo)
+{
+    int res;
+    const char *bootargs = NULL;
+    const struct bootmodule *initrd = kinfo->initrd_bootmodule;
+    void *fdt = kinfo->fdt;
+
+    dt_dprintk("Create chosen node\n");
+    res = fdt_begin_node(fdt, "chosen");
+    if ( res )
+        return res;
+
+    if ( kinfo->cmdline && kinfo->cmdline[0] )
+    {
+        bootargs = &kinfo->cmdline[0];
+        res = fdt_property(fdt, "bootargs", bootargs, strlen(bootargs) + 1);
+        if ( res )
+           return res;
+    }
+
+    /*
+     * If the bootloader provides an initrd, we must create a placeholder
+     * for the initrd properties. The values will be replaced later.
+     */
+    if ( initrd && initrd->size )
+    {
+        u64 a = 0;
+        res = fdt_property(kinfo->fdt, "linux,initrd-start", &a, sizeof(a));
+        if ( res )
+            return res;
+
+        res = fdt_property(kinfo->fdt, "linux,initrd-end", &a, sizeof(a));
+        if ( res )
+            return res;
+    }
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 /*
  * The max size for DT is 2MB. However, the generated DT is small (not including
  * domU passthrough DT nodes whose size we account separately), 4KB are enough
-- 
2.49.0


