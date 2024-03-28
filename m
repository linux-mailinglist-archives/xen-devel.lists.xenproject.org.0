Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103288903EE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699006.1091380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5j-0007PJ-2R; Thu, 28 Mar 2024 15:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699006.1091380; Thu, 28 Mar 2024 15:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5i-0007Mt-Tv; Thu, 28 Mar 2024 15:54:58 +0000
Received: by outflank-mailman (input) for mailman id 699006;
 Thu, 28 Mar 2024 15:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps5h-00071m-BB
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:54:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85787c7a-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:54:55 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-568c714a9c7so1311102a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:54:55 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 q4-20020aa7d444000000b00568d6a20717sm991251edr.52.2024.03.28.08.54.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:54:54 -0700 (PDT)
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
X-Inumbo-ID: 85787c7a-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641295; x=1712246095; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djs4Th+kjoxzBDQIObaEvmf5VGdYfcKG9Is4pj2rcJA=;
        b=j+ae31P+QTOwkdt0sOkfiBijANSyo/hdbRqKY14Hj4HnYOsGvyhYKoiotr13ze918E
         hKSphsF6r7vX5FAs37JJ//FnDE0PzEDu2poMvN7tG+olcJTiFaODpdL5uD5FQr63+FRL
         rV/P2lk4OuyHxX7EhjN8z8iCIEN7BbldPlq2f5bqWGU5+oTOH7XnS95HAOhfu0I+zUan
         J2lkWBOYQbt2vW0Ta7fsmAPCrGsRPdN7mPj4/19oVNYi9P/XY3eRB5wUCjUZVYpKt+ZL
         3io5zq/6kpiefrcddRvildoinyQt7RcheY51hZnKBUBze41wH1XH22dUCNMPX8lQZbq+
         hTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641295; x=1712246095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djs4Th+kjoxzBDQIObaEvmf5VGdYfcKG9Is4pj2rcJA=;
        b=K0wRrncQ9BHiz+Ph3lMjkX3piA0VavgmT19yL/b4wemUVQCXRca5ZgHi3Of8NKdrBE
         x+E78Gckfg944+KVAl5wbyWRbcYY8ZA5C2wKhiRFYZLHISZwqKMvQS3N/fhZNL3X0Zfv
         DGWldL5zoaoQzosLt98Me6gcfMKxtWJYPxXULsqmaJyU+8FeOYjwhqYCvRRkDn7VEl71
         jr4dSsYpgsA8QxGoYp3q2J3p7jCl30eI60rX/OAkUuex37JAIVh/ErB2yzO6TcOyaApW
         cgc6ujWx0r5Cf/fYSf5NtV4bpVI/YldxVRz29dup+Q0vX+HoxnF8OjCsfpR2+UVgezBm
         /FFA==
X-Forwarded-Encrypted: i=1; AJvYcCVgf/le8uPcEMgOGQtWjdJITcLLxXzHBd+5eKHYbjzNqCX/Xhe6BJZ4XIkVSW2EhE76T7Nh1gQY4rvKSQoV288n6HEYYdrJY+UTXebaA3o=
X-Gm-Message-State: AOJu0Yx+uNjm6c/Ne5eFf7S40PonvC31NfkTf58l98enUiryc94QV4u1
	EGmUbfn/BtHhI0dTcOR9icZb+ortz3dvWf8i+Z99W7olGUNAZWP/ZZDR4ID5Tf8=
X-Google-Smtp-Source: AGHT+IEDfKWv0Uve3VOXzzLi06hxTo6fvyAau83kjSqRi6VaUabzP1VqK7SGL6r5ov939b9QS2ny5A==
X-Received: by 2002:a50:d6d8:0:b0:568:ae7:bc0 with SMTP id l24-20020a50d6d8000000b005680ae70bc0mr2299951edj.34.1711641295199;
        Thu, 28 Mar 2024 08:54:55 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 02/29] hw/i386/pc: Extract pc_machine_is_pci_enabled() helper
Date: Thu, 28 Mar 2024 16:54:10 +0100
Message-ID: <20240328155439.58719-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce the pc_machine_is_pci_enabled() helper to be
able to alter PCMachineClass fields later.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h |  2 ++
 hw/i386/pc.c         | 11 +++++++++--
 hw/i386/pc_piix.c    | 11 ++++++-----
 hw/i386/pc_q35.c     |  2 +-
 hw/i386/pc_sysfw.c   | 11 ++++-------
 5 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 0ad971782c..6b885424bb 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -129,6 +129,8 @@ struct PCMachineClass {
 #define TYPE_PC_MACHINE "generic-pc-machine"
 OBJECT_DECLARE_TYPE(PCMachineState, PCMachineClass, PC_MACHINE)
 
+bool pc_machine_is_pci_enabled(PCMachineState *pcms);
+
 /* ioapic.c */
 
 GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2c41b08478..7065f11e97 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -814,6 +814,7 @@ void pc_memory_init(PCMachineState *pcms,
     hwaddr maxphysaddr, maxusedaddr;
     hwaddr cxl_base, cxl_resv_end = 0;
     X86CPU *cpu = X86_CPU(first_cpu);
+    bool pci_enabled = pc_machine_is_pci_enabled(pcms);
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -949,7 +950,7 @@ void pc_memory_init(PCMachineState *pcms,
     option_rom_mr = g_malloc(sizeof(*option_rom_mr));
     memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SIZE,
                            &error_fatal);
-    if (pcmc->pci_enabled) {
+    if (pci_enabled) {
         memory_region_set_readonly(option_rom_mr, true);
     }
     memory_region_add_subregion_overlap(rom_memory,
@@ -1642,6 +1643,7 @@ static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    bool pci_enabled = pc_machine_is_pci_enabled(pcms);
 
 #ifdef CONFIG_VMPORT
     pcms->vmport = ON_OFF_AUTO_AUTO;
@@ -1668,7 +1670,7 @@ static void pc_machine_initfn(Object *obj)
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_add_alias(OBJECT(pcms), "pcspk-audiodev",
                               OBJECT(pcms->pcspk), "audiodev");
-    if (pcmc->pci_enabled) {
+    if (pci_enabled) {
         cxl_machine_init(obj, &pcms->cxl_devices_state);
     }
 
@@ -1810,6 +1812,11 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         pc_machine_set_fd_bootchk);
 }
 
+bool pc_machine_is_pci_enabled(PCMachineState *pcms)
+{
+    return PC_MACHINE_GET_CLASS(pcms)->pci_enabled;
+}
+
 static const TypeInfo pc_machine_types[] = {
     {
         .name           = TYPE_PC_MACHINE,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c00d2a66a6..1be1e050c7 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -117,6 +117,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
     MemoryRegion *rom_memory = system_memory;
     ram_addr_t lowmem;
     uint64_t hole64_size = 0;
+    bool pci_enabled = pc_machine_is_pci_enabled(pcms);
 
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -187,7 +188,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
         kvmclock_create(pcmc->kvmclock_create_always);
     }
 
-    if (pcmc->pci_enabled) {
+    if (pci_enabled) {
         pci_memory = g_new(MemoryRegion, 1);
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
@@ -234,9 +235,9 @@ static void pc_init1(MachineState *machine, const char *pci_type)
         }
     }
 
-    gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
+    gsi_state = pc_gsi_create(&x86ms->gsi, pci_enabled);
 
-    if (pcmc->pci_enabled) {
+    if (pci_enabled) {
         PCIDevice *pci_dev;
         DeviceState *dev;
         size_t i;
@@ -308,7 +309,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
         x86_register_ferr_irq(x86ms->gsi[13]);
     }
 
-    pc_vga_init(isa_bus, pcmc->pci_enabled ? pcms->pcibus : NULL);
+    pc_vga_init(isa_bus, pci_enabled ? pcms->pcibus : NULL);
 
     assert(pcms->vmport != ON_OFF_AUTO__MAX);
     if (pcms->vmport == ON_OFF_AUTO_AUTO) {
@@ -322,7 +323,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
     pc_nic_init(pcmc, isa_bus, pcms->pcibus);
 
 #ifdef CONFIG_IDE_ISA
-    if (!pcmc->pci_enabled) {
+    if (!pci_enabled) {
         DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
         int i;
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index b5922b44af..43ee1e595c 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -145,7 +145,7 @@ static void pc_q35_init(MachineState *machine)
     bool keep_pci_slot_hpc;
     uint64_t pci_hole64_size = 0;
 
-    assert(pcmc->pci_enabled);
+    assert(pc_machine_is_pci_enabled(pcms));
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 3efabbbab2..862a082b0a 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -93,9 +93,7 @@ static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
 
 void pc_system_flash_create(PCMachineState *pcms)
 {
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
-
-    if (pcmc->pci_enabled) {
+    if (pc_machine_is_pci_enabled(pcms)) {
         pcms->flash[0] = pc_pflash_create(pcms, "system.flash0",
                                           "pflash0");
         pcms->flash[1] = pc_pflash_create(pcms, "system.flash1",
@@ -108,7 +106,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
     char *prop_name;
     int i;
 
-    assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
+    assert(pc_machine_is_pci_enabled(pcms));
 
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         if (!qdev_is_realized(DEVICE(pcms->flash[i]))) {
@@ -146,7 +144,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
     void *flash_ptr;
     int flash_size;
 
-    assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
+    assert(pc_machine_is_pci_enabled(pcms));
 
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         system_flash = pcms->flash[i];
@@ -201,11 +199,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
 void pc_system_firmware_init(PCMachineState *pcms,
                              MemoryRegion *rom_memory)
 {
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     int i;
     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
 
-    if (!pcmc->pci_enabled) {
+    if (!pc_machine_is_pci_enabled(pcms)) {
         x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, true);
         return;
     }
-- 
2.41.0


