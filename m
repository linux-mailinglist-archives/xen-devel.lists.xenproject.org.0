Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F83AB28D6F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084507.1443659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF7g-00025T-NP; Sat, 16 Aug 2025 11:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084507.1443659; Sat, 16 Aug 2025 11:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF7g-00022G-Ip; Sat, 16 Aug 2025 11:30:56 +0000
Received: by outflank-mailman (input) for mailman id 1084507;
 Sat, 16 Aug 2025 11:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unEz5-0005tK-OJ
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:22:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b1be4e5-7a93-11f0-b898-0df219b8e170;
 Sat, 16 Aug 2025 13:22:02 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so14730565e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:22:02 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:22:00 -0700 (PDT)
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
X-Inumbo-ID: 3b1be4e5-7a93-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343321; x=1755948121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itB6W5Mjw83eiGRv4d1CzarPcdxe/AwYbDWU2IVujVI=;
        b=H9aa13Zl2XFOwQv2tYNg0vEUbg2Wa5rh1EeZi32NcT0xjXqwCVUvgceMI/VvXqrxhW
         4/FRYVZqNPmaIW/b0InIdyQQSPF9N+KfhPZofKU2rJfY6n2UJ2M6is6SF25e+8lyc61o
         Rvv5eKcXCWHoJKd5K7fpTfxuIyZO7GP+K6es8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343321; x=1755948121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itB6W5Mjw83eiGRv4d1CzarPcdxe/AwYbDWU2IVujVI=;
        b=LG1gxb9qYFdPewX2Hh3kGJPakyVE8q01hmwld4Wp2d0l84ARCSeSfAAmrkg2vq3bQQ
         mzJoMYvP06QxKRbcQvhE4zpZY+ANFboIHZK1QJd1BxIxENe5RKxLaG1do7QU+C+iXgdF
         MvduA4KSnJz+lX3sT8WSgl8eEXSZlRtwQnmCU2QsOw2oXSZvkgI/v8mwwKMio5jmgYwC
         YspVgPawXBQT4SAhKtU1l34h7V9XTfhf3KfVCqJoe+qD3xUExQ/TqV9Mx0uGUPqU03Tb
         8JWKCtlKSkl4JY2i2R7VvVLbP17wHYFKB7D4SnJ1ihpLfA8HSev4pWpkrDMNP//ipvfO
         qXQg==
X-Gm-Message-State: AOJu0Yw5i1hmQfUwbLgSpuHO1B31Wp3U+X1W2VTMOdnNlK0voUOLSIpB
	bTaoGNvF1nD0GC1ccrXhDaRM9aaalC9Wc8HXnvXPf2/lThTP1kf+tTrmOmXIu9RF+Bjdb/zYgVc
	kivp7PKE=
X-Gm-Gg: ASbGncsQu4oeMO6nDYoCfQGDUydez3eX5hjy1cT9++afCXzHWX6OzyjoDDFK+wDaM6A
	Y2qAJwcSdP8hFUCM3UXh5JTyqc/4O68xLRSoW35wPlL3s9I9ASMGAklNW2/uJ3dTbKgUDpzOQcY
	4atEUMCeaUDT/fTFlLP/S3QXRm6kpEON9pJ52GT4phK6swkNY52CRO3+KHVOHSIj0lELTCdPIbb
	yKXlLJRZuLohFTydyWwG8irh8B9TO1slS0HyW+VmLEbZD2y44UEeKHLJ/+tHSO+diLTVgT5ZIDA
	xYl/tkbHdl4CMhMr9j32LTurQ5o0ZKvH6+mWznADZZXuq9x8/zGXxMgwnVUOA49QHi9jCja5LIf
	Sbvp7BVWmGAzz/SlqwT5tUAJ7nVYW5NYP1OVGFjZ9TmxujWHl7S1yfgc=
X-Google-Smtp-Source: AGHT+IGNf35gMUVzvlqFV29NkNPtqAgDj/10uCjjHdVaqfSJq9g6oY9WCZuroUHFpKy4ygpelHlvQQ==
X-Received: by 2002:a05:600c:c104:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-45a1b819ca7mr54173995e9.10.1755343321278;
        Sat, 16 Aug 2025 04:22:01 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 3/7] xen/page_alloc: Add static per-NUMA-node counts of free pages
Date: Sat, 16 Aug 2025 13:19:29 +0200
Message-ID: <b74a6a61209e37c2126dd1171b64c12264754f2e.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The static per-NUMA-node count of free pages is the sum of free memory
in all zones of a node. It's an optimisation to avoid doing that operation
frequently in the following patches that introduce per-NUMA-node claims.

---
Changed since v1:
- Added ASSERT(per_node_avail_pages[node] >= request) as requested
  during review by Roger: Comment by me: As we have
  ASSERT(avail[node][zone] >= request);
  directly before it, request is already valid, so this checks
  that per_node_avail_pages[node] is not mis-accounted too low.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/page_alloc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7e90b9cc1e..43de9296fd 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -486,6 +486,9 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 static unsigned long *avail[MAX_NUMNODES];
 static long total_avail_pages;
 
+/* Per-NUMA-node counts of free pages */
+static unsigned long per_node_avail_pages[MAX_NUMNODES];
+
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
@@ -1066,6 +1069,8 @@ static struct page_info *alloc_heap_pages(
 
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
+    ASSERT(per_node_avail_pages[node] >= request);
+    per_node_avail_pages[node] -= request;
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
@@ -1226,6 +1231,8 @@ static int reserve_offlined_page(struct page_info *head)
             continue;
 
         avail[node][zone]--;
+        ASSERT(per_node_avail_pages[node] > 0);
+        per_node_avail_pages[node]--;
         total_avail_pages--;
         ASSERT(total_avail_pages >= 0);
 
@@ -1550,6 +1557,7 @@ static void free_heap_pages(
     }
 
     avail[node][zone] += 1 << order;
+    per_node_avail_pages[node] += 1 << order;
     total_avail_pages += 1 << order;
     if ( need_scrub )
     {
-- 
2.43.0


