Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2131BF404
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 11:18:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU5KJ-0008Iq-30; Thu, 30 Apr 2020 09:17:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gX9=6O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jU5KH-0008Il-QG
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 09:17:49 +0000
X-Inumbo-ID: 757ff7ed-8ac3-11ea-9a12-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 757ff7ed-8ac3-11ea-9a12-12813bfff9fa;
 Thu, 30 Apr 2020 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588238268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3tElwOR5SMvygmh076A/T3p277AnxQXNp6ZmGgUyWcs=;
 b=EiHyYPXS4L+0jtD/Rysju4C/LUMqiHS53ufV1HX+8D5sj8RvAU++aOxA
 oHPCNY96MR9zSsmXygzgHDUPdkQVc3pzrQaH7IBX5YGP0HwfgfSDnGpPU
 z2vSGQcucLzqbG+JRCdlWpnzJxbL8trTHCwF1UP9kg/45Z7J61fXm+pTW k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: El3z5Pex9n1Vnt4iBED7+gKnfwSD+n80nkFwZBKKJeHx72O4VmnQQJopwFqDF1jVYu3hvQ6vRx
 fax7vP/VNOhqVsylSpv8nRmRXuGD/14Xk1HNIi+TaP9wbABNoPhGxLEPdlaXZIQrndvyTj7btL
 whjTfyK3ouxXHwoOZ7WQkPjpTPh1hKd/CA7PqOWG+7Eg0p4Shv1nX0ErAvledG7qaRWVWb0thF
 uaQyy+zPRVDLpPFd3HRMo2pm7/J6PY9b3eNMQrz9wU97zdPmANojtlVhgC7RuS5gYcJdvl0UGa
 /Kw=
X-SBRS: 2.7
X-MesageID: 16893124
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,334,1583211600"; d="scan'208";a="16893124"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hvm: allow for more fine grained assisted flush
Date: Thu, 30 Apr 2020 11:17:25 +0200
Message-ID: <20200430091725.80656-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Improve the assisted flush by expanding the interface and allowing for
more fine grained TLB flushes to be issued using the HVMOP_flush_tlbs
hypercall. Support for such advanced flushes is signaled in CPUID
using the XEN_HVM_CPUID_ADVANCED_FLUSH flag.

The new features make use of the NULL parameter so far passed in the
hypercall in order to convey extra data to perform more selective
flushes: a virtual address, an order field, a flags field and finally a
vCPU bitmap. Note that not all features are implemented as part of
this patch, but are already added to the interface in order to avoid
having to introduce yet a new CPUID flag when the new features are
added.

The feature currently implemented is the usage of a guest provided
vCPU bitmap in order to signal which vCPUs require a TLB flush,
instead of assuming all vCPUs must be flushed. Note that not
implementing the rest of the features just make the flush less
efficient, but it's still correct and safe.

Finally add support for Xen running in guest mode (Xen on Xen or PV
shim mode) to use the newly introduced flush options when available.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/guest/xen/xen.c        | 22 +++++++++++++++++-
 xen/arch/x86/hvm/hvm.c              | 35 ++++++++++++++++++++++++-----
 xen/arch/x86/traps.c                |  4 +++-
 xen/include/public/arch-x86/cpuid.h |  2 ++
 xen/include/public/hvm/hvm_op.h     | 23 ++++++++++++++++++-
 5 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 2ff63d370a..310ce0c6fb 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -326,7 +326,27 @@ static void __init e820_fixup(struct e820map *e820)
 
 static int flush_tlb(const cpumask_t *mask, const void *va, unsigned int flags)
 {
-    return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
+    xen_hvm_flush_tlbs_t op = {
+        .va = (unsigned long)va,
+        .order = (flags - 1) & FLUSH_ORDER_MASK,
+        .flags = ((flags & FLUSH_TLB_GLOBAL) ? HVMOP_flush_global : 0) |
+                 ((flags & FLUSH_VA_VALID) ? HVMOP_flush_va_valid : 0),
+        .mask_size = BITS_TO_LONGS(nr_cpu_ids),
+    };
+    static int8_t __read_mostly advanced_flush = -1;
+
+    if ( advanced_flush == -1 )
+    {
+        uint32_t eax, ebx, ecx, edx;
+
+        ASSERT(xen_cpuid_base);
+        cpuid(xen_cpuid_base + 4, &eax, &ebx, &ecx, &edx);
+        advanced_flush = (eax & XEN_HVM_CPUID_ADVANCED_FLUSH) ? 1 : 0;
+    }
+
+    set_xen_guest_handle(op.vcpu_mask, cpumask_bits(mask));
+
+    return xen_hypercall_hvm_op(HVMOP_flush_tlbs, advanced_flush ? &op : NULL);
 }
 
 static const struct hypervisor_ops __initconstrel ops = {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 814b7020d8..1d41b6e2ea 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4011,17 +4011,42 @@ static void hvm_s3_resume(struct domain *d)
     }
 }
 
-static bool always_flush(void *ctxt, struct vcpu *v)
+static bool flush_check(void *mask, struct vcpu *v)
 {
-    return true;
+    return mask ? test_bit(v->vcpu_id, (unsigned long *)mask) : true;
 }
 
-static int hvmop_flush_tlb_all(void)
+static int hvmop_flush_tlb(XEN_GUEST_HANDLE_PARAM(xen_hvm_flush_tlbs_t) uop)
 {
+    xen_hvm_flush_tlbs_t op;
+    DECLARE_BITMAP(mask, HVM_MAX_VCPUS) = { };
+    bool valid_mask = false;
+
     if ( !is_hvm_domain(current->domain) )
         return -EINVAL;
 
-    return paging_flush_tlb(always_flush, NULL) ? 0 : -ERESTART;
+    if ( !guest_handle_is_null(uop) )
+    {
+        if ( copy_from_guest(&op, uop, 1) )
+            return -EFAULT;
+
+        /*
+         * TODO: implement support for the other features present in
+         * xen_hvm_flush_tlbs_t: flushing a specific virtual address and not
+         * flushing global mappings.
+         */
+
+        if ( op.mask_size > ARRAY_SIZE(mask) )
+            return -EINVAL;
+
+        if ( copy_from_guest(mask, op.vcpu_mask, op.mask_size) )
+            return -EFAULT;
+
+        valid_mask = true;
+    }
+
+    return paging_flush_tlb(flush_check, valid_mask ? mask : NULL) ? 0
+                                                                   : -ERESTART;
 }
 
 static int hvmop_set_evtchn_upcall_vector(
@@ -5017,7 +5042,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
 
     case HVMOP_flush_tlbs:
-        rc = guest_handle_is_null(arg) ? hvmop_flush_tlb_all() : -EINVAL;
+        rc = hvmop_flush_tlb(guest_handle_cast(arg, xen_hvm_flush_tlbs_t));
         break;
 
     case HVMOP_get_mem_type:
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e838846c6b..b07da2fd33 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -966,8 +966,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         /*
          * Indicate that memory mapped from other domains (either grants or
          * foreign pages) has valid IOMMU entries.
+         *
+         * Also signal support for more selective assisted flush support.
          */
-        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
+        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS | XEN_HVM_CPUID_ADVANCED_FLUSH;
 
         /* Indicate presence of vcpu id and set it in ebx */
         res->a |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index ce46305bee..b980ed91f6 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -102,6 +102,8 @@
 #define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
 #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
 #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
+/* Supports more fine grained assisted flush, see HVMOP_flush_tlbs. */
+#define XEN_HVM_CPUID_ADVANCED_FLUSH   (1u << 5)
 
 /*
  * Leaf 6 (0x40000x05)
diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index 870ec52060..ca6ae678bc 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -99,8 +99,29 @@ DEFINE_XEN_GUEST_HANDLE(xen_hvm_set_pci_link_route_t);
 
 #endif /* __XEN_INTERFACE_VERSION__ < 0x00040900 */
 
-/* Flushes all VCPU TLBs: @arg must be NULL. */
+/*
+ * Flushes all VCPU TLBs: @arg can be NULL or xen_hvm_flush_tlbs_t.
+ *
+ * Support for passing a xen_hvm_flush_tlbs_t parameter is signaled in CPUID,
+ * see XEN_HVM_CPUID_ADVANCED_FLUSH.
+ */
 #define HVMOP_flush_tlbs          5
+struct xen_hvm_flush_tlbs {
+    /* Virtual address to be flushed. */
+    uint64_t va;
+    uint16_t order;
+    uint16_t flags;
+/* Flush global mappings. */
+#define HVMOP_flush_global      (1u << 0)
+/* VA for the flush has a valid mapping. */
+#define HVMOP_flush_va_valid    (1u << 1)
+    /* Number of uint64_t elements in vcpu_mask. */
+    uint32_t mask_size;
+    /* Bitmask of vcpus that should be flushed. */
+    XEN_GUEST_HANDLE(const_uint64) vcpu_mask;
+};
+typedef struct xen_hvm_flush_tlbs xen_hvm_flush_tlbs_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_flush_tlbs_t);
 
 /*
  * hvmmem_type_t should not be defined when generating the corresponding
-- 
2.26.0


