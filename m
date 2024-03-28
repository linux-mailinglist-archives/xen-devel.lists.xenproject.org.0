Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0AF890480
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699060.1091596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsFv-0004KC-Lk; Thu, 28 Mar 2024 16:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699060.1091596; Thu, 28 Mar 2024 16:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsFv-0004If-Hk; Thu, 28 Mar 2024 16:05:31 +0000
Received: by outflank-mailman (input) for mailman id 699060;
 Thu, 28 Mar 2024 16:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps8C-0001AK-ED
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:32 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2aef80a-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:57:31 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so3746426a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:31 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 o19-20020a17090637d300b00a46cc48ab07sm894776ejc.221.2024.03.28.08.57.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:31 -0700 (PDT)
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
X-Inumbo-ID: e2aef80a-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641451; x=1712246251; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhT6+kuDArhB7vl7wmlOYwb5F71/kFsimohZE69/WJ4=;
        b=n+5XDGcQYBjbYVDl0ASQF6LbHmjFNwot3DYVVLcUQ5AKH4cDVyVaq98Yz/D7DN0ry+
         dy+K5++IZbFg5sDgzdckSPlwhD26c5no5pk5+BZXgZIBIcZ72tqJj7tNfAyClCXkJmA5
         ckbxW5PD4Wqa8PCXW5oREgAHbLg5EAM3uhfcQ0Im51gzjWOje88fH3l60zP1F8zh/li2
         8TjUUpfQGcnauwyQpqg8DNL5vPAsWTmCgiIIWQOhN5cf3BguKBGRDeEXSIXOj8a+2b3H
         p3N+dgpr7fKCBLZEmAsyNBPOj3QUn/7ipsgF8u/GZj5uMmEJdJJoFENIdSwhz6tOSLii
         C3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641451; x=1712246251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhT6+kuDArhB7vl7wmlOYwb5F71/kFsimohZE69/WJ4=;
        b=FS1zMk4ydoi6Zcw3HPpoS7CaUoTPFLXC2qHkANTAC/j+LkOeGDyhHJlvNz7uqrrOLA
         l4F4U/G37r3p45erl07sHgzdhRcG0oudRvaMywiOfJwT32WFZReqm30IG/3CX2qQpK9Z
         MgE4cH8gYQXwPXm/bl6iT58Cvn/pKhKhaBvKMJB+SaRNIIxL0CSPuKreNlnJn6DfBD7S
         fdeFP0cYdFpKe+GS7pZ7Mg7duUpsGU5sRMpjOY9IRlSu0/fMPOb60EFbWksNZblfTUri
         ulh1clW+jqXrVgxgXeMfeRCAHphJv38DjG7wS+7O2D80ZjSvb8cmPP2mVlWK38z1rQDJ
         IaIw==
X-Forwarded-Encrypted: i=1; AJvYcCVX6DAji0F8XxKEIgFLovy8hAwsDoWkVCxXlUy6ftsDXA1r5uSu7Uzrnld8WYshqegrfAE/sSxVj93RRnvgxgcmkmEpoGlPJDV4IRc3Tgs=
X-Gm-Message-State: AOJu0YzZkHWc7e7052qNjX5msNvcgF3Bbz67JrCUUVsgYxjFmYXZ9Ck4
	AQnFCA88/huNqCI/Q6F0+MJu8K8ik36O2/OiR3LtV4ebyvsWvtLhLfWgTYTrgEo=
X-Google-Smtp-Source: AGHT+IE5iPw2wKGziuJIAfhXkqj1URHuVnsVTHRuhgnnHINXGtkc2NpEDzBwrK/9AluQ+8R3bvD5jA==
X-Received: by 2002:a17:906:48d7:b0:a45:ab98:aec with SMTP id d23-20020a17090648d700b00a45ab980aecmr2166613ejt.10.1711641451420;
        Thu, 28 Mar 2024 08:57:31 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 27/29] hw/i386/pc: Call fw_cfg_build_smbios_legacy() in pc_machine_done()
Date: Thu, 28 Mar 2024 16:54:35 +0100
Message-ID: <20240328155439.58719-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keep fw_cfg_build_smbios() for PCI-based machines, call
fw_cfg_build_smbios_legacy() directly from pc_machine_done().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/fw_cfg.c | 10 ----------
 hw/i386/pc.c     | 12 +++++++++++-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index be37e28f46..92e058446f 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -49,11 +49,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
 }
 
 #ifdef CONFIG_SMBIOS
-static bool smbios_legacy_mode(PCMachineState *pcms)
-{
-    return !pc_machine_is_pci_enabled(pcms);
-}
-
 void fw_cfg_build_smbios_legacy(PCMachineState *pcms, FWCfgState *fw_cfg)
 {
     uint8_t *smbios_tables;
@@ -81,11 +76,6 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
 
-    if (smbios_legacy_mode(pcms)) {
-        fw_cfg_build_smbios_legacy(pcms, fw_cfg);
-        return;
-    }
-
     /* These values are guest ABI, do not change */
     smbios_set_defaults("QEMU", mc->desc, mc->name);
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7a758a2e84..7d06a088cf 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -591,6 +591,11 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
     }
 }
 
+static bool smbios_legacy_mode(PCMachineState *pcms)
+{
+    return !pc_machine_is_pci_enabled(pcms);
+}
+
 static
 void pc_machine_done(Notifier *notifier, void *data)
 {
@@ -602,7 +607,12 @@ void pc_machine_done(Notifier *notifier, void *data)
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
     if (x86ms->fw_cfg) {
-        fw_cfg_build_smbios(pcms, x86ms->fw_cfg, pcms->smbios_entry_point_type);
+        if (smbios_legacy_mode(pcms)) {
+            fw_cfg_build_smbios_legacy(pcms, x86ms->fw_cfg);
+        } else {
+            fw_cfg_build_smbios(pcms, x86ms->fw_cfg,
+                                pcms->smbios_entry_point_type);
+        }
         fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
-- 
2.41.0


