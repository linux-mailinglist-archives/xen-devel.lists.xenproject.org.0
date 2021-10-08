Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A5426458
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204330.359484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirH-0008FL-Qo; Fri, 08 Oct 2021 05:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204330.359484; Fri, 08 Oct 2021 05:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirH-0008CN-NR; Fri, 08 Oct 2021 05:55:51 +0000
Received: by outflank-mailman (input) for mailman id 204330;
 Fri, 08 Oct 2021 05:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirG-0007cA-Jm
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:55:50 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed7e8cc1-4239-4f45-8045-5b34d893a9a8;
 Fri, 08 Oct 2021 05:55:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y26so34944528lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:41 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:40 -0700 (PDT)
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
X-Inumbo-ID: ed7e8cc1-4239-4f45-8045-5b34d893a9a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EUxyn0W/J9FSEJt/oYDsZ4o/QnKV7HT+djJUv5IJGRI=;
        b=FOHeQrPpZjYnooNZoJwcDT+3DsxC7jSXr0W62SmV6caWCd9lQwvAm+woeZ84HrSy8C
         wcj5F9sgXkqc2rQqDAxnc0LAj5WNybYKIIJxPsCffDMF0/UqdzXIxbyNLU9Us5OnhOE/
         F38tNM5+VU7HjSAxwtMytOdTgqLiTfRoDuUS8ORW5yjmm13zkM2bHWAMBVznfRVfkjl3
         rpJBF+8o18GItAHoAmDNdWYYxvthFdd9ZGPJCTGqhR5J3j6UExtc06qbyKnFfoSQkgZL
         71JFOK4QDeIQy/KkM4FiO48iayIr0i4m2VYfLp1HJyu108kte47sfl+1vs2rloZD/2tN
         Uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUxyn0W/J9FSEJt/oYDsZ4o/QnKV7HT+djJUv5IJGRI=;
        b=WcPvAzEwT5u3Pz/Q424gWlNqlFSglK7ReC0sGZmEE/ObbGFEmTm6k47iWjOI8UOdC2
         X49jTVDc2buAuvkzAadUuDm9qKTAZZcAHyhYc/+p6eJ3eyUOR37zcxzooA2B47ibIk6U
         cEXIEDwUwNySkl95z6QaohyozizNqaOA2SDAL4uj9RPoK4t3+v1K8vbclEfLTxHc6QLM
         Ec71BP6XkJBekf0uL+ghlMOUp1+ooX3YeN3hatx0yPqpdhUIsNwG6+DFoJNBx7+3Gnlq
         wbvr9dGdPTacRNPPQCQd4m3mLDYVYlW3UPHqCU+1P/6+J8llWuphatDDUh+f+PLTTWll
         oqGA==
X-Gm-Message-State: AOAM530H8xeW39bUdrssGL66EcpmbEiFJAbUBXmkd8V02/yH28ePM3pK
	sE2m3qvNK6V0j/eyTEZTfPcCwRWkpIU=
X-Google-Smtp-Source: ABdhPJzpgP/E37Fhmrcnp+lC6oW8HAGf4BnPXjfohPryrmrhNQPYI3/Cf15FFhtcGNbKCrjKVfxDgg==
X-Received: by 2002:a05:6512:3502:: with SMTP id h2mr8706956lfs.415.1633672540556;
        Thu, 07 Oct 2021 22:55:40 -0700 (PDT)
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
Subject: [PATCH v5 02/10] xen/arm: Introduce pci_find_host_bridge_node helper
Date: Fri,  8 Oct 2021 08:55:27 +0300
Message-Id: <20211008055535.337436-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Get host bridge node given a PCI device attached to it.

This helper will be re-used for adding PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
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
index 7a91ebbdaf0c..9aa8eca53175 100644
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


