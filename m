Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47C42F3C05
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66072.117223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgl-0003Yo-LU; Tue, 12 Jan 2021 21:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66072.117223; Tue, 12 Jan 2021 21:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgl-0003Y3-HH; Tue, 12 Jan 2021 21:58:55 +0000
Received: by outflank-mailman (input) for mailman id 66072;
 Tue, 12 Jan 2021 21:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRco-0002PK-K1
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:54:50 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db1f7416-fb6b-40cb-ae21-f4816f6bc00a;
 Tue, 12 Jan 2021 21:53:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m4so111wrx.9
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:13 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:11 -0800 (PST)
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
X-Inumbo-ID: db1f7416-fb6b-40cb-ae21-f4816f6bc00a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RGoEQJCEmcPoETIax9GErbN7obEbYOgZDwowTTTEDII=;
        b=fayvXEdHuOf096l4NKJ0f4wnVhXkt6Xds+Oybn5bihzDG9Sur+/hmB/YdxsSJ/mJE4
         CIU8aT1qH1U6JjYr9W5Ab/Zae4F1EBvYSfUcxQCasauC1o1C88HapUsExhK5Idn/rrxB
         Pb39Ip7ByGctiZQdGYqx8pmXfE7E8+lv1yRQYb5fu4eWe6IQyi9/L2pCJeFWp+8Xr7cW
         d0oUYf+n7EWflsAkksQcAiRj65Ekt5vRww/+qxg7/Wxg2QtLxG8vvlUKh8dUn3OV/+sz
         ztl97v+H+5AvKUSOBSKHwWIhgbugfOhJnrzAo1VC3Rs77kbSo+7SRcFNM3wqvZ0EZ50h
         nddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RGoEQJCEmcPoETIax9GErbN7obEbYOgZDwowTTTEDII=;
        b=Tt/UL2TTc72YiWCGBwZlCociIqW3cG7VigyQBdCPfg28cwMA3fwhmQDQLHBTCLJAXM
         5Nz5OgaHl6KnPsRdyTkPqcrvM7bNKRJENQ4W9cU7aXr4kzf//o/CV4Rgz0mCLJp+Ue2Z
         CpEcN8dt+VKDSsZnAEcjdD6Z7LqxbWC0aNTAsvFw8viIotRDvOZoAMi1nmudtETpRUxh
         CStSX88+m4j7BEtKEismR7gERUUe2epLNGgelJHnu47rxgnEcmQ+z2g+dsHiUOrkLIp9
         5Qdh1WJyLq2ecQNK/2FjQ8jj3Vmx37Htw7Pt+ahe/gTFSf1sI9Tb2Kk4Yuxo7myV+u2I
         INlA==
X-Gm-Message-State: AOAM532BYxuS1FmleFnY0YUqdDMd6TcyQ9y0fmh4Q+nxuKLcOSR4PD0V
	w/2vZWBTD6kb+JxoKaxACEfEZI29GTdemA==
X-Google-Smtp-Source: ABdhPJyqUYZ8nN9Ya3Bercumh+QsDqOVCfec1mvmV4j6aPkVyi7LceyCrMvEYYtrZePrr93Rm7UxQA==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr768128wrn.376.1610488392094;
        Tue, 12 Jan 2021 13:53:12 -0800 (PST)
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
Subject: [PATCH V4 18/24] xen/dm: Introduce xendevicemodel_set_irq_level DM op
Date: Tue, 12 Jan 2021 23:52:26 +0200
Message-Id: <1610488352-18494-19-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

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
index e6dedf4..804830a 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -20,6 +20,8 @@
 #include <xen/ioreq.h>
 #include <xen/nospec.h>
 
+#include <asm/vgic.h>
+
 static int dm_op(const struct dmop_args *op_args)
 {
     struct domain *d;
@@ -35,6 +37,7 @@ static int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct xen_dm_op_ioreq_server_range),
         [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
         [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
+        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -73,7 +76,56 @@ static int dm_op(const struct dmop_args *op_args)
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


