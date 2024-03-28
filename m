Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A188903FA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699019.1091449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6W-0002ZA-2W; Thu, 28 Mar 2024 15:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699019.1091449; Thu, 28 Mar 2024 15:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6V-0002V2-Vz; Thu, 28 Mar 2024 15:55:47 +0000
Received: by outflank-mailman (input) for mailman id 699019;
 Thu, 28 Mar 2024 15:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6U-0001AK-IC
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:46 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a38a74cb-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:55:46 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56c2b4850d2so1407108a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:46 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 r18-20020a170906c29200b00a4e2a1146f8sm298044ejz.48.2024.03.28.08.55.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:45 -0700 (PDT)
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
X-Inumbo-ID: a38a74cb-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641345; x=1712246145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtUfcj3aTDn2mvaMR/QsDVngwC1CAz/OBQXAMI7WNPQ=;
        b=lNJDLqZW9NEMGRWweBxLfSo2JFd3oApy7h8DgV7+lE5SXPKodKLsud3rIRxOjMlWp+
         m05b11yOqliLYv27I5t3UNG6cVVoe9sz3i3fXMQBnRm49073SeiFn+HS/4BgCJS/TPJe
         75j/Bwv1mG2c/RaNVbzAIBX9ObG2dTEHK7xgAcX/mR1XpbeSQ9EQJzWz7F7azME595WZ
         yJw28bdxxQiLPwyN7Y88Sl+rRqkM3q2ci9m0ftbGuHdrD6w4gIbgUZ/72ox7eo4ewZRu
         0M00pB+IQT2HZJJ2Mw3kry7u3U0iAQMpCQMurTBOrotP4SZk6f+X5bvR1S+FoLXlTIOG
         PmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641345; x=1712246145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtUfcj3aTDn2mvaMR/QsDVngwC1CAz/OBQXAMI7WNPQ=;
        b=CM5rSkowNVAlw6yj0lYxt2Zl6EyKN4VwLEk9FFyg1BBKI3ft06Dj7TSegIDt3KlWOi
         WyEwtaISw6wIdcvVgv+oDKL9a7ft6iPLzcZ+dqDfbwBbdr6mbHTcoLvajDEK8pjyZxbe
         PtykylIuDWse1HEgSHWKwDrEk/ulWhbkR4+xuNNMKJ2M4fwYVvZ2tPT4TVTwHqpVfdlC
         XtAoQBzNCpKawOiAG9eSH4EajGTLHg6/YjlgHaZhs5fUPTzgy4IK9+g7nOEtmLlVQ9B/
         cqL1nV/TcM53zrwM/H+YhJvO1qIEy5jAFEeHnfce5xhwOwhRChBZmSsTk8+hMx3tihMC
         mGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUbnGbqxsGBYc//hP83u+MT3apaPJIJ4IF6Hmnf6h5dpYXr1EPjwsdG0pknlBzvF6U+NmxImjuHUwWMIrDUiU1gpxbGUQDWyXb8/27xCU=
X-Gm-Message-State: AOJu0YxN0FFLzLtLq8/lpP+uaB/NmE71rJVsFSqCHRRyTC1QTRzYpVMh
	dfYEzvBS0L0uBE74F3eVSQptQLt1zIc2x23wDOD+daxHyzdrNPw7YWOqcHn3s0c=
X-Google-Smtp-Source: AGHT+IE4H2j7DvpBr0ZgGTO3mYeCN1DwhGLVSa7xknb/dNXvpG290SVF6AQSzPcOp/lNCIhUZoP8Cw==
X-Received: by 2002:a17:906:4697:b0:a4e:ebd:254a with SMTP id a23-20020a170906469700b00a4e0ebd254amr2129554ejr.9.1711641345640;
        Thu, 28 Mar 2024 08:55:45 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 10/29] hw/i386/pc: Remove PCMachineClass::has_acpi_build field
Date: Thu, 28 Mar 2024 16:54:18 +0100
Message-ID: <20240328155439.58719-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PCMachineClass::has_acpi_build is always %true for PCI
based machines. Remove it, setting the 'acpi_build_enabled'
field once in pc_pci_machine_initfn().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 3 ---
 hw/i386/pc.c         | 6 +++---
 hw/i386/pc_piix.c    | 1 -
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a97493d29d..dd5ee448ef 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -95,9 +95,6 @@ typedef struct PCMachineClass {
     /* Default CPU model version.  See x86_cpu_set_default_version(). */
     int default_cpu_version;
 
-    /* ACPI compat: */
-    bool has_acpi_build;
-
     /* SMBIOS compat: */
     bool smbios_defaults;
     bool smbios_legacy_mode;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index dfc0247bb6..f0dc04e2fc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1664,8 +1664,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbios_entry_point_type = pcmc->default_smbios_ep_type;
     pcms->south_bridge = pcmc->default_south_bridge;
 
-    /* acpi build is enabled by default if machine supports it */
-    pcms->acpi_build_enabled = pcmc->has_acpi_build;
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->i8042_enabled = true;
@@ -1688,6 +1686,9 @@ static void pc_machine_initfn(Object *obj)
 static void pc_pci_machine_initfn(Object *obj)
 {
     PcPciMachineState *ppms = PC_PCI_MACHINE(obj);
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->acpi_build_enabled = true;
 
     cxl_machine_init(obj, &ppms->cxl_devices_state);
 
@@ -1745,7 +1746,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
-    pcmc->has_acpi_build = true;
     pcmc->smbios_defaults = true;
     pcmc->gigabyte_align = true;
     pcmc->has_reserved_memory = true;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c42dd46e59..7aa2598e10 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -816,7 +816,6 @@ static void isapc_machine_options(MachineClass *m)
     m->max_cpus = 1;
     m->option_rom_has_mr = true;
     m->rom_file_has_mr = false;
-    pcmc->has_acpi_build = false;
     pcmc->smbios_defaults = false;
     pcmc->gigabyte_align = false;
     pcmc->smbios_legacy_mode = true;
-- 
2.41.0


