Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B55152A4ED
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330964.554397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyGX-0008Bz-J5; Tue, 17 May 2022 14:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330964.554397; Tue, 17 May 2022 14:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyGX-00088q-FA; Tue, 17 May 2022 14:33:37 +0000
Received: by outflank-mailman (input) for mailman id 330964;
 Tue, 17 May 2022 14:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NT3h=VZ=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1nqyGV-0007sV-VR
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:33:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5534f158-d5ee-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 16:33:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id w4so25008058wrg.12
 for <xen-devel@lists.xenproject.org>; Tue, 17 May 2022 07:33:35 -0700 (PDT)
Received: from horizon.home (amontsouris-681-1-37-131.w90-87.abo.wanadoo.fr.
 [90.87.156.131]) by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b003942a244f30sm2544884wmj.9.2022.05.17.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 07:33:34 -0700 (PDT)
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
X-Inumbo-ID: 5534f158-d5ee-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4FmmyqLRGvXYMIUa3VVLSfEZOS+ge14yndz9u2uerk=;
        b=IS5MuXI3qTk9KdMKhqyLjBHPVSrMbj2lq9dkP7aZ7vmpTjwpb4NUhLpNSF8eRl93Z3
         4VsNwupqYxWgD1qgDty7nfcR8H3aa9YObZHBMUxD7cqth+cuHw6pKvt+xBM/MAza3NCD
         B06IQKBD2wLhxAf/tH9ZSPYOYBGYW0xaHk6Fe5Syt40hRzsxIDqYQ616sqKvMSWhDUGV
         tSrKmDbAkBNLgSxR/gHY/Ay1AltSJMXB+uASi5oaR6YCYPsUuL6qIs+BBDgZoUd1h6Qr
         kjjRKc7Mi+reUNFQvBhyIrJVCjVe0jIDP6CvwEz6IeIaHximoQo+FouFMdZ5latBaZnw
         uzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4FmmyqLRGvXYMIUa3VVLSfEZOS+ge14yndz9u2uerk=;
        b=t2YpfVOhjpJ83qbzhlsu1FmRfFv7INA57MVEX+Dn/Ug0iDzoKUC9Sm6aLHNpaFR1vh
         4OnwZlBFSVff13D/M3OWIm4EgevnhVRqO9mtelvkffh/XQYh/nTsQ3+8w2LK4lBazE27
         sl35Oh9ERHFZXKIkxduNEP+AkcmSVWfLJDFHiuwdrtbc17LZelE6tldq5hZV5wFMc0ot
         +rmUSCURzss1hnwxXZDCWhMFHsq/Vy9rN31dTRvqLJZ38y6ymL109cFbc88SmEfDz9oZ
         kT0X46t7PzxmkJpokBxywUCI8XV+HIVEcmuyBojrDMJNt/BI66GfHgx+BzmpcdKv1eRp
         vaFQ==
X-Gm-Message-State: AOAM531vblwQx7TDPThcagZXNUArxFBQbr/ZsVII0uT1kQu2gExMqj4k
	mfmjkBeW5bixlCucvqf8BmstcRTonSf+rA==
X-Google-Smtp-Source: ABdhPJw/qHReIodTGVvX1U8v9An9YMCdZfTdwsfD+29R58e1Kpell1NJ2y3X1Szyh4jZjUdVVzEZzQ==
X-Received: by 2002:adf:f152:0:b0:20d:740:beba with SMTP id y18-20020adff152000000b0020d0740bebamr10075439wro.512.1652798014404;
        Tue, 17 May 2022 07:33:34 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Date: Tue, 17 May 2022 16:33:14 +0200
Message-Id: <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652797713.git.matias.vara@vates.fr>
References: <cover.1652797713.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow to map vcpu stats using acquire_resource().

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
 xen/common/domain.c         | 42 +++++++++++++++++++++++++++++++++++++
 xen/common/memory.c         | 29 +++++++++++++++++++++++++
 xen/common/sched/core.c     |  5 +++++
 xen/include/public/memory.h |  1 +
 xen/include/xen/sched.h     |  5 +++++
 5 files changed, 82 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 17cc32fde3..ddd9f88874 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -132,6 +132,42 @@ static void vcpu_info_reset(struct vcpu *v)
     v->vcpu_info_mfn = INVALID_MFN;
 }
 
+static void stats_free_buffer(struct vcpu * v)
+{
+    struct page_info *pg = v->stats.pg;
+
+    if ( !pg )
+        return;
+
+    v->stats.va = NULL;
+
+    if ( v->stats.va )
+        unmap_domain_page_global(v->stats.va);
+
+    v->stats.va = NULL;
+
+    free_domheap_page(pg);
+}
+
+static int stats_alloc_buffer(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    struct page_info *pg;
+
+    pg = alloc_domheap_page(d, MEMF_no_refcount);
+
+    if ( !pg )
+        return -ENOMEM;
+
+    v->stats.va = __map_domain_page_global(pg);
+    if ( !v->stats.va )
+        return -ENOMEM;
+
+    v->stats.pg = pg;
+    clear_page(v->stats.va);
+    return 0;
+}
+
 static void vmtrace_free_buffer(struct vcpu *v)
 {
     const struct domain *d = v->domain;
@@ -203,6 +239,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
  */
 static int vcpu_teardown(struct vcpu *v)
 {
+
+    stats_free_buffer(v);
+
     vmtrace_free_buffer(v);
 
     return 0;
@@ -269,6 +308,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     if ( vmtrace_alloc_buffer(v) != 0 )
         goto fail_wq;
 
+    if ( stats_alloc_buffer(v) != 0 )
+        goto fail_wq;
+
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 297b98a562..39de6d9d05 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1099,6 +1099,10 @@ static unsigned int resource_max_frames(const struct domain *d,
     case XENMEM_resource_vmtrace_buf:
         return d->vmtrace_size >> PAGE_SHIFT;
 
+    // WIP: to figure out the correct size of the resource
+    case XENMEM_resource_stats_table:
+        return 1;
+
     default:
         return -EOPNOTSUPP;
     }
@@ -1162,6 +1166,28 @@ static int acquire_vmtrace_buf(
     return nr_frames;
 }
 
+static int acquire_stats_table(struct domain *d,
+                                unsigned int id,
+                                unsigned int frame,
+                                unsigned int nr_frames,
+                                xen_pfn_t mfn_list[])
+{
+    const struct vcpu *v = domain_vcpu(d, id);
+    mfn_t mfn;
+
+    if ( !v )
+        return -ENOENT;
+
+    if ( !v->stats.pg )
+        return -EINVAL;
+
+    mfn = page_to_mfn(v->stats.pg);
+    mfn_list[0] = mfn_x(mfn);
+
+    printk("acquire_perf_table: id: %d, nr_frames: %d, %p, domainid: %d\n", id, nr_frames, v->stats.pg, d->domain_id);
+    return 1;
+}
+
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
  * success.  Returning less than nr_frames contitutes a request for a
@@ -1182,6 +1208,9 @@ static int _acquire_resource(
     case XENMEM_resource_vmtrace_buf:
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
 
+    case XENMEM_resource_stats_table:
+        return acquire_stats_table(d, id, frame, nr_frames, mfn_list);
+
     default:
         return -EOPNOTSUPP;
     }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d..2a8b534977 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -264,6 +264,7 @@ static inline void vcpu_runstate_change(
 {
     s_time_t delta;
     struct sched_unit *unit = v->sched_unit;
+    uint64_t * runstate;
 
     ASSERT(spin_is_locked(get_sched_res(v->processor)->schedule_lock));
     if ( v->runstate.state == new_state )
@@ -287,6 +288,10 @@ static inline void vcpu_runstate_change(
     }
 
     v->runstate.state = new_state;
+
+    // WIP: use a different interface
+    runstate = (uint64_t*)v->stats.va;
+    memcpy(runstate, &v->runstate.time[0], sizeof(v->runstate.time[0]));
 }
 
 void sched_guest_idle(void (*idle) (void), unsigned int cpu)
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 50e73eef98..752fd0be0f 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -626,6 +626,7 @@ struct xen_mem_acquire_resource {
 #define XENMEM_resource_ioreq_server 0
 #define XENMEM_resource_grant_table 1
 #define XENMEM_resource_vmtrace_buf 2
+#define XENMEM_resource_stats_table 3
 
     /*
      * IN - a type-specific resource identifier, which must be zero
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 5485d08afb..bc99adea7e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -284,6 +284,11 @@ struct vcpu
         struct page_info *pg; /* One contiguous allocation of d->vmtrace_size */
     } vmtrace;
 
+    struct {
+        struct page_info *pg;
+        void * va;
+    } stats;
+
     struct arch_vcpu arch;
 
 #ifdef CONFIG_IOREQ_SERVER
-- 
2.25.1


