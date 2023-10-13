Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C07C8307
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616399.958375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFQL-0000Rf-N3; Fri, 13 Oct 2023 10:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616399.958375; Fri, 13 Oct 2023 10:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFQL-0000P7-Jq; Fri, 13 Oct 2023 10:29:41 +0000
Received: by outflank-mailman (input) for mailman id 616399;
 Fri, 13 Oct 2023 10:29:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ujq9=F3=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qrFQK-0000P1-Lu
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:29:40 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 688b3807-69b3-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 12:29:38 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c9d922c039so15886385ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 03:29:38 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.106])
 by smtp.gmail.com with ESMTPSA id
 ns17-20020a17090b251100b0027cbc50b826sm3350745pjb.17.2023.10.13.03.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 03:29:35 -0700 (PDT)
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
X-Inumbo-ID: 688b3807-69b3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697192976; x=1697797776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MA9x/skHn3vQ/PZqbQKe6wkO3sRssK/cxCNgR45Ydo=;
        b=erIwSiejN5FZcSczN7wmaJMAIHIzUONW6djZVTnJrMmWH96UyoYBVDB8ZNc5/f1if5
         c0sYCIgTFMXjnI+tAwjvpJ5KNbOkCecHpa+XIKqwygSPQCVJnIU769eNmpmBuuuG7D3B
         2fx8i2mQZSLRo+NpKUZcg1LKY/1OxdNNZrQVHFc1mkO/eZws+PZz2YhbDHCURG3gksB5
         5mFn/8Pf3m1e7YD6Za2KVo+BEoThMY4mNlchFox4AEMShmVS1WPlsVb4YF56Ri6D00eT
         XVG/TfUyUv6oSv/sHboKwmftyS9UCJLqpzkW2CnJPNPIO1yGbu2XA1XVmoNa2ShC6euY
         GnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697192976; x=1697797776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MA9x/skHn3vQ/PZqbQKe6wkO3sRssK/cxCNgR45Ydo=;
        b=tXlrNlYcTHiPC3pVqmqrkRSVHqKLHrL5nASVaxFwGIY6SgIX+nBFGG9y8dpcULSIqX
         3WvBDG5L4zthYYRF60guS3M2AjJLyeWP1N3Dq3P2tLt6g4UCcLdBcufOTl6LhVq0YgBH
         oCV6YzfBfgbrV+9RSajszBstK2CeFWKbjpCQ1iOmACeNT1m5Re6Olw8UuNaW2ia1/Puh
         Nod9MuR1g3lMIr+rKSIiLU5MjtsBGZwYT5YnQ1wrKEXCbVJo/bf1EB+zghY8703NnV5c
         yJTRahTJnIGRaLM8wY1NexDJohMXnuP7EaoXU/tGEiWp2qFicnzZmGg4899uMFx/7qOL
         9mCw==
X-Gm-Message-State: AOJu0YyYyaa7BCRoqxon3Kn0lzMeVKUwHMDcQ6npxprH2XMCetzYafmL
	ObhUCw2rWmSKDOYHSzADIkHb+f7v6setl5+Ll6anHg==
X-Google-Smtp-Source: AGHT+IEOQbheLHPwVkVpoyT5IetwHAIptf4mP4B9M7MFS7IuD9ABKpGK7UCmpmeXg8ACJeSLIb4WUg==
X-Received: by 2002:a17:90a:e610:b0:27d:63c:34f2 with SMTP id j16-20020a17090ae61000b0027d063c34f2mr6861152pjy.41.1697192976191;
        Fri, 13 Oct 2023 03:29:36 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3] xen/arm: Skip memory nodes if not enabled
Date: Fri, 13 Oct 2023 18:29:29 +0800
Message-Id: <20231013102929.1266849-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the Xen hypervisor doesn't handle the status, the issue can
be described from two perspectives: the memory nodes and the reserved
memory nodes.

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
---

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


