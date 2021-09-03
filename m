Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372D33FFC18
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177838.323580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eG-0007ma-B1; Fri, 03 Sep 2021 08:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177838.323580; Fri, 03 Sep 2021 08:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eG-0007jr-68; Fri, 03 Sep 2021 08:34:08 +0000
Received: by outflank-mailman (input) for mailman id 177838;
 Fri, 03 Sep 2021 08:34:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4eE-0006kQ-Cm
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:06 +0000
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d791cd72-1871-4ccf-817a-e51d3db5b6c3;
 Fri, 03 Sep 2021 08:33:53 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r7so6926076edd.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:53 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:52 -0700 (PDT)
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
X-Inumbo-ID: d791cd72-1871-4ccf-817a-e51d3db5b6c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LGWgNsGMc39sVj5QGdwU3RC9MH61fd0rOAc+HjnetL4=;
        b=jzF3nEIJXkuxIUCpc0qM5Oiu8hLlldWQ+Lz0hhNI2Ub1RMF3Qbrij1SFl/emQEQscX
         OctS5kVKgfSmIlkAEokYDlh7KTdaWXM0wDAYf9/2NdD6neoTsa3t2DKhbRd5ZdUKiPOx
         S2PsK64LPXN+uZeNXjPPxgQjMJjKSFc6YGWqsQVbMF6xtxnZDnoHezWhH2nT/vwym0Yv
         0CNidcd1Mx+4PJKuDXmrq2uXK50XYtdBR/DUdsISNvXiS0MjoUtZx7LKVdsMWZlTQkxu
         ruWxAhOgTOoVzm1FC+ANk+ZBh3e633gonZWlfdEMs3pAoxm7xgjBcF1AwkgxVuzftbjM
         lmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LGWgNsGMc39sVj5QGdwU3RC9MH61fd0rOAc+HjnetL4=;
        b=gFEF3vI+84Y3nriEaeUXr/5nOWigp71+vuqb1g44w9QEEMom02M9m8dU9IVlOyNYhN
         AWRc1uk4LSOfu3GqcZwGnvreAVYrqjp7b1N6Kacs5p3hkVCgNPPtb6JF6d2hk1k9d5iw
         lYZfj4mx7X4+yEMowDQzY2EeXQYF5XQpuZ66Yw5Gv/9GRf864HTgAOEUbtk+t1AyY//c
         bvvWAiye7e1aNAQigt4y0UVP/CL/QACcniAUFHLhHZhHtgxDXBdvSATthqFlqO8V8lfy
         Cn0XzcsvgWI1LYYyBGMmCZqTeSU4/+ZaMw94Az14P/p+jCCc8in/H00i4t0K+jI/TxjW
         0JDA==
X-Gm-Message-State: AOAM533T29VmwjjdpxeGBjsIw1GF/1YGfe5TF4KSgBNOw6Q+nUGLh3O7
	OLuWyYoVesOzLVpY14INbxAW2qVrYXQ=
X-Google-Smtp-Source: ABdhPJzoCD96lMsn4O6MjQ9c1RPiG7IXqQPjSOWYZAYm2R5Ns/eebk9CaPXrFjkNmkqhirqr1Rp1sg==
X-Received: by 2002:a05:6402:4d:: with SMTP id f13mr2792315edu.275.1630658032768;
        Fri, 03 Sep 2021 01:33:52 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 03/11] xen/arm: Introduce pci_find_host_bridge_node helper
Date: Fri,  3 Sep 2021 11:33:39 +0300
Message-Id: <20210903083347.131786-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Get host bridge node given a PCI device attached to it.

This helper will be re-used for adding PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/arm/pci/pci-host-common.c | 17 +++++++++++++++++
 xen/include/asm-arm/pci.h          |  1 +
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 5e34252deb9d..d2fef5476b8e 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -301,6 +301,23 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+/*
+ * Get host bridge node given a device attached to it.
+ */
+struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
+{
+    struct pci_host_bridge *bridge;
+    struct pci_dev *pdev = dev_to_pci(dev);
+
+    bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( unlikely(!bridge) )
+    {
+        printk(XENLOG_ERR "Unable to find PCI bridge for "PRI_pci"\n",
+               pdev->seg, pdev->bus, pdev->sbdf.dev, pdev->sbdf.fn);
+        return NULL;
+    }
+    return bridge->dt_node;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index e1aa05190bda..7dc4c8dc9026 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -105,6 +105,7 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
 int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                 uint16_t *segment);
+struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
 
 #else   /*!CONFIG_HAS_PCI*/
 
-- 
2.25.1


