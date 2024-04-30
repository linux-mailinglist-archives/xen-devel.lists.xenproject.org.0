Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE008B7D9D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715058.1116567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qga-0005sL-C5; Tue, 30 Apr 2024 16:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715058.1116567; Tue, 30 Apr 2024 16:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qga-0005nD-18; Tue, 30 Apr 2024 16:50:32 +0000
Received: by outflank-mailman (input) for mailman id 715058;
 Tue, 30 Apr 2024 16:50:30 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgX-0003oL-T1
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:29 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf83db4e-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:28 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51e75e7a276so742448e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:28 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a196a11000000b0051aaffe4f1dsm4252114lfu.79.2024.04.30.09.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:26 -0700 (PDT)
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
X-Inumbo-ID: bf83db4e-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495828; x=1715100628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0mqQo2QzUWZGYHpYGMWslGBm8Oap0E4Z0qNuGo27BE=;
        b=Cr6rYcX+49Pwp/ZaOyNGmqouxkYQodnwJ/cfXmF9ZWSfJZKppkCA1LocdpRlwvMMp4
         1YuvD3f+33RNq5fY4OSwa6KEIVo0N6xc4z6/8pF9p8dX66rso7omjrTcBMlYW4kveQIu
         7LqaUAoLrQItScK4j76bP8y6Q8YN56JJP6lO+PniIfT0doTDyk3V+v++Xjni8bx0a8lk
         NklPxwfRBfeJ54SJbR2NRWrL1ckHwDhhjmPlIbn7PJek3XCTMb0k6S3Dp6ro+3EfiuVB
         7rO32N4Ma5BE3UiaqMnOlmTRwXI538wftbwC8+TYIJ6dtzvaHaNbrsZ53OkESwG6HiXt
         omfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495828; x=1715100628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0mqQo2QzUWZGYHpYGMWslGBm8Oap0E4Z0qNuGo27BE=;
        b=ls47+iDTyr+tnxjwy+JtBt09DW3lBWIjIffeYjxC4iIYh5s0agJb9CySSY7mSyzmck
         jgB8uE+f+5E8UT1XguMoAq/t0gJMTjZSAO3pHefajXazw1S0d0Ix7wTGnSZmZajqVmvQ
         Sb/ThhXUDDM/cdJTnN1yXpU7GeHHyycL2/aYJjZQeRDMZ42puYs5O4u1LrhkPgtq2msB
         f18GdH9w9gAiyMUkkpbStoOTFDre1XD9hNICldfJlPtUGiWPbmlzAgRnO0UFupSc3wgx
         iq8QC6FK0ZQipFmuQ0Vqn1PGj7ggNgMvv4MAL8CVZev1Js3u38cv8FirGfKwYyeOt+Rb
         4ohg==
X-Forwarded-Encrypted: i=1; AJvYcCVWAUMKcSVQTdkm2sERhxIM6/7mPU4gtGuGuhv5gjyyLESEQfKQQEPHP2/a6tMF2e+lNDcJ2I1bmN7dFNC3wial0ScrCoXGqZpQyb0VaRo=
X-Gm-Message-State: AOJu0Yz6JPJN4kzjLql8HNXxYKzC5KgNGYsrcnm1zwsRpLfuSuhk3yln
	LaXrQ0H0inqbhuY+YpVExnS1+ma6XtjNyqrWNmU6p98iNXehepWC
X-Google-Smtp-Source: AGHT+IGQCPL9JgHmD1RLCqV4syaus5YjfpEwlBgT76+qyDY37l2dNAYgiSCfXBlfwOjb2G8RuoFmJQ==
X-Received: by 2002:ac2:4c4e:0:b0:51d:1830:8380 with SMTP id o14-20020ac24c4e000000b0051d18308380mr58334lfk.8.1714495827628;
        Tue, 30 Apr 2024 09:50:27 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 10/17] xen: mapcache: Break out xen_map_cache_init_single()
Date: Tue, 30 Apr 2024 18:49:32 +0200
Message-Id: <20240430164939.925307-11-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out xen_map_cache_init_single() in preparation for
adding multiple map caches.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 53 ++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index dd08cd296b..72a7e25e3e 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -93,23 +93,44 @@ static inline int test_bits(int nr, int size, const unsigned long *addr)
         return 0;
 }
 
-void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
+static MapCache *xen_map_cache_init_single(phys_offset_to_gaddr_t f,
+                                           void *opaque,
+                                           unsigned long max_size)
 {
     unsigned long size;
-    struct rlimit rlimit_as;
+    MapCache *mc;
+
+    mc = g_new0(MapCache, 1);
+
+    mc->phys_offset_to_gaddr = f;
+    mc->opaque = opaque;
+    qemu_mutex_init(&mc->lock);
+
+    QTAILQ_INIT(&mc->locked_entries);
 
-    mapcache = g_new0(MapCache, 1);
+    mc->max_mcache_size = max_size;
 
-    mapcache->phys_offset_to_gaddr = f;
-    mapcache->opaque = opaque;
-    qemu_mutex_init(&mapcache->lock);
+    mc->nr_buckets =
+        (((mc->max_mcache_size >> XC_PAGE_SHIFT) +
+          (1UL << (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT)) - 1) >>
+         (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT));
 
-    QTAILQ_INIT(&mapcache->locked_entries);
+    size = mc->nr_buckets * sizeof(MapCacheEntry);
+    size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
+    trace_xen_map_cache_init(mc->nr_buckets, size);
+    mc->entry = g_malloc0(size);
+    return mc;
+}
+
+void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
+{
+    struct rlimit rlimit_as;
+    unsigned long max_mcache_size;
 
     if (geteuid() == 0) {
         rlimit_as.rlim_cur = RLIM_INFINITY;
         rlimit_as.rlim_max = RLIM_INFINITY;
-        mapcache->max_mcache_size = MCACHE_MAX_SIZE;
+        max_mcache_size = MCACHE_MAX_SIZE;
     } else {
         getrlimit(RLIMIT_AS, &rlimit_as);
         rlimit_as.rlim_cur = rlimit_as.rlim_max;
@@ -119,24 +140,14 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
                         " memory is not infinity");
         }
         if (rlimit_as.rlim_max < MCACHE_MAX_SIZE + NON_MCACHE_MEMORY_SIZE) {
-            mapcache->max_mcache_size = rlimit_as.rlim_max -
-                NON_MCACHE_MEMORY_SIZE;
+            max_mcache_size = rlimit_as.rlim_max - NON_MCACHE_MEMORY_SIZE;
         } else {
-            mapcache->max_mcache_size = MCACHE_MAX_SIZE;
+            max_mcache_size = MCACHE_MAX_SIZE;
         }
     }
 
+    mapcache = xen_map_cache_init_single(f, opaque, max_mcache_size);
     setrlimit(RLIMIT_AS, &rlimit_as);
-
-    mapcache->nr_buckets =
-        (((mapcache->max_mcache_size >> XC_PAGE_SHIFT) +
-          (1UL << (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT)) - 1) >>
-         (MCACHE_BUCKET_SHIFT - XC_PAGE_SHIFT));
-
-    size = mapcache->nr_buckets * sizeof (MapCacheEntry);
-    size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
-    trace_xen_map_cache_init(mapcache->nr_buckets, size);
-    mapcache->entry = g_malloc0(size);
 }
 
 static void xen_remap_bucket(MapCache *mc,
-- 
2.40.1


