Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06516B65B7
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508984.784059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPN-0003La-7Z; Sun, 12 Mar 2023 12:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508984.784059; Sun, 12 Mar 2023 12:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPM-0003EO-UU; Sun, 12 Mar 2023 12:02:36 +0000
Received: by outflank-mailman (input) for mailman id 508984;
 Sun, 12 Mar 2023 12:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbKPL-0002uS-39
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 12:02:35 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c63618c4-c0cd-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 13:02:34 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id da10so38221194edb.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 05:02:34 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:33 -0700 (PDT)
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
X-Inumbo-ID: c63618c4-c0cd-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678622554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I5DWtzKsLyM4cyrY32zr2tTmXgNaQXMmqiAK0JjXes=;
        b=eyX7uzfQRseoDcVLf1glqqsf8V35kfMg00j4z1ki81t0uYpETsmGE/JyBsRsTefz6q
         AHUFGhoGUFUTcVaT8mqmjmRCeoj/p/7/pyp3LB/F7DMF/D15vIyAl8oMj/AKN7170XSj
         onOHEkO1hm4jC31ph56IvBpykFg5+f1kQzXT7sHOM1oN29vs0zml/TH7+Lpg+2D7/k2c
         WCwSPMvT9V2op5nuqH4UbWa1SBLV/JuONy5Er5lGyb3xv8UomMqwt0tJMVEkkoRq9kyI
         2gURa5BX3w1J5pQVnMJg64eDTuW2zXxtcAmTvs9O79XLKODNAh9GqFQLb/oEzFHj04yk
         +TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3I5DWtzKsLyM4cyrY32zr2tTmXgNaQXMmqiAK0JjXes=;
        b=U/Z/NTw6Nazxx7GYaLztJK7tNeie7/ZX35s+ITnzOr4BqAW3ydT1E11K1uSfDw6qOK
         xX1vGE/Z3gLc2WwGgz3WpedVcfgArFmgLstNFUoRMuy0YWF8QVQ0V8otqhRqSdaSCfvh
         MmoO13rsebRVE+f2cz8AOvkTPXkJqjx9LdHo+F+KrKImAnS6opnHXVhekV15yg3yLTET
         mmG/EzDkhMxHTut20Q+I+LbGhh33nkKQnb0zPa6izsG4+IT14qwwzXrEC0ABgAa06iiC
         Hyz8NuA2tKPZ0IAcJ0PzhwwrCPWkkz5xDH7VG++FPeW5LFYDI+s9w+w09vTIwHtsLE5G
         ksQw==
X-Gm-Message-State: AO0yUKUatwHvzz0Q0uC6F1vaE5KjGQMhYkzQ64eLZXJOvE7Z617XpR0W
	4gRdqHNqG/YuxpWHqQA4BmN03FeNb6o=
X-Google-Smtp-Source: AK7set9hj4vE3HzWNVGymwkFNRWqJxqDthLXr5YsmajpSOkBnHKY5RdbUl7r8I2QIpYWaP2socctfw==
X-Received: by 2002:aa7:cfcc:0:b0:4fb:da15:5bfd with SMTP id r12-20020aa7cfcc000000b004fbda155bfdmr1179361edy.4.1678622554052;
        Sun, 12 Mar 2023 05:02:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
Date: Sun, 12 Mar 2023 13:02:16 +0100
Message-Id: <20230312120221.99183-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
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
2.39.2


