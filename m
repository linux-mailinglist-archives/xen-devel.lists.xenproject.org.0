Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A598CA673
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 04:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726458.1130737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FhM-0000YX-0p; Tue, 21 May 2024 02:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726458.1130737; Tue, 21 May 2024 02:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FhL-0000Vz-U2; Tue, 21 May 2024 02:57:55 +0000
Received: by outflank-mailman (input) for mailman id 726458;
 Tue, 21 May 2024 02:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TC+7=MY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9FhK-0000Sf-JT
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 02:57:54 +0000
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9d2f07a-171d-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 04:57:52 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id E21881C00115;
 Mon, 20 May 2024 22:57:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 20 May 2024 22:57:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 May 2024 22:57:49 -0400 (EDT)
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
X-Inumbo-ID: e9d2f07a-171d-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716260270; x=1716346670; bh=N0jz6LIRA8
	G2AVDWcwPsElyhd6eufRVEJ6uYH7nmGas=; b=BMtFBDKpfI8yZ+Y/FaPt+Y8hYu
	wod6qJ2D1R+iYSoUmvL+V9jBdYEO0lPBeHnKXYJeUb3L4XxR0ZiU/CuzjNAA2url
	8WYQFz5VPJFYTQzzE9mW31W0Metfm9mnFZCg/RJMssPAvk12TfvGnHljQBCH45H5
	nFe4jwP5l24Vw5A52jQ/OyaUvVkCBmrjsR0DdGVLzbdKzWc9hJxu38KN1pdnHXp1
	NcpZrsqjBC61Udtrv6/uQt0eJlqGiQR/ucP1vQDX5nvArPCYnqBsPn91JUFC2pOi
	pnRIaF+V++soJf+XUaxHz220NZD+9HKA/dn5UnwY0VoMLLDCYNSZtzSRA+NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716260270; x=
	1716346670; bh=N0jz6LIRA8G2AVDWcwPsElyhd6eufRVEJ6uYH7nmGas=; b=P
	w0dgrJe4NnxTIGVfPD6+nypqPFxbbdMlxkOK7lYqB1GuiT/CT9Z5d57WlVzPYjFM
	0XwdXH+ogM6xpKapz9AoxKoy6uk9c0ep6qc5bKWahlr0QbDBl5U7UWNn/xS+dYJa
	qqlFwCToflp9NggLfkD0FnUW8ffwJZoik1QwR/fbEIkQSglKlNRVaS2Aa0rSDQdj
	U9wlVJ+Wy5D7ebZ9rlgYTbYXChPpGDS67MyVYRfzeaqdZ26IpY1/VIdcA2JgPJzW
	UiesWNVvKmBz0OHR3nK6cVvv5MTdKMmRFNxpcvk/IgO4ius5uqLHMmEY/6z1L5Xp
	hV9yMc3HLQoW1Bi8j1sHg==
X-ME-Sender: <xms:rg1MZuqyk8rjyyEBaKmNOJZJU8_IsE0D5Pr1QUrc4_9BvW09miNLFA>
    <xme:rg1MZsqFTxdSobyuVRg7vGmt2O7IQqPZF9CWq021XSEFgp3MVS4xd2ON_oTzVfSd9
    wTMSFC3Eo9-WQ>
X-ME-Received: <xmr:rg1MZjPLp9g8PBfoSHzTtMppVihn7cVW80u9iO-AekZ8LkiH8jHEq0tBcDFlRBvUNGE-D7UxxNlYml9sJvLPlX1y9F1ZEITgjaIAumx3Pto3rks9cOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeiuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:rg1MZt7C6NHrKd54HbA5-WIMDhuHweeVBFKQXSlRfiZr8A7_WIvDzQ>
    <xmx:rg1MZt4wGuQNnb_M4FsCW8cbUtPlT0JvRLmYUxbsJQS8ed4T305ruQ>
    <xmx:rg1MZtjenLh5F_LvwkvjrpUnn6IbqD0yK4qktaLjBxEVWeCEl8PRjA>
    <xmx:rg1MZn6Dvrxg5u4TTcrSeKXl8KBEAOLeKxLjeKtAMN8MT4TuFm5DcA>
    <xmx:rg1MZg3EYUD_VMkD1z-2wR5Fbao7oaR9XCwRQ_tZwgfAqPY_VqELK0zn>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO page read only
Date: Tue, 21 May 2024 04:54:32 +0200
Message-ID: <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
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
violation on p2m_mmio_direct page results in a direct domain_crash().
To reach mmio_ro_emulated_write(), change how write violations for
p2m_mmio_direct are handled - specifically, check if they relate to such
partially protected page via subpage_mmio_write_accept() and if so, call
hvm_emulate_one_mmio() for them too. This decodes what guest is trying
write and finally calls mmio_ro_emulated_write(). The EPT write
violation is detected as npfec.write_access and npfec.present both being
true (similar to other places), which may cover some other (future?)
cases - if that happens, emulator might get involved unnecessarily, but
since it's limited to pages marked with subpage_mmio_ro_add() only, the
impact is minimal.
Both of those paths need an MFN to which guest tried to write (to check
which part of the page is supposed to be read-only, and where
the page is mapped for writes). This information currently isn't
available directly in mmio_ro_emulated_write(), but in both cases it is
already resolved somewhere higher in the call tree. Pass it down to
mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.

This may give a bit more access to the instruction emulator to HVM
guests, but only for pages explicitly marked with subpage_mmio_ro_add().
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
 xen/arch/x86/hvm/hvm.c          |   8 +-
 xen/arch/x86/include/asm/mm.h   |  18 ++-
 xen/arch/x86/mm.c               | 268 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   1 +-
 5 files changed, 296 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index ab1bc516839a..e98513afc69b 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2735,7 +2735,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
         .write      = mmio_ro_emulated_write,
         .validate   = hvmemul_validate,
     };
-    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
+    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
     struct hvm_emulate_ctxt ctxt;
     const struct x86_emulate_ops *ops;
     unsigned int seg, bdf;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9594e0a5c530..9898e3fdb9ec 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2009,6 +2009,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
         goto out_put_gfn;
     }
 
+    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
+         subpage_mmio_write_accept(mfn, gla) &&
+         (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
+    {
+        rc = 1;
+        goto out_put_gfn;
+    }
+
     /* If we fell through, the vcpu will retry now that access restrictions have
      * been removed. It may fault again if the p2m entry type still requires so.
      * Otherwise, this is an error condition. */
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 98b66edaca5e..a8bbed71013e 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -522,9 +522,27 @@ extern struct rangeset *mmio_ro_ranges;
 void memguard_guard_stack(void *p);
 void memguard_unguard_stack(void *p);
 
+/*
+ * Add more precise r/o marking for a MMIO page. Range specified here
+ * will still be R/O, but the rest of the page (not marked as R/O via another
+ * call) will have writes passed through.
+ * The start address and the size must be aligned to SUBPAGE_MMIO_RO_ALIGN.
+ *
+ * This API cannot be used for overlapping ranges, nor for pages already added
+ * to mmio_ro_ranges separately.
+ *
+ * Return values:
+ *  - negative: error
+ *  - 0: success
+ */
+#define SUBPAGE_MMIO_RO_ALIGN 8
+int subpage_mmio_ro_add(paddr_t start, size_t size);
+bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla);
+
 struct mmio_ro_emulate_ctxt {
         unsigned long cr2;
         unsigned int seg, bdf;
+        mfn_t mfn;
 };
 
 int cf_check mmio_ro_emulated_write(
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d968bbbc7315..e601c8c98665 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -150,6 +150,17 @@ bool __read_mostly machine_to_phys_mapping_valid;
 
 struct rangeset *__read_mostly mmio_ro_ranges;
 
+/* Handling sub-page read-only MMIO regions */
+struct subpage_ro_range {
+    struct list_head list;
+    mfn_t mfn;
+    void __iomem *mapped;
+    DECLARE_BITMAP(ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN);
+};
+
+static LIST_HEAD(subpage_ro_ranges);
+static DEFINE_SPINLOCK(subpage_ro_lock);
+
 static uint32_t base_disallow_mask;
 /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
 #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
@@ -4910,6 +4921,260 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+/*
+ * Mark part of the page as R/O.
+ * Returns:
+ * - 0 on success - first range in the page
+ * - 1 on success - subsequent range in the page
+ * - <0 on error
+ *
+ * This needs subpage_ro_lock already taken */
+static int __init subpage_mmio_ro_add_page(
+    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
+{
+    struct subpage_ro_range *entry = NULL, *iter;
+    unsigned int i;
+
+    list_for_each_entry(iter, &subpage_ro_ranges, list)
+    {
+        if ( mfn_eq(iter->mfn, mfn) )
+        {
+            entry = iter;
+            break;
+        }
+    }
+    if ( !entry )
+    {
+        /* iter == NULL marks it was a newly allocated entry */
+        iter = NULL;
+        entry = xzalloc(struct subpage_ro_range);
+        if ( !entry )
+            return -ENOMEM;
+        entry->mfn = mfn;
+    }
+
+    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
+    {
+        int oldbit = __test_and_set_bit(i / SUBPAGE_MMIO_RO_ALIGN,
+                                        entry->ro_qwords);
+        ASSERT(!oldbit);
+    }
+
+    if ( !iter )
+        list_add(&entry->list, &subpage_ro_ranges);
+
+    return iter ? 1 : 0;
+}
+
+/* This needs subpage_ro_lock already taken */
+static void __init subpage_mmio_ro_remove_page(
+    mfn_t mfn,
+    int offset_s,
+    int offset_e)
+{
+    struct subpage_ro_range *entry = NULL, *iter;
+    unsigned int i;
+
+    list_for_each_entry(iter, &subpage_ro_ranges, list)
+    {
+        if ( mfn_eq(iter->mfn, mfn) )
+        {
+            entry = iter;
+            break;
+        }
+    }
+    if ( !entry )
+        return;
+
+    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
+        __clear_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
+
+    if ( !bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN) )
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
+    ASSERT(IS_ALIGNED(start, SUBPAGE_MMIO_RO_ALIGN));
+    ASSERT(IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN));
+    if ( !IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN) )
+        size = ROUNDUP(size, SUBPAGE_MMIO_RO_ALIGN);
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
+    spin_lock(&subpage_ro_lock);
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
+    spin_unlock(&subpage_ro_lock);
+
+    rc = rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end));
+    if ( rc )
+        goto err_remove;
+
+    return 0;
+
+ err_remove:
+    spin_lock(&subpage_ro_lock);
+    if ( subpage_end )
+        subpage_mmio_ro_remove_page(mfn_end, 0, PAGE_OFFSET(end));
+ err_unlock_remove:
+    if ( subpage_start )
+        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), offset_end);
+ err_unlock:
+    spin_unlock(&subpage_ro_lock);
+    return rc;
+}
+
+static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *entry)
+{
+    void __iomem *mapped_page;
+
+    if ( entry->mapped )
+        return entry->mapped;
+
+    mapped_page = ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE);
+
+    spin_lock(&subpage_ro_lock);
+    /* Re-check under the lock */
+    if ( entry->mapped )
+    {
+        spin_unlock(&subpage_ro_lock);
+        iounmap(mapped_page);
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
+    void __iomem *addr;
+
+    list_for_each_entry(entry, &subpage_ro_ranges, list)
+    {
+        if ( mfn_eq(entry->mfn, mfn) )
+        {
+            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
+            {
+ write_ignored:
+                gprintk(XENLOG_WARNING,
+                        "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
+                        mfn_x(mfn), offset, len);
+                return;
+            }
+
+            addr = subpage_mmio_get_page(entry);
+            if ( !addr )
+            {
+                gprintk(XENLOG_ERR,
+                        "Failed to map page for MMIO write at 0x%"PRI_mfn"%03x\n",
+                        mfn_x(mfn), offset);
+                return;
+            }
+
+            switch ( len )
+            {
+            case 1:
+                writeb(*(const uint8_t*)data, addr);
+                break;
+            case 2:
+                writew(*(const uint16_t*)data, addr);
+                break;
+            case 4:
+                writel(*(const uint32_t*)data, addr);
+                break;
+            case 8:
+                writeq(*(const uint64_t*)data, addr);
+                break;
+            default:
+                /* mmio_ro_emulated_write() already validated the size */
+                ASSERT_UNREACHABLE();
+                goto write_ignored;
+            }
+            return;
+        }
+    }
+    /* Do not print message for pages without any writable parts. */
+}
+
+bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
+{
+    unsigned int offset = PAGE_OFFSET(gla);
+    const struct subpage_ro_range *entry;
+
+    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
+        if ( mfn_eq(entry->mfn, mfn) &&
+             !test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
+        {
+            /*
+             * We don't know the write size at this point yet, so it could be
+             * an unaligned write, but accept it here anyway and deal with it
+             * later.
+             */
+            return true;
+        }
+
+    return false;
+}
+
 int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
@@ -4928,6 +5193,9 @@ int cf_check mmio_ro_emulated_write(
         return X86EMUL_UNHANDLEABLE;
     }
 
+    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
+                               p_data, bytes);
+
     return X86EMUL_OKAY;
 }
 
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index cad28ef928ad..578bb4caaf0b 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -330,6 +330,7 @@ static int mmio_ro_do_page_fault(struct x86_emulate_ctxt *ctxt,
             return X86EMUL_UNHANDLEABLE;
     }
 
+    mmio_ro_ctxt.mfn = mfn;
     ctxt->data = &mmio_ro_ctxt;
     if ( pci_ro_mmcfg_decode(mfn_x(mfn), &mmio_ro_ctxt.seg, &mmio_ro_ctxt.bdf) )
         return x86_emulate(ctxt, &mmcfg_intercept_ops);
-- 
git-series 0.9.1

