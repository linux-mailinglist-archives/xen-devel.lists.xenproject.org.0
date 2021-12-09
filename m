Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E946F498
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243313.420932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfp-0005p3-Vx; Thu, 09 Dec 2021 20:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243313.420932; Thu, 09 Dec 2021 20:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfp-0005iO-LZ; Thu, 09 Dec 2021 20:05:49 +0000
Received: by outflank-mailman (input) for mailman id 243313;
 Thu, 09 Dec 2021 20:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OcP=Q2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvPfn-0004Xd-Qu
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:05:47 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65958a26-592b-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 21:05:46 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id 13so10634523ljj.11
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 12:05:47 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o12sm87371lft.134.2021.12.09.12.05.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Dec 2021 12:05:45 -0800 (PST)
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
X-Inumbo-ID: 65958a26-592b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R0fiIRx1tdommq9IGRl8CoXFpUaCu+zHn93/yFjWte8=;
        b=n2HuGtve4aJvc3nlYM9Dz7ywy3oqNGSu7nskjkeAeor14V/8fpk08jcPSZ721Iao3+
         hHMOlkXylq2GcKZg3j54/qELfoGkt4IfF7Qo67vwRASA0+tSnyQdbhQec0oO094ceoOm
         blC4EkWj08hh9wwV9eu1k0VwdU1YRxQotoEp8vFy3tBbAkM/m6nDspgP8lajWCCPDP9K
         Zs13Y+c8Q6Y45uH5mu1eQ9/7pLVa79Nq73lCQilGu9mxZ35DjtLRdGHH+Ds1TKs2eRZD
         ucoPlVDPHqDj9AbJ58Dnzo818RFf8QdDUDOHSwUBVLZXFXKiK9vJbqHFHGI07odQ0p19
         A/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=R0fiIRx1tdommq9IGRl8CoXFpUaCu+zHn93/yFjWte8=;
        b=q9gAhEhJ7TbdJa1pn42Qt0tv9HWo9Il7Uv1NK2/W2bI1XJ7SZIxXcnjccGuIkh2hUK
         ZPM6Jq4nfi9be+Ym2mFwFcHz5qdNFC+98tkK9o3oA42dh/LuZdiWw48MxOXABNI1RkTU
         pNwfejzoOmoXYoiNViIPYvP58Vw/IqVElD+RVKfuB/LcUqOom27WqPNMQZy5rv+DT4cK
         fBCz+rS+spMmN3L4swAZFlBZNIu9cj14nOzzMzVYnzt/yhn8UJd8W09+wkChN3leXsgx
         yCTwDv7srVJ4HdYa0v5pfFTKaBz4O9ftmy+F9KzQFJ7BKNBceacgKk5jGUXvORbDBP2c
         5Gyg==
X-Gm-Message-State: AOAM533Ryp0cvoi4Y2qoAgxVfrPTzyYsqLarp1T4pKiXrfeB/LRph0LB
	sLC0y6TAIQ5Ami6CArM9NVZgWo5oDGyxpA==
X-Google-Smtp-Source: ABdhPJzHrcB9daArwNq3p6osXn8jy3zvVeJEP9xDadJPm3zUWm6zBrzFxOmGFuC7tp0ecBwfSVUZ8g==
X-Received: by 2002:a05:651c:621:: with SMTP id k33mr8233705lje.359.1639080346196;
        Thu, 09 Dec 2021 12:05:46 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 5/6] arm/xen: Read extended regions from DT and init Xen resource
Date: Thu,  9 Dec 2021 22:05:35 +0200
Message-Id: <1639080336-26573-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
References: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch implements arch_xen_unpopulated_init() on Arm where
the extended regions (if any) are gathered from DT and inserted
into specific Xen resource to be used as unused address space
for Xen scratch pages by unpopulated-alloc code.

The extended region (safe range) is a region of guest physical
address space which is unused and could be safely used to create
grant/foreign mappings instead of wasting real RAM pages from
the domain memory for establishing these mappings.

The extended regions are chosen by the hypervisor at the domain
creation time and advertised to it via "reg" property under
hypervisor node in the guest device-tree. As region 0 is reserved
for grant table space (always present), the indexes for extended
regions are 1...N.

If arch_xen_unpopulated_init() fails for some reason the default
behaviour will be restored (allocate xenballooned pages).

This patch also removes XEN_UNPOPULATED_ALLOC dependency on x86.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes RFC -> V2:
   - new patch, instead of
    "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space"

Changes V2 -> V3:
   - update comments in code
   - drop the checks that a region is within the hotpluggable range,
     now the common code takes care of
   - update arch_xen_unpopulated_init() according to interface change,
     move xen_resource here, etc
   - use %pR specifier in error message
   - bait out in arch_xen_unpopulated_init() if !acpi_disabled
   - update checks in second loop in arch_xen_unpopulated_init()
     for the sake of clarity

Changes V3 -> V4:
   - add Stefano's R-b
---
 arch/arm/xen/enlighten.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/xen/Kconfig      |   2 +-
 2 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 49bb675..ec5b082 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -62,6 +62,7 @@ static __read_mostly unsigned int xen_events_irq;
 static __read_mostly phys_addr_t xen_grant_frames;
 
 #define GRANT_TABLE_INDEX   0
+#define EXT_REGION_INDEX    1
 
 uint32_t xen_start_flags;
 EXPORT_SYMBOL(xen_start_flags);
@@ -303,6 +304,111 @@ static void __init xen_acpi_guest_init(void)
 #endif
 }
 
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+/*
+ * A type-less specific Xen resource which contains extended regions
+ * (unused regions of guest physical address space provided by the hypervisor).
+ */
+static struct resource xen_resource = {
+	.name = "Xen unused space",
+};
+
+int __init arch_xen_unpopulated_init(struct resource **res)
+{
+	struct device_node *np;
+	struct resource *regs, *tmp_res;
+	uint64_t min_gpaddr = -1, max_gpaddr = 0;
+	unsigned int i, nr_reg = 0;
+	int rc;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	if (!acpi_disabled)
+		return -ENODEV;
+
+	np = of_find_compatible_node(NULL, NULL, "xen,xen");
+	if (WARN_ON(!np))
+		return -ENODEV;
+
+	/* Skip region 0 which is reserved for grant table space */
+	while (of_get_address(np, nr_reg + EXT_REGION_INDEX, NULL, NULL))
+		nr_reg++;
+
+	if (!nr_reg) {
+		pr_err("No extended regions are found\n");
+		return -EINVAL;
+	}
+
+	regs = kcalloc(nr_reg, sizeof(*regs), GFP_KERNEL);
+	if (!regs)
+		return -ENOMEM;
+
+	/*
+	 * Create resource from extended regions provided by the hypervisor to be
+	 * used as unused address space for Xen scratch pages.
+	 */
+	for (i = 0; i < nr_reg; i++) {
+		rc = of_address_to_resource(np, i + EXT_REGION_INDEX, &regs[i]);
+		if (rc)
+			goto err;
+
+		if (max_gpaddr < regs[i].end)
+			max_gpaddr = regs[i].end;
+		if (min_gpaddr > regs[i].start)
+			min_gpaddr = regs[i].start;
+	}
+
+	xen_resource.start = min_gpaddr;
+	xen_resource.end = max_gpaddr;
+
+	/*
+	 * Mark holes between extended regions as unavailable. The rest of that
+	 * address space will be available for the allocation.
+	 */
+	for (i = 1; i < nr_reg; i++) {
+		resource_size_t start, end;
+
+		/* There is an overlap between regions */
+		if (regs[i - 1].end + 1 > regs[i].start) {
+			rc = -EINVAL;
+			goto err;
+		}
+
+		/* There is no hole between regions */
+		if (regs[i - 1].end + 1 == regs[i].start)
+			continue;
+
+		start = regs[i - 1].end + 1;
+		end = regs[i].start - 1;
+
+		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
+		if (!tmp_res) {
+			rc = -ENOMEM;
+			goto err;
+		}
+
+		tmp_res->name = "Unavailable space";
+		tmp_res->start = start;
+		tmp_res->end = end;
+
+		rc = insert_resource(&xen_resource, tmp_res);
+		if (rc) {
+			pr_err("Cannot insert resource %pR (%d)\n", tmp_res, rc);
+			kfree(tmp_res);
+			goto err;
+		}
+	}
+
+	*res = &xen_resource;
+
+err:
+	kfree(regs);
+
+	return rc;
+}
+#endif
+
 static void __init xen_dt_guest_init(void)
 {
 	struct device_node *xen_node;
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 33e941e..120d32f 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -327,7 +327,7 @@ config XEN_FRONT_PGDIR_SHBUF
 
 config XEN_UNPOPULATED_ALLOC
 	bool "Use unpopulated memory ranges for guest mappings"
-	depends on X86 && ZONE_DEVICE
+	depends on ZONE_DEVICE
 	default XEN_BACKEND || XEN_GNTDEV || XEN_DOM0
 	help
 	  Use unpopulated memory ranges in order to create mappings for guest
-- 
2.7.4


