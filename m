Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8665D669
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471207.731001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51H-0008Dx-56; Wed, 04 Jan 2023 14:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471207.731001; Wed, 04 Jan 2023 14:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51G-000842-Qv; Wed, 04 Jan 2023 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 471207;
 Wed, 04 Jan 2023 14:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD51E-00079b-O1
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:45:28 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dea74b4-8c3e-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 15:45:28 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id az7so8799947wrb.5
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 06:45:28 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:27 -0800 (PST)
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
X-Inumbo-ID: 6dea74b4-8c3e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
        b=W9Un76kfIXX71algBT3MUyLCUiN80OFK1EUd0YbCe6wUItAP0Luda8qEceYXzOUdFw
         jY1QLBi8eG0gW8dCgOjygcJ+fp4QbyzP8Ye4eARwBnC9y0DkgijILW6lYwfh0Jwvet2r
         4qrOldpBtix87pTunJpR5Hzs+5mBOue2wekAGVrS5ABa97Ub9oHHVlIjCdGw8E/QrMWt
         uF7+vwGjO6ufN4oR16pm29afZxpgs19LCt554cFbOcBl4NTLEdn0+fh7sb0bkFYX/Qy3
         /7j2qYCvOrtcFrstpMIW3NJQlCJzKvvJDPW6GJrhHDp8NV6E0rozu/tgN7PiVc9LxJ4d
         rJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTbz96Fg6rdZNkQF03buq3nvArFrt1X2bnXBL/QETy8=;
        b=hAnboLlHOS5i/VMcaI6yf68aOHJr0usBmCb06vuVRan5avil1+ldzlNf8eXIMIQg+l
         4Deg6DYtiB0rLKw+6ctJXTWNvG0swLwt9S+h5CDOWnUZAwhVLSOpkz1zE5Z5n/0LIKdT
         lzpyzrvy0KBG2YW2cZ2s+BT+VA9AYOqK1IoIveKkec3kCjekl+/A2pMs9DOyCwa/QLS0
         39aPNGn9Y7tpc8wO2jYD/0pVxmUoQKSSL1q+vuuDHquid8MnmNF3Z7+UOUBqvg434CiL
         Ao4jFao6FGw75Z/bM95D0vaEkZCvrImVlrhT6CulONXKUOxrfID+8HcsSwlOdKfY0hiw
         R6qA==
X-Gm-Message-State: AFqh2krX0egy/g06wqU8ZS7NXEYaDE4gG1YDueJEapnq8Uqu3VUz+/+W
	N3Oef5fU7Ea3x6GYH+kWGl4=
X-Google-Smtp-Source: AMrXdXuqwFIIXGumdoGoKi2S2o1kZi2sGwiXEGMwUaQU6kBeT44weD6z/UJouVJiTGdquTAHfyXG3g==
X-Received: by 2002:a5d:640c:0:b0:2a3:1c13:2888 with SMTP id z12-20020a5d640c000000b002a31c132888mr2471851wru.60.1672843527498;
        Wed, 04 Jan 2023 06:45:27 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 5/6] hw/isa/piix: Resolve redundant k->config_write assignments
Date: Wed,  4 Jan 2023 15:44:36 +0100
Message-Id: <20230104144437.27479-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
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


