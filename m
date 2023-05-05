Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62B6F8AE6
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 23:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530652.826402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv2wP-0007Vm-HC; Fri, 05 May 2023 21:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530652.826402; Fri, 05 May 2023 21:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv2wP-0007Rv-D0; Fri, 05 May 2023 21:26:13 +0000
Received: by outflank-mailman (input) for mailman id 530652;
 Fri, 05 May 2023 21:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMjG=A2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pv2wN-0007NI-P1
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 21:26:11 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6caaa018-eb8b-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 23:26:01 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2E3833200925;
 Fri,  5 May 2023 17:25:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 05 May 2023 17:25:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 17:25:55 -0400 (EDT)
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
X-Inumbo-ID: 6caaa018-eb8b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683321956; x=1683408356; bh=o3
	13F4hQU5uB9lSLjfIs/1QY2b4KHS2capUoYZqcCPE=; b=YbtXIMljxxLWmuYvxf
	y1JLmQC7zAOrNuWB4kWv9vRaC5WRRAjHJcAZXfo2InEXMZNa8HnDkXWfF6mh5VIK
	EX9J8INupy/u1s7+1JiVPIXsTJqRRMPATUV07MMXlWLsFT0xV/L44PNOcxvOB4rn
	+fIhVUWLMq8JdlCyzxX84w/rQbSRgE//T2M8kIDEK0rB0LioBF3EzawWbjBy8NO7
	L7vjcvY8hkT8JoDsQF3Vic3vTmJZfcoeUkZU6orpMY1jRT1EIMly0ZHAPOnbMhjL
	Qkbd7GzDZX8Vc2CpzAFhBw20RJzzdohKmJo40ZsHes43EOjhpcGzVWlLaHPor4QG
	MA5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683321956; x=1683408356; bh=o313F4hQU5uB9lSLjfIs/1QY2b4KHS2capU
	oYZqcCPE=; b=iIVEDxKz2wS0FPUx5c/Huwdjf/aMYHODZN3qBIYt6neXuDVowjq
	qJOrajoHVZws9Ep9klcHQPhZr/lex1RH5kbw5sVei8dcsI2wTwTeU3A6xvOMQaQ7
	6SRBQcceM14/GMe9iY+qAW3h2afXezUp5xHi511DC1KLCP+IbZ0qBVUfXItBwLPj
	sGZlFQcDG1YcRsXyVj4O7aLUVPeeomEJLsgmDzb/2Rn0Cy6GL4StXdqs5RHgtMCY
	+wctBroiIQViiIOZDN+xNW6ExmlQ23LGG82KnBdgJCWuFEWzhrY4TCF+vvG7m9h+
	9NudkzDHpj7otKZDNmoN2E50GZcHZT9b+YA==
X-ME-Sender: <xms:ZHRVZFm2aigSdEM08qsCJG1-OATRORFzzX4V8PgGGRH_pK9EnLPtcg>
    <xme:ZHRVZA22RaVY-6kd8OZ4NaW6K5gB-jsjtvRlSVA7joJhkSPX7pRvnReUMXSFBYjft
    D9rxxJk8qK8sA>
X-ME-Received: <xmr:ZHRVZLqJmhGYAnzKYgRb0N1LuO4b65z8AQ9QtSd3ZBvPzRRrd8vqJuGxFexVGCprtkvbfwQcAGSr8fV87_ZkJRiLgxVwtkcreQtIe40L4LMGZTmNC-o4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgudeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ZHRVZFks5d5mzW6DTyeyNsE_HfmnKABIZbJQuOOwsi4ghaN-aQ0kHA>
    <xmx:ZHRVZD2cuxnDHDxU7AcqpVerjUPazXc5vrpTTAszYIx_TKPFN2QW5g>
    <xmx:ZHRVZEvwYvKtq4RDm3OIv27B2rGbHFYSIJUE3-hM239VP2hb2RXEMQ>
    <xmx:ZHRVZOTrLZcPMT_NvcGgvJyN5AcU7b0AdvaJ1siS89vBgBXZnac1GQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO page read only
Date: Fri,  5 May 2023 23:25:35 +0200
Message-Id: <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
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
dwords are supposed to be read-only and an address where page is mapped
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
write and finally calls mmio_ro_emulated_write(). Note that hitting EPT
write violation for p2m_mmio_direct page can only happen if the page was
on mmio_ro_ranges (see ept_p2m_type_to_flags()), so there is no need for
checking that again.
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
 xen/arch/x86/include/asm/mm.h   |  15 ++-
 xen/arch/x86/mm.c               | 253 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   1 +-
 5 files changed, 278 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 75ee98a73be8..0a64636fd9da 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2732,7 +2732,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
         .write      = mmio_ro_emulated_write,
         .validate   = hvmemul_validate,
     };
-    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
+    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
     struct hvm_emulate_ctxt ctxt;
     const struct x86_emulate_ops *ops;
     unsigned int seg, bdf;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d7d31b53937a..0ed7ce31d5cf 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1990,6 +1990,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
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
index db29e3e2059f..3867a92d2dfa 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -522,9 +522,24 @@ extern struct rangeset *mmio_ro_ranges;
 void memguard_guard_stack(void *p);
 void memguard_unguard_stack(void *p);
 
+/*
+ * Add more precise r/o marking for a MMIO page. Bytes range specified here
+ * will still be R/O, but the rest of the page (nor marked as R/O via another
+ * call) will have writes passed through.
+ * The start address and the size must be aligned to SUBPAGE_MMIO_RO_ALIGN.
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
index 9741d28cbc96..59941a56c821 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -154,6 +154,19 @@ bool __read_mostly machine_to_phys_mapping_valid;
 
 struct rangeset *__read_mostly mmio_ro_ranges;
 
+/* Handling sub-page read-only MMIO regions */
+struct subpage_ro_range {
+    struct list_head list;
+    mfn_t mfn;
+    void __iomem *mapped;
+    DECLARE_BITMAP(ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN);
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
@@ -4882,6 +4895,243 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return 0;
 }
 
+/* This needs subpage_ro_lock already taken */
+static int __init subpage_mmio_ro_add_page(
+    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
+{
+    struct subpage_ro_range *entry = NULL, *iter;
+    int i;
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
+        /* iter==NULL marks it was a newly allocated entry */
+        iter = NULL;
+        entry = xzalloc(struct subpage_ro_range);
+        if ( !entry )
+            return -ENOMEM;
+        entry->mfn = mfn;
+    }
+
+    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
+        set_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
+
+    if ( !iter )
+        list_add_rcu(&entry->list, &subpage_ro_ranges);
+
+    return 0;
+}
+
+static void __init subpage_mmio_ro_free(struct rcu_head *rcu)
+{
+    struct subpage_ro_range *entry = container_of(
+        rcu, struct subpage_ro_range, rcu);
+
+    ASSERT(bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN));
+
+    if ( entry->mapped )
+        iounmap(entry->mapped);
+    xfree(entry);
+}
+
+/* This needs subpage_ro_lock already taken */
+static int __init subpage_mmio_ro_remove_page(
+    mfn_t mfn,
+    int offset_s,
+    int offset_e)
+{
+    struct subpage_ro_range *entry = NULL, *iter;
+    int rc, i;
+
+    list_for_each_entry_rcu(iter, &subpage_ro_ranges, list)
+    {
+        if ( mfn_eq(iter->mfn, mfn) )
+        {
+            entry = iter;
+            break;
+        }
+    }
+    if ( !entry )
+        return -ENOENT;
+
+    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
+        clear_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
+
+    if ( !bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN) )
+        return 0;
+
+    list_del_rcu(&entry->list);
+    call_rcu(&entry->rcu, subpage_mmio_ro_free);
+    return rc;
+}
+
+
+int __init subpage_mmio_ro_add(
+    paddr_t start,
+    size_t size)
+{
+    mfn_t mfn_start = maddr_to_mfn(start);
+    paddr_t end = start + size - 1;
+    mfn_t mfn_end = maddr_to_mfn(end);
+    int offset_end = 0;
+    int rc;
+
+    ASSERT(IS_ALIGNED(start, SUBPAGE_MMIO_RO_ALIGN));
+    ASSERT(IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN));
+
+    if ( !size )
+        return 0;
+
+    rc = rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end));
+    if ( rc )
+        return rc;
+
+    spin_lock(&subpage_ro_lock);
+
+    if ( PAGE_OFFSET(start) ||
+         (mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) != PAGE_SIZE - 1) )
+    {
+        offset_end = mfn_eq(mfn_start, mfn_end) ?
+                     PAGE_OFFSET(end) :
+                     (PAGE_SIZE - 1);
+        rc = subpage_mmio_ro_add_page(mfn_start,
+                                      PAGE_OFFSET(start),
+                                      offset_end);
+        if ( rc )
+            goto err_unlock;
+    }
+
+    if ( !mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) != PAGE_SIZE - 1 )
+    {
+        rc = subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
+        if ( rc )
+            goto err_unlock_remove;
+    }
+
+    spin_unlock(&subpage_ro_lock);
+
+    return 0;
+
+ err_unlock_remove:
+    if ( offset_end )
+        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), offset_end);
+
+ err_unlock:
+    spin_unlock(&subpage_ro_lock);
+    if ( rangeset_remove_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end)) )
+        printk(XENLOG_ERR "Failed to cleanup on failed subpage_mmio_ro_add()\n");
+    return rc;
+}
+
+static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *entry)
+{
+    if ( entry->mapped )
+        return entry->mapped;
+
+    spin_lock(&subpage_ro_lock);
+    /* Re-check under the lock */
+    if ( entry->mapped )
+        goto out_unlock;
+
+    entry->mapped = ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE);
+
+ out_unlock:
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
+    rcu_read_lock(&subpage_ro_rcu);
+
+    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
+    {
+        if ( mfn_eq(entry->mfn, mfn) )
+        {
+            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
+                goto write_ignored;
+
+            addr = subpage_mmio_get_page(entry);
+            if ( !addr )
+            {
+                gprintk(XENLOG_ERR,
+                        "Failed to map page for MMIO write at 0x%"PRI_mfn"%03x\n",
+                        mfn_x(mfn), offset);
+                goto out_unlock;
+            }
+
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
+                goto write_ignored;
+            }
+            goto out_unlock;
+        }
+    }
+    /* Do not print message for pages without any writable parts. */
+    goto out_unlock;
+
+ write_ignored:
+    gprintk(XENLOG_WARNING,
+             "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
+             mfn_x(mfn), offset, len);
+
+ out_unlock:
+    rcu_read_unlock(&subpage_ro_rcu);
+}
+
+bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
+{
+    unsigned int offset = PAGE_OFFSET(gla);
+    const struct subpage_ro_range *entry;
+
+    rcu_read_lock(&subpage_ro_rcu);
+
+    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
+        if ( mfn_eq(entry->mfn, mfn) &&
+             !test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
+        {
+            /*
+             * We don't know the write seize at this point yet, so it could be
+             * an unalligned write, but accept it here anyway and deal with it
+             * later.
+             */
+            rcu_read_unlock(&subpage_ro_rcu);
+            return true;
+        }
+
+    rcu_read_unlock(&subpage_ro_rcu);
+    return false;
+}
+
 int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
@@ -4900,6 +5150,9 @@ int cf_check mmio_ro_emulated_write(
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

