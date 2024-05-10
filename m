Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED58C1D3F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719464.1122228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM0-0007Fq-2b; Fri, 10 May 2024 03:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719464.1122228; Fri, 10 May 2024 03:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HLz-0007DA-Uw; Fri, 10 May 2024 03:55:27 +0000
Received: by outflank-mailman (input) for mailman id 719464;
 Fri, 10 May 2024 03:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XugN=MN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5HLy-0006yN-8r
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 03:55:26 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20539327-0e81-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 05:55:23 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 0D6CA1C000F6;
 Thu,  9 May 2024 23:55:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 09 May 2024 23:55:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 23:55:20 -0400 (EDT)
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
X-Inumbo-ID: 20539327-0e81-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715313321; x=1715399721; bh=ACyP2w5iOq
	1oYIJ7NbzixfPI/5xHvfYdC3cDB7RY4rE=; b=ZhtWLV2P0ka6pWzFXQar6Ja25N
	I8aE2yjzrwm2rnF9QfPW8DQyCRfp0eQxRFGfZVXJaExNMPzSeOqof4UsHXf71+Ua
	phU42xLaQu++LzXLvbkx/ePMjyNnobqy3USIXpWUZ2gVd4u4GhTOxfPKPWyNqMIl
	GEn2MZjB9q0q7yqZkE0pCtr1Pg6H8JzOypwfIxc4gHt3vsPyDYu+HItcNYnCwhVl
	8TL2Bn2F+Lpvp54wLc7+jwouqWbDn9Wmq+xXR/bygUDP3qkt+AP4IiCO+tZ6nYyd
	qCQ2GB0541+xtEV3e6YoS+fA2BcBb2XOT7wq1MLnipKefEZ0zppW6UeCROdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715313321; x=
	1715399721; bh=ACyP2w5iOq1oYIJ7NbzixfPI/5xHvfYdC3cDB7RY4rE=; b=k
	fXBhdGpv2EahviQsFjLNyISaKyOrVVNdnMsqjOm4nX6/ZdqFsR8S0fSnwOLNKOZM
	t8CejMYEh8zyF+Pr8prWhddDPu0PHxRfh59aBsGwK8um99xeHjnoab8s1rwBn2RN
	akcF8xJ3bq1f36zhLO/XMuaoZBy5kLLImEDE2/xd5gQ+gozDmPcboVJwxksgquxS
	ZPjLqj0qKdwJDe2sB/LiOPf38v6K7Y8ObBcc3s34qnUS19NtleUEoF9jzkcR4a+o
	Tl6GZ1lh+8WQTlEXoWzwjynpzu+5rOAVTd/MnZUCns9vzmXO0c3p99sCvdm7e4QK
	/cKJoxxdLTZ9/JjbZnvYQ==
X-ME-Sender: <xms:qZo9ZoZ-hSBpmCsyPWLh_0MmEBYiu03pWuKK2XglFPLHhP-sFdHxIQ>
    <xme:qZo9ZjZfAeicguXXRnOQVRYxHr7wzcNhCL1-KE1P_HN_92IHpK-6GI0BmgDOs9fQv
    qrrZVTmC72isA>
X-ME-Received: <xmr:qZo9Zi9mSJWobilgRThEQa__HosIzrAcklUFddhUYFFiU86L5UL2hz-0XCu9--jd0i0D57ia7-0dDUlEkdxAMEJYCroxtyWQfQbUl2_EXFBakeQG_eM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefh
    iefhgfehgfekteeigfdtiedvgfevhffhfedvudeltedvgfegtdekteeffeegheenucffoh
    hmrghinhepmhhsihigthgslhgplhhishhtrdhnvgigthenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:qZo9Zioo2dV-TOp_6gkP2xBuZ5q8z_FkuuhC8M-Bbgpvks9qZRoxUw>
    <xmx:qZo9Zjqah9ZSmpRjFVOoNxsQWcdySEjqNWldPcnyaE41aFj2zdM1Mw>
    <xmx:qZo9ZgRjqyYBtDTpPszO5UxNXnso1OG5OGDGp8ITn55Ck2Cc6Cag2g>
    <xmx:qZo9ZjpSPKS1B4SioQPdhj8eI_Bzf0EEELmkCT_lglb_LPlEX3VsRg>
    <xmx:qZo9ZkkuLOBA52Ut98IRkjXLdTwuwi5N6uTGcP8NzYCO-ou3eVyySfxK>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 2/6] x86/hvm: Allow access to registers on the same page as MSI-X table
Date: Fri, 10 May 2024 05:53:22 +0200
Message-ID: <fbe01c945d75409406ac0b02bc17d44f57a39ccf.1715313192.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
References: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
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
Changes in v8:
- rename adjacent_handle to get_adjacent_idx
- put SBDF at the start of error messages
- use 0 for ADJACENT_DONT_HANDLE (it's FIX_RESERVED)
- merge conditions in msixtbl_range into one "if"
- add assert for address alignment
- change back to setting pval to ~0UL at the start of adjacent_read
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
 xen/arch/x86/hvm/vmsi.c        | 208 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/include/asm/msi.h |   5 +-
 xen/arch/x86/msi.c             |  42 +++++++-
 3 files changed, 245 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 999917983789..d506d6adaaf6 100644
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
@@ -213,6 +221,157 @@ static struct msi_desc *msixtbl_addr_to_desc(
     return NULL;
 }
 
+/*
+ * Returns:
+ *  - 0 (FIX_RESERVED) if no handling should be done
+ *  - a fixmap idx to use for handling
+ */
+static unsigned int get_adjacent_idx(
+    const struct msixtbl_entry *entry, unsigned long addr, bool write)
+{
+    unsigned int adj_type;
+    struct arch_msix *msix;
+
+    if ( !entry || !entry->pdev )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
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
+        return 0;
+    }
+
+    msix = entry->pdev->msix;
+    if ( !msix )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    if ( !msix->adj_access_idx[adj_type] )
+    {
+        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
+                             adjacent_not_initialized) )
+            gprintk(XENLOG_WARNING,
+                    "%pp: Page for adjacent(%d) MSI-X table access not initialized (addr %#lx, gtable %#lx))\n",
+                    &entry->pdev->sbdf, adj_type, addr, entry->gtable);
+        return 0;
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
+                    "%pp: MSI-X table and PBA share a page, "
+                    "discard write to adjacent memory (%#lx)\n",
+                    &entry->pdev->sbdf, addr);
+        return 0;
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
+    ASSERT(IS_ALIGNED(address, len));
+
+    *pval = ~0UL;
+
+    fixmap_idx = get_adjacent_idx(entry, address, false);
+
+    if ( !fixmap_idx )
+        return X86EMUL_OKAY;
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
+    ASSERT(IS_ALIGNED(address, len));
+
+    fixmap_idx = get_adjacent_idx(entry, address, true);
+
+    if ( !fixmap_idx )
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
@@ -222,7 +381,7 @@ static int cf_check msixtbl_read(
     unsigned int nr_entry, index;
     int r = X86EMUL_UNHANDLEABLE;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
+    if ( !IS_ALIGNED(address, len) )
         return r;
 
     rcu_read_lock(&msixtbl_rcu_lock);
@@ -230,6 +389,17 @@ static int cf_check msixtbl_read(
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
@@ -291,6 +461,17 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
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
@@ -356,8 +537,8 @@ static int cf_check _msixtbl_write(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t val)
 {
-    /* Ignore invalid length or unaligned writes. */
-    if ( (len != 4 && len != 8) || !IS_ALIGNED(address, len) )
+    /* Ignore unaligned writes. */
+    if ( !IS_ALIGNED(address, len) )
         return X86EMUL_OKAY;
 
     /*
@@ -374,16 +555,23 @@ static bool cf_check msixtbl_range(
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
+    if ( entry &&
+          /* Adjacent access. */
+         (addr < entry->gtable || addr >= entry->gtable + entry->table_len ||
+          /* Otherwise check if there is a matching msi_desc. */
+          msixtbl_addr_to_desc(entry, addr)) )
+        ret = true;
     rcu_read_unlock(&msixtbl_rcu_lock);
 
-    if ( desc )
-        return 1;
+    if ( ret )
+        return ret;
 
     if ( r->state == STATE_IOREQ_READY && r->dir == IOREQ_WRITE )
     {
@@ -429,7 +617,7 @@ static bool cf_check msixtbl_range(
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
index 42c793426da3..4f9249f11b2f 100644
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
+                gprintk(XENLOG_ERR, "%pp: Failed to map first MSI-X table page: %d\n", &dev->sbdf, idx);
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
+                gprintk(XENLOG_ERR, "%pp: Failed to map last MSI-X table page: %d\n", &dev->sbdf, idx);
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

