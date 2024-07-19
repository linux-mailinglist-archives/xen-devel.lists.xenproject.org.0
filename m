Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68B93727D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 04:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760836.1170795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRq-0002OX-U4; Fri, 19 Jul 2024 02:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760836.1170795; Fri, 19 Jul 2024 02:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRq-0002M0-QY; Fri, 19 Jul 2024 02:34:18 +0000
Received: by outflank-mailman (input) for mailman id 760836;
 Fri, 19 Jul 2024 02:34:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+sj=OT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sUdRo-0001tA-L8
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 02:34:16 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6357420a-4577-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 04:34:14 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 0523F1140269;
 Thu, 18 Jul 2024 22:34:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 18 Jul 2024 22:34:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jul 2024 22:34:11 -0400 (EDT)
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
X-Inumbo-ID: 6357420a-4577-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721356453; x=1721442853; bh=Qr2PBy1sOj
	h/isDKiUX+v/WZoGLV0I6u8v0ak0EPnUE=; b=lEFHFK6sCxcsdWfn3mLWmZxmrv
	3Tsemqjie2DK1j0wmWSIWvPdMRiRDGFCwXTjHvOBSTFi/mYzlevKyPZ/sSjFKe6W
	YX1KwCruQ2Q5gdr0f5FitI3rzNVPX3Wa3d0TJbSM0v5p2hD8Ou6mJYXvpjA0Ap5q
	At/31ba+FOZ6+cYkWBJAxjAIkDmZTDg6rFzsp6Y+V4W+OMLNp/QumC2BtRjJmiva
	s8hrPBkBvKVbPJ3YRLj1f0gLCX3ozk2jeHX9wSBAnijSFxpXsJwJ1Xt4UUuPDQVG
	yqm66p8VrSKwYEyD08eqIpkOxidT45QnHpFzrLO4+kl0qKbAprFOMh2MPCWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721356453; x=
	1721442853; bh=Qr2PBy1sOjh/isDKiUX+v/WZoGLV0I6u8v0ak0EPnUE=; b=X
	KSSb0tY5X6OiiwvTvObyVSvQtprgOhK3eqPQp1GFhkxD3gtitjrFFKg3lOrxfVKA
	TLEljX3Aqj56HxKWGD4Gk4KSkJq3xcJhtWIAkfjaS7cnZGc4ygBS1x2HpvIlXk4K
	i8dNCjzQHiPSq580aN6wQ4X6BMxhJ9vW2nEJrKDaBIQGE9L6zdy7OxoNC6sg0SSn
	cG7ra+jJcka53U/rNBKLl7edR5Ea+3H+ndCO7vu8/q4MusSRSocwNNgUddZ4Sd9y
	Bs12jphjGOZvOX/ravfHzxd0F3ssfC85Vpw4h+eFrhRHbJYuakJ5bDGQmy6/TKM1
	KFg0G9XsYdyOOirneJFMg==
X-ME-Sender: <xms:pNCZZi-bfYEJJFhI956ayNraw0M24pbEj1J3iJILlWS5xNute7_7lQ>
    <xme:pNCZZitpMRXcFEsTTH0anUyelnJRObmnrSkfxW62D6RZ8V6rngkD_KgKs7H8nPQVA
    RfYwW8ZCF-Ofg>
X-ME-Received: <xmr:pNCZZoDBip-3RYXNTC0BBk3pyxXW9g1egXHUjcPeVMvgkqpC3QZpi82pQjJSxfCVCqckiW8cDNAwG6t3i8H35obY1bPOoeKT_EuBNNRnqZ8a-_E00Pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedtgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:pNCZZqfP0D4xICjLof2lvqodFsI6-5eanmu4EQHPmmfsIU6_qLYHqA>
    <xmx:pNCZZnM4sNXlU_zghb_bizM0gH4GHLJ3RQ55ax7b2pgt9gkM6rs8uw>
    <xmx:pNCZZkn3qZNMI2fYA1MJAuTu4g-5u_cGsqiFJ2_6ifUVWSf-OFlScQ>
    <xmx:pNCZZptxc0uQ3ToCK1ZoRxwlNBC3NtpP4Ug2a9nUSsyACds5URkF2A>
    <xmx:pdCZZsp4yXJIzsulgXfHjVtl7Uqf7X6S6LbP4TH5VfqJEDUSVbl71XMh>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 2/3] x86/mm: add API for marking only part of a MMIO page read only
Date: Fri, 19 Jul 2024 04:33:37 +0200
Message-ID: <f0b36fb78b87d2f06c0d33da28ba16cd1d2fa8b9.1721356393.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
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
 xen/arch/x86/mm.c               | 262 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   6 +-
 5 files changed, 292 insertions(+), 5 deletions(-)

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
index 648d6dd475ba..7f0ac537e86c 100644
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
@@ -4910,6 +4921,254 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
+static void __iomem *subpage_mmio_find_page(mfn_t mfn)
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
+    struct subpage_ro_range *entry = NULL, *iter;
+    unsigned int i;
+
+    entry = subpage_mmio_find_page(mfn);
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
+    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
+    {
+        bool oldbit = __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
+                                        entry->ro_elems);
+        ASSERT(!oldbit);
+    }
+
+    if ( !iter )
+        list_add(&entry->list, &subpage_ro_ranges);
+
+    return iter ? 1 : 0;
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
+write_ignored:
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
@@ -4928,6 +5187,9 @@ int cf_check mmio_ro_emulated_write(
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

