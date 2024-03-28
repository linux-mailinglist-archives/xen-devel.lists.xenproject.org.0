Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605C689041C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699026.1091497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps9B-0005Vf-Oi; Thu, 28 Mar 2024 15:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699026.1091497; Thu, 28 Mar 2024 15:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps9B-0005Pq-L6; Thu, 28 Mar 2024 15:58:33 +0000
Received: by outflank-mailman (input) for mailman id 699026;
 Thu, 28 Mar 2024 15:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7V-0001AK-1u
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:49 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8c3fa24-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:48 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so216859666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:48 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 u23-20020a170906125700b00a47522c193asm892212eja.196.2024.03.28.08.56.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:47 -0700 (PDT)
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
X-Inumbo-ID: c8c3fa24-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641408; x=1712246208; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Aa27ZqAQEFmCBsiqy9XwiiPf6EIjcNyjahGDi9IpJg=;
        b=THbj2G4pRSyqcX7zGCv8FZ3Kjw9z916Flj1ZcDQO8dyIO9fmrg8zrDl4HQ8ErAxQ5m
         Cm5xyqf8FsiXzq3+HbSV+Yni/NyHB827BgCRV00bvn2orEdmLsOdnKaEnFcgebPtcphh
         wqvHFsgZ5R4Tnu/BfPmUhHH4LKN3e7xOvk9Mv0XcDWDq4ocxokge6aWQQd0X0YsHmHmK
         riPxiT1gY9Yg6nz+k+cvQKpDwo+kUvWG11U8hAW0lg8wtDq1fr+JZ5W1UflF2FHcWu1F
         jtfGzlqcLdkUcvaF7GvDQ/ZHfV+lqBAbCajUXNYvLiNYBbUiLTbpAHTbJHOsKLlTpQqv
         pn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641408; x=1712246208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Aa27ZqAQEFmCBsiqy9XwiiPf6EIjcNyjahGDi9IpJg=;
        b=GUTR01UyxXmykMSHJ/67r4FujSCOhkA3dgXhEf+I9r0zC3iaENeujIJT7zCHLvLpiV
         JnrNaqzrqKHMFkNOaTrr9+QGOwG/DfPiJ/+4nERQFOnBi93FaKpj7Y26vwYMGBONPsiP
         1d1hCY9K+nmLmofIGClfSspCGE2YSRNKl6OuAL6wmMk8nGWNpiiNlu0hDWPkzumhKlV4
         oZut4iKwGBEUMNMVJFbMBA11BR+Y7D2JTNlnjlhUZzw351iaozUxZElxUFoLeL9lA6B1
         NtOuWoDOhBXQ0UyCxtv4RZJzuEHB7hzhEnB2jsSNsK+Iy5l8NOp7z3tkA6EReNYaDNgl
         bOtA==
X-Forwarded-Encrypted: i=1; AJvYcCVSDbFAQIozLKArjDWcmV3yXtu2ORZi+cKpbP34bHFwaHQQnxCXdk3tVNfazMLuZgKpWZtW9wt3bYHm9TUXN/BNUglstWb6pR3O1idVd8o=
X-Gm-Message-State: AOJu0Yw6uIj/K1V92VfcbGQWBfwXxWQwbBAfcH1YpwBsEbc6niPwOKdG
	HgVBrH+aPR9U4zeZ2nmBHN0/OVIplkIFN1Okhgl3ju5I6Zl82CVkf0suo8XVeIw=
X-Google-Smtp-Source: AGHT+IGf+dMAnCAltiuzPzgchc+sbbW407Sj1dQczYyJgyomDKws4CVNCOW6jzbL55k6+JJbXoaF8w==
X-Received: by 2002:a17:906:ccc3:b0:a47:1f61:4d02 with SMTP id ot3-20020a170906ccc300b00a471f614d02mr2207346ejb.36.1711641408058;
        Thu, 28 Mar 2024 08:56:48 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 20/29] hw/i386/pc: Pass PcPciMachineState argument to pc_pci_hole64_start()
Date: Thu, 28 Mar 2024 16:54:28 +0100
Message-ID: <20240328155439.58719-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pc_pci_hole64_start() is only used by PCI-based
machines.  Pass it a PcPciMachineState argument,
removing a qdev_get_machine() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 2 +-
 hw/i386/pc.c         | 8 ++++----
 hw/pci-host/i440fx.c | 2 +-
 hw/pci-host/q35.c    | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index df4c813854..7da0bc8aa4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -157,7 +157,7 @@ void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
                     uint64_t pci_hole64_size);
-uint64_t pc_pci_hole64_start(void);
+uint64_t pc_pci_hole64_start(PcPciMachineState *ppms);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d8e91d18b8..b83abee8e9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -747,7 +747,8 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
 
     if (cpu->env.features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
         /* 64-bit systems */
-        return pc_pci_hole64_start() + pci_hole64_size - 1;
+        PcPciMachineState *ppms = PC_PCI_MACHINE(pcms);
+        return pc_pci_hole64_start(ppms) + pci_hole64_size - 1;
     }
 
     /* 32-bit systems */
@@ -1016,11 +1017,10 @@ void pc_memory_init(PCMachineState *pcms,
  * The 64bit pci hole starts after "above 4G RAM" and
  * potentially the space reserved for memory hotplug.
  */
-uint64_t pc_pci_hole64_start(void)
+uint64_t pc_pci_hole64_start(PcPciMachineState *ppms)
 {
-    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    PCMachineState *pcms = PC_MACHINE(ppms);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
-    PcPciMachineState *ppms = PC_PCI_MACHINE(pcms);
     MachineState *ms = MACHINE(pcms);
     uint64_t hole64_start = 0;
     ram_addr_t size = 0;
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 4f0a0438d7..add99e4f76 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -180,7 +180,7 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
     pci_bus_get_w64_range(h->bus, &w64);
     value = range_is_empty(&w64) ? 0 : range_lob(&w64);
     if (!value && s->pci_hole64_fix) {
-        value = pc_pci_hole64_start();
+        value = pc_pci_hole64_start(PC_PCI_MACHINE(qdev_get_machine()));
     }
     return value;
 }
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 0d7d4e3f08..baf55897b2 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -123,7 +123,7 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
     pci_bus_get_w64_range(h->bus, &w64);
     value = range_is_empty(&w64) ? 0 : range_lob(&w64);
     if (!value && s->pci_hole64_fix) {
-        value = pc_pci_hole64_start();
+        value = pc_pci_hole64_start(PC_PCI_MACHINE(qdev_get_machine()));
     }
     return value;
 }
-- 
2.41.0


