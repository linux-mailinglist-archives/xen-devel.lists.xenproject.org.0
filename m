Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DCA98D11F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 12:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808673.1220646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwWB-0007bs-PQ; Wed, 02 Oct 2024 10:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808673.1220646; Wed, 02 Oct 2024 10:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwWB-0007ZB-M9; Wed, 02 Oct 2024 10:23:39 +0000
Received: by outflank-mailman (input) for mailman id 808673;
 Wed, 02 Oct 2024 10:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EZat=Q6=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1svwWA-0007Z5-VE
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 10:23:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6283a3dc-80a8-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 12:23:36 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42e7b7bef42so53497685e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 03:23:36 -0700 (PDT)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e665asm13574771f8f.64.2024.10.02.03.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 03:23:35 -0700 (PDT)
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
X-Inumbo-ID: 6283a3dc-80a8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727864616; x=1728469416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3dytcXupu0AH5/QMew4Y81Jyx0J2onhJqoKwISlucU=;
        b=PJa5eqQwyU0GXaU2rBdon+t6Fp5UCzQWa7datvAKCwQRxQGeTuPJZGfzyLGK6bsJUk
         IFLwJiUlYjbUHkpDId/QnFgZu5DOXdYDafp460xtL1YnzTQbrc6FkhSRaVxeJMdEL5R9
         YSXw4D6iPJWr76omYZHHhRw+NWXtOHe6zBhwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727864616; x=1728469416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3dytcXupu0AH5/QMew4Y81Jyx0J2onhJqoKwISlucU=;
        b=aN9X84DraZyoAWzBWhlyYt+H+B1lI5+aIXtjHgxsrHVCtgVSgdjjPMZEqsZSsc/osc
         x9DvE4UL03iS3k6QJlqQTqc45mkdg6davhXIea7EqVlPbZLtacOstId73K76hY1enAlx
         fRuuQTu2Qs3Dq4dsJqWIgSaqj5tGwdNXVKdFZ1E0UEHePA8JMhekDx/ZI6Ynygb1lHBi
         g6lYHOXwbZBDE1h5DYckGs9RVZdGp9SIM+nQd9wMW5r4bOfrnO4TT18AZKot+Tr+MKH4
         0mrYxthWdVJz2jStG/JFrgajuyaHE2xqY86TYbumVPbeiXyKM5jkmcPza/OsM+oJ1sjw
         Y8Dg==
X-Gm-Message-State: AOJu0YxvYbkxf8Z8tPPfSLbDZayskWRITNtd4x0c0RFe8HEhY4rrZn5d
	ZeLLI5OZ4/IGri780bPzVUqENJu1RJCDvUe82QQplum4cfK361h4SFm+ZBOwn+pRiG9lulY/wfS
	W5iIQ0g==
X-Google-Smtp-Source: AGHT+IFsrmKU8Hk0QWiWtinn1M7qviASSXruqP9RnmywcZNdp9tsBShsj6R2k5quVL6Z85dR0eesyA==
X-Received: by 2002:a05:600c:19c6:b0:426:60b8:d8ba with SMTP id 5b1f17b1804b1-42f777ec6b3mr17487395e9.28.1727864615981;
        Wed, 02 Oct 2024 03:23:35 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
X-Google-Original-From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
To: xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] NUMA: Introduce NODE_DATA->node_present_pages(RAM pages)
Date: Wed,  2 Oct 2024 12:23:31 +0200
Message-ID: <20241002102331.437048-1-bernhardkaindl7@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bernhard Kaindl <bernhard.kaindl@cloud.com>

Changes in v2:
- Remove update of numainfo call, only calculate RAM for each node.
- Calculate RAM based on page boundaries, coding style fixes

Some admin tools like 'xl info -n' like to display the total memory
for each NUMA node. The Xen backend[1] of hwloc comes to mind too.

The total amount of RAM on a NUMA node is not needed by Xen internally:
Xen only uses NODE_DATA->node_spanned_pages, but that can be confusing
for users as it includes memory holes (can be as large as 2GB on x86).

Calculate the RAM per NUMA node by iterating over arch_get_ram_range()
which returns the e820 RAM entries on x86 and update it on memory_add().

Use NODE_DATA->node_present_pages (like in the Linux kernel) to hold
this info and in a later commit, find a way for tools to read it.

[1] hwloc with Xen backend: https://github.com/xenserver-next/hwloc/

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 xen/arch/x86/x86_64/mm.c |  3 +++
 xen/common/numa.c        | 28 +++++++++++++++++++++++++++-
 xen/include/xen/numa.h   |  3 +++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b2a280fba3..66b9bed057 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1334,6 +1334,9 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     share_hotadd_m2p_table(&info);
     transfer_pages_to_heap(&info);
 
+    /* Update the node's present pages (like the total_pages of the system) */
+    NODE_DATA(node)->node_present_pages += epfn - spfn;
+
     return 0;
 
 destroy_m2p:
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 28a09766fa..1b0f8180a0 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -499,15 +499,41 @@ int __init compute_hash_shift(const struct node *nodes,
     return shift;
 }
 
-/* Initialize NODE_DATA given nodeid and start/end */
+/**
+ * @brief Initialize a NUMA node's NODE_DATA given nodeid and start/end addrs.
+ *
+ * This function sets up the boot memory for a given NUMA node by calculating
+ * the node's start and end page frame numbers (PFNs) and determining
+ * the number of present RAM pages within the node's memory range.
+ *
+ * @param nodeid The identifier of the node to initialize.
+ * @param start The starting physical address of the node's memory range.
+ * @param end The ending physical address of the node's memory range.
+ */
 void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
 {
     unsigned long start_pfn = paddr_to_pfn(start);
     unsigned long end_pfn = paddr_to_pfn(end);
+    unsigned long ram_start_pfn, ram_end_pfn;
+    unsigned int idx = 0;
+    int err;
+    paddr_t ram_start, ram_end;
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
 
+    /* Calculate the numer of present RAM pages within the node: */
+    NODE_DATA(nodeid)->node_present_pages = 0;
+    while ( (err = arch_get_ram_range(idx++, &ram_start, &ram_end)) != -ENOENT )
+    {
+        if ( err || ram_start >= end || ram_end <= start )
+            continue;  /* Not RAM (err != 0) or range is outside the node */
+
+        /* Add RAM that in the node's memory range (within start and end): */
+        ram_end_pfn = min(ram_end, end) >> PAGE_SHIFT;
+        ram_start_pfn = (PAGE_ALIGN(max(ram_start, start))) >> PAGE_SHIFT;
+        NODE_DATA(nodeid)->node_present_pages += ram_end_pfn - ram_start_pfn;
+    }
     node_set_online(nodeid);
 }
 
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


