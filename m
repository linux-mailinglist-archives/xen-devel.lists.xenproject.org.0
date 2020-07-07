Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2106217814
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:41:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSp-0007t4-Jh; Tue, 07 Jul 2020 19:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSo-0007no-0c
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:41:10 +0000
X-Inumbo-ID: c9b27083-c089-11ea-8de3-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9b27083-c089-11ea-8de3-12813bfff9fa;
 Tue, 07 Jul 2020 19:41:02 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3F581A26B6;
 Tue,  7 Jul 2020 21:41:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3CA2FA26B9;
 Tue,  7 Jul 2020 21:41:00 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Edb0dHd9Z37g; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8BB3EA2657;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2Y_eDj3TRnSX; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 579C1A265A;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1830E2243D;
 Tue,  7 Jul 2020 21:40:05 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YPKWuYMmlrOk; Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D299522444;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Quarantine-ID: <6kPGelPQA59y>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6kPGelPQA59y; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 9DBA82242E;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 06/11] x86/hvm: processor trace interface in HVM
Date: Tue,  7 Jul 2020 21:39:45 +0200
Message-Id: <1916e06793ffaaa70c471bcd6bcf168597793bd5.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Implement necessary changes in common code/HVM to support
processor trace features. Define vmtrace_pt_* API and
implement trace buffer allocation/deallocation in common
code.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/domain.c         | 21 +++++++++++++++++++++
 xen/common/domain.c           | 35 +++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/hvm/hvm.h | 20 ++++++++++++++++++++
 xen/include/xen/sched.h       |  4 ++++
 4 files changed, 80 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b75017b28b..8ce2ab6b8f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2205,6 +2205,27 @@ int domain_relinquish_resources(struct domain *d)
                 altp2m_vcpu_disable_ve(v);
         }
 
+        for_each_vcpu ( d, v )
+        {
+            unsigned int i;
+            uint64_t nr_pages = v->domain->processor_trace_buf_kb * KB(1);
+            nr_pages >>= PAGE_SHIFT;
+
+            if ( !v->vmtrace.pt_buf )
+                continue;
+
+            for ( i = 0; i < nr_pages; i++ )
+            {
+                struct page_info *pg = mfn_to_page(
+                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
+
+                put_page_alloc_ref(pg);
+                put_page_and_type(pg);
+            }
+
+            v->vmtrace.pt_buf = NULL;
+        }
+
         if ( is_pv_domain(d) )
         {
             for_each_vcpu ( d, v )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e6e8f88da1..193099a2ab 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -137,6 +137,38 @@ static void vcpu_destroy(struct vcpu *v)
     free_vcpu_struct(v);
 }
 
+static int vmtrace_alloc_buffers(struct vcpu *v)
+{
+    unsigned int i;
+    struct page_info *pg;
+    uint64_t size = v->domain->processor_trace_buf_kb * KB(1);
+
+    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
+                             MEMF_no_refcount);
+
+    if ( !pg )
+        return -ENOMEM;
+
+    for ( i = 0; i < (size >> PAGE_SHIFT); i++ )
+    {
+        struct page_info *pg_iter = mfn_to_page(
+            mfn_add(page_to_mfn(pg), i));
+
+        if ( !get_page_and_type(pg_iter, v->domain, PGT_writable_page) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            domain_crash(v->domain);
+            return -ENODATA;
+        }
+    }
+
+    v->vmtrace.pt_buf = pg;
+    return 0;
+}
+
 struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
 {
     struct vcpu *v;
@@ -162,6 +194,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     v->vcpu_id = vcpu_id;
     v->dirty_cpu = VCPU_CPU_CLEAN;
 
+    if ( d->processor_trace_buf_kb && vmtrace_alloc_buffers(v) != 0 )
+        return NULL;
+
     spin_lock_init(&v->virq_lock);
 
     tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 1eb377dd82..476a216205 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -214,6 +214,10 @@ struct hvm_function_table {
     bool_t (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 
+    /* vmtrace */
+    int (*vmtrace_control_pt)(struct vcpu *v, bool enable);
+    int (*vmtrace_get_pt_offset)(struct vcpu *v, uint64_t *offset, uint64_t *size);
+
     /*
      * Parameters and callbacks for hardware-assisted TSC scaling,
      * which are valid only when the hardware feature is available.
@@ -655,6 +659,22 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
     return false;
 }
 
+static inline int vmtrace_control_pt(struct vcpu *v, bool enable)
+{
+    if ( hvm_funcs.vmtrace_control_pt )
+        return hvm_funcs.vmtrace_control_pt(v, enable);
+
+    return -EOPNOTSUPP;
+}
+
+static inline int vmtrace_get_pt_offset(struct vcpu *v, uint64_t *offset, uint64_t *size)
+{
+    if ( hvm_funcs.vmtrace_get_pt_offset )
+        return hvm_funcs.vmtrace_get_pt_offset(v, offset, size);
+
+    return -EOPNOTSUPP;
+}
+
 /*
  * This must be defined as a macro instead of an inline function,
  * because it uses 'struct vcpu' and 'struct domain' which have
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index c046e59886..b6f39233aa 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -253,6 +253,10 @@ struct vcpu
     /* vPCI per-vCPU area, used to store data for long running operations. */
     struct vpci_vcpu vpci;
 
+    struct {
+        struct page_info *pt_buf;
+    } vmtrace;
+
     struct arch_vcpu arch;
 };
 
-- 
2.17.1


