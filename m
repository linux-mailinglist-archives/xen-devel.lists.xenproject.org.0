Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734945B60E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230150.397944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC8-0007qO-ML; Wed, 24 Nov 2021 07:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230150.397944; Wed, 24 Nov 2021 07:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC8-0007g9-AT; Wed, 24 Nov 2021 07:59:56 +0000
Received: by outflank-mailman (input) for mailman id 230150;
 Wed, 24 Nov 2021 07:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnC5-000641-To
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:54 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8199097e-4cfc-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:59:53 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id l22so4951015lfg.7
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:53 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:52 -0800 (PST)
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
X-Inumbo-ID: 8199097e-4cfc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MOZs5e3kpEpL+b+deAV/zwFnsBBkhNnhQEIpK1qMuJ0=;
        b=RIJUOX3nHwSi2SR6buZMi5SQHDAQreoujMtCVvw4wVMs5Oc/LmzuHHJhOGAM0sfwwG
         7X9RXZhD/MEsLRjSkiZM16h17sG6FnVWrvw+Rtlv0sBZOAkj9uPa1VZ17riqXoT8u0Wh
         ki4KPsEPLTtLthMTZzZ/sXpNmz/wb5vhHgYlYbp6wDW2RU5FxIDK86y9YDWBmcsp4q5M
         42p6bJNsdWhFZxX72dDLH5KyYs+g+/7CU3+rPTPjDE0DJ6oFY4fC0URsrvpCRtRa/kxw
         /9pFL/SiB39tlqQnm54ecZSC5u5KePTqlTDFmVkuES4qJjXZW66c905CDlhLZbUcy8YL
         EmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MOZs5e3kpEpL+b+deAV/zwFnsBBkhNnhQEIpK1qMuJ0=;
        b=Ritzh5t+FgpLKvcarBSHzCsuoRZp5NMpfe8AIqvMKqQLJS0xopYJ7P5j2VFaxa+Uyq
         y9cXnseZtC9jr+IfgjdqFyglgb5htf6+0E8+69XXQ+m2im7dZ0y3pure1urmRfC3OcK/
         Loypq2CGn+QEaVn9TTOhoLR6cMY2WOPyVWiD1xec05cch/4WiSAsPz7fsB737UROMVHQ
         8sWOwYO6/bvN8Bdv7ltXJbgjdeVb+D5IxpVaTVcgnKwbmYwCwYQXf8j3CCcieuojY8a4
         1KP9PxOdx5KFKRNDPB4M2Ma35mAqiW3rR8262mr9bXsJXochpVH3dc+1Syt9cQ466tTm
         yMkQ==
X-Gm-Message-State: AOAM530OJ47mkyIJKhwRnkOsgijdQAoiTHFxU57v7U6bMmma+e/RZ5+U
	SaAvh67tzA2ef/N8pRomK40i7RbM3g9dxg==
X-Google-Smtp-Source: ABdhPJx+u46xX+7n/0n6dnGmme9l1Kx67ttIOWgvMxAk+0FuvAplKaRIkj3mbLKrtDkacbpLOzy3TQ==
X-Received: by 2002:a19:3844:: with SMTP id d4mr11647104lfj.64.1637740792674;
        Tue, 23 Nov 2021 23:59:52 -0800 (PST)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 7/7] xen/arm: do not use void pointer in pci_host_common_probe
Date: Wed, 24 Nov 2021 09:59:42 +0200
Message-Id: <20211124075942.2645445-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There is no reason to use void pointer while passing ECAM ops to the
pci_host_common_probe function as it is anyway casted to struct pci_ecam_ops
inside. For that reason remove the void pointer and pass struct pci_ecam_ops
pointer as is.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
New in v4
---
 xen/arch/arm/pci/ecam.c            | 4 ++--
 xen/arch/arm/pci/pci-host-common.c | 6 ++----
 xen/include/asm-arm/pci.h          | 5 +++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 4f71b11c3057..6aeea12a68bf 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -24,8 +24,8 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                pci_sbdf_t sbdf, uint32_t where)
 {
     const struct pci_config_window *cfg = bridge->cfg;
-    struct pci_ecam_ops *ops =
-        container_of(bridge->ops, struct pci_ecam_ops, pci_ops);
+    const struct pci_ecam_ops *ops =
+        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
     unsigned int devfn_shift = ops->bus_shift - 8;
     void __iomem *base;
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 1b18480adf02..b1a26eb840ab 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -198,18 +198,16 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
     return domain;
 }
 
-int pci_host_common_probe(struct dt_device_node *dev, const void *data)
+int pci_host_common_probe(struct dt_device_node *dev,
+                          const struct pci_ecam_ops *ops)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
-    struct pci_ecam_ops *ops;
     int err;
 
     if ( dt_device_for_passthrough(dev) )
         return 0;
 
-    ops = (struct pci_ecam_ops *) data;
-
     bridge = pci_alloc_host_bridge();
     if ( !bridge )
         return -ENOMEM;
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 679fc83f713b..7c7449d64fca 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -65,7 +65,7 @@ struct pci_host_bridge {
     struct list_head node;           /* Node in list of host bridges */
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config window */
-    struct pci_ops *ops;
+    const struct pci_ops *ops;
 };
 
 struct pci_ops {
@@ -94,7 +94,8 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
 
-int pci_host_common_probe(struct dt_device_node *dev, const void *data);
+int pci_host_common_probe(struct dt_device_node *dev,
+                          const struct pci_ecam_ops *ops);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
-- 
2.25.1


