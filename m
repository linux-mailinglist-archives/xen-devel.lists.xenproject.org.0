Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D441D43D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199397.353451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGI-0005Ji-Ew; Thu, 30 Sep 2021 07:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199397.353451; Thu, 30 Sep 2021 07:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGI-0005Gv-BQ; Thu, 30 Sep 2021 07:13:46 +0000
Received: by outflank-mailman (input) for mailman id 199397;
 Thu, 30 Sep 2021 07:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGH-0004B3-9a
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:13:45 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af20419a-75c2-4a4e-b952-e5462fa26285;
 Thu, 30 Sep 2021 07:13:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z24so21166047lfu.13
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:31 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:30 -0700 (PDT)
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
X-Inumbo-ID: af20419a-75c2-4a4e-b952-e5462fa26285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=paCjRVnjfgtH4vjqWfPka1UDhVQcLz7hY/mZa1EMk18=;
        b=h7fp1+CvHJx6R/9JuM6y/TneeLsVMxymOjdZCMKjKOrN4f68MqO4HbcUGdUtFE++gN
         2XyAxRyUDPqM2WAsPBcSbovRYUUP3VfVyo42DO9MNjkFAX/Jcs22p3gVh9CLEDRY4qNl
         ettiWdKMaAcojj9OQ74LO6KTfqw/atujdDB9A3dy1Qq4e77bWYkD2tSehTsOP3csmw/t
         47NvVimcjUAslLm0SzErCZOOFj/TfvPWIy1EfVW+aXvOb+hyz0sQm56ATOLAvz1QTb5s
         oFbGiGwXtzSkQHssxqZpFA0jDvCU+mAKp7Gs9xIlHQSxuosfJl3Ro6b9l7IH9pqryUO3
         3DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=paCjRVnjfgtH4vjqWfPka1UDhVQcLz7hY/mZa1EMk18=;
        b=Snb1M8+6DlhIf3niQ4tJP+0WDsde2vnWeKB1GeW9nmBYaAzjtjwL/qeGEpr7sVnyhI
         Np0j95dCvHfou07Wrk1QIst9BbT0ogowG9WrA89YcigImcl1pm7QL5KcBIAazaawvhFU
         KQ98TpKOjtz9+wznLWkYZYeHsN6QWIYfD/8ItY8szJkSYItdpSy1v3e7CnficlpGoj1A
         7SaXXFnfIhoakiPEscRNOTgsRPqTvRO2TduJ9olOFbk5VWXVlJcPJbkZ6Jel33CABfn9
         bOR6ZTH1aR9cj+MOqNtZMeDJpvoMY/3TDTX1KxRI6K0K0qp+axFju3c/nRO/H7ayjYQB
         VW+w==
X-Gm-Message-State: AOAM530rPsujvVe9lelfb8GZ9kTA0Ir9KZn1ASKkF9tBT43oyYgdnMI0
	YzpKl3eDvOLBECBFdZf6ZOQYNBBYWj0=
X-Google-Smtp-Source: ABdhPJzgK6zEPNoC1RoV6e4MX4dvw0DYh6rJCjA+Ht48/hAjTz1ybEuyJuIEVwZDhLE1L7NXtVbgsg==
X-Received: by 2002:a2e:5354:: with SMTP id t20mr4195057ljd.204.1632986010685;
        Thu, 30 Sep 2021 00:13:30 -0700 (PDT)
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
Subject: [PATCH v3 03/11] xen/arm: Introduce pci_find_host_bridge_node helper
Date: Thu, 30 Sep 2021 10:13:18 +0300
Message-Id: <20210930071326.857390-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Get host bridge node given a PCI device attached to it.

This helper will be re-used for adding PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

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


