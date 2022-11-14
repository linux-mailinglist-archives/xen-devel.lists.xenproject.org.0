Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A79628936
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 20:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443552.698172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouf1I-0004Ig-Jj; Mon, 14 Nov 2022 19:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443552.698172; Mon, 14 Nov 2022 19:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouf1I-0004Gb-Ga; Mon, 14 Nov 2022 19:21:24 +0000
Received: by outflank-mailman (input) for mailman id 443552;
 Mon, 14 Nov 2022 19:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VGCG=3O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ouf1G-0002zm-ME
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 19:21:22 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84ff66a9-6451-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 20:21:21 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A67C332009FA;
 Mon, 14 Nov 2022 14:21:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 14:21:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 14:21:18 -0500 (EST)
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
X-Inumbo-ID: 84ff66a9-6451-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1668453679; x=1668540079; bh=iC8thv4qLJ
	7PkjWlqKqVMAcrz0XwAyc92QmmRYSHSqo=; b=DfNwMY2jrVVxMvhWOZDiHwPFCw
	Z6nNtugf72yWtJ9drXdixom2Gc6+QcrYmOI+XvwOxgn51o9lxuti5Qnq+GB3Pc/1
	KrP9R3fylTRGXeE1HK38tBhl04RjsGtREI5N/uAaSf9WPCIEOAsDjgZnj3t7nmfZ
	wmhi77fZDMeO2RZVcDrZQNrVBpE7A3eHn+7/bLN3UvviJKjXpIwWf1is/7iteXWz
	aUOsWg28i1V9F9KdvZ801urx17Mg+nVbtrt7k6OC+c7tKW5Er7hFrUf2ibyFJzQN
	eFvxKimzDKYX3/YdjlQicxRJ2Q6qSk9vMZEciwBEBSRJPCD9SWTqdWT5IM1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668453679; x=
	1668540079; bh=iC8thv4qLJ7PkjWlqKqVMAcrz0XwAyc92QmmRYSHSqo=; b=E
	MiT0XDkGlxu3+U2zuoZOOk7Eypuez6xQwfRO663ycRpyPNPYSkTfMABA6Vg2VJCh
	SlDIDclXEC43gQJt36KkziG/Yl1I9VzdfbaFFeuEKedEht5yy0JMzimGq99qctdF
	c0IH6keNPAluVm4GYkRAXPibsI83dIRwVmyvNCgbvuObsf+ZWQYMHbEIaIcrMBri
	zi0tPf62daDhGaaaoSxM0aVgL2Cz+N2sgycgLHZMhHRHuvYQlUKiec2F3sZxFT+z
	AvaQplrKnZnD5yofGyt22DsG5UItSarHgkF5sEStqew05q2bwS3Zvbjt7MAw1W/c
	B92MSy47bkakVleKTcmRg==
X-ME-Sender: <xms:L5VyYyJ4TBu-tXwSpZ-7CnV8i8xtf_xPlvEClUVgiQsgA7gO67nWCQ>
    <xme:L5VyY6LOy9ZW6uUQjXWnp-5beKwZ2yjJDwICM1_ExuKDuTYX6HxtRZhdkZzknbJa3
    w5W9uCAj6wUCQ>
X-ME-Received: <xmr:L5VyYyvfJIGRgbMbIUEn3nt6NoFyNZwEx3mMpgSbEY1vzuOy2f_-UirnTxsksjfKEKSPIhkq0BT62W_u2YxaBGmxHYVkHfXznyBaN4i7ucv2RiJqGh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:L5VyY3YTu2dfid-z8z_3IJbRutWwq2GheBJHK-0udT10_Ax7sM6Xvw>
    <xmx:L5VyY5YRL788yQ67X9gLiCl9Wwg0Q1FnpT1BJgw71LqgYobR5iqm_w>
    <xmx:L5VyYzDdBXxLPfys_F7Jc-7_F6AgDQNcxiSN5ZwKQMWEHXfi6LtiRA>
    <xmx:L5VyY9G4uk46ytbMbwQLai1jj15baI87323x9RHMbT4OSKgn8FLRaA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/msi: Allow writes to registers on the same page as MSI-X table
Date: Mon, 14 Nov 2022 20:21:00 +0100
Message-Id: <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
on the same page as MSI-X table. Device model (especially one in
stubdomain) cannot really handle those, as direct writes to that page is
refused (page is on mmio_ro_ranges list). Instead, add internal ioreq
server that handle those writes.

This may be also used to read Pending Bit Array, if it lives on the same
page, making QEMU not needing /dev/mem access at all (especially helpful
with lockdown enabled in dom0). If PBA lives on another page, it can be
(and will be) mapped to the guest directly.
If PBA lives on the same page, forbid writes. Technically, writes outside
of PBA could be allowed, but at this moment the precise location of PBA
isn't saved.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/hvm/vmsi.c        | 135 +++++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msi.h |   1 +
 xen/arch/x86/msi.c             |  21 +++++
 3 files changed, 157 insertions(+)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index ba4cf46dfe91..57cfcf70741e 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -428,6 +428,133 @@ static const struct hvm_io_ops msixtbl_mmio_ops = {
     .write = _msixtbl_write,
 };
 
+static void __iomem *msixtbl_page_handler_get_hwaddr(
+        const struct vcpu *v,
+        uint64_t address,
+        bool write)
+{
+    struct domain *d = v->domain;
+    struct pci_dev *pdev = NULL;
+    struct msixtbl_entry *entry;
+    void __iomem *ret = NULL;
+    uint64_t table_end_addr;
+
+    rcu_read_lock(&msixtbl_rcu_lock);
+    /*
+     * Check if it's on the same page as the end of the MSI-X table, but
+     * outside of the table itself.
+     */
+    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
+        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable + entry->table_len) &&
+             address >= entry->gtable + entry->table_len )
+        {
+            pdev = entry->pdev;
+            break;
+        }
+    rcu_read_unlock(&msixtbl_rcu_lock);
+
+    if ( !pdev )
+        return NULL;
+
+    ASSERT( pdev->msix );
+
+    table_end_addr = (pdev->msix->table.first << PAGE_SHIFT) +
+        pdev->msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
+    ASSERT( PFN_DOWN(table_end_addr) == pdev->msix->table.last );
+
+    /* If PBA lives on the same page too, forbid writes. */
+    if ( write && pdev->msix->table.last == pdev->msix->pba.first )
+        return NULL;
+
+    if ( pdev->msix->last_table_page )
+        ret = pdev->msix->last_table_page + (address & (PAGE_SIZE - 1));
+    else
+        gdprintk(XENLOG_WARNING,
+                 "MSI-X last_table_page not initialized for %04x:%02x:%02x.%u\n",
+                 pdev->seg,
+                 pdev->bus,
+                 PCI_SLOT(pdev->devfn),
+                 PCI_FUNC(pdev->devfn));
+
+    return ret;
+}
+
+static bool cf_check msixtbl_page_accept(
+        const struct hvm_io_handler *handler, const ioreq_t *r)
+{
+    unsigned long addr = r->addr;
+
+    ASSERT( r->type == IOREQ_TYPE_COPY );
+
+    return msixtbl_page_handler_get_hwaddr(
+            current, addr, r->dir == IOREQ_WRITE);
+}
+
+static int cf_check msixtbl_page_read(
+        const struct hvm_io_handler *handler,
+        uint64_t address, uint32_t len, uint64_t *pval)
+{
+    void __iomem *hwaddr = msixtbl_page_handler_get_hwaddr(
+            current, address, false);
+
+    if ( !hwaddr )
+        return X86EMUL_UNHANDLEABLE;
+
+    switch ( len ) {
+        case 1:
+            *pval = readb(hwaddr);
+            break;
+        case 2:
+            *pval = readw(hwaddr);
+            break;
+        case 4:
+            *pval = readl(hwaddr);
+            break;
+        case 8:
+            *pval = readq(hwaddr);
+            break;
+        default:
+            return X86EMUL_UNHANDLEABLE;
+    }
+    return X86EMUL_OKAY;
+}
+
+static int cf_check msixtbl_page_write(
+        const struct hvm_io_handler *handler,
+        uint64_t address, uint32_t len, uint64_t val)
+{
+    void __iomem *hwaddr = msixtbl_page_handler_get_hwaddr(
+            current, address, true);
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
@@ -583,6 +710,14 @@ void msixtbl_init(struct domain *d)
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
index fe670895eed2..d4287140f04c 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -236,6 +236,7 @@ struct arch_msix {
     } table, pba;
     int table_refcnt[MAX_MSIX_TABLE_PAGES];
     int table_idx[MAX_MSIX_TABLE_PAGES];
+    void __iomem *last_table_page;
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
     domid_t warned;
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1def..e7fe41f424d8 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -961,6 +961,21 @@ static int msix_capability_init(struct pci_dev *dev,
                 domain_crash(d);
             /* XXX How to deal with existing mappings? */
         }
+
+        /*
+         * If the MSI-X table doesn't span full page(s), map the last page for
+         * passthrough accesses.
+         */
+        if ( (msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & (PAGE_SIZE - 1) )
+        {
+            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
+            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
+
+            if ( idx >= 0 )
+                msix->last_table_page = fix_to_virt(idx);
+            else
+                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);
+        }
     }
     WARN_ON(msix->table.first != (table_paddr >> PAGE_SHIFT));
     ++msix->used_entries;
@@ -1090,6 +1105,12 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
             WARN();
         msix->table.first = 0;
         msix->table.last = 0;
+        if ( msix->last_table_page )
+        {
+            msix_put_fixmap(msix,
+                            virt_to_fix((unsigned long)msix->last_table_page));
+            msix->last_table_page = 0;
+        }
 
         if ( rangeset_remove_range(mmio_ro_ranges, msix->pba.first,
                                    msix->pba.last) )
-- 
2.37.3


