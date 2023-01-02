Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A408465B75F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 22:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470403.729945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTC-0004nW-Vp; Mon, 02 Jan 2023 21:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470403.729945; Mon, 02 Jan 2023 21:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTC-0004iy-Pv; Mon, 02 Jan 2023 21:35:46 +0000
Received: by outflank-mailman (input) for mailman id 470403;
 Mon, 02 Jan 2023 21:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jV8v=47=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCSTB-0003Wk-Gr
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 21:35:45 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6960b59e-8ae5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 22:35:43 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id m18so69165375eji.5
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 13:35:43 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:43 -0800 (PST)
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
X-Inumbo-ID: 6960b59e-8ae5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
        b=PsKszMFE/irXAQUUzyvmEIaEr0Tcpdj3qhQcGkpM6bYRneaVlCz9APN9qcxNx7XmNo
         KLZfpHfC5iyIkCg8DGZEO4juAo/rZxv4CMMbW6pgthHUkyA2C1vKwUY20xj2gWQil7Zw
         jDG7lQAM8bdmOaCwb7KbNXuVBzjg4YjJD5g65Tg0rYTlN+NbeDFcUpR6TAg1MVAEV7zN
         i481Ii117uzsakJQlHK4tV7aHWnDIjke8SIy8P0RWBgz4pEH+jNFsPpnCqeEDR3i8nak
         Dc6oZySXPxHR7v967RWJPS5SkmtQNNGpv+r2EOUT/sAmRxGlHKArDmdliBsUgWsrEfGG
         VIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
        b=tXC1jm6887S5wd9YaEsRFoqjXGPZpmYbqnMKuwRPhumdHNRlDbJ7+dfMDwvtjP+SAD
         yx+R79Yf1zpm7t+35x7dQT6DDFr9qQjrvqo5K02HnCWpZRSYlq82l/xP+kB2BmXjW5+v
         oExYubbBtpVF8RKJEt+WJvn60MQOCez2pQYY4l4S7GpqDxblPDn/ValmAtfydga6muj5
         EMdqQxzQJoE6mggJwP6J3vJYMZJrSvpQXNQWzxY6o1x1hH4VQLCj16fZaBCVmYeyvWzd
         xs58pUhFthghW4mxnKn+26MkE0DiTaiyofEv8ruiyxGGXzgNpQCs8raI34dZ/i8hA45p
         ss5w==
X-Gm-Message-State: AFqh2kpyJ6FW2Sgb9jQ3lphEYanMwZYry2yJXcJMM1cMlf2g9NZp4xYY
	/cMQJEuJX91dJtFHip/suVE=
X-Google-Smtp-Source: AMrXdXsn74EQeNcIi6oiYO0nJq/ZeXKHgJ9u+Dwmp6n2+uN/W06k2zB+iAzGi6JoudbLO8czjj/jbQ==
X-Received: by 2002:a17:906:d205:b0:7c1:51ee:a2ec with SMTP id w5-20020a170906d20500b007c151eea2ecmr36107634ejz.46.1672695343628;
        Mon, 02 Jan 2023 13:35:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/6] hw/isa/piix: Resolve redundant k->config_write assignments
Date: Mon,  2 Jan 2023 22:35:03 +0100
Message-Id: <20230102213504.14646-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch unified handling of piix_write_config() accross all
PIIX device models which allows for assigning k->config_write once in the
base class.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index d4cdb3dadb..98e9b12661 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -396,6 +396,7 @@ static void pci_piix_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    k->config_write = piix_write_config;
     dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->hotpluggable   = false;
@@ -451,7 +452,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix_write_config;
     k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -470,7 +470,6 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix_write_config;
     k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -519,7 +518,6 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
     dc->vmsd = &vmstate_piix4;
-- 
2.39.0


