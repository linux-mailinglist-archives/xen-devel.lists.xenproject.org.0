Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3587AA46
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692559.1079842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLo-0006Ny-2C; Wed, 13 Mar 2024 15:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692559.1079842; Wed, 13 Mar 2024 15:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLn-0006MX-U0; Wed, 13 Mar 2024 15:17:03 +0000
Received: by outflank-mailman (input) for mailman id 692559;
 Wed, 13 Mar 2024 15:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLm-00064u-3S
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:17:02 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd7d46c-e14c-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:17:00 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id ADF1013800C4;
 Wed, 13 Mar 2024 11:16:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 13 Mar 2024 11:16:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:16:58 -0400 (EDT)
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
X-Inumbo-ID: bcd7d46c-e14c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710343019; x=1710429419; bh=4SwFKvimJV
	RlV6iERPovdY29XXOSNZstQLCDxtr3mlE=; b=G74MjXFlPZBP9p7g4lW9LhU1+H
	xjzTZ8N8s4SSAF9i8X+4EpGmD/skZDBgDyeIuWJzLpqG8k0qhUBjVWtOTW+BcHzY
	XOQxs4GJPaloWLu9QaaVyXgp78y3UpqVx0wfpy6nqoZep3f53vz/AwVqOrrSvXl7
	bMvPMTNwQHJQ39/KHLlaEbhWXpj0uHfDu0M/mzPxZmuYgsp1gxxhHHFcqCGBU3aZ
	Lf//v7f1YHNwuXGDWaDBx9kOvXxWIlkHevAOwCOYtEnpQcmVkBuhU0v3eRY8NPd5
	A2+53E6GvLARsOP26Cc9Oef8vVe2/4+nF4uif92RnxvwugKrardUxkgD5LHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710343019; x=
	1710429419; bh=4SwFKvimJVRlV6iERPovdY29XXOSNZstQLCDxtr3mlE=; b=j
	I2YjelrTFhvLfurwxrmdoOHCP+0/g3rkhjFOlcCniQdXZI6uaLM9NKWo3WAu9rAj
	Vgm7Eu1LTaXAVv/wyH2WjIbKxJ2lVA2vefD418QIq3SsJWuKRcXY5MTuGTR19YFf
	AsqKNHUnlvbGR43Aaq8d8DYwaFsSPB7NrBvBXF7WpquZTDD5jGIkGzKK/83lFTWP
	C9Io87D7Xq5rnx16zzYkYeyI3vEfzc3pwRepwa1y3ivFBoB2AvixibvQ1HbOSxzq
	JiMqSpgBXCjAORB6V8N/nK8Q2z4L26mEcSflNfN7W3ijQwrtRFgzzgiWoUIZRv3q
	H7Jy4yEcQv7Qb/ub/RFpw==
X-ME-Sender: <xms:a8PxZW9XlJc1URpZGZJRV4zMtR8qesz15x7tnqIGhUhWWlY7MOfd8w>
    <xme:a8PxZWsQAfVYkoFpU59wNg5fRNICGWvQBOxQeMezbX_QxN9KGwdArOqkP2UKRGki6
    9UsQf2qDjtT4g>
X-ME-Received: <xmr:a8PxZcB3OCq5Wguq8sizzMdWan4uNBRtwy4WIO0WGpf9Q3RXDHoiMG_HNHk_rHCRWFuiaW1gWGF9Dav32ZKEpNzll5h0RepolxONHEOhtQDL3yx0Qig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfei
    hffghefgkeetiefgtdeivdfgvefhhfefvdduleetvdfggedtkeetfeefgeehnecuffhomh
    grihhnpehmshhigihtsghlpghlihhsthdrnhgvgihtnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:a8PxZefohN-QUqOHPbYx0weBpbmRh6F5jBCKq8jQ8eGHtafETBxO3g>
    <xmx:a8PxZbN4DtgLYBdWJ8hTIy6XTKbCxXevvK_WopKOfLgPIHmLBN_Mfw>
    <xmx:a8PxZYnShP5JRvOdhEnSOiMNVdqMA2IEaYOcQtm8rQKL3kuprBNDAA>
    <xmx:a8PxZdtLngoxQuYz3h_SiyZ8hGiO-mfPrpiubEnZUmnzMXBm6kaNrQ>
    <xmx:a8PxZXB2Eo8sEgiA0RGcC28xTG3dOLGsJBbuuZ7TQ9kT3FzpKvKvpw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/7] x86/hvm: Allow access to registers on the same page as MSI-X table
Date: Wed, 13 Mar 2024 16:16:08 +0100
Message-ID: <a040f703a884ff4516314f88b22ee0f9f17329a9.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
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
 xen/arch/x86/hvm/vmsi.c        | 209 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/msi.h |   7 +-
 xen/arch/x86/msi.c             |  41 +++++++-
 3 files changed, 247 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 999917983789..5ac3d9d9b4cf 100644
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
@@ -213,6 +217,148 @@ static struct msi_desc *msixtbl_addr_to_desc(
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
+        if ( msix->warned_domid != entry->pdev->domain->domain_id )
+        {
+            msix->warned_domid = entry->pdev->domain->domain_id;
+            msix->warned_kind.all = 0;
+        }
+        if ( !msix->warned_kind.u.adjacent_not_initialized )
+        {
+            msix->warned_kind.u.adjacent_not_initialized = true;
+            gprintk(XENLOG_WARNING,
+                    "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",
+                    adj_type, &entry->pdev->sbdf, addr, entry->gtable);
+        }
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
+        if ( msix->warned_domid != entry->pdev->domain->domain_id )
+        {
+            msix->warned_domid = entry->pdev->domain->domain_id;
+            msix->warned_kind.all = 0;
+        }
+        if ( !msix->warned_kind.u.adjacent_pba )
+        {
+            msix->warned_kind.u.adjacent_pba = true;
+            gprintk(XENLOG_WARNING,
+                    "MSI-X table and PBA of %pp live on the same page, "
+                    "writing to other registers there is not implemented\n",
+                    &entry->pdev->sbdf);
+        }
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
+    *pval = ~0UL;
+
+    ASSERT(fixmap_idx != ADJACENT_DISCARD_WRITE);
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
+    }
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
+    return X86EMUL_OKAY;
+}
+
 static int cf_check msixtbl_read(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t *pval)
@@ -220,9 +366,10 @@ static int cf_check msixtbl_read(
     unsigned long offset;
     struct msixtbl_entry *entry;
     unsigned int nr_entry, index;
+    unsigned int adjacent_fixmap;
     int r = X86EMUL_UNHANDLEABLE;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
+    if ( !IS_ALIGNED(address, len) )
         return r;
 
     rcu_read_lock(&msixtbl_rcu_lock);
@@ -230,6 +377,21 @@ static int cf_check msixtbl_read(
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
@@ -282,6 +444,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     int r = X86EMUL_UNHANDLEABLE;
     unsigned long flags;
     struct irq_desc *desc;
+    unsigned int adjacent_fixmap;
 
     if ( !IS_ALIGNED(address, len) )
         return X86EMUL_OKAY;
@@ -291,6 +454,21 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
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
@@ -356,8 +534,8 @@ static int cf_check _msixtbl_write(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t val)
 {
-    /* Ignore invalid length or unaligned writes. */
-    if ( (len != 4 && len != 8) || !IS_ALIGNED(address, len) )
+    /* Ignore unaligned writes. */
+    if ( !IS_ALIGNED(address, len) )
         return X86EMUL_OKAY;
 
     /*
@@ -374,14 +552,22 @@ static bool cf_check msixtbl_range(
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
 
@@ -622,12 +808,15 @@ void msix_write_completion(struct vcpu *v)
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
+        if ( entry && snoop_addr >= entry->gtable &&
+                      snoop_addr < entry->gtable + entry->table_len )
+            desc = msixtbl_addr_to_desc(entry, snoop_addr);
         rcu_read_unlock(&msixtbl_rcu_lock);
 
         if ( desc &&
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 19b1e6631fdf..400944682b17 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -208,6 +208,10 @@ struct msg_address {
                                        PCI_MSIX_ENTRY_SIZE + \
                                        (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
 
+/* Indexes in adj_access_idx[] below */
+#define ADJ_IDX_FIRST 0
+#define ADJ_IDX_LAST  1
+
 struct arch_msix {
     unsigned int nr_entries, used_entries;
     struct {
@@ -215,6 +219,7 @@ struct arch_msix {
     } table, pba;
     int table_refcnt[MAX_MSIX_TABLE_PAGES];
     int table_idx[MAX_MSIX_TABLE_PAGES];
+    unsigned int adj_access_idx[2];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
     domid_t warned_domid;
@@ -222,6 +227,8 @@ struct arch_msix {
         uint8_t all;
         struct {
             bool maskall                   : 1;
+            bool adjacent_not_initialized  : 1;
+            bool adjacent_pba              : 1;
         } u;
     } warned_kind;
 };
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 6433df30bd60..b4aa0e53be2c 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -921,6 +921,36 @@ static int msix_capability_init(struct pci_dev *dev,
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
@@ -1087,6 +1117,17 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
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

