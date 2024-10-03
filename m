Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25698F171
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809516.1221916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrO-0000wm-RM; Thu, 03 Oct 2024 14:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809516.1221916; Thu, 03 Oct 2024 14:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrO-0000uR-NX; Thu, 03 Oct 2024 14:31:18 +0000
Received: by outflank-mailman (input) for mailman id 809516;
 Thu, 03 Oct 2024 14:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swMrN-0008IT-PD
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:31:17 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25d802d9-8194-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 16:31:16 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fad784e304so13832881fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:31:16 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc6b0a7sm2305121fa.94.2024.10.03.07.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:31:13 -0700 (PDT)
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
X-Inumbo-ID: 25d802d9-8194-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727965876; x=1728570676; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm+KI23c86LD33sZYRxxXCIhV12T/Ywht8Xuz1hXe+0=;
        b=iorVldF5vsj1alGJS6X5b+4dcq1U3vB001sTeEbMYY+XZf0iC0FLExWm3BXm/AYJWq
         tpPmLjJmL0gT55qaboa8wRoaK0wCeCHCSxEMjx5oSk1SrjTJyxChbrgJR+SLIaWOAaUb
         Z4fTNIsAcmKEbFZD3fpcp1/Qii/ezbbvV7ds3mQ/4AB5t9OhBajGfW0GhanX/dIpfH0W
         /12zve0IyslZFK69epkbkW+/G7vxdLGzf8wKoCZWx6qsCPejYkqxXJF6LbrtIWXY0Ppt
         T+QdNQ7UuC8XJUfszoVJ5NZrmON1hzo2SRwvfrHKchxO/QYrnZIndAVBLc/lRHyCxyqX
         lHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965876; x=1728570676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm+KI23c86LD33sZYRxxXCIhV12T/Ywht8Xuz1hXe+0=;
        b=CNhpdYF/EgaqnmLcvgpCCvk3i5MTnwf9tTqouE7k+MBcmVP7M9zAiDDeFv0blT1VRj
         xC/egBYgp+49uokjWyRxxiw9tVBao6rn/BRGRk8CXdh0vgDsZqfGNEqyAaafYAZHr1T2
         1Uagq8aj0t/L43URbESKdxTGIHJZzvigDUuPjCctFzKoJOuPXHjEyzAKsvdedNQaWDcI
         LkFyJ1dhuptffvdMiwGiSES1TFBD9otIfKs5uA3sbB9UN8Gre/uL9zew/yEYd+Z4Qn4f
         mI/9o8Zb5H5WGFIv45ll+ZB0WSS1WhpRwBJZ6r0m6uokU1bMABblyO/T5qQxT+/QBPS7
         SunA==
X-Forwarded-Encrypted: i=1; AJvYcCUVcyPr4nbHqxsSIRDw9AU/nWzoMrH1FvvQ+Qcu6C2W9mt/CGxsTQIU2Ni5I9zw6AXpsPnHU/MRiNM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmBMQOHHvXCuBOhfWNXxjyAEztybWR6tbTlJX9aOePKadbK4BW
	9b0r4qG1GLLliio3fFa7PDucf7Su3Lk7Cg2MWAlak2JE7qdp/Oti
X-Google-Smtp-Source: AGHT+IHCsQYggo4+QHNTj+E9IQLO7FGvdIFdGsNJPj3Xn8OHbIfJIYVd+Xs40rnxZoWpf5j1Z25ZfA==
X-Received: by 2002:a2e:bc1a:0:b0:2fa:d723:efc8 with SMTP id 38308e7fff4ca-2fae1033a7amr52001111fa.26.1727965875455;
        Thu, 03 Oct 2024 07:31:15 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL v1 4/5] hw/xen: xenpvh: Add pci-intx-irq-base property
Date: Thu,  3 Oct 2024 16:31:01 +0200
Message-ID: <20241003143103.1476805-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
References: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
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


