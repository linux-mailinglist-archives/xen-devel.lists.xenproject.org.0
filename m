Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2EE55B0E5
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 11:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356072.584093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5Orq-0000I2-OQ; Sun, 26 Jun 2022 09:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356072.584093; Sun, 26 Jun 2022 09:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5Orq-0000Ej-Kb; Sun, 26 Jun 2022 09:47:46 +0000
Received: by outflank-mailman (input) for mailman id 356072;
 Sun, 26 Jun 2022 09:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cB6r=XB=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1o5Orp-0008Pg-Aa
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 09:47:45 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06577fdf-f535-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 11:47:43 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id u15so13171799ejc.10
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 02:47:43 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-055-174-013.78.55.pool.telefonica.de. [78.55.174.13])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm3504752ejt.212.2022.06.26.02.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:47:42 -0700 (PDT)
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
X-Inumbo-ID: 06577fdf-f535-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GE5xBWjtG9WBcqQI8QpdzBg3P6kzmtE86vK5W8A22FE=;
        b=a4377qvEOvu3e1RTfuQHxJNPGsEaFzLBzKYodFBIEb2E1GNijJZcTVwGr5bD9befZ0
         JpJaEMJNHnDTjVdJnoPxuQPvBYdl9U6yXsj9p2qGi79fPrVYpM3QAmOAT2ppnrTn0D3P
         U7JQCpBP09rFtCwCEL0pih2PVJ2uPi3Hbay6sEHcBhdodIs8k+DLz/JFcavfnOjaCg17
         nESFOkVfPHUvWU2OMNEkN4gb5Lus7Eu0GK6ro3W5Ebh/44PCoV4lrM6ld8wJpZmpvSfJ
         jbiSB0EdpEEM1cZpiH8vVpw1KfH+YF5T11FlSFr2nPntX8U9XqUDtbFLv7Q2NZyfB0VR
         /YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GE5xBWjtG9WBcqQI8QpdzBg3P6kzmtE86vK5W8A22FE=;
        b=rTUrnQJsuzDgxkwP41lEUy+j/0GHyTEx7eYijco+Pud1vzL8ZDHs42qKwCnlYmfHRt
         7s8B59lzn6hYfvOsAX155rs4gVxIuoGCrNyKwOC9VnkR7WRV8/hzG6+wOMO1WiQHlGHr
         Pqc5Rpt2eCw+JJzscVIDhZiOR8HfOFKaluh4nUmQqBZcZNqe31hTegHLjvWVBZ/1GWXO
         Q2FF2hsGz1ThfFjcDL/DIsbvJxSy20JMXKGtaJtEOMvHJnRAbdCm3du2oIBH7ltBFxLS
         Aj6gRgJBGYnr1on03FkVzv3MfU1XEVObt6x89AXmNlGfsHG6kV9FVZ/axb136lk4t7vk
         OeXA==
X-Gm-Message-State: AJIora+nTMfccD7NnbWrAG8rEKRvXIe9JDqRr2ZW719b2gThRlYg0JBg
	cVh6cWRr/LrNEmupO3qSHOU=
X-Google-Smtp-Source: AGRyM1u8/kthGc0kpB9GQ15WfHOOb7ssiu2IAI5tCBcbMUyhhCKcEeCpk68TInH1f8s1P+3vxGqdmg==
X-Received: by 2002:a17:906:b05a:b0:718:cc6b:61e0 with SMTP id bj26-20020a170906b05a00b00718cc6b61e0mr7378413ejb.501.1656236862769;
        Sun, 26 Jun 2022 02:47:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/2] hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and remove it
Date: Sun, 26 Jun 2022 11:46:56 +0200
Message-Id: <20220626094656.15673-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220626094656.15673-1-shentey@gmail.com>
References: <20220626094656.15673-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_piix_pci_write_config_client() is implemented in the xen sub tree and
uses PIIX constants internally, thus creating a direct dependency on
PIIX. Now that xen_set_pci_link_route() is stubbable, the logic of
xen_piix_pci_write_config_client() can be moved to PIIX which resolves
the dependency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 18 ------------------
 hw/isa/piix3.c        | 15 ++++++++++++++-
 include/hw/xen/xen.h  |  1 -
 stubs/xen-hw-stub.c   |  4 ----
 4 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 204fda7949..e4293d6d66 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -15,7 +15,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/i386/pc.h"
-#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
@@ -149,23 +148,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
                            irq_num & 3, level);
 }
 
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
-{
-    int i;
-
-    /* Scan for updates to PCI link routes (0x60-0x63). */
-    for (i = 0; i < len; i++) {
-        uint8_t v = (val >> (8 * i)) & 0xff;
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
-        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
-        }
-    }
-}
-
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
 {
     return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 6388558f92..48f9ab1096 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -138,7 +138,20 @@ static void piix3_write_config(PCIDevice *dev,
 static void piix3_write_config_xen(PCIDevice *dev,
                                    uint32_t address, uint32_t val, int len)
 {
-    xen_piix_pci_write_config_client(address, val, len);
+    int i;
+
+    /* Scan for updates to PCI link routes (0x60-0x63). */
+    for (i = 0; i < len; i++) {
+        uint8_t v = (val >> (8 * i)) & 0xff;
+        if (v & 0x80) {
+            v = 0;
+        }
+        v &= 0xf;
+        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
+            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
+        }
+    }
+
     piix3_write_config(dev, address, val, len);
 }
 
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 13bffaef53..afdf9c436a 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -23,7 +23,6 @@ extern bool xen_domid_restrict;
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
 void xen_piix3_set_irq(void *opaque, int irq_num, int level);
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 743967623f..34a22f2ad7 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -19,10 +19,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
-{
-}
-
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
 {
     return -1;
-- 
2.36.1


