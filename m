Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36246D3E37
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517314.802506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEp0-00023r-Go; Mon, 03 Apr 2023 07:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517314.802506; Mon, 03 Apr 2023 07:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEp0-0001zq-BR; Mon, 03 Apr 2023 07:41:46 +0000
Received: by outflank-mailman (input) for mailman id 517314;
 Mon, 03 Apr 2023 07:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEox-0000Sg-Vv
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:44 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9d7953e-d1f2-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 09:41:42 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so19144066wmq.4
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:42 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:41 -0700 (PDT)
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
X-Inumbo-ID: f9d7953e-d1f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfruqCTvdLb6qQjpwkCpa8vgF1IvHI8+CFma9+fgJv8=;
        b=EAQ6n7WWQXPUjZaBzzBlO5S8qeAHPTlk8U7zS3dcf+8IIdkYRF+t76elBK5JMC6VvR
         MlevLDBVnopzGlcluD5E3paMkO9gGmS9AiWXwbBxrmfV6aY677J1hA7sEoOMZsusRhCO
         WtNuC4TBrqU9huTBhT4qaoJ3hKFDLVLwR3Q492RbdYmNN96sEoQRc05zQjYNBPUaYgFS
         wlTsF3d6qB4+ivcvqD/tRWrRuT7ASZ49jVudbsUe4HaCkTh0Jf88+s+oA9GGmu4u4jN4
         MYC4GsrKHzZxdgEsprYEQvYQ9+pe1/Pfl0wcjSFYsZgQhf3t0h8B31q//5p9hTJOJ1Gu
         dYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfruqCTvdLb6qQjpwkCpa8vgF1IvHI8+CFma9+fgJv8=;
        b=Enkqb0ZqCfehwenYG9frKYj8zkkeBn40frY8jQ9i+tFNFIziC3p1O7KqWkAYCSC2Wt
         DLAfN403eElT8qoLHR97cSZDeZiCFTO794t0jZg/P0IBl6/U5oWlGafWiI7qs0MghWBL
         l6jvVNvMBr+UhLs3hX7VSfs/5KGsekTXahH2+R9QI12QmHrWBa99P/TgbEwRhGl0t94D
         RNyz3YInT4pTBqv9K3uyrAixugtu7JNJUpBg6hrWI0DBpAthCBvvcuyN4EUV9rLnO+9X
         QO/S6jWk7TRerZbug6725JYJ7AINZq106tnIDYcFl464N4h5mX/sb2/35ilSTpX3At0Y
         tfmg==
X-Gm-Message-State: AO0yUKX1lAKtH8emrffrpDfAf4dTi/U7FY3N/EaGeH0COB39+XX2iEWx
	M97HPHRG4wNTFIRE6+wrwXs=
X-Google-Smtp-Source: AK7set9rrvyB0aTyq/IlC7IjQSr4MJ3b4hfbs5XNaEHQCEylCJMqyaqqp21kfc6RgszwCmJPmkED8Q==
X-Received: by 2002:a1c:770c:0:b0:3ed:454d:36ab with SMTP id t12-20020a1c770c000000b003ed454d36abmr25688857wmi.16.1680507701818;
        Mon, 03 Apr 2023 00:41:41 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 6/7] hw/isa/piix3: Resolve redundant k->config_write assignments
Date: Mon,  3 Apr 2023 09:41:23 +0200
Message-Id: <20230403074124.3925-7-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch unified handling of piix3_write_config() accross the
PIIX3 device models which allows for assigning k->config_write once in the
base class.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-6-shentey@gmail.com>
---
 hw/isa/piix3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 737f5c6a5d..418940139d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -308,6 +308,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    k->config_write = piix3_write_config;
     dc->reset       = piix3_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
@@ -356,7 +357,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
@@ -370,7 +370,6 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.40.0


