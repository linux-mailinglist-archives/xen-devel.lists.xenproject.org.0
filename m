Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF798F6A6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809821.1222389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0j-0000Bp-5I; Thu, 03 Oct 2024 18:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809821.1222389; Thu, 03 Oct 2024 18:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0j-00008t-0R; Thu, 03 Oct 2024 18:57:13 +0000
Received: by outflank-mailman (input) for mailman id 809821;
 Thu, 03 Oct 2024 18:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swR0h-0007Yu-PK
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 18:57:11 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bcda88b-81b9-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 20:57:11 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fadc95ccfcso16034911fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 11:57:11 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecbf63eesm2692971fa.27.2024.10.03.11.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:09 -0700 (PDT)
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
X-Inumbo-ID: 4bcda88b-81b9-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981831; x=1728586631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm+KI23c86LD33sZYRxxXCIhV12T/Ywht8Xuz1hXe+0=;
        b=EB8sWwDnh7OQVXn3Vbd/eRnhHD+nf/oKSPdzegTp0RQ5OL1oAUP19xhDaogdBsu07v
         T/zwhwtzhT5qmLZFMgs/SuwbozAlJCVBlpGJj+thO9z2nPTVYoGCl6oAM5GSaVKf7/x7
         riDNxiEESX1NuRiexVw1yhVxDxwmaFX0iivbUquySYYmPsVbnwH5WGP12MDDOhNHjelt
         lYOxI6hj8JDk7XEliT5rjOgEEALuPTQKX61/jSh8+LKgqwi8yPy43NWy1BtG247MO/gs
         q81ygufcO3oqz25qpiRSqOuxeqhBitGx/Sr0c6k6LYdnfMzIdfs2yIBQ8ADOYy7HD6Bp
         PCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981831; x=1728586631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm+KI23c86LD33sZYRxxXCIhV12T/Ywht8Xuz1hXe+0=;
        b=StbtiBtIyeYKaA0nSY9Md4xO1GkB4WQ6wosfjBC14xHKW0hqgcdug30D4MDVnTR6Rc
         x60sCcINMzifluH+gBENSADvzDRRzRQ0jPEgcWTs+xMx0kQi6kUMVMINTBt/mB9AFMab
         eZx2Q71awgUokizXqoXqixnAFThCbCciZjdgxgcehjVDqCnTHbA8tHeyr+wYN5H3e6ei
         iuKlcxhGJvYAeqfxLZObpKUwMPXBHdRTaQzAiMWCWK+f7ISC8A/VV8r26vjYHTW/lbpj
         USKkq0XUhma1b0kg2nEmHtGMGQMcCJQD7sRnznrPEmPdE7eTHf4OdOb9nRfUOFPZU7Q5
         tVvg==
X-Forwarded-Encrypted: i=1; AJvYcCXYDZjxZ926JtiBUaOls2NvtHQ2ZP+PozuWcyJljAoq3Vnfi7wTtTL1BNIZQ1pRDBT0jILA6aO0qMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWSgrniwOQvOuW9wCnSQ0lJ+p8aDTfBGwu/RhQeRDvrA3q8kP9
	rfqS/+M2i4powTtpOOsx3NkKQuaY72zjQANBDUB7xGlMW46Tl99rjsqezWD+
X-Google-Smtp-Source: AGHT+IE/e+F5VPNpTgi+p/cRxu4+PagJbnZ/GBiwrIy/ibjkQC9qwAlDuSB/1il5roTTxnglcO+Z8Q==
X-Received: by 2002:a2e:be28:0:b0:2fa:bf53:1dad with SMTP id 38308e7fff4ca-2faf3d9d202mr113291fa.31.1727981830633;
        Thu, 03 Oct 2024 11:57:10 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL v2 4/5] hw/xen: xenpvh: Add pci-intx-irq-base property
Date: Thu,  3 Oct 2024 20:56:53 +0200
Message-ID: <20241003185655.1480819-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-pvh-common.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 76a9b2b945..218ac851cf 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -218,6 +218,11 @@ static void xen_pvh_init(MachineState *ms)
             error_report("pci-ecam-size only supports values 0 or 0x10000000");
             exit(EXIT_FAILURE);
         }
+        if (!s->cfg.pci_intx_irq_base) {
+            error_report("PCI enabled but pci-intx-irq-base not set");
+            exit(EXIT_FAILURE);
+        }
+
         xenpvh_gpex_init(s, xpc, sysmem);
     }
 
@@ -273,6 +278,30 @@ XEN_PVH_PROP_MEMMAP(pci_ecam)
 XEN_PVH_PROP_MEMMAP(pci_mmio)
 XEN_PVH_PROP_MEMMAP(pci_mmio_high)
 
+static void xen_pvh_set_pci_intx_irq_base(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    xp->cfg.pci_intx_irq_base = value;
+}
+
+static void xen_pvh_get_pci_intx_irq_base(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);
+    uint32_t value = xp->cfg.pci_intx_irq_base;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
 void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc)
 {
     ObjectClass *oc = OBJECT_CLASS(xpc);
@@ -318,6 +347,13 @@ do {                                                                      \
         OC_MEMMAP_PROP(oc, "pci-ecam", pci_ecam);
         OC_MEMMAP_PROP(oc, "pci-mmio", pci_mmio);
         OC_MEMMAP_PROP(oc, "pci-mmio-high", pci_mmio_high);
+
+        object_class_property_add(oc, "pci-intx-irq-base", "uint32_t",
+                                  xen_pvh_get_pci_intx_irq_base,
+                                  xen_pvh_set_pci_intx_irq_base,
+                                  NULL, NULL);
+        object_class_property_set_description(oc, "pci-intx-irq-base",
+                                  "Set PCI INTX interrupt base line.");
     }
 
 #ifdef CONFIG_TPM
-- 
2.43.0


