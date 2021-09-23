Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD8415EEB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194102.345780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFe-0005hz-Qg; Thu, 23 Sep 2021 12:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194102.345780; Thu, 23 Sep 2021 12:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFe-0005ed-Lj; Thu, 23 Sep 2021 12:54:58 +0000
Received: by outflank-mailman (input) for mailman id 194102;
 Thu, 23 Sep 2021 12:54:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFe-0004it-2w
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:54:58 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a781f2b3-ebc0-47c6-9470-1f1b9209b024;
 Thu, 23 Sep 2021 12:54:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i4so26246242lfv.4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:45 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:43 -0700 (PDT)
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
X-Inumbo-ID: a781f2b3-ebc0-47c6-9470-1f1b9209b024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywsVgZmg0atZGESTkNZBQfqFY254EfvmFk14qbemHso=;
        b=S/31GUMsxvRrP1XF6wl+HRwUSizur6tWU9DOrgB+Ip6QXSpropykEsQM6TJxFL5L9y
         8QMiKwqJExoqZMiRbA3aft4VOtivvFty7EZPZK1bWVH/Qw2q3KRqDQdvpNKnpH7zKX6I
         IPNHkrWWsbvafPdYrmNnfkJIe3jaSVS5w3433LAQNq0Hgas1sPNNFWL7jrQcHVxW3/h0
         4frBJ80C9L0z7cTC1nYENtGaOrJq4R7IdXFN4m2P9uwPJywJeF/eLCiXOQsbFvimVN4V
         2LBMK3iCwNMhBapteKX76nLE/2XSbnLWL32t6hu/9UwQm+4A8n2BhbVEeOO6MlK9LbMU
         87HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywsVgZmg0atZGESTkNZBQfqFY254EfvmFk14qbemHso=;
        b=eljRRZvQYD+1irFffV2anWJG3uoNLDSmcif609iBaRvAzvbPCN6NPGDovNabXKx1P+
         ZYx+QsjFNBbto220gIDZOUvGzxHWN8x6Pqlqy6qPuAoQIEyZq4AWMQRt/EsHmrHYvjF0
         fJbBk5CDMqXsvbMYdZcJzxn42+tbF+nppMeAB7e/A6jTcN/lbLRqHfXT/9gp8+4qc806
         zBchb1d4KjwIxgws2zgZhQ5M0UTJ5HC+/yambqji2uOPuE9CBomSa0aKdtjeDM1NOOom
         l+16HOS4tzAb8M/L6RgLTRnkTgMDbO3lMCBUOvaSrEr9JSA8qK0M4gP6z8Uc7sBNSqzr
         P4ig==
X-Gm-Message-State: AOAM530Kv9TZySRdR6g+rCcWRSedvnOWoSUOxXKi//cLqUO7OrQCHVOC
	slJ4+FGaN6WkpTJzXG3Bdc18jSI407wzmg==
X-Google-Smtp-Source: ABdhPJx2xtdoiUQBwDDZezKg8Zgt46DrsOL+/EVGJ+gC9vZkBAAVXbSkfyKXTZZgyCDRekfYMXmE+A==
X-Received: by 2002:a2e:7c0a:: with SMTP id x10mr4967251ljc.455.1632401683981;
        Thu, 23 Sep 2021 05:54:43 -0700 (PDT)
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
Subject: [PATCH v2 03/11] xen/arm: Introduce pci_find_host_bridge_node helper
Date: Thu, 23 Sep 2021 15:54:30 +0300
Message-Id: <20210923125438.234162-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
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
index a88f20175ea9..1567b6e2956c 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -283,6 +283,23 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
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
index 9e366ae67e83..5b100556225e 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -103,6 +103,7 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
 int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                 uint16_t *segment);
+struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
 
 static always_inline bool is_pci_passthrough_enabled(void)
 {
-- 
2.25.1


