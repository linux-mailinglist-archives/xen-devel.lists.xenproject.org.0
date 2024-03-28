Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06EA8903F6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699012.1091410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps61-0000Ik-QQ; Thu, 28 Mar 2024 15:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699012.1091410; Thu, 28 Mar 2024 15:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps61-0000FB-ME; Thu, 28 Mar 2024 15:55:17 +0000
Received: by outflank-mailman (input) for mailman id 699012;
 Thu, 28 Mar 2024 15:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps60-00071m-4Z
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:16 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90c7fdec-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:55:14 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5688eaf1165so1559510a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:14 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 ig3-20020a056402458300b0056c0a668316sm970627edb.3.2024.03.28.08.55.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:13 -0700 (PDT)
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
X-Inumbo-ID: 90c7fdec-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641314; x=1712246114; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfLLKG41I2ogYG1kIbKxMmfGPQoeoLD1UnfKcWEnm1Y=;
        b=ibZx7HWLcG19iRFa2+Ujih7qh7KsXlbb++txSWiCkWPBqXOaj8m2oatxYXwqBAueCy
         8Cx2Wp4h5UEbNhBMjIQlqxctepba6mCnjXD8meogi03FrMKgRzwxovwd16ELHg/h9npE
         oMTOG3docFRHgVpCU7STrYmIYOjwiFFtr6UZWiPWD6XfExqJiJ6BoCUcWDzgln9dYY8R
         vu+Me6RES7DFaS+hsIaM2tzmA7c479/11BPen/DWMyCk828hfNBD9mYA18UN3cJzs/2B
         Hl3+KRvBqxwqryiAFnMxnyGozgnVD5LCVdlhYuG1d05uC760iDMBUMK7dTDTie8a/t0Q
         7F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641314; x=1712246114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfLLKG41I2ogYG1kIbKxMmfGPQoeoLD1UnfKcWEnm1Y=;
        b=csJX5PrsFWJ+s0HFI39Vq1930eCbhU7u5tsDNPQb3D9GGQb9+f6X7qrKQkrRHQHL5T
         d54VbD5pipVqAGdedaUqqTlhf1TYTq+8n9NuRxliWd41e8LoUkGWJQoTKKxlbZJV0c5c
         NDtRpQSHpyVEUXILIHx8cvEP0ayCDImEZsmTCctlv5NZDZZ943wrbRqd3JdVpKkpG95h
         +61iXmq9CzKndct3KI0/1ZQDJmYgz8RMibORD2ii9YETLpPE0GocCNpeuAhA5CYqYVxI
         KNhMllEz+ksn4IOIrS+wpX/E/klviMc8DlupzLuEF/ovw2BOaOM4cBN1oTm3OXja1YfZ
         MOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxowz0nQPigc6ALzELu5nWtmXu9/wT/jAA4/M5nGrvqWohT/oH9Vkp+ah+n4HktjdjHKk2YyEb1cIESw3xh3BmAl5CoAZeW1yiMrJf7mY=
X-Gm-Message-State: AOJu0YzSOkr3DIrZvEIEWnA/sVOq1fsxcSrhBb/PLzBOY/NTk362tD3/
	0D7Qc6TXX2ylCg9EZc07NTCeTVKibVAoSvXJrXhF7Rt8vhRH0zVtSnjlpqYXFNU=
X-Google-Smtp-Source: AGHT+IHgYPcqLucwrXXanAHQ1HQbxbpMZQm6yL1cnX0JqCYBkEci+AP5aBFgq++VGYS+wx15kRnpQw==
X-Received: by 2002:a50:ccd1:0:b0:56a:e8e4:9aef with SMTP id b17-20020a50ccd1000000b0056ae8e49aefmr2604908edj.7.1711641314036;
        Thu, 28 Mar 2024 08:55:14 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 05/29] hw/i386/pc: Remove PCMachineClass::pci_enabled field
Date: Thu, 28 Mar 2024 16:54:13 +0100
Message-ID: <20240328155439.58719-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All TYPE_PC_PCI_MACHINE-based machines have pci_enabled
set to %true. By checking a TYPE_PC_MACHINE inherits the
TYPE_PC_PCI_MACHINE base class, we don't need this field
anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 1 -
 hw/i386/pc.c         | 3 +--
 hw/i386/pc_piix.c    | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1a4a61148a..0b23e5ec7b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -87,7 +87,6 @@ typedef struct PCMachineClass {
     X86MachineClass parent_class;
 
     /* Device configuration: */
-    bool pci_enabled;
     const char *default_south_bridge;
 
     /* Compat options: */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index eafd521489..a16bb1554c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1740,7 +1740,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
-    pcmc->pci_enabled = true;
     pcmc->has_acpi_build = true;
     pcmc->smbios_defaults = true;
     pcmc->gigabyte_align = true;
@@ -1830,7 +1829,7 @@ static void pc_pci_machine_class_init(ObjectClass *oc, void *data)
 
 bool pc_machine_is_pci_enabled(PCMachineState *pcms)
 {
-    return PC_MACHINE_GET_CLASS(pcms)->pci_enabled;
+    return !!object_dynamic_cast(OBJECT(pcms), TYPE_PC_PCI_MACHINE);
 }
 
 static const TypeInfo pc_machine_types[] = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7ada452f91..776d02db73 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -813,7 +813,6 @@ static void isapc_machine_options(MachineClass *m)
     m->max_cpus = 1;
     m->option_rom_has_mr = true;
     m->rom_file_has_mr = false;
-    pcmc->pci_enabled = false;
     pcmc->has_acpi_build = false;
     pcmc->smbios_defaults = false;
     pcmc->gigabyte_align = false;
-- 
2.41.0


