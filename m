Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24398B3EB4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712997.1113958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnD-0005cX-4B; Fri, 26 Apr 2024 17:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712997.1113958; Fri, 26 Apr 2024 17:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnC-0005Zq-Vy; Fri, 26 Apr 2024 17:55:26 +0000
Received: by outflank-mailman (input) for mailman id 712997;
 Fri, 26 Apr 2024 17:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0PnB-0005IL-Gu
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:25 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2463dfae-03f6-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 19:55:20 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id 0B3E21800120;
 Fri, 26 Apr 2024 13:55:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 26 Apr 2024 13:55:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:15 -0400 (EDT)
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
X-Inumbo-ID: 2463dfae-03f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714154116; x=1714240516; bh=4hT2or0Iti
	p5jFfCLVRRh827QMnfJPeWI2OQoU3RIPw=; b=JhYIlBjeijgjEgs6bzmQ4oooXg
	J1QNrCFxqSMX+Het+wBwJLLRw31BpdF6NGNkTE753ceLKVatnhkl3xP5ECWP379s
	CJrKoDf9mfYT4Jo8az/2Ufk5XcpcVVag5AryHRgzU6Qyt4I3oxH1n7kWNq+tTuNT
	qD3i8j2nSDGraqitPH7KfrW0UIqzIIJK/xb6y8YJhM101wGvd8QXP4uiN9sBSPfk
	QT/N9QYReC9pBB/Ew+gE5liUU0bSZlOltop+UNwLR6DDzssdvGbYTzRz8GIv2+Zj
	7vUPZXULfHHPfv1K7Krm2GgYANgPq3ml65i5UwIMTgF8XKn5DTHSQvu2xYZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714154116; x=
	1714240516; bh=4hT2or0Itip5jFfCLVRRh827QMnfJPeWI2OQoU3RIPw=; b=h
	UVQvVwAj947lUYO6bA2M41Mu+v63wA3C0+7+CD4FOsDLm1Ck8P3oKOulag8sBHvK
	9qf/rAecyyDIklsr6lfex8bVS67s9VgYJPUI91AoqBw5zBGBKB41Iqg64urKZZDz
	vx9DxSb/YZdIeFNipG+6dapr1jIsTFErnrajdluvKo7OZcIcexy/WMbwPzlvFLms
	Cec/bqwMD98oQQF25NuyxlIwd/mo3sHFuzv2RGnyuzWYBHwMciUxgy6A1s6yh8nc
	SbKDNK/ySoC8jdbnzpp0rFZOM0spYf3FAITO2wcmMbQrLHuZ6bWNtnxx7Xg6O8Kj
	um+qrP2j0/59L6xTKEg8g==
X-ME-Sender: <xms:hOorZmddCrUxmS96LA5e6BnwKteLL_ylqlR3IP4k94LVWNmwdIUE-w>
    <xme:hOorZgNrPhpGlgJCiBFa75rXnJXe3Kbe0tBHFQQr6VL5F4ooy2Zm5lqp3d0MBa-A3
    Ww-8NRQjx3v2g>
X-ME-Received: <xmr:hOorZnia3Hitgj3TCu2xarnTr-JXwI78GnzkroDH1lqDWpOiEIzBIQM2Xp-nUghxf9wiPm2uAssKMmBZwmv79qE8Wz57-AJJaXO4WmlZ1PoVU2ZHAfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    hfeihffghefgkeetiefgtdeivdfgvefhhfefvdduleetvdfggedtkeetfeefgeehnecuff
    homhgrihhnpehmshhigihtsghlpghlihhsthdrnhgvgihtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:hOorZj8BOWRDGOnU04vyFRiJlhGpDsiqLy39m2Bj-QIWEPrp4PEnuw>
    <xmx:hOorZivmu-ferTiRBGKlzQKi_LtKw9tMMGv5qSP-2MC9JVuWd0L-xQ>
    <xmx:hOorZqE-Vna2nTQFS4dC6HiZeTvEdtPZzIiApYNX4wwmR-PEnT3ltA>
    <xmx:hOorZhPiBqyfRJibya132LplZbLINz1DHTmFBKNu59xcC8WZ-T7y3Q>
    <xmx:hOorZkKA_UGaW0-9Hnm6Ofo_vnIsUc454hvMfK_EWYiPekrWDewEeMkU>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 3/7] x86/hvm: Allow access to registers on the same page as MSI-X table
Date: Fri, 26 Apr 2024 19:54:00 +0200
Message-ID: <a9b04e2224e97a27a127a003e8ccf5edfd4922c7.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
on the same page as MSI-X table. Device model (especially one in
stubdomain) cannot really handle those, as direct writes to that page is
refused (page is on the mmio_ro_ranges list). Instead, extend
msixtbl_mmio_ops to handle such accesses too.

Doing this, requires correlating read/write location with guest
of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
for PV would need to be done separately.

This will be also used to read Pending Bit Array, if it lives on the same
page, making QEMU not needing /dev/mem access at all (especially helpful
with lockdown enabled in dom0). If PBA lives on another page, QEMU will
map it to the guest directly.
If PBA lives on the same page, discard writes and log a message.
Technically, writes outside of PBA could be allowed, but at this moment
the precise location of PBA isn't saved, and also no known device abuses
the spec in this way (at least yet).

To access those registers, msixtbl_mmio_ops need the relevant page
mapped. MSI handling already has infrastructure for that, using fixmap,
so try to map first/last page of the MSI-X table (if necessary) and save
their fixmap indexes. Note that msix_get_fixmap() does reference
counting and reuses existing mapping, so just call it directly, even if
the page was mapped before. Also, it uses a specific range of fixmap
indexes which doesn't include 0, so use 0 as default ("not mapped")
value - which simplifies code a bit.

GCC 12.2.1 gets confused about 'desc' variable:

    arch/x86/hvm/vmsi.c: In function ‘msixtbl_range’:
    arch/x86/hvm/vmsi.c:553:8: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
      553 |     if ( desc )
          |        ^
    arch/x86/hvm/vmsi.c:537:28: note: ‘desc’ was declared here
      537 |     const struct msi_desc *desc;
          |                            ^~~~

It's conditional initialization is actually correct (in the case where
it isn't initialized, function returns early), but to avoid
build failure initialize it explicitly to NULL anyway.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v6:
- use MSIX_CHECK_WARN macro
- extend assert on fixmap_idx
- add break in default label, after ASSERT_UNREACHABLE(), and move
  setting default there
- style fixes
Changes in v5:
- style fixes
- include GCC version in the commit message
- warn only once (per domain, per device) about failed adjacent access
Changes in v4:
- drop same_page parameter of msixtbl_find_entry(), distinguish two
  cases in relevant callers
- rename adj_access_table_idx to adj_access_idx
- code style fixes
- drop alignment check in adjacent_{read,write}() - all callers already
  have it earlier
- delay mapping first/last MSI-X pages until preparing device for a
  passthrough
v3:
 - merge handling into msixtbl_mmio_ops
 - extend commit message
v2:
 - adjust commit message
 - pass struct domain to msixtbl_page_handler_get_hwaddr()
 - reduce local variables used only once
 - log a warning if write is forbidden if MSI-X and PBA lives on the same
   page
 - do not passthrough unaligned accesses
 - handle accesses both before and after MSI-X table
---
 xen/arch/x86/hvm/vmsi.c        | 200 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/msi.h |   5 +-
 xen/arch/x86/msi.c             |  41 +++++++-
 3 files changed, 236 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 999917983789..230e3a5dee3f 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -180,6 +180,10 @@ static bool msixtbl_initialised(const struct domain *d)
     return d->arch.hvm.msixtbl_list.next;
 }
 
+/*
+ * Lookup an msixtbl_entry on the same page as given addr. It's up to the
+ * caller to check if address is strictly part of the table - if relevant.
+ */
 static struct msixtbl_entry *msixtbl_find_entry(
     struct vcpu *v, unsigned long addr)
 {
@@ -187,8 +191,8 @@ static struct msixtbl_entry *msixtbl_find_entry(
     struct domain *d = v->domain;
 
     list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
-        if ( addr >= entry->gtable &&
-             addr < entry->gtable + entry->table_len )
+        if ( PFN_DOWN(addr) >= PFN_DOWN(entry->gtable) &&
+             PFN_DOWN(addr) <= PFN_DOWN(entry->gtable + entry->table_len - 1) )
             return entry;
 
     return NULL;
@@ -213,6 +217,138 @@ static struct msi_desc *msixtbl_addr_to_desc(
     return NULL;
 }
 
+/*
+ * Returns:
+ *  - ADJACENT_DONT_HANDLE if no handling should be done
+ *  - ADJACENT_DISCARD_WRITE if write should be discarded
+ *  - a fixmap idx to use for handling
+ */
+#define ADJACENT_DONT_HANDLE UINT_MAX
+#define ADJACENT_DISCARD_WRITE (UINT_MAX - 1)
+static unsigned int adjacent_handle(
+    const struct msixtbl_entry *entry, unsigned long addr, bool write)
+{
+    unsigned int adj_type;
+    struct arch_msix *msix;
+
+    if ( !entry || !entry->pdev )
+        return ADJACENT_DONT_HANDLE;
+
+    if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable) && addr < entry->gtable )
+        adj_type = ADJ_IDX_FIRST;
+    else if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable + entry->table_len - 1) &&
+              addr >= entry->gtable + entry->table_len )
+        adj_type = ADJ_IDX_LAST;
+    else
+        return ADJACENT_DONT_HANDLE;
+
+    msix = entry->pdev->msix;
+    ASSERT(msix);
+
+    if ( !msix->adj_access_idx[adj_type] )
+    {
+        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
+                             adjacent_not_initialized) )
+            gprintk(XENLOG_WARNING,
+                    "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",
+                    adj_type, &entry->pdev->sbdf, addr, entry->gtable);
+        return ADJACENT_DONT_HANDLE;
+    }
+
+    /* If PBA lives on the same page too, discard writes. */
+    if ( write &&
+         ((adj_type == ADJ_IDX_LAST &&
+           msix->table.last == msix->pba.first) ||
+          (adj_type == ADJ_IDX_FIRST &&
+           msix->table.first == msix->pba.last)) )
+    {
+        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
+                             adjacent_pba) )
+            gprintk(XENLOG_WARNING,
+                    "MSI-X table and PBA of %pp live on the same page, "
+                    "writing to other registers there is not implemented\n",
+                    &entry->pdev->sbdf);
+        return ADJACENT_DISCARD_WRITE;
+    }
+
+    return msix->adj_access_idx[adj_type];
+}
+
+static int adjacent_read(
+    unsigned int fixmap_idx,
+    paddr_t address, unsigned int len, uint64_t *pval)
+{
+    const void __iomem *hwaddr;
+
+    ASSERT(fixmap_idx <= FIX_MSIX_IO_RESERV_END);
+
+    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
+
+    switch ( len )
+    {
+    case 1:
+        *pval = readb(hwaddr);
+        break;
+
+    case 2:
+        *pval = readw(hwaddr);
+        break;
+
+    case 4:
+        *pval = readl(hwaddr);
+        break;
+
+    case 8:
+        *pval = readq(hwaddr);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        *pval = ~0UL;
+        break;
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static int adjacent_write(
+    unsigned int fixmap_idx,
+    paddr_t address, unsigned int len, uint64_t val)
+{
+    void __iomem *hwaddr;
+
+    if ( fixmap_idx == ADJACENT_DISCARD_WRITE )
+        return X86EMUL_OKAY;
+
+    ASSERT(fixmap_idx <= FIX_MSIX_IO_RESERV_END);
+
+    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
+
+    switch ( len )
+    {
+    case 1:
+        writeb(val, hwaddr);
+        break;
+
+    case 2:
+        writew(val, hwaddr);
+        break;
+
+    case 4:
+        writel(val, hwaddr);
+        break;
+
+    case 8:
+        writeq(val, hwaddr);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return X86EMUL_OKAY;
+}
+
 static int cf_check msixtbl_read(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t *pval)
@@ -220,9 +356,10 @@ static int cf_check msixtbl_read(
     unsigned long offset;
     struct msixtbl_entry *entry;
     unsigned int nr_entry, index;
+    unsigned int adjacent_fixmap;
     int r = X86EMUL_UNHANDLEABLE;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
+    if ( !IS_ALIGNED(address, len) )
         return r;
 
     rcu_read_lock(&msixtbl_rcu_lock);
@@ -230,6 +367,21 @@ static int cf_check msixtbl_read(
     entry = msixtbl_find_entry(current, address);
     if ( !entry )
         goto out;
+
+    adjacent_fixmap = adjacent_handle(entry, address, false);
+    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
+    {
+        r = adjacent_read(adjacent_fixmap, address, len, pval);
+        goto out;
+    }
+
+    if ( address < entry->gtable ||
+         address >= entry->gtable + entry->table_len )
+        goto out;
+
+    if ( len != 4 && len != 8 )
+        goto out;
+
     offset = address & (PCI_MSIX_ENTRY_SIZE - 1);
 
     if ( offset != PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
@@ -282,6 +434,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     int r = X86EMUL_UNHANDLEABLE;
     unsigned long flags;
     struct irq_desc *desc;
+    unsigned int adjacent_fixmap;
 
     if ( !IS_ALIGNED(address, len) )
         return X86EMUL_OKAY;
@@ -291,6 +444,21 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     entry = msixtbl_find_entry(v, address);
     if ( !entry )
         goto out;
+
+    adjacent_fixmap = adjacent_handle(entry, address, true);
+    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
+    {
+        r = adjacent_write(adjacent_fixmap, address, len, val);
+        goto out;
+    }
+
+    if ( address < entry->gtable ||
+         address >= entry->gtable + entry->table_len )
+        goto out;
+
+    if ( len != 4 && len != 8 )
+        goto out;
+
     nr_entry = array_index_nospec(((address - entry->gtable) /
                                    PCI_MSIX_ENTRY_SIZE),
                                   MAX_MSIX_TABLE_ENTRIES);
@@ -356,8 +524,8 @@ static int cf_check _msixtbl_write(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t val)
 {
-    /* Ignore invalid length or unaligned writes. */
-    if ( (len != 4 && len != 8) || !IS_ALIGNED(address, len) )
+    /* Ignore unaligned writes. */
+    if ( !IS_ALIGNED(address, len) )
         return X86EMUL_OKAY;
 
     /*
@@ -374,14 +542,22 @@ static bool cf_check msixtbl_range(
 {
     struct vcpu *curr = current;
     unsigned long addr = r->addr;
-    const struct msi_desc *desc;
+    const struct msixtbl_entry *entry;
+    const struct msi_desc *desc = NULL;
+    unsigned int adjacent_fixmap;
 
     ASSERT(r->type == IOREQ_TYPE_COPY);
 
     rcu_read_lock(&msixtbl_rcu_lock);
-    desc = msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr);
+    entry = msixtbl_find_entry(curr, addr);
+    adjacent_fixmap = adjacent_handle(entry, addr, false);
+    if ( adjacent_fixmap == ADJACENT_DONT_HANDLE )
+        desc = msixtbl_addr_to_desc(entry, addr);
     rcu_read_unlock(&msixtbl_rcu_lock);
 
+    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
+        return 1;
+
     if ( desc )
         return 1;
 
@@ -622,12 +798,16 @@ void msix_write_completion(struct vcpu *v)
          v->arch.hvm.hvm_io.msix_snoop_gpa )
     {
         unsigned int token = hvmemul_cache_disable(v);
-        const struct msi_desc *desc;
+        const struct msi_desc *desc = NULL;
+        const struct msixtbl_entry *entry;
         uint32_t data;
 
         rcu_read_lock(&msixtbl_rcu_lock);
-        desc = msixtbl_addr_to_desc(msixtbl_find_entry(v, snoop_addr),
-                                    snoop_addr);
+        entry = msixtbl_find_entry(v, snoop_addr);
+        if ( entry &&
+             snoop_addr >= entry->gtable &&
+             snoop_addr < entry->gtable + entry->table_len )
+            desc = msixtbl_addr_to_desc(entry, snoop_addr);
         rcu_read_unlock(&msixtbl_rcu_lock);
 
         if ( desc &&
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index bcfdfd35345d..923b730d48b8 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -224,6 +224,9 @@ struct arch_msix {
     } table, pba;
     int table_refcnt[MAX_MSIX_TABLE_PAGES];
     int table_idx[MAX_MSIX_TABLE_PAGES];
+#define ADJ_IDX_FIRST 0
+#define ADJ_IDX_LAST  1
+    unsigned int adj_access_idx[2];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
     domid_t warned_domid;
@@ -231,6 +234,8 @@ struct arch_msix {
         uint8_t all;
         struct {
             bool maskall                   : 1;
+            bool adjacent_not_initialized  : 1;
+            bool adjacent_pba              : 1;
         };
     } warned_kind;
 };
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 42c793426da3..c77b81896269 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -913,6 +913,36 @@ static int msix_capability_init(struct pci_dev *dev,
         list_add_tail(&entry->list, &dev->msi_list);
         *desc = entry;
     }
+    else
+    {
+        /*
+         * If the MSI-X table doesn't start at the page boundary, map the first page for
+         * passthrough accesses.
+         */
+        if ( PAGE_OFFSET(table_paddr) )
+        {
+            int idx = msix_get_fixmap(msix, table_paddr, table_paddr);
+
+            if ( idx > 0 )
+                msix->adj_access_idx[ADJ_IDX_FIRST] = idx;
+            else
+                gprintk(XENLOG_ERR, "Failed to map first MSI-X table page: %d\n", idx);
+        }
+        /*
+         * If the MSI-X table doesn't end on the page boundary, map the last page
+         * for passthrough accesses.
+         */
+        if ( PAGE_OFFSET(table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE) )
+        {
+            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
+            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
+
+            if ( idx > 0 )
+                msix->adj_access_idx[ADJ_IDX_LAST] = idx;
+            else
+                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);
+        }
+    }
 
     if ( !msix->used_entries )
     {
@@ -1079,6 +1109,17 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
         msix->table.first = 0;
         msix->table.last = 0;
 
+        if ( msix->adj_access_idx[ADJ_IDX_FIRST] )
+        {
+            msix_put_fixmap(msix, msix->adj_access_idx[ADJ_IDX_FIRST]);
+            msix->adj_access_idx[ADJ_IDX_FIRST] = 0;
+        }
+        if ( msix->adj_access_idx[ADJ_IDX_LAST] )
+        {
+            msix_put_fixmap(msix, msix->adj_access_idx[ADJ_IDX_LAST]);
+            msix->adj_access_idx[ADJ_IDX_LAST] = 0;
+        }
+
         if ( rangeset_remove_range(mmio_ro_ranges, msix->pba.first,
                                    msix->pba.last) )
             WARN();
-- 
git-series 0.9.1

