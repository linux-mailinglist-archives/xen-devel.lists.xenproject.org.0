Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3B5211FD
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325335.547865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuJ-0005JP-AN; Tue, 10 May 2022 10:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325335.547865; Tue, 10 May 2022 10:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuJ-0005D6-4g; Tue, 10 May 2022 10:15:55 +0000
Received: by outflank-mailman (input) for mailman id 325335;
 Tue, 10 May 2022 10:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkLT=VS=citrix.com=prvs=122513738=lin.liu@srs-se1.protection.inumbo.net>)
 id 1noMuH-000561-Gr
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:15:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c50bdf-d04a-11ec-a406-831a346695d4;
 Tue, 10 May 2022 12:15:51 +0200 (CEST)
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
X-Inumbo-ID: 29c50bdf-d04a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652177751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0T/JNn3Dww3wHscmgvdIRfZs4Ekns00pQ2CWndQ/ZWk=;
  b=EEmsDdzTkk3Q8tscErIHkq4n3sRwpWEHI/InD3TnzKClI7uVBOATLtNn
   1BZ53g0S3DKWFLJCiNIIHrU9YP9Xq9iIx2XPE2hFrWAxSV8QPSVm68EGY
   tu/7NijKfS0Hb4zpbLJiKHuPrR91Y6ikMliSlmHRAHHWIU/dBiNGSJZ6k
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70954409
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bve7HqOmaevnueDvrR2vl8FynXyQoLVcMsEvi/4bfWQNrUok3jxUx
 2cbWmzTOvePZTSkfN5zPtvkpk4FupSEn942Gwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk29Yw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 sRwqqKtCj8SAI7Kk8gZagVoMAZjBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALKMjteocep1lrzC3DDOZgSpfGK0nPzYAAjWps2pgfdRrYT
 8MpKgI+dw3qXxRKAFMnVs4Yrd6CoUCqJlW0r3rK/PFqsgA/1jdZ0qXpMdfTUsyHQ4NShEnwj
 n3C13T0BFcdLtP34TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt9n4OCNRrf6tcky+8Ly4qQquCQsyMFZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZvvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBhos1QRdlFBN7faVUwZGKD+LF7rlyQF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPd/rUp5zkviwSYy4PhwxUjapSsIqHDJrAQk0PRLAt4wTuBZEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLamMne/HE96BQ1iEEXX8ris9ZMNKr7YcloO9aNII6a5/I7NsrdNx8x9/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:zPaLjKAGn+9BzZPlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70954409"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/6] xen: Switch to byteswap
Date: Tue, 10 May 2022 06:15:22 -0400
Message-ID: <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1652170719.git.lin.liu@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to use byteswap to swap bytes.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Changes in v3:
- Update xen/common/device_tree.c to use be32_to_cpu
- Keep const in type cast in unaligned.h
---
 xen/common/device_tree.c           | 44 +++++++++++++++---------------
 xen/common/libelf/libelf-private.h |  6 ++--
 xen/common/xz/private.h            |  2 +-
 xen/include/xen/unaligned.h        | 24 ++++++++--------
 4 files changed, 38 insertions(+), 38 deletions(-)

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
index 0a2b16d05d..16b2e6f5f0 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -20,62 +20,62 @@
 
 static inline uint16_t get_unaligned_be16(const void *p)
 {
-	return be16_to_cpup(p);
+	return be16_to_cpu(*(const uint16_t *)p);
 }
 
 static inline void put_unaligned_be16(uint16_t val, void *p)
 {
-	*(__force __be16*)p = cpu_to_be16(val);
+	*(__be16 *)p = cpu_to_be16(val);
 }
 
 static inline uint32_t get_unaligned_be32(const void *p)
 {
-	return be32_to_cpup(p);
+	return be32_to_cpu(*(const uint32_t *)p);
 }
 
 static inline void put_unaligned_be32(uint32_t val, void *p)
 {
-	*(__force __be32*)p = cpu_to_be32(val);
+	*(__be32 *)p = cpu_to_be32(val);
 }
 
 static inline uint64_t get_unaligned_be64(const void *p)
 {
-	return be64_to_cpup(p);
+	return be64_to_cpu(*(const uint64_t *)p);
 }
 
 static inline void put_unaligned_be64(uint64_t val, void *p)
 {
-	*(__force __be64*)p = cpu_to_be64(val);
+	*(__be64 *)p = cpu_to_be64(val);
 }
 
 static inline uint16_t get_unaligned_le16(const void *p)
 {
-	return le16_to_cpup(p);
+	return le16_to_cpu(*(const uint16_t *)p);
 }
 
 static inline void put_unaligned_le16(uint16_t val, void *p)
 {
-	*(__force __le16*)p = cpu_to_le16(val);
+	*(__le16 *)p = cpu_to_le16(val);
 }
 
 static inline uint32_t get_unaligned_le32(const void *p)
 {
-	return le32_to_cpup(p);
+	return le32_to_cpu(*(const uint32_t *)p);
 }
 
 static inline void put_unaligned_le32(uint32_t val, void *p)
 {
-	*(__force __le32*)p = cpu_to_le32(val);
+	*(__le32 *)p = cpu_to_le32(val);
 }
 
 static inline uint64_t get_unaligned_le64(const void *p)
 {
-	return le64_to_cpup(p);
+	return le64_to_cpu(*(const uint64_t *)p);
 }
 
 static inline void put_unaligned_le64(uint64_t val, void *p)
 {
-	*(__force __le64*)p = cpu_to_le64(val);
+	*(__le64 *)p = cpu_to_le64(val);
 }
 
 #endif /* __XEN_UNALIGNED_H__ */
-- 
2.27.0


