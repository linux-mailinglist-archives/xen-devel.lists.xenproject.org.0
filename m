Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6989045E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699036.1091537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsBn-0000Wt-M0; Thu, 28 Mar 2024 16:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699036.1091537; Thu, 28 Mar 2024 16:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsBn-0000Tg-Iq; Thu, 28 Mar 2024 16:01:15 +0000
Received: by outflank-mailman (input) for mailman id 699036;
 Thu, 28 Mar 2024 16:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps87-00071m-Ey
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:27 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df0457be-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:57:25 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a466fc8fcccso150254866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:25 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 k13-20020a1709067acd00b00a47df55cf5esm914850ejo.13.2024.03.28.08.57.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:24 -0700 (PDT)
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
X-Inumbo-ID: df0457be-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641445; x=1712246245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JGjTd1WToEahvAfY8NVbIAQ8SXrGvIMBj7UnII/d+c=;
        b=PeVw7HqXQfyBYwOKtTmkKxh/q/3MsDf5dRffkzxN75mmNWLGDz7BfVnLg8UpfjkAg3
         wI/pk0M6bxXyA1jrgBCU4MlXe2KbpYWkhEIIj8qYMqyxOmVTJwXrS3PxFl8AvkrAq/tB
         LzFRv+slu77S3ImpIMoz+N+3s/hvDiXfv+bW3v3qaMp4bU4JROokgdUiVRDAuiQCaACB
         S8vQAGYW74BwUaU3x4GJh61cqkY1ic3HkOoGEKgosfwXanV3dd3OOK/yfU5bews5qTS3
         VuOQrXHCY+7AbLOWwXVZejkRUgOt3+vhm4UB55w7WOUQXhsH95ay8CvBzTJSXZ5LjQR8
         iuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641445; x=1712246245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JGjTd1WToEahvAfY8NVbIAQ8SXrGvIMBj7UnII/d+c=;
        b=dlrhL8wiWOdA7rTUMueHCGsk4xNsjpkbZ5VFF6zxtvytoeThwrQDdCgK6b/gpl1kcz
         TTGIkJbCsGnTp7JP6wsE6+rfNSnYrDQUJOKIPzWcFMl+/ovsILu5DvD+M7V8eJkdmFAQ
         /9p5/XN4zkizrlPhhHJnv/Y3fvWOyfMJ7Zcx8rNHtvQpAMvk6yTYWCoIRM/mGMifSlka
         l2MQFm62e0uCZOLseTVITG5R49GGwy+Jvj0fwNg3O2ioOqz85M3Dsi2dluBnc/lLfFYO
         Y7CQfYilYZ4QqaWeCPnz2pk7m6gPV7ahjRKyxhQOSTXBmpnmY5ylVI4O2dN9No+hjh18
         VEqg==
X-Forwarded-Encrypted: i=1; AJvYcCUrO0trlGvISPTKXfXOIHddDf1fUrfFKvy8LmIAjRjlNzg4nTRRyaRgmtfrWZq+o3e/d82U4vpdRTORdoknRlYppTwwy3tS4qvYIePOrhA=
X-Gm-Message-State: AOJu0YzL5a8Xd359Cf6IKwVi0ZqcS66vmowWNxA8il7Po88Ai78739gv
	oX06+aIEJQq4M65Mb/MnfLFCVT4+f/Ws6zWzcYCV5CUF5K9mS0WcAub66FRWxDU=
X-Google-Smtp-Source: AGHT+IEke0w2rGaQ9eaNpJe9RsSUrMNnkosA5ZqUCdCrrEsx8n7A8+12nHMQifWFPzkMKHDz/PJUtg==
X-Received: by 2002:a17:907:7d89:b0:a47:5265:9aac with SMTP id oz9-20020a1709077d8900b00a4752659aacmr2577836ejc.55.1711641445324;
        Thu, 28 Mar 2024 08:57:25 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 26/29] hw/i386/fw_cfg: Factor fw_cfg_build_smbios_legacy() out
Date: Thu, 28 Mar 2024 16:54:34 +0100
Message-ID: <20240328155439.58719-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor fw_cfg_build_smbios_legacy() out of
fw_cfg_build_smbios().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/fw_cfg.h             |  1 +
 hw/i386/fw_cfg-smbios-stub.c |  4 ++++
 hw/i386/fw_cfg.c             | 33 ++++++++++++++++++++++-----------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 7a426119f8..25ce86ec1b 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -24,6 +24,7 @@
 FWCfgState *fw_cfg_arch_create(MachineState *ms,
                                uint16_t boot_cpus,
                                uint16_t apic_id_limit);
+void fw_cfg_build_smbios_legacy(PCMachineState *pcms, FWCfgState *fw_cfg);
 void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
                          SmbiosEntryPointType ep_type);
 void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg);
diff --git a/hw/i386/fw_cfg-smbios-stub.c b/hw/i386/fw_cfg-smbios-stub.c
index 37dbfdee7c..da00ffc9ae 100644
--- a/hw/i386/fw_cfg-smbios-stub.c
+++ b/hw/i386/fw_cfg-smbios-stub.c
@@ -13,3 +13,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
                          SmbiosEntryPointType ep_type)
 {
 }
+
+void fw_cfg_build_smbios_legacy(PCMachineState *pcms, FWCfgState *fw_cfg)
+{
+}
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index df05fe060c..be37e28f46 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -54,6 +54,22 @@ static bool smbios_legacy_mode(PCMachineState *pcms)
     return !pc_machine_is_pci_enabled(pcms);
 }
 
+void fw_cfg_build_smbios_legacy(PCMachineState *pcms, FWCfgState *fw_cfg)
+{
+    uint8_t *smbios_tables;
+    size_t smbios_tables_len;
+    MachineState *ms = MACHINE(pcms);
+    X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
+
+    /* tell smbios about cpuid version and features */
+    smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
+
+    smbios_tables = smbios_get_table_legacy(&smbios_tables_len,
+                                            &error_fatal);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
+                     smbios_tables, smbios_tables_len);
+}
+
 void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
                          SmbiosEntryPointType ep_type)
 {
@@ -65,22 +81,17 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
 
-    if (!smbios_legacy_mode(pcms)) {
-        /* These values are guest ABI, do not change */
-        smbios_set_defaults("QEMU", mc->desc, mc->name);
+    if (smbios_legacy_mode(pcms)) {
+        fw_cfg_build_smbios_legacy(pcms, fw_cfg);
+        return;
     }
 
+    /* These values are guest ABI, do not change */
+    smbios_set_defaults("QEMU", mc->desc, mc->name);
+
     /* tell smbios about cpuid version and features */
     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
 
-    if (smbios_legacy_mode(pcms)) {
-        smbios_tables = smbios_get_table_legacy(&smbios_tables_len,
-                                                &error_fatal);
-        fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
-                         smbios_tables, smbios_tables_len);
-        return;
-    }
-
     /* build the array of physical mem area from e820 table */
     mem_array = g_malloc0(sizeof(*mem_array) * e820_get_num_entries());
     for (i = 0, array_count = 0; i < e820_get_num_entries(); i++) {
-- 
2.41.0


