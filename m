Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18487908FC5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 18:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740806.1147912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9YP-0006B2-Tx; Fri, 14 Jun 2024 16:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740806.1147912; Fri, 14 Jun 2024 16:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI9YP-00068H-Qo; Fri, 14 Jun 2024 16:13:29 +0000
Received: by outflank-mailman (input) for mailman id 740806;
 Fri, 14 Jun 2024 16:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldK3=NQ=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sI9YO-0005jz-WC
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 16:13:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 085fe45b-2a69-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 18:13:27 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-46-197-197.retail.telecomitalia.it [79.46.197.197])
 by support.bugseng.com (Postfix) with ESMTPSA id 3516B4EE0756;
 Fri, 14 Jun 2024 18:13:24 +0200 (CEST)
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
X-Inumbo-ID: 085fe45b-2a69-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/e820 address violations of MISRA C:2012 Rule 5.3
Date: Fri, 14 Jun 2024 18:12:26 +0200
Message-Id: <1a02a5af6c2a737bc814610d4cc684ad4a00b8dc.1718380780.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718380780.git.alessandro.zucchelli@bugseng.com>
References: <cover.1718380780.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 5.3 which states as
following: An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/arch/x86/e820.c | 74 ++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index 6a3ce7e0a0..3726823e88 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -593,79 +593,79 @@ int __init e820_add_range(uint64_t s, uint64_t e, uint32_t type)
 }
 
 int __init e820_change_range_type(
-    struct e820map *e820, uint64_t s, uint64_t e,
+    struct e820map *map, uint64_t s, uint64_t e,
     uint32_t orig_type, uint32_t new_type)
 {
     uint64_t rs = 0, re = 0;
     unsigned int i;
 
-    for ( i = 0; i < e820->nr_map; i++ )
+    for ( i = 0; i < map->nr_map; i++ )
     {
         /* Have we found the e820 region that includes the specified range? */
-        rs = e820->map[i].addr;
-        re = rs + e820->map[i].size;
+        rs = map->map[i].addr;
+        re = rs + map->map[i].size;
         if ( (s >= rs) && (e <= re) )
             break;
     }
 
-    if ( (i == e820->nr_map) || (e820->map[i].type != orig_type) )
+    if ( (i == map->nr_map) || (map->map[i].type != orig_type) )
         return 0;
 
     if ( (s == rs) && (e == re) )
     {
-        e820->map[i].type = new_type;
+        map->map[i].type = new_type;
     }
     else if ( (s == rs) || (e == re) )
     {
-        if ( (e820->nr_map + 1) > ARRAY_SIZE(e820->map) )
+        if ( (map->nr_map + 1) > ARRAY_SIZE(map->map) )
             goto overflow;
 
-        memmove(&e820->map[i+1], &e820->map[i],
-                (e820->nr_map-i) * sizeof(e820->map[0]));
-        e820->nr_map++;
+        memmove(&map->map[i+1], &map->map[i],
+                (map->nr_map-i) * sizeof(map->map[0]));
+        map->nr_map++;
 
         if ( s == rs )
         {
-            e820->map[i].size = e - s;
-            e820->map[i].type = new_type;
-            e820->map[i+1].addr = e;
-            e820->map[i+1].size = re - e;
+            map->map[i].size = e - s;
+            map->map[i].type = new_type;
+            map->map[i+1].addr = e;
+            map->map[i+1].size = re - e;
         }
         else
         {
-            e820->map[i].size = s - rs;
-            e820->map[i+1].addr = s;
-            e820->map[i+1].size = e - s;
-            e820->map[i+1].type = new_type;
+            map->map[i].size = s - rs;
+            map->map[i+1].addr = s;
+            map->map[i+1].size = e - s;
+            map->map[i+1].type = new_type;
         }
     }
     else
     {
-        if ( (e820->nr_map + 2) > ARRAY_SIZE(e820->map) )
+        if ( (map->nr_map + 2) > ARRAY_SIZE(map->map) )
             goto overflow;
 
-        memmove(&e820->map[i+2], &e820->map[i],
-                (e820->nr_map-i) * sizeof(e820->map[0]));
-        e820->nr_map += 2;
+        memmove(&map->map[i+2], &map->map[i],
+                (map->nr_map-i) * sizeof(map->map[0]));
+        map->nr_map += 2;
 
-        e820->map[i].size = s - rs;
-        e820->map[i+1].addr = s;
-        e820->map[i+1].size = e - s;
-        e820->map[i+1].type = new_type;
-        e820->map[i+2].addr = e;
-        e820->map[i+2].size = re - e;
+        map->map[i].size = s - rs;
+        map->map[i+1].addr = s;
+        map->map[i+1].size = e - s;
+        map->map[i+1].type = new_type;
+        map->map[i+2].addr = e;
+        map->map[i+2].size = re - e;
     }
 
     /* Finally, look for any opportunities to merge adjacent e820 entries. */
-    for ( i = 0; i < (e820->nr_map - 1); i++ )
+    for ( i = 0; i < (map->nr_map - 1); i++ )
     {
-        if ( (e820->map[i].type != e820->map[i+1].type) ||
-             ((e820->map[i].addr + e820->map[i].size) != e820->map[i+1].addr) )
+        if ( (map->map[i].type != map->map[i+1].type) ||
+             ((map->map[i].addr + map->map[i].size) != map->map[i+1].addr) )
             continue;
-        e820->map[i].size += e820->map[i+1].size;
-        memmove(&e820->map[i+1], &e820->map[i+2],
-                (e820->nr_map-i-2) * sizeof(e820->map[0]));
-        e820->nr_map--;
+        map->map[i].size += map->map[i+1].size;
+        memmove(&map->map[i+1], &map->map[i+2],
+                (map->nr_map-i-2) * sizeof(map->map[0]));
+        map->nr_map--;
         i--;
     }
 
@@ -678,9 +678,9 @@ int __init e820_change_range_type(
 }
 
 /* Set E820_RAM area (@s,@e) as RESERVED in specified e820 map. */
-int __init reserve_e820_ram(struct e820map *e820, uint64_t s, uint64_t e)
+int __init reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e)
 {
-    return e820_change_range_type(e820, s, e, E820_RAM, E820_RESERVED);
+    return e820_change_range_type(map, s, e, E820_RAM, E820_RESERVED);
 }
 
 unsigned long __init init_e820(const char *str, struct e820map *raw)
-- 
2.34.1


