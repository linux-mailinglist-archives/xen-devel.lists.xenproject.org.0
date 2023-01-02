Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA365B760
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 22:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470399.729899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCST8-0003gp-Kn; Mon, 02 Jan 2023 21:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470399.729899; Mon, 02 Jan 2023 21:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCST8-0003ZF-Fn; Mon, 02 Jan 2023 21:35:42 +0000
Received: by outflank-mailman (input) for mailman id 470399;
 Mon, 02 Jan 2023 21:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jV8v=47=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCST6-0003Wl-Qh
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 21:35:40 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66c192d6-8ae5-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 22:35:39 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id u9so69361564ejo.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 13:35:39 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:38 -0800 (PST)
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
X-Inumbo-ID: 66c192d6-8ae5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhjGz5k2CpbSc4H1yL5PDfOgeHeVz+Sw9cmuSS5IpyA=;
        b=owH/gHSxZpPPK6jvooYZ2wLT9TML1U3LOD629OCrtg+nERm71Dji9K6TNg3MbP6Idc
         qcr126FdTfRUKlWTIXTY+Bgh37w+XP8+KS1ONuTsaMPx8lC9OojQhW7i7hBUNA9igiqi
         0v1xr7C4jQOwjzirYfnBq8TDN97Iw+0ano5/nh5z0xMU5V/R/iqLspeXW77ZBjfooiu3
         r8Xfxx73bxr97JwI5kDKQM/jYhKNXoAT2c00SH5ujp4Jzc+PhtRVm192H5TPW1zIPZvr
         TpLoG9qlpOhMEhPVkIGVXiyGOxzZUa63JMH+ChYMA8W8mWV7O3EAr+PNxZJ1Gd4R6rOu
         pYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhjGz5k2CpbSc4H1yL5PDfOgeHeVz+Sw9cmuSS5IpyA=;
        b=BdzhCGTWdTkEauStNARUaT9PapnrXOAQX5Q/3DsOr/i0FUMuhTlG3GGmE4A1Cw16wn
         F3AEroIqqgetoxljdL0UVHP5TbXoPbd0zDuq4FbIjizUHybdnswlM29ihCkjiyEj9Kpx
         svpexZfru7U9JfahntnfoLgm/gap7LSq6k9EMKDW4msS8i6k0hN4sMJvo9+a3LgNyOG8
         bdeMjbl9shENjuRDgymYgeRURSDeF5wnEqTWsmcfBpwK9kMUFxmhyhrNm2Q3gI/tbS9P
         GMUBsKPzHazTU7eg1AXzr3SK4CBB3Ub4ZF+DtOUkmcv42n9VXfeDE1JiqgOsuFUD7Jbm
         XzjA==
X-Gm-Message-State: AFqh2kq2yGJyiTc5YZRE9u9xxc7wXmAUXywe8GhafM9AeS75c5tguORt
	Y2WbrB/sNehmbLAXZ46vwYo=
X-Google-Smtp-Source: AMrXdXsKw/KWvzmQ9hqdX4WTRGdsRsoTmLiF1urYt1nYchYGOMtg1bcydRX4/IC9k2BmIdSzSy2jZQ==
X-Received: by 2002:a17:907:9625:b0:7ad:9455:d57d with SMTP id gb37-20020a170907962500b007ad9455d57dmr38487663ejc.74.1672695339125;
        Mon, 02 Jan 2023 13:35:39 -0800 (PST)
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
Subject: [PATCH 1/6] include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it
Date: Mon,  2 Jan 2023 22:34:59 +0100
Message-Id: <20230102213504.14646-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_piix3_set_irq() hardcoded the number of PCI IRQ lines. Get it from
the PCI bus instead.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 9 ++++++---
 hw/isa/piix.c         | 2 +-
 include/hw/xen/xen.h  | 2 +-
 stubs/xen-hw-stub.c   | 2 +-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..59e8246a48 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -142,10 +142,13 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
-    xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
-                           irq_num & 3, level);
+    PCIDevice *pci_dev = opaque;
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    xen_set_pci_intx_level(xen_domid, 0, 0, irq_num / pci_bus->nirq,
+                           irq_num % pci_bus->nirq, level);
 }
 
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index ae8a27c53c..dc6014a4e4 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -504,7 +504,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..7c83ecf6b9 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -22,7 +22,7 @@ extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
-void xen_piix3_set_irq(void *opaque, int irq_num, int level);
+void xen_intx_set_irq(void *opaque, int irq_num, int level);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
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
2.39.0


