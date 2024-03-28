Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA26890441
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699030.1091509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsA0-0006aa-5G; Thu, 28 Mar 2024 15:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699030.1091509; Thu, 28 Mar 2024 15:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsA0-0006YN-2d; Thu, 28 Mar 2024 15:59:24 +0000
Received: by outflank-mailman (input) for mailman id 699030;
 Thu, 28 Mar 2024 15:59:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7I-0001AK-SM
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:36 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1831ad9-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:36 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso1315122a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:36 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056402028d00b0056bfa6ad5eesm959518edv.91.2024.03.28.08.56.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:35 -0700 (PDT)
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
X-Inumbo-ID: c1831ad9-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641396; x=1712246196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvS5b4mOvRgBMXReEbw8mHkHwY6O9r1j8WjPX6hg3zo=;
        b=gnpdPFgLW51sHyUyoXDwAOZDvI82FBpxhPc1kJVd0P9OD+7e9BhtZVFFO40jzchbss
         VkTI4CekE0NeVoVzrAAMMTZlO7irkRt417toCdVs0Vd/bsP0bMwgf9T0O5sc8zm9D62u
         qrgU5PVgvyyOkWhdTvcodVbGc1u2IKv1/J/l1pa4Db+oT20L3G9hUzbb6y+djmif+EPQ
         Vmw/yflu4lHS5lPkcqIgqElyt0VpedKVGk9VbTOk+vOjWPuFHrPNO/CnHFeXOd+eVUV9
         /2RhBmvOtqeWCF7ol7JeHxDXkovaoPgReWAHhYGLVPpOO0F3dSLOsZgF7MLn2H1Nb/EW
         DJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641396; x=1712246196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvS5b4mOvRgBMXReEbw8mHkHwY6O9r1j8WjPX6hg3zo=;
        b=shV4e98lHzsq7+CX3Itr+Kbug4Fk5fGKUZne70K11rMq0F8smHLE9ZsEXiui9cNhLA
         UfXKo8Nw8j4b428R0Wdmf8VXhnKSemzCfl6N1M0eOCtoeZxLV7jXrACdc7TRogD+9J2N
         XQn+RmjOTx9LeBFWjB6R4CYeUZW9POh2Tw1uEibBKpvUkZ7KXnK0TQ1PdLtEs1sLVBY1
         /I2w0ioZch9RhCO+/zC37LTngmtZjc244Qv2V5gqmtHsuQVex06kvI6/UU5ZeyNFYS5B
         LZ2uBvlgu3yUHENyvwEfFcNSpc29QIXLMX5E06jhQ6oZ3wYX5yRME4Ab+VHP6ipyhFKX
         glFw==
X-Forwarded-Encrypted: i=1; AJvYcCXaTin6EX8lHgqxMhVP4ars4fwYtjb0qhSlBsAdZg1ACdjn52ZiPyOPEO+/iFfJhw+reMN/aTHJ22JPW1lmccojQ3JYCyx46owPXSB2K2E=
X-Gm-Message-State: AOJu0Ywf63NaRPxaZc34WS2tG+Qy7tArtsPKxB15XqQIZIlBIfu++SMf
	w42N1fUwhYXuWk34+m7ObYI4QqZwaj2WQ9SVDIT4OQJYMQgSWM1WvKG3QoRfILs=
X-Google-Smtp-Source: AGHT+IHfWPHo1qaEN4DNEm3R8wOVj4A4iUDXGogGmGPb4Wx0aiRPAERFSIayiOeRYDhmlaAPcH41sw==
X-Received: by 2002:a50:d6d7:0:b0:568:a9f3:b3fb with SMTP id l23-20020a50d6d7000000b00568a9f3b3fbmr2267809edj.8.1711641395712;
        Thu, 28 Mar 2024 08:56:35 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 18/29] hw/i386/pc: Inline has_reserved_memory()
Date: Thu, 28 Mar 2024 16:54:26 +0100
Message-ID: <20240328155439.58719-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All PCI-based machines have the has_reserved_memory
field set to %true. Simplify by using an inlined helper
checking whether the machine is PCI-based or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h |  1 -
 hw/i386/pc.c         | 17 ++++++++++-------
 hw/i386/pc_piix.c    |  1 -
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 758dd5f29b..df4c813854 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -91,7 +91,6 @@ typedef struct PCMachineClass {
     SmbiosEntryPointType default_smbios_ep_type;
 
     /* RAM / address space compat: */
-    bool has_reserved_memory;
     bool broken_reserved_end;
     bool enforce_amd_1tb_hole;
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 093a7c35f7..e36d76656b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -671,6 +671,11 @@ void xen_load_linux(PCMachineState *pcms)
 #define PC_ROM_ALIGN       0x800
 #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
 
+static bool has_reserved_memory(PCMachineState *pcms)
+{
+    return pc_machine_is_pci_enabled(pcms);
+}
+
 static hwaddr pc_above_4g_end(PCMachineState *pcms)
 {
     X86MachineState *x86ms = X86_MACHINE(pcms);
@@ -702,12 +707,11 @@ static void pc_get_device_memory_range(PCMachineState *pcms,
 
 static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
 {
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
     hwaddr cxl_base;
     ram_addr_t size;
 
-    if (pcmc->has_reserved_memory &&
+    if (has_reserved_memory(pcms) &&
         (ms->ram_size < ms->maxram_size)) {
         pc_get_device_memory_range(pcms, &cxl_base, &size);
         cxl_base += size;
@@ -760,7 +764,7 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
      * calculating the highest possible GPA so that we can properly report
      * if someone configures them on a CPU that cannot possibly address them.
      */
-    if (pcmc->has_reserved_memory &&
+    if (has_reserved_memory(pcms) &&
         (ms->ram_size < ms->maxram_size)) {
         hwaddr devmem_start;
         ram_addr_t devmem_size;
@@ -891,7 +895,7 @@ void pc_memory_init(PCMachineState *pcms,
         e820_add_entry(pcms->sgx_epc.base, pcms->sgx_epc.size, E820_RESERVED);
     }
 
-    if (!pcmc->has_reserved_memory &&
+    if (!has_reserved_memory(pcms) &&
         (machine->ram_slots ||
          (machine->maxram_size > machine->ram_size))) {
 
@@ -901,7 +905,7 @@ void pc_memory_init(PCMachineState *pcms,
     }
 
     /* initialize device memory address space */
-    if (pcmc->has_reserved_memory &&
+    if (has_reserved_memory(pcms) &&
         (machine->ram_size < machine->maxram_size)) {
         ram_addr_t device_mem_size;
         hwaddr device_mem_base;
@@ -1024,7 +1028,7 @@ uint64_t pc_pci_hole64_start(void)
 
     if (ppms->cxl_devices_state.is_enabled) {
         hole64_start = pc_get_cxl_range_end(pcms);
-    } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
+    } else if (has_reserved_memory(pcms) && (ms->ram_size < ms->maxram_size)) {
         pc_get_device_memory_range(pcms, &hole64_start, &size);
         if (!pcmc->broken_reserved_end) {
             hole64_start += size;
@@ -1752,7 +1756,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     pcmc->smbios_defaults = true;
-    pcmc->has_reserved_memory = true;
     pcmc->enforce_amd_1tb_hole = true;
     pcmc->pvh_enabled = true;
     pcmc->kvmclock_create_always = true;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0bc14da768..e6178f8653 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -830,7 +830,6 @@ static void isapc_machine_options(MachineClass *m)
     m->rom_file_has_mr = false;
     pcmc->smbios_defaults = false;
     pcmc->smbios_legacy_mode = true;
-    pcmc->has_reserved_memory = false;
     m->default_nic = "ne2k_isa";
     m->default_cpu_type = X86_CPU_TYPE_NAME("486");
     m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
-- 
2.41.0


