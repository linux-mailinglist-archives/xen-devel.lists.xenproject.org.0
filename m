Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83557C8544
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 14:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616517.958586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGuU-0005Qd-95; Fri, 13 Oct 2023 12:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616517.958586; Fri, 13 Oct 2023 12:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGuU-0005O4-6S; Fri, 13 Oct 2023 12:04:54 +0000
Received: by outflank-mailman (input) for mailman id 616517;
 Fri, 13 Oct 2023 12:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ujq9=F3=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qrGuS-0005Ny-W7
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 12:04:53 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5ae1354-69c0-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 14:04:50 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c9b7c234a7so17448845ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 05:04:50 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.106])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a170902c94200b001c9bc811d4dsm3715579pla.295.2023.10.13.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 05:04:48 -0700 (PDT)
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
X-Inumbo-ID: b5ae1354-69c0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697198689; x=1697803489; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ry4/LCNTdbZ4EvfbzADgRgQgr8xvdGsE0jpEd2PH6lQ=;
        b=qgPisz8zBz2+hwCiFLzdw7Y6A3bHsD7v6K5k7U1VKaK0d1T7SQAHKaXImCIv+7PB5W
         uYrYDQjdhCCtKGDxNE4u8jemI9NDA4BNnVutqAfx7pvWklmD5QaO42UZZy0vwSg88tb1
         Q64Njiy45zgfcYWfRE1jUEPxcAEGI5M0vQWQsi2xTMcVrHZjrMR+u/3YHBgeCNVPp2ov
         aXVpkRCBLyCtPz6vs7UZbCDIApjaIZqx4J7CBhh6oyvDKPWjoqlzJki4Nali85Iidtzi
         9R4AzW9XcfcZVhE3lWupIOReiHyLqqUnY5wqmR9yWH6ySZOw1sAGbkzZdH8NCt+89iEO
         A2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697198689; x=1697803489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ry4/LCNTdbZ4EvfbzADgRgQgr8xvdGsE0jpEd2PH6lQ=;
        b=s0wAUeYrf/d0gDTCUU4hN9uUr0ULQnpgQ4Nd8nHGHPbiG2bFFLeTcFfB3dLlp1lfqT
         kq/0bE5pa2JuWgLh3LZrpEoybkpZ6GWNI4UVFDEoW/ocQTHAawjb7ZUv/5jo6OG6Y+f0
         6/GVI0+s3oI1BNMBsQ42OjudNr9eim6SWb2VZzteASETNuWJhqLVxTXisZum/vLvQfC2
         jErfR+pASA6BF9htRxgdBQvUXPDcyULFkAxKW6oM0OU8uGK2yVmtVGR4c3jtxnbSEib/
         78okCDR8kkiN7KUD+FmC11qyI0Dx6IApIkzv5e/mBXg/StbgrnL8q06SH9IFugJNYxEN
         oGow==
X-Gm-Message-State: AOJu0Yxfrzo1JNL9azf96VCCZZtO0X9OHjlPM3uOaZG7w5hdcy05FCd6
	MPKyRpjQrmJ3ASIlV5z0WExUmdWC7MPyy7KJebUB6A==
X-Google-Smtp-Source: AGHT+IEl56i0P8YmfP8mZyHyf948PqBwA9LZkW5U7zuhilo2RaUZJvsHq6DyAjEEZijI7IX/TcGh4g==
X-Received: by 2002:a17:902:c948:b0:1c5:fa71:22fb with SMTP id i8-20020a170902c94800b001c5fa7122fbmr33573331pla.65.1697198688781;
        Fri, 13 Oct 2023 05:04:48 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4] xen/arm: Skip memory nodes if not enabled
Date: Fri, 13 Oct 2023 20:04:42 +0800
Message-Id: <20231013120442.1267488-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Xen doesn't check the status property of memory/reserved
memory nodes, which may lead to the following issues:

- If a memory node has a status "disabled" it implies that it should
  not be used. Xen does not handle the status property for the memory
  node and ends up using it.

- If a reserved memory node has a status "disabled", it means that this
  region is no longer reserved and can be used, but the "disabled"
  status is not handled by Xen.

  Xen passes the intact device tree binding of the reserved memory nodes
  to Dom0 and creates a memory node to cover reserved regions. Disabled
  reserved memory nodes are ignored by the Dom0 Linux kernel, thus the
  Dom0 Linux kernel will continue to allocate pages from such a region.

  On the other hand, since the disabled status is not handled by Xen,
  the disabled reserved memory regions are excluded from the page
  management in Xen which results in Xen being unable to obtain the
  corresponding MFN, in the end, Xen reports error like:

  (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc

This patch introduces a function device_tree_node_is_available(). If it
detects a memory node is not enabled, Xen will not add the memory region
into the memory lists. In the end, this avoids to generate the memory
node for the disabled memory regions sent to the kernel and the kernel
cannot use the disabled memory nodes any longer.

Since this patch adds checking device node's status in the
device_tree_get_meminfo() function, except it checks for memory nodes
and reserved memory nodes, it also supports status for static memory
and static heap.

Suggested-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes from v3:
- Refined the commit log to avoid ambiguous description (Michal Orzel).

Changes from v2:
- Added checking for the DT property length (Julien Grall, Michal Orzel).

Changes from v1:
- Renamed function to device_tree_node_is_available() (Michal Orzel);
- Polished coding style (Michal Orzel);
- Refined commit log (Michal Orzel, Julien Grall).

 xen/arch/arm/bootfdt.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 2673ad17a1..d73f8e4971 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -16,6 +16,24 @@
 #include <xsm/xsm.h>
 #include <asm/setup.h>
 
+static bool __init device_tree_node_is_available(const void *fdt, int node)
+{
+    const char *status;
+    int len;
+
+    status = fdt_getprop(fdt, node, "status", &len);
+    if ( !status )
+        return true;
+
+    if ( len > 0 )
+    {
+        if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
+            return true;
+    }
+
+    return false;
+}
+
 static bool __init device_tree_node_matches(const void *fdt, int node,
                                             const char *match)
 {
@@ -97,6 +115,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     paddr_t start, size;
     struct meminfo *mem = data;
 
+    if ( !device_tree_node_is_available(fdt, node) )
+        return 0;
+
     if ( address_cells < 1 || size_cells < 1 )
     {
         printk("fdt: property `%s': invalid #address-cells or #size-cells",
-- 
2.39.2



