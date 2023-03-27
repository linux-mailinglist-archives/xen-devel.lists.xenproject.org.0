Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E086CA0E7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515117.797687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjnJ-0005JL-CY; Mon, 27 Mar 2023 10:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515117.797687; Mon, 27 Mar 2023 10:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjnJ-0005Fy-6g; Mon, 27 Mar 2023 10:09:41 +0000
Received: by outflank-mailman (input) for mailman id 515117;
 Mon, 27 Mar 2023 10:09:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSZI=7T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgjnG-00050r-RM
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:09:39 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a4b4b25-cc87-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 12:09:37 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E61AD5C014D;
 Mon, 27 Mar 2023 06:09:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Mar 2023 06:09:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 06:09:34 -0400 (EDT)
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
X-Inumbo-ID: 7a4b4b25-cc87-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1679911775; x=1679998175; bh=Xg
	uvSU65OUXrBnKZJQwmkiD5FqnzcP7jvRUz9zeLO90=; b=aMBneFLq+4/izD/DW8
	KxXqt90Boa11BIJIQB6bHIs9ppi2l069YpLX0KBFXJu5ydxzk6aD7zUgehpBNxdv
	OhooZFZBDuFFdoQr2fzrUmtdgRAp7ksSbPTHmEirY940tws/nK1sXDPtABDNkC02
	M4bPvjG/eYqEaJSgs9FKbkJz/zQKVonvJTOfCVBy9OGtGjmIj7Qnp04O8+M7ziEO
	8odLp7PP8xr1N7bfehLPR+K6VjHfvZnTW71bDk7ZGzP0QRBO59Hc5eq9k0Ijm+0M
	NvRroQRWiDsgHSLFSPCP9zvY+vkhK8O6U2u8LUGDQXIpzGJYRtpVq+7uNWJZxghQ
	uCmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679911775; x=1679998175; bh=XguvSU65OUXrBnKZJQwmkiD5FqnzcP7jvRU
	z9zeLO90=; b=kHOLYx/JlCG+qgSaWf4U+LeZ706+0kaLfwUeuDIYfecsDDPy13x
	g4qA2nomzJYj3FaGBHy7gZulmz42s4uN9W9XwKZF/iqE8K+EQzg0nZwHtti+87+W
	qG1UQuMyQM7z46wtPLbg8bOgmPtHridGl8OyqIb2UuuIYE8o8RFpNFUwgDlJQASf
	PV77hXb58lvp15P5BSUuuw+G5dJer3Ip2Hz5OmzrC2z/HRc3H7l6bPL+dYu2Zlve
	sGJ8I5Ni8oFUFy+8BL3QcuyiXluGFFnXf2VHUZGY6yU4s6avLPAsak2p+2CCoWPz
	nAOxvvp46n6rf2vajUOZl6P+KIx4rKhN1EA==
X-ME-Sender: <xms:X2shZF_e4MnxMFyfH5dWuRKok4MbhPeHbdWXOgmejCccIx7YHKFMWw>
    <xme:X2shZJskEqaV5K8hHWQLi0_goszTZSoEIClwV2LxQLdQxxxXP-o3vMQsYg7wtcxgQ
    _bJvdzUqj4EGQ>
X-ME-Received: <xmr:X2shZDAw4SLcSQKEeGgSxGQMNFkRdjHokbbceD_Br0oDGgQp8btHo3Lh6DIkGZWKxYccEGpENGFL-qwF-YSur129BTOS3Ov4XCb6PpRbeCJ02_1Yxsvj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:X2shZJcQUHzkVq1CP5KeS3YbouSSS8dIURGORuGGGka-gW86-W8J_A>
    <xmx:X2shZKN-dlYdVhdwrxPWsDv0DGBX66854h1DW7qYtxpU4Eyy95LzNQ>
    <xmx:X2shZLn5ZN9qvIRaCsoSlVFjwEf1IAntA5q99jld-IwjK5d2I3HzpQ>
    <xmx:X2shZHqow4Yw_NaBAURLBhu_Qo85hlGerjRYvs8DXJdHay_FApvPwQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page read only
Date: Mon, 27 Mar 2023 12:09:15 +0200
Message-Id: <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In some cases, only few registers on a page needs to be write-protected.
Examples include USB3 console (64 bytes worth of registers) or MSI-X's
PBA table (which doesn't need to span the whole table either).
Current API allows only marking whole pages pages read-only, which
sometimes may cover other registers that guest may need to write into.

Currently, when a guest tries to write to an MMIO page on the
mmio_ro_ranges, it's either immediately crashed on EPT violation - if
that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
from userspace (like, /dev/mem), it will try to fixup by updating page
tables (that Xen again will force to read-only) and will hit that #PF
again (looping endlessly). Both behaviors are undesirable if guest could
actually be allowed the write.

Introduce an API that allows marking part of a page read-only. Since
sub-page permissions are not a thing in page tables, do this via
emulation (or simply page fault handler for PV) that handles writes that
are supposed to be allowed. Those writes require the page to be mapped
to Xen, so subpage_mmio_ro_add() function takes fixmap index of the
page. The page needs to be added to mmio_ro_ranges, first anyway.
Sub-page ranges are stored using rangeset for each added page, and those
pages are stored on a plain list (as there isn't supposed to be many
pages needing this precise r/o control).

The mechanism this API is plugged in is slightly different for PV and
HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
it's already called for #PF on read-only MMIO page. For HVM however, EPT
violation on p2m_mmio_direct page results in a direct domain_crash().
To reach mmio_ro_emulated_write(), change how write violations for
p2m_mmio_direct are handled - specifically, treat them similar to
p2m_ioreq_server. This makes relevant ioreq handler being called,
that finally end up calling mmio_ro_emulated_write().
Both of those paths need an MFN to which guest tried to write (to check
which part of the page is supposed to be read-only, and where
the page is mapped for writes). This information currently isn't
available directly in mmio_ro_emulated_write(), but in both cases it is
already resolved somewhere higher in the call tree. Pass it down to
mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Shadow mode is not tested, but I don't expect it to work differently than
HAP in areas related to this patch.
The used locking should make it safe to use similar to mmio_ro_ranges,
but frankly the only use (introduced in the next patch) could go without
locking at all, as subpage_mmio_ro_add() is called only before any
domain is constructed and subpage_mmio_ro_remove() is never called.
---
 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   3 +-
 xen/arch/x86/include/asm/mm.h   |  22 ++++-
 xen/arch/x86/mm.c               | 181 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   1 +-
 5 files changed, 207 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 95364deb1996..311102724dea 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2733,7 +2733,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
         .write      = mmio_ro_emulated_write,
         .validate   = hvmemul_validate,
     };
-    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
+    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
     struct hvm_emulate_ctxt ctxt;
     const struct x86_emulate_ops *ops;
     unsigned int seg, bdf;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d326fa1c0136..f1c928e3e4ee 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1942,7 +1942,8 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
      */
     if ( (p2mt == p2m_mmio_dm) ||
          (npfec.write_access &&
-          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
+          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
+           p2mt == p2m_mmio_direct)) )
     {
         if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npfec) )
             hvm_inject_hw_exception(TRAP_gp_fault, 0);
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index db29e3e2059f..91937d556bac 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -522,9 +522,31 @@ extern struct rangeset *mmio_ro_ranges;
 void memguard_guard_stack(void *p);
 void memguard_unguard_stack(void *p);
 
+/*
+ * Add more precise r/o marking for a MMIO page. Bytes range specified here
+ * will still be R/O, but the rest of the page (nor marked as R/O via another
+ * call) will have writes passed through. The write passthrough requires
+ * providing fixmap entry by the caller.
+ * Since multiple callers can mark different areas of the same page, they might
+ * provide different fixmap entries (although that's very unlikely in
+ * practice). Only the one provided by the first caller will be used. Return value
+ * indicates whether this fixmap entry will be used, or a different one
+ * provided earlier (in which case the caller might decide to release it).
+ *
+ * Return values:
+ *  - negative: error
+ *  - 0: success, fixmap entry is claimed
+ *  - 1: success, fixmap entry set earlier will be used
+ */
+int subpage_mmio_ro_add(mfn_t mfn, unsigned long offset_s,
+                        unsigned long offset_e, int fixmap_idx);
+int subpage_mmio_ro_remove(mfn_t mfn, unsigned long offset_s,
+                           unsigned long offset_e);
+
 struct mmio_ro_emulate_ctxt {
         unsigned long cr2;
         unsigned int seg, bdf;
+        mfn_t mfn;
 };
 
 int cf_check mmio_ro_emulated_write(
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0fe14faa5fa7..b50bdee40b6b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -165,6 +165,19 @@ bool __read_mostly machine_to_phys_mapping_valid;
 
 struct rangeset *__read_mostly mmio_ro_ranges;
 
+/* Handling sub-page read-only MMIO regions */
+struct subpage_ro_range {
+    struct list_head list;
+    mfn_t mfn;
+    int fixmap_idx;
+    struct rangeset *ro_bytes;
+    struct rcu_head rcu;
+};
+
+static LIST_HEAD(subpage_ro_ranges);
+static DEFINE_RCU_READ_LOCK(subpage_ro_rcu);
+static DEFINE_SPINLOCK(subpage_ro_lock);
+
 static uint32_t base_disallow_mask;
 /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
 #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
@@ -4893,6 +4906,172 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return 0;
 }
 
+int subpage_mmio_ro_add(
+    mfn_t mfn,
+    unsigned long offset_s,
+    unsigned long offset_e,
+    int fixmap_idx)
+{
+    struct subpage_ro_range *entry = NULL, *iter;
+    int rc;
+
+    ASSERT(rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)));
+    ASSERT(offset_s < PAGE_SIZE);
+    ASSERT(offset_e < PAGE_SIZE);
+
+    spin_lock(&subpage_ro_lock);
+
+    list_for_each_entry( iter, &subpage_ro_ranges, list )
+    {
+        if ( mfn_eq(iter->mfn, mfn) )
+        {
+            entry = iter;
+            break;
+        }
+    }
+    if ( !entry )
+    {
+        /* iter==NULL marks it was a newly allocated entry */
+        iter = NULL;
+        entry = xmalloc(struct subpage_ro_range);
+        rc = -ENOMEM;
+        if ( !entry )
+            goto err_unlock;
+        entry->mfn = mfn;
+        entry->fixmap_idx = fixmap_idx;
+        entry->ro_bytes = rangeset_new(NULL, "subpage r/o mmio",
+                                       RANGESETF_prettyprint_hex);
+        rc = -ENOMEM;
+        if ( !entry->ro_bytes )
+            goto err_unlock;
+    }
+
+    rc = rangeset_add_range(entry->ro_bytes, offset_s, offset_e);
+    if ( rc < 0 )
+        goto err_unlock;
+
+    if ( !iter )
+        list_add_rcu(&entry->list, &subpage_ro_ranges);
+
+    spin_unlock(&subpage_ro_lock);
+
+    if ( !iter || entry->fixmap_idx == fixmap_idx )
+        return 0;
+    else
+        return 1;
+
+err_unlock:
+    spin_unlock(&subpage_ro_lock);
+    if ( !iter )
+    {
+        if ( entry )
+        {
+            if ( entry->ro_bytes )
+                rangeset_destroy(entry->ro_bytes);
+            xfree(entry);
+        }
+    }
+    return rc;
+}
+
+static void subpage_mmio_ro_free(struct rcu_head *rcu)
+{
+    struct subpage_ro_range *entry = container_of(rcu, struct subpage_ro_range, rcu);
+
+    rangeset_destroy(entry->ro_bytes);
+    xfree(entry);
+}
+
+int subpage_mmio_ro_remove(
+    mfn_t mfn,
+    unsigned long offset_s,
+    unsigned long offset_e)
+{
+    struct subpage_ro_range *entry = NULL, *iter;
+    int rc;
+
+    ASSERT(offset_s < PAGE_SIZE);
+    ASSERT(offset_e < PAGE_SIZE);
+
+    spin_lock(&subpage_ro_lock);
+
+    list_for_each_entry_rcu( iter, &subpage_ro_ranges, list )
+    {
+        if ( mfn_eq(iter->mfn, mfn) )
+        {
+            entry = iter;
+            break;
+        }
+    }
+    rc = -ENOENT;
+    if ( !entry )
+        goto out_unlock;
+
+    rc = rangeset_remove_range(entry->ro_bytes, offset_s, offset_e);
+    if ( rc < 0 )
+        goto out_unlock;
+
+    rc = 0;
+
+    if ( !rangeset_is_empty(entry->ro_bytes) )
+        goto out_unlock;
+
+    list_del_rcu(&entry->list);
+    call_rcu(&entry->rcu, subpage_mmio_ro_free);
+
+out_unlock:
+    spin_unlock(&subpage_ro_lock);
+    return rc;
+}
+
+static void subpage_mmio_write_emulate(
+    mfn_t mfn,
+    unsigned long offset,
+    void *data,
+    unsigned int len)
+{
+    struct subpage_ro_range *entry;
+    void __iomem *addr;
+
+    rcu_read_lock(&subpage_ro_rcu);
+
+    list_for_each_entry_rcu( entry, &subpage_ro_ranges, list )
+    {
+        if ( mfn_eq(entry->mfn, mfn) )
+        {
+            if ( rangeset_overlaps_range(entry->ro_bytes, offset, offset + len - 1) )
+                goto out_unlock;
+
+            addr = fix_to_virt(entry->fixmap_idx) + offset;
+            switch ( len )
+            {
+            case 1:
+                writeb(*(uint8_t*)data, addr);
+                break;
+            case 2:
+                writew(*(uint16_t*)data, addr);
+                break;
+            case 4:
+                writel(*(uint32_t*)data, addr);
+                break;
+            case 8:
+                writeq(*(uint64_t*)data, addr);
+                break;
+            default:
+                /* mmio_ro_emulated_write() already validated the size */
+                ASSERT_UNREACHABLE();
+            }
+            goto out_unlock;
+        }
+    }
+    gdprintk(XENLOG_WARNING,
+             "ignoring write to R/O MMIO mfn %" PRI_mfn " offset %lx len %u\n",
+             mfn_x(mfn), offset, len);
+
+out_unlock:
+    rcu_read_unlock(&subpage_ro_rcu);
+}
+
 int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
@@ -4911,6 +5090,8 @@ int cf_check mmio_ro_emulated_write(
         return X86EMUL_UNHANDLEABLE;
     }
 
+    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, offset & (PAGE_SIZE - 1), p_data, bytes);
+
     return X86EMUL_OKAY;
 }
 
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 5963f5ee2d51..91caa2c8f520 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -342,6 +342,7 @@ static int mmio_ro_do_page_fault(struct x86_emulate_ctxt *ctxt,
             return X86EMUL_UNHANDLEABLE;
     }
 
+    mmio_ro_ctxt.mfn = mfn;
     ctxt->data = &mmio_ro_ctxt;
     if ( pci_ro_mmcfg_decode(mfn_x(mfn), &mmio_ro_ctxt.seg, &mmio_ro_ctxt.bdf) )
         return x86_emulate(ctxt, &mmcfg_intercept_ops);
-- 
git-series 0.9.1

