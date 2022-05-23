Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA749530C69
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335657.559849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k5-0003II-R5; Mon, 23 May 2022 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335657.559849; Mon, 23 May 2022 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k5-0003Bl-NG; Mon, 23 May 2022 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 335657;
 Mon, 23 May 2022 09:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt4k3-0002dp-Ih
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:52:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16ab978c-da7e-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 11:52:43 +0200 (CEST)
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
X-Inumbo-ID: 16ab978c-da7e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=++cTDuCI2eUXrno3sLGrk+Z0rJmvgXXtlDQhmlqs4d8=;
  b=Ekg2mjOdfnMeNaz9GQ7soDSqN01naxIyr0zR6QQmK8KUxSn2c8iLF32U
   xnoZZ2RS7mDaPiM8mXZiTyjDtIXA38zH7p9XShqo7brg+3yOBdKx6wAbo
   /XxIv5PeRMpkXPZRCBj+iZJFIMv/5uoikST7N66F2pCzTPYeLirup8k61
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71298197
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Bagp7qPJz19mqCrvrR20l8FynXyQoLVcMsEvi/4bfWQNrUp0hTAPz
 zYWWT2FbqmDZDSgedEgOYqwoRhV75XRyd9kTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2NUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 v9t77agUioVF4rSuNQFfyVyKCdMBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALKMjteocep1lrzC3DDOZgSpfGK0nPzYABhmZg35ERdRrYT
 4kUM2JkS0//WRdwfXUcE5IPveuDjXaqJlW0r3rK/PFqsgA/1jdZ0rLgLd7UcdyiXthOkwCTo
 Weu12bkBhAXMvSPxDzD9Wij7sfQmQvrVYRUE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l4qDZ+RqDD24ICDtIcsU7tdQeTCYvk
 FSOmrvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsVyElufPzu6wPpzXRbuZ7PJKftdvHIGSlq
 9yVlxTSl4n/nOZSifjgpwuX02n2znTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5JOi8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kPO6SYi5D6qMN4omjn1NmOivpXwGWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5caDOmN7lphIvZ8V692
 4sOaKO3J+B3DbSWjt//qtZDczjn7BETWPjLliCgXrXTc1Y9Qjh4VJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4ACXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:UywuyaitvpBc9ry8dDDEPQ623nBQXuAji2hC6mlwRA09TySZ//
 rOoB19726MtN9xYgBapTnuAtjifZqxz/FICMwqTNOftWrdyQ2VxeNZnOnfKlTbckWUnIMw6U
 4jSdkYNDSZNykDsS+Q2mmF+rgbruVviJrY4Nvj8w==
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71298197"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 4/6] xen: Switch to byteswap
Date: Mon, 23 May 2022 05:52:20 -0400
Message-ID: <3f8e73fdfb222b0d1ff391a18fa2a799f68a467c.1653295437.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653295437.git.lin.liu@citrix.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to use byteswap to swap bytes.

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


