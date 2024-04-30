Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968A08B7EB2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 19:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715155.1116698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1rMz-0007Aj-HI; Tue, 30 Apr 2024 17:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715155.1116698; Tue, 30 Apr 2024 17:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1rMz-00074y-Ds; Tue, 30 Apr 2024 17:34:21 +0000
Received: by outflank-mailman (input) for mailman id 715155;
 Tue, 30 Apr 2024 17:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DdMh=MD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s1rMy-0006ry-5t
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 17:34:20 +0000
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea81d35-0717-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 19:34:18 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id 618C11C00194;
 Tue, 30 Apr 2024 13:34:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 30 Apr 2024 13:34:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 13:34:14 -0400 (EDT)
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
X-Inumbo-ID: dea81d35-0717-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714498455; x=1714584855; bh=cI21Y0/d9U
	N+EtZKm1PiuxpPhL0dJGUf3Jiak+yaf+w=; b=4mUX2jId99dyBegeNN3WaFF94Z
	MTRq7+Tjqh+6Tpapp3wAsdLoadPqRi+PYkarkFhci9A46CeLUoTex45ubshubkOK
	r3Yqmi/7nbFG4KLc/DmA2GExp+y5j/mE6J1oTfMPh995G+RsnDbYHSdGWMsmxOYm
	LnkC7QBNglASynK+eyYkANqPT+RLSMynfUjVqc9Nr1DXeoGGeJQUqCK1fnCiqgxH
	OVi3Ce0PvyFA6JVJ8i47sjt2Ny4Ay6qu1rVnDRJlqqSxuV/x6ZomUoyftn3DUPZW
	Ma4+N0RXzv8w6bbzaFk4YLS8OeDxFOtVD0R9CKhtpqeKEvPl37ILNIVdQfxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714498455; x=
	1714584855; bh=cI21Y0/d9UN+EtZKm1PiuxpPhL0dJGUf3Jiak+yaf+w=; b=V
	WE41IGJmX7U60sEoh77DQB4iVMzfr5WG5awmm3bWGDI4YNubsWK3UkF0O0oiHgxO
	XEEj6WwidnLNg090xxa5Ilz73qoA3iVrdIi+qCh7UC1F9Yhcual5gRzaX5CXAcVy
	g9iV2Da8+6q8bvNbDhjo6HAPfVtKAYxpeufc28UXFl4TtMI8Sgc5iptCFyG0Jgue
	yyIK5NwqwXF89PIgmOHuRFzIu/EjT/FhcQaWoh594U2T57K3FnR0L7APXt2EJopj
	43+qUhy3IKd1lj7IfevqphDcoOY+M4xuTqh4DvKakwKps7rQA4Y8nD7a7BeDY4E2
	6wjiSPH30uxUJShGh8nQg==
X-ME-Sender: <xms:lysxZtDU470guAexIlom9LhsQz4vbyrOjEdmxVQSmSimr4_o3FAWkg>
    <xme:lysxZriY6mKIqUAgSmmAQCiqjlY55vARn2wlASxwDYOIzGXBkaAcy9CMRorNgn674
    6yhhxJ1P7FHag>
X-ME-Received: <xmr:lysxZomuGDTa3jBSV6sRNP80ymKElGUUcQbY6QKyqgIR06Dx0ardHjgV1Ib96pYpmsk19jY1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:lysxZnzSgFQVe-JT6yiqnD8XAFDxg9V8lLjt36JexItyIulE8Kh5lA>
    <xmx:lysxZiTLiIZpafnLHCzW9H2SjPAiGpv26fBUAikNd0UnxDPUSS38JA>
    <xmx:lysxZqZy1yxaZPr1huwSs3nISVjnDhwfEG95kG40ofZZmqgcT1tKTA>
    <xmx:lysxZjSGYsBDkAg_zWA5RoiwuJrKTPD3GngfodKJJYcDA4IcUj41pA>
    <xmx:lysxZvJ6ZPyXN6OU17W0zx7ghwzs0F_fCzHd9tp6jDRgRXZ5gQBKZBVD>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v2 3/3] Do not access /dev/mem in MSI-X PCI passthrough on Xen
Date: Tue, 30 Apr 2024 19:33:11 +0200
Message-ID: <6ab3359790f4c325089a589809ebbf50ea07b31e.1714498385.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.ea761e8c87cc41550b01d6fbc1cd1116af55e288.1714498385.git-series.marmarek@invisiblethingslab.com>
References: <cover.ea761e8c87cc41550b01d6fbc1cd1116af55e288.1714498385.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The /dev/mem is used for two purposes:
 - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
 - reading Pending Bit Array (PBA)

The first one was originally done because when Xen did not send all
vector ctrl writes to the device model, so QEMU might have outdated old
register value. If Xen is new enough, this has been changed, so QEMU can
now use its cached value of the register instead. Detect the "new
enough" based on XENFEAT_dm_msix_all_writes bit in XENVER_get_features.

The Pending Bit Array (PBA) handling is for the case where it lives on
the same page as the MSI-X table itself. Xen has been extended to handle
this case too (as well as other registers that may live on those pages),
so QEMU handling is not necessary anymore.

Additionally, reading from /dev/mem is trapped and emulated by Xen, so
QEMU doesn't see real values anyway. And if it did, this method is prone
to race conditions. Removing /dev/mem access is useful to work within
stubdomain (avoids emulated reads and potential races), and necessary
when dom0 kernel runs in lockdown mode (where /dev/mem is unavailable at
all).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- Make change conditional on new Xen version (tested via
  XENFEAT_dm_msix_all_writes)
- add few comments
---
 hw/xen/xen_pt_msi.c | 94 ++++++++++++++++++++++++++++------------------
 1 file changed, 59 insertions(+), 35 deletions(-)

diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index 09cca4e..836cc9c 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -460,15 +460,23 @@ static void pci_msix_write(void *opaque, hwaddr addr,
         entry->updated = true;
     } else if (msix->enabled && entry->updated &&
                !(val & PCI_MSIX_ENTRY_CTRL_MASKBIT)) {
-        const volatile uint32_t *vec_ctrl;
-
         /*
-         * If Xen intercepts the mask bit access, entry->vec_ctrl may not be
-         * up-to-date. Read from hardware directly.
+         * Reading mask bit from hardware directly is needed on older Xen only.
          */
-        vec_ctrl = s->msix->phys_iomem_base + entry_nr * PCI_MSIX_ENTRY_SIZE
-            + PCI_MSIX_ENTRY_VECTOR_CTRL;
-        xen_pt_msix_update_one(s, entry_nr, *vec_ctrl);
+        if (s->msix->phys_iomem_base) {
+            /* Memory mapped registers */
+            const volatile uint32_t *vec_ctrl;
+
+            /*
+             * If Xen intercepts the mask bit access, entry->vec_ctrl may not be
+             * up-to-date. Read from hardware directly.
+             */
+            vec_ctrl = s->msix->phys_iomem_base + entry_nr * PCI_MSIX_ENTRY_SIZE
+                + PCI_MSIX_ENTRY_VECTOR_CTRL;
+            xen_pt_msix_update_one(s, entry_nr, *vec_ctrl);
+        } else {
+            xen_pt_msix_update_one(s, entry_nr, entry->latch(VECTOR_CTRL));
+        }
     }
 
     set_entry_value(entry, offset, val);
@@ -493,7 +501,12 @@ static uint64_t pci_msix_read(void *opaque, hwaddr addr,
         return get_entry_value(&msix->msix_entry[entry_nr], offset);
     } else {
         /* Pending Bit Array (PBA) */
-        return *(uint32_t *)(msix->phys_iomem_base + addr);
+        if (s->msix->phys_iomem_base) {
+            return *(uint32_t *)(msix->phys_iomem_base + addr);
+        }
+        XEN_PT_LOG(&s->dev, "reading PBA, addr 0x%lx, offset 0x%lx\n",
+                   addr, addr - msix->total_entries * PCI_MSIX_ENTRY_SIZE);
+        return 0xFFFFFFFF;
     }
 }
 
@@ -528,8 +541,8 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
     uint32_t table_off = 0;
     int i, total_entries, bar_index;
     XenHostPCIDevice *hd = &s->real_device;
+    xen_feature_info_t xc_version_info = { 0 };
     PCIDevice *d = &s->dev;
-    int fd = -1;
     XenPTMSIX *msix = NULL;
     int rc = 0;
 
@@ -543,6 +556,10 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
         return -1;
     }
 
+    if (xc_version(xen_xc, XENVER_get_features, &xc_version_info) < 0) {
+        return -1;
+    }
+
     rc = xen_host_pci_get_word(hd, base + PCI_MSIX_FLAGS, &control);
     if (rc) {
         XEN_PT_ERR(d, "Failed to read PCI_MSIX_FLAGS field\n");
@@ -576,33 +593,40 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
     msix->table_base = s->real_device.io_regions[bar_index].base_addr;
     XEN_PT_LOG(d, "get MSI-X table BAR base 0x%"PRIx64"\n", msix->table_base);
 
-    fd = open("/dev/mem", O_RDWR);
-    if (fd == -1) {
-        rc = -errno;
-        XEN_PT_ERR(d, "Can't open /dev/mem: %s\n", strerror(errno));
-        goto error_out;
-    }
-    XEN_PT_LOG(d, "table_off = 0x%x, total_entries = %d\n",
-               table_off, total_entries);
-    msix->table_offset_adjust = table_off & 0x0fff;
-    msix->phys_iomem_base =
-        mmap(NULL,
-             total_entries * PCI_MSIX_ENTRY_SIZE + msix->table_offset_adjust,
-             PROT_READ,
-             MAP_SHARED | MAP_LOCKED,
-             fd,
-             msix->table_base + table_off - msix->table_offset_adjust);
-    close(fd);
-    if (msix->phys_iomem_base == MAP_FAILED) {
-        rc = -errno;
-        XEN_PT_ERR(d, "Can't map physical MSI-X table: %s\n", strerror(errno));
-        goto error_out;
-    }
-    msix->phys_iomem_base = (char *)msix->phys_iomem_base
-        + msix->table_offset_adjust;
+    /* Accessing /dev/mem is needed only on older Xen. */
+    if (!(xc_version_info.submap & (1U << XENFEAT_dm_msix_all_writes))) {
+        int fd = -1;
+
+        fd = open("/dev/mem", O_RDWR);
+        if (fd == -1) {
+            rc = -errno;
+            XEN_PT_ERR(d, "Can't open /dev/mem: %s\n", strerror(errno));
+            goto error_out;
+        }
+        XEN_PT_LOG(d, "table_off = 0x%x, total_entries = %d\n",
+                   table_off, total_entries);
+        msix->table_offset_adjust = table_off & 0x0fff;
+        msix->phys_iomem_base =
+            mmap(NULL,
+                 total_entries * PCI_MSIX_ENTRY_SIZE
+                 + msix->table_offset_adjust,
+                 PROT_READ,
+                 MAP_SHARED | MAP_LOCKED,
+                 fd,
+                 msix->table_base + table_off - msix->table_offset_adjust);
+        close(fd);
+        if (msix->phys_iomem_base == MAP_FAILED) {
+            rc = -errno;
+            XEN_PT_ERR(d, "Can't map physical MSI-X table: %s\n",
+                       strerror(errno));
+            goto error_out;
+        }
+        msix->phys_iomem_base = (char *)msix->phys_iomem_base
+            + msix->table_offset_adjust;
 
-    XEN_PT_LOG(d, "mapping physical MSI-X table to %p\n",
-               msix->phys_iomem_base);
+        XEN_PT_LOG(d, "mapping physical MSI-X table to %p\n",
+                   msix->phys_iomem_base);
+    }
 
     memory_region_add_subregion_overlap(&s->bar[bar_index], table_off,
                                         &msix->mmio,
-- 
git-series 0.9.1

