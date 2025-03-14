Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBADA6177F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914883.1320531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8nD-00052g-9p; Fri, 14 Mar 2025 17:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914883.1320531; Fri, 14 Mar 2025 17:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8nD-0004za-6L; Fri, 14 Mar 2025 17:25:55 +0000
Received: by outflank-mailman (input) for mailman id 914883;
 Fri, 14 Mar 2025 17:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8nC-0003IK-4d
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:25:54 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6198a550-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:25:53 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac34257295dso55171666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:25:53 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:25:52 -0700 (PDT)
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
X-Inumbo-ID: 6198a550-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973152; x=1742577952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi0U1tBM2T4W2AEbnFZA5/T7OE3SmD5RxZSu3R3MuvQ=;
        b=GmUdB/RFDvZR/WWwjBKSSbs9MNuoMfMfdKmDzPCEw9I7e3/S0y4T2IuVJlvlHH89ka
         g08CPZMphARd/dsfgbr6DtYbzf0ks9YXpDA7JwxOIFx0bxp/ju2IDc2gpwZrRrqzOkMF
         CGab5FnJ6/EfcSyaY158Zae7NdZE8C/OgXAFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973152; x=1742577952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zi0U1tBM2T4W2AEbnFZA5/T7OE3SmD5RxZSu3R3MuvQ=;
        b=azMjd+8i709wZVGc9xv+OLMJB2OFp6lrYrcifFVoxv6TU2HyIfS4bMo0NMAONF+u3a
         g4ISOqBnAaXPdhR4sxiaDF/kvtvjRDfXCjp9AffThJbzWDv2xYG8cRoK4w7jiesLYUc6
         A+7PxtmjH8O7ANN3NC4HJvhX3FgjGc0xwf1FAVhvKVidxSYwnEzJJ2AalnMbA47SSnuM
         AgOQPg7zD7YtGglShgExXBubxlAndjQp66zSl7hjFW3AAag8C5B0vtChkAImZnaJjb6R
         ZN7xDhCRSBa4JT9CW1iVfa0xJ4eunz7WjGiRiOTOwdT9tzPvmkiRklOl1d1uxzzx+tX6
         ISzA==
X-Gm-Message-State: AOJu0Yxgx+JkilJGpCYRNcozZGznkA2t6Lrvjmznh1l2TbzS8foNuWd9
	6KrZZfcAvW7vrKYISWM5Q4lMoHmRrlHZdQeVcrtg6LJLmtvz+467T6Wl2eG7WncXg/4hVF4geO5
	p
X-Gm-Gg: ASbGncvSXOm5VEDtAha8mhGoRQF1SzZWSyEvsrY7rcV8tujmeFp6A5QsSPqE0LdwVVL
	ApysuFAAEj7l8xfYcqlpDmggaTJCppNQc40tD/eVdSXRoVx3+kq1DwKXrH4MbUalCMAvxph4+W1
	KZsQoavlQNu7hQvtAi5lvFiJUnVyDqZ9+I6XJ1POT9CL4e7EEL6SRnRpt2Y8iYKa5a+rcnf1L5r
	nLcvFVuLI690+Y9DsJwz3wGx4yjUZLJcd3Qvkf5PkIUbWvXT2kXcKXtEkE8uZJ4Y4UzGm7zDPir
	r4XZdasmnCwGempnhUdvBB6s9l2gezmTsuxcXkuKR4gVEUy9ZdAQk7FDvpmB2IRRXB4=
X-Google-Smtp-Source: AGHT+IFADtQYmIHTCQjkqGKIQUUkHpagvgpqQ3Bb9SjUIRU2mCKX4RN/qddSc0+Q25vOp0lX6f4pWw==
X-Received: by 2002:a17:906:6a27:b0:ac2:7be7:95c5 with SMTP id a640c23a62f3a-ac3303225c3mr432322766b.33.1741973152447;
        Fri, 14 Mar 2025 10:25:52 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 05/11] xen: Create per-node outstanding claims
Date: Fri, 14 Mar 2025 17:24:56 +0000
Message-ID: <20250314172502.53498-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extends domain_set_outstanding_claims() to allow staking claims on an
exact node. Also creates global per-node claim counts analogous to
`outstanding_claims`. Note that the per-node counts can't replace the
global one if we want exact-node claims to coexist with non-exact
claims.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/page_alloc.c | 32 +++++++++++++++++++++++++++++++-
 xen/include/xen/sched.h |  3 +++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 9243c4f51370..7fe574b29407 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -490,6 +490,7 @@ static unsigned long pernode_avail_pages[MAX_NUMNODES];
 
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
+static unsigned long pernode_oc[MAX_NUMNODES]; /* per-node outstanding claims */
 
 unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
                                       long pages)
@@ -501,20 +502,31 @@ unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
      * can test d->outstanding_pages race-free because it can only change
      * if d->page_alloc_lock and heap_lock are both held, see also
      * domain_set_outstanding_pages below
+     *
+     * If `d` has an exact-node claim, we must exit early if this is an
+     * adjustment attributed to another node.
      */
-    if ( !d->outstanding_pages || pages <= 0 )
+    if ( !d->outstanding_pages || pages <= 0 ||
+         (d->claim_node != NUMA_NO_NODE && d->claim_node != node) )
         goto out;
 
+
     spin_lock(&heap_lock);
     BUG_ON(outstanding_claims < d->outstanding_pages);
     if ( d->outstanding_pages < pages )
     {
         /* `pages` exceeds the domain's outstanding count. Zero it out. */
+        if ( d->claim_node != NUMA_NO_NODE )
+            pernode_oc[d->claim_node] -= d->outstanding_pages;
+
         outstanding_claims -= d->outstanding_pages;
         d->outstanding_pages = 0;
     }
     else
     {
+        if ( d->claim_node != NUMA_NO_NODE )
+            pernode_oc[d->claim_node] -= pages;
+
         outstanding_claims -= pages;
         d->outstanding_pages -= pages;
     }
@@ -542,6 +554,10 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
     if ( pages == 0 )
     {
         outstanding_claims -= d->outstanding_pages;
+
+        if ( d->claim_node != NUMA_NO_NODE )
+            pernode_oc[d->claim_node] -= d->outstanding_pages;
+
         d->outstanding_pages = 0;
         ret = 0;
         goto out;
@@ -564,12 +580,26 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
     /* how much memory is available? */
     avail_pages = total_avail_pages - outstanding_claims;
 
+    /* This check can't be skipped for the NUMA case, or we may overclaim */
     if ( pages > avail_pages )
         goto out;
 
+    if ( node != NUMA_NO_NODE )
+    {
+        avail_pages = pernode_avail_pages[node] - pernode_oc[node];
+
+        if ( pages > avail_pages )
+            goto out;
+    }
+
     /* yay, claim fits in available memory, stake the claim, success! */
     d->outstanding_pages = pages;
     outstanding_claims += d->outstanding_pages;
+    d->claim_node = node;
+
+    if ( node != NUMA_NO_NODE )
+        pernode_oc[node] += pages;
+
     ret = 0;
 
 out:
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c7e..307a9d749f5d 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -406,6 +406,9 @@ struct domain
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
 
+    /* NUMA node from which outstanding pages have been reserved */
+    unsigned int     claim_node;
+
 #ifdef CONFIG_MEM_SHARING
     atomic_t         shr_pages;         /* shared pages */
 #endif
-- 
2.48.1


