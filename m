Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5808903F8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699015.1091431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6D-0001HK-LB; Thu, 28 Mar 2024 15:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699015.1091431; Thu, 28 Mar 2024 15:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6D-0001DM-Eu; Thu, 28 Mar 2024 15:55:29 +0000
Received: by outflank-mailman (input) for mailman id 699015;
 Thu, 28 Mar 2024 15:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6C-0001AK-4N
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:28 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 985dd9cb-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:55:27 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-566e869f631so1281270a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:27 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 k7-20020aa7c047000000b0056c443ce781sm968470edo.85.2024.03.28.08.55.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:26 -0700 (PDT)
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
X-Inumbo-ID: 985dd9cb-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641327; x=1712246127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t/11DBdsC4+Se7Vaykag7BJymn7PIzchj3B9U9dVz4=;
        b=txM9iJc0yr45dUdIagHwuyhJw6PO8Az7qlrWiOIpm7KCiEGFN345EUqXCuBKQfLMCC
         y9J2PNqJLpN5gBfQjErKIt81Pm7Nyt5bs/6qlx6X1XZ0sIdY2ulYv/kx5EyPydtbLci9
         mbXgIWVn/PWg2kOVT9BmxMSN5rC8Le7LIUZoj0iQcrXjf3HJT6A4hMko1QmsXBOkimZj
         1XFg2D622g94rc5GBi9sY0mII8xf9yJD1PEdYSqC7ViRxuT8LExyEjQoyqoX00frJ2M4
         T+Ke2x014b/rPS+y7cexWUXUi/0Vo+bDlvP3TzVkNgk0I+pRK0bGMPIbTiIm43X0zjqR
         VkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641327; x=1712246127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6t/11DBdsC4+Se7Vaykag7BJymn7PIzchj3B9U9dVz4=;
        b=TYOrhTIa+VZu3BD2KddQryYMZc6Yj3oihAWWT+ggZumymoheuiCHCWXU8jTgvbt78C
         RZQ6+kvgys2ASkYnTKBSCjxYeVBb9YfArfCep81e4nR4d8DHSJjyayoRW7s8VkHR8F6G
         Q9CTmk+VcCl9H0dp86scJZ8y+pcKxkXvpy8yYmV3GcIVE6vwadaeDJx+z3/pnZUZpjMR
         rB59fMG4r6Cy3chhz++MhkKCTTb3KeHHGCTd60kAJrxypT68LkmBXmQEiwcM9c9xZ724
         uFzX0QmXX4T9Hz7G/L1jLKv10feKqZu1QKcGyeNI2Ux4pNSzkSDCHfjHhvjAOlUbjlVW
         zyow==
X-Forwarded-Encrypted: i=1; AJvYcCVFAy9kWZQiM1ECVu6F3kh9HJkfZ6s3aIOWqxnNHfmguJHdgzKrBAUeXw7p9TphhW++dJeZFaGyf9Q/GGRuJoG8mQrrO0g22M1nsEWF3Qo=
X-Gm-Message-State: AOJu0Yx2TjTN4Q8YocXR76VQIqjxkAn35ra6AQr2Y16JKvo24O8NRb5n
	tcql4a09i7ljUFRLFiNgB6sYlLHTxLsCIUPdBg1z7a8Ah8qMceMhCuO49CjYsu4=
X-Google-Smtp-Source: AGHT+IGa5cOf+IgzGIenKqeTpz5Pqe+oCRGklHarD29ZvICujPU9lddIF/mJjLz/l0UjTGpZalGbwQ==
X-Received: by 2002:a50:9e64:0:b0:56b:900b:a2e with SMTP id z91-20020a509e64000000b0056b900b0a2emr2672032ede.32.1711641326922;
        Thu, 28 Mar 2024 08:55:26 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 07/29] hw/i386/pc: Call fw_cfg_add_extra_pci_roots() in pc_pci_machine_done()
Date: Thu, 28 Mar 2024 16:54:15 +0100
Message-ID: <20240328155439.58719-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fw_cfg_add_extra_pci_roots() expects a PCI bus, which only
PCI-based machines have. No need to call it on the ISA-only
machine. Move it to the PCI-specific machine_done handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a16bb1554c..f9226f7115 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -608,8 +608,6 @@ void pc_machine_done(Notifier *notifier, void *data)
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
-    fw_cfg_add_extra_pci_roots(pcms->pcibus, x86ms->fw_cfg);
-
     acpi_setup();
     if (x86ms->fw_cfg) {
         fw_cfg_build_smbios(pcms, x86ms->fw_cfg, pcms->smbios_entry_point_type);
@@ -623,6 +621,12 @@ void pc_machine_done(Notifier *notifier, void *data)
 
 static void pc_pci_machine_done(Notifier *notifier, void *data)
 {
+    PcPciMachineState *ppms = container_of(notifier,
+                                           PcPciMachineState, machine_done);
+    PCMachineState *pcms = PC_MACHINE(ppms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+
+    fw_cfg_add_extra_pci_roots(pcms->pcibus, x86ms->fw_cfg);
 }
 
 /* setup pci memory address space mapping into system address space */
-- 
2.41.0


