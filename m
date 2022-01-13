Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F948CFDD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 01:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256937.441254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oSG-0001sV-Em; Thu, 13 Jan 2022 00:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256937.441254; Thu, 13 Jan 2022 00:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oSG-0001ms-9C; Thu, 13 Jan 2022 00:59:04 +0000
Received: by outflank-mailman (input) for mailman id 256937;
 Thu, 13 Jan 2022 00:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oSE-0000Zm-3P
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 00:59:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe1f07cd-740b-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:59:00 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78DB5B82186;
 Thu, 13 Jan 2022 00:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2990C36AEC;
 Thu, 13 Jan 2022 00:58:57 +0000 (UTC)
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
X-Inumbo-ID: fe1f07cd-740b-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642035538;
	bh=aVeTdpqg6xfKSe5v6f9xUurkpCgdvHnT4ByypG+sUSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCnZc93432xJkVkk1QlGX9v1Tk0FKOmxsIC5dP4w1dcjPN9vsGaKusnNw881CETLl
	 xI97hL7JC8nW5VEDH2kLapMSFZ8VwPoFoN0cOFLBrgfEnbZJgqOlcVabCidNNnJ4BU
	 S3VC3swZ0pJJVUhs5Flw/qTCKZ7Z7WB+QPN1Rqo/+sj1Gtu3y+XW7Nvp0hQKV15+ZM
	 zCq3+vd7pdopJXXOEpXufzNVtLUCNm5UPK0l7fQ+B5yn4DL0CP6E+rRdQYHNDDar8P
	 tzfTr7n0Nt8NAjrA5yCA07/s5WDc+MtpSYKk4OKNWv4Qz2eHhqC9n+3x/J6XovgfxY
	 dBSA9OtWdBE6A==
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
Subject: [XEN PATCH v2 3/5] xen/arm: configure dom0less domain for enabling xenstore after boot
Date: Wed, 12 Jan 2022 16:58:53 -0800
Message-Id: <20220113005855.1180101-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
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
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

---
Changes in v2:
- set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
- in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
---
 xen/arch/arm/domain_build.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9144d6c0b6..251d933c8e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -27,6 +27,7 @@
 #include <asm/setup.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <xen/event.h>
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
@@ -2619,6 +2620,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     int ret;
 
     kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
 
     addrcells = GUEST_ROOT_ADDRESS_CELLS;
     sizecells = GUEST_ROOT_SIZE_CELLS;
@@ -2693,6 +2696,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
@@ -2959,6 +2969,27 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
     return 0;
 }
 
+static int __init alloc_xenstore_evtchn(struct domain *d)
+{
+    struct evtchn *chn;
+    int port;
+
+    if ( (port = get_free_port(d)) < 0 )
+    {
+        printk("Failed allocating event channel for domain\n");
+        return port;
+    }
+    chn = evtchn_from_port(d, port);
+
+    chn->state = ECS_UNBOUND;
+    chn->u.unbound.remote_domid = hardware_domain->domain_id;
+    evtchn_port_init(d, chn);
+
+    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = chn->port;
+
+    return 0;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -3014,7 +3045,19 @@ static int __init construct_domU(struct domain *d,
         return rc;
 
     if ( kinfo.vpl011 )
+    {
         rc = domain_vpl011_init(d, NULL);
+        if ( rc < 0 )
+            return rc;
+    }
+
+    if ( kinfo.dom0less_enhanced )
+    {
+        rc = alloc_xenstore_evtchn(d);
+        if ( rc < 0 )
+            return rc;
+        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+    }
 
     return rc;
 }
-- 
2.25.1


