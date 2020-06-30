Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3566020F4C1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFUA-00081C-UL; Tue, 30 Jun 2020 12:35:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFU9-0007rV-SP
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:37 +0000
X-Inumbo-ID: 2d6897e6-bace-11ea-8610-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d6897e6-bace-11ea-8610-12813bfff9fa;
 Tue, 30 Jun 2020 12:35:29 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6140EA37F9;
 Tue, 30 Jun 2020 14:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 484D2A37FA;
 Tue, 30 Jun 2020 14:35:27 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZlCGzAO2pZSL; Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AB7D4A37F8;
 Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HSr51uoiqUOZ; Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 28DAAA37EA;
 Tue, 30 Jun 2020 14:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 13D1622625;
 Tue, 30 Jun 2020 14:34:45 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HP0zBV_9dGFy; Tue, 30 Jun 2020 14:34:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 814842262E;
 Tue, 30 Jun 2020 14:34:39 +0200 (CEST)
X-Quarantine-ID: <MsyLsha6KguP>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MsyLsha6KguP; Tue, 30 Jun 2020 14:34:39 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 60E77224C7;
 Tue, 30 Jun 2020 14:34:39 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 05/10] common/domain: allocate vmtrace_pt_buffer
Date: Tue, 30 Jun 2020 14:33:48 +0200
Message-Id: <0e02c97054da6e367f740ab8d2574e2d255553c8.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
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
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Allocate processor trace buffer for each vCPU when the domain
is created, deallocate trace buffers on domain destruction.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/domain.c        | 11 +++++++++++
 xen/common/domain.c          | 32 ++++++++++++++++++++++++++++++++
 xen/include/asm-x86/domain.h |  4 ++++
 xen/include/xen/sched.h      |  4 ++++
 4 files changed, 51 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fee6c3931a..0d79fd390c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2199,6 +2199,17 @@ int domain_relinquish_resources(struct domain *d)
                 altp2m_vcpu_disable_ve(v);
         }
 
+        for_each_vcpu ( d, v )
+        {
+            if ( !v->arch.vmtrace.pt_buf )
+                continue;
+
+            vmtrace_destroy_pt(v);
+
+            free_domheap_pages(v->arch.vmtrace.pt_buf,
+                get_order_from_bytes(v->domain->vmtrace_pt_size));
+        }
+
         if ( is_pv_domain(d) )
         {
             for_each_vcpu ( d, v )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 27dcfbac8c..8513659ef8 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -137,6 +137,31 @@ static void vcpu_destroy(struct vcpu *v)
     free_vcpu_struct(v);
 }
 
+static int vmtrace_alloc_buffers(struct vcpu *v)
+{
+    struct page_info *pg;
+    uint64_t size = v->domain->vmtrace_pt_size;
+
+    if ( size < PAGE_SIZE || size > GB(4) || (size & (size - 1)) )
+    {
+        /*
+         * We don't accept trace buffer size smaller than single page
+         * and the upper bound is defined as 4GB in the specification.
+         * The buffer size must be also a power of 2.
+         */
+        return -EINVAL;
+    }
+
+    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
+                             MEMF_no_refcount);
+
+    if ( !pg )
+        return -ENOMEM;
+
+    v->arch.vmtrace.pt_buf = pg;
+    return 0;
+}
+
 struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
 {
     struct vcpu *v;
@@ -162,6 +187,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     v->vcpu_id = vcpu_id;
     v->dirty_cpu = VCPU_CPU_CLEAN;
 
+    if ( d->vmtrace_pt_size && vmtrace_alloc_buffers(v) != 0 )
+        return NULL;
+
     spin_lock_init(&v->virq_lock);
 
     tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
@@ -188,6 +216,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 
+    if ( d->vmtrace_pt_size && vmtrace_init_pt(v) != 0 )
+        goto fail_sched;
+
     d->vcpu[vcpu_id] = v;
     if ( vcpu_id != 0 )
     {
@@ -422,6 +453,7 @@ struct domain *domain_create(domid_t domid,
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
     spin_lock_init(&d->pbuf_lock);
+    spin_lock_init(&d->vmtrace_lock);
 
     rwlock_init(&d->vnuma_rwlock);
 
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 6fd94c2e14..b01c107f5c 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -627,6 +627,10 @@ struct arch_vcpu
     struct {
         bool next_interrupt_enabled;
     } monitor;
+
+    struct {
+        struct page_info *pt_buf;
+    } vmtrace;
 };
 
 struct guest_memory_policy
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..48f0a61bbd 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -457,6 +457,10 @@ struct domain
     unsigned    pbuf_idx;
     spinlock_t  pbuf_lock;
 
+    /* Used by vmtrace features */
+    spinlock_t  vmtrace_lock;
+    uint64_t    vmtrace_pt_size;
+
     /* OProfile support. */
     struct xenoprof *xenoprof;
 
-- 
2.20.1


