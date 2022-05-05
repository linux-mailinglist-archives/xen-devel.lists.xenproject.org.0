Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE6A51B494
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321179.542138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB6-0000V0-2Z; Thu, 05 May 2022 00:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321179.542138; Thu, 05 May 2022 00:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPB5-0000Hm-Ls; Thu, 05 May 2022 00:17:07 +0000
Received: by outflank-mailman (input) for mailman id 321179;
 Thu, 05 May 2022 00:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPB2-0007ib-IW
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:17:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae66ea89-cc08-11ec-a406-831a346695d4;
 Thu, 05 May 2022 02:17:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6C5F61D46;
 Thu,  5 May 2022 00:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B62C385B2;
 Thu,  5 May 2022 00:16:59 +0000 (UTC)
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
X-Inumbo-ID: ae66ea89-cc08-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651709819;
	bh=E9MSaccIsafpyB3w94QGDZQ01xMK5vlE5XQ9xApFP8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWuCYpHaMtY1a2m/mVJcnt9ZaoqlCQSly0zRsecEpEhEUv00xb6ysU98BpbbGmHNo
	 mzpC1T5eGczmunbZKFCKKv1Quulp+Zb2yKj2z+fiwcVzWPCP6RCcZ3UoAFAiCyLPAz
	 d8ey2GVFPYrXVjdFmpVgUOmYaIFBNnOM/YLB076Ca/eUDTlH4UXQW8AkNx8D6B+Z+X
	 iTI2DvKEqMYy4AuTBH4y2j8ZerRGDL3u92wHfUU4N4Y/YUL8eLW9Ui7MiX2brKHgRo
	 YWy6rfud5XG8LbyQgZ+mgXr0J07dgQiY8GTusa6e/ReyR7U44UWmPZ+K5Tj7r5nkPg
	 itZEpo81JhRyg==
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
	jbeulich@suse.com
Subject: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling xenstore after boot
Date: Wed,  4 May 2022 17:16:53 -0700
Message-Id: <20220505001656.395419-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: jbeulich@suse.com

---
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
index 016f56a99f..bb430f2189 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -27,6 +27,7 @@
 #include <asm/setup.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <xen/event.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -2810,6 +2811,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     int ret;
 
     kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
 
     addrcells = GUEST_ROOT_ADDRESS_CELLS;
     sizecells = GUEST_ROOT_SIZE_CELLS;
@@ -2884,6 +2887,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
@@ -3150,6 +3160,25 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
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
@@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain *d,
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
index 0a82eb3ac2..e60cd98d75 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -290,7 +290,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
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


