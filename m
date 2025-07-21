Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89179B0BFB0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051218.1419514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUV-0005V5-QI; Mon, 21 Jul 2025 09:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051218.1419514; Mon, 21 Jul 2025 09:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUV-0005Si-N9; Mon, 21 Jul 2025 09:07:23 +0000
Received: by outflank-mailman (input) for mailman id 1051218;
 Mon, 21 Jul 2025 09:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j1p=2C=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1udmUU-0005SY-PQ
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:07:22 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4e0c16-6612-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:07:22 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45610582d07so31332265e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:07:22 -0700 (PDT)
Received: from localhost.localdomain (111.142.125.91.dyn.plus.net.
 [91.125.142.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f4289sm153796045e9.7.2025.07.21.02.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:07:20 -0700 (PDT)
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
X-Inumbo-ID: 1c4e0c16-6612-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753088841; x=1753693641; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAzw5GQeDulftsdeM+fNGWQc7tJSJ2/k7O0gxsiOG10=;
        b=TBRCXJCFo8rphMrtg3zLler2oUt5Fwt35A1f8fGi8vxNetrwR7tBLO5JJcUK2sN2Ba
         rIDe+zoXZf9I39aBrLZ4fvqHwTsEyB9iiB2Yh7TdXMvyfh5MFQBVD+JtIS9W4NfTl3cc
         W/oy4S6/l/fX3siMEJeTmj1brLoqEgEpmbspE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753088841; x=1753693641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAzw5GQeDulftsdeM+fNGWQc7tJSJ2/k7O0gxsiOG10=;
        b=hGaO8aPWjLzqHMXejDmlrztq9fUPW22fmPTmxVGP4ISjpVIUlwmEI1kmJ5CJO4m2b1
         UisAwvEMvzMdxIzsSK4m5LCuGslNnkMkCxeOhGuVi8NJKp4E9YlwAyaXUI2syZqyR4MG
         Q1GLQq4CVXtnAL4TeM34I1m/6lQBmlKfZRR4W7vYr7uySy3L65BVtEgizHRXJpduvT13
         dBK1xND8s4NHZmXB2F4IBZ0h1xZk4gx5zviQgYZExl8D/FLin7JvXzggKONbFUVjqf/P
         8DumfpI6nWh21snm1Rk2RD1NA8M7G1AhJSvfz1luFvQCYBGRN18oG6TBTWbymblHJtiU
         hZVQ==
X-Gm-Message-State: AOJu0YxgHiSo5S91S4MU38RGlruEZsoe8OmMFNSmdbTstRA1ljaStnCb
	cBkkoOpu5gq9cCyXcaRkYCUheDmM1vFrjjdTKqflCr5nbf80QSY3bLHhhQbFY8TOjiuHtfDlch5
	bywbtmFc=
X-Gm-Gg: ASbGncsNIpAl/OIa6kzDujAfO1RGBsf8Or2jLq2NsctxGOYzT2Pb3mG+Rbnpew5uwpp
	PU4vijrrVFZsEYc/3njzRYCBm2QmRTR3kOom2jQ8I7lwp4RXDN4JIORNHtqbepDAwQkU4jzr/DB
	/vl6ewJEu7FN5a2j8AAPgpb1QfE0Xezkw99/+LZoZBhLitE2aiGItQTLtrHttYK3O9BZtE5Szpa
	053hg9msp+NWBgm1QaNGqz/zE3y8DRN/xLIOPrGMsdIzM37Ffv4Nkr59EpM4/gp6/6t27TBpUsZ
	iAqHkawqCbM4u+DpSn9INxEt0ou3zoRlM/np1NYZePnDQt82ZIruoD+fCB6udtKYfqm6w5q8tAZ
	kte5MG/+Go5oOPUmcWk6uvX6HLzV9Fb1IlDZV9UmwoLZUzjSvP2jhdtd7PZ66YulSOIQUyZ0=
X-Google-Smtp-Source: AGHT+IGqFjVIWsN2Fq0JlnhMaZ4SuxHM7Xo7f44QTmcFG0FY5gNKt4WuzZnO+PGJjBbsPJY9YJLUJQ==
X-Received: by 2002:a05:600c:c0d2:20b0:456:1e4a:bb5b with SMTP id 5b1f17b1804b1-45635845454mr76964575e9.32.1753088841257;
        Mon, 21 Jul 2025 02:07:21 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/efi: Reuse fdt_setprop_u32 and fdt_setprop_u64
Date: Mon, 21 Jul 2025 10:07:09 +0100
Message-ID: <20250721090713.414324-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721090713.414324-1-frediano.ziglio@cloud.com>
References: <20250721090713.414324-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/arm/efi/efi-boot.h | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 3dbeed3f89..a2aede21d5 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -79,8 +79,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
     prop = fdt_get_property(fdt, node, "#address-cells", &len);
     if ( !prop )
     {
-        val = cpu_to_fdt32(2);
-        if ( fdt_setprop(fdt, node, "#address-cells", &val, sizeof(val)) )
+        if ( fdt_setprop_u32(fdt, node, "#address-cells", 2) )
             return -1;
         *addr_cells = 2;
     }
@@ -90,8 +89,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
     prop = fdt_get_property(fdt, node, "#size-cells", &len);
     if ( !prop )
     {
-        val = cpu_to_fdt32(2);
-        if ( fdt_setprop(fdt, node, "#size-cells", &val, sizeof(val)) )
+        if ( fdt_setprop_u32(fdt, node, "#size-cells", 2) )
             return -1;
         *size_cells = 2;
     }
@@ -251,8 +249,6 @@ static EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
 {
     int node;
     int status;
-    u32 fdt_val32;
-    u64 fdt_val64;
     int num_rsv;
 
    /*
@@ -275,33 +271,28 @@ static EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
         }
     }
 
-    fdt_val64 = cpu_to_fdt64((u64)(uintptr_t)sys_table);
-    status = fdt_setprop(fdt, node, "linux,uefi-system-table",
-                         &fdt_val64, sizeof(fdt_val64));
+    status = fdt_setprop_u64(fdt, node, "linux,uefi-system-table",
+                             (uintptr_t)sys_table);
     if ( status )
         goto fdt_set_fail;
 
-    fdt_val64 = cpu_to_fdt64((u64)(uintptr_t)memory_map);
-    status = fdt_setprop(fdt, node, "linux,uefi-mmap-start",
-                         &fdt_val64,  sizeof(fdt_val64));
+    status = fdt_setprop_u64(fdt, node, "linux,uefi-mmap-start",
+                             (uintptr_t)memory_map);
     if ( status )
         goto fdt_set_fail;
 
-    fdt_val32 = cpu_to_fdt32(map_size);
-    status = fdt_setprop(fdt, node, "linux,uefi-mmap-size",
-                         &fdt_val32,  sizeof(fdt_val32));
+    status = fdt_setprop_u32(fdt, node, "linux,uefi-mmap-size",
+                             map_size);
     if ( status )
         goto fdt_set_fail;
 
-    fdt_val32 = cpu_to_fdt32(desc_size);
-    status = fdt_setprop(fdt, node, "linux,uefi-mmap-desc-size",
-                         &fdt_val32, sizeof(fdt_val32));
+    status = fdt_setprop_u32(fdt, node, "linux,uefi-mmap-desc-size",
+                             desc_size);
     if ( status )
         goto fdt_set_fail;
 
-    fdt_val32 = cpu_to_fdt32(desc_ver);
-    status = fdt_setprop(fdt, node, "linux,uefi-mmap-desc-ver",
-                         &fdt_val32, sizeof(fdt_val32));
+    status = fdt_setprop_u32(fdt, node, "linux,uefi-mmap-desc-ver",
+                             desc_ver);
     if ( status )
         goto fdt_set_fail;
 
-- 
2.43.0


