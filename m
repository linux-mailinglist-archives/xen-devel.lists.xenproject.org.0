Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A90D8BC4E2
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 02:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717146.1119109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3mIz-0006xl-9B; Mon, 06 May 2024 00:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717146.1119109; Mon, 06 May 2024 00:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3mIz-0006vI-5c; Mon, 06 May 2024 00:34:09 +0000
Received: by outflank-mailman (input) for mailman id 717146;
 Mon, 06 May 2024 00:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOxl=MJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s3mIx-0006Sb-JW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 00:34:07 +0000
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 573fe0fc-0b40-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 02:34:05 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.west.internal (Postfix) with ESMTP id 5B0331800118;
 Sun,  5 May 2024 20:34:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 05 May 2024 20:34:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 May 2024 20:34:01 -0400 (EDT)
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
X-Inumbo-ID: 573fe0fc-0b40-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714955642; x=1715042042; bh=cI21Y0/d9U
	N+EtZKm1PiuxpPhL0dJGUf3Jiak+yaf+w=; b=P+hKOONZHAC1/7jUPq0NLEncLE
	9SsVIpe3QiQt61zgMSKs9QV+mE2REkm3a7pQryn+NXuz67jWIqNhHhZsrXZUKi5i
	8MwdNxDHS3aw78bjbvz0D3gUE20Pr349MrphKrylyDs+jlgmWeddFQZvheqZcIBW
	ly2ILGNv58tXYAj9R/7Y8uv9lDVcUVLSBEybzalSuOtXoOkVG7+CNgqdMb21pFqj
	rbWH1U8urbGsZIBjCXgoUJ14t7CuW1F83UwdbaGp+95taQldmVi/G/X4WK10WjtO
	XOl9mFvJlWMxloFpbbQjRAWjt9Bma5e/CFd+ePm8Q1DU4Mgwr7qgDAofXRGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714955642; x=
	1715042042; bh=cI21Y0/d9UN+EtZKm1PiuxpPhL0dJGUf3Jiak+yaf+w=; b=V
	Ru6jrVIsSuUx0hCMWF5iRIb7YnWBTqdy0fAn10pVqZC2QcZ/Y+a8eZVEqIFiVXBQ
	Rolomz3yMdsVEa+9z/exwa2ubgASoeUx/jOQ64NkdtDd6BU2RwMfRr/E7iyH06ZT
	ltXUAfd9pEK1jIU/4oigfZGnFS68gcMciVtjrBLXioQIHTe3EpqeZVBe9l9Xo4aS
	E9RfcVzaw6Y/zZvhExSwerGQ2uY4kRXQIZkfmHSTU9+trDv1UtKz64SjQFAMeouq
	wUHSA3GXYFIe+KIxfCAxU1/Dyqqya7RQbQPWcH3hH3y+FksN3AqaoiNGjyvhiYxW
	203x17lIOQSoyBxu+/UrQ==
X-ME-Sender: <xms:eiU4Zg4QFAukm_mgo5fW5KSGrbfba2sxzY0wfMElbDQU85uAo2czBg>
    <xme:eiU4Zh6G1fZ9Yj7F5Gu2jMhq_8tUrZnvdDPEUI_l8QFo7R0N5yjQv0rLJgBYMg7gp
    RjEdwSt_H0bNA>
X-ME-Received: <xmr:eiU4ZvdmcY57yvPgoVjwt19eLRzPvaZkuxonZTIh3PNrpIl-uU5NXqu2FreUeUU2t1hTj1qNz38zOvhrxaY2BYZOoD8UajtI0UQmCU6--D3B13MCR_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvhedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:eiU4ZlItYuu500441k-R5fXA4RRYrJg_Ew7cYiYufv2uRdvb9UbBqQ>
    <xmx:eiU4ZkK8YI0jhVrdCHcpJbnfR0teg9ACxS964yFXBZlKts3roPHbpg>
    <xmx:eiU4ZmwQEmWROEBvOSGehVnmezo1cuM1TzTdpWyhg5gTY5VrCoEsPg>
    <xmx:eiU4ZoKXn4HmboPfH52O22oYa8NsION4gsTFpKr3bv1rDSGlVyHaDQ>
    <xmx:eiU4Zui9JKZeKLq7eo5PRgZQhL2hw91FQl__z_rloBJSHSqgDfm_N0Q9>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v3 3/3] Do not access /dev/mem in MSI-X PCI passthrough on Xen
Date: Mon,  6 May 2024 02:33:22 +0200
Message-ID: <ebeb8c419feedad9fe0e9f39d3ed3a9ff0f4c49b.1714955598.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f5d45e3c2fb87552abfaf80982b0b724fca2134c.1714955598.git-series.marmarek@invisiblethingslab.com>
References: <cover.f5d45e3c2fb87552abfaf80982b0b724fca2134c.1714955598.git-series.marmarek@invisiblethingslab.com>
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

