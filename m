Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B17445FB3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222026.384086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnF-0002rY-Kp; Fri, 05 Nov 2021 06:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222026.384086; Fri, 05 Nov 2021 06:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnF-0002i1-BL; Fri, 05 Nov 2021 06:33:41 +0000
Received: by outflank-mailman (input) for mailman id 222026;
 Fri, 05 Nov 2021 06:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1misnD-0001ER-Hv
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:33:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f8eac75-3e02-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:33:38 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id j21so29439095edt.11
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:33:38 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e12sm3599870ejs.86.2021.11.04.23.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:33:37 -0700 (PDT)
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
X-Inumbo-ID: 4f8eac75-3e02-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LylF1cpLHbISjBJqhF+mgwyYAEJHR3syGzKHfKTNLi4=;
        b=Gb1Tzc+FiWeAo4gYgZJI7/zVVhxSsRR70ZC7KSuPQvNGguptQB3sNexSAp5CwJI5VJ
         /K2eB1ZF8c98NyO/gtNCcQKPCZni/nPcUtnYGaX1mcSNU1P1u839zJDKFkRcYZlAgVxS
         PfUwixFuQgTRq9ATCMli/7FLRqm/QVwsQ8a//7FSGlnj1JOirpsL0ctL2Nx58pgE6/X6
         x+gtsipn21Vr0nhRB5c0q1UtxPSeSe+aqIRW6ZeFKNiEylI37ZWSoz+tuWvO54ratC3m
         xZ4ihes4NrAbGYrkOTH+FY30KwAgvEH2kPptjphIpP9HTLNEFSszxF3vDm7HKkS6qRGp
         iWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LylF1cpLHbISjBJqhF+mgwyYAEJHR3syGzKHfKTNLi4=;
        b=eXtkw8VwrXPw88OZ55aO5RS8DgS+v8kGzOHn8A5hol3dSujPxZD6ObFHbtlQH5KIfG
         lKFxoA6E2o056IKyuN5iJZUogpnCKpKpCo1y32nyRzbtyNTlETiwAEUY5dkMrDxqsjS6
         aB/t3bHXFwFCfmzclZLClMq8ivVHzJ20AOYdY4Eu/3v3fqbqwyZRCPf8ZIGXKpJUfvUg
         xnIJ/g2GJBVjgzlRR4hmwHtBx7HOFm9UmBlR/STCN40Fbt8h5oq5jwf9v9z36U0ufJ3x
         Z6K9+jsTiyaghfpuD9zbYO3aItzhXIg0p3QdpK0vNmLC4GZo4hDORThVGRF8Xzt+OCTB
         4PkQ==
X-Gm-Message-State: AOAM532ei8AhDJeJdt/mKFkalIpY3EruU3MMr/9FHoFgvVgqPps8DF8W
	WYZCHtfMNDyTKx/COKCyWOlRM/2FhMAVfA==
X-Google-Smtp-Source: ABdhPJx6KXyOXUui/Xab210y17uEpTCWAHBBf70htETILb3uWGGNACWCe6wxS5hfGSRplFUVJGz2Tw==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr68670282ejc.101.1636094018309;
        Thu, 04 Nov 2021 23:33:38 -0700 (PDT)
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
Subject: [PATCH v6 7/7] xen/arm: do not use void pointer in pci_host_common_probe
Date: Fri,  5 Nov 2021 08:33:26 +0200
Message-Id: <20211105063326.939843-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105063326.939843-1-andr2000@gmail.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There is no reason to use void pointer while passing ECAM ops to the
pci_host_common_probe function as it is anyway casted to struct pci_ecam_ops
inside. For that reason remove the void pointer and pass struct pci_ecam_ops
pointer as is.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

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
index 6af845ab9d6c..1aad664b213e 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -194,15 +194,13 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
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
 
-    ops = (struct pci_ecam_ops *) data;
-
     bridge = pci_alloc_host_bridge();
     if ( !bridge )
         return -ENOMEM;
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 3d706fdd1d88..4199e0267d24 100644
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


