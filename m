Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4F6D8E27
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 05:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518706.805525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGl7-0000yU-9r; Thu, 06 Apr 2023 03:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518706.805525; Thu, 06 Apr 2023 03:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGl7-0000ue-4v; Thu, 06 Apr 2023 03:58:01 +0000
Received: by outflank-mailman (input) for mailman id 518706;
 Thu, 06 Apr 2023 03:57:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHTq=75=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pkGl5-0000Z1-3G
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 03:57:59 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3428a853-d42f-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 05:57:52 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D6C75C0178;
 Wed,  5 Apr 2023 23:57:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 05 Apr 2023 23:57:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 23:57:50 -0400 (EDT)
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
X-Inumbo-ID: 3428a853-d42f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680753472; x=1680839872; bh=+x
	aJZckXvX1k1Bf8G7KYguuLRWvLEosFkkfVW7RbnBc=; b=kJXc197cjVxU8s7j8L
	ClSe15MEgoDBr304tK+Dvx8Vu/B3o+r+ND+29+fBrtcmiZd9rtUNuUHNx7wvyNzi
	928xmpQWPrY6hF5fJvKrWyokQFVbrhC0PqGQtwP4HCOg0WcnzX+yxtwhpMelDqxX
	3yFPWKS2f5chuIamgCgfpqdZTXh/VW5l2/1N3bRkSHXf51coS2s8LoD9YnPqTZS8
	GElwbf9qNNPIqiTfVIh+LEfUNkfBQ/3XqDoEm98MwINYOgiQYjBA1v7Eur9bX93f
	5LKv6euFZx+xVin8gsVhG2QjJr4320TEdmRxXd7a1JMlT7PpAE3jwM80Pe1MHy7Z
	XeMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680753472; x=1680839872; bh=+xaJZckXvX1k1Bf8G7KYguuLRWvLEosFkkf
	VW7RbnBc=; b=fBMwm7xs3ACD/y3xTi8IHfZCtBWI47c3FFWWbP+YTMJ3otiDb3W
	DIrsifgHeTM0BJ1ZshuUJ5H1GbmxliLMJLV2zIqOjopZjNWXOc/GVVE1ALLR4xmz
	a6lTn9xF1Pf3zem7szRxYS/7M2kvlfFpw98mhGRGGWCoyjH2DilDnq2Slj9nXWZE
	5P7/giIpYJcyO3m0btql70vXmnfwgBUIKQ5KmqUai/atmtd0X1AWfSrGPOGB0Fsw
	QQ//Dk4ivg79EDCiN4oaJer8j1W3SpNtx+1U6TztpKjLvwZWcJ7PKvcmcj+4Q0aO
	aTpFCtzCJeQS9KrK1EIodxL+wJeo7MtHTIg==
X-ME-Sender: <xms:P0MuZMJDlEKqPqFEehRkkoMW-fps5CbFSDWOL8FtNNiPyWReJbva-g>
    <xme:P0MuZMJBz4jFXlgfnBbPjyLZ4nTWqtCMHU_Q2L3Y87ZjKJy77aqG1-rrW4-Sas4ap
    R390Kb8I0Qfig>
X-ME-Received: <xmr:P0MuZMuji0elxuQrKGTH_BwwQndEAPoMSit-Y4wOTMftsIA44LETfXkV2ffBeTY5Q0Kszx6DPOTQTMamlmH3bhLlTzY6rW4hVPvGfSYanTWbWAzaSNrC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejvddgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:P0MuZJaLpDmGD1lUM2OPzcC50-LW0vlcNjtYfvLdY21Ci8v1wdos1w>
    <xmx:P0MuZDb3A1-lSpUgJX5GAeAxTSZM546b4WGR0NQ7BN4WZ8Q-SXC7HQ>
    <xmx:P0MuZFBieT-vTr3BH_nodMr6rhcHkLgi2xeDMnowE1B_tC4kqkuPbQ>
    <xmx:QEMuZPHB7V1KlqbqgQByiXvkILufK5eRSgB7Hd5MVMszCSkVsFVJAw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/4] x86/hvm: Allow writes to registers on the same page as MSI-X table
Date: Thu,  6 Apr 2023 05:57:25 +0200
Message-Id: <3a8f54cf631e0342b144935950c853d1884a7eac.1680752649.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
on the same page as MSI-X table. Device model (especially one in
stubdomain) cannot really handle those, as direct writes to that page is
refused (page is on the mmio_ro_ranges list). Instead, extend
msixtbl_mmio_ops to handle such accesses too.

Doing this, requires correlating write location with guest view
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

GCC gets confused about 'desc' variable:

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
 xen/arch/x86/hvm/vmsi.c        | 199 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/msi.h |   5 +-
 xen/arch/x86/msi.c             |  38 ++++++-
 3 files changed, 231 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 231253a2cbd4..6f49493d3f58 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -181,15 +181,21 @@ static bool msixtbl_initialised(const struct domain *d)
 }
 
 static struct msixtbl_entry *msixtbl_find_entry(
-    struct vcpu *v, unsigned long addr)
+    struct vcpu *v, unsigned long addr, bool same_page)
 {
     struct msixtbl_entry *entry;
     struct domain *d = v->domain;
 
     list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
+    {
+        if ( same_page &&
+             PFN_DOWN(addr) >= PFN_DOWN(entry->gtable) &&
+             PFN_DOWN(addr) <= PFN_DOWN(entry->gtable + entry->table_len) )
+            return entry;
         if ( addr >= entry->gtable &&
              addr < entry->gtable + entry->table_len )
             return entry;
+    }
 
     return NULL;
 }
@@ -213,6 +219,144 @@ static struct msi_desc *msixtbl_addr_to_desc(
     return NULL;
 }
 
+/*
+ * Returns:
+ *  - UINT_MAX if no handling should be done
+ *  - UINT_MAX-1 if write should be discarded
+ *  - a fixmap idx to use for handling
+ */
+#define ADJACENT_DONT_HANDLE UINT_MAX
+#define ADJACENT_DISCARD_WRITE (UINT_MAX - 1)
+static unsigned int adjacent_handle(
+    const struct msixtbl_entry *entry, unsigned long addr, bool write)
+{
+    unsigned int adj_type;
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
+    ASSERT(entry->pdev->msix);
+
+    if ( !entry->pdev->msix->adj_access_table_idx[adj_type] )
+    {
+        gprintk(XENLOG_WARNING,
+                "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",
+                adj_type, &entry->pdev->sbdf, addr, entry->gtable);
+
+        return ADJACENT_DONT_HANDLE;
+    }
+
+    /* If PBA lives on the same page too, discard writes. */
+    if ( write && (
+        (adj_type == ADJ_IDX_LAST &&
+         entry->pdev->msix->table.last == entry->pdev->msix->pba.first) ||
+        (adj_type == ADJ_IDX_FIRST &&
+         entry->pdev->msix->table.first == entry->pdev->msix->pba.last)) )
+    {
+        gprintk(XENLOG_WARNING,
+                 "MSI-X table and PBA of %pp live on the same page, "
+                 "writing to other registers there is not implemented\n",
+                 &entry->pdev->sbdf);
+        return ADJACENT_DISCARD_WRITE;
+    }
+
+    return entry->pdev->msix->adj_access_table_idx[adj_type];
+}
+
+static int adjacent_read(
+        unsigned int fixmap_idx,
+        uint64_t address, uint32_t len, uint64_t *pval)
+{
+    const void __iomem *hwaddr;
+
+    *pval = ~0UL;
+
+    if ( !IS_ALIGNED(address, len) )
+    {
+        gdprintk(XENLOG_WARNING,
+                "Dropping unaligned read from MSI-X table page at %" PRIx64 "\n",
+                address);
+        return X86EMUL_OKAY;
+    }
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
+        unsigned int fixmap_idx,
+        uint64_t address, uint32_t len, uint64_t val)
+{
+    void __iomem *hwaddr;
+
+    if ( !IS_ALIGNED(address, len) )
+    {
+        gdprintk(XENLOG_WARNING,
+                "Dropping unaligned write to MSI-X table page at %" PRIx64 "\n",
+                address);
+        return X86EMUL_OKAY;
+    }
+
+    if ( fixmap_idx == ADJACENT_DISCARD_WRITE )
+        return X86EMUL_OKAY;
+
+    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
+
+    switch ( len ) {
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
@@ -220,16 +364,27 @@ static int cf_check msixtbl_read(
     unsigned long offset;
     struct msixtbl_entry *entry;
     unsigned int nr_entry, index;
+    unsigned int adjacent_fixmap;
     int r = X86EMUL_UNHANDLEABLE;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
+    if ( !IS_ALIGNED(address, len) )
         return r;
 
     rcu_read_lock(&msixtbl_rcu_lock);
-
-    entry = msixtbl_find_entry(current, address);
+    entry = msixtbl_find_entry(current, address, true);
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
+    if ( len != 4 && len != 8 )
+        goto out;
+
     offset = address & (PCI_MSIX_ENTRY_SIZE - 1);
 
     if ( offset != PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
@@ -291,16 +446,29 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     int r = X86EMUL_UNHANDLEABLE;
     unsigned long flags;
     struct irq_desc *desc;
+    unsigned int adjacent_fixmap;
 
-    if ( (len != 4 && len != 8 && len != WRITE_LEN4_COMPLETION) ||
-         (len && (address & (len - 1))) )
-        return X86EMUL_UNHANDLEABLE;
+    if ( len && !IS_ALIGNED(address, len) )
+        return r;
 
     rcu_read_lock(&msixtbl_rcu_lock);
 
-    entry = msixtbl_find_entry(v, address);
+    entry = msixtbl_find_entry(v, address, true);
     if ( !entry )
         goto out;
+
+    if ( len != WRITE_LEN4_COMPLETION )
+    {
+        adjacent_fixmap = adjacent_handle(entry, address, true);
+        if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
+        {
+            r = adjacent_write(adjacent_fixmap, address, len, val);
+            goto out;
+        }
+        if ( len != 4 && len != 8 )
+            goto out;
+    }
+
     nr_entry = array_index_nospec(((address - entry->gtable) /
                                    PCI_MSIX_ENTRY_SIZE),
                                   MAX_MSIX_TABLE_ENTRIES);
@@ -375,14 +543,23 @@ static bool cf_check msixtbl_range(
 {
     struct vcpu *curr = current;
     unsigned long addr = r->addr;
-    const struct msi_desc *desc;
+    struct msixtbl_entry *entry;
+    const struct msi_desc *desc = NULL;
+    unsigned int adjacent_fixmap;
+
 
     ASSERT(r->type == IOREQ_TYPE_COPY);
 
     rcu_read_lock(&msixtbl_rcu_lock);
-    desc = msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr);
+    entry = msixtbl_find_entry(curr, addr, true);
+    adjacent_fixmap = adjacent_handle(entry, addr, false);
+    if ( adjacent_fixmap == ADJACENT_DONT_HANDLE )
+        desc = msixtbl_addr_to_desc(entry, addr);
     rcu_read_unlock(&msixtbl_rcu_lock);
 
+    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
+        return 1;
+
     if ( desc )
         return 1;
 
@@ -627,7 +804,7 @@ void msix_write_completion(struct vcpu *v)
         uint32_t data;
 
         rcu_read_lock(&msixtbl_rcu_lock);
-        desc = msixtbl_addr_to_desc(msixtbl_find_entry(v, snoop_addr),
+        desc = msixtbl_addr_to_desc(msixtbl_find_entry(v, snoop_addr, false),
                                     snoop_addr);
         rcu_read_unlock(&msixtbl_rcu_lock);
 
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index a53ade95c9ad..d13cf1c1f873 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -207,6 +207,10 @@ struct msg_address {
                                        PCI_MSIX_ENTRY_SIZE + \
                                        (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
 
+/* indexes in adj_access_table_idx[] below */
+#define ADJ_IDX_FIRST 0
+#define ADJ_IDX_LAST  1
+
 struct arch_msix {
     unsigned int nr_entries, used_entries;
     struct {
@@ -214,6 +218,7 @@ struct arch_msix {
     } table, pba;
     int table_refcnt[MAX_MSIX_TABLE_PAGES];
     int table_idx[MAX_MSIX_TABLE_PAGES];
+    int adj_access_table_idx[2];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
     domid_t warned;
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1def..c216acbf0e5d 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -961,6 +961,34 @@ static int msix_capability_init(struct pci_dev *dev,
                 domain_crash(d);
             /* XXX How to deal with existing mappings? */
         }
+
+        /*
+         * If the MSI-X table doesn't start at the page boundary, map the first page for
+         * passthrough accesses.
+         */
+        if ( PAGE_OFFSET(table_paddr) )
+        {
+            int idx = msix_get_fixmap(msix, table_paddr, table_paddr);
+
+            if ( idx > 0 )
+                msix->adj_access_table_idx[ADJ_IDX_FIRST] = idx;
+            else
+                gprintk(XENLOG_ERR, "Failed to map first MSI-X table page: %d\n", idx);
+        }
+        /*
+         * If the MSI-X table doesn't span full page(s), map the last page for
+         * passthrough accesses.
+         */
+        if ( PAGE_OFFSET(table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE) )
+        {
+            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
+            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
+
+            if ( idx > 0 )
+                msix->adj_access_table_idx[ADJ_IDX_LAST] = idx;
+            else
+                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);
+        }
     }
     WARN_ON(msix->table.first != (table_paddr >> PAGE_SHIFT));
     ++msix->used_entries;
@@ -1090,6 +1118,16 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
             WARN();
         msix->table.first = 0;
         msix->table.last = 0;
+        if ( msix->adj_access_table_idx[ADJ_IDX_FIRST] )
+        {
+            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_FIRST]);
+            msix->adj_access_table_idx[ADJ_IDX_FIRST] = 0;
+        }
+        if ( msix->adj_access_table_idx[ADJ_IDX_LAST] )
+        {
+            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_LAST]);
+            msix->adj_access_table_idx[ADJ_IDX_LAST] = 0;
+        }
 
         if ( rangeset_remove_range(mmio_ro_ranges, msix->pba.first,
                                    msix->pba.last) )
-- 
git-series 0.9.1

