Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21723AC46
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f6C-0008KM-Ez; Mon, 03 Aug 2020 18:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6B-0008F4-6y
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:11 +0000
X-Inumbo-ID: 32a454ae-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a454ae-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:51 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x24so3651762lfe.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Mv84D4r2aumLFDv8lYRdBY/1g2sPieE7HeRa3w7RXVY=;
 b=PwJL8Ike+kIqVKmPv4Lw2iCjl0WHNL82j9B4uw9RwQQEO5EPmdiNiZqnuVtuBwWlEU
 Uosmt7kiLnfykZF/8NIzgiZBAu7LpgIadpcmhPbJg0Gda7UiU3wrkRWMUiPhuigx2vjs
 fgx7t8JQD1tYHx8TrRIqw54NcswwDk3NZH2aaOIElQVwKq8Sp1z39JU7Qzq1lGjaycPQ
 3JPYcILbPRH9HhLPT1g3c5iDQH0ALiaBrmpQjlIu9Wx4LIco6LrI8KyePWraS4d8iXFo
 xKXCUm2X4VOAG7sjndU9Ltob7TYxUELO/oTbvE8jO4tQKeaiRJV1i2S7uM3hadfJ41OD
 /Adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Mv84D4r2aumLFDv8lYRdBY/1g2sPieE7HeRa3w7RXVY=;
 b=bRtwMgOxh4WG0Och3XYnuo9a8HbECJPjODlL4vgeiA8OPvjGxQRlxnY0dyNlY76Lnu
 Ri3Fcxzi9NRK+aBhcZP7XUJneuwfTVCOfevr14Z0kyXyp2gCz5hHIG+DanW5gKGKM3jg
 D5JybWIirvyFOSbAiUdvLdeZLAp4vxWmwDwqBUx8SpbtOjD7dybrLqLFM4C1MFuFFYtz
 zx2hUKko1l8qMV2WK/+14//YVZc6lgj7Kt3Pybb+ImyYSJxoWoQp4EHSNuvd2C87sd/f
 q/ZWICF1+IQfVKHBoxL3arpX8scBzDLS5A2w9932rPsdnexeeYOeApJE0FghDWFh/3FH
 WQbA==
X-Gm-Message-State: AOAM5339k+3/wRdXQJnSSEFVEK703B1xdjS436qxBPWB70sIVA2Mx2rv
 ldDaE+AdVs/EN/YWKfx+0xvkDiWQvCI=
X-Google-Smtp-Source: ABdhPJxXWm0JBPyiKEZvceaAoqdJzrLR6fTtwnaGCqNa5E12FxcPBl8d3bee+TF2QDKbf03LyNkhCA==
X-Received: by 2002:a19:c806:: with SMTP id y6mr2705506lff.156.1596478909751; 
 Mon, 03 Aug 2020 11:21:49 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:49 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 05/12] hvm/dm: Introduce xendevicemodel_set_irq_level
 DM op
Date: Mon,  3 Aug 2020 21:21:21 +0300
Message-Id: <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds ability to the device emulator to notify otherend
(some entity running in the guest) using a SPI and implements Arm
specific bits for it. Proposed interface allows emulator to set
the logical level of a one of a domain's IRQ lines.

Please note, this is a split/cleanup of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libs/devicemodel/core.c                   | 18 ++++++++++++++++++
 tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
 tools/libs/devicemodel/libxendevicemodel.map    |  1 +
 xen/arch/arm/dm.c                               | 22 +++++++++++++++++++++-
 xen/common/hvm/dm.c                             |  1 +
 xen/include/public/hvm/dm_op.h                  | 15 +++++++++++++++
 6 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 4d40639..30bd79f 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
     return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
 }
 
+int xendevicemodel_set_irq_level(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
+    unsigned int level)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_set_irq_level *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op.op = XEN_DMOP_set_irq_level;
+    data = &op.u.set_irq_level;
+
+    data->irq = irq;
+    data->level = level;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_set_pci_link_route(
     xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
 {
diff --git a/tools/libs/devicemodel/include/xendevicemodel.h b/tools/libs/devicemodel/include/xendevicemodel.h
index e877f5c..c06b3c8 100644
--- a/tools/libs/devicemodel/include/xendevicemodel.h
+++ b/tools/libs/devicemodel/include/xendevicemodel.h
@@ -209,6 +209,10 @@ int xendevicemodel_set_isa_irq_level(
     xendevicemodel_handle *dmod, domid_t domid, uint8_t irq,
     unsigned int level);
 
+int xendevicemodel_set_irq_level(
+    xendevicemodel_handle *dmod, domid_t domid, unsigned int irq,
+    unsigned int level);
+
 /**
  * This function maps a PCI INTx line to a an IRQ line.
  *
diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
index 561c62d..a0c3012 100644
--- a/tools/libs/devicemodel/libxendevicemodel.map
+++ b/tools/libs/devicemodel/libxendevicemodel.map
@@ -32,6 +32,7 @@ VERS_1.2 {
 	global:
 		xendevicemodel_relocate_memory;
 		xendevicemodel_pin_memory_cacheattr;
+		xendevicemodel_set_irq_level;
 } VERS_1.1;
 
 VERS_1.3 {
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 2437099..8431805 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -20,7 +20,27 @@
 int arch_dm_op(struct xen_dm_op *op, struct domain *d,
                const struct dmop_args *op_args, bool *const_op)
 {
-    return -EOPNOTSUPP;
+    int rc;
+
+    switch ( op->op )
+    {
+    case XEN_DMOP_set_irq_level:
+    {
+        const struct xen_dm_op_set_irq_level *data =
+            &op->u.set_irq_level;
+
+        /* XXX: Handle check */
+        vgic_inject_irq(d, NULL, data->irq, data->level);
+        rc = 0;
+        break;
+    }
+
+    default:
+        rc = -EOPNOTSUPP;
+        break;
+    }
+
+    return rc;
 }
 
 /*
diff --git a/xen/common/hvm/dm.c b/xen/common/hvm/dm.c
index 09e9542..e2e1250 100644
--- a/xen/common/hvm/dm.c
+++ b/xen/common/hvm/dm.c
@@ -47,6 +47,7 @@ static int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
         [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
         [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
+        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index fd00e9d..c45d29e 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -417,6 +417,20 @@ struct xen_dm_op_pin_memory_cacheattr {
     uint32_t pad;
 };
 
+/*
+ * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
+ *                         IRQ lines.
+ * XXX Handle PPIs.
+ */
+#define XEN_DMOP_set_irq_level 19
+
+struct xen_dm_op_set_irq_level {
+    uint32_t irq;
+    /* IN - Level: 0 -> deasserted, 1 -> asserted */
+    uint8_t  level;
+};
+
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -430,6 +444,7 @@ struct xen_dm_op {
         struct xen_dm_op_track_dirty_vram track_dirty_vram;
         struct xen_dm_op_set_pci_intx_level set_pci_intx_level;
         struct xen_dm_op_set_isa_irq_level set_isa_irq_level;
+        struct xen_dm_op_set_irq_level set_irq_level;
         struct xen_dm_op_set_pci_link_route set_pci_link_route;
         struct xen_dm_op_modified_memory modified_memory;
         struct xen_dm_op_set_mem_type set_mem_type;
-- 
2.7.4


