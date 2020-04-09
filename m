Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2F1A390B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 19:41:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMbB8-0005rZ-4Q; Thu, 09 Apr 2020 17:41:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Iid=5Z=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jMbB6-0005rE-UR
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 17:41:24 +0000
X-Inumbo-ID: 4de4d7ba-7a89-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4de4d7ba-7a89-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 17:41:12 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v8so3051587wma.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2F2O9s9Zc4ZX68a+NmydCfhV6kbxcg3bJyRTM2EJKps=;
 b=PtGMG9droI7XIjQ+z7/jmhIzwj3aDP5imKw8R4niozPTHOihg4ZSsKLJhL2fFMyt//
 uVWy8OsDn+dmphxVETgTfckskIC6WCq7paX317/iT5a3TBfMazokvn6hOU7J12wjl9tb
 QgEQJajBYyMslFm4ljZwBdFghgcfRA9jcgT2/WJABcdHD1H+cqrUUWGHMhaOB+Jg5YCM
 qJhi83TKn/JbG844Zotlppt9h0xXRDsLEFto2DrF+wm4ytp/mATlvMaXkgnO2y1CQImZ
 OGHZXkxzkreP4rnh6NhYXKfTB6eWGL/S7q8p/FORGmgI3DQ8+03hU3C2+RTWDkFwdQZI
 IKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2F2O9s9Zc4ZX68a+NmydCfhV6kbxcg3bJyRTM2EJKps=;
 b=o+he5oSl3+NZgMiVztqaP1jS1P9/YEbsUhJ0uq1HEf8q8f6KVkqGxUIAoZOmMMjHg/
 HMfXU0OBWr/2dPIwTl94JabSX90mIJdoiuroW/waWIOyNVziEWZk8frooXBQX4Jh1imJ
 Cs6qQTix/2CwndCZ7n1fZKjpV8Wtlh2vXmiD9stRZyuz9f62NlDnxnw4863Zdlgl8i0p
 bA40AqoHK6NQE22AzlFY87xlelSKJ3LcHRLO/ANodzhxhHcy9wOCwA0Z0EH8jbQ5uNL8
 BXpIurtHuaIYoqb+zcQw5UsoX7bLKo1w4d2TxpQmE+0Sik1lDhJt/rPYfXxqHcFmiHV0
 9qJA==
X-Gm-Message-State: AGi0PuZfDf0bCSJnTNEK2RHWiP2bzTX90bSQ8L1GIXoHpirPWFlzevbQ
 eUeXsvXBDPq3LWrEjQmOohJrBS2Q
X-Google-Smtp-Source: APiQypKENGDAcq7izSS9ZXcR1OI/JnkXG7tdY5qav/XOGEjtXlBwQZVuieT69eLvsQJbPo/gculqxw==
X-Received: by 2002:a1c:1d84:: with SMTP id d126mr928975wmd.119.1586454071634; 
 Thu, 09 Apr 2020 10:41:11 -0700 (PDT)
Received: from localhost.localdomain (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id
 c18sm40086006wrx.5.2020.04.09.10.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 10:41:11 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH v5 3/3] x86/hyperv: L0 assisted TLB flush
Date: Thu,  9 Apr 2020 18:41:04 +0100
Message-Id: <20200409174104.23946-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409174104.23946-1-liuwe@microsoft.com>
References: <20200409174104.23946-1-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Implement L0 assisted TLB flush for Xen on Hyper-V. It takes advantage
of several hypercalls:

 * HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST
 * HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX
 * HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE
 * HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX

Pick the most efficient hypercalls available.

Signed-off-by: Wei Liu <liuwe@microsoft.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Paul Durrant <pdurrant@amazon.com>
---
v4:
1. Fix bank mask generation.
2. Fix page order calculation.
3. Remove types.h from private.h.
4. Add a note about nmi and mc handling.

v3:
1. Address more comments.
2. Fix usage of max_vp_index.
3. Use the fill_gva_list algorithm from Linux.

v2:
1. Address Roger and Jan's comments re types etc.
2. Fix pointer arithmetic.
3. Misc improvement to code.
---
 xen/arch/x86/guest/hyperv/Makefile  |   1 +
 xen/arch/x86/guest/hyperv/private.h |   8 ++
 xen/arch/x86/guest/hyperv/tlb.c     | 175 +++++++++++++++++++++++++++-
 xen/arch/x86/guest/hyperv/util.c    |  75 ++++++++++++
 4 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/guest/hyperv/util.c

diff --git a/xen/arch/x86/guest/hyperv/Makefile b/xen/arch/x86/guest/hyperv/Makefile
index 18902c33e9..0e39410968 100644
--- a/xen/arch/x86/guest/hyperv/Makefile
+++ b/xen/arch/x86/guest/hyperv/Makefile
@@ -1,2 +1,3 @@
 obj-y += hyperv.o
 obj-y += tlb.o
+obj-y += util.o
diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
index 509bedaafa..354fc7f685 100644
--- a/xen/arch/x86/guest/hyperv/private.h
+++ b/xen/arch/x86/guest/hyperv/private.h
@@ -29,7 +29,15 @@ DECLARE_PER_CPU(void *, hv_input_page);
 DECLARE_PER_CPU(void *, hv_vp_assist);
 DECLARE_PER_CPU(unsigned int, hv_vp_index);
 
+static inline unsigned int hv_vp_index(unsigned int cpu)
+{
+    return per_cpu(hv_vp_index, cpu);
+}
+
 int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
                      unsigned int flags);
 
+/* Returns number of banks, -ev if error */
+int cpumask_to_vpset(struct hv_vpset *vpset, const cpumask_t *mask);
+
 #endif /* __XEN_HYPERV_PRIVIATE_H__  */
diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
index 48f527229e..1d723d6ee6 100644
--- a/xen/arch/x86/guest/hyperv/tlb.c
+++ b/xen/arch/x86/guest/hyperv/tlb.c
@@ -19,17 +19,190 @@
  * Copyright (c) 2020 Microsoft.
  */
 
+#include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/errno.h>
 
+#include <asm/guest/hyperv.h>
+#include <asm/guest/hyperv-hcall.h>
+#include <asm/guest/hyperv-tlfs.h>
+
 #include "private.h"
 
+/*
+ * It is possible to encode up to 4096 pages using the lower 12 bits
+ * in an element of gva_list
+ */
+#define HV_TLB_FLUSH_UNIT (4096 * PAGE_SIZE)
+
+static unsigned int fill_gva_list(uint64_t *gva_list, const void *va,
+                                  unsigned int order)
+{
+    unsigned long cur = (unsigned long)va;
+    /* end is 1 past the range to be flushed */
+    unsigned long end = cur + (PAGE_SIZE << order);
+    unsigned int n = 0;
+
+    do {
+        unsigned long diff = end - cur;
+
+        gva_list[n] = cur & PAGE_MASK;
+
+        /*
+         * Use lower 12 bits to encode the number of additional pages
+         * to flush
+         */
+        if ( diff >= HV_TLB_FLUSH_UNIT )
+        {
+            gva_list[n] |= ~PAGE_MASK;
+            cur += HV_TLB_FLUSH_UNIT;
+        }
+        else
+        {
+            gva_list[n] |= (diff - 1) >> PAGE_SHIFT;
+            cur = end;
+        }
+
+        n++;
+    } while ( cur < end );
+
+    return n;
+}
+
+static uint64_t flush_tlb_ex(const cpumask_t *mask, const void *va,
+                             unsigned int flags)
+{
+    struct hv_tlb_flush_ex *flush = this_cpu(hv_input_page);
+    int nr_banks;
+    unsigned int max_gvas, order = (flags - 1) & FLUSH_ORDER_MASK;
+    uint64_t *gva_list;
+
+    if ( !flush || local_irq_is_enabled() )
+    {
+        ASSERT_UNREACHABLE();
+        return ~0ULL;
+    }
+
+    if ( !(ms_hyperv.hints & HV_X64_EX_PROCESSOR_MASKS_RECOMMENDED) )
+        return ~0ULL;
+
+    flush->address_space = 0;
+    flush->flags = HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES;
+    if ( !(flags & FLUSH_TLB_GLOBAL) )
+        flush->flags |= HV_FLUSH_NON_GLOBAL_MAPPINGS_ONLY;
+
+    nr_banks = cpumask_to_vpset(&flush->hv_vp_set, mask);
+    if ( nr_banks < 0 )
+        return ~0ULL;
+
+    max_gvas =
+        (PAGE_SIZE - sizeof(*flush) - nr_banks *
+         sizeof(flush->hv_vp_set.bank_contents[0])) /
+        sizeof(uint64_t);       /* gva is represented as uint64_t */
+
+    /*
+     * Flush the entire address space if va is NULL or if there is not
+     * enough space for gva_list.
+     */
+    if ( !va || (PAGE_SIZE << order) / HV_TLB_FLUSH_UNIT > max_gvas )
+        return hv_do_rep_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX, 0,
+                                   nr_banks, virt_to_maddr(flush), 0);
+
+    /*
+     * The calculation of gva_list address requires the structure to
+     * be 64 bits aligned.
+     */
+    BUILD_BUG_ON(sizeof(*flush) % sizeof(uint64_t));
+    gva_list = (uint64_t *)flush + sizeof(*flush) / sizeof(uint64_t) + nr_banks;
+
+    return hv_do_rep_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX,
+                               fill_gva_list(gva_list, va, order),
+                               nr_banks, virt_to_maddr(flush), 0);
+}
+
+/* Maximum number of gvas for hv_tlb_flush */
+#define MAX_GVAS ((PAGE_SIZE - sizeof(struct hv_tlb_flush)) / sizeof(uint64_t))
+
 int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
                      unsigned int flags)
 {
-    return -EOPNOTSUPP;
+    unsigned long irq_flags;
+    struct hv_tlb_flush *flush = this_cpu(hv_input_page);
+    unsigned int order = (flags - 1) & FLUSH_ORDER_MASK;
+    uint64_t ret;
+
+    if ( !flush || cpumask_empty(mask) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    /* TODO: may need to check if in #NMI or #MC and fallback to native path */
+
+    local_irq_save(irq_flags);
+
+    flush->address_space = 0;
+    flush->flags = HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES;
+    flush->processor_mask = 0;
+    if ( !(flags & FLUSH_TLB_GLOBAL) )
+        flush->flags |= HV_FLUSH_NON_GLOBAL_MAPPINGS_ONLY;
+
+    if ( cpumask_equal(mask, &cpu_online_map) )
+        flush->flags |= HV_FLUSH_ALL_PROCESSORS;
+    else
+    {
+        unsigned int cpu;
+
+        /*
+         * Normally VP indices are in ascending order and match Xen's
+         * idea of CPU ids. Check the last index to see if VP index is
+         * >= 64. If so, we can skip setting up parameters for
+         * non-applicable hypercalls without looking further.
+         */
+        if ( hv_vp_index(cpumask_last(mask)) >= 64 )
+            goto do_ex_hypercall;
+
+        for_each_cpu ( cpu, mask )
+        {
+            unsigned int vpid = hv_vp_index(cpu);
+
+            if ( vpid >= ms_hyperv.max_vp_index )
+            {
+                local_irq_restore(irq_flags);
+                return -ENXIO;
+            }
+
+            if ( vpid >= 64 )
+                goto do_ex_hypercall;
+
+            __set_bit(vpid, &flush->processor_mask);
+        }
+    }
+
+    /*
+     * Flush the entire address space if va is NULL or if there is not
+     * enough space for gva_list.
+     */
+    if ( !va || (PAGE_SIZE << order) / HV_TLB_FLUSH_UNIT > MAX_GVAS )
+        ret = hv_do_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE,
+                              virt_to_maddr(flush), 0);
+    else
+        ret = hv_do_rep_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST,
+                                  fill_gva_list(flush->gva_list, va, order),
+                                  0, virt_to_maddr(flush), 0);
+    goto done;
+
+ do_ex_hypercall:
+    ret = flush_tlb_ex(mask, va, flags);
+
+ done:
+    local_irq_restore(irq_flags);
+
+    return ret & HV_HYPERCALL_RESULT_MASK ? -ENXIO : 0;
 }
 
+#undef MAX_GVAS
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/guest/hyperv/util.c b/xen/arch/x86/guest/hyperv/util.c
new file mode 100644
index 0000000000..bec61c2afd
--- /dev/null
+++ b/xen/arch/x86/guest/hyperv/util.c
@@ -0,0 +1,75 @@
+/******************************************************************************
+ * arch/x86/guest/hyperv/util.c
+ *
+ * Hyper-V utility functions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2020 Microsoft.
+ */
+
+#include <xen/cpu.h>
+#include <xen/cpumask.h>
+#include <xen/errno.h>
+
+#include <asm/guest/hyperv.h>
+#include <asm/guest/hyperv-tlfs.h>
+
+#include "private.h"
+
+int cpumask_to_vpset(struct hv_vpset *vpset,
+                     const cpumask_t *mask)
+{
+    int nr = 1;
+    unsigned int cpu, vcpu_bank, vcpu_offset;
+    unsigned int max_banks = ms_hyperv.max_vp_index / 64;
+
+    /* Up to 64 banks can be represented by valid_bank_mask */
+    if ( max_banks > 64 )
+        return -E2BIG;
+
+    /* Clear all banks to avoid flushing unwanted CPUs */
+    for ( vcpu_bank = 0; vcpu_bank < max_banks; vcpu_bank++ )
+        vpset->bank_contents[vcpu_bank] = 0;
+
+    vpset->format = HV_GENERIC_SET_SPARSE_4K;
+
+    for_each_cpu ( cpu, mask )
+    {
+        unsigned int vcpu = hv_vp_index(cpu);
+
+        vcpu_bank = vcpu / 64;
+        vcpu_offset = vcpu % 64;
+
+        __set_bit(vcpu_offset, &vpset->bank_contents[vcpu_bank]);
+
+        if ( vcpu_bank >= nr )
+            nr = vcpu_bank + 1;
+    }
+
+    /* Some banks may be empty but that's ok */
+    vpset->valid_bank_mask = ~0ULL >> (64 - nr);
+
+    return nr;
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
-- 
2.20.1


