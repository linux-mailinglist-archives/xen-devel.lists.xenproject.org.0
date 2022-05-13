Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C708526C0E
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328778.551928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVe-0004vg-Du; Fri, 13 May 2022 21:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328778.551928; Fri, 13 May 2022 21:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVe-0004qb-7c; Fri, 13 May 2022 21:07:38 +0000
Received: by outflank-mailman (input) for mailman id 328778;
 Fri, 13 May 2022 21:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npcVd-0004Ds-76
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:07:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b65a4bf4-d300-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 23:07:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 312F0B831E2;
 Fri, 13 May 2022 21:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E1FC34118;
 Fri, 13 May 2022 21:07:33 +0000 (UTC)
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
X-Inumbo-ID: b65a4bf4-d300-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652476053;
	bh=sl1hbeFkH4WN0bbZ/wxmpn+D3pl0OgZL21wS4PaGxQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q9cPPBtkA/LZhGum/x+AFW+4w3kU9mgs3jshltQa37DYHjVAxTXUuUuZyMpPKVj1z
	 HlqnquIiYyhTOTqjW9rZLoJMsxqOMfxpI1DOoeLORnxLIimFRBLYLYYsNLOc4VVdI2
	 V4J44zFV3nn52rzXUCsKapO8VfC/Yrbh6b36mYZMnamPOLQZV2S5E99Jxk6mccx9HW
	 pdH0w0GDczTfGemutZzgrZwW7k6kOHqmvyPkpY2zbrrkc75ACOmTx+1sTwBmhvEOZx
	 EQEzAKDJR0CJmWV1RZGFboOxKbV9s1ebNssmTkD90CQXVVeTDMqSYjKlgeVrb3+ydm
	 EEs22t5JoWeVw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v7 3/7] xen: introduce xen,enhanced dom0less property
Date: Fri, 13 May 2022 14:07:26 -0700
Message-Id: <20220513210730.679871-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce a new "xen,enhanced" dom0less property to enable/disable PV
driver interfaces for dom0less guests. Currently only "enabled" and
"disabled" are supported property values (and empty). Leave the option
open to implement further possible values in the future (e.g.
"xenstore" to enable only xenstore.) Dom0 presence is required for now
to use "xen,enhanced" on a domU.

The configurable option is for domUs only. For dom0 we always set the
corresponding property in the Xen code to true (PV interfaces enabled.)

This patch only parses the property. Next patches will make use of it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v7:
- add a check if dom0 is missing and xen,enhanced was specified
- Bertrand gave his reviewed-by but I removed it due to the new check

Changes in v4:
- move xen,enhanced to the bottom of the list
- do not set kinfo.dom0less_enhanced for dom0

Changes in v3:
- improve commit message

Changes in v2:
- rename kinfo.enhanced to kinfo.dom0less_enhanced
- set kinfo.dom0less_enhanced to true for dom0
- handle -ENODATA in addition to -EILSEQ
---
 docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
 xen/arch/arm/domain_build.c           |  7 +++++++
 xen/arch/arm/include/asm/kernel.h     |  3 +++
 3 files changed, 28 insertions(+)
---
 docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
 xen/arch/arm/domain_build.c           | 12 ++++++++++++
 xen/arch/arm/include/asm/kernel.h     |  3 +++
 3 files changed, 33 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 7b4a29a2c2..98253414b8 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -193,6 +193,24 @@ with the following properties:
     Optional. Handle to a xen,cpupool device tree node that identifies the
     cpupool where the guest will be started at boot.
 
+- xen,enhanced
+
+    A string property. Possible property values are:
+
+    - "enabled" (or missing property value)
+    Xen PV interfaces, including grant-table and xenstore, will be
+    enabled for the VM.
+
+    - "disabled"
+    Xen PV interfaces are disabled.
+
+    If the xen,enhanced property is present with no value, it defaults
+    to "enabled". If the xen,enhanced property is not present, PV
+    interfaces are disabled.
+
+    In the future other possible property values might be added to
+    enable only selected interfaces.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c4dd211b91..8d148b209d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3157,6 +3157,7 @@ static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
     struct kernel_info kinfo = {};
+    const char *dom0less_enhanced;
     int rc;
     u64 mem;
 
@@ -3172,6 +3173,17 @@ static int __init construct_domU(struct domain *d,
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
+    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
+    if ( rc == -EILSEQ ||
+         rc == -ENODATA ||
+         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
+    {
+        if ( hardware_domain )
+            kinfo.dom0less_enhanced = true;
+        else
+            printk("Error: tried to use xen,enhanced without dom0\n");
+    }
+
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
 
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 874aa108a7..c4dc039b54 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -36,6 +36,9 @@ struct kernel_info {
     /* Enable pl011 emulation */
     bool vpl011;
 
+    /* Enable PV drivers */
+    bool dom0less_enhanced;
+
     /* GIC phandle */
     uint32_t phandle_gic;
 
-- 
2.25.1


