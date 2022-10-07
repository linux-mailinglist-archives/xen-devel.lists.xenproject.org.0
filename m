Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56855F7810
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 14:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417960.662695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmeR-0001ff-Pk; Fri, 07 Oct 2022 12:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417960.662695; Fri, 07 Oct 2022 12:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmeR-0001c2-Mj; Fri, 07 Oct 2022 12:40:27 +0000
Received: by outflank-mailman (input) for mailman id 417960;
 Fri, 07 Oct 2022 12:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NbG=2I=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1ogmeQ-0001bd-0U
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 12:40:26 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3690c7cf-463d-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 14:40:24 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id bu30so7104905wrb.8
 for <xen-devel@lists.xenproject.org>; Fri, 07 Oct 2022 05:40:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003b95ed78275sm2237208wms.20.2022.10.07.05.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:40:23 -0700 (PDT)
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
X-Inumbo-ID: 3690c7cf-463d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7DXPQ0Ol36lIEkiwQv5EhGYaewpw0fwd3bSvTaydbA=;
        b=fV/GOpuAgJXrH4iQ3IWDCQF8tX2Ucrof///Y8UO3GkK93NPM5Kiy9AJm7jw1ZAFYIT
         b2lDR0xdwJRenO/2tWSXQI3b/vyoNEXxF3aSZBW6VJghAGWLJOXUY35VVM5W03mYhtAc
         LIA1le30btJG9jklZGvwVELdQlErgX7UXDnncYpHVQnOeVFTCDC7dxe4+Se1/SEcYeqo
         +w2F0nIgWjhFRJtFXbvFkH4lz0wM4GMSNx7kxqgQoGo4JwMZU1COmN0qAFEV7dcMqfKL
         aFs/TTJjopK1jWQy9BdoCaDLD/X0jq1xRuGKXMgMbVkKcWBBUGvQMtazXQCK2rrZnwON
         LqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7DXPQ0Ol36lIEkiwQv5EhGYaewpw0fwd3bSvTaydbA=;
        b=rNPLJXGHkWItBmemLSlcYKBFFIzy/FXQOVgPNQshkNXdqbWQynSQgQycIqBxBJ+IqJ
         wDIphhJkvo1doJraav23PppuI2ghKG3z2M+Y5HM+6UKggl6leG+F/uMqOAy8Ro3yEz6c
         s7jGKj8T+66+DWrHCRjqwwkawR2dWG6QPFwU+q4l4iV/urOkW9ePEG3vdKGrvkkfQEEA
         6efGymF0nbJU9lF0IdPlWRJzNf9pcdVgvFdK78oHlrhQYFw6XHlaXmk+AXaY+I5e8pKz
         lmYShgEVNeu6yVCAExsvE/IBnEBB+TzC9XBQXUcdP+Fdg1hVKjmlnxNFXM7/BoyrhOD5
         xxlw==
X-Gm-Message-State: ACrzQf3KzuQhLxBYxvAvE5slob2r69UEwRp2lH6zVx7gQPACOHNQ880r
	OXkx8d9Ej3UtamTaAKrKP4+goU8/7p2ZDQ==
X-Google-Smtp-Source: AMsMyM6/tKYPAIgdd8Ezu6OCrYePPn73oQ9O/uBjnx8rjsgZ23ETzMfJagM+j/3+1lXwi1GO5FlGMA==
X-Received: by 2002:a5d:5a9d:0:b0:225:2783:d6f1 with SMTP id bp29-20020a5d5a9d000000b002252783d6f1mr3167811wrb.385.1665146423511;
        Fri, 07 Oct 2022 05:40:23 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Date: Fri,  7 Oct 2022 14:39:53 +0200
Message-Id: <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665138677.git.matias.vara@vates.fr>
References: <cover.1665138677.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit proposes a new mechanism to query the RUNSTATE_running counter for
a given vcpu from a dom0 userspace application. This commit proposes to expose
that counter by using the acquire_resource interface. The current mechanism
relies on the XEN_DOMCTL_getvcpuinfo and holds a single global domctl_lock for
the entire hypercall; and iterate over every vcpu in the system for every
update thus impacting operations that share that lock.

This commit proposes to expose vcpu RUNSTATE_running via the
xenforeignmemory interface thus preventing to issue the hypercall and holding
the lock. For that purpose, a new resource type named stats_table is added. The
first frame of this resource stores per-vcpu counters. The frame has one entry
of type struct vcpu_stats per vcpu. The allocation of this frame only happens
if the resource is requested. The frame is released after the domain is
destroyed.

Note that the updating of this counter is in a hot path, thus, in this commit,
copying only happens if it is specifically required.

Note that the exposed structure is extensible in two ways. First, the structure
vcpu_stats can be extended with new per-vcpu counters while it fits in a frame.
Second, new frames can be added in case new counters are required.

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
Changes in v2:
- rework to ensure that guest reads a coherent value by using a version
  number in the vcpu_stats structure
- add version to the vcpu_stats structure

Changes in v1:
- rework the allocation and releasing of the frames
- use the zero frame for per-vcpu counters that are listed as an array
- allocate vcpu stats frames only when the resource is requested
- rewrite commit message
- add the vcpu_stats structure to keep per-vcpu counters
- add the shared_vcpustatspage to keep an array of per-vcpu counters for a
  given domain
- declare the structures in a public header 
- define the vcpustats_page in the domain structure
---
 xen/arch/x86/hvm/hvm.c      |  2 +
 xen/common/memory.c         | 94 +++++++++++++++++++++++++++++++++++++
 xen/common/sched/core.c     | 16 +++++++
 xen/include/public/memory.h |  3 ++
 xen/include/public/vcpu.h   | 16 +++++++
 xen/include/xen/mm.h        |  2 +
 xen/include/xen/sched.h     |  5 ++
 7 files changed, 138 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ddd001a6ad..1ef6cb5ff0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -741,6 +741,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
 
     ioreq_server_destroy_all(d);
 
+    stats_free_vcpu_mfn(d);
+
     msixtbl_pt_cleanup(d);
 
     /* Stop all asynchronous timer actions. */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 297b98a562..749486d5d4 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1078,6 +1078,12 @@ unsigned int ioreq_server_max_frames(const struct domain *d)
     return nr;
 }
 
+unsigned int stats_table_max_frames(const struct domain *d)
+{
+    /* One frame per 512 vcpus. */
+    return 1;
+}
+
 /*
  * Return 0 on any kind of error.  Caller converts to -EINVAL.
  *
@@ -1099,6 +1105,9 @@ static unsigned int resource_max_frames(const struct domain *d,
     case XENMEM_resource_vmtrace_buf:
         return d->vmtrace_size >> PAGE_SHIFT;
 
+    case XENMEM_resource_stats_table:
+        return stats_table_max_frames(d);
+
     default:
         return -EOPNOTSUPP;
     }
@@ -1162,6 +1171,88 @@ static int acquire_vmtrace_buf(
     return nr_frames;
 }
 
+void stats_free_vcpu_mfn(struct domain * d)
+{
+    struct page_info *pg = d->vcpustats_page.pg;
+
+    if ( !pg )
+        return;
+
+    d->vcpustats_page.pg = NULL;
+
+    if ( d->vcpustats_page.va )
+        unmap_domain_page_global(d->vcpustats_page.va);
+
+    d->vcpustats_page.va = NULL;
+
+    put_page_alloc_ref(pg);
+    put_page_and_type(pg);
+}
+
+static int stats_vcpu_alloc_mfn(struct domain *d)
+{
+    struct page_info *pg;
+
+    pg = alloc_domheap_page(d, MEMF_no_refcount);
+
+    if ( !pg )
+        return -ENOMEM;
+
+    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
+        put_page_alloc_ref(pg);
+        return -ENODATA;
+    }
+
+    d->vcpustats_page.va = __map_domain_page_global(pg);
+    if ( !d->vcpustats_page.va )
+        goto fail;
+
+    d->vcpustats_page.pg = pg;
+    clear_page(d->vcpustats_page.va);
+    return 1;
+
+fail:
+    put_page_alloc_ref(pg);
+    put_page_and_type(pg);
+
+    return -ENOMEM;
+}
+
+static int acquire_stats_table(struct domain *d,
+                                unsigned int id,
+                                unsigned int frame,
+                                unsigned int nr_frames,
+                                xen_pfn_t mfn_list[])
+{
+    mfn_t mfn;
+    int rc;
+    unsigned int i;
+
+    if ( !d )
+        return -ENOENT;
+
+    for ( i = 0; i < nr_frames; i++ )
+    {
+        switch ( i )
+        {
+        case XENMEM_resource_stats_frame_vcpustats:
+            if ( !d->vcpustats_page.pg ) {
+                rc = stats_vcpu_alloc_mfn(d);
+                if ( rc < 1 )
+                    return rc;
+            }
+            mfn = page_to_mfn(d->vcpustats_page.pg);
+            mfn_list[i] = mfn_x(mfn);
+            break;
+
+        default:
+            return -EINVAL;
+        }
+    }
+
+    return nr_frames;
+}
+
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
  * success.  Returning less than nr_frames contitutes a request for a
@@ -1182,6 +1273,9 @@ static int _acquire_resource(
     case XENMEM_resource_vmtrace_buf:
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
 
+    case XENMEM_resource_stats_table:
+        return acquire_stats_table(d, id, frame, nr_frames, mfn_list);
+
     default:
         return -EOPNOTSUPP;
     }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d..3543a531a1 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -264,6 +264,8 @@ static inline void vcpu_runstate_change(
 {
     s_time_t delta;
     struct sched_unit *unit = v->sched_unit;
+    shared_vcpustatspage_t * vcpustats_va;
+    struct domain *d = v->domain;
 
     ASSERT(spin_is_locked(get_sched_res(v->processor)->schedule_lock));
     if ( v->runstate.state == new_state )
@@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
     }
 
     v->runstate.state = new_state;
+
+    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;
+    if ( vcpustats_va )
+    {
+	vcpustats_va->vcpu_info[v->vcpu_id].version =
+	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
+        smp_wmb();
+        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
+               &v->runstate.time[RUNSTATE_running],
+               sizeof(v->runstate.time[RUNSTATE_running]));
+        smp_wmb();
+        vcpustats_va->vcpu_info[v->vcpu_id].version =
+            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
+    }
 }
 
 void sched_guest_idle(void (*idle) (void), unsigned int cpu)
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 50e73eef98..e1a10b8b97 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -626,6 +626,7 @@ struct xen_mem_acquire_resource {
 #define XENMEM_resource_ioreq_server 0
 #define XENMEM_resource_grant_table 1
 #define XENMEM_resource_vmtrace_buf 2
+#define XENMEM_resource_stats_table 3
 
     /*
      * IN - a type-specific resource identifier, which must be zero
@@ -683,6 +684,8 @@ struct xen_mem_acquire_resource {
 typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
 DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
 
+#define XENMEM_resource_stats_frame_vcpustats 0
+
 /*
  * XENMEM_get_vnumainfo used by guest to get
  * vNUMA topology from hypervisor.
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 3623af932f..5c1812dfd2 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -235,6 +235,22 @@ struct vcpu_register_time_memory_area {
 typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
 
+struct vcpu_stats{
+    /* If the least-significant bit of the version number is set then an update
+     * is in progress and the guest must wait to read a consistent set of values
+     * This mechanism is similar to Linux's seqlock.
+     */
+    uint32_t version;
+    uint32_t pad0;
+    uint64_t runstate_running_time;
+};
+
+struct shared_vcpustatspage {
+    struct vcpu_stats vcpu_info[1];
+};
+
+typedef struct shared_vcpustatspage shared_vcpustatspage_t;
+
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 
 /*
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83..d1ca8b9aa8 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -134,6 +134,8 @@ int assign_pages(
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
+void stats_free_vcpu_mfn(struct domain * d);
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 5485d08afb..d9551ce35f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -577,6 +577,11 @@ struct domain
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 #endif
+    /* Page that hosts vcpu stats */
+    struct {
+        struct page_info *pg;
+        void *va;
+    } vcpustats_page;
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.25.1


