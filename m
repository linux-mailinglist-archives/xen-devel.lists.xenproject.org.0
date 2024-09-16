Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A048597A4D0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 17:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799582.1209578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLi-0006Wr-AV; Mon, 16 Sep 2024 15:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799582.1209578; Mon, 16 Sep 2024 15:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLi-0006TY-7H; Mon, 16 Sep 2024 15:09:10 +0000
Received: by outflank-mailman (input) for mailman id 799582;
 Mon, 16 Sep 2024 15:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVXs=QO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sqDLg-0006Jf-FH
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 15:09:08 +0000
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [2607:f8b0:4864:20::d33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e37ef1d-743d-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 17:09:07 +0200 (CEST)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82aa93774ceso261604939f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 08:09:07 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49338889sm161572039f.38.2024.09.16.08.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:09:05 -0700 (PDT)
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
X-Inumbo-ID: 9e37ef1d-743d-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726499346; x=1727104146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyzI0RstvYLpuGfxES5qaxdspprmer1imsnsZ+RTJfc=;
        b=RAMAVOKFhl2xu3sMneqv6/Uljn0BwQoSaPRcOQXlouLs2a4Dty7RcDu0/NMXkrKlz0
         ROASlRilT2q0iX2mc/ov2gzUAoUgzwe8CXJHjys0W7di16IxxdWQPx1uZZ/BvemQJDDn
         zFd3RjuUqg2gJKPXMLbZfMepe/kyi8+9n4q+wEjBFEhQMa+ScMEHhPIPO44a8VZgLd1y
         sUVOZQa1Q/aXMhsdtFOGMSVoju1aAPJZGGieDa5WCMWDxtMgRetX+u9kPoMvZ77YqeEc
         GHkzXoq/eVRild08h15iTtHNuvpj+2lCxzArbPwBKkcx+YaCJN+byXWQhUFqfmTgt3IZ
         jWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499346; x=1727104146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyzI0RstvYLpuGfxES5qaxdspprmer1imsnsZ+RTJfc=;
        b=BgHLkcAj2xb4uhDHYsbLlkCnWDgBDh4HtrC2TJgOF9QCNkoiyK88I/9dCX/iXmmANG
         Jng+f/nVNhcHdPCph+CenbyDenvXjCQRSoRXtsExqs221AAYT8zSEBrluDVTL5h5aFJY
         xVkZ1aVNy7tacIVxxVbVlLQs/o12KPaMb6Hc84G4ihk3zPkIqQfyyVDn6FSsTBrTi3QC
         le6Oez9cW2FRxCuNOPY5Au+9QTd9P93J3L1QGZLHl2xeO11+96+FikVMRPqGcXnwhEUt
         CrfzgFjt+MtVF0N2H5pCU7Nuz0zKOmkJrbWCUcm/KOOmaVFb8jGd0VOKi+HAHPxLb/FL
         W6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU/Ijd84kQUh9dH+LptyAuCQlgdc8I7FV0BVYwMnq8nN5wkb+NUyAxiQrz9WZn+Y7MmW4647/ycwc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoGRxFk6HWE84d4Yzh3KPQw27+fVNeKRS8plLzWo4u/tnJAVvA
	iAGvRSaQbVGyteGrkALZt4Si4GrW+UO/W+nen9m7M/w4j7lJMHPj
X-Google-Smtp-Source: AGHT+IFk3CkyeCYvrPI4xTDPi8u/IiZ0rmyEE85GTpP+WG+LffchGyM0QorbzWrvqbgokOTwFKRghA==
X-Received: by 2002:a05:6602:3420:b0:82c:f30d:fc9b with SMTP id ca18e2360f4ac-82d1f982f5dmr1267148039f.13.1726499345949;
        Mon, 16 Sep 2024 08:09:05 -0700 (PDT)
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
Subject: [PATCH v1 3/4] hw/xen: xenpvh: Add pci-intx-irq-base property
Date: Mon, 16 Sep 2024 17:08:51 +0200
Message-ID: <20240916150853.1216703-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

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


