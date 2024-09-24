Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E198433F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 12:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802536.1212801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2ZP-0003EX-Fe; Tue, 24 Sep 2024 10:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802536.1212801; Tue, 24 Sep 2024 10:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2ZP-0003CP-Cj; Tue, 24 Sep 2024 10:14:59 +0000
Received: by outflank-mailman (input) for mailman id 802536;
 Tue, 24 Sep 2024 10:14:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xwqT=QW=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1st2Yb-0003BQ-C1
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 10:14:09 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bba87554-7a5d-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 12:14:07 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cba8340beso38953645e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 03:14:07 -0700 (PDT)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e754a6638sm151796305e9.38.2024.09.24.03.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:14:05 -0700 (PDT)
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
X-Inumbo-ID: bba87554-7a5d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727172846; x=1727777646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xiWESsfQBQuwtnvjeu0eZMHnAIh3u1is48SIxzmICd0=;
        b=gZNtimi4kvWyhpfhU8Ax+lXs9rQEYESpN68EPE78Ork+q53LkRTbLGgyS6q4wOwLmo
         UrJlKHzdC2f19AqRQ8IYm4PyMBrIQKRTDxooO6L2Vu1Q05yNOcbwu0voQov5FxEovTft
         ywfhjPN/3UJpfoOmRdZmw90Bz55R6QGqgQhUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172846; x=1727777646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiWESsfQBQuwtnvjeu0eZMHnAIh3u1is48SIxzmICd0=;
        b=NgMWjopI9e1QpfSKmwjtXZ/Mli0O9Tr56YO+0PFf/nDHFDtCbcBMqsk1maQHOSmdzE
         eZtVQxcNXMCyZsi7L+tn2n+7n6F+rpzIaPf+ihs1iUzRzLAMccInN/+u/6i5VtN5tgn8
         nTB3ZKznfMfiQAc3ezviPJxQhp6wkwAhH6bSom3NTA+aZihiSnP8107IbaJwNRH+ICpx
         rhTtma3X2e/NsNuvnBBbdXyh+LjQsfomTzCq5X8TAwDiciywbKUe3R8UAunFqIqd+a+6
         qZnh0BXWcrluZll4az93CDBSbLb/RdlWMv57wf8b/esIUyEZzwdSAYAeTAJJ9/2FQIuV
         PwQQ==
X-Gm-Message-State: AOJu0YwBOh+xNCAu4TU5ZY8ML+fhzQIek4EcD/ty4G5s7UjtZYJYiiG4
	5o8k7NmEW8gtwiKGRIyKWQIct17W1oAfIKZeArEEKzgEBb4l4AMMdxS4irDbs+mr4UiINl2QqFS
	GeSyiPtFw
X-Google-Smtp-Source: AGHT+IF8Of2z2p5YmiwKZKUNy9M0YG9YIJoCrWMTv1RhM82njbJL5ell+UlAlIXI43uEHdAfmAHs5Q==
X-Received: by 2002:a05:6000:ecf:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-37c7eb99d74mr1501843f8f.3.1727172846109;
        Tue, 24 Sep 2024 03:14:06 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] Fix XEN_SYSCTL_numainfo[node].memsize for memory holes
Date: Tue, 24 Sep 2024 12:14:00 +0200
Message-ID: <20240924101400.5186-1-bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a long-standing issue (known at since 2014) with the numainfo call.

The Hypercall `XEN_SYSCTL_numainfo` returns `memsize` for each NUMA node:

xl info -n:
node:    memsize    memfree    distances
   0:  -> 67584 <-   60672      10,21  <- memsize is off by 2048 MB
   1:     65536      60958      21,10

So far, `memsize` is calculated from `NODE_DATA->node_spanned_pages`.
It includes memory holes, leading to wrong memsize on x86.

This patch gets the sum of E820_RAM entries for each NUMA node on boot,
stores it in NODE_DATA->node_present_pages and uses it for `memsize`.

It also increases it like `total_pages` on memory_add() for memory hotplug.

The new NODE_DATA->node_present_pages can be slighly lower than the
physical node's RAM due to reserved memory for some of the NUMA nodes.

For example, on this example system, NODE_DATA->node_present_pages
reports 63.5GB of usable memory on the 1st NUMA node with this patch.

This patch uses `arch_get_ram_range()` which is an architecture-provided
call that all NUMA architectures already need to provide for iterating
over the usable RAM of the system.

- Tested on 2-socket and a 4-socket x86 systems
- Memory hot-add not tested, but is identical to bumping total_pages.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 xen/arch/x86/x86_64/mm.c |  2 ++
 xen/common/numa.c        | 14 +++++++++++++-
 xen/common/sysctl.c      |  2 +-
 xen/include/xen/numa.h   |  3 +++
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b2a280fba3..a22aa45060 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1333,6 +1333,8 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     /* We can't revert any more */
     share_hotadd_m2p_table(&info);
     transfer_pages_to_heap(&info);
+    /* Update the node's present pages (like the total_pages of the system) */
+    NODE_DATA(node)->node_present_pages += epfn - spfn;
 
     return 0;
 
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 28a09766fa..d68cbea44c 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -504,10 +504,22 @@ void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
 {
     unsigned long start_pfn = paddr_to_pfn(start);
     unsigned long end_pfn = paddr_to_pfn(end);
+    paddr_t map_start, map_end;
+    int i = 0, err;
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
 
+    /* Add RAM pages within the node to get the present pages for memsize infos */
+    NODE_DATA(nodeid)->node_present_pages = 0;
+    while ( (err = arch_get_ram_range(i++, &map_start, &map_end)) != -ENOENT ) {
+        if ( err || map_start >= end || map_end <= start )
+            continue;  /* Skip non-RAM and maps outside of the node's memory range */
+        /* Add memory that is in the node's memory range (within start and end): */
+        map_start = max(map_start, start);
+        map_end = min(map_end, end);
+        NODE_DATA(nodeid)->node_present_pages += (map_end - map_start) >> PAGE_SHIFT;
+    }
     node_set_online(nodeid);
 }
 
@@ -675,7 +687,7 @@ static void cf_check dump_numa(unsigned char key)
         mfn_t mfn = _mfn(node_start_pfn(i) + 1);
 
         printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
+               i, node_start_pfn(i), node_present_pages(i),
                avail_node_heap_pages(i));
         /* Sanity check mfn_to_nid() */
         if ( node_spanned_pages(i) > 1 && mfn_to_nid(mfn) != i )
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index d02f44fe3a..cba6d3cfea 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -316,7 +316,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
                 {
                     if ( node_online(i) )
                     {
-                        meminfo.memsize = node_spanned_pages(i) << PAGE_SHIFT;
+                        meminfo.memsize = node_present_pages(i) << PAGE_SHIFT;
                         meminfo.memfree = avail_node_heap_pages(i) << PAGE_SHIFT;
                     }
                     else
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index fd1511a6fb..c860f3ad1c 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -71,6 +71,7 @@ extern nodeid_t *memnodemap;
 struct node_data {
     unsigned long node_start_pfn;
     unsigned long node_spanned_pages;
+    unsigned long node_present_pages;
 };
 
 extern struct node_data node_data[];
@@ -91,6 +92,7 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
 #define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_present_pages(nid) (NODE_DATA(nid)->node_present_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
@@ -123,6 +125,7 @@ extern void numa_set_processor_nodes_parsed(nodeid_t node);
 extern mfn_t first_valid_mfn;
 
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_present_pages(nid) total_pages
 #define node_start_pfn(nid) mfn_x(first_valid_mfn)
 #define __node_distance(a, b) 20
 
-- 
2.43.0


