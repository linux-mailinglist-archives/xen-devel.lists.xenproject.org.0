Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4B442111F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201467.355974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhJ-0000IX-0A; Mon, 04 Oct 2021 14:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201467.355974; Mon, 04 Oct 2021 14:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhI-0000Fq-Sd; Mon, 04 Oct 2021 14:12:04 +0000
Received: by outflank-mailman (input) for mailman id 201467;
 Mon, 04 Oct 2021 14:12:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhH-0008QG-DL
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:03 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d1dcbb3-cf72-42f4-b41d-3dccba6c6d2d;
 Mon, 04 Oct 2021 14:11:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b20so72639255lfv.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:11:59 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:11:57 -0700 (PDT)
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
X-Inumbo-ID: 6d1dcbb3-cf72-42f4-b41d-3dccba6c6d2d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6SnkOg3n8e3cKJ07G/rY49f9q+Znw0T7C7j0b8OToUE=;
        b=cG3bTjz1jG08qYOXTlqDkOVKK6Tg673becU6zGcsV/7A2cAwe7yX+KGh9RDSf3gYpq
         Kz0RCQi9yqcM2Zwsb257xGhctCVFRdpcQsF4Q+KEMyYQIhnyyC2/aYIOYtVwDJeAoQL3
         4kfFLdH20LTN2Gj4DoTAMB/dQO9EWm5x+GO5X3XTgheRLMMseqaTHTVE7AhZedsiQnO1
         7SkNLG+45kk6n8ws49Du7rmm6Gzf7moLsJCxMWgcpHUhm3HPojpIOihojoCtUH5Id6Qs
         gu5vqXMmVPkWYRaitGnOJIPy3BB46drDrXe+ierlC/yl/Qwo/2/AlRqCkoFd98fFIORz
         G/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6SnkOg3n8e3cKJ07G/rY49f9q+Znw0T7C7j0b8OToUE=;
        b=mbNYvbCXX96n2XtVo3KapwZD7QfaCBRrpyCbKagBzTiaSfZN2FXx3EFAUd/GMxDy2Z
         HQXe3l0Hei4Idq+cbpnFOMsOkyMB1oLG8fj92JjJajwjrgKS6xokifrrwWv3YHkFfu8b
         UTFEK9xZCwl9tfE2lceMxJw8m5j02TQpeV6K3HuYhli/Zd6hUmaPVbK9bTvI5zf7KNej
         PB55kXZLZHWh+llTAQqnO81lujnBmkh34HOr8nbAT9RfYUgyxqUTcB3EJ89op9/qsiaN
         xOHCJuGeXx/+vTQicEhQzwKQ+Sn1Xr3IjuOc8QPjz50231gPOg8QWmSGq8CG1JeVPkoU
         9IGA==
X-Gm-Message-State: AOAM5330ddfyC3DM1/3sZFmCcCwUbCxP5BZg3MHFiWZu4o+q0j3r9QjY
	lvM0rJlLGtamp6QT0wJg4NX8tyXfJbA=
X-Google-Smtp-Source: ABdhPJzpujgVo0AAnDsvX0/mO7rPD9uSovOIu8r7ciZeOT0kK7o5OIiRJSqZhSSxGquwC3JhyagoMg==
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr15846457ljc.70.1633356717899;
        Mon, 04 Oct 2021 07:11:57 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 03/11] xen/arm: Introduce pci_find_host_bridge_node helper
Date: Mon,  4 Oct 2021 17:11:43 +0300
Message-Id: <20211004141151.132231-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Get host bridge node given a PCI device attached to it.

This helper will be re-used for adding PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Since v2:
 - !! dropped Stefano's r-b because of the changes
 - s/PRI_pci/%pp after rebase onto Arm series
---
 xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
 xen/include/asm-arm/pci.h          |  1 +
 2 files changed, 17 insertions(+)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 593beeb48ce4..592c01aae5bb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -276,6 +276,22 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
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
+        printk(XENLOG_ERR "Unable to find PCI bridge for %pp\n", &pdev->sbdf);
+        return NULL;
+    }
+    return bridge->dt_node;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 603a1fc072d1..e6d4000e2ac8 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -99,6 +99,7 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
 int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                 uint16_t *segment);
+struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
 
 static always_inline bool is_pci_passthrough_enabled(void)
 {
-- 
2.25.1


