Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9328B4D3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5928.15427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCr-0002rP-5p; Mon, 12 Oct 2020 12:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5928.15427; Mon, 12 Oct 2020 12:45:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCr-0002qq-0Y; Mon, 12 Oct 2020 12:45:37 +0000
Received: by outflank-mailman (input) for mailman id 5928;
 Mon, 12 Oct 2020 12:45:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kRxCp-0002pc-LV
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:35 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 28a554d5-2d99-49f4-ae34-aaae167cf750;
 Mon, 12 Oct 2020 12:45:34 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-6YnS7GlHPC2C_PRw3qm4hA-1; Mon, 12 Oct 2020 08:45:33 -0400
Received: by mail-wr1-f70.google.com with SMTP id b6so9214803wrn.17
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:32 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id l5sm24326366wrq.14.2020.10.12.05.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:30 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kRxCp-0002pc-LV
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:35 +0000
X-Inumbo-ID: 28a554d5-2d99-49f4-ae34-aaae167cf750
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 28a554d5-2d99-49f4-ae34-aaae167cf750;
	Mon, 12 Oct 2020 12:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602506734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCNLhoelsRO4TCaFqCkPA59+Ay48720LqdAdNtyWtdc=;
	b=ME0qyA/3xFXlPM+JyqDYjndNjdg9M+Bi4xYmeOb4Xfq5nl7WTbN7ImIK16TkalixutE/IG
	fU0zzkjB89xJIysW2YrWW3sqvSeypdbCUwKyuX+QmXULvqq1JUp8+LMl6nin+xFvoOqREc
	8eMRH+tkhjTdDZB0RzkDW2zUCj1F+Ao=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-6YnS7GlHPC2C_PRw3qm4hA-1; Mon, 12 Oct 2020 08:45:33 -0400
X-MC-Unique: 6YnS7GlHPC2C_PRw3qm4hA-1
Received: by mail-wr1-f70.google.com with SMTP id b6so9214803wrn.17
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCNLhoelsRO4TCaFqCkPA59+Ay48720LqdAdNtyWtdc=;
        b=SFpshbcfaP6Ru/vTp5JlU5rrx8iIBmStk6UUmR7I7Hdk2R85ELYg13kRVszXAHQLga
         4R+VzZmQ3xHkbW8EA3+Ot5CyTF1rRb0CdKn3ZMvbJKIGcVn48gRf0cYeTGRuK6VpZN+5
         wdluBdIA4+CHK+qciy2S2TzkRVxAeeudW6/2azZlwj2KcoGXBjFx0b+l/qvQiM6dwpCK
         mgU2qHvYTI6U0Fmr/7a8QhCPo1GXFwI38dVgFB08TDA0lZzHW0P57FwqJjoDSC5pbUsz
         vKr7axonXn0u625wYEzQ31p2WMzijHEjV2ujpzcXjxkScXpFjxH8F3et5xBanLxAO13D
         Cq6Q==
X-Gm-Message-State: AOAM531QuKtrSV3VTIQ7jG0tE4PULsrASPETYAy6dwEaJUdYQSh1uOtz
	FGSF8BsLTJCuSSsMty/WKwaPxybCQB1KVZkxLL7vAlofB8Gr+Ki4L7nG9haZdo+NBp68ZLQMkep
	RK4rEF+vEuhh50wAn/tWUJ27KOsg=
X-Received: by 2002:a5d:4409:: with SMTP id z9mr29211373wrq.236.1602506731773;
        Mon, 12 Oct 2020 05:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxae6z034MmpPgmdTflq+mg0CAWtLHwAeKxZKoPrU70udcFRiLBlXGhJ+sn9Ujlq9DXSzSzbg==
X-Received: by 2002:a5d:4409:: with SMTP id z9mr29211331wrq.236.1602506731500;
        Mon, 12 Oct 2020 05:45:31 -0700 (PDT)
Received: from localhost.localdomain (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id l5sm24326366wrq.14.2020.10.12.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:45:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 4/5] hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:05 +0200
Message-Id: <20201012124506.3406909-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_SLOT() macro in "hw/pci/pci.h"
to extract the PCI slot identifier, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/dino.c        | 2 +-
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/isa/piix3.c        | 2 +-
 hw/mips/gt64xxx_pci.c | 2 +-
 hw/pci-host/bonito.c  | 2 +-
 hw/pci-host/ppce500.c | 2 +-
 hw/ppc/ppc4xx_pci.c   | 2 +-
 hw/sh4/sh_pci.c       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 81053b5fb64..5b82c9440d1 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -496,7 +496,7 @@ static void dino_set_irq(void *opaque, int irq, int level)
 
 static int dino_pci_map_irq(PCIDevice *d, int irq_num)
 {
-    int slot = d->devfn >> 3;
+    int slot = PCI_SLOT(d->devfn);
 
     assert(irq_num >= 0 && irq_num <= 3);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f3ababf33b6..276254e6ca9 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -140,7 +140,7 @@ typedef struct XenIOState {
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
-    return irq_num + ((pci_dev->devfn >> 3) << 2);
+    return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
 void xen_piix3_set_irq(void *opaque, int irq_num, int level)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 587850b8881..f46ccae25cf 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -361,7 +361,7 @@ type_init(piix3_register_types)
 static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 {
     int slot_addend;
-    slot_addend = (pci_dev->devfn >> 3) - 1;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
     return (pci_intx + slot_addend) & 3;
 }
 
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index e091bc4ed55..588e6f99301 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -982,7 +982,7 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
-    slot = (pci_dev->devfn >> 3);
+    slot = PCI_SLOT(pci_dev->devfn);
 
     switch (slot) {
     /* PIIX4 USB */
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index b05295639a6..ee8b193e15b 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -570,7 +570,7 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
-    slot = (pci_dev->devfn >> 3);
+    slot = PCI_SLOT(pci_dev->devfn);
 
     switch (slot) {
     case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index 9517aab913e..5ad1424b31a 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -342,7 +342,7 @@ static const MemoryRegionOps e500_pci_reg_ops = {
 
 static int mpc85xx_pci_map_irq(PCIDevice *pci_dev, int pin)
 {
-    int devno = pci_dev->devfn >> 3;
+    int devno = PCI_SLOT(pci_dev->devfn);
     int ret;
 
     ret = ppce500_pci_map_irq_slot(devno, pin);
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 28724c06f88..e8789f64e80 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -243,7 +243,7 @@ static void ppc4xx_pci_reset(void *opaque)
  * may need further refactoring for other boards. */
 static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 {
-    int slot = pci_dev->devfn >> 3;
+    int slot = PCI_SLOT(pci_dev->devfn);
 
     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
 
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index 73d2d0bccb0..734892f47c7 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -109,7 +109,7 @@ static const MemoryRegionOps sh_pci_reg_ops = {
 
 static int sh_pci_map_irq(PCIDevice *d, int irq_num)
 {
-    return (d->devfn >> 3);
+    return PCI_SLOT(d->devfn);
 }
 
 static void sh_pci_set_irq(void *opaque, int irq_num, int level)
-- 
2.26.2


