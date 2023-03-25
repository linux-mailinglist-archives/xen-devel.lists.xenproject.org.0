Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0286C8A51
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 03:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514519.796868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftyg-00018x-9X; Sat, 25 Mar 2023 02:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514519.796868; Sat, 25 Mar 2023 02:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftyg-00016l-5W; Sat, 25 Mar 2023 02:49:58 +0000
Received: by outflank-mailman (input) for mailman id 514519;
 Sat, 25 Mar 2023 02:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pftye-0000qg-8u
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 02:49:56 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b537b2ea-cab7-11ed-85db-49a42c6b2330;
 Sat, 25 Mar 2023 03:49:53 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BAAF0320096E;
 Fri, 24 Mar 2023 22:49:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 24 Mar 2023 22:49:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 22:49:45 -0400 (EDT)
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
X-Inumbo-ID: b537b2ea-cab7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1679712587; x=1679798987; bh=gK
	bhcIkCqqk4qN22oaX10T/l3QfbsASFQ3a6cMI70Rs=; b=HMQw3itvzG+1k5GD2L
	PIr6JYjZoN20KhmveD4PrAJ3UpjUqndwiSaWuCCReBk2KuYyEd62vm45vFdr5DLO
	6e2YaXWT6urzr7kkem67qjmIfvwY5bp63ZvDpWiiTKH6IZQ9igIiT9+OdJssO4Gq
	X3A6jFQ75DaSWglv5Cfdy0h0I05XHw5QBygRWUscuXbYelu0eOsJ2TmD9Pzt9hm/
	ZtdkE+hp/eBKhTwetutlInXi2iTbSFuF66ferryUfNd9G1pow5sCZZC6OkuyC4QH
	ikWIfcRgrR7vJVBzasMuKglgSrsppyB0lBafPKpns0Yu7VEGbHwmAxRXhQ0xEEU1
	5uJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679712587; x=1679798987; bh=gKbhcIkCqqk4qN22oaX10T/l3QfbsASFQ3a
	6cMI70Rs=; b=W0XPRW1TGIPJH/zmjSctNQ7Yb2jIBZMQRB27UK71Ilq6EZWRciC
	m4nR6uOYlxNlsziMaRntJaH1gDP+p2KWjTCXwg4yh9BEvtssinfEtMMkY39+VaSc
	QKQzYbzsI0hZ23VJ0Ii8gFpyxazT7SJR7X4rCdl0rTt5m4uenCbsAftVRhKHMpqd
	RgrNv5Bis+sTpXhIWttO/q9Nv1gVyG56nU905vq6VZsccDZ9aeyOxI1E+BuGxUbx
	bJBDq5i2L1fHJW/DZ3hZLtwyXFe4rXewOdlmmQhDCN1iaCW+qH1/13hsy4iyw38d
	9jBCfVZBMm1oToNe/8NiW6VrmdI0P1Gm5IQ==
X-ME-Sender: <xms:SmEeZPbpLH7VuTjzZIxpbLlNGGSU_RJPBNd-ERgJYUQHhUzxtKs5GQ>
    <xme:SmEeZOa9EF5Rfv6fkftYFSP0CGkZ4OqSdrTggVfKyJ4oEbfMooxm3dWe0PjZ-M1PB
    lzJY_14bf0qkA>
X-ME-Received: <xmr:SmEeZB_XJZOVPPu6anY8qMsvMyG021yBu40u99DAg4aWn6a_JUMsXODZcYDAPClp9zwMPBhsOJjuf0yKVtcLbcsV0XDC6XrK2voTuNS993pSnnskCzBL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegjedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:SmEeZFre2R2qjGqsrHbjzbXBPvuSmwgOb8Hdz25uJxGVEE-ll_szFA>
    <xmx:SmEeZKpMxLZeCLq-oZ-rRO-cd8r6XL0qjgG_VaceNpwISVvnJK-m_g>
    <xmx:SmEeZLT8E8gQW45vGiPkoceQUMDkzuWfjZLOtb-I7O_Noj5KStCLWw>
    <xmx:S2EeZDnM0ZctgK-r4vJKkV4PN9D-cL_5I2rCAre73ewKKJz1VVU-2A>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same page as MSI-X table
Date: Sat, 25 Mar 2023 03:49:23 +0100
Message-Id: <20230325024924.882883-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
on the same page as MSI-X table. Device model (especially one in
stubdomain) cannot really handle those, as direct writes to that page is
refused (page is on the mmio_ro_ranges list). Instead, add internal ioreq
server that handle those writes.

Doing this, requires correlating write location with guest view
of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
for PV would need to be done separately.

This can be also used to read Pending Bit Array, if it lives on the same
page, making QEMU not needing /dev/mem access at all (especially helpful
with lockdown enabled in dom0). If PBA lives on another page, QEMU will
map it to the guest directly.
If PBA lives on the same page, forbid writes and log a message.
Technically, writes outside of PBA could be allowed, but at this moment
the precise location of PBA isn't saved.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
 - adjust commit message
 - pass struct domain to msixtbl_page_handler_get_hwaddr()
 - reduce local variables used only once
 - log a warning if write is forbidden if MSI-X and PBA lives on the same
   page
 - do not passthrough unaligned accesses
 - handle accesses both before and after MSI-X table
---
 xen/arch/x86/hvm/vmsi.c        | 154 +++++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msi.h |   5 ++
 xen/arch/x86/msi.c             |  38 ++++++++
 3 files changed, 197 insertions(+)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 9c82bf9b4ec2..9293009a4075 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -438,6 +438,152 @@ static const struct hvm_io_ops msixtbl_mmio_ops = {
     .write = _msixtbl_write,
 };
 
+static void __iomem *msixtbl_page_handler_get_hwaddr(
+    const struct domain *d,
+    uint64_t address,
+    bool write)
+{
+    const struct pci_dev *pdev = NULL;
+    const struct msixtbl_entry *entry;
+    int adj_type;
+
+    rcu_read_lock(&msixtbl_rcu_lock);
+    /*
+     * Check if it's on the same page as the end of the MSI-X table, but
+     * outside of the table itself.
+     */
+    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
+    {
+        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable) &&
+             address < entry->gtable )
+        {
+            adj_type = ADJ_IDX_FIRST;
+            pdev = entry->pdev;
+            break;
+        }
+        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable + entry->table_len) &&
+             address >= entry->gtable + entry->table_len )
+        {
+            adj_type = ADJ_IDX_LAST;
+            pdev = entry->pdev;
+            break;
+        }
+    }
+    rcu_read_unlock(&msixtbl_rcu_lock);
+
+    if ( !pdev )
+        return NULL;
+
+    ASSERT(pdev->msix);
+
+    if ( !pdev->msix->adj_access_table_idx[adj_type] )
+    {
+        gdprintk(XENLOG_WARNING,
+                 "Page for adjacent MSI-X table access not initialized for %pp\n",
+                 pdev);
+
+        return NULL;
+    }
+
+    /* If PBA lives on the same page too, forbid writes. */
+    if ( write && (
+        (adj_type == ADJ_IDX_LAST &&
+         pdev->msix->table.last == pdev->msix->pba.first) ||
+        (adj_type == ADJ_IDX_FIRST &&
+         pdev->msix->table.first == pdev->msix->pba.last)) )
+    {
+        gdprintk(XENLOG_WARNING,
+                 "MSI-X table and PBA of %pp live on the same page, "
+                 "writing to other registers there is not implemented\n",
+                 pdev);
+        return NULL;
+    }
+
+    return fix_to_virt(pdev->msix->adj_access_table_idx[adj_type]) +
+        (address & (PAGE_SIZE - 1));
+
+}
+
+static bool cf_check msixtbl_page_accept(
+        const struct hvm_io_handler *handler, const ioreq_t *r)
+{
+    ASSERT(r->type == IOREQ_TYPE_COPY);
+
+    return msixtbl_page_handler_get_hwaddr(
+            current->domain, r->addr, r->dir == IOREQ_WRITE);
+}
+
+static int cf_check msixtbl_page_read(
+        const struct hvm_io_handler *handler,
+        uint64_t address, uint32_t len, uint64_t *pval)
+{
+    void __iomem *hwaddr;
+
+    if ( address & (len - 1) )
+        return X86EMUL_UNHANDLEABLE;
+
+    hwaddr = msixtbl_page_handler_get_hwaddr(
+            current->domain, address, false);
+
+    if ( !hwaddr )
+        return X86EMUL_UNHANDLEABLE;
+
+    switch ( len )
+    {
+    case 1:
+        *pval = readb(hwaddr);
+        break;
+    case 2:
+        *pval = readw(hwaddr);
+        break;
+    case 4:
+        *pval = readl(hwaddr);
+        break;
+    case 8:
+        *pval = readq(hwaddr);
+        break;
+    default:
+        return X86EMUL_UNHANDLEABLE;
+    }
+    return X86EMUL_OKAY;
+}
+
+static int cf_check msixtbl_page_write(
+        const struct hvm_io_handler *handler,
+        uint64_t address, uint32_t len, uint64_t val)
+{
+    void __iomem *hwaddr = msixtbl_page_handler_get_hwaddr(
+            current->domain, address, true);
+
+    if ( !hwaddr )
+        return X86EMUL_UNHANDLEABLE;
+
+    switch ( len ) {
+        case 1:
+            writeb(val, hwaddr);
+            break;
+        case 2:
+            writew(val, hwaddr);
+            break;
+        case 4:
+            writel(val, hwaddr);
+            break;
+        case 8:
+            writeq(val, hwaddr);
+            break;
+        default:
+            return X86EMUL_UNHANDLEABLE;
+    }
+    return X86EMUL_OKAY;
+
+}
+
+static const struct hvm_io_ops msixtbl_mmio_page_ops = {
+    .accept = msixtbl_page_accept,
+    .read = msixtbl_page_read,
+    .write = msixtbl_page_write,
+};
+
 static void add_msixtbl_entry(struct domain *d,
                               struct pci_dev *pdev,
                               uint64_t gtable,
@@ -593,6 +739,14 @@ void msixtbl_init(struct domain *d)
         handler->type = IOREQ_TYPE_COPY;
         handler->ops = &msixtbl_mmio_ops;
     }
+
+    /* passthrough access to other registers on the same page */
+    handler = hvm_next_io_handler(d);
+    if ( handler )
+    {
+        handler->type = IOREQ_TYPE_COPY;
+        handler->ops = &msixtbl_mmio_page_ops;
+    }
 }
 
 void msixtbl_pt_cleanup(struct domain *d)
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
index d0bf63df1def..680853f84685 100644
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
+        if ( table_paddr & (PAGE_SIZE - 1) )
+        {
+            int idx = msix_get_fixmap(msix, table_paddr, table_paddr);
+
+            if ( idx >= 0 )
+                msix->adj_access_table_idx[ADJ_IDX_FIRST] = idx;
+            else
+                gprintk(XENLOG_ERR, "Failed to map first MSI-X table page: %d\n", idx);
+        }
+        /*
+         * If the MSI-X table doesn't span full page(s), map the last page for
+         * passthrough accesses.
+         */
+        if ( (table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & (PAGE_SIZE - 1) )
+        {
+            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
+            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
+
+            if ( idx >= 0 )
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
2.39.2


