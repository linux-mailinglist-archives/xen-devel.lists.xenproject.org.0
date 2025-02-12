Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA2A32C46
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 17:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886594.1296231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFtb-0005qm-8S; Wed, 12 Feb 2025 16:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886594.1296231; Wed, 12 Feb 2025 16:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFtb-0005pK-5Z; Wed, 12 Feb 2025 16:47:31 +0000
Received: by outflank-mailman (input) for mailman id 886594;
 Wed, 12 Feb 2025 16:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2a2H=VD=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tiFta-0005pE-Ak
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 16:47:30 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b6526b4-e961-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 17:47:28 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5450475df18so4917047e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 08:47:28 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ea84sm1953612e87.35.2025.02.12.08.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 08:47:26 -0800 (PST)
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
X-Inumbo-ID: 0b6526b4-e961-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739378847; x=1739983647; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJjENxpTaqGpVLZ++5Z+1DSOOTo7WuxxkTLa6Dnq+iA=;
        b=PM7SHbepgkB9bCnEQDKreL1oUjj+7mPET6Izf0VDp5xZ6C2tBaE8fBAixldhYsQJk8
         5iMYD5z08Ep/Jt/d8/cr+Jrt0t88aIUq11U1vtbAZEUPOA3RtdnKUEt+pTzQY8WC2eq7
         IaCmOosbkO6LvvrGuUn5zeRrwFnEgvtJwOZ9w50GN+MBeee4mrPANgArYfhIbsWGiF70
         cDZd7Sf03UX8y60zHe9ut6moMWlmqQcvsPuRHr1+pwU3aoN+M5e58MttJ9LgbY61MVAw
         SdoxBaSWxI5e7MX6ANdx07BVGqIEBSQW2kF4uqW9ltMMJMgDhozxRCGKTKTLSqLtAVKG
         nH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378847; x=1739983647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJjENxpTaqGpVLZ++5Z+1DSOOTo7WuxxkTLa6Dnq+iA=;
        b=CfmAAD0YwtB7x0ZcEDKpEBfojOSLA9XWZFxrqTg5Yt+e+nq7wuil67O+EqSuYYWhN/
         GwQtKsKLLl226PMxzkIkw4T8mze5yq95s1qr6bQn1kt3geYV/RZgTriUmpFgOFRW4mos
         2VO3y9116n2piCQKbHEjz/ihJcFMxNQjgpu0L/+4CAqJnEqVoLMgdYcRSu9UpZVA2Vyd
         FwP8NRqv1ZkRzmhwN7lzxJQUZCXsOIgeBkLKVpHLXD2eLGfPVQf4gQMeEBFBbf09Jney
         vr2O7Wxt36oUAECadMIsfayEJwrwwSaFie+RjspAIaAQ+8rhmx7Il42rI87MoATFI2jp
         ZTrA==
X-Gm-Message-State: AOJu0YxignbgvG49A8d+ijEwbIbr6k5M/lsXrbv216vvEsRsTP98TzLh
	XMVw/QnUDoMUtE/g8pvrCgQR+fBNqAvZcwfUumbj8HrPseBG+K1nUxKW0lIt
X-Gm-Gg: ASbGncuabrX5ekJiX924cmxcRMhGFw6lqFVGzspdi7IEMxJDD9OzuaGbvsgTu287wIo
	32j9ik9zao5OyQNH15LYQpAiXdHvOcK3pnd7suF12LwhCzqoRR5ULnyUg+x2TgQrjHJUSo74VL0
	Ex35vqmtiOQ9s8muuS9mHj6zxjHKuLKsKpJrFF+UTPobrqWArXlAoO54OLCzuZcB3XdHs5vcdJi
	hHyWff8cIPbqMz4r+mMVTeL8tjULansA195ThaW+ud2E40Q+Otbiddwjg2WnO4aagmh/hGKjUnP
	n6H1XQXyXE6c0A1gGD/hm3KWiNI+HVP/TbuIXlWwfK7xjdafmS5l1nqhHindsr71IGP5Uw3/8Q=
	=
X-Google-Smtp-Source: AGHT+IHkesHx5Q9eDQF6e6DUWGckc6+GgUT35BSPTKp3behH6h4QSUumRBTJPKjQYaaYkTmH1nGInw==
X-Received: by 2002:a05:6512:2314:b0:545:1bd:a0df with SMTP id 2adb3069b0e04-54518116532mr1290065e87.23.1739378847202;
        Wed, 12 Feb 2025 08:47:27 -0800 (PST)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [RFC PATCH] arm: dom0: allow static memory configuration
Date: Wed, 12 Feb 2025 18:47:24 +0200
Message-Id: <20250212164724.2575624-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm Xen allocates memory to place Dom0 following the logic described in
allocate_memory_11() function which is a bit complicated with major
requirement to place Dom0 within the first 128MB of RAM and below 4G. But
this doesn't guarantee it will be placed at the same physical base address
even between two boots with different configuration (changing the Kernel
image size or Initrd size may cause Dom0 base address to change).

In case of "thin Dom0" use case, when Dom0 implemented with RTOS like
Zephyr, which doesn't use dynamic device-tree parsing, such behavior
causes a lot of inconvenience as it is required to perform modification and
recompiling of Zephyr image to adjust memory layout.

It also prevents from using Initrd with Zephyr, for example, as it's
expected to be placed at known, fixed address in memory.

This RFC patch introduces the possibility to place Dom0 at fixed physical
base address, by checking if "chosen" node contains property
"xen,static-mem" and placs Dom0 exactly at the specified memory chunk.

The implementation follows the same approach as for the static, direct-mapped
guest domain in case of dom0less boot.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 docs/misc/arm/device-tree/booting.txt | 20 ++++++++++++++++++++
 xen/arch/arm/domain_build.c           | 12 +++++++++---
 xen/common/device-tree/bootfdt.c      | 14 ++++++++++++++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 9c881baccc19..485dcb82de8c 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -448,6 +448,26 @@ device-tree:
 This will reserve a 512MB region starting at the host physical address
 0x30000000 to be exclusively used by DomU1.
 
+Dom0 Static Allocation
+======================
+
+The Memory can be statically allocated to a Dom0 using the property
+"xen,static-mem" defined under the "\chosen" node. This options allows to use
+RTOS as the dom0 kernel, which support only static memory layout.
+
+Below is an DT example:
+
+    / {
+        chosen {
+            #address-cells = <0x1>;
+            #size-cells = <0x1>;
+            xen,static-mem = <0x50000000 0x8000000>;
+            ...
+    };
+
+This will reserve a 128MB region starting at the host physical address
+0x50000000 to be exclusively used by Dom0.
+
 Static Event Channel
 ====================
 The event channel communication will be established statically between two
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7b47abade196..8ee280614813 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -31,6 +31,7 @@
 #include <asm/cpufeature.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 #include <xen/event.h>
 
@@ -2272,6 +2273,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo = KERNEL_INFO_INIT;
+    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
     int rc;
 
     /* Sanity! */
@@ -2305,10 +2307,14 @@ static int __init construct_dom0(struct domain *d)
     d->arch.type = kinfo.type;
 #endif
     find_gnttab_region(d, &kinfo);
-    if ( is_domain_direct_mapped(d) )
-        allocate_memory_11(d, &kinfo);
-    else
+    if ( is_domain_direct_mapped(d) ) {
+        if ( !dt_find_property(chosen, "xen,static-mem", NULL) )
+            allocate_memory_11(d, &kinfo);
+        else
+            assign_static_memory_11(d, &kinfo, chosen);
+    } else {
         allocate_memory(d, &kinfo);
+    }
 
     rc = process_shm_chosen(d, &kinfo);
     if ( rc < 0 )
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 529c91e603ab..563a5436fac0 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -413,6 +413,20 @@ static int __init process_chosen_node(const void *fdt, int node,
         using_static_heap = true;
     }
 
+    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
+    {
+        int rc;
+
+        printk("Checking for static static-mem in /chosen\n");
+
+        rc = device_tree_get_meminfo(fdt, node, "xen,static-mem",
+                                     address_cells, size_cells,
+                                     bootinfo_get_reserved_mem(),
+                                     MEMBANK_STATIC_DOMAIN);
+        if ( rc )
+            return rc;
+    }
+
     printk("Checking for initrd in /chosen\n");
 
     prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
-- 
2.34.1


