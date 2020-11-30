Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26DF2C8260
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40896.73915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdS-00035s-Fm; Mon, 30 Nov 2020 10:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40896.73915; Mon, 30 Nov 2020 10:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdS-00035F-CP; Mon, 30 Nov 2020 10:42:22 +0000
Received: by outflank-mailman (input) for mailman id 40896;
 Mon, 30 Nov 2020 10:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgUs-0000Uu-E5
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:30 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5285bf49-6a37-4c47-b49e-5de333c5ec0c;
 Mon, 30 Nov 2020 10:32:18 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id r18so17057209ljc.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:18 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:16 -0800 (PST)
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
X-Inumbo-ID: 5285bf49-6a37-4c47-b49e-5de333c5ec0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vLq3q1p9DK/8+swqd0EF1XmAyuyBf4cp5s4Q1EQ0uO8=;
        b=SXOHyTZ1rwZniOOv8KjCpjfALIIOEOF2Bux7/lVnWEpqg2Kwk+ssC7rkpWYtUSNGvE
         OkJP6HKHS4c8Z5Az31kcnmHLvIG7heO5XP8ccqrUkRY6Dtovs+ABUp/H5XjXHLdaL/NH
         C2uHrigDL6XxTRBByVQVvUHo8D8pXd/PA6/+1oJXNdTqL7zvNkGH70Jnt4K5rfw0O/xr
         MgajZC9NF2c69fYNMzC4XR2o0yCzfrByS85Bk3JH/zT62aABeYua7zPRv1j48ofLFCut
         AxZNuXuAzd6d18K2Lf+lfBASn9evS2uTj0o27By8UDHjxzVGD0aiteNLj3GkQeQGOekt
         Dv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vLq3q1p9DK/8+swqd0EF1XmAyuyBf4cp5s4Q1EQ0uO8=;
        b=inLL78r2rGcqdNQpvZ7nuA92kyjAegIVwDMcI54pQH1H4EKx7oVOuubYjsHuAW3Pga
         B8x0h6fbN9GRk6d4HxOIixIqAOH6qxUrtdi0LJtcgbk6/HEM7/dTSAiafeXCP9RrYYMH
         Y+JMO4IR10+fCz5EArQ9wO0mIy1LUhtAyDUwY+9EdxZcbi9p5OcS6EgE3oQN6/ROu1ro
         QidegtkPiJF+kwcyV9XXbDyS1Sas+4lcFzsbCrjX7U8PMxpQhZoNSnjn+9lAWro2E6CD
         v3LzuaMv+oDFjP2y7k6lDBeiG9TExcsBerDOgfDmfGkom4E9bN8ccu91JV6qC4XXlJcX
         THDg==
X-Gm-Message-State: AOAM531DhDxIXB24MastsEQZWtNyM+D3s3cPUsbWTpH1z+HKdJgnEf8v
	C7VY67C4jKVZYhwVWNf3OW8LhYkhK/6Ipw==
X-Google-Smtp-Source: ABdhPJx6IDc/ofgTeeKOgnKL59M07jftT6TZAWWGN6beKRoLaMz8foPoms99Ssblul6f3LbpRUMF9g==
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr9348107ljo.388.1606732337396;
        Mon, 30 Nov 2020 02:32:17 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V3 18/23] xen/dm: Introduce xendevicemodel_set_irq_level DM op
Date: Mon, 30 Nov 2020 12:31:33 +0200
Message-Id: <1606732298-22107-19-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

This patch adds ability to the device emulator to notify otherend
(some entity running in the guest) using a SPI and implements Arm
specific bits for it. Proposed interface allows emulator to set
the logical level of a one of a domain's IRQ lines.

We can't reuse the existing DM op (xen_dm_op_set_isa_irq_level)
to inject an interrupt as the "isa_irq" field is only 8-bit and
able to cover IRQ 0 - 255, whereas we need a wider range (0 - 1020).

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

***
Please note, I left interface untouched since there is still
an open discussion what interface to use/what information to pass
to the hypervisor. The question whether we should abstract away
the state of the line or not.
***

Changes RFC -> V1:
   - check incoming parameters in arch_dm_op()
   - add explicit padding to struct xen_dm_op_set_irq_level

Changes V1 -> V2:
   - update the author of a patch
   - update patch description
   - check that padding is always 0
   - mention that interface is Arm only and only SPIs are
     supported for now
   - allow to set the logical level of a line for non-allocated
     interrupts only
   - add xen_dm_op_set_irq_level_t

Changes V2 -> V3:
   - no changes
---
---
 tools/include/xendevicemodel.h               |  4 ++
 tools/libs/devicemodel/core.c                | 18 +++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  1 +
 xen/arch/arm/dm.c                            | 57 +++++++++++++++++++++++++++-
 xen/common/dm.c                              |  1 +
 xen/include/public/hvm/dm_op.h               | 16 ++++++++
 6 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index e877f5c..c06b3c8 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
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
index 5d3da37..e4bb233 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -17,10 +17,65 @@
 #include <xen/dm.h>
 #include <xen/hypercall.h>
 
+#include <asm/vgic.h>
+
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
+        unsigned int i;
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
+        /* Check that padding is always 0 */
+        for ( i = 0; i < sizeof(data->pad); i++ )
+        {
+            if ( data->pad[i] )
+            {
+                rc = -EINVAL;
+                break;
+            }
+        }
+
+        /*
+         * Allow to set the logical level of a line for non-allocated
+         * interrupts only.
+         */
+        if ( test_bit(data->irq, d->arch.vgic.allocated_irqs) )
+        {
+            rc = -EINVAL;
+            break;
+        }
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
index 9d394fc..7bfb46c 100644
--- a/xen/common/dm.c
+++ b/xen/common/dm.c
@@ -48,6 +48,7 @@ static int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
         [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
         [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
+        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index 66cae1a..1f70d58 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -434,6 +434,21 @@ struct xen_dm_op_pin_memory_cacheattr {
 };
 typedef struct xen_dm_op_pin_memory_cacheattr xen_dm_op_pin_memory_cacheattr_t;
 
+/*
+ * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
+ *                         IRQ lines (currently Arm only).
+ * Only SPIs are supported.
+ */
+#define XEN_DMOP_set_irq_level 19
+
+struct xen_dm_op_set_irq_level {
+    uint32_t irq;
+    /* IN - Level: 0 -> deasserted, 1 -> asserted */
+    uint8_t level;
+    uint8_t pad[3];
+};
+typedef struct xen_dm_op_set_irq_level xen_dm_op_set_irq_level_t;
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -447,6 +462,7 @@ struct xen_dm_op {
         xen_dm_op_track_dirty_vram_t track_dirty_vram;
         xen_dm_op_set_pci_intx_level_t set_pci_intx_level;
         xen_dm_op_set_isa_irq_level_t set_isa_irq_level;
+        xen_dm_op_set_irq_level_t set_irq_level;
         xen_dm_op_set_pci_link_route_t set_pci_link_route;
         xen_dm_op_modified_memory_t modified_memory;
         xen_dm_op_set_mem_type_t set_mem_type;
-- 
2.7.4


