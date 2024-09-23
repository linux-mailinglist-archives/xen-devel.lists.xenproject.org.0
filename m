Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8671A97ED76
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802115.1212282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTN-0000EU-Le; Mon, 23 Sep 2024 14:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802115.1212282; Mon, 23 Sep 2024 14:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTN-0000Ay-IM; Mon, 23 Sep 2024 14:55:33 +0000
Received: by outflank-mailman (input) for mailman id 802115;
 Mon, 23 Sep 2024 14:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfwC=QV=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sskTM-0008CV-Ai
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:55:32 +0000
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [2607:f8b0:4864:20::92e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0bb6bbb-79bb-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 16:55:31 +0200 (CEST)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-846d414ea6bso1215708241.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:55:31 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-49e6b345c6fsm3737705137.14.2024.09.23.07.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 07:55:29 -0700 (PDT)
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
X-Inumbo-ID: e0bb6bbb-79bb-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727103330; x=1727708130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm+KI23c86LD33sZYRxxXCIhV12T/Ywht8Xuz1hXe+0=;
        b=UGfJ6uamWktd9AjfsJ2If4zOxyXIUuiGljzyAzxwWnkXqlTx0Dr+5j2Rz+iCIXBZHS
         T2LSrNDh1huebP9RldmQF3w3F+ZIFd9JYS8tX464NW+D9XEJpfGu/TQLJgSWMf+TWqkO
         69v/ho9HNZ/KRZSXjvS2aBF5H4SooPt2yFX/xZCDFIQhGBwY48OSiUq4difUOzF7cVJW
         rw48CNtFqjAZA+F0BmjgixsUlTy5euLdrv4QC8kQm6rztlAn7+7Bi52H09q1MRo3LAN+
         irPiHJ8qmu980bgXDgQwnr+v27hC61ZMC/3iDc3WUGs4jjbepbKJrVUJ8QlI2i+uZcLu
         p3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103330; x=1727708130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm+KI23c86LD33sZYRxxXCIhV12T/Ywht8Xuz1hXe+0=;
        b=qE5/TqmgXPJ6++PVA8BATHjUZrCDUsb9RIjFu/5YjO3/VWF1siAamrN2epl/0EiAAo
         nhrjsFQj3bKjg/1ukxmghlZ35rHvWxV3+1ZBGIMAPr25808t5KDUAVRSPQQWsUXtEh2X
         gP2jNlDaHNJcuHS+EQHir7T1zYW2xozsF8ATo83O11145O3xYuDqJ5sK2BEm59d10uY0
         ve0uJEYKyFZuvEdwuzqxBPqsheLUoNt8d8PgBCKZP6bGm0Fc5QNqPEudXtEFtF3GTaFY
         nwBF4A+ll2A/poSrArwkpWUDSQnx8FrIni6TtRKl0SqnagHrTG8e+LAR2WGWTDgPSmSg
         Z0OA==
X-Forwarded-Encrypted: i=1; AJvYcCX+44FBE5O6tLyEl63X6C+bKMLc9KX1UiPELJ0gJ7nKjy7yJd+4WFpXBtxu6aZF6CYRroBAu/GV7PU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyL1v79XYiCZdWqGPJJPy8u2GvnwGsdEUC7FfSX3iwWq35yDlQR
	XZXI4lOp6O/3HWkCxKkRXP9YlmhHogaqd4jQs2TiMMa7KxRnXqf8
X-Google-Smtp-Source: AGHT+IEa6GHCw5xlUAShPHcRXsaKLJmNVozEJN7ykRDnN4Q6tHZqrG6CPQ/VSMwl2li6QGRnqSqpWQ==
X-Received: by 2002:a05:6102:e09:b0:48f:4898:f2a9 with SMTP id ada2fe7eead31-49fc765b22emr8402772137.25.1727103330312;
        Mon, 23 Sep 2024 07:55:30 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 3/4] hw/xen: xenpvh: Add pci-intx-irq-base property
Date: Mon, 23 Sep 2024 16:55:19 +0200
Message-ID: <20240923145520.1323504-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
References: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
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


