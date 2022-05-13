Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E43526C0F
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328779.551934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVe-000558-UM; Fri, 13 May 2022 21:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328779.551934; Fri, 13 May 2022 21:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcVe-0004uS-NN; Fri, 13 May 2022 21:07:38 +0000
Received: by outflank-mailman (input) for mailman id 328779;
 Fri, 13 May 2022 21:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npcVd-0004iU-DJ
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:07:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b617fc19-d300-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 23:07:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACE056230D;
 Fri, 13 May 2022 21:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1601BC3411A;
 Fri, 13 May 2022 21:07:34 +0000 (UTC)
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
X-Inumbo-ID: b617fc19-d300-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652476054;
	bh=Ao43GnpqxHR84y8XoXXvJ3ZaIgOqQ7vWofKWca/Apio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=idr/0x5CANAdy1Tko83H1Sr454IZKUWXeevc40M/F42wODgi8syHoElKjhiPQsvs6
	 ZIOnJuggDpo46gPl8qqhK+G4UdItwis/bCY7G+wNWXtHu6eKfPG0qBOw9Qs6pkRxOA
	 9G9tMe2cGS92hBOEebaLoUFzuceNPnVplSV8/fvJ1A6b7vNRfVV/SO+aaV4vM3Gw1g
	 8iXDW3KDQXYLN04jpZdmG4pyAtNYLl12MXy8vIoU79bfDL+ARZfI4+R2bVBadRjb3e
	 j0zoYxbvuocoz5QOW/DEIVEYQtjrEDSwad1ysgiUEI12x95wSI6p1Niu2/78aAVRgG
	 GN3/Em7cKdKhQ==
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
Subject: [PATCH v7 4/7] xen/arm: configure dom0less domain for enabling xenstore after boot
Date: Fri, 13 May 2022 14:07:27 -0700
Message-Id: <20220513210730.679871-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

---
Changes in v7:
- add an ASSERT, hardware_domain is required

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
---
 xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++++++++
 xen/common/event_channel.c  |  2 +-
 xen/include/xen/event.h     |  3 +++
 3 files changed, 41 insertions(+), 1 deletion(-)
---
 xen/arch/arm/domain_build.c | 38 +++++++++++++++++++++++++++++++++++++
 xen/common/event_channel.c  |  2 +-
 xen/include/xen/event.h     |  3 +++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8d148b209d..27b2c7ec3f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -27,6 +27,7 @@
 #include <asm/setup.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <xen/event.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -2813,6 +2814,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     int ret;
 
     kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
 
     addrcells = GUEST_ROOT_ADDRESS_CELLS;
     sizecells = GUEST_ROOT_SIZE_CELLS;
@@ -2887,6 +2890,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
@@ -3153,6 +3163,25 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
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
@@ -3222,6 +3251,15 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
+    if ( kinfo.dom0less_enhanced )
+    {
+        ASSERT(hardware_domain);
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


