Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB2CG5c/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DBC2875E9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254161.1550147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fL-0006yT-3x; Fri, 13 Mar 2026 16:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254161.1550147; Fri, 13 Mar 2026 16:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fL-0006wX-0r; Fri, 13 Mar 2026 16:47:11 +0000
Received: by outflank-mailman (input) for mailman id 1254161;
 Fri, 13 Mar 2026 16:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8v75=BN=bounce.vates.tech=bounce-md_30504962.69b43f8b.v1-0118508a42d54da1a844b7f27097d1e0@srs-se1.protection.inumbo.net>)
 id 1w15fK-0006dJ-CA
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:47:10 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45afdb7e-1efc-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:47:08 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVkz1vGhzPm0Pr5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:47:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0118508a42d54da1a844b7f27097d1e0; Fri, 13 Mar 2026 16:47:07 +0000
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
X-Inumbo-ID: 45afdb7e-1efc-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773420427; x=1773690427;
	bh=B1fZqJL36gLjyygjzjPY/WHbUmBzonK71fAY1TCjXcI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Nzp0JDE45Zx44s8jrK143spt1uvUCtMqqhBlIK+aG/9duFiB23hhggAZ4W+uCWKo9
	 QfP7uzBQo0PiQAcW+7dkILIaaRHj1y/1esxc7t2EgnPWSh1c7OpYBygvWL9vzIPVAw
	 imY+B6mecylxmM1UMutwFHYwK7pTwtEhPdz3QCH9QjUfH4w5P6CTCn5ZN7BXD36bni
	 1TTayukUzKA3fjIaa3pDsmpvBgi0rTMrWv4bvZnpisWWPTJBVEBqCFivyfI+UdXYkp
	 hz8Ga8kFrL1ftzV9iewE51HA3YxVRG2DorZYhJwH2IOG7HbN5gl06lQq00884mbe+h
	 NGMrDS+jfpz7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773420427; x=1773680927; i=thierry.escande@vates.tech;
	bh=B1fZqJL36gLjyygjzjPY/WHbUmBzonK71fAY1TCjXcI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zDYb8qxoF4KjqvLStQ+Or7YsG/BV3GDd/z35iPo/DBevuXqsYBg2Wle4sU+mmxgAb
	 WB0IrzGAEwtboUxZi4wXzLgqnWel1bYYr8i5IWqREwDmzQBeZxTyN/3ZgLjw/09W5T
	 tat8cjKPdk3QS00WAS8GS9sbItFhb9Jq3dh3/w9Tvi2FdPg+ydtFPNgJQ8ubkMmCmO
	 vgUQ6OKJMGZ4BgRtJR2iK/4RbHOp10m/fUjZzWc2svLr/AM98mmsttPxzqf3Mdo1my
	 OLc6x1DbIt3ku9SepM872qup7kJePcEHxC/tJj7cojMs+CAjYTVQY8fbLyQlAFOSUP
	 wsGIRfvlP0tKQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/4]=20pc/xen:=20Xen=20Q35=20support:=20provide=20IRQ=20handling=20for=20PCI=20devices?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773420425990
To: qemu-devel@nongnu.org
Cc: "Alexey Gerasimenko" <x1917x@gmail.com>, "Paolo Bonzini" <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>, "Anthony PERARD" <anthony@xenproject.org>, xen-devel@lists.xenproject.org, "Thierry Escande" <thierry.escande@vates.tech>
Message-Id: <20260313164649.794591-2-thierry.escande@vates.tech>
In-Reply-To: <20260313164649.794591-1-thierry.escande@vates.tech>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0118508a42d54da1a844b7f27097d1e0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:47:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:x1917x@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,linaro.org,habkost.net,xenproject.org,lists.xenproject.org,vates.tech];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.012];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D1DBC2875E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexey Gerasimenko <x1917x@gmail.com>

This patch introduces support for ICH9 LPC PCI interrupt routing when
running under Xen. This intercepts writes to the PIRQA-D routing
registers and propagates routing changes to the Xen device model via
xen_set_pci_link_route().

A major difference between i440 and Q35 is the number of PIRQ inputs and
PIRQ routers (PCI IRQ links in terms of ACPI) available. i440 has 4 PCI
interrupt links, while Q35 has 8 (PIRQA...PIRQH). Currently Xen has
support for only 4 PCI links, so we describe only 4 of 8 PCI links in
ACPI tables. Also, hvmloader disables PIRQ routing for PIRQE..PIRQH by
writing 80h into corresponding PIRQ[n]_ROUT registers.

All this PCI interrupt routing stuff largely concerns legacy mechanism
from PIC era. It's hardly worth to extend number of PCI links supported
as we normally deal with APIC mode and/or MSI interrupts.

The only useful thing to do with PIRQE..PIRQH routing currently is to
check if guest actually attempts to use it for some reason (despite ACPI
PCI routing information provided). In this case, a warning is reported.

This has been tested on Linux guests with noapic and pci=nomsi kernel
parameters set.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 hw/i386/pc_piix.c     |  2 --
 hw/i386/xen/xen-hvm.c | 38 ++++++++++++++++++++++++++++++++++++++
 hw/isa/lpc_ich9.c     | 16 +++++++++++++---
 include/hw/xen/xen.h  |  5 +++++
 stubs/xen-hw-stub.c   |  4 ++++
 5 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4d71e0d51a..a65e09e46c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -66,8 +66,6 @@
 #include "hw/i386/acpi-build.h"
 #include "target/i386/cpu.h"
 
-#define XEN_IOAPIC_NUM_PIRQS 128ULL
-
 static GlobalProperty pc_piix_compat_defaults[] = {
     { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
     { TYPE_VFIO_PCI_NOHOTPLUG, "use-legacy-x86-rom", "true" },
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 67d3e836eb..2dba289e09 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -18,6 +18,7 @@
 #include "hw/core/hw-error.h"
 #include "hw/i386/pc.h"
 #include "hw/core/irq.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/i386/apic-msidef.h"
 #include "hw/xen/xen-x86.h"
 #include "qemu/range.h"
@@ -87,6 +88,43 @@ int xen_set_pci_link_route(uint8_t link, uint8_t irq)
     return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
 }
 
+void xen_ich9_pci_write_config_client(PCIDevice *pci_dev, uint32_t address, uint32_t val, int len)
+{
+    static bool pirqe_f_warned = false;
+    int i;
+
+    if (ranges_overlap(address, len, ICH9_LPC_PIRQA_ROUT, 4)) {
+        /* handle PIRQA..PIRQD routing */
+        /* Scan for updates to PCI link routes (0x60-0x63). */
+        for (i = 0; i < len; i++) {
+            uint8_t v = (val >> (8 * i)) & 0xff;
+            if (v & 0x80) {
+                v = 0;
+            }
+            v &= 0xf;
+            if (((address + i) >= ICH9_LPC_PIRQA_ROUT) &&
+                ((address + i) <= ICH9_LPC_PIRQD_ROUT)) {
+                xen_set_pci_link_route(address + i - ICH9_LPC_PIRQA_ROUT, v);
+            }
+        }
+    } else if (ranges_overlap(address, len, ICH9_LPC_PIRQE_ROUT, 4)) {
+        while (len--) {
+            if (range_covers_byte(ICH9_LPC_PIRQE_ROUT, 4, address) &&
+                (val & 0x80) == 0) {
+                /* print warning only once */
+                if (!pirqe_f_warned) {
+                    pirqe_f_warned = true;
+                    warn_report("WARNING: guest domain attempted to use PIRQ%c "
+                                "routing which is not supported for Xen/Q35 currently\n",
+                                (char)(address - ICH9_LPC_PIRQE_ROUT + 'E'));
+                    break;
+                }
+            }
+            address++, val >>= 8;
+        }
+    }
+}
+
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     /* If vector is 0, the msi is remapped into a pirq, passed as
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 51dc680029..8c627f0734 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -46,8 +46,10 @@
 #include "hw/acpi/ich9_timer.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/core/qdev-properties.h"
+#include "hw/xen/xen.h"
 #include "system/runstate.h"
 #include "system/system.h"
+#include "system/xen.h"
 #include "hw/core/cpu.h"
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
@@ -569,6 +571,9 @@ static void ich9_lpc_config_write(PCIDevice *d,
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(d);
     uint32_t rcba_old = pci_get_long(d->config + ICH9_LPC_RCBA);
 
+    if (xen_enabled()){
+        xen_ich9_pci_write_config_client(d, addr, val, len);
+    }
     pci_default_write_config(d, addr, val, len);
     if (ranges_overlap(addr, len, ICH9_LPC_PMBASE, 4) ||
         ranges_overlap(addr, len, ICH9_LPC_ACPI_CTRL, 1)) {
@@ -762,9 +767,14 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     irq = object_property_get_uint(OBJECT(&lpc->rtc), "irq", &error_fatal);
     isa_connect_gpio_out(ISA_DEVICE(&lpc->rtc), 0, irq);
 
-    pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
-    pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
-    pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
+    if (xen_enabled()) {
+        pci_bus_irqs(pci_bus, xen_intx_set_irq, d, XEN_IOAPIC_NUM_PIRQS);
+        pci_bus_map_irqs(pci_bus, xen_pci_slot_get_pirq);
+    } else {
+        pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
+        pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
+        pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
+    }
 
     ich9_lpc_pm_init(lpc);
 }
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index e94c6e5a31..910289b54d 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -24,6 +24,8 @@
 #define __XEN_INTERFACE_VERSION__ 0x00040e00
 #endif
 
+#define XEN_IOAPIC_NUM_PIRQS 128ULL
+
 /* xen-machine.c */
 enum xen_mode {
     XEN_DISABLED = 0, /* xen support disabled (default) */
@@ -39,6 +41,9 @@ extern bool xen_is_stubdomain;
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
 void xen_intx_set_irq(void *opaque, int irq_num, int level);
+void xen_ich9_pci_write_config_client(PCIDevice *pci_dev,
+                                      uint32_t address, uint32_t val,
+                                      int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 6cf0e9a4c1..a74209d01e 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -24,6 +24,10 @@ int xen_set_pci_link_route(uint8_t link, uint8_t irq)
     return -1;
 }
 
+void xen_ich9_pci_write_config_client(PCIDevice *pci_dev, uint32_t address, uint32_t val, int len)
+{
+}
+
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     return 0;
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


