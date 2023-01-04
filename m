Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7D65D66C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471204.730969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51E-0007VI-Mf; Wed, 04 Jan 2023 14:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471204.730969; Wed, 04 Jan 2023 14:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51E-0007Rs-HO; Wed, 04 Jan 2023 14:45:28 +0000
Received: by outflank-mailman (input) for mailman id 471204;
 Wed, 04 Jan 2023 14:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD51C-00079V-3l
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:45:26 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b8f66c4-8c3e-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 15:45:24 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id s9so1187877wru.13
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 06:45:24 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:23 -0800 (PST)
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
X-Inumbo-ID: 6b8f66c4-8c3e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwwBmjkQ+lNHH0kKiW9e0yfr8jRksndzOx0yQHLnF3U=;
        b=Wch2+6IG0obcLWirCwO0uN2viNNRWGwjqAFhW/ZYw1fchDlIbgWmuB3c8dlern5JGN
         4zUs9Y2GjuybCLMXzn2i3IB2HpMdnJ3HOfcR0Id/ZqbSM3D2zZU/HKa/camSQegFxTMw
         AHdCTPkE+aAGidOO551rDDq7D9WH+cxg/4sMPHQ+cM+9wzSWfesq1yH6xy47O9xTEoFd
         eZfdHHVnJEmwB7VwCBj9m9+mWDLchXhhkYcMqSmiWNviCG4U3NvQshROvXH0TUL+D83f
         7bjrqMxVbRF0Ka56hPzfPNov9BdR1GZ9Rp8kUFHu/C6dGAo3y08PsXTkRemZcP/M5Y9L
         Ojww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwwBmjkQ+lNHH0kKiW9e0yfr8jRksndzOx0yQHLnF3U=;
        b=ha4OAtcP3A//iPmL22Htk6mlfmsxKkyCAtcj+wFfNTPK4W7NfBUH92dNVbuZ67/5DU
         HtjyJmAhsuDpIwtPWRa+sQQKbBblXN81VJuUjpF83odvMT8vMQxvbkt6OxjoowTKckLR
         lxyx/znmf5sWnsNGpvneX5P85Ay1mNIIjvKepEVtVX/JMFnWKooUZIMNcvWBmVH/uWrK
         KzWZfQ2nNiTLmhJNwgIgXio1uNKwaY6VVNGaOM/dxxozJWYsXMVPHprs4YAOrhuMKNns
         /zAgwhbmCcpoTsZjmqhx0wGUXTu5dtNOVneIxnM9/+OW1Wn0n24FVDk3ZtRtauvlGNRI
         /CmA==
X-Gm-Message-State: AFqh2ko9ayom09+ubbFwtjokwIp9A8wUPW7/gXxOyCIVvQkxui1NDcnH
	jcji60g8/Uy8LHvfgf2NT54=
X-Google-Smtp-Source: AMrXdXv1Bz9WYYfmdlxF76KLvJgFfsoIF1V0rIeHDad7Wu77HbMKWyWlh26v/oTTwkdlUrXJkWzplw==
X-Received: by 2002:a05:6000:1d84:b0:273:6845:68ef with SMTP id bk4-20020a0560001d8400b00273684568efmr24329892wrb.60.1672843523618;
        Wed, 04 Jan 2023 06:45:23 -0800 (PST)
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
Subject: [PATCH v2 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
Date: Wed,  4 Jan 2023 15:44:32 +0100
Message-Id: <20230104144437.27479-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
while xen_piix3_set_irq() maps multiple PCI devices to their respective
IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
this.

Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
IOAPIC rather than PIIX has this many interrupt routes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/isa/piix.c         | 4 ++--
 include/hw/xen/xen.h  | 2 +-
 stubs/xen-hw-stub.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..558c43309e 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -142,7 +142,7 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
     xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
                            irq_num & 3, level);
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index ae8a27c53c..a7a4eec206 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -38,7 +38,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_PIIX_NUM_PIRQS      128ULL
+#define XEN_IOAPIC_NUM_PIRQS    128ULL
 
 static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
@@ -504,7 +504,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
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


