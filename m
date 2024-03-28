Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B58904AC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699090.1091646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsMS-0000Ku-DG; Thu, 28 Mar 2024 16:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699090.1091646; Thu, 28 Mar 2024 16:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsMS-0000I6-A4; Thu, 28 Mar 2024 16:12:16 +0000
Received: by outflank-mailman (input) for mailman id 699090;
 Thu, 28 Mar 2024 16:12:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7n-0001AK-EE
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3c5034c-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:57:06 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a466a27d30aso140700166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:06 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 f8-20020a17090624c800b00a46fbff47a6sm891626ejb.168.2024.03.28.08.57.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:06 -0700 (PDT)
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
X-Inumbo-ID: d3c5034c-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641426; x=1712246226; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BSXB7GHW5TBQXIjnxuyxFyj9B1iDsM8cHi/htTyRxs=;
        b=H/TUrYVppdn7LmwRGsgx2j1wQU1h58w8/D/39uon7Jhk6b7slCRn97xbTg/LKyZoVY
         VJBJXV9OnD3YoJ3XiVC8kZxVxyNX/BZaTexO0SWUHL30WB0K8btFK3HGKLNjCq8ztgna
         vUnz/75nWBTquQnVecf1GUicG7lMFGgIuqkl0HYQFspy7CXJola8DESy+ff6OEqY1/Hk
         G26nvrb01XzF71lPtamFgGQum8MDO3xo4XW/cy62T1HEMhruqv3jF5vbEiJmJubnKesE
         RmmIFPNbVgBM55MOyFb8m6qqX4T6/8hCwqt2xi5hgXb92SfTNV9PtYsTciLDDy2gcHBK
         NnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641426; x=1712246226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BSXB7GHW5TBQXIjnxuyxFyj9B1iDsM8cHi/htTyRxs=;
        b=lttiTexABxs/MZ1G9wVhWkn3X6mdCF/63J+2oCOb0SdU3eM4hxen8tIVBXc2bKYz8D
         c+IgbGvXXAVZoJhPci/GaXb7KaPfS1zoI5lOYpGkTIAyPZdeHlmYmL/iw5siZw7vEmz7
         02YJp3LP38zW/5TeRLnzD2ibieu4243U4q4He8W08qJdg6SW+2dazjuEZOBThProxg7e
         2qBl+1oxiCUKLS+fZYobgtVYvuB81xqDv+iyNlTMMvo30nQDGj0vqKO9sLX8w++BvpUn
         AXZzEVTUGrbJdILxL42P5u1jpz6B5QeppuIogR84h5wucdKLB0GPizkVtK0gHqoWkZch
         inww==
X-Forwarded-Encrypted: i=1; AJvYcCWdjweH8hCNV+vAtH7CnsX7fF0Ea6497PBY8wQGDvWS8rzMHqkFs4OkBxh9rtfVxn9mz6PofYakHxzHHDo6QNUGHNZnpXsFWlMGv/EeO8c=
X-Gm-Message-State: AOJu0Yy0JqKG5kgPIqm7Q+2R18VwWwABH/w+tWxO8OqlpsrGwi4PrYWk
	+fBqx38XNPRz22s+Gsc2a43dl0p8gkE4jwgjLYhnfBrKGsOLyUav6NC1HrayfiA=
X-Google-Smtp-Source: AGHT+IFF/skKWHNCTMPwJb+B2ckteIOxmThfN9+aMTRN8D0HIEaksr7NEcZ4nuV98VsFYsHsSKmB9w==
X-Received: by 2002:a17:906:b112:b0:a47:1fe8:9825 with SMTP id u18-20020a170906b11200b00a471fe89825mr2020350ejy.32.1711641426506;
        Thu, 28 Mar 2024 08:57:06 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 23/29] hw/i386/fw_cfg: Inline smbios_defaults()
Date: Thu, 28 Mar 2024 16:54:31 +0100
Message-ID: <20240328155439.58719-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All PCI-based machines have the smbios_defaults field
set to %true. Simplify by using an inlined helper
checking whether the machine is PCI-based or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 1 -
 hw/i386/fw_cfg.c     | 7 ++++++-
 hw/i386/pc.c         | 1 -
 hw/i386/pc_piix.c    | 1 -
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 7da0bc8aa4..6a6a8df005 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -86,7 +86,6 @@ typedef struct PCMachineClass {
     int default_cpu_version;
 
     /* SMBIOS compat: */
-    bool smbios_defaults;
     bool smbios_legacy_mode;
     SmbiosEntryPointType default_smbios_ep_type;
 
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 14a7dfbdc9..f60390ed56 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -49,6 +49,11 @@ const char *fw_cfg_arch_key_name(uint16_t key)
 }
 
 #ifdef CONFIG_SMBIOS
+static bool smbios_defaults(PCMachineState *pcms)
+{
+    return pc_machine_is_pci_enabled(pcms);
+}
+
 void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
                          SmbiosEntryPointType ep_type)
 {
@@ -61,7 +66,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
 
-    if (pcmc->smbios_defaults) {
+    if (smbios_defaults(pcms)) {
         /* These values are guest ABI, do not change */
         smbios_set_defaults("QEMU", mc->desc, mc->name);
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b83abee8e9..7a758a2e84 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1754,7 +1754,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
-    pcmc->smbios_defaults = true;
     pcmc->enforce_amd_1tb_hole = true;
     pcmc->pvh_enabled = true;
     pcmc->kvmclock_create_always = true;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e6178f8653..70dc8686f9 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -828,7 +828,6 @@ static void isapc_machine_options(MachineClass *m)
     m->max_cpus = 1;
     m->option_rom_has_mr = true;
     m->rom_file_has_mr = false;
-    pcmc->smbios_defaults = false;
     pcmc->smbios_legacy_mode = true;
     m->default_nic = "ne2k_isa";
     m->default_cpu_type = X86_CPU_TYPE_NAME("486");
-- 
2.41.0


