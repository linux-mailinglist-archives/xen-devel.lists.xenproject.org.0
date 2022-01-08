Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE5488006
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254715.436552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv9-0007nl-Fk; Sat, 08 Jan 2022 00:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254715.436552; Sat, 08 Jan 2022 00:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv9-0007XC-2D; Sat, 08 Jan 2022 00:49:23 +0000
Received: by outflank-mailman (input) for mailman id 254715;
 Sat, 08 Jan 2022 00:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zv6-000706-JD
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf1291ff-701c-11ec-81c1-a30af7de8005;
 Sat, 08 Jan 2022 01:49:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C82AB827C2;
 Sat,  8 Jan 2022 00:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CBBC36AF3;
 Sat,  8 Jan 2022 00:49:15 +0000 (UTC)
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
X-Inumbo-ID: cf1291ff-701c-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602956;
	bh=+olmyE0Lg6XuJ73hfq8gcQj3c7BupLFwwV9RL76Bu44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNV/gTQeGRQ8f5t89xOrXNtWlbNj9U75IkmCH/6RY5redkMDGlNG1vLgZiNEgMhP/
	 gyXfWgw2jNDAv3J8EqyZR5R9otT9s2PgRUjwUcZomzEjhH1yWYgkCmZd2Ctr0ftZ68
	 l1gvlZ+XC+0UNlLjoykroFfwSOmpLOPADceBNwLG4o4/jI4CILn08OPk8sO69w4MxD
	 IUYmSn830YlpzxRUFGyjmcsHm23P+14kYDxS53zUfEL4u9rNADpgGwGz5ClLY7ZTzc
	 23XMy1ze1Il58U4eG0bBgbXJ/iEP3zJ5Ys5C5eJdAwHPx3dcf8Z1i3ZGSM/ABfq4kD
	 4Ov1JhRy++DaA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH 4/7] xen: introduce xen,enhanced dom0less property
Date: Fri,  7 Jan 2022 16:49:09 -0800
Message-Id: <20220108004912.3820176-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Introduce a new "xen,enhanced" dom0less property to enable/disable PV
driver interfaces for dom0less guests. Currently only "enabled" and
"disabled" are supported property values (and empty). Leave the option
open to implement further possible values in the future (e.g.
"xenstore" to enable only xenstore.)

This patch only parses the property. Next patches will make use of it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
 xen/arch/arm/domain_build.c           |  5 +++++
 xen/arch/arm/include/asm/kernel.h     |  3 +++
 3 files changed, 26 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 71895663a4..38c29fb3d8 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -169,6 +169,24 @@ with the following properties:
     Please note that the SPI used for the virtual pl011 could clash with the
     physical SPI of a physical device assigned to the guest.
 
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
 - nr_spis
 
     Optional. A 32-bit integer specifying the number of SPIs (Shared
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6931c022a2..96a94fa434 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
     struct kernel_info kinfo = {};
+    const char *enhanced;
     int rc;
     u64 mem;
 
@@ -2978,6 +2979,10 @@ static int __init construct_domU(struct domain *d,
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
+    rc = dt_property_read_string(node, "xen,enhanced", &enhanced);
+    if ( rc == -EILSEQ || (rc == 0 && !strcmp(enhanced, "enabled")) )
+        kinfo.enhanced = true;
+
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
 
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 874aa108a7..3275f7fbca 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -36,6 +36,9 @@ struct kernel_info {
     /* Enable pl011 emulation */
     bool vpl011;
 
+    /* Enable PV drivers */
+    bool enhanced;
+
     /* GIC phandle */
     uint32_t phandle_gic;
 
-- 
2.25.1


