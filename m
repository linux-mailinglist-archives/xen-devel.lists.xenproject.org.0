Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97951562F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317704.537186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgL-0007pb-1l; Fri, 29 Apr 2022 20:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317704.537186; Fri, 29 Apr 2022 20:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXgK-0007lP-Tt; Fri, 29 Apr 2022 20:57:40 +0000
Received: by outflank-mailman (input) for mailman id 317704;
 Fri, 29 Apr 2022 20:57:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkXgJ-0007P4-Cb
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 20:57:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0041747c-c7ff-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 22:57:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4DD73B83794;
 Fri, 29 Apr 2022 20:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E9EC385B0;
 Fri, 29 Apr 2022 20:57:35 +0000 (UTC)
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
X-Inumbo-ID: 0041747c-c7ff-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651265856;
	bh=mE2HS7cDM2V9DWF5yzqxb8sXkvTRkVIrepnZA+OkhKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G4HvHg9HPiKKsbtcHa7IGELkoLHK9uN02Pbp1q123bahHC1v2EDOjAD8y1VRvK8pd
	 6A0/a7cg8Rh+bMtslA9g3G51G1lEKr/823JV+w1HIRzWqR23c8J3XNIbaIqCf8FjO1
	 28D3qS370JWOgtWaFlt3D/9FbTtxTO6gPQHFXFfG3KHhUCTB8U3sN803YsuNa1gflz
	 cHPNSjHUcBkdt3OJiRgyG1vRMbLT29nlE6C1GUp/WSfqAAVdl5fA/lSeIkzur3K+t3
	 ncvdrcAeefYBH1S763t56I9typP+lgODqFmX0yGdqvBDn3OxksKKCP4FkHQf08B7Ss
	 3ITQqIj+bJhlw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 4/7] xen/arm: configure dom0less domain for enabling xenstore after boot
Date: Fri, 29 Apr 2022 13:57:29 -0700
Message-Id: <20220429205732.2030094-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Export evtchn_alloc_unbound and make it __must_check.

If "xen,enhanced" is enabled, then add to dom0less domains:

- the hypervisor node in device tree
- the xenstore event channel

The xenstore event channel is also used for the first notification to
let the guest know that xenstore has become available.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>

---
I removed Bertrand's reviewed-by due to merging this patch with "xen:
export evtchn_alloc_unbound"

Changes in v5:
- merge with "xen: export evtchn_alloc_unbound"
- __must_check

Changes in v3:
- use evtchn_alloc_unbound

Changes in v2:
- set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
- in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound

xen: export evtchn_alloc_unbound

It will be used during dom0less domains construction.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++++++++
 xen/common/event_channel.c  |  2 +-
 xen/include/xen/event.h     |  3 +++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a877ccf585..249efbf804 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -27,6 +27,7 @@
 #include <asm/setup.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <xen/event.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -2809,6 +2810,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     int ret;
 
     kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
 
     addrcells = GUEST_ROOT_ADDRESS_CELLS;
     sizecells = GUEST_ROOT_SIZE_CELLS;
@@ -2883,6 +2886,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
@@ -3149,6 +3159,25 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
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
@@ -3213,6 +3242,14 @@ static int __init construct_domU(struct domain *d,
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
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index ffb042a241..2f6a89f52d 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -289,7 +289,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
-static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 {
     struct evtchn *chn;
     struct domain *d;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..f3021fe304 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -71,6 +71,9 @@ void evtchn_free(struct domain *d, struct evtchn *chn);
 /* Allocate a specific event channel port. */
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 
+/* Allocate a new event channel */
+int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc);
+
 /* Unmask a local event-channel port. */
 int evtchn_unmask(unsigned int port);
 
-- 
2.25.1


