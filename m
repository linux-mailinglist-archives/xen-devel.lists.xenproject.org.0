Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC745CE7E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 21:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230549.398565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHE-0006lA-1z; Wed, 24 Nov 2021 20:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230549.398565; Wed, 24 Nov 2021 20:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHD-0006eC-P6; Wed, 24 Nov 2021 20:53:59 +0000
Received: by outflank-mailman (input) for mailman id 230549;
 Wed, 24 Nov 2021 20:53:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMcq=QL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpzHB-0006Ij-Qo
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 20:53:57 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a385885a-4d68-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 21:53:55 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id m27so10495085lfj.12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 12:53:55 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j11sm97608ljc.9.2021.11.24.12.53.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Nov 2021 12:53:55 -0800 (PST)
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
X-Inumbo-ID: a385885a-4d68-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I5Ua+XOo9ED8QtDOWHq4o6dMZ+6zt8B38QrRs94d3jQ=;
        b=N719U68AvD57cSsDPqL5VUMkg/l6W7dFaBn0ds0pOblImoqD4O8SZtTVbiKUWXvfVM
         QwgG8Z6Ro3SdIlXgsHzI0FIZjBoGs6sAhbvkMgKp55HqgPCIvBZ/bDrqp+nLkExXIDXk
         85VfW8+LD7yFAUgUpvJ/2m018THtiaHbBxWJqD8iahLuB6p5h86QVJOti4p/Vko/73Z+
         qaK9Vh/scmIZQ9BMI7l50DJ1kbaNGmaBXek6irskc4a0CJq/yZOsKvS2cCwp3ouJixdO
         l2ac3Q50aoO+804982jn926QvZK1sKU0l7f4bskWWYtjonKnDPp3c5jE7tbHdbSGR8QN
         +RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I5Ua+XOo9ED8QtDOWHq4o6dMZ+6zt8B38QrRs94d3jQ=;
        b=e9G7dXKebUWbBWV3ZXBwko4Nc8JT4gpT/EEL3qa2BHDvH4ti5EYWBV+jGCrBFdRi83
         Rfaoyi2IyfXhVzhlwvFxpr8/cE4hO8j680yrR07sCluYucCgfAyt3Jx/YCdxWl8Cpz/m
         b89CIbQBreri7yImM8Rwb+WhjTD9UIZ6zNV2z/61s7RCf04080OLhV2l4lA5VtDJCukh
         a0dy9kKA6z2y6UTVL0BjUzOdJ6m9OAbEr8wFKVURuortUyEa7uvPJ5dnre+2jjvx2dQF
         jJZfgp2T0qx3GDYehl/dzXVeSecLQikSjBwswOY9CSTo8XOlZrk3f8cup0wP3MZkz7Px
         +bCg==
X-Gm-Message-State: AOAM533PE6dJzTOfJHuPjdo9dOBIqxXMByL7AfFt4fr3FDbLZMRI40Vj
	CcCOWvJbnky1v6HxjjrprtkxJO3ptlOrVQ==
X-Google-Smtp-Source: ABdhPJwpqCkahz5EbzD+MVB6XyFKIyWyAaQlqRXN5qpJziSHo0yhzGV2dme1YXtZkarUALEtZaAUbg==
X-Received: by 2002:a05:6512:20d4:: with SMTP id u20mr18715939lfr.339.1637787235341;
        Wed, 24 Nov 2021 12:53:55 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V3 2/6] arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT
Date: Wed, 24 Nov 2021 22:53:39 +0200
Message-Id: <1637787223-21129-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Read the start address of the grant table space from DT
(region 0).

This patch mostly restores behaviour before commit 3cf4095d7446
("arm/xen: Use xen_xlate_map_ballooned_pages to setup grant table")
but trying not to break the ACPI support added after that commit.
So the patch touches DT part only and leaves the ACPI part with
xen_xlate_map_ballooned_pages(). Also in order to make a code more
resilient use a fallback to xen_xlate_map_ballooned_pages() if grant
table region wasn't found.

This is a preparation for using Xen extended region feature
where unused regions of guest physical address space (provided
by the hypervisor) will be used to create grant/foreign/whatever
mappings instead of wasting real RAM pages from the domain memory
for establishing these mappings.

The immediate benefit of this change:
- Avoid superpage shattering in Xen P2M when establishing
  stage-2 mapping (GFN <-> MFN) for the grant table space
- Avoid wasting real RAM pages (reducing the amount of memory
  usuable) for mapping grant table space
- The grant table space is always mapped at the exact
  same place (region 0 is reserved for the grant table)

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V2:
   - new patch

Changes V2 -> V3:
   - add __read_mostly specifier to xen_grant_frames
   - retain a fallback to xen_xlate_map_ballooned_pages() if
     xen_grant_frames is invalid
   - process xen_events_irq before xen_grant_frames in
     xen_dt_guest_init()
   - update patch description
---
 arch/arm/xen/enlighten.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 7619fbf..3fb3384 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -59,6 +59,9 @@ unsigned long xen_released_pages;
 struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
 
 static __read_mostly unsigned int xen_events_irq;
+static __read_mostly phys_addr_t xen_grant_frames;
+
+#define GRANT_TABLE_INDEX   0
 
 uint32_t xen_start_flags;
 EXPORT_SYMBOL(xen_start_flags);
@@ -303,6 +306,7 @@ static void __init xen_acpi_guest_init(void)
 static void __init xen_dt_guest_init(void)
 {
 	struct device_node *xen_node;
+	struct resource res;
 
 	xen_node = of_find_compatible_node(NULL, NULL, "xen,xen");
 	if (!xen_node) {
@@ -311,13 +315,19 @@ static void __init xen_dt_guest_init(void)
 	}
 
 	xen_events_irq = irq_of_parse_and_map(xen_node, 0);
+
+	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
+		pr_err("Xen grant table region is not found\n");
+		return;
+	}
+	xen_grant_frames = res.start;
 }
 
 static int __init xen_guest_init(void)
 {
 	struct xen_add_to_physmap xatp;
 	struct shared_info *shared_info_page = NULL;
-	int cpu;
+	int rc, cpu;
 
 	if (!xen_domain())
 		return 0;
@@ -370,12 +380,16 @@ static int __init xen_guest_init(void)
 	for_each_possible_cpu(cpu)
 		per_cpu(xen_vcpu_id, cpu) = cpu;
 
-	xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
-	if (xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
-					  &xen_auto_xlat_grant_frames.vaddr,
-					  xen_auto_xlat_grant_frames.count)) {
+	if (!acpi_disabled || !xen_grant_frames) {
+		xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
+		rc = xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
+										   &xen_auto_xlat_grant_frames.vaddr,
+										   xen_auto_xlat_grant_frames.count);
+	} else
+		rc = gnttab_setup_auto_xlat_frames(xen_grant_frames);
+	if (rc) {
 		free_percpu(xen_vcpu_info);
-		return -ENOMEM;
+		return rc;
 	}
 	gnttab_init();
 
-- 
2.7.4


