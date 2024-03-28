Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD088903FC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699023.1091470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6i-0003VF-Oj; Thu, 28 Mar 2024 15:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699023.1091470; Thu, 28 Mar 2024 15:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6i-0003Sd-Ks; Thu, 28 Mar 2024 15:56:00 +0000
Received: by outflank-mailman (input) for mailman id 699023;
 Thu, 28 Mar 2024 15:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6h-0001AK-A6
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:59 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab22719c-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:55:58 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56c12c73ed8so1456496a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:58 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 g20-20020aa7c594000000b0056be0d1cd83sm954932edq.97.2024.03.28.08.55.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:57 -0700 (PDT)
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
X-Inumbo-ID: ab22719c-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641358; x=1712246158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlOZmiJcfWhY/E5lc2Om2vdspo8I2MenAyugtnCqPJ8=;
        b=WthVM38weC/OsP93dMX7SOGT7bwOuSWVSP4NHAf7johrMLill/YrI8e5A0sIMaqL6p
         5+gu4IVdZIIYASaJ1Ax0v+ZWgTrn7q38ZN8DHmr24ASgpgoBnJ0HMNZmIjTRer7bkveW
         8AR157bx4BdrXdf/yd/FK3hCXMwiv9g0koGT3GoFZQmg9SBi+iFFtPB4O33JQn/b6TkT
         GIc1zcuYQkugkfPm1lLSY2FKYcdtYb8nhhS7nrvEH801Ji2TVyQRT+/Z0LtrbtXgVPdI
         tstHL02DwJnlsFGbGIiOYNrrTcxssCz1Imd4ufqp3z7yKBXFbeJKIjzhHw56chIlVhHp
         Af/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641358; x=1712246158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlOZmiJcfWhY/E5lc2Om2vdspo8I2MenAyugtnCqPJ8=;
        b=J5ehBKurT4lWW4lYxajsPGYaZYFoI0vFtZFuK3sccHDpNdAHi2TvDe/kFznYTDNeDy
         AFD2Wsl3A/22Sq7QGbVUJOh9otzQ9c6+zXgWhG41qq7ihMlkce0PcK2Bhalc7SmN1yc8
         o0UI2OW3csZ408Aie37JOM0yb9JoeZmiKemuzY00Z6HRFKJm4lTQz7BEekMTp77iTP8F
         jD0R/nSJvlZthGHTA61ntlYhcJMajTaXb7gKT88Z8qUWerRnSRw0qMHiTcSjvVyyJfIB
         /FuK5Nf9aEflM6amKZOGqZ4OrBbWaUmsgNyMyIQ9cpvhsoiboQVCkTSttAv9hJj1aw38
         9vEg==
X-Forwarded-Encrypted: i=1; AJvYcCXhAhqXL4AKxbxNo9vF2VogyFdgJ7vgvKfI50gqKJ8QsuwpMwJR3kBycqayh9Gsr+kycsTR4C4pchO4oN2RtPHTV4chCaQDBEgSVqCN5DA=
X-Gm-Message-State: AOJu0YxPE6wGHNImO1uRPQAGFPDyPe+G+T00OENsg6CxroC6g9u0QX9z
	Qb02hj92LsVCU1JifLN/bIrd0wYN//KLqcAbv9ISBA5ISGBLgsT/0Qmn+xFl+i8=
X-Google-Smtp-Source: AGHT+IEHlPzirbO0NxvTAiaCR1AzHmEf11L/n2EPgKkmIcgFqhAD5O/Yt/mmGevQB4ExiPCyjyrkcg==
X-Received: by 2002:a50:d650:0:b0:56b:cda3:6de6 with SMTP id c16-20020a50d650000000b0056bcda36de6mr2166952edj.42.1711641358386;
        Thu, 28 Mar 2024 08:55:58 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>
Subject: [RFC PATCH-for-9.1 12/29] hw/i386/pc: Move acpi_build_enabled to PcPciMachineState
Date: Thu, 28 Mar 2024 16:54:20 +0100
Message-ID: <20240328155439.58719-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since only PCI-based machines use the 'acpi_build_enabled',
move it to PcPciMachineState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/acpi-build.h  | 2 +-
 include/hw/i386/pc.h  | 3 ++-
 hw/i386/acpi-build.c  | 8 ++++----
 hw/i386/pc.c          | 5 ++---
 hw/i386/xen/xen-hvm.c | 3 ++-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 31de5bddbd..4c1511c432 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -10,7 +10,7 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 #define ACPI_PCIHP_SEJ_BASE 0x8
 #define ACPI_PCIHP_BNMR_BASE 0x10
 
-void acpi_setup(PCMachineState *pcms);
+void acpi_setup(PcPciMachineState *ppms);
 Object *acpi_get_i386_pci_host(void);
 
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index dd5ee448ef..67f8f4730b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -41,7 +41,6 @@ typedef struct PCMachineState {
     SmbiosEntryPointType smbios_entry_point_type;
     const char *south_bridge;
 
-    bool acpi_build_enabled;
     bool smbus_enabled;
     bool sata_enabled;
     bool hpet_enabled;
@@ -61,6 +60,8 @@ typedef struct PcPciMachineState {
 
     Notifier machine_done;
 
+    bool acpi_build_enabled;
+
     CXLState cxl_devices_state;
 } PcPciMachineState;
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e702d5e9d2..ee0e99a2fa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2749,9 +2749,9 @@ static const VMStateDescription vmstate_acpi_build = {
     },
 };
 
-void acpi_setup(PCMachineState *pcms)
+void acpi_setup(PcPciMachineState *ppms)
 {
-    X86MachineState *x86ms = X86_MACHINE(pcms);
+    X86MachineState *x86ms = X86_MACHINE(ppms);
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
     Object *vmgenid_dev;
@@ -2765,7 +2765,7 @@ void acpi_setup(PCMachineState *pcms)
         return;
     }
 
-    if (!pcms->acpi_build_enabled) {
+    if (!ppms->acpi_build_enabled) {
         ACPI_BUILD_DPRINTF("ACPI build disabled. Bailing out.\n");
         return;
     }
@@ -2778,7 +2778,7 @@ void acpi_setup(PCMachineState *pcms)
     build_state = g_malloc0(sizeof *build_state);
 
     acpi_build_tables_init(&tables);
-    acpi_build(&tables, MACHINE(pcms));
+    acpi_build(&tables, MACHINE(ppms));
 
     /* Now expose it all to Guest */
     build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 47fe3a7c02..f184808e3e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -627,7 +627,7 @@ static void pc_pci_machine_done(Notifier *notifier, void *data)
 
     fw_cfg_add_extra_pci_roots(pcms->pcibus, x86ms->fw_cfg);
 
-    acpi_setup(pcms);
+    acpi_setup(ppms);
 }
 
 /* setup pci memory address space mapping into system address space */
@@ -1687,9 +1687,8 @@ static void pc_machine_initfn(Object *obj)
 static void pc_pci_machine_initfn(Object *obj)
 {
     PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
-    PCMachineState *pcms = PC_MACHINE(obj);
 
-    pcms->acpi_build_enabled = true;
+    ppms->acpi_build_enabled = true;
 
     cxl_machine_init(obj, &ppms->cxl_devices_state);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 7745cb3963..ce48d51842 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -586,6 +586,7 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
 void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
     MachineState *ms = MACHINE(pcms);
+    PcPciMachineState *ppms = PC_PCI_MACHINE(pcms);
     unsigned int max_cpus = ms->smp.max_cpus;
     int rc;
     xen_pfn_t ioreq_pfn;
@@ -624,7 +625,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     xen_ram_init(pcms, ms->ram_size, ram_memory);
 
     /* Disable ACPI build because Xen handles it */
-    pcms->acpi_build_enabled = false;
+    ppms->acpi_build_enabled = false;
 
     return;
 
-- 
2.41.0


