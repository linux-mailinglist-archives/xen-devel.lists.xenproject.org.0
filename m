Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2C93CC90
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 03:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765205.1175815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXACn-0004dW-8E; Fri, 26 Jul 2024 01:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765205.1175815; Fri, 26 Jul 2024 01:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXACn-0004ap-4y; Fri, 26 Jul 2024 01:57:13 +0000
Received: by outflank-mailman (input) for mailman id 765205;
 Fri, 26 Jul 2024 01:57:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sXACl-0004M2-G3
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 01:57:11 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bc41b29-4af2-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 03:57:06 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 4A4171140092;
 Thu, 25 Jul 2024 21:57:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 25 Jul 2024 21:57:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 21:57:02 -0400 (EDT)
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
X-Inumbo-ID: 5bc41b29-4af2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721959024; x=1722045424; bh=V9SW5G0rGZ
	yTaulKb/zNegGR8bV9fwlDUplOPdsUEsY=; b=nWOKrYsMoFTj54sXUcAIim+JiV
	9t4l3wUWok8oNLP4k6MRWHJBeoLT2CNRiqeFmFDXYATmJVqhCiCRB0jBEYXUmQwg
	6Qb1aLDOt2lFumyz4qqqBFDcgSgfMWbUf8S5BLDfPDROX4vG/CnXYBUG3VlUTDXF
	KErBtt06wvzKlzxJuJfXfD5ewySVcPA2qRiTbWbgE3l/MUnKeLFl5rTXpIv53pyk
	SOh2bqEm+XJIoxBg/p450nR9ZDLpod4p/7ox3X1ISq6jDIZVCflYal10EnoEAw17
	kObRX0APARuCQ7FO1U3vL2kZtyatSDHH44QsYDqR+QDwIf79U3Xkdt8lFYPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721959024; x=
	1722045424; bh=V9SW5G0rGZyTaulKb/zNegGR8bV9fwlDUplOPdsUEsY=; b=G
	MxolI5CP9zwkwcrPJoImSPxS/sudY43tn3Qv/d+xe0eer02cg69LuPgnoljgmdhu
	n6eh4D5sH0eg2zMHU3+OTC3MBrVlqeea5LOof5SEo1GlI7yISk0qMG1jmHoEz/2g
	ch8BpT6p18jX5nDpaG0SsZ0RptCh9oR7n1KcqCPfEr0UCuy9FAMPaDx6XeQ5B/Yk
	QmD88ZWC7d89JVwSDzT571QVNJ2oUfkXD1RcSb3eyeBLTuFZvk+C2vFhJHi3Fe2R
	8GELUGcHbLL2YKzL7eLUNtxee4PE/g4K0BKv7Q5fJY0Jnyq5vm0GiZtHOZZnFe4p
	Vd2qsspNtCXXHgkTgLBqg==
X-ME-Sender: <xms:cAKjZiqq2Wiv3InJ3czepqikLZdvJmpogdrLKHBPDXWQjVgsD_DHhA>
    <xme:cAKjZgpMPcaPSzlFB1Zs5mjWiAHeSklSgkXZ1Tf-d-tBkyXvdO8uPDsBSvoW0Y7hk
    ZnPauPeYkweaA>
X-ME-Received: <xmr:cAKjZnO0Ajd_CDoJRi_IUNZl5FgwCgm8p5FXHwQxMKdMR4pGtf4TfNQxKDGLsfwRvkU1zHl4F7osUmay6WgsZplmDGoAe2k94cyqvR3UoVOAayr4ECg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieeggdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:cAKjZh6TLTOmFnp9wL-B_IX5zA2dvY19YkcUIh52eoNF-2R8z5uHxA>
    <xmx:cAKjZh5cgJw1DHJolWmYpJzPgSklpphJbDi4W6ZYdwvum6P_RjvLVA>
    <xmx:cAKjZhjJ-GU47T0Q1ill3KMquRzK8tzo1GWd5w4ZmKV7QP_fUfYPAA>
    <xmx:cAKjZr7AVpQQULH6eVRR81qKrcY0RUmSnsfaHRPxe5neGcdeKC8nFA>
    <xmx:cAKjZk1pTDMH_FyxX4v2Fl3rSUTmhM3bCaGCdJBPNslACvrnvOEwxac2>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 1/2] x86/mm: add API for marking only part of a MMIO page read only
Date: Fri, 26 Jul 2024 03:55:53 +0200
Message-ID: <7439bbc83314e4d24a82afca4f6dbf1a1d002141.1721958949.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.fe70b6220fe40bbe11f97b9396340c5dd11d59aa.1721958949.git-series.marmarek@invisiblethingslab.com>
References: <cover.fe70b6220fe40bbe11f97b9396340c5dd11d59aa.1721958949.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In some cases, only few registers on a page needs to be write-protected.
Examples include USB3 console (64 bytes worth of registers) or MSI-X's
PBA table (which doesn't need to span the whole table either), although
in the latter case the spec forbids placing other registers on the same
page. Current API allows only marking whole pages pages read-only,
which sometimes may cover other registers that guest may need to
write into.

Currently, when a guest tries to write to an MMIO page on the
mmio_ro_ranges, it's either immediately crashed on EPT violation - if
that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
from userspace (like, /dev/mem), it will try to fixup by updating page
tables (that Xen again will force to read-only) and will hit that #PF
again (looping endlessly). Both behaviors are undesirable if guest could
actually be allowed the write.

Introduce an API that allows marking part of a page read-only. Since
sub-page permissions are not a thing in page tables (they are in EPT,
but not granular enough), do this via emulation (or simply page fault
handler for PV) that handles writes that are supposed to be allowed.
The new subpage_mmio_ro_add() takes a start physical address and the
region size in bytes. Both start address and the size need to be 8-byte
aligned, as a practical simplification (allows using smaller bitmask,
and a smaller granularity isn't really necessary right now).
It will internally add relevant pages to mmio_ro_ranges, but if either
start or end address is not page-aligned, it additionally adds that page
to a list for sub-page R/O handling. The list holds a bitmask which
qwords are supposed to be read-only and an address where page is mapped
for write emulation - this mapping is done only on the first access. A
plain list is used instead of more efficient structure, because there
isn't supposed to be many pages needing this precise r/o control.

The mechanism this API is plugged in is slightly different for PV and
HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
it's already called for #PF on read-only MMIO page. For HVM however, EPT
violation on p2m_mmio_direct page results in a direct domain_crash() for
non hardware domains.  To reach mmio_ro_emulated_write(), change how
write violations for p2m_mmio_direct are handled - specifically, check
if they relate to such partially protected page via
subpage_mmio_write_accept() and if so, call hvm_emulate_one_mmio() for
them too. This decodes what guest is trying write and finally calls
mmio_ro_emulated_write(). The EPT write violation is detected as
npfec.write_access and npfec.present both being true (similar to other
places), which may cover some other (future?) cases - if that happens,
emulator might get involved unnecessarily, but since it's limited to
pages marked with subpage_mmio_ro_add() only, the impact is minimal.
Both of those paths need an MFN to which guest tried to write (to check
which part of the page is supposed to be read-only, and where
the page is mapped for writes). This information currently isn't
available directly in mmio_ro_emulated_write(), but in both cases it is
already resolved somewhere higher in the call tree. Pass it down to
mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.

This may give a bit more access to the instruction emulator to HVM
guests (the change in hvm_hap_nested_page_fault()), but only for pages
explicitly marked with subpage_mmio_ro_add() - so, if the guest has a
passed through a device partially used by Xen.
As of the next patch, it applies only configuration explicitly
documented as not security supported.

The subpage_mmio_ro_add() function cannot be called with overlapping
ranges, and on pages already added to mmio_ro_ranges separately.
Successful calls would result in correct handling, but error paths may
result in incorrect state (like pages removed from mmio_ro_ranges too
early). Debug build has asserts for relevant cases.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Shadow mode is not tested, but I don't expect it to work differently than
HAP in areas related to this patch.

Changes in v7:
- refuse misaligned start in release build too, to have release build
  running what was tested in debug build
- simplify return from subpage_mmio_ro_add_page
Changes in v6:
- fix return type of subpage_mmio_find_page()
- change 'iter' pointer to 'new_entry' bool and move list_add()
- comment why different error handling for unaligned start / size
- code style
Changes in v5:
- use subpage_mmio_find_page helper, simplifying several functions
- use LIST_HEAD_RO_AFTER_INIT
- don't use subpage_ro_lock in __init
- drop #ifdef in mm.h
- return error on unaligned size in subpage_mmio_ro_add() instead of
  extending the size (in release build)
Changes in v4:
- rename SUBPAGE_MMIO_RO_ALIGN to MMIO_RO_SUBPAGE_GRAN
- guard subpage_mmio_write_accept with CONFIG_HVM, as it's used only
  there
- rename ro_qwords to ro_elems
- use unsigned arguments for subpage_mmio_ro_remove_page()
- use volatile for __iomem
- do not set mmio_ro_ctxt.mfn for mmcfg case
- comment where fields of mmio_ro_ctxt are used
- use bool for result of __test_and_set_bit
- do not open-code mfn_to_maddr()
- remove leftover RCU
- mention hvm_hap_nested_page_fault() explicitly in the commit message
Changes in v3:
- use unsigned int for loop iterators
- use __set_bit/__clear_bit when under spinlock
- avoid ioremap() under spinlock
- do not cast away const
- handle unaligned parameters in release build
- comment fixes
- remove RCU - the add functions are __init and actual usage is only
  much later after domains are running
- add checks overlapping ranges in debug build and document the
  limitations
- change subpage_mmio_ro_add() so the error path doesn't potentially
  remove pages from mmio_ro_ranges
- move printing message to avoid one goto in
  subpage_mmio_write_emulate()
Changes in v2:
- Simplify subpage_mmio_ro_add() parameters
- add to mmio_ro_ranges from within subpage_mmio_ro_add()
- use ioremap() instead of caller-provided fixmap
- use 8-bytes granularity (largest supported single write) and a bitmap
  instead of a rangeset
- clarify commit message
- change how it's plugged in for HVM domain, to not change the behavior for
  read-only parts (keep it hitting domain_crash(), instead of ignoring
  write)
- remove unused subpage_mmio_ro_remove()
---
 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   4 +-
 xen/arch/x86/include/asm/mm.h   |  23 +++-
 xen/arch/x86/mm.c               | 261 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   6 +-
 5 files changed, 291 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 02e378365b40..7253a87032dd 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2734,7 +2734,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
         .write      = mmio_ro_emulated_write,
         .validate   = hvmemul_validate,
     };
-    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
+    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
     struct hvm_emulate_ctxt ctxt;
     const struct x86_emulate_ops *ops;
     unsigned int seg, bdf;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f5f..a108870558bf 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2016,8 +2016,8 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
         goto out_put_gfn;
     }
 
-    if ( (p2mt == p2m_mmio_direct) && is_hardware_domain(currd) &&
-         npfec.write_access && npfec.present &&
+    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
+         (is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, gla)) &&
          (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
     {
         rc = 1;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 98b66edaca5e..a457f0d2b1b3 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -522,9 +522,32 @@ extern struct rangeset *mmio_ro_ranges;
 void memguard_guard_stack(void *p);
 void memguard_unguard_stack(void *p);
 
+/*
+ * Add more precise r/o marking for a MMIO page. Range specified here
+ * will still be R/O, but the rest of the page (not marked as R/O via another
+ * call) will have writes passed through.
+ * The start address and the size must be aligned to MMIO_RO_SUBPAGE_GRAN.
+ *
+ * This API cannot be used for overlapping ranges, nor for pages already added
+ * to mmio_ro_ranges separately.
+ *
+ * Since there is currently no subpage_mmio_ro_remove(), relevant device should
+ * not be hot-unplugged.
+ *
+ * Return values:
+ *  - negative: error
+ *  - 0: success
+ */
+#define MMIO_RO_SUBPAGE_GRAN 8
+int subpage_mmio_ro_add(paddr_t start, size_t size);
+bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla);
+
 struct mmio_ro_emulate_ctxt {
         unsigned long cr2;
+        /* Used only for mmcfg case */
         unsigned int seg, bdf;
+        /* Used only for non-mmcfg case */
+        mfn_t mfn;
 };
 
 int cf_check mmio_ro_emulated_write(
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 95795567f2a5..cfd487d06474 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -152,6 +152,17 @@ struct rangeset *__read_mostly mmio_ro_ranges;
 
 static uint32_t __ro_after_init base_disallow_mask;
 
+/* Handling sub-page read-only MMIO regions */
+struct subpage_ro_range {
+    struct list_head list;
+    mfn_t mfn;
+    void __iomem *mapped;
+    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
+};
+
+static LIST_HEAD_RO_AFTER_INIT(subpage_ro_ranges);
+static DEFINE_SPINLOCK(subpage_ro_lock);
+
 /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
 #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
 
@@ -4912,6 +4923,253 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+static struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn)
+{
+    struct subpage_ro_range *entry;
+
+    list_for_each_entry(entry, &subpage_ro_ranges, list)
+        if ( mfn_eq(entry->mfn, mfn) )
+            return entry;
+
+    return NULL;
+}
+
+/*
+ * Mark part of the page as R/O.
+ * Returns:
+ * - 0 on success - first range in the page
+ * - 1 on success - subsequent range in the page
+ * - <0 on error
+ */
+static int __init subpage_mmio_ro_add_page(
+    mfn_t mfn,
+    unsigned int offset_s,
+    unsigned int offset_e)
+{
+    struct subpage_ro_range *entry = NULL;
+    bool new_entry = false;
+    unsigned int i;
+
+    entry = subpage_mmio_find_page(mfn);
+    if ( !entry )
+    {
+        entry = xzalloc(struct subpage_ro_range);
+        if ( !entry )
+            return -ENOMEM;
+        entry->mfn = mfn;
+        list_add(&entry->list, &subpage_ro_ranges);
+        new_entry = true;
+    }
+
+    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
+    {
+        bool oldbit = __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
+                                         entry->ro_elems);
+        ASSERT(!oldbit);
+    }
+
+    return !new_entry;
+}
+
+static void __init subpage_mmio_ro_remove_page(
+    mfn_t mfn,
+    unsigned int offset_s,
+    unsigned int offset_e)
+{
+    struct subpage_ro_range *entry = NULL;
+    unsigned int i;
+
+    entry = subpage_mmio_find_page(mfn);
+    if ( !entry )
+        return;
+
+    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
+        __clear_bit(i / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems);
+
+    if ( !bitmap_empty(entry->ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN) )
+        return;
+
+    list_del(&entry->list);
+    if ( entry->mapped )
+        iounmap(entry->mapped);
+    xfree(entry);
+}
+
+int __init subpage_mmio_ro_add(
+    paddr_t start,
+    size_t size)
+{
+    mfn_t mfn_start = maddr_to_mfn(start);
+    paddr_t end = start + size - 1;
+    mfn_t mfn_end = maddr_to_mfn(end);
+    unsigned int offset_end = 0;
+    int rc;
+    bool subpage_start, subpage_end;
+
+    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
+    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
+    if ( !IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN) ||
+         !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
+        return -EINVAL;
+
+    if ( !size )
+        return 0;
+
+    if ( mfn_eq(mfn_start, mfn_end) )
+    {
+        /* Both starting and ending parts handled at once */
+        subpage_start = PAGE_OFFSET(start) || PAGE_OFFSET(end) != PAGE_SIZE - 1;
+        subpage_end = false;
+    }
+    else
+    {
+        subpage_start = PAGE_OFFSET(start);
+        subpage_end = PAGE_OFFSET(end) != PAGE_SIZE - 1;
+    }
+
+    if ( subpage_start )
+    {
+        offset_end = mfn_eq(mfn_start, mfn_end) ?
+                     PAGE_OFFSET(end) :
+                     (PAGE_SIZE - 1);
+        rc = subpage_mmio_ro_add_page(mfn_start,
+                                      PAGE_OFFSET(start),
+                                      offset_end);
+        if ( rc < 0 )
+            goto err_unlock;
+        /* Check if not marking R/W part of a page intended to be fully R/O */
+        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
+                                                  mfn_x(mfn_start)));
+    }
+
+    if ( subpage_end )
+    {
+        rc = subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
+        if ( rc < 0 )
+            goto err_unlock_remove;
+        /* Check if not marking R/W part of a page intended to be fully R/O */
+        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
+                                                  mfn_x(mfn_end)));
+    }
+
+    rc = rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end));
+    if ( rc )
+        goto err_remove;
+
+    return 0;
+
+ err_remove:
+    if ( subpage_end )
+        subpage_mmio_ro_remove_page(mfn_end, 0, PAGE_OFFSET(end));
+ err_unlock_remove:
+    if ( subpage_start )
+        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), offset_end);
+ err_unlock:
+    return rc;
+}
+
+static void __iomem *subpage_mmio_map_page(
+    struct subpage_ro_range *entry)
+{
+    void __iomem *mapped_page;
+
+    if ( entry->mapped )
+        return entry->mapped;
+
+    mapped_page = ioremap(mfn_to_maddr(entry->mfn), PAGE_SIZE);
+
+    spin_lock(&subpage_ro_lock);
+    /* Re-check under the lock */
+    if ( entry->mapped )
+    {
+        spin_unlock(&subpage_ro_lock);
+        if ( mapped_page )
+            iounmap(mapped_page);
+        return entry->mapped;
+    }
+
+    entry->mapped = mapped_page;
+    spin_unlock(&subpage_ro_lock);
+    return entry->mapped;
+}
+
+static void subpage_mmio_write_emulate(
+    mfn_t mfn,
+    unsigned int offset,
+    const void *data,
+    unsigned int len)
+{
+    struct subpage_ro_range *entry;
+    volatile void __iomem *addr;
+
+    entry = subpage_mmio_find_page(mfn);
+    if ( !entry )
+        /* Do not print message for pages without any writable parts. */
+        return;
+
+    if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
+    {
+ write_ignored:
+        gprintk(XENLOG_WARNING,
+                "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
+                mfn_x(mfn), offset, len);
+        return;
+    }
+
+    addr = subpage_mmio_map_page(entry);
+    if ( !addr )
+    {
+        gprintk(XENLOG_ERR,
+                "Failed to map page for MMIO write at 0x%"PRI_mfn"%03x\n",
+                mfn_x(mfn), offset);
+        return;
+    }
+
+    switch ( len )
+    {
+    case 1:
+        writeb(*(const uint8_t*)data, addr);
+        break;
+    case 2:
+        writew(*(const uint16_t*)data, addr);
+        break;
+    case 4:
+        writel(*(const uint32_t*)data, addr);
+        break;
+    case 8:
+        writeq(*(const uint64_t*)data, addr);
+        break;
+    default:
+        /* mmio_ro_emulated_write() already validated the size */
+        ASSERT_UNREACHABLE();
+        goto write_ignored;
+    }
+}
+
+#ifdef CONFIG_HVM
+bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
+{
+    unsigned int offset = PAGE_OFFSET(gla);
+    const struct subpage_ro_range *entry;
+
+    entry = subpage_mmio_find_page(mfn);
+    if ( !entry )
+        return false;
+
+    if ( !test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
+    {
+        /*
+         * We don't know the write size at this point yet, so it could be
+         * an unaligned write, but accept it here anyway and deal with it
+         * later.
+         */
+        return true;
+    }
+
+    return false;
+}
+#endif
+
 int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
@@ -4930,6 +5188,9 @@ int cf_check mmio_ro_emulated_write(
         return X86EMUL_UNHANDLEABLE;
     }
 
+    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
+                               p_data, bytes);
+
     return X86EMUL_OKAY;
 }
 
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index cad28ef928ad..2ea1a6ad489c 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -333,8 +333,10 @@ static int mmio_ro_do_page_fault(struct x86_emulate_ctxt *ctxt,
     ctxt->data = &mmio_ro_ctxt;
     if ( pci_ro_mmcfg_decode(mfn_x(mfn), &mmio_ro_ctxt.seg, &mmio_ro_ctxt.bdf) )
         return x86_emulate(ctxt, &mmcfg_intercept_ops);
-    else
-        return x86_emulate(ctxt, &mmio_ro_emulate_ops);
+
+    mmio_ro_ctxt.mfn = mfn;
+
+    return x86_emulate(ctxt, &mmio_ro_emulate_ops);
 }
 
 int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
-- 
git-series 0.9.1

