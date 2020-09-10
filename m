Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CD62650BB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT9J-0005IE-D0; Thu, 10 Sep 2020 20:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT6N-0004JK-UE
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:27 +0000
X-Inumbo-ID: 562f6348-18ea-4f35-8394-1c3c3864a96d
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 562f6348-18ea-4f35-8394-1c3c3864a96d;
 Thu, 10 Sep 2020 20:22:45 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u4so9847445ljd.10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D6YgogdWC/7PF1kXFZ7Tsu3HScerYpi4Qm+jKi/WJJk=;
 b=aH8XddBQe7AClA/qlAKcgTavnynWzfWu0brAb6E2EdSZVVLeIUpGWuX+NFgQJinIq9
 jHpCF+aroS38SZg3N9KCKwX+Fub3oD5mUEhpu3emZw5MnTQu+NV65NTvCtt7ydUrZwMD
 /g08AepNYOB1fKGVXtzyqllPfZpgs/fI+qZoCo6rk/l7f6ghwCnP1Ugrsx7PQdaSscYU
 jYNWt+v6lGOxjRSOWcBJY//ujkVSFILxybFFmeXVYdww0X4mZg9eYb5US7xIyYSXBi5R
 CAS+GavHeog47L6cltZ2WfWheBC3dRTQZOdcFGvI57hHn2xiPrVoIU0EmOeu2AsGXadc
 va+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D6YgogdWC/7PF1kXFZ7Tsu3HScerYpi4Qm+jKi/WJJk=;
 b=Iugtb88MjYzQmHt8BHdNmVojzgO1aJ58nMy6s7ac+V4WxyqDAQIYDGZUg3g3ySA72p
 b0knLfM4zMwDGOA43tPMCx2uFBCAEbJmCQv9DLUMXVWMR1Tx9sCFxjuyeEY1gocTSbml
 6G3Gs6qnfYxL84U0kjxLWdtnbsLR+4s57n/iXw8vUGDsP9EA9GeiP1MX8yAIHHnVuFuP
 CItCbDXTdsIROfazLVznKsEQJAxF3TiZldaJ/w6FDQ31QYOX1Yq7AdMFmkbi42r73dFX
 /l8zmlbCxAAKcUmELRiXSWWOUi3TPpAckZwPXH5J78sSVTnMfglL8A9GYt4FYst1cqsD
 uVRQ==
X-Gm-Message-State: AOAM5307FMMITL3cE1tJ/eYsByWU3ZyH+rzfPIk5WbkzxZm2uhvaxnCp
 F/GA7Hsx52A+5UxpjABkFbaziLAXtsl9eQ==
X-Google-Smtp-Source: ABdhPJx/gOUa7VYpaB2iQbqnTp5qSWqcEfF0AFwrGFWvuu73V3Ed3TUz3vcsjPkG7sqifQVBK6/lBw==
X-Received: by 2002:a2e:b531:: with SMTP id z17mr5837398ljm.30.1599769363993; 
 Thu, 10 Sep 2020 13:22:43 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:43 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 12/16] xen/dm: Introduce xendevicemodel_set_irq_level DM op
Date: Thu, 10 Sep 2020 23:22:06 +0300
Message-Id: <1599769330-17656-13-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds ability to the device emulator to notify otherend
(some entity running in the guest) using a SPI and implements Arm
specific bits for it. Proposed interface allows emulator to set
the logical level of a one of a domain's IRQ lines.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Please note, I left interface untouched since there is still
an open discussion what interface to use/what information to pass
to the hypervisor. The question whether we should abstract away
the state of the line or not.

Changes RFC -> V1:
   - check incoming parameters in arch_dm_op()
   - add explicit padding to struct xen_dm_op_set_irq_level
---
---
 tools/libs/devicemodel/core.c                   | 18 +++++++++++++
 tools/libs/devicemodel/include/xendevicemodel.h |  4 +++
 tools/libs/devicemodel/libxendevicemodel.map    |  1 +
 xen/arch/arm/dm.c                               | 36 ++++++++++++++++++++++++-
 xen/common/dm.c                                 |  1 +
 xen/include/public/hvm/dm_op.h                  | 15 +++++++++++
 6 files changed, 74 insertions(+), 1 deletion(-)

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
index eb20344..428ef98 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -15,11 +15,45 @@
  */
 
 #include <xen/hypercall.h>
+#include <asm/vgic.h>
 
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
+        /* Only SPIs are supported */
+        if ( (data->irq < NR_LOCAL_IRQS) || (data->irq >= vgic_num_irqs(d)) )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+        if ( data->level != 0 && data->level != 1 )
+        {
+            rc = -EINVAL;
+            break;
+        }
+
+
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
diff --git a/xen/common/dm.c b/xen/common/dm.c
index 060731d..c55e042 100644
--- a/xen/common/dm.c
+++ b/xen/common/dm.c
@@ -47,6 +47,7 @@ static int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
         [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
         [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
+        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index fd00e9d..39567bf 100644
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
+    uint8_t level;
+    uint8_t pad[3];
+};
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


