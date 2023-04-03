Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4B6D3E3D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517308.802445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEot-0000V5-U8; Mon, 03 Apr 2023 07:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517308.802445; Mon, 03 Apr 2023 07:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEot-0000T1-QD; Mon, 03 Apr 2023 07:41:39 +0000
Received: by outflank-mailman (input) for mailman id 517308;
 Mon, 03 Apr 2023 07:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEor-0000Sf-M9
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f57e5bd8-d1f2-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 09:41:35 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so17440294wms.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:35 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:34 -0700 (PDT)
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
X-Inumbo-ID: f57e5bd8-d1f2-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeCzVhGVlV6a+Zg2qRJBs5g8PJcLaKDhbJ2idHJxxx0=;
        b=NOsYWiO46TFwc5m5xQHDhQb58P1Be5veIezV+JjfGZagw4FzoW9qAT0JRFYCG1Egj2
         6q00XPm7KcKE7MUNFTIM7GgjU98aTY1zJm5D4vB8qAjZlbnErUSS4LUsH+5+df/dxoUP
         0E/k4gNZfqlF5NggV1/s4+AQHdipEvxQQ1nQUjtsp2ehdEujBeHt8RnlyjvDRq6SdcgL
         EQ6RsxkTM5ehELnOpAbiPcdPxEwrfnGGyLKjQpveSExcoF6JzPNodfRySaFCXvOVzjgt
         NLBM7Dq02dF3TYQjQ8bHDGAKajXemkJTLwVjK9LwE5h5Pq9U48zyJqpvvli/cdn+9UVR
         ptSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeCzVhGVlV6a+Zg2qRJBs5g8PJcLaKDhbJ2idHJxxx0=;
        b=yhYHq1tfu5ZzukYJEqg1RGVi/gPUAqb6Hi9bex8vvT3rJNDChryZxgqqNURiRjxkPT
         2jhOEQRC7/0ksbQr+y7u75mAJI27ULKINXucBLp/+WAv83RkMu+GC1t/A341wPM1nYI8
         RIEPvPNffuQpPUfuioMB9yfH4B+wT0QFSx/AgYije3Z2S3P5fwk86kS2ter5xlbL1Scb
         mbXxKRwKAb2SfqewAJgfeSXyoFo0COTy+Jiub5ATR/0S+M5n5rHqsDbURnbuauxMzUlT
         LDdrKnogyNz7YyI8XWKJcJ/Mh507QyoOuVZ9Oaa3mqj3sAEt9xoarFdHVEL9z5j43QVy
         3j9Q==
X-Gm-Message-State: AO0yUKXKozgJLbOf7J7nXCClVU6UVscYId6K+uQXh8eop8V0BPLbAqNP
	K6bDQabeMsdlyxkbxeO1tcI=
X-Google-Smtp-Source: AK7set93HQ7bKPaN49jz207odhGu/2UkBML7wwW8EKMOxHqY7JzqavV7AWSsQWIMxqbtp26LC7xE8A==
X-Received: by 2002:a1c:7406:0:b0:3ed:320a:3721 with SMTP id p6-20020a1c7406000000b003ed320a3721mr27549019wmc.22.1680507694746;
        Mon, 03 Apr 2023 00:41:34 -0700 (PDT)
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
Subject: [PATCH v4 1/7] include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
Date: Mon,  3 Apr 2023 09:41:18 +0200
Message-Id: <20230403074124.3925-2-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
while xen_piix3_set_irq() maps multiple PCI devices to their respective
IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
this.

Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
IOAPIC rather than PIIX has this many interrupt routes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-2-shentey@gmail.com>
---
 include/hw/xen/xen.h  | 2 +-
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/isa/piix3.c        | 4 ++--
 stubs/xen-hw-stub.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 2bd8ec742d..37ecc91fc3 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -39,7 +39,7 @@ extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
-void xen_piix3_set_irq(void *opaque, int irq_num, int level);
+void xen_intx_set_irq(void *opaque, int irq_num, int level);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 56641a550e..ab8f1b61ee 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -143,7 +143,7 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
     xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
                            irq_num & 3, level);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a9cb39bf21..1b3e23f0d7 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -34,7 +34,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_PIIX_NUM_PIRQS      128ULL
+#define XEN_IOAPIC_NUM_PIRQS    128ULL
 
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
@@ -405,7 +405,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 34a22f2ad7..7d7ffe83a9 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -15,7 +15,7 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return -1;
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-- 
2.40.0


