Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774284EE573
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297160.506150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Jb-0000p8-GS; Fri, 01 Apr 2022 00:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297160.506150; Fri, 01 Apr 2022 00:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Ja-0000dR-TR; Fri, 01 Apr 2022 00:38:58 +0000
Received: by outflank-mailman (input) for mailman id 297160;
 Fri, 01 Apr 2022 00:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5JX-00087e-HS
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:38:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b312796-b154-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 02:38:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C13F9B822B4;
 Fri,  1 Apr 2022 00:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EB2C34115;
 Fri,  1 Apr 2022 00:38:52 +0000 (UTC)
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
X-Inumbo-ID: 1b312796-b154-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773532;
	bh=bKlaACyobMzZqVlommlo53UDbjiZ7/QiZBJFdbFnFaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sr8JLH+zcSmfPwQCUPAKzjR2SLXM3cPGkNvqmUK/Qt0Axlv8YNEXep1m+DUwNFTsK
	 1X3skIp36V/NB7Aua1xcSZzqmfNiwO5Ad+s28fZVAk45823hv2qUXnbDSOYvF1f6ML
	 OTT0DgbwrM+fPBvQ3JfQ2e7nmgKkgaT0XDzX/s3eMqB1Ebm81/geyedF5lV28KFLa0
	 xMCcGdueg5ugJMJ8PH7ZH9X1J1x9EAoBMFWCLoD87IUaLVf9VBCWGP9dr1xHgTGAe2
	 KGQPt1DRwFv/4rPmUgkLGXBYCFnOAHTWf5bcKmXQ08jvaa1+OY9n9aS1ws2t0W4SAL
	 kxpma20BU3j4w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v4 6/9] xen/arm: configure dom0less domain for enabling xenstore after boot
Date: Thu, 31 Mar 2022 17:38:44 -0700
Message-Id: <20220401003847.38393-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

If "xen,enhanced" is enabled, then add to dom0less domains:

- the hypervisor node in device tree
- the xenstore event channel

The xenstore event channel is also used for the first notification to
let the guest know that xenstore has become available.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

---
Changes in v3:
- use evtchn_alloc_unbound

Changes in v2:
- set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
- in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
---
 xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b22fe95d92..a8ad95ce40 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -28,6 +28,7 @@
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
 #include <xsm/xsm.h>
+#include <xen/event.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -2806,6 +2807,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     int ret;
 
     kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
 
     addrcells = GUEST_ROOT_ADDRESS_CELLS;
     sizecells = GUEST_ROOT_SIZE_CELLS;
@@ -2880,6 +2883,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
             goto err;
     }
 
+    if ( kinfo->dom0less_enhanced )
+    {
+        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
+        if ( ret )
+            goto err;
+    }
+
     ret = fdt_end_node(kinfo->fdt);
     if ( ret < 0 )
         goto err;
@@ -3146,6 +3156,25 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
     return 0;
 }
 
+static int __init alloc_xenstore_evtchn(struct domain *d)
+{
+    evtchn_alloc_unbound_t alloc;
+    int rc;
+
+    alloc.dom = d->domain_id;
+    alloc.remote_dom = hardware_domain->domain_id;
+    rc = evtchn_alloc_unbound(&alloc);
+    if ( rc )
+    {
+        printk("Failed allocating event channel for domain\n");
+        return rc;
+    }
+
+    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
+
+    return 0;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -3210,6 +3239,14 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
+    if ( kinfo.dom0less_enhanced )
+    {
+        rc = alloc_xenstore_evtchn(d);
+        if ( rc < 0 )
+            return rc;
+        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+    }
+
     return rc;
 }
 
-- 
2.25.1


