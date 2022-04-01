Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FFB4EE571
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297158.506134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Ja-0000VX-5E; Fri, 01 Apr 2022 00:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297158.506134; Fri, 01 Apr 2022 00:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5JZ-0000Ix-MH; Fri, 01 Apr 2022 00:38:57 +0000
Received: by outflank-mailman (input) for mailman id 297158;
 Fri, 01 Apr 2022 00:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JW-00087e-HM
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aa9e15e-b154-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 02:38:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1EB84618B4;
 Fri,  1 Apr 2022 00:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94378C340F3;
 Fri,  1 Apr 2022 00:38:51 +0000 (UTC)
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
X-Inumbo-ID: 1aa9e15e-b154-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773531;
	bh=4iBLNVmcXHYfyGJi5ahq2ucMYYpPYTlArhpqmmGmD68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nugHhDmuLVPBKwkBQFWcN8GC9tJA2q4fcSaHcK1pdagbiVrSuwuVgnIop0kIBoH/A
	 aJHeqD8LdELqK4dxoaghbBO3GwG+TR2bHcIfjeCbEjBWkO1UvO5DGiUzH5YWGcqA1Q
	 rv7xy4fNT/pXsPDiRrlot0E+ZO5M4Mm7K5A4IgklNkUyjMtyQ+oP0cYm3A1hb/6s66
	 jo7xAfSO6mmPiLY4uK0xbsN/nkpW/cCpBMbXKKiFyZg4+6Z8xNpgsyOcCwSUhcQekv
	 Rfkv/xxDn79yK18/6YuXoX6M+ScGfnifrhJYX0vHMmQYmaVpcjq99PyjhVcqZj8E5N
	 M05PTB8JymzxQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v4 5/9] xen: introduce xen,enhanced dom0less property
Date: Thu, 31 Mar 2022 17:38:43 -0700
Message-Id: <20220401003847.38393-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce a new "xen,enhanced" dom0less property to enable/disable PV
driver interfaces for dom0less guests. Currently only "enabled" and
"disabled" are supported property values (and empty). Leave the option
open to implement further possible values in the future (e.g.
"xenstore" to enable only xenstore.)

The configurable option is for domUs only. For dom0 we always set the
corresponding property in the Xen code to true (PV interfaces enabled.)

This patch only parses the property. Next patches will make use of it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
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

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index a94125394e..92097c4969 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -188,6 +188,24 @@ with the following properties:
     An empty property to request the memory of the domain to be
     direct-map (guest physical address == physical address).
 
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
index 100a4959a8..b22fe95d92 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3150,6 +3150,7 @@ static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
     struct kernel_info kinfo = {};
+    const char *dom0less_enhanced;
     int rc;
     u64 mem;
 
@@ -3165,6 +3166,12 @@ static int __init construct_domU(struct domain *d,
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
+    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
+    if ( rc == -EILSEQ ||
+         rc == -ENODATA ||
+         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
+        kinfo.dom0less_enhanced = true;
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


