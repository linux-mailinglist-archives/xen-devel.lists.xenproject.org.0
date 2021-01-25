Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F5302B70
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74383.133778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QF-0003lq-5E; Mon, 25 Jan 2021 19:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74383.133778; Mon, 25 Jan 2021 19:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QE-0003jF-PI; Mon, 25 Jan 2021 19:21:10 +0000
Received: by outflank-mailman (input) for mailman id 74383;
 Mon, 25 Jan 2021 19:21:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47Fz-0008N7-Ip
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:10:35 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4677ca31-8225-4649-b648-8bcdf5dd0cf6;
 Mon, 25 Jan 2021 19:09:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 190so405220wmz.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:13 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:11 -0800 (PST)
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
X-Inumbo-ID: 4677ca31-8225-4649-b648-8bcdf5dd0cf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SCUpLEiOlSX9ul+kRijfipf8pIcb5kXp2unnhpR7jAc=;
        b=prv5iMM/uS0Q196uQKNNJjf/gKceib37WdsQCJHp1q2vDrr0xOoCYw6wMVg088uHpu
         KrS41/3QQ4rVgZ6uYcAO9voy3nnP+eCgfd29AU5jtFUxC+iuvBtXtozhXtTGUjxD4By5
         U54Nb1T1ojEUPL1olsiLxpOh4mqF2GBTHuF1qcU+irE/cGsSLEZwQV6TPfdRRDfoXTma
         6VN1fMDRIlEyBh739WOE4E9nez5XRqOzFt0+Cyz2zWMOs+EbYaslvtwDzrDyK0GtiUuK
         wSuBVGshVAJ2Je/SV2tVz52eHKAcj3VzKuePUYUorPbrBg4/J8dvk43YGDFpvTRaGP2x
         QCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SCUpLEiOlSX9ul+kRijfipf8pIcb5kXp2unnhpR7jAc=;
        b=bS0JgaWur6U9oCPUaOe3MslSe6EPbyuqApgnQgDDRs5UtiVxu8U+ch4x6wVDb4ndyj
         apMMwLr3LjVSgjVPIpdg07L5JBAOS2j67Uh4nfSpq/FBtku2yB97IDTqW9+4hzSqpdnA
         RITelx1nfyDHoehxUjN3vs57Vwj3pzMVWBKaUT6hd1qPLZA3PWvDchPgIA0q7uy9CkuR
         t76Sc6OkMoOeYg59H9Iwxjs50TOrZSF/pj4Ee5PNdl78OrHPMkOR8aLOfLzbC+u6yBKf
         X0tVe7MgRvHNYPA/bA28GOX41ii7x2N1VWshKXOdTdDaG/PHBF5caGUCeKAWszEF/jU5
         1Pfg==
X-Gm-Message-State: AOAM5338X7zYmt7l44vDeefUNElh9x5MmAQP6w2l9rHERvjzqupft7Jk
	YCaLOXa5YpMQ7u3/L43HzF/l/jF/8pMLqg==
X-Google-Smtp-Source: ABdhPJzCrjr+H6hjoOH0LCGPFQHL0w7RQK2ptp43b+vUuwWK1ofTkk2w2FoTTyY3udPjkYQy0bRUeA==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr1416143wma.35.1611601752109;
        Mon, 25 Jan 2021 11:09:12 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 18/22] xen/dm: Introduce xendevicemodel_set_irq_level DM op
Date: Mon, 25 Jan 2021 21:08:25 +0200
Message-Id: <1611601709-28361-19-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds ability to the device emulator to notify otherend
(some entity running in the guest) using a SPI and implements Arm
specific bits for it. Proposed interface allows emulator to set
the logical level of a one of a domain's IRQ lines.

We can't reuse the existing DM op (xen_dm_op_set_isa_irq_level)
to inject an interrupt as the "isa_irq" field is only 8-bit and
able to cover IRQ 0 - 255, whereas we need a wider range (0 - 1020).

Please note, for egde-triggered interrupt (which is used for
the virtio-mmio emulation) we only trigger the interrupt on Arm
if the level is asserted (rising edge) and do nothing if the level
is deasserted (falling edge), so the call could be named "trigger_irq"
(without the level parameter). But, in order to model the line closely
(to be able to support level-triggered interrupt) we need to know whether
the line is low or high, so the proposed interface has been chosen.
However, it is worth mentioning that in case of the level-triggered
interrupt, we should keep injecting the interrupt to the guest until
the line is deasserted (this is not covered by current patch).

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

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

Changes V3 -> V4:
   - update patch description
   - update patch according to the IOREQ related dm-op handling changes

Changes V4 -> V5:
   - rebase
   - add Stefano-s A-b
---
---
 tools/include/xendevicemodel.h               |  4 +++
 tools/libs/devicemodel/core.c                | 18 ++++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  1 +
 xen/arch/arm/dm.c                            | 54 +++++++++++++++++++++++++++-
 xen/include/public/hvm/dm_op.h               | 16 +++++++++
 5 files changed, 92 insertions(+), 1 deletion(-)

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
index f254ed7..7854133 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -20,6 +20,8 @@
 #include <xen/ioreq.h>
 #include <xen/nospec.h>
 
+#include <asm/vgic.h>
+
 int dm_op(const struct dmop_args *op_args)
 {
     struct domain *d;
@@ -35,6 +37,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct xen_dm_op_ioreq_server_range),
         [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
         [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
+        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -73,7 +76,56 @@ int dm_op(const struct dmop_args *op_args)
     if ( op.pad )
         goto out;
 
-    rc = ioreq_server_dm_op(&op, d, &const_op);
+    switch ( op.op )
+    {
+    case XEN_DMOP_set_irq_level:
+    {
+        const struct xen_dm_op_set_irq_level *data =
+            &op.u.set_irq_level;
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
+        rc = ioreq_server_dm_op(&op, d, &const_op);
+        break;
+    }
 
     if ( (!rc || rc == -ERESTART) &&
          !const_op && copy_to_guest_offset(op_args->buf[0].h, offset,
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


