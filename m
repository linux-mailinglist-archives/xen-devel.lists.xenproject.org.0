Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097798903F5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699011.1091400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5v-0008GD-Ge; Thu, 28 Mar 2024 15:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699011.1091400; Thu, 28 Mar 2024 15:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5v-0008EP-Cl; Thu, 28 Mar 2024 15:55:11 +0000
Received: by outflank-mailman (input) for mailman id 699011;
 Thu, 28 Mar 2024 15:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps5u-00071m-05
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:10 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d0c78df-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:55:08 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso140406066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:08 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 x15-20020a170906710f00b00a46cc48ab13sm898792ejj.62.2024.03.28.08.55.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:07 -0700 (PDT)
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
X-Inumbo-ID: 8d0c78df-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641308; x=1712246108; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfY93X5jZfIbOGpoyV/9aTUl+UEfpsvUbOU4aZU0Anc=;
        b=Vn9FOkK5rbxKDOcsJsoG4m3RzXE3u6iynMo0RBATJ5xt0gHnevApEuRZNjDuMbnkDc
         Ys6wttlZn3yWUAWSKvGfdxXBWAEaiEMyZTP1eeXTPq6GqZCaq5BPmFGGwFpUOcuYF++5
         1imB5tG5LuhMQ+tQeA0SkgmRmYzb3l+ylDWm9P4sIrRCDzCYDumxfUhsjYfJa4kMWYtD
         efcBFR7vCeq5ox2nLWt81pqX3zIHZVXhW+AhnaZzpzYPDrbGWqx7tRzwI5A6QsZ9aDl5
         rnSAWm2AuaJh/jMHLvfKXGE0w/sgMdKRgssyJJX0Xl1iqfNyn4txRhlUOXgxMQCxzpjT
         /aDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641308; x=1712246108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfY93X5jZfIbOGpoyV/9aTUl+UEfpsvUbOU4aZU0Anc=;
        b=bU+ABrF1xDTQQMJWroU8JY6puiFoJyVm0yJT2Ldb4zq0AQuOzhK+ZgaC20uYZqi4FA
         4heJd91xr2LUg1LDGJuAF+BIdgbnIRElYl2OlMkPmmPr9n1/U8XfIt/0TjlaCdOCGaYC
         470D/6u3m2HoJpPn2J8AqFWsHtT8jegT4Ns3wfv9VFzOnPZHLmDpDL4mKlsUZAFm/P6M
         jX/KQ8eIDqMuftuEONF/KmNmtu2yn39D/jtpsxVGHPhtX0RO8OXZQgxj8m3iz9q9nqbu
         iG6FdublxQtXyxW8UpxvdV9hn7qUap1M9lMyF9qA+VPiQOc6rTEsrEcWFGoaF0ZKicz7
         HMgA==
X-Forwarded-Encrypted: i=1; AJvYcCWe2TJmIdHOlqOk5HnjS82gnR5YKxDXvff81NkhxxMNBdL4EqHpYhkrNSrMdwXnjNV5ZO1NXwF5vVUSCeXN1kpzO2M8CivQP4FE0LXXR6g=
X-Gm-Message-State: AOJu0Ywz4cwtl3HC44/a9t72nMt7Yjp7kFcpcZSVsItG179DK59vTga6
	tiza+8Y8V60SAnYEi0jS05hEzTI3a0d6a3FuIPkXL6B47fk6LMvLXo2xkKxqWC8=
X-Google-Smtp-Source: AGHT+IFlVuycGv39RKoJmMuDSzpYHIv5NkuYfdH5v63bTElq/w8DazJwyMi8sNCnbLq/4DH71CZp5g==
X-Received: by 2002:a17:906:2dce:b0:a4e:299f:7f4f with SMTP id h14-20020a1709062dce00b00a4e299f7f4fmr690299eji.48.1711641307840;
        Thu, 28 Mar 2024 08:55:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 04/29] hw/i386/pc: Introduce PC_PCI_MACHINE QOM type
Date: Thu, 28 Mar 2024 16:54:12 +0100
Message-ID: <20240328155439.58719-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce TYPE_PC_PCI_MACHINE for machines where PCI
is expected (as opposition to the ISA-only PC machine).

This type inherits from the well known TYPE_PC_MACHINE.

Convert I440FX/PIIX and Q35 machines to use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 25 ++++++++++++++++---------
 hw/i386/pc.c         | 25 +++++++++++++++++++++++++
 hw/i386/pc_piix.c    |  6 +++---
 hw/i386/pc_q35.c     |  2 +-
 4 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 33023ebbbe..1a4a61148a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -22,11 +22,8 @@
  * @boot_cpus: number of present VCPUs
  */
 typedef struct PCMachineState {
-    /*< private >*/
     X86MachineState parent_obj;
 
-    /* <public> */
-
     /* State for other subsystems/APIs: */
     Notifier machine_done;
 
@@ -60,6 +57,12 @@ typedef struct PCMachineState {
     CXLState cxl_devices_state;
 } PCMachineState;
 
+typedef struct PcPciMachineState {
+    PCMachineState parent_obj;
+
+    Notifier machine_done;
+} PcPciMachineState;
+
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
 #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define PC_MACHINE_VMPORT           "vmport"
@@ -80,12 +83,9 @@ typedef struct PCMachineState {
  *                  way we can use 1GByte pages in the host.
  *
  */
-struct PCMachineClass {
-    /*< private >*/
+typedef struct PCMachineClass {
     X86MachineClass parent_class;
 
-    /*< public >*/
-
     /* Device configuration: */
     bool pci_enabled;
     const char *default_south_bridge;
@@ -124,13 +124,20 @@ struct PCMachineClass {
      * check for memory.
      */
     bool broken_32bit_mem_addr_check;
-};
+} PCMachineClass;
 
-#define TYPE_PC_MACHINE "generic-pc-machine"
+typedef struct PcPciMachineClass {
+    PCMachineClass parent_class;
+} PcPciMachineClass;
+
+#define TYPE_PC_MACHINE "common-pc-machine"
 OBJECT_DECLARE_TYPE(PCMachineState, PCMachineClass, PC_MACHINE)
 
 bool pc_machine_is_pci_enabled(PCMachineState *pcms);
 
+#define TYPE_PC_PCI_MACHINE "pci-pc-machine"
+OBJECT_DECLARE_TYPE(PcPciMachineState, PcPciMachineClass, PC_PCI_MACHINE)
+
 /* ioapic.c */
 
 GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7065f11e97..eafd521489 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -621,6 +621,10 @@ void pc_machine_done(Notifier *notifier, void *data)
     pc_cmos_init_late(pcms);
 }
 
+static void pc_pci_machine_done(Notifier *notifier, void *data)
+{
+}
+
 /* setup pci memory address space mapping into system address space */
 void pc_pci_as_mapping_init(MemoryRegion *system_memory,
                             MemoryRegion *pci_address_space)
@@ -1678,6 +1682,14 @@ static void pc_machine_initfn(Object *obj)
     qemu_add_machine_init_done_notifier(&pcms->machine_done);
 }
 
+static void pc_pci_machine_initfn(Object *obj)
+{
+    PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
+
+    ppms->machine_done.notify = pc_pci_machine_done;
+    qemu_add_machine_init_done_notifier(&ppms->machine_done);
+}
+
 static void pc_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     CPUState *cs;
@@ -1812,6 +1824,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         pc_machine_set_fd_bootchk);
 }
 
+static void pc_pci_machine_class_init(ObjectClass *oc, void *data)
+{
+}
+
 bool pc_machine_is_pci_enabled(PCMachineState *pcms)
 {
     return PC_MACHINE_GET_CLASS(pcms)->pci_enabled;
@@ -1831,6 +1847,15 @@ static const TypeInfo pc_machine_types[] = {
              { }
         },
     },
+    {
+        .name           = TYPE_PC_PCI_MACHINE,
+        .parent         = TYPE_PC_MACHINE,
+        .abstract       = true,
+        .instance_size  = sizeof(PcPciMachineState),
+        .instance_init  = pc_pci_machine_initfn,
+        .class_size     = sizeof(PcPciMachineClass),
+        .class_init     = pc_pci_machine_class_init,
+    },
 };
 
 DEFINE_TYPES(pc_machine_types)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b9f85148e3..7ada452f91 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -463,7 +463,7 @@ static void pc_xen_hvm_init(MachineState *machine)
         pc_init1(machine, TYPE_I440FX_PCI_DEVICE); \
     } \
     DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn, \
-                      TYPE_PC_MACHINE)
+                      TYPE_PC_PCI_MACHINE)
 
 static void pc_i440fx_machine_options(MachineClass *m)
 {
@@ -838,7 +838,7 @@ static void xenfv_4_2_machine_options(MachineClass *m)
 }
 
 DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
-                  xenfv_4_2_machine_options, TYPE_PC_MACHINE);
+                  xenfv_4_2_machine_options, TYPE_PC_PCI_MACHINE);
 
 static void xenfv_3_1_machine_options(MachineClass *m)
 {
@@ -850,5 +850,5 @@ static void xenfv_3_1_machine_options(MachineClass *m)
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv-3.1", pc_xen_hvm_init,
-                  xenfv_3_1_machine_options, TYPE_PC_MACHINE);
+                  xenfv_3_1_machine_options, TYPE_PC_PCI_MACHINE);
 #endif
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 7dbee38f03..c3b0467ef3 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -339,7 +339,7 @@ static void pc_q35_init(MachineState *machine)
         pc_q35_init(machine); \
     } \
     DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn, \
-                      TYPE_PC_MACHINE)
+                      TYPE_PC_PCI_MACHINE)
 
 
 static void pc_q35_machine_options(MachineClass *m)
-- 
2.41.0


