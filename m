Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E333D8904B1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699093.1091656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsMs-0000rZ-KP; Thu, 28 Mar 2024 16:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699093.1091656; Thu, 28 Mar 2024 16:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsMs-0000pS-HY; Thu, 28 Mar 2024 16:12:42 +0000
Received: by outflank-mailman (input) for mailman id 699093;
 Thu, 28 Mar 2024 16:12:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps77-00071m-G7
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:25 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba189f94-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:56:23 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso1821156e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:23 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 i23-20020a170906265700b00a4749a1de50sm911948ejc.176.2024.03.28.08.56.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:22 -0700 (PDT)
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
X-Inumbo-ID: ba189f94-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641383; x=1712246183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YADozrynE6WAolQE0PpJsPO9+XRuTB0w7hXGd8JOVMk=;
        b=t+/1N04qiasqsLsW1lgmgpEzggXkQbmk+oQ1NJhOyjhH0YcvmjGTucJMeeT8eBUPFq
         IKeUNuKpBY1tycbKrGhB8bFrGRDwZSldhAImr+KZainvMB2DKkCwP2Huxkvzq6L3KvUf
         OmSyAf7lS307LtfbyDepTokbaVt3z3IUmC6VkYgSYzYuUDQrwDbP+0d9y9UMRVIqwVWX
         zcA3jxx0wh2Ux5QXvYzm1kciPjlNxM0t2H+zn9fMJ00MTFdnhLVGw39uEDZS4Jl/De5Y
         VzAsc4jyPlvNfw5nvj9rBt5xZjEB1PPFMrcYul712K/zGc66mvBzIo/6toieFCmTuIi5
         8ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641383; x=1712246183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YADozrynE6WAolQE0PpJsPO9+XRuTB0w7hXGd8JOVMk=;
        b=aRnAOmSTY0S9nWMix/CY6m/mbmG/eZgdFvmLyczqTJNtH8tYWN8Y9VjMahrMudSR9j
         KFKQriAmQIngs4OHBkOUDNCXkLy0Vo9rRNe5EznpvWmPSXjbhO3QO9+/g+cCcuK5B6Pe
         RebLECxBlD8+hm7+UPg4EjWgkCXUe13NMGxUd5qsDWnB9BqR6yRVDU97J7TSZPrl29y/
         idRQ0rXhkNs6186kJ8A6lnMh6Xm30RVKGTTao4jCYhk5x9b0QbHvWVZCAaL2+QVAPHnQ
         g0wBdLpSsOcZ9B0DlMeeh50PJQ/rQyoiL2ibu7aMQ/bunh3h/EnOJDPg6e0/D9eIoyGp
         /0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCX6L2J7bRd4C7QUV46BxOJFaZIGVRyeU28Ofq4oS/PfwEGEyz3kPPv/hW8pxMxaq00Y07pYr6+lM1doBvIBOuT6qts5jNOnjvbVwzcDJcA=
X-Gm-Message-State: AOJu0YxP05X8BH+CYOjCT9bK+3d1BzZZZzjbwrsoiP184pxD3vG4c2PZ
	D6iqMUSAIIDmXG36hvleZMBZ17Fjw9ub8fqMF4e/aGGalmQrxnBsT/O9ptjwR1E=
X-Google-Smtp-Source: AGHT+IFET2qLkxCYJlLAe5wqUF2LJxJCZxdIrO9Tbo3cYr9nsR7BCDgXHuGLT1xPB8OJyuTlfGMDhg==
X-Received: by 2002:a05:6512:78f:b0:513:e643:cd12 with SMTP id x15-20020a056512078f00b00513e643cd12mr2537328lfr.26.1711641383341;
        Thu, 28 Mar 2024 08:56:23 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 16/29] hw/i386/pc: Move south-bridge related fields to PcPciMachine
Date: Thu, 28 Mar 2024 16:54:24 +0100
Message-ID: <20240328155439.58719-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

South bridge type is only relevant for the i440fx/piix
machine, which is PCI-based.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h |  8 ++++----
 hw/i386/pc.c         |  3 ++-
 hw/i386/pc_piix.c    | 12 ++++++------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 668347c248..2db2aa03d3 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -38,7 +38,6 @@ typedef struct PCMachineState {
     uint64_t max_ram_below_4g;
     OnOffAuto vmport;
     SmbiosEntryPointType smbios_entry_point_type;
-    const char *south_bridge;
 
     bool smbus_enabled;
     bool sata_enabled;
@@ -59,6 +58,7 @@ typedef struct PcPciMachineState {
     Notifier machine_done;
 
     bool acpi_build_enabled;
+    const char *southbridge_typename;
     uint64_t max_fw_size;
 
     PFlashCFI01 *flash[2];
@@ -88,9 +88,6 @@ typedef struct PcPciMachineState {
 typedef struct PCMachineClass {
     X86MachineClass parent_class;
 
-    /* Device configuration: */
-    const char *default_south_bridge;
-
     /* Compat options: */
 
     /* Default CPU model version.  See x86_cpu_set_default_version(). */
@@ -126,6 +123,9 @@ typedef struct PCMachineClass {
 typedef struct PcPciMachineClass {
     PCMachineClass parent_class;
 
+    /* Device configuration: */
+    const char *default_southbridge_typename;
+
     /* ACPI compat: */
     int pci_root_uid;
 } PcPciMachineClass;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5753a3ff0b..dd44df0470 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1667,7 +1667,6 @@ static void pc_machine_initfn(Object *obj)
 #endif /* CONFIG_VMPORT */
     pcms->max_ram_below_4g = 0; /* use default */
     pcms->smbios_entry_point_type = pcmc->default_smbios_ep_type;
-    pcms->south_bridge = pcmc->default_south_bridge;
 
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
@@ -1689,9 +1688,11 @@ static void pc_machine_initfn(Object *obj)
 static void pc_pci_machine_initfn(Object *obj)
 {
     PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
+    PcPciMachineClass *ppmc = PC_PCI_MACHINE_GET_CLASS(ppms);
 
     ppms->acpi_build_enabled = true;
     ppms->max_fw_size = 8 * MiB;
+    ppms->southbridge_typename = ppmc->default_southbridge_typename;
 
     pc_system_flash_create(ppms);
     cxl_machine_init(obj, &ppms->cxl_devices_state);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6b3403d0bd..2043a7022a 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -243,7 +243,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
         DeviceState *dev;
         size_t i;
 
-        pci_dev = pci_new_multifunction(-1, pcms->south_bridge);
+        pci_dev = pci_new_multifunction(-1, ppms->southbridge_typename);
         object_property_set_bool(OBJECT(pci_dev), "has-usb",
                                  machine_usb(machine), &error_abort);
         object_property_set_bool(OBJECT(pci_dev), "has-acpi",
@@ -385,12 +385,12 @@ static const QEnumLookup PCSouthBridgeOption_lookup = {
 
 static int pc_get_south_bridge(Object *obj, Error **errp)
 {
-    PCMachineState *pcms = PC_MACHINE(obj);
+    PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
     int i;
 
     for (i = 0; i < PCSouthBridgeOption_lookup.size; i++) {
         if (g_strcmp0(PCSouthBridgeOption_lookup.array[i],
-                      pcms->south_bridge) == 0) {
+                      ppms->southbridge_typename) == 0) {
             return i;
         }
     }
@@ -401,7 +401,7 @@ static int pc_get_south_bridge(Object *obj, Error **errp)
 
 static void pc_set_south_bridge(Object *obj, int value, Error **errp)
 {
-    PCMachineState *pcms = PC_MACHINE(obj);
+    PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
 
     if (value < 0) {
         error_setg(errp, "Value can't be negative");
@@ -413,7 +413,7 @@ static void pc_set_south_bridge(Object *obj, int value, Error **errp)
         return;
     }
 
-    pcms->south_bridge = PCSouthBridgeOption_lookup.array[value];
+    ppms->southbridge_typename = PCSouthBridgeOption_lookup.array[value];
 }
 
 /* Looking for a pc_compat_2_4() function? It doesn't exist.
@@ -472,7 +472,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     PcPciMachineClass *ppmc = PC_PCI_MACHINE_CLASS(m);
     ObjectClass *oc = OBJECT_CLASS(m);
 
-    pcmc->default_south_bridge = TYPE_PIIX3_DEVICE;
+    ppmc->default_southbridge_typename = TYPE_PIIX3_DEVICE;
     ppmc->pci_root_uid = 0;
     pcmc->default_cpu_version = 1;
 
-- 
2.41.0


