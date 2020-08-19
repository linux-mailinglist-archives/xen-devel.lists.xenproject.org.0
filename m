Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8AF24A466
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RKB-0003nb-E9; Wed, 19 Aug 2020 16:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RKA-0003kZ-KY
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:30 +0000
X-Inumbo-ID: 4e0e270c-728b-40c8-b4a1-e30d4472be23
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e0e270c-728b-40c8-b4a1-e30d4472be23;
 Wed, 19 Aug 2020 16:52:21 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x12so18308891qtp.1
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=8SYC8sEnMQTsHzsw/bx/BLngdPeGac6jdXJvvh92/2k=;
 b=YdvE7fnE4fXmnC+AL4dirmXy6rFjNOVTUiQZ0fVL5Z5J9b3Cje8Zcg4vr4CHYuYhb1
 7uq0Aje58DADmqsa3WZDdSTCR9WM636LghCWxGCfMda04/yVa/yhIwBzXZMc+JCQ8g5m
 nqEW9kUjt7p9AhUnMtITqBboj/0nXoteYItDpZxNe1WfVSVjaPAoeYm8U4GEeI0yJxmC
 hSM4p9EsrN73/E/LmkGwIao3X0OSoSNUauiC+NJucGWuaKhZAHDauFhXIUo/gkT2HpTB
 b9Q7Z1sQUgRinCp3id3CHt7UVFt/kIg868oQmh4NdJGaCTKXUZMWvsJsoIj0mPyGiGPy
 QIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=8SYC8sEnMQTsHzsw/bx/BLngdPeGac6jdXJvvh92/2k=;
 b=WyKtfn7mhLzb1J/vHHlQ4Qg5Rgh9ig0h2NpOQyOtKlBvM4tbUmVFpr/nvxbEL6ZUIX
 v8Cc5eJWk4maYAKnGrAqDGq2Amt6z59rcpnhE5qanBvSvn8NzJn2fuCIlAor1x2PqA87
 bEH7Weuu0uCRCckRy7iPWa+rNBIWv/gXtVj5xonx+NUcFwLHR818idcToT9xQuFv+I5I
 AtwlRco1aSuvzPe0rohjWIzreIiBTtBgpDGzxvVug78StZixDPRdZZQfYkwFv9DNXj0d
 k+hnt/9uWVSDQmTfsEPifKQI/f6cipOqhudK1CBq4qP8pWVwx5X1u8lz3VsCUbjlEiHW
 z+lg==
X-Gm-Message-State: AOAM5308+YZQxuG8Mh2SHvIjARyLz1zu76r+UrHHfufH+qQcsSkj9NHw
 Sy/yZZaE51yu9BDc4LKpuQI+obnpIm7QUu3u
X-Google-Smtp-Source: ABdhPJzlcFdccey/j/56pBX2TIswRx3uE9pXL3vzRNKKZGunQfi0TvE2d80UfVZ32hTKuYIVyWUs9w==
X-Received: by 2002:ac8:4514:: with SMTP id q20mr23701170qtn.122.1597855940174; 
 Wed, 19 Aug 2020 09:52:20 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:19 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <dslutz@verizon.com>, Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 2/8] xen: Add support for VMware cpuid
 leaves
Date: Wed, 19 Aug 2020 12:51:56 -0400
Message-Id: <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <dslutz@verizon.com>

This is done by adding xen_arch_domainconfig vmware_hw. It is set to
the VMware virtual hardware version.

Currently 0, 3-4, 6-11 are good values.  However the
code only checks for == 0 or != 0 or >= 7.

If non-zero then
  Return VMware's cpuid leaves.  If >= 7 return data, else
  return 0.

The support of hypervisor cpuid leaves has not been agreed to.

MicroSoft Hyper-V (AKA viridian) currently must be at 0x40000000.

VMware currently must be at 0x40000000.

KVM currently must be at 0x40000000 (from Seabios).

Xen can be found at the first otherwise unused 0x100 aligned
offset between 0x40000000 and 0x40010000.

http://download.microsoft.com/download/F/B/0/FB0D01A3-8E3A-4F5F-AA59-08C8026D3B8A/requirements-for-implementing-microsoft-hypervisor-interface.docx

http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1009458

http://lwn.net/Articles/301888/
  Attempted to get this cleaned up.

So based on this, I picked the order:

Xen at 0x40000000 or
Viridian or VMware at 0x40000000 and Xen at 0x40000100

If both Viridian and VMware selected, report an error.

Since I need to change xen/arch/x86/hvm/Makefile; also add
a newline at end of file.

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tools side only: Acked-by: Ian Campbell <ian.campbell@citrix.com>

v14:
  Reworked to current code.
  Changed vmware_hwver to 32 bits

v13:
  Adjust temporary comment to include which patch.
  Adjust copyright year to 2012-2015

v12:
  No change

v11:
  Adjust /* Disallow if vmware_hwver */
  Newline after break;
  Added Reviewed-by: Andrew Cooper.
    It would be worth to add an explicit vmware_hwver = 0 in the
    libxl__arch_domain_prepare_config.
 Note: Adds a tool change to this patch.

v10:
    Did not add "Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>"
    because of changes here to do things the new way.
  Reword comment message to reflect new way.

v9:
    s/vmware_hw/vmware_hwver/i
    Change -EXDEV to EOPNOTSUPP.
      Done.
    adding another subdirectory: xen/arch/x86/hvm/vmware
    Much will depend on the discussion of the subsequent patches.
      TBD.
    So for versions < 7 there's effectively no CPUID support at all?
      Changed to check at entry.
    The comment /* Params for VMware */ seems wrong...
      Changed to /* emulated VMware Hardware Version */
    Also please use d, not _d in #define is_vmware_domain()
      Changed.  Line is now > 80 characters, so split into 2.

v7:
      Prevent setting of HVM_PARAM_VIRIDIAN if HVM_PARAM_VMWARE_HW set.
v5:
      Given how is_viridian and is_vmware are defined I think '||' is more
      appropriate.
        Fixed.
      The names of all three functions are bogus.
        removed static support routines.
      This hunk is unrelated, but is perhaps something better fixed.
        Added to commit message.
      include <xen/types.h> (IIRC) please.
        Done.
      At least 1 pair of brackets please, especially as the placement of
      brackets affects the result of this particular calculation.
        Switch to "1000000ull / APIC_BUS_CYCLE_NS"      

 tools/libxl/libxl_x86.c           |  2 +
 xen/arch/x86/cpuid.c              |  4 ++
 xen/arch/x86/domain.c             |  5 +++
 xen/arch/x86/hvm/Makefile         |  1 +
 xen/arch/x86/hvm/hvm.c            |  8 ++++
 xen/arch/x86/hvm/vmware/Makefile  |  1 +
 xen/arch/x86/hvm/vmware/vmware.c  | 82 +++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/traps.c              | 21 ++++++----
 xen/include/asm-x86/hvm/domain.h  |  3 ++
 xen/include/asm-x86/hvm/hvm.h     | 15 +++++++
 xen/include/asm-x86/hvm/vmware.h  | 33 ++++++++++++++++
 xen/include/public/arch-x86/xen.h |  1 +
 12 files changed, 169 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/x86/hvm/vmware/Makefile
 create mode 100644 xen/arch/x86/hvm/vmware/vmware.c
 create mode 100644 xen/include/asm-x86/hvm/vmware.h

diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index e57f632..3418a81 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -21,6 +21,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         abort();
     }
 
+    /* Note: will be changed in next patch (tools: Add ...). */
+    config->arch.vmware_hwver = 0;
     return 0;
 }
 
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 63a03ef..6cd3670 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -8,6 +8,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/viridian.h>
+#include <asm/hvm/vmware.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/paging.h>
 #include <asm/processor.h>
@@ -791,6 +792,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         if ( is_viridian_domain(d) )
             return cpuid_viridian_leaves(v, leaf, subleaf, res);
 
+        if ( has_vmware_cpuid(d) )
+            return cpuid_vmware_leaves(v, leaf, subleaf, res);
+
         /*
          * Fallthrough.
          *
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d1ecc7b..a317907 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -597,6 +597,11 @@ int arch_domain_create(struct domain *d,
     }
     d->arch.emulation_flags = emflags;
 
+    if ( is_hvm_domain(d) )
+    {
+        d->arch.hvm.vmware_hwver = config->arch.vmware_hwver;
+    }
+
     HYPERVISOR_COMPAT_VIRT_START(d) =
         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
 
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 3464191..58de573 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,7 @@
 obj-y += svm/
 obj-y += vmx/
 obj-y += viridian/
+obj-y += vmware/
 
 obj-y += asid.o
 obj-y += dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index a9d1685..e91169f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -68,6 +68,7 @@
 #include <asm/hvm/viridian.h>
 #include <asm/hvm/vm_event.h>
 #include <asm/altp2m.h>
+#include <asm/hvm/vmware.h>
 #include <asm/mtrr.h>
 #include <asm/apic.h>
 #include <asm/vm_event.h>
@@ -4109,6 +4110,13 @@ static int hvm_allow_set_param(struct domain *d,
     {
     /* The following parameters should only be changed once. */
     case HVM_PARAM_VIRIDIAN:
+        /* Disallow if vmware_hwver is in use */
+        if ( d->arch.hvm.vmware_hwver )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
+        /* Fall through */
     case HVM_PARAM_IOREQ_PFN:
     case HVM_PARAM_BUFIOREQ_PFN:
     case HVM_PARAM_IOREQ_SERVER_PFN:
diff --git a/xen/arch/x86/hvm/vmware/Makefile b/xen/arch/x86/hvm/vmware/Makefile
new file mode 100644
index 0000000..f864486
--- /dev/null
+++ b/xen/arch/x86/hvm/vmware/Makefile
@@ -0,0 +1 @@
+obj-y += vmware.o
diff --git a/xen/arch/x86/hvm/vmware/vmware.c b/xen/arch/x86/hvm/vmware/vmware.c
new file mode 100644
index 0000000..19e52c1
--- /dev/null
+++ b/xen/arch/x86/hvm/vmware/vmware.c
@@ -0,0 +1,82 @@
+/*
+ * arch/x86/hvm/vmware/cpuid.c
+ *
+ * Copyright (C) 2012-2015 Verizon Corporation
+ *
+ * This file is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License Version 2 (GPLv2)
+ * as published by the Free Software Foundation.
+ *
+ * This file is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details. <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <xen/version.h>
+#include <xen/hypercall.h>
+#include <xen/domain_page.h>
+#include <xen/param.h>
+#include <asm/guest_access.h>
+#include <asm/guest/hyperv-tlfs.h>
+#include <asm/paging.h>
+#include <asm/p2m.h>
+#include <asm/apic.h>
+#include <asm/hvm/support.h>
+#include <public/sched.h>
+#include <public/hvm/hvm_op.h>
+
+/*
+ * VMware hardware version 7 defines some of these cpuid levels,
+ * below is a brief description about those.
+ *
+ *     Leaf 0x40000000, Hypervisor CPUID information
+ * # EAX: The maximum input value for hypervisor CPUID info (0x40000010).
+ * # EBX, ECX, EDX: Hypervisor vendor ID signature. E.g. "VMwareVMware"
+ *
+ *     Leaf 0x40000010, Timing information.
+ * # EAX: (Virtual) TSC frequency in kHz.
+ * # EBX: (Virtual) Bus (local apic timer) frequency in kHz.
+ * # ECX, EDX: RESERVED
+ */
+
+void cpuid_vmware_leaves(const struct vcpu *v, uint32_t leaf,
+                         uint32_t subleaf, struct cpuid_leaf *res)
+{
+    struct domain *d = current->domain;
+
+    ASSERT(has_vmware_cpuid(d));
+    ASSERT(leaf >= 0x40000000 && leaf < 0x40000100);
+
+    leaf -= 0x40000000;
+
+    switch ( leaf )
+    {
+    case 0x0:
+        res->a = 0x40000010; /* Maximum leaf */
+        memcpy(&res->b, "VMwa", 4);
+        memcpy(&res->c, "reVM", 4);
+        memcpy(&res->d, "ware", 4);
+        break;
+
+    case 0x10:
+        /* (Virtual) TSC frequency in kHz. */
+        res->a = d->arch.tsc_khz;
+        /* (Virtual) Bus (local apic timer) frequency in kHz. */
+        res->b = 1000000ull / APIC_BUS_CYCLE_NS;
+        res->c = 0;          /* Reserved */
+        res->d = 0;          /* Reserved */
+        break;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index bc5b8f8..b1e93bb 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -885,8 +885,11 @@ static void do_trap(struct cpu_user_regs *regs)
 int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val)
 {
     const struct domain *d = v->domain;
-    /* Optionally shift out of the way of Viridian architectural MSRs. */
-    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
+    /*
+     * Optionally shift out of the way of Viridian or VMware
+     * architectural leaves.
+     */
+    uint32_t base = is_viridian_or_vmware_cpuid(d) ? 0x40000200 : 0x40000000;
 
     switch ( idx - base )
     {
@@ -901,8 +904,11 @@ int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val)
 int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val)
 {
     struct domain *d = v->domain;
-    /* Optionally shift out of the way of Viridian architectural MSRs. */
-    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
+    /*
+     * Optionally shift out of the way of Viridian or VMware
+     * architectural leaves.
+     */
+    uint32_t base = is_viridian_or_vmware_cpuid(d) ? 0x40000200 : 0x40000000;
 
     switch ( idx - base )
     {
@@ -959,9 +965,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
 {
     const struct domain *d = v->domain;
     const struct cpuid_policy *p = d->arch.cpuid;
-    uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
+    uint32_t base = is_viridian_or_vmware_cpuid(d) ? 0x40000100 : 0x40000000;
     uint32_t idx  = leaf - base;
-    unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
+    unsigned int limit = is_viridian_or_vmware_cpuid(d) ?
+        p->hv2_limit : p->hv_limit;
 
     if ( limit == 0 )
         /* Default number of leaves */
@@ -989,7 +996,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
     case 2:
         res->a = 1;            /* Number of hypercall-transfer pages */
                                /* MSR base address */
-        res->b = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
+        res->b = is_viridian_or_vmware_cpuid(d) ? 0x40000200 : 0x40000000;
         if ( is_pv_domain(d) ) /* Features */
             res->c |= XEN_CPUID_FEAT1_MMU_PT_UPDATE_PRESERVE_AD;
         break;
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 9d247ba..0f64a4b 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -147,6 +147,9 @@ struct hvm_domain {
 
     uint64_t              *params;
 
+    /* emulated VMware Hardware Version */
+    uint32_t               vmware_hwver;
+
     /* Memory ranges with pinned cache attributes. */
     struct list_head       pinned_cacheattr_ranges;
 
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index be0d8b0..cb55dfb 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -474,6 +474,18 @@ static inline bool hvm_get_guest_bndcfgs(struct vcpu *v, u64 *val)
 #define has_viridian_synic(d) \
     (is_viridian_domain(d) && (viridian_feature_mask(d) & HVMPV_synic))
 
+#define vmware_feature_mask(d) \
+    ((d)->arch.hvm.vmware_hwver)
+
+#define is_vmware_domain(d) \
+    (is_hvm_domain(d) && vmware_feature_mask(d))
+
+#define has_vmware_cpuid(d) \
+    (is_hvm_domain(d) && (vmware_feature_mask(d) >= 7))
+
+#define is_viridian_or_vmware_cpuid(d) \
+    (is_viridian_domain(d) || has_vmware_cpuid(d))
+
 static inline void hvm_inject_exception(
     unsigned int vector, unsigned int type,
     unsigned int insn_len, int error_code)
@@ -754,6 +766,9 @@ static inline bool hvm_has_set_descriptor_access_exiting(void)
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
+#define is_vmware_domain(d) ((void)(d), false)
+#define has_vmware_cpuid(d) ((void)(d), false)
+#define is_viridian_or_vmware_cpuid(d) ((void)(d), false)
 #define hvm_long_mode_active(v) ((void)(v), false)
 #define hvm_get_guest_time(v) ((void)(v), 0)
 
diff --git a/xen/include/asm-x86/hvm/vmware.h b/xen/include/asm-x86/hvm/vmware.h
new file mode 100644
index 0000000..98248e7
--- /dev/null
+++ b/xen/include/asm-x86/hvm/vmware.h
@@ -0,0 +1,33 @@
+/*
+ * asm-x86/hvm/vmware.h
+ *
+ * Copyright (C) 2012-2015 Verizon Corporation
+ *
+ * This file is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License Version 2 (GPLv2)
+ * as published by the Free Software Foundation.
+ *
+ * This file is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details. <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef ASM_X86_HVM_VMWARE_H__
+#define ASM_X86_HVM_VMWARE_H__
+
+#include <xen/types.h>
+
+void cpuid_vmware_leaves(const struct vcpu *v, uint32_t leaf,
+                         uint32_t subleaf, struct cpuid_leaf *res);
+
+#endif /* ASM_X86_HVM_VMWARE_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 629cb2b..54b1c4d 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -304,6 +304,7 @@ struct xen_arch_domainconfig {
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
                                      XEN_X86_EMU_VPCI)
     uint32_t emulation_flags;
+    uint32_t vmware_hwver;
 };
 
 /* Location of online VCPU bitmap. */
-- 
1.8.3.1


