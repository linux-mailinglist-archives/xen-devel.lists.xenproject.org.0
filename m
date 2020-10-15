Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4028F73D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7621.20167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VM-0007ee-Jq; Thu, 15 Oct 2020 16:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7621.20167; Thu, 15 Oct 2020 16:53:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VL-0007ah-OQ; Thu, 15 Oct 2020 16:53:27 +0000
Received: by outflank-mailman (input) for mailman id 7621;
 Thu, 15 Oct 2020 16:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6OX-0004yr-7t
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:25 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 495c746c-867e-4b9f-bfdc-3ebc58d73db7;
 Thu, 15 Oct 2020 16:45:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b1so4320376lfp.11
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:12 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:10 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6OX-0004yr-7t
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:25 +0000
X-Inumbo-ID: 495c746c-867e-4b9f-bfdc-3ebc58d73db7
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 495c746c-867e-4b9f-bfdc-3ebc58d73db7;
	Thu, 15 Oct 2020 16:45:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b1so4320376lfp.11
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HaoSNmuxwJzJR/fKLMbZwT91GS4ftwQys6lt/km7J2g=;
        b=CeJiG4Nb1/Pb2sgz3TGnNpjrTYoj+Xr3WHwfBpq5V6VWIWlkhvHc7IQUISflX9dJj7
         if3zUD6eV9aAWdcwjWmJPw//abOUNr0ZKgvyO5Ahb5dHFjnfkUGa/8P03fJX30cM3k9p
         g+vGnWOZF7yWTckBaAA7IvsqTmBw5fkEe4Z0P36cfABlNKjsyTWMWnqKrcYtsJJPeqG4
         TmK6f6Fq3KY1RzealYEn3Suy9d5vzktZxa5nr6CWeX7Xl1sZfLhuU9U7B0j4jl6UHtYf
         jr/QLcxoOytiBaF6DvLENgCoD3tY4r62xmGOzwSeXVZUr1w8IAkZk3/5/KV+OYebiibl
         M2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HaoSNmuxwJzJR/fKLMbZwT91GS4ftwQys6lt/km7J2g=;
        b=cccfG/8y+r747gyUUQ3ncLm3JtEl2qs7ESVhRqVsPq0FTOXg85PedmnTRI3+uCwFAx
         xHl/ywfcLjqRTjcIFyX9dt2tZSGakaxMMJkZLb1b/OLvsy7bxle7SGW4j07Ri3LryMNK
         96xL9PywSQsVwHVrcwUVgGPJJYagnIzOQlETwehp2ywzkg9HyftM3eHjXMM7KtlKiG6g
         7xY9DAzRcp/+JBsUyvG+pkzx90+bLi9iKb7zEy0NmtPpBriG0N+arUuQyXGgIMtRptrd
         QXkozgVZ2Wxb0BroDRFYY+te2bL4uB3wiDbcPeLMLNAWjOsW39ozlQ+nz6OtWn/TWpEs
         ycmQ==
X-Gm-Message-State: AOAM5321bnqy8wPj76WWE0Nnoti+dttpk85ZUwWg/7gmgUfHWfn5JVb5
	X7p3wfKhzUgcawUYQ0L6zJNMKtXXYC9BPQ==
X-Google-Smtp-Source: ABdhPJxxnhYf1jU2Q+ohzP7ySf8wbYADbqSgg/hOvijB/xB3BRucdTDPEe7sx0CDqgM+hg30Trv1Pg==
X-Received: by 2002:ac2:5449:: with SMTP id d9mr1270229lfn.546.1602780311348;
        Thu, 15 Oct 2020 09:45:11 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:10 -0700 (PDT)
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
Subject: [PATCH V2 18/23] xen/dm: Introduce xendevicemodel_set_irq_level DM op
Date: Thu, 15 Oct 2020 19:44:29 +0300
Message-Id: <1602780274-29141-19-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

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
---
 tools/libs/devicemodel/core.c                   | 18 ++++++++
 tools/libs/devicemodel/include/xendevicemodel.h |  4 ++
 tools/libs/devicemodel/libxendevicemodel.map    |  1 +
 xen/arch/arm/dm.c                               | 57 ++++++++++++++++++++++++-
 xen/common/dm.c                                 |  1 +
 xen/include/public/hvm/dm_op.h                  | 16 +++++++
 6 files changed, 96 insertions(+), 1 deletion(-)

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
index f3a8353..5f23420 100644
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


