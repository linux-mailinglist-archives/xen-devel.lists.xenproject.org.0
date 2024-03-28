Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102D98904A2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699081.1091615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsJu-0005s2-EA; Thu, 28 Mar 2024 16:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699081.1091615; Thu, 28 Mar 2024 16:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsJu-0005q6-B8; Thu, 28 Mar 2024 16:09:38 +0000
Received: by outflank-mailman (input) for mailman id 699081;
 Thu, 28 Mar 2024 16:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7t-0001AK-RP
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:13 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d79ff39e-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:57:13 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d485886545so17750501fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:13 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 lh23-20020a170906f8d700b00a46ab5aaffcsm898765ejb.178.2024.03.28.08.57.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:12 -0700 (PDT)
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
X-Inumbo-ID: d79ff39e-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641433; x=1712246233; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd0AyxLTXxReg2ZsCl/5FvAkstq2JBvxx9RU6rO30AU=;
        b=OcRZeKwc5MAFrMjXvdeEeYyW5w79qP/SrZQlhZUXnYIuFhKrbRm1BkkR1TMsHtlqfL
         9clYB9IQxvJsHjcpBgRd26Cv5BPzgNbCjb48zDVZZcvix0wrRtWnH8XmEWSMgmmw/p3u
         TdVnPbrx+xJVDJHzuf79mYPxXboEDcSr/DYOgvCVPGsbihlgKwPuTi8308WYy1ptA358
         HLHeduXayJzVXlqcYIGfGwaz1XTdeOo1hKFWYdlTfqLqW5JYI1Wl1iNsygKHObIuijEG
         xjt2eof+n0Dxw3UayP6q5Pxb/VEy8mM7lukfy31RyuNQzaQrtcRzw7omLdGJfx4MAUcs
         nu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641433; x=1712246233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jd0AyxLTXxReg2ZsCl/5FvAkstq2JBvxx9RU6rO30AU=;
        b=cV+mnpKPhW3T2JQRoeQDvrew9UJ5Azol4xoX0DS+uXrrIsLAeZ/TJi5n2jUPNXTBBm
         Rrnv3dzhPXqrjUgS02b47RuZQFxPgubqQuGGgKsGsmj4Y1I6acNRTMfpbwfKkSiGLf7Y
         HEYUP2nWr5xmi6N4RGJgcvdQHI3aOA4RJSMOZxfgDxH3huR0IDCc980ygF2Psnt5AI/z
         fq0w/JKNiDA3l8smijA7TYL9b9t1TgVbd/19XgKHiICePyNArj0Kuzm99XAu6hqbZCRu
         OtTWGpNBqlzJGnd1NMKZnnCx0IKCzpxA9ym3+Zn1dn3YpO14k8D7FIRZi4rkhoc4hvVb
         DFDg==
X-Forwarded-Encrypted: i=1; AJvYcCXAOVhkwWZ+fhYE7fzPWKSvWOHFcuxFKQ+jLT3c+Sh5n6Mh/hVHb8OLQOvOC3+jj7nRQsRnc1Fd5OWdnibq8b5SmLcrXDsuxSS7YSxnWRg=
X-Gm-Message-State: AOJu0YwkLSp2tTyLgOX2pJy5dCjvijDMekg9bsncpjvASmDcC7DLWbvK
	wsY0pmJduB/0WZye9Q88s8BG3WCKqa/jpenkJ/2vgvqKi7Uphp6C+T8PINpbxVQ=
X-Google-Smtp-Source: AGHT+IFp7sCXvlR7d3Mf8BzIjVT/t0rldZPHgrIbP67RUd/bNvgi6xSgjnnhBTrJNCeF2G5tN//CLg==
X-Received: by 2002:a2e:a289:0:b0:2d3:5020:17e5 with SMTP id k9-20020a2ea289000000b002d3502017e5mr3152074lja.36.1711641432888;
        Thu, 28 Mar 2024 08:57:12 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 24/29] hw/i386/fw_cfg: Inline smbios_legacy_mode()
Date: Thu, 28 Mar 2024 16:54:32 +0100
Message-ID: <20240328155439.58719-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All PCI-based machines have the smbios_legacy_mode
field set to %false. Simplify by using an inlined
helper checking whether the machine is PCI-based or
not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 1 -
 hw/i386/fw_cfg.c     | 8 ++++++--
 hw/i386/pc_piix.c    | 2 --
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 6a6a8df005..6510914803 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -86,7 +86,6 @@ typedef struct PCMachineClass {
     int default_cpu_version;
 
     /* SMBIOS compat: */
-    bool smbios_legacy_mode;
     SmbiosEntryPointType default_smbios_ep_type;
 
     /* RAM / address space compat: */
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index f60390ed56..ffa60a4a33 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -54,6 +54,11 @@ static bool smbios_defaults(PCMachineState *pcms)
     return pc_machine_is_pci_enabled(pcms);
 }
 
+static bool smbios_legacy_mode(PCMachineState *pcms)
+{
+    return !pc_machine_is_pci_enabled(pcms);
+}
+
 void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
                          SmbiosEntryPointType ep_type)
 {
@@ -62,7 +67,6 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
     struct smbios_phys_mem_area *mem_array;
     unsigned i, array_count;
     MachineState *ms = MACHINE(pcms);
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
 
@@ -74,7 +78,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
     /* tell smbios about cpuid version and features */
     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
 
-    if (pcmc->smbios_legacy_mode) {
+    if (smbios_legacy_mode(pcms)) {
         smbios_tables = smbios_get_table_legacy(&smbios_tables_len,
                                                 &error_fatal);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 70dc8686f9..4f07476cfa 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -823,12 +823,10 @@ DEFINE_I440FX_MACHINE(v2_4, "pc-i440fx-2.4", NULL,
 #ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     m->desc = "ISA-only PC";
     m->max_cpus = 1;
     m->option_rom_has_mr = true;
     m->rom_file_has_mr = false;
-    pcmc->smbios_legacy_mode = true;
     m->default_nic = "ne2k_isa";
     m->default_cpu_type = X86_CPU_TYPE_NAME("486");
     m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
-- 
2.41.0


