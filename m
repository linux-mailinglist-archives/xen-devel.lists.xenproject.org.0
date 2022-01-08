Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BD488008
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254712.436526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv7-0007FS-Ko; Sat, 08 Jan 2022 00:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254712.436526; Sat, 08 Jan 2022 00:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv7-0007Ap-Cg; Sat, 08 Jan 2022 00:49:21 +0000
Received: by outflank-mailman (input) for mailman id 254712;
 Sat, 08 Jan 2022 00:49:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zv5-0006ZD-8T
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce942e4f-701c-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 01:49:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 952C362051;
 Sat,  8 Jan 2022 00:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B41C36AE5;
 Sat,  8 Jan 2022 00:49:16 +0000 (UTC)
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
X-Inumbo-ID: ce942e4f-701c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602956;
	bh=EGPEVLXhWQH12aVdIUkqLBGXZpzA81egp2OEZ8dJ6zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HxHAQ4ErTsDgZTJVOsdvzFyply9bIp/SE/doo34v6kN8UKl56zqHxHibiShim1DCc
	 eBQpyhrRJuJm/gUm9SMcDbT/A3js3eECbvhVfFRyrBwm5OV6VEqH6U7XDuCP5Qo2kT
	 wBua1BMGnNrlpJPtWqlRm1IzynYf2bC0S7Zkx+VxVvgi3DRzO2iozqOoLgq/hqRceA
	 zgA4XAQ1R0Vs++rCzsX5KEj34miWSUbjdZGdqLVGvjNSQibghoVj9Sf7Z1/U77Z8Pa
	 29ZcCso8tfkE1QFCrRxpQpYHHc25J1bsnR+30DiIvnIodDTESBNRkQMlgEXqP55qyE
	 F3huguX6N8eKA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH 5/7] xen/arm: configure dom0less domain for enabling xenstore after boot
Date: Fri,  7 Jan 2022 16:49:10 -0800
Message-Id: <20220108004912.3820176-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
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
 xen/arch/arm/domain_build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 96a94fa434..fafa921aa8 100644
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
 
+    if ( kinfo->enhanced )
+    {
+        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
+        if ( ret )
+            goto err;
+    }
+
     ret = fdt_end_node(kinfo->fdt);
     if ( ret < 0 )
         goto err;
@@ -2959,6 +2969,22 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
     return 0;
 }
 
+static int alloc_xenstore_evtchn(struct domain *d)
+{
+    struct evtchn *chn;
+
+    chn = _evtchn_alloc_unbound(d, hardware_domain->domain_id);
+    if ( !chn )
+    {
+        printk("Failed allocating event channel for domain\n");
+        return -ENOMEM;
+    }
+
+    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = chn->port;
+
+    return 0;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -3012,7 +3038,14 @@ static int __init construct_domU(struct domain *d,
         return rc;
 
     if ( kinfo.vpl011 )
+    {
         rc = domain_vpl011_init(d, NULL);
+        if ( rc < 0 )
+            return rc;
+    }
+
+    if ( kinfo.enhanced )
+        rc = alloc_xenstore_evtchn(d);
 
     return rc;
 }
@@ -3068,6 +3101,7 @@ void __init create_domUs(void)
             panic("Error creating domain %s\n", dt_node_name(node));
 
         d->is_console = true;
+        d->arch.is_dom0less = true;
 
         if ( construct_domU(d, node) != 0 )
             panic("Could not set up domain %s\n", dt_node_name(node));
-- 
2.25.1


