Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A67645CE79
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 21:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230551.398581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHF-000732-3O; Wed, 24 Nov 2021 20:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230551.398581; Wed, 24 Nov 2021 20:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHE-0006ru-Jl; Wed, 24 Nov 2021 20:54:00 +0000
Received: by outflank-mailman (input) for mailman id 230551;
 Wed, 24 Nov 2021 20:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMcq=QL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpzHC-0006Ii-Se
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 20:53:58 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4d87cc0-4d68-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 21:53:58 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id r26so10535304lfn.8
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 12:53:57 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j11sm97608ljc.9.2021.11.24.12.53.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Nov 2021 12:53:57 -0800 (PST)
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
X-Inumbo-ID: a4d87cc0-4d68-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6BK2WZwb7zq+nPDby6saZ0ECEZqzY7Q9bsnh/xJVDtQ=;
        b=DkhUoPEN5m+YhS0lj/KCPaF95+pgtJLV5AHPKag6SzOXvNY8l/RXclREtUmZBRXscQ
         w5L+m8mw81fWWD6/E4znSDcSPnrJzgzHKoUFBsWENKP80jotPoLGwbYn3R5HifysInuH
         Uivjr6j/0kWaIam3Hs3m3s2HMrn2zjLLGFrIEbkq3A7k71iyLEBAspL/4RH9/Lq6907o
         LEQBmA6woloWkcHZ/v7JD/WbkdPUzyNd+wxQIV09bGMkL6ruQjYv9JYLVHD793Sf4syE
         f1SmLonhVWMSayC5fvRhjuy+cDukmAAXmCFj+yvwpbZI7hO2YJDJJ/g9zI+SXXsdRtu1
         ht+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6BK2WZwb7zq+nPDby6saZ0ECEZqzY7Q9bsnh/xJVDtQ=;
        b=to21QupI2Pu2XPkQjp8/SSeDV+7e00CSx6iKvLhh0lNsbWUdysHLceu+I+f9yraKTq
         sqGdKuK2z7+xPQEbT8Xduca+/6OsSq5oNtUWVOLZs37R0QLkLZ1URtR23fNgGojaC6Oz
         C0S5qdYk+4viaNEdu8/Iib9yqXOX0VrJjgwUEXTDwgjva0MuwD7bVPYBfX/vXvyesSAv
         HTRd7OnT0m2lorPMRAqXtvbKCF66NDmMDbMBVUDWf1i0bDDjq6KeKUEgi6ICmxS4Cvtn
         FoObICGLxX5t3h37nxccRRheWgTAmxYEPoAKUis4pvO/+wbjfbbS6A3YojsTn2tvH16k
         2d9Q==
X-Gm-Message-State: AOAM531wSq15HJ+ofS9MwZ//wh5ZZJQVSz32Dhdc+V1Spq781PXWO2tZ
	rFvuaWy2MawYaY4yBRSoV/f+df1CmrgalQ==
X-Google-Smtp-Source: ABdhPJxBc8gDofCcpBfj+VeGAsm146fKsnDAoZr0N7d3GVfA5RjaGuaXAWpczZc9US5dPuW598oREg==
X-Received: by 2002:a05:6512:3763:: with SMTP id z3mr18059562lft.315.1637787237574;
        Wed, 24 Nov 2021 12:53:57 -0800 (PST)
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
Subject: [PATCH V3 5/6] arm/xen: Read extended regions from DT and init Xen resource
Date: Wed, 24 Nov 2021 22:53:42 +0200
Message-Id: <1637787223-21129-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>

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
---
 arch/arm/xen/enlighten.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/xen/Kconfig      |   2 +-
 2 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 3fb3384..019caa6 100644
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
index a1b11c62..553b614 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -321,7 +321,7 @@ config XEN_FRONT_PGDIR_SHBUF
 
 config XEN_UNPOPULATED_ALLOC
 	bool "Use unpopulated memory ranges for guest mappings"
-	depends on X86 && ZONE_DEVICE
+	depends on ZONE_DEVICE
 	default XEN_BACKEND || XEN_GNTDEV || XEN_DOM0
 	help
 	  Use unpopulated memory ranges in order to create mappings for guest
-- 
2.7.4


