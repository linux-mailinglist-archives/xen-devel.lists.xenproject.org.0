Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F1890477
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699055.1091586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsEU-0003dD-Ap; Thu, 28 Mar 2024 16:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699055.1091586; Thu, 28 Mar 2024 16:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsEU-0003b2-7u; Thu, 28 Mar 2024 16:04:02 +0000
Received: by outflank-mailman (input) for mailman id 699055;
 Thu, 28 Mar 2024 16:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6t-0001AK-OU
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:11 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2a136c3-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:11 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-515a81928a1so1638126e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:11 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 ds17-20020a170907725100b00a471b5b25b9sm887001ejc.127.2024.03.28.08.56.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:10 -0700 (PDT)
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
X-Inumbo-ID: b2a136c3-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641371; x=1712246171; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmBHuqnVEd7WMmkqyo1h18jdjcgOKQnVi/P8Phxm0vQ=;
        b=tuUaXOOk88LUv5Qe2yM9SzIt+C6InQHrAD9k2uyB19qrdPBE+Omgzs8YHMqlsDVHc1
         0B+dspuz2X0O4NV1Dz4Gi5prxyize7D96Z5E1fIo1b1ElVZ/78IsHHYxQ79oA7UwRoUy
         QuhgTPcaicgne8WwSKQuMB+4mKBA4/6Ppbfred6/rXrFCIQYtR0SygKmqxCpPCQkoukP
         JxKIqFWWXB8zGZ2c8I9GyzEpSGEEDEqpXSlDUocpcY6uKDXp8l5/09cl/xpGd93KI/gu
         sA9igr5jaWAXZqrmwCeJj6pP+mQuieAflJVsKZH3AhNE2a0e/DEgruWtm+rSdgaL9Zka
         sYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641371; x=1712246171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmBHuqnVEd7WMmkqyo1h18jdjcgOKQnVi/P8Phxm0vQ=;
        b=OW2EkDjna+Xn8HNs1tpValc8I9wQ10SGiG4M3yyff02sSKlSmfMVZbk9z65P9NZ01C
         6vph6W4u+46YBSiD90tnPvfmYhoL4iRamEtYWBokJz9e22iY7Os5rXlfcHCAH4ETj3pe
         EcRLLc0CBFxl843HbAcpd5htYYePhScOPcAudQmwAwTo7L6fUsRKeRMjUnxb7wDX6XWn
         oqpp+0T52FOs6OGTjrAJVkwoJ8kaFOVsRqVxDJv97mMExNil6H4QdWHftBr/aGQmyDne
         a8Et0rZtoP/a5e6mC29dpscJfiVIXZwg/sGuG8vdvNCvb6r5MZ6XYJ0dlb988RMzCahD
         A8jw==
X-Forwarded-Encrypted: i=1; AJvYcCVJBfzx/eScTqkFnqqa9FRIDKJtd6Frqj80T9ZMwvLFtx2/RitV43hqIDkAfqoP6kJOpU0chkViAs2N4+WIuQX+jy4dD+V04hwdBtpLv4g=
X-Gm-Message-State: AOJu0YwTeIyz4rPbK+DXJAtq6QXuEVk33S/2nDXqL7aVl6M/KF6jqj2o
	gqnpBssABOFfAzlfRazSD0GZreOXWClXpljHenDmQnAvZO/Z9Ad716Gdlhfg3PI=
X-Google-Smtp-Source: AGHT+IFUtefnyMETNOsHVcJ8GlW5rJsH0GdNooS/V5PGz6OttTSyM+Vcg71L2tN7ryhsnM23ZMka+w==
X-Received: by 2002:ac2:489c:0:b0:515:af1f:5bad with SMTP id x28-20020ac2489c000000b00515af1f5badmr2600673lfc.28.1711641370819;
        Thu, 28 Mar 2024 08:56:10 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 14/29] hw/i386/pc: Move pc_system_flash_create() to pc_pci_machine_initfn()
Date: Thu, 28 Mar 2024 16:54:22 +0100
Message-ID: <20240328155439.58719-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pc_system_flash_create() is only useful for PCI-based machines.
Move the call to the PCI-based init() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c       |  2 +-
 hw/i386/pc_sysfw.c | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5b96daa414..33724791fd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1679,7 +1679,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->fd_bootchk = true;
     pcms->default_bus_bypass_iommu = false;
 
-    pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_add_alias(OBJECT(pcms), "pcspk-audiodev",
                               OBJECT(pcms->pcspk), "audiodev");
@@ -1694,6 +1693,7 @@ static void pc_pci_machine_initfn(Object *obj)
 
     ppms->acpi_build_enabled = true;
 
+    pc_system_flash_create(PC_MACHINE(obj));
     cxl_machine_init(obj, &ppms->cxl_devices_state);
 
     ppms->machine_done.notify = pc_pci_machine_done;
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 541dcaef71..167ff24fcb 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -93,12 +93,10 @@ static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
 
 void pc_system_flash_create(PCMachineState *pcms)
 {
-    if (pc_machine_is_pci_enabled(pcms)) {
-        pcms->flash[0] = pc_pflash_create(pcms, "system.flash0",
-                                          "pflash0");
-        pcms->flash[1] = pc_pflash_create(pcms, "system.flash1",
-                                          "pflash1");
-    }
+    assert(pc_machine_is_pci_enabled(pcms));
+
+    pcms->flash[0] = pc_pflash_create(pcms, "system.flash0", "pflash0");
+    pcms->flash[1] = pc_pflash_create(pcms, "system.flash1", "pflash1");
 }
 
 void pc_system_flash_cleanup_unused(PCMachineState *pcms)
-- 
2.41.0


