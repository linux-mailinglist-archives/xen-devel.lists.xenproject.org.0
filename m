Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3E7DD172
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625954.975778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrV3-0001uF-Dd; Tue, 31 Oct 2023 16:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625954.975778; Tue, 31 Oct 2023 16:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrV3-0001rg-9u; Tue, 31 Oct 2023 16:21:53 +0000
Received: by outflank-mailman (input) for mailman id 625954;
 Tue, 31 Oct 2023 16:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L368=GN=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1qxrV2-0001Lp-Dc
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:21:52 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9919149f-7809-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 17:21:51 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4083f613275so42199225e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 09:21:51 -0700 (PDT)
Received: from z0rr0-Latitude-7490 ([2a01:e0a:257:8c60:c550:f26a:2ce9:e5df])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c234300b0040586360a36sm2125624wmq.17.2023.10.31.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 09:21:49 -0700 (PDT)
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
X-Inumbo-ID: 9919149f-7809-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698769310; x=1699374110; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFaeT7oFb3OWV2txTm55sd6xURS6b4NhZdMJYHWdMKE=;
        b=mKmLcRR2cOUaxPu9o3RnMVfeLVrW8sYnuukydQx4HZQT79IDV0kkWDqJWYdBKeT2oB
         EtHvs1vqRFHf/IKZ7RnM1PHGWgf0nes9vAmwAazwh9nFFr3nfxFAp2vebXHp76TxwCVJ
         0mdaekuj34uxf9gCB8CxbHQP/j4s/RSGihHwquIkHM7vlwd0N5KA0Ojb0Xm7wqH3jXzp
         7cLSlnDtj8c5gYzURCQAg1A9nC4bouQkzlPCiTASL7AAFqlBVdZ//62rPJEg3FuR4z0v
         XlkUkS289y6KDO9HmDYMTeFFpCAhsOxOnaytB5UrF75pAh1KC4zu8l0iAxcIjRBI4epT
         nIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698769310; x=1699374110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFaeT7oFb3OWV2txTm55sd6xURS6b4NhZdMJYHWdMKE=;
        b=qOeQ2Iw1UYRs297ffNjjXISG/zru8CLul277q1S75Xm45Q4ZTjkmonxZVvrCjKDWwd
         APJd3SV1iLMgmssB66LSZRnCmpL0qaCdLn2Pv7uHWKF9lvrB4uFG4XitBQkv5Dy7dtYf
         niBONTdjThJ7BZ3gMQac+heuTM9FqOUmCZS2JoseVhA7imP+1Sj8QiPGQRubFMQYtL/B
         vR5DV15AGs8nQqiXQekNzjb+2UocK0n+TWvNEZVTj7w1zP2HoTtYMaeLajAHPG9oGslX
         j+5l/a+fzMEQLPSmLSYUKdrNRXjCDJfIBepuxI37olBsHgwIVHK8LfsllGLqamnrrNQJ
         01eg==
X-Gm-Message-State: AOJu0YwTiaMVRslOjqJ2caWAUW54P21wR4ZYhqNm9pUoPHdfoXdNmqL0
	V/gwrvs4SpM0Brl8YOhVa7zAPpBIcSu0z1jA
X-Google-Smtp-Source: AGHT+IElqF6dEZmBu7icN33rp94nd0N7QJxwVbQM9T8VWR+8lxo6LWq6HKDqXhQJotz3nkvCXcqZIw==
X-Received: by 2002:a05:600c:154e:b0:405:4a78:a890 with SMTP id f14-20020a05600c154e00b004054a78a890mr11001413wmg.8.1698769309895;
        Tue, 31 Oct 2023 09:21:49 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
Date: Tue, 31 Oct 2023 17:21:47 +0100
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Matias Vara <matiasevara@gmail.com>
Subject: [RFC PATCH v3 1/3] xen/memory : Add a stats_table resource type
Message-ID: <ec106b56640c92f91473c8855c8dccc20e3eb5df.1698589351.git.matias.vara@vates.fr>
References: <cover.1698589351.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698589351.git.matias.vara@vates.fr>

This commit proposes a new mechanism to query the RUNSTATE_running counter for
a given vcpu from a dom0 userspace application. This commit proposes to expose
that counter by using the acquire_resource interface. For this purpose, the
commit adds a new resource named XENMEM_resource_stats_table and a
type-specific resource named XENMEM_resource_stats_table_id_vcpustats. This
type-specific resource is aiming at exposing per-VCPU counters.

The current mechanism relies on the XEN_DOMCTL_getvcpuinfo and holds a single
global domctl_lock for the entire hypercall; and iterate over every vcpu in the
system for every update thus impacting operations that share that lock. This
commit proposes to expose vcpu RUNSTATE_running via the xenforeignmemory
interface thus preventing to issue the hypercall and holding the lock.

For that purpose, a new resource type named XENMEM_resource_stats_table is
added. In particular, the type-specific resource
XENMEM_resource_stats_table_id_vcpustats is added to host per-VCPU counters.
These counters are mapped in frames. The allocation of these frames only
happens if the resource is requested. The number of allocated frames is equal
to the domain's max_vcpus. Frames are released after the domain is destroyed.

To expose this information to a consumer, two structures are required:
1. vcpu_shmem_stats
2. vcpu_stats[]

The memory layout has been discussed at [1]. The laylout looks like:

struct vcpu_shmem_stats {
#define VCPU_STATS_MAGIC 0xaabbccdd
    uint32_t magic;
    uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats), cacheline_size)
    uint32_t size;    // sizeof(vcpu_stats)
    uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
};

struct vcpu_stats {
    /*
     * If the least-significant bit of the seq number is set then an update
     * is in progress and the consumer must wait to read a consistent set of
     * values. This mechanism is similar to Linux's seqlock.
     */
    uint32_t seq;
    uint32 _pad;
    /*
     * If the most-significant bit of a counter is set then the counter
     * is inactive and the consumer must ignore its value. Note that this
     * could also indicate that the counter has overflowed.
     */
    uint64_t stats_a; // e.g., runstate_running_time
    uint64_t stats_b; // e.g.,
    uint64_t stats_c; // e.g.,
    ...
};

All padding fields shall be marked as "inactive". The consumer can't
distinguish inactive from overflowed. Also, the consumer shall always
verify before reading that:
        
          offsetof(struct vcpu_stats, stats_y) < size.

in case the consumer knows about a counter, e.g., stats_y, that Xen does
not it.

The vcpu_shmem_stats structure exposes a magic number, the size of the
vcpu_stats structure, the offset in which the vcpu_stats structures begin and
the stride for each instance. The address of the vcpu_shmem_stats and
vcpu_stats instances are cache line aligned to prevent cache ping-pong when
accessing per-vcpu elements. In the vcpu_stats structure, most-significant bit
of a counter is set to indicate that either the counter has overflowed or it is
inactive so the consumer must ignore it.

Note that the updating of vcpu's counters is in a hot path, thus, in this commit,
copying only happens if it is specifically required.

Note that the resource is extensible in two ways. First, the structure
vcpu_stats can be extended with new per-vcpu counters. To do so, new per-vcpu
counters shall be added after the last element of the structure definition to
not break existing consumers. Second, new type-specific resources can be added
to host a different sort of counters.

[1]
https://lists.xenproject.org/archives/html/xen-devel/2023-03/msg00383.html

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
Changes in v3:
- allow to host an arbitrary nuumber of vcpus
- release resource during domain_kill() since it is guest-type
  independent and arch agnostic
- rework stats_table_max_frames()
- use memory layout as discussed at
  https://lists.xenproject.org/archives/html/xen-devel/2023-03/msg00383.html

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
 xen/common/domain.c         |   1 +
 xen/common/memory.c         | 167 ++++++++++++++++++++++++++++++++++++
 xen/common/sched/core.c     |  20 +++++
 xen/include/public/memory.h |   3 +
 xen/include/public/vcpu.h   |  27 ++++++
 xen/include/xen/mm.h        |   2 +
 xen/include/xen/sched.h     |   5 ++
 7 files changed, 225 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index e3afcacb6c..27d8961a21 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -948,6 +948,7 @@ int domain_kill(struct domain *d)
             break;
         if ( cpupool_move_domain(d, cpupool0) )
             return -ERESTART;
+        stats_free_vcpu_mfn(d);
         for_each_vcpu ( d, v )
             unmap_vcpu_info(v);
         d->is_dying = DOMDYING_dead;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 76f8858cc3..2acac40c63 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1092,6 +1092,27 @@ unsigned int ioreq_server_max_frames(const struct domain *d)
     return nr;
 }
 
+unsigned int stats_table_max_frames(const struct domain *d, unsigned int id)
+{
+    unsigned int nr = 0;
+    unsigned int size;
+
+    switch ( id )
+    {
+    case XENMEM_resource_stats_table_id_vcpustats:
+        size = DIV_ROUND_UP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES) +
+               DIV_ROUND_UP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES) * d->max_vcpus;
+
+        nr = DIV_ROUND_UP(size, PAGE_SIZE);
+        break;
+
+    default:
+        break;
+    }
+
+    return nr;
+}
+
 /*
  * Return 0 on any kind of error.  Caller converts to -EINVAL.
  *
@@ -1113,6 +1134,9 @@ static unsigned int resource_max_frames(const struct domain *d,
     case XENMEM_resource_vmtrace_buf:
         return d->vmtrace_size >> PAGE_SHIFT;
 
+    case XENMEM_resource_stats_table:
+        return stats_table_max_frames(d, id);
+
     default:
         return -EOPNOTSUPP;
     }
@@ -1176,6 +1200,146 @@ static int acquire_vmtrace_buf(
     return nr_frames;
 }
 
+void stats_free_vcpu_mfn(struct domain * d)
+{
+    struct page_info *pg = d->vcpustats_page.pg;
+    void * _va = d->vcpustats_page.va;
+    unsigned int i;
+    unsigned int size;
+    unsigned int nr_frames;
+
+    if ( !pg )
+        return;
+
+    d->vcpustats_page.pg = NULL;
+    d->vcpustats_page.va = NULL;
+
+    size = DIV_ROUND_UP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES) +
+           DIV_ROUND_UP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES)
+           * d->max_vcpus;
+
+    nr_frames = DIV_ROUND_UP(size, PAGE_SIZE);
+
+    vunmap(_va);
+
+    for ( i = 0; i < nr_frames; i++ )
+    {
+        put_page_alloc_ref(&pg[i]);
+        put_page_and_type(&pg[i]);
+    }
+}
+
+static int stats_vcpu_alloc_mfn(struct domain *d)
+{
+    struct page_info *pg;
+    int order;
+    unsigned int i;
+    unsigned int size;
+    unsigned int nr_frames;
+    void *_va;
+    mfn_t mfn;
+    struct vcpu_shmem_stats *hd;
+
+    size = DIV_ROUND_UP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES) +
+           DIV_ROUND_UP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES)
+           * d->max_vcpus;
+
+    nr_frames = DIV_ROUND_UP(size, PAGE_SIZE);
+
+    order = get_order_from_bytes(size);
+    pg = alloc_domheap_pages(d, order, MEMF_no_refcount);
+
+    if ( !pg )
+        return -ENOMEM;
+
+    for ( i = 0; i < nr_frames; i++ )
+    {
+        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            goto refcnt_err;
+    }
+
+    mfn = page_to_mfn(pg);
+    _va = vmap(&mfn, nr_frames);
+    if ( !_va )
+        goto refcnt_err;
+
+    for ( i = 0; i < nr_frames; i++ )
+        clear_page(_va + i * PAGE_SIZE);
+
+    /* Initialize vcpu_shmem_stats header */
+    hd = (struct vcpu_shmem_stats*)_va;
+    hd->magic = VCPU_STATS_MAGIC;
+    hd->offset = ROUNDUP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES);
+    hd->size = sizeof(struct vcpu_stats);
+    hd->stride = ROUNDUP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES);
+
+    d->vcpustats_page.va  = _va;
+    d->vcpustats_page.pg = pg;
+
+    return 0;
+
+ refcnt_err:
+    /*
+     * We can theoretically reach this point if someone has taken 2^43 refs on
+     * the frames in the time the above loop takes to execute, or someone has
+     * made a blind decrease reservation hypercall and managed to pick the
+     * right mfn.  Free the memory we safely can, and leak the rest.
+     */
+    while ( i-- )
+    {
+        put_page_alloc_ref(&pg[i]);
+        put_page_and_type(&pg[i]);
+    }
+
+    return -ENODATA;
+}
+
+static int acquire_stats_table(struct domain *d,
+                               unsigned int id,
+                               unsigned int frame,
+                               unsigned int nr_frames,
+                               xen_pfn_t mfn_list[])
+{
+    mfn_t mfn;
+    int rc;
+    unsigned int i;
+    unsigned int max_frames;
+
+    if ( !d )
+        return -ENOENT;
+
+    switch ( id )
+    {
+    case XENMEM_resource_stats_table_id_vcpustats:
+        max_frames = DIV_ROUND_UP(d->max_vcpus * sizeof(struct vcpu_stats),
+                                  PAGE_SIZE);
+
+        if ( (frame + nr_frames) > max_frames )
+            return -EINVAL;
+
+        if ( !d->vcpustats_page.pg )
+        {
+            rc = stats_vcpu_alloc_mfn(d);
+            if ( rc )
+                return rc;
+        }
+
+        mfn = page_to_mfn(d->vcpustats_page.pg);
+        for ( i = 0; i < nr_frames; i++ )
+            mfn_list[i] = mfn_x(mfn) + frame + i;
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    return nr_frames;
+}
+
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
  * success.  Returning less than nr_frames contitutes a request for a
@@ -1196,6 +1360,9 @@ static int _acquire_resource(
     case XENMEM_resource_vmtrace_buf:
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
 
+    case XENMEM_resource_stats_table:
+        return acquire_stats_table(d, id, frame, nr_frames, mfn_list);
+
     default:
         return -EOPNOTSUPP;
     }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 03ace41540..a05891fd32 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -264,6 +264,11 @@ static inline void vcpu_runstate_change(
 {
     s_time_t delta;
     struct sched_unit *unit = v->sched_unit;
+    struct vcpu_shmem_stats *vcpu_shmem;
+    struct vcpu_stats *vcpu_info;
+    void *_va;
+    struct domain *d = v->domain;
+    int offset;
 
     ASSERT(spin_is_locked(get_sched_res(v->processor)->schedule_lock));
     if ( v->runstate.state == new_state )
@@ -287,6 +292,21 @@ static inline void vcpu_runstate_change(
     }
 
     v->runstate.state = new_state;
+
+    _va = d->vcpustats_page.va;
+
+    if ( !_va )
+        return;
+
+    vcpu_shmem = (struct vcpu_shmem_stats*)_va;
+    vcpu_info = (struct vcpu_stats*)((void*)vcpu_shmem + vcpu_shmem->offset);
+    offset = (vcpu_shmem->stride * v->vcpu_id);
+    vcpu_info += offset;
+    vcpu_info->seq = version_update_begin(vcpu_info->seq);
+    smp_wmb();
+    vcpu_info->runstate_running_time = v->runstate.time[RUNSTATE_running];
+    smp_wmb();
+    vcpu_info->seq = version_update_end(vcpu_info->seq);
 }
 
 void sched_guest_idle(void (*idle) (void), unsigned int cpu)
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 383a9468c3..93b58a9ccc 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -633,6 +633,7 @@ struct xen_mem_acquire_resource {
 #define XENMEM_resource_ioreq_server 0
 #define XENMEM_resource_grant_table 1
 #define XENMEM_resource_vmtrace_buf 2
+#define XENMEM_resource_stats_table 3
 
     /*
      * IN - a type-specific resource identifier, which must be zero
@@ -640,11 +641,13 @@ struct xen_mem_acquire_resource {
      *
      * type == XENMEM_resource_ioreq_server -> id == ioreq server id
      * type == XENMEM_resource_grant_table -> id defined below
+     * type == XENMEM_resource_stats_table -> id defined below
      */
     uint32_t id;
 
 #define XENMEM_resource_grant_table_id_shared 0
 #define XENMEM_resource_grant_table_id_status 1
+#define XENMEM_resource_stats_table_id_vcpustats 0
 
     /*
      * IN/OUT
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 3623af932f..f61da90f1d 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -235,6 +235,33 @@ struct vcpu_register_time_memory_area {
 typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
 
+struct vcpu_shmem_stats {
+#define VCPU_STATS_MAGIC 0xaabbccdd
+    uint32_t magic;
+    uint32_t offset;
+    uint32_t size;
+    uint32_t stride;
+};
+
+struct vcpu_stats {
+    /*
+     * If the least-significant bit of the seq number is set then an update
+     * is in progress and the consumer must wait to read a consistent set of
+     * values. This mechanism is similar to Linux's seqlock.
+     */
+    uint32_t seq;
+    uint32_t pad0;
+    /*
+     * If the most-significant bit of a counter is set then the counter
+     * is inactive and the consumer must ignore its value. Note that this
+     * could also indicate that the counter has overflowed.
+     */
+     uint64_t runstate_running_time;
+};
+
+typedef struct vcpu_shmem_stats xen_vcpu_shmemstats_t;
+typedef struct vcpu_stats xen_shared_vcpustats_t;
+
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 
 /*
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 5db26ed477..c96d18f3a5 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -148,6 +148,8 @@ int assign_page(
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
+void stats_free_vcpu_mfn(struct domain *d);
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1a1fab5239..a0c1b5955e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -588,6 +588,11 @@ struct domain
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 #endif
+    /* Pages that host vcpu stats */
+    struct {
+        struct page_info *pg;
+        void *va;
+    } vcpustats_page;
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.34.1


