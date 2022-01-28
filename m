Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5B4A02DF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 22:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262146.454292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYrr-0001gO-CV; Fri, 28 Jan 2022 21:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262146.454292; Fri, 28 Jan 2022 21:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDYrr-0001e9-8w; Fri, 28 Jan 2022 21:33:15 +0000
Received: by outflank-mailman (input) for mailman id 262146;
 Fri, 28 Jan 2022 21:33:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDYrp-0001cx-ME
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 21:33:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e45ac956-8081-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 22:33:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0C6961EA2;
 Fri, 28 Jan 2022 21:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48118C340E7;
 Fri, 28 Jan 2022 21:33:10 +0000 (UTC)
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
X-Inumbo-ID: e45ac956-8081-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643405590;
	bh=YK3fmTEfi9K2Ficig+PWAtwXSeRhCCBhmIzpGhNdTvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kALIBh445OYoredSX29fwx2QMuUsON3Ykd9WBMP0xTv1jPh3BzHc4tnLGjAOOx35z
	 6KAEEMhg2+lYywXJpZZeI0kty2+R6Qaq6JpLNnrOZ87oTeRhCR8mWmWUzQ3pvG2rGb
	 UAIc4jiqOz9HHjqkj9WSeQegqi6JUOkqArsdXAiJlujQxFrKITAjMwUENaF1MQ1kR9
	 bnMn/Rw71iHRJJBknYr30eJYYn4XuejGTrKUlO/aQxMlbHjYMxTs3JC8B3yLhvitji
	 a0Z46GLIOM3Au1C0XKjIyXNa03IHHQwIdXeLldTyoMNiVOuvFf/Vq4jPy9ABJutkuc
	 UzfgDxHz+DyCg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3 1/5] xen: introduce xen,enhanced dom0less property
Date: Fri, 28 Jan 2022 13:33:02 -0800
Message-Id: <20220128213307.2822078-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
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
Changes in v3:
- improve commit message

Changes in v2:
- rename kinfo.enhanced to kinfo.dom0less_enhanced
- set kinfo.dom0less_enhanced to true for dom0
- handle -ENODATA in addition to -EILSEQ
---
 docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
 xen/arch/arm/domain_build.c           |  8 ++++++++
 xen/arch/arm/include/asm/kernel.h     |  3 +++
 3 files changed, 29 insertions(+)

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
index 6931c022a2..9144d6c0b6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
     struct kernel_info kinfo = {};
+    const char *dom0less_enhanced;
     int rc;
     u64 mem;
 
@@ -2978,6 +2979,12 @@ static int __init construct_domU(struct domain *d,
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
+    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
+    if ( rc == -EILSEQ ||
+         rc == -ENODATA ||
+         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
+        kinfo.dom0less_enhanced = true;
+
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
 
@@ -3095,6 +3102,7 @@ static int __init construct_dom0(struct domain *d)
 
     kinfo.unassigned_mem = dom0_mem;
     kinfo.d = d;
+    kinfo.dom0less_enhanced = true;
 
     rc = kernel_probe(&kinfo, NULL);
     if ( rc < 0 )
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


