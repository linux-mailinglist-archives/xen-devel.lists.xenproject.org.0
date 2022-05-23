Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1404531169
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335920.560173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9PA-0005zr-D2; Mon, 23 May 2022 14:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335920.560173; Mon, 23 May 2022 14:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9PA-0005u2-7r; Mon, 23 May 2022 14:51:32 +0000
Received: by outflank-mailman (input) for mailman id 335920;
 Mon, 23 May 2022 14:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt9P7-0004UK-Hv
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:51:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1f66eb9-daa7-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 16:51:27 +0200 (CEST)
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
X-Inumbo-ID: d1f66eb9-daa7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653317487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xftiHzs7Jai+N95D/Ytak8PcUxB9RjC+60CW9p0z8zA=;
  b=PmOehN+UD6MgEJWkx69zxO/dGVJIKo6k0AJGrXfKYA/0g0p1S5Hm/mDo
   d7jWA1UaHhJC1TCiXU2LYiZWmgzpAbGLdlx8K7rCjO2UgtiqUK/PcYbKu
   n3IFj6q867o+mpf6AyIfFEdd/8e59dFRo/tuVcdVOMdSTvNHrnae/cf4j
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71813510
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XlamKKKKTXOvhUUFFE+RwZUlxSXFcZb7ZxGr2PjKsXjdYENS3mQOx
 2VMXmCBaf+PZmLwKoojbYjloEMFuZ/dm9I1SAtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Qz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ph0qaWuUlcKBerRmcAGDRplLi9xHLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBM3qOsUbu2xIxjDFF/c2B5vERs0m4PcHhWdp3Z0XRZ4yY
 eInOCBSbgrLfyRweXhLUJgS29b4pWfgJmgwRFW9+vNsvjm7IBZK+LrnPcfRe9eKbd5IhUver
 WXDl0z7HxUbOdq32TeDtHW2iYfngifTSI8UUrqi+ZZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSwVcX0VRC8pH+CvzYfVsBWHul87xuCooLe7hyFHGECQnhEYcY/qc4tbTUw0
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZSY8/+D9u9EQtVXST/J4Tq2Is9P6OC6ll
 lhmsxMCa6UvYd8jjvvmpgqc02L3/PAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9k4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/W7T4i5CqmONoMeCnSUSONg1HgzDXN8Iki3yBR8+U3BE
 cnznTmQ4YYyVv08kWveqxY12r433CEurV4/triipylLJYG2PSbPIZ9caQPmRrlgvMus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVLfQ5iwLlSLc2elvG7gcbafVM2STl8VqaLqV7jEqQ895loei7z1
 inVcidlJJDX3hUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:nZQ1pqGQKXrPNy73pLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71813510"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v5 4/6] xen: Switch to byteswap
Date: Mon, 23 May 2022 10:50:49 -0400
Message-ID: <dcabb541d0b5ab7858ccf1c925afc334f3123ad5.1653314499.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653314499.git.lin.liu@citrix.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to use byteswap to swap bytes
be*_to_cpup(p) is short for be*to_cpu(*p), update to use latter
one explictly

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Changes in v5:
- Add git message to explain be*to_cpu helper

Changes in v4:
- Revert the __force in type casting

Changes in v3:
- Update xen/common/device_tree.c to use be32_to_cpu
- Keep const in type cast in unaligned.h
---

 xen/common/device_tree.c           | 44 +++++++++++++++---------------
 xen/common/libelf/libelf-private.h |  6 ++--
 xen/common/xz/private.h            |  2 +-
 xen/include/xen/unaligned.h        | 12 ++++----
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4aae281e89..70d3be3be6 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -171,7 +171,7 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
     if ( !val || len < sizeof(*out_value) )
         return 0;
 
-    *out_value = be32_to_cpup(val);
+    *out_value = be32_to_cpu(*val);
 
     return 1;
 }
@@ -264,7 +264,7 @@ int dt_property_read_variable_u32_array(const struct dt_device_node *np,
 
     count = sz;
     while ( count-- )
-        *out_values++ = be32_to_cpup(val++);
+        *out_values++ = be32_to_cpu(*val++);
 
     return sz;
 }
@@ -490,7 +490,7 @@ static int __dt_n_addr_cells(const struct dt_device_node *np, bool_t parent)
 
         ip = dt_get_property(np, "#address-cells", NULL);
         if ( ip )
-            return be32_to_cpup(ip);
+            return be32_to_cpu(*ip);
     } while ( np->parent );
     /* No #address-cells property for the root node */
     return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
@@ -507,7 +507,7 @@ int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
 
         ip = dt_get_property(np, "#size-cells", NULL);
         if ( ip )
-            return be32_to_cpup(ip);
+            return be32_to_cpu(*ip);
     } while ( np->parent );
     /* No #address-cells property for the root node */
     return DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
@@ -660,7 +660,7 @@ static void dt_bus_pci_count_cells(const struct dt_device_node *np,
 static unsigned int dt_bus_pci_get_flags(const __be32 *addr)
 {
     unsigned int flags = 0;
-    u32 w = be32_to_cpup(addr);
+    u32 w = be32_to_cpu(*addr);
 
     switch((w >> 24) & 0x03) {
     case 0x01:
@@ -1077,7 +1077,7 @@ dt_irq_find_parent(const struct dt_device_node *child)
         if ( parp == NULL )
             p = dt_get_parent(child);
         else
-            p = dt_find_node_by_phandle(be32_to_cpup(parp));
+            p = dt_find_node_by_phandle(be32_to_cpu(*parp));
         child = p;
     } while ( p && dt_get_property(p, "#interrupt-cells", NULL) == NULL );
 
@@ -1110,7 +1110,7 @@ unsigned int dt_number_of_irq(const struct dt_device_node *device)
     intlen /= sizeof(*intspec);
 
     dt_dprintk(" using 'interrupts' property\n");
-    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
+    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpu(*intspec), intlen);
 
     /* Look for the interrupt parent. */
     p = dt_irq_find_parent(device);
@@ -1241,7 +1241,7 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
         imaplen -= addrsize + intsize;
 
         /* Get the interrupt parent */
-        ipar = dt_find_node_by_phandle(be32_to_cpup(imap));
+        ipar = dt_find_node_by_phandle(be32_to_cpu(*imap));
         imap++;
         --imaplen;
 
@@ -1358,8 +1358,8 @@ static int dt_irq_map_raw(const struct dt_device_node *parent,
     int match, i;
 
     dt_dprintk("dt_irq_map_raw: par=%s,intspec=[0x%08x 0x%08x...],ointsize=%d\n",
-               parent->full_name, be32_to_cpup(intspec),
-               be32_to_cpup(intspec + 1), ointsize);
+               parent->full_name, be32_to_cpu(*intspec),
+               be32_to_cpu(*(intspec+1)), ointsize);
 
     ipar = parent;
 
@@ -1471,7 +1471,7 @@ static int dt_irq_map_raw(const struct dt_device_node *parent,
             dt_dprintk(" -> match=%d (imaplen=%d)\n", match, imaplen);
 
             /* Get the interrupt parent */
-            newpar = dt_find_node_by_phandle(be32_to_cpup(imap));
+            newpar = dt_find_node_by_phandle(be32_to_cpu(*imap));
             imap++;
             --imaplen;
 
@@ -1565,7 +1565,7 @@ int dt_device_get_raw_irq(const struct dt_device_node *device,
     intlen /= sizeof(*intspec);
 
     dt_dprintk(" using 'interrupts' property\n");
-    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
+    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpu(*intspec), intlen);
 
     /* Look for the interrupt parent. */
     p = dt_irq_find_parent(device);
@@ -1676,7 +1676,7 @@ static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
          * If phandle is 0, then it is an empty entry with no
          * arguments.  Skip forward to the next entry.
          * */
-        phandle = be32_to_cpup(list++);
+        phandle = be32_to_cpu(*list++);
         if ( phandle )
         {
             /*
@@ -1745,7 +1745,7 @@ static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
                 out_args->np = node;
                 out_args->args_count = count;
                 for ( i = 0; i < count; i++ )
-                    out_args->args[i] = be32_to_cpup(list++);
+                    out_args->args[i] = be32_to_cpu(*list++);
             }
 
             /* Found it! return success */
@@ -1826,7 +1826,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
     int has_name = 0;
     int new_format = 0;
 
-    tag = be32_to_cpup((__be32 *)(*p));
+    tag = be32_to_cpu(*(__be32 *)(*p));
     if ( tag != FDT_BEGIN_NODE )
     {
         printk(XENLOG_WARNING "Weird tag at start of node: %x\n", tag);
@@ -1919,7 +1919,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
         u32 sz, noff;
         const char *pname;
 
-        tag = be32_to_cpup((__be32 *)(*p));
+        tag = be32_to_cpu(*(__be32 *)(*p));
         if ( tag == FDT_NOP )
         {
             *p += 4;
@@ -1928,8 +1928,8 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
         if ( tag != FDT_PROP )
             break;
         *p += 4;
-        sz = be32_to_cpup((__be32 *)(*p));
-        noff = be32_to_cpup((__be32 *)((*p) + 4));
+        sz = be32_to_cpu(*(__be32 *)(*p));
+        noff = be32_to_cpu(*(__be32 *)((*p) + 4));
         *p += 8;
         if ( fdt_version(fdt) < 0x10 )
             *p = ROUNDUP(*p, sz >= 8 ? 8 : 4);
@@ -1956,13 +1956,13 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
                  (strcmp(pname, "linux,phandle") == 0) )
             {
                 if ( np->phandle == 0 )
-                    np->phandle = be32_to_cpup((__be32*)*p);
+                    np->phandle = be32_to_cpu(*(__be32*)*p);
             }
             /* And we process the "ibm,phandle" property
              * used in pSeries dynamic device tree
              * stuff */
             if ( strcmp(pname, "ibm,phandle") == 0 )
-                np->phandle = be32_to_cpup((__be32 *)*p);
+                np->phandle = be32_to_cpu(*(__be32 *)*p);
             pp->name = pname;
             pp->length = sz;
             pp->value = (void *)*p;
@@ -2034,7 +2034,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
             *p += 4;
         else
             mem = unflatten_dt_node(fdt, mem, p, np, allnextpp, fpsize);
-        tag = be32_to_cpup((__be32 *)(*p));
+        tag = be32_to_cpu(*(__be32 *)(*p));
     }
     if ( tag != FDT_END_NODE )
     {
@@ -2086,7 +2086,7 @@ static void __init __unflatten_device_tree(const void *fdt,
     /* Second pass, do actual unflattening */
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
-    if ( be32_to_cpup((__be32 *)start) != FDT_END )
+    if ( be32_to_cpu(*(__be32 *)start) != FDT_END )
         printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
     if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef )
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 47db679966..6062598fb8 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -31,9 +31,9 @@
    printk(fmt, ## args )
 
 #define strtoull(str, end, base) simple_strtoull(str, end, base)
-#define bswap_16(x) swab16(x)
-#define bswap_32(x) swab32(x)
-#define bswap_64(x) swab64(x)
+#define bswap_16(x) bswap16(x)
+#define bswap_32(x) bswap32(x)
+#define bswap_64(x) bswap64(x)
 
 #else /* !__XEN__ */
 
diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
index 511343fcc2..97131fa714 100644
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -28,7 +28,7 @@ static inline void put_unaligned_le32(u32 val, void *p)
 
 #endif
 
-#define get_le32(p) le32_to_cpup((const uint32_t *)(p))
+#define get_le32(p) le32_to_cpu(*(const uint32_t *)(p))
 
 #define false 0
 #define true 1
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 0a2b16d05d..56807bd157 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -20,7 +20,7 @@
 
 static inline uint16_t get_unaligned_be16(const void *p)
 {
-	return be16_to_cpup(p);
+	return be16_to_cpu(*(const uint16_t *)p);
 }
 
 static inline void put_unaligned_be16(uint16_t val, void *p)
@@ -30,7 +30,7 @@ static inline void put_unaligned_be16(uint16_t val, void *p)
 
 static inline uint32_t get_unaligned_be32(const void *p)
 {
-	return be32_to_cpup(p);
+	return be32_to_cpu(*(const uint32_t *)p);
 }
 
 static inline void put_unaligned_be32(uint32_t val, void *p)
@@ -40,7 +40,7 @@ static inline void put_unaligned_be32(uint32_t val, void *p)
 
 static inline uint64_t get_unaligned_be64(const void *p)
 {
-	return be64_to_cpup(p);
+	return be64_to_cpu(*(const uint64_t *)p);
 }
 
 static inline void put_unaligned_be64(uint64_t val, void *p)
@@ -50,7 +50,7 @@ static inline void put_unaligned_be64(uint64_t val, void *p)
 
 static inline uint16_t get_unaligned_le16(const void *p)
 {
-	return le16_to_cpup(p);
+	return le16_to_cpu(*(const uint16_t *)p);
 }
 
 static inline void put_unaligned_le16(uint16_t val, void *p)
@@ -60,7 +60,7 @@ static inline void put_unaligned_le16(uint16_t val, void *p)
 
 static inline uint32_t get_unaligned_le32(const void *p)
 {
-	return le32_to_cpup(p);
+	return le32_to_cpu(*(const uint32_t *)p);
 }
 
 static inline void put_unaligned_le32(uint32_t val, void *p)
@@ -70,7 +70,7 @@ static inline void put_unaligned_le32(uint32_t val, void *p)
 
 static inline uint64_t get_unaligned_le64(const void *p)
 {
-	return le64_to_cpup(p);
+	return le64_to_cpu(*(const uint64_t *)p);
 }
 
 static inline void put_unaligned_le64(uint64_t val, void *p)
-- 
2.27.0


