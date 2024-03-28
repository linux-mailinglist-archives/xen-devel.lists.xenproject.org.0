Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B08903F7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699014.1091421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps68-0000pt-8C; Thu, 28 Mar 2024 15:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699014.1091421; Thu, 28 Mar 2024 15:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps68-0000kI-4N; Thu, 28 Mar 2024 15:55:24 +0000
Received: by outflank-mailman (input) for mailman id 699014;
 Thu, 28 Mar 2024 15:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps66-00071m-Fw
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 948b9e10-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:55:20 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a466a1f9ea0so72974566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:20 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 ef15-20020a05640228cf00b0056c1380a972sm963818edb.74.2024.03.28.08.55.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:20 -0700 (PDT)
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
X-Inumbo-ID: 948b9e10-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641320; x=1712246120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qqj3zRF0zkE64TiaxdKa2OyadNVq3wsX7i8167PhhDk=;
        b=GF1ky0xXBcM+9mqpMVIjN5ldUvzgeGYbPRszRQDdLHC2Tlz2nQyPvJqqhK4MJTGlh+
         9LR3PoFVcS0XO4QJ8mblVO6UCr/SweKxSVGI6mLpB/F6LpdkgOUt6bADna1HRNiPpOhW
         raqy1tgoR8T5t9Hxeoi+e6Fo/0nVMnfwXw0v3o2ZGm/3Pj9VpZ1nGkE+fAFqzk/5ZfpE
         6xMvW9We7ZpcyLd2WL6zmMy3h/odjvqTsOr9qLSs728DlQJHWZ4hOBKyue1Yyy/ssd+I
         nKkGzuoz213Qhy3omhJkUFPH3haU9juMZv1P8R3OUMBjpTXTzEy7+77n6Y6bLadMLhf5
         AUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641320; x=1712246120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qqj3zRF0zkE64TiaxdKa2OyadNVq3wsX7i8167PhhDk=;
        b=VkXLKiVxAVas+17HQHd3LvDNvFqib1WKp8P/q8eIZvE+2bZ0ZdvMaAVsRO65MIwjxE
         d/ECBKwh5XDlrl3K9eU5kuY2rmfuI6Nae6nEO7uYGa1yaNjy+MijuNMwl/5A/7TtOV2k
         O9085t7zIM5Au4caOxX5qAz98H2EjiXhy+wt3NS02hoPcJVnVvb4XpMaersyVZVSjH21
         YkdCcaLUH3iQ3jpnPTpBB9y1srD8Ws9Q/BO7C4oHl8JWfHogAVvuUKgHp0bz8yGJafyg
         0pTK7xoKgPpnuY5v//ggAyiB6oqfcETGGNURgvG3ZX/M2zGsOcQLTI32z73k093dDYNr
         Bq5w==
X-Forwarded-Encrypted: i=1; AJvYcCVW44NZU490/Dm8qiaW76SalifgMBpwBP168W8FBBqopft5aOQ5AhcIahQTZjg/lZuDPlkDnj5PETlvY9VABrmw/OrdumjgXyJnngW0FDo=
X-Gm-Message-State: AOJu0YxK3ZW4PpGQzLXvFODy5a9Y/Uj+MCKJ1WA3/3PMyZRd6JN/DE44
	JGD1XMOOSHqY5GH1tHb4RC1l+fSTZ/y8vWcMdDRBFqchmTNM4SPco9nINoCM2kk=
X-Google-Smtp-Source: AGHT+IHK7QxU7AgeWAocSeLH4R3SrP+9YZVhIuiOSStSg8CKPyXF7V4Tf4M9BXjp5dsE6yThozBjEA==
X-Received: by 2002:a50:8d08:0:b0:566:ecce:9d3c with SMTP id s8-20020a508d08000000b00566ecce9d3cmr2991678eds.26.1711641320462;
        Thu, 28 Mar 2024 08:55:20 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 06/29] hw/i386/pc: Move pci_root_uid field to PcPciMachineClass
Date: Thu, 28 Mar 2024 16:54:14 +0100
Message-ID: <20240328155439.58719-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 'pci_root_uid' field is irrelevant for non-PCI
machines, restrict it to the PcPciMachineClass.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 4 +++-
 hw/i386/acpi-build.c | 9 +++++++--
 hw/i386/pc_piix.c    | 7 +++++--
 hw/i386/pc_q35.c     | 7 +++++--
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 0b23e5ec7b..24c8e17e62 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -96,7 +96,6 @@ typedef struct PCMachineClass {
 
     /* ACPI compat: */
     bool has_acpi_build;
-    int pci_root_uid;
 
     /* SMBIOS compat: */
     bool smbios_defaults;
@@ -127,6 +126,9 @@ typedef struct PCMachineClass {
 
 typedef struct PcPciMachineClass {
     PCMachineClass parent_class;
+
+    /* ACPI compat: */
+    int pci_root_uid;
 } PcPciMachineClass;
 
 #define TYPE_PC_MACHINE "common-pc-machine"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6f9925d176..b9890886f6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1426,6 +1426,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     CrsRangeSet crs_range_set;
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
+    PcPciMachineClass *ppmc;
     X86MachineState *x86ms = X86_MACHINE(machine);
     AcpiMcfgInfo mcfg;
     bool mcfg_valid = !!acpi_get_mcfg(&mcfg);
@@ -1448,10 +1449,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     build_dbg_aml(dsdt);
     if (i440fx) {
+        ppmc = PC_PCI_MACHINE_GET_CLASS(machine);
+
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
-        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(ppmc->pci_root_uid)));
         aml_append(dev, aml_pci_edsm());
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
@@ -1461,11 +1464,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
         build_piix4_pci0_int(dsdt);
     } else if (q35) {
+        ppmc = PC_PCI_MACHINE_GET_CLASS(machine);
+
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(ppmc->pci_root_uid)));
         aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
         aml_append(dev, aml_pci_edsm());
         aml_append(sb_scope, dev);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 776d02db73..c42dd46e59 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -468,9 +468,11 @@ static void pc_xen_hvm_init(MachineState *machine)
 static void pc_i440fx_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+    PcPciMachineClass *ppmc = PC_PCI_MACHINE_CLASS(m);
     ObjectClass *oc = OBJECT_CLASS(m);
+
     pcmc->default_south_bridge = TYPE_PIIX3_DEVICE;
-    pcmc->pci_root_uid = 0;
+    ppmc->pci_root_uid = 0;
     pcmc->default_cpu_version = 1;
 
     m->family = "pc_piix";
@@ -622,12 +624,13 @@ DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
 static void pc_i440fx_5_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+    PcPciMachineClass *ppmc = PC_PCI_MACHINE_CLASS(m);
 
     pc_i440fx_5_2_machine_options(m);
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
-    pcmc->pci_root_uid = 1;
+    ppmc->pci_root_uid = 1;
 }
 
 DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index c3b0467ef3..dc0bf85464 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -345,7 +345,9 @@ static void pc_q35_init(MachineState *machine)
 static void pc_q35_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
-    pcmc->pci_root_uid = 0;
+    PcPciMachineClass *ppmc = PC_PCI_MACHINE_CLASS(m);
+
+    ppmc->pci_root_uid = 0;
     pcmc->default_cpu_version = 1;
 
     m->family = "pc_q35";
@@ -495,12 +497,13 @@ DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
 static void pc_q35_5_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+    PcPciMachineClass *ppmc = PC_PCI_MACHINE_CLASS(m);
 
     pc_q35_5_2_machine_options(m);
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
-    pcmc->pci_root_uid = 1;
+    ppmc->pci_root_uid = 1;
 }
 
 DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
-- 
2.41.0


