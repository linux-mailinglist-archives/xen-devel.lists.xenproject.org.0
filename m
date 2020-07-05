Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D54A214EC0
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:56:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9ob-0005zS-9X; Sun, 05 Jul 2020 18:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZHG=AQ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1js9oY-0005m2-VY
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:56:35 +0000
X-Inumbo-ID: 37200200-bef1-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37200200-bef1-11ea-bb8b-bc764e2007e4;
 Sun, 05 Jul 2020 18:56:21 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A51CAA20CC;
 Sun,  5 Jul 2020 20:56:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A272FA2037;
 Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id MPZIYhkmTYT3; Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8DFEBA2058;
 Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eFOoYfuRpihs; Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AFA8DA201B;
 Sun,  5 Jul 2020 20:56:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1DC0522C1E;
 Sun,  5 Jul 2020 20:55:19 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WWYAtzNBoRq6; Sun,  5 Jul 2020 20:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 58FF622C12;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
X-Quarantine-ID: <aOEGDFEWHkIY>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aOEGDFEWHkIY; Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 2236B22C0B;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 06/11] x86/hvm: processor trace interface in HVM
Date: Sun,  5 Jul 2020 20:54:59 +0200
Message-Id: <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
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
 xen/arch/x86/domain.c         | 19 +++++++++++++++++++
 xen/common/domain.c           | 19 +++++++++++++++++++
 xen/include/asm-x86/hvm/hvm.h | 20 ++++++++++++++++++++
 xen/include/xen/sched.h       |  4 ++++
 4 files changed, 62 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fee6c3931a..79c9794408 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2199,6 +2199,25 @@ int domain_relinquish_resources(struct domain *d)
                 altp2m_vcpu_disable_ve(v);
         }
 
+        for_each_vcpu ( d, v )
+        {
+            unsigned int i;
+
+            if ( !v->vmtrace.pt_buf )
+                continue;
+
+            for ( i = 0; i < (v->domain->vmtrace_pt_size >> PAGE_SHIFT); i++ )
+            {
+                struct page_info *pg = mfn_to_page(
+                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
+                if ( (pg->count_info & PGC_count_mask) != 1 )
+                    return -EBUSY;
+            }
+
+            free_domheap_pages(v->vmtrace.pt_buf,
+                get_order_from_bytes(v->domain->vmtrace_pt_size));
+        }
+
         if ( is_pv_domain(d) )
         {
             for_each_vcpu ( d, v )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 25d3359c5b..f480c4e033 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -137,6 +137,21 @@ static void vcpu_destroy(struct vcpu *v)
     free_vcpu_struct(v);
 }
 
+static int vmtrace_alloc_buffers(struct vcpu *v)
+{
+    struct page_info *pg;
+    uint64_t size = v->domain->vmtrace_pt_size;
+
+    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
+                             MEMF_no_refcount);
+
+    if ( !pg )
+        return -ENOMEM;
+
+    v->vmtrace.pt_buf = pg;
+    return 0;
+}
+
 struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
 {
     struct vcpu *v;
@@ -162,6 +177,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     v->vcpu_id = vcpu_id;
     v->dirty_cpu = VCPU_CPU_CLEAN;
 
+    if ( d->vmtrace_pt_size && vmtrace_alloc_buffers(v) != 0 )
+        return NULL;
+
     spin_lock_init(&v->virq_lock);
 
     tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
@@ -422,6 +440,7 @@ struct domain *domain_create(domid_t domid,
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
     spin_lock_init(&d->pbuf_lock);
+    spin_lock_init(&d->vmtrace_lock);
 
     rwlock_init(&d->vnuma_rwlock);
 
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 1eb377dd82..2d474a4c50 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -214,6 +214,10 @@ struct hvm_function_table {
     bool_t (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 
+    /* vmtrace */
+    int (*vmtrace_control_pt)(struct vcpu *v, bool enable);
+    int (*vmtrace_get_pt_offset)(struct vcpu *v, uint64_t *offset);
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
+static inline int vmtrace_get_pt_offset(struct vcpu *v, uint64_t *offset)
+{
+    if ( hvm_funcs.vmtrace_get_pt_offset )
+        return hvm_funcs.vmtrace_get_pt_offset(v, offset);
+
+    return -EOPNOTSUPP;
+}
+
 /*
  * This must be defined as a macro instead of an inline function,
  * because it uses 'struct vcpu' and 'struct domain' which have
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 48f0a61bbd..95ebab0d30 100644
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


