Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE19398A0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 05:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762547.1172725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68q-0006AQ-NF; Tue, 23 Jul 2024 03:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762547.1172725; Tue, 23 Jul 2024 03:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68q-00067v-If; Tue, 23 Jul 2024 03:24:44 +0000
Received: by outflank-mailman (input) for mailman id 762547;
 Tue, 23 Jul 2024 03:24:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sW68o-0005f5-M6
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 03:24:42 +0000
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 183c815c-48a3-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 05:24:40 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 6349A138004B;
 Mon, 22 Jul 2024 23:24:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 22 Jul 2024 23:24:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 23:24:38 -0400 (EDT)
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
X-Inumbo-ID: 183c815c-48a3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721705079; x=1721791479; bh=HuGUYsURlp
	6+r8i8v214iFZFLGwxRoRuuPkIdYSUxvc=; b=nyTUeAUXV4fBV2D1N/XyH/idq1
	i9275JdQuenBOe7kM6qnmGXRQhrdkR1qBMxgHX9S39RDPCh+FFb/KnZx8CPhd7G3
	0JOOIq+q9NrsmMUwbbzXRQmdXzSptUs+qCLmm4UnIou04bItKDHrqF3g9JtvbxTr
	pIWGqC6NQ+t15dn17HcTFP/AE0GfKXpXSZHiuqO7fnAL4js4D2CukqZZ3tmhGsD4
	fehYc0iMha9+vQYWlljQ6zQ3TSTV0WwTxo9p06TE/JLWBbQ0ak3clGgknQUJ58eV
	rfeLdC5iGTLveJnh9gT+Ik4E94XcQmKvliutwuatLs++SVxKQ1nSkN0EiIvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721705079; x=
	1721791479; bh=HuGUYsURlp6+r8i8v214iFZFLGwxRoRuuPkIdYSUxvc=; b=H
	z9u2yRAENZDHcBoEQBBfJs3qzOoPalCMm999yDGQtW23v+sduYXqBTue7+yF0TNh
	feMfU78oDgY9167est0bW2iBUVyupxP4UxcFiuj8CQwopHO++lfoP4KtOK3T4Mcg
	K8Jm4WllddUF6Y4tkedQh2dqTKncG5pztIwDhP4bYC8s3BCZ/vNiOjNN8ZLlY29a
	9CgMNDQdlIolxHlHvOwKHywcc++DNOCzIWLflJgpWUZi2u708RN5Z0Ewo5soABlO
	cT5wacTtCe2c3bBX5X0TkcokNK94Zo8C18zbVPJgDjdIUaWpx2itF1sK5IZInIvQ
	FrWlEzDcWFhXjBUuX4wHg==
X-ME-Sender: <xms:dyKfZtSL5TuIfEmgC94siIc7GtVZsWjlZw3csyhb819c3jO4iJRs0Q>
    <xme:dyKfZmwdw8PM0BOhRXet2sBpLUL1gxJ4kbCw9NcOk5Qgx2kmOffkN_VEhY8zhNDwf
    5Pr7Q82tHbavA>
X-ME-Received: <xmr:dyKfZi3ncmUnSf90SUX0xODFDoXnZvZX5gb-0AV3UCZ3xq3_ZAmDLPgKS0Be8xLwqbb9X41y6wtDDziAX0DDJFieSebiHs5ICe3kZFVwaQROS4EoYXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheekgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:dyKfZlBI_tXgcIl6Kpzqo-FcK8bFvsTcWxTqwuwPAkluBeuVOlZt7g>
    <xmx:dyKfZmhuQNhOaK9SlXMNc31yqds4PECt7t8aBcdeOv3lOWOoU9VYPA>
    <xmx:dyKfZpoOZ2-rLukYrvA4yMBDZPQZjpbLuSvGXcHF6gxRdZnLX4T5tg>
    <xmx:dyKfZhgllXop2uluh0wiek2Y3YDu18HdajphDI3KRiJcuBObRjG_Pg>
    <xmx:dyKfZuc-rQhj3vsl0Iq0XfVIeEw_nCDP82zpIZcQOqjsLX7I3T8AC20N>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 2/3] x86/mm: add API for marking only part of a MMIO page read only
Date: Tue, 23 Jul 2024 05:24:13 +0200
Message-ID: <4bea5034cda37f35cd04115bebcccb52e3ea719e.1721704980.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
References: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
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
 xen/arch/x86/mm.c               | 265 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   6 +-
 5 files changed, 295 insertions(+), 5 deletions(-)

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
index 648d6dd475ba..b203a1e870d4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -150,6 +150,17 @@ bool __read_mostly machine_to_phys_mapping_valid;
 
 struct rangeset *__read_mostly mmio_ro_ranges;
 
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
 static uint32_t base_disallow_mask;
 /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
 #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
@@ -4910,6 +4921,257 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
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
+    return new_entry ? 0 : 1;
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
+    /*
+     * In release, build unaligned start will protect larger area,
+     * so tolerate it.
+     * But unaligned size would result in smaller area, so deny it.
+     */
+    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
+    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
+    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
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
@@ -4928,6 +5190,9 @@ int cf_check mmio_ro_emulated_write(
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

