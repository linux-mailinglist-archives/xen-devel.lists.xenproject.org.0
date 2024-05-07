Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09538BE274
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718065.1120586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBm-0003dG-5s; Tue, 07 May 2024 12:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718065.1120586; Tue, 07 May 2024 12:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBm-0003ad-2a; Tue, 07 May 2024 12:44:58 +0000
Received: by outflank-mailman (input) for mailman id 718065;
 Tue, 07 May 2024 12:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4KBk-0003AI-Ho
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:44:56 +0000
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99e67496-0c6f-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 14:44:54 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id B7FAC1C001C8;
 Tue,  7 May 2024 08:44:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 07 May 2024 08:44:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:44:51 -0400 (EDT)
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
X-Inumbo-ID: 99e67496-0c6f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715085892; x=1715172292; bh=337mWtE1IZ
	WiZWyGhYmWNijg7Hos8zgGc/g42z5K3X8=; b=0vGjV7bFutsPrY8oS12ro60kcT
	rknupAk1K2MFRZKI7pWNww4xNELjAlNjseUaJ783dpXzbItUZfUQg0i+f2RfPsY2
	MxD4FHzgwDLI8gq43E5dwcQkULixLagXQfzHs0YYYeOn1uWHqpbNZjoE/GHOGVLP
	4IO9UKfl564uLinrOss5VciER2n5qiVnFWfd4dKEI3GABlR8cIpCm4gTlIFtrF4d
	kM/EPw8Q6UAmUkz6KhCdLpHxq8FNtq7m2S1T76lXExaYND7AC0oo7xPaLZISbsvp
	/ZH4fIYgpL3qh3RlI5mlZpjiWaz9ZGZBwjk8Fm8PFDKbJNrVHkZlAcSHuE/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715085892; x=
	1715172292; bh=337mWtE1IZWiZWyGhYmWNijg7Hos8zgGc/g42z5K3X8=; b=F
	T9eEdd2bJ3P3j9pPb3jWSDIYH6OD0DVM6qX1+my1RRcfmJYWr8cncCWBILp483Nk
	5FSgka4+GBh8Z3ktZTGM/fiUcW+RNWlV3NWbF8RPlOaJMQoYh6wV9AFDg3reE2Zc
	IG32umu/lLz9TFkt012DkHTP71G9IMN5d6lHqBRe7Cd/Jc7fDxBcAEjPY2TDI7SO
	42JVNOsJUEp6YLx5ySNVia1bt4whvRnLV22GL+PigNaAIOQ9txreRdhFB6T6lrqy
	29tVt2GPFKW0ipGHnhJfvbZxvRAuy/elswLG+rvcx/V+neqqNpgz2ugixuRI2qoE
	MZLDlGd/cllpaCa+yZA2Q==
X-ME-Sender: <xms:RCI6ZmYRbHaVfIspCXLCkOo1aFAaKSGqgHs0yXKb1dl01LgTX2dgLw>
    <xme:RCI6ZpYoo0mAaQrDgc6k2iUZoM4LN8ASYlJKL-stH7LtJUxbYnzsGby5uDyy7F9Ix
    pR9EXmUaBG1hA>
X-ME-Received: <xmr:RCI6Zg9kl2bvqv2y5Byw9N6LQjHEAXMy7P1gub8EfCiXAOftCO_AXAcGRFAilJ5i0goBQm-QU8XFdL6bNd3kpSHrGrmmRc6eqPiJL_wnSiJJVBo5IIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefh
    iefhgfehgfekteeigfdtiedvgfevhffhfedvudeltedvgfegtdekteeffeegheenucffoh
    hmrghinhepmhhsihigthgslhgplhhishhtrdhnvgigthenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:RCI6ZoqAEjchSYLpTeYR8szakiYZcH0mOFWB0O6sU_jRkSgFrb_SSA>
    <xmx:RCI6Zhp72HkswoEfh6k3y3RAhs2DB0fFAydf6Fg3ixnHCXbHr3mF9Q>
    <xmx:RCI6ZmRipOjQ_9M8hACUrn6zOZ2onnuPoah5OaaqXnhysTkuzcmQ8A>
    <xmx:RCI6ZhpOMZ28LTYpOIC4e1mjbnYgOf3ejZneyyJuK_zkJCtVAc7onw>
    <xmx:RCI6ZinGkKcR71aedwPyw0B80pjPTNbEqOrpW-fDnkkYQXsGcTq8MO8B>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 2/6] x86/hvm: Allow access to registers on the same page as MSI-X table
Date: Tue,  7 May 2024 14:44:02 +0200
Message-ID: <da180c8419882dc068512b69c6c7ad3ff3343fe0.1715085837.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
on the same page as MSI-X table. Device model (especially one in
stubdomain) cannot really handle those, as direct writes to that page is
refused (page is on the mmio_ro_ranges list). Instead, extend
msixtbl_mmio_ops to handle such accesses too.

Doing this, requires correlating read/write location with guest
MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
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

Based on assumption that all MSI-X page accesses are handled by Xen, do
not forward adjacent accesses to other hypothetical ioreq servers, even
if the access wasn't handled for some reason (failure to map pages etc).
Relevant places log a message about that already.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v7:
- simplify logic based on assumption that all access to MSI-X pages are
  handled by Xen (Roger)
- move calling adjacent_handle() into adjacent_{read,write}() (Roger)
- move range check into msixtbl_addr_to_desc() (Roger)
- fix off-by-one when initializing adj_access_idx[ADJ_IDX_LAST] (Roger)
- no longer distinguish between unhandled write due to PBA nearby and
  other reasons
- add missing break after ASSERT_UNREACHABLE (Jan)
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
 xen/arch/x86/hvm/vmsi.c        | 205 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/msi.h |   5 +-
 xen/arch/x86/msi.c             |  42 +++++++-
 3 files changed, 242 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 999917983789..f7b7b4998b5e 100644
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
@@ -203,6 +207,10 @@ static struct msi_desc *msixtbl_addr_to_desc(
     if ( !entry || !entry->pdev )
         return NULL;
 
+    if ( addr < entry->gtable ||
+         addr >= entry->gtable + entry->table_len )
+        return NULL;
+
     nr_entry = (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
 
     list_for_each_entry( desc, &entry->pdev->msi_list, list )
@@ -213,6 +221,152 @@ static struct msi_desc *msixtbl_addr_to_desc(
     return NULL;
 }
 
+/*
+ * Returns:
+ *  - ADJACENT_DONT_HANDLE if no handling should be done
+ *  - a fixmap idx to use for handling
+ */
+#define ADJACENT_DONT_HANDLE UINT_MAX
+static unsigned int adjacent_handle(
+    const struct msixtbl_entry *entry, unsigned long addr, bool write)
+{
+    unsigned int adj_type;
+    struct arch_msix *msix;
+
+    if ( !entry || !entry->pdev )
+    {
+        ASSERT_UNREACHABLE();
+        return ADJACENT_DONT_HANDLE;
+    }
+
+    if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable) && addr < entry->gtable )
+        adj_type = ADJ_IDX_FIRST;
+    else if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable + entry->table_len - 1) &&
+              addr >= entry->gtable + entry->table_len )
+        adj_type = ADJ_IDX_LAST;
+    else
+    {
+        /* All callers should already do equivalent range checking. */
+        ASSERT_UNREACHABLE();
+        return ADJACENT_DONT_HANDLE;
+    }
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
+        return ADJACENT_DONT_HANDLE;
+    }
+
+    return msix->adj_access_idx[adj_type];
+}
+
+static int adjacent_read(
+    const struct msixtbl_entry *entry,
+    paddr_t address, unsigned int len, uint64_t *pval)
+{
+    const void __iomem *hwaddr;
+    unsigned int fixmap_idx;
+
+    fixmap_idx = adjacent_handle(entry, address, false);
+
+    if ( fixmap_idx == ADJACENT_DONT_HANDLE )
+    {
+        *pval = ~0UL;
+        return X86EMUL_OKAY;
+    }
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
+    const struct msixtbl_entry *entry,
+    paddr_t address, unsigned int len, uint64_t val)
+{
+    void __iomem *hwaddr;
+    unsigned int fixmap_idx;
+
+    fixmap_idx = adjacent_handle(entry, address, true);
+
+    if ( fixmap_idx == ADJACENT_DONT_HANDLE )
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
+        break;
+    }
+
+    return X86EMUL_OKAY;
+}
+
 static int cf_check msixtbl_read(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t *pval)
@@ -222,7 +376,7 @@ static int cf_check msixtbl_read(
     unsigned int nr_entry, index;
     int r = X86EMUL_UNHANDLEABLE;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
+    if ( !IS_ALIGNED(address, len) )
         return r;
 
     rcu_read_lock(&msixtbl_rcu_lock);
@@ -230,6 +384,17 @@ static int cf_check msixtbl_read(
     entry = msixtbl_find_entry(current, address);
     if ( !entry )
         goto out;
+
+    if ( address < entry->gtable ||
+         address >= entry->gtable + entry->table_len )
+    {
+        r = adjacent_read(entry, address, len, pval);
+        goto out;
+    }
+
+    if ( len != 4 && len != 8 )
+        goto out;
+
     offset = address & (PCI_MSIX_ENTRY_SIZE - 1);
 
     if ( offset != PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
@@ -291,6 +456,17 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     entry = msixtbl_find_entry(v, address);
     if ( !entry )
         goto out;
+
+    if ( address < entry->gtable ||
+         address >= entry->gtable + entry->table_len )
+    {
+        r = adjacent_write(entry, address, len, val);
+        goto out;
+    }
+
+    if ( len != 4 && len != 8 )
+        goto out;
+
     nr_entry = array_index_nospec(((address - entry->gtable) /
                                    PCI_MSIX_ENTRY_SIZE),
                                   MAX_MSIX_TABLE_ENTRIES);
@@ -356,8 +532,8 @@ static int cf_check _msixtbl_write(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t val)
 {
-    /* Ignore invalid length or unaligned writes. */
-    if ( (len != 4 && len != 8) || !IS_ALIGNED(address, len) )
+    /* Ignore unaligned writes. */
+    if ( !IS_ALIGNED(address, len) )
         return X86EMUL_OKAY;
 
     /*
@@ -374,16 +550,25 @@ static bool cf_check msixtbl_range(
 {
     struct vcpu *curr = current;
     unsigned long addr = r->addr;
-    const struct msi_desc *desc;
+    const struct msixtbl_entry *entry;
+    bool ret = false;
 
     ASSERT(r->type == IOREQ_TYPE_COPY);
 
     rcu_read_lock(&msixtbl_rcu_lock);
-    desc = msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr);
+    entry = msixtbl_find_entry(curr, addr);
+    if ( entry )
+    {
+        if ( addr < entry->gtable || addr >= entry->gtable + entry->table_len )
+            /* Possibly handle adjacent access. */
+            ret = true;
+        else
+            ret = msixtbl_addr_to_desc(entry, addr) != NULL;
+    }
     rcu_read_unlock(&msixtbl_rcu_lock);
 
-    if ( desc )
-        return 1;
+    if ( ret )
+        return ret;
 
     if ( r->state == STATE_IOREQ_READY && r->dir == IOREQ_WRITE )
     {
@@ -429,7 +614,7 @@ static bool cf_check msixtbl_range(
         }
     }
 
-    return 0;
+    return false;
 }
 
 static const struct hvm_io_ops msixtbl_mmio_ops = {
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
index 42c793426da3..87190a88ed5d 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -913,6 +913,37 @@ static int msix_capability_init(struct pci_dev *dev,
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
+            uint64_t entry_paddr = table_paddr +
+                (msix->nr_entries - 1) * PCI_MSIX_ENTRY_SIZE;
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
@@ -1079,6 +1110,17 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
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

