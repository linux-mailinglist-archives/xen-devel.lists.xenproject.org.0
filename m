Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36DA8B7FE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955719.1349359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q7-00078Z-Oi; Wed, 16 Apr 2025 11:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955719.1349359; Wed, 16 Apr 2025 11:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q7-000771-FY; Wed, 16 Apr 2025 11:59:11 +0000
Received: by outflank-mailman (input) for mailman id 955719;
 Wed, 16 Apr 2025 11:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q5-0006Ay-3l
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:09 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3324370f-1aba-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 13:59:07 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3836436f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:07 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:06 -0700 (PDT)
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
X-Inumbo-ID: 3324370f-1aba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804747; x=1745409547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLn8srVkw3Yg8gfwsGTdOECt81wVzaI0OabRG++w1eI=;
        b=UNJ1NIq8Ec+ppcis4/ds/ezi+MqduU5CbZANVhhcfT2u2JZWyDjWDIIOeDNTEA5ACd
         R97cZyQwzd5zI+lbcfYwqWzHVI7RyWW9tCk7SMu3XVSoiZIvvgSoj631HscM8tThFPQs
         Ar5OyaBGwhLl4zVmAYBc3iNwCWRiylBmP3gMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804747; x=1745409547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLn8srVkw3Yg8gfwsGTdOECt81wVzaI0OabRG++w1eI=;
        b=nnP9xAUVqZwOtuLTWXJmw61bdSvk6KMgC1pLCkfTPMG4AYWScxhsBzspS6T9rSFGlR
         tx0Oqbcs1ypRofuZHyEkosIS+V4JbA/Ibx2Z2W4BCzvpINZjDnJuL6Sxx7j0oSDKPL5T
         587mRdQRMCZiLGbFWmp3KB/H1sHW9gOgvcjXTvmUHzMpEJo+o8Etd4dbFqAXhRkekfX6
         YePlCja19Z4/5rKNpFyJMrGVqRI9E1wkdbRteW+ziYnf7s6CSff+xy5PQU59p+GaaTzv
         a8N5wKClwJUp33z5rUn0+y6pZckxOtshaBs2LO7yus8pPufumoKu8aOkGgXc+KI82q7T
         XMqw==
X-Gm-Message-State: AOJu0Yw1ZTlWqpgzoNOlYCBaLflmd+lsdjacUSnruzFRmKxzmmuO4NYc
	lhwwcmxGsMNldxS6GKqWtJKqZwSAH8XnpSkxcvC6vUcBkI8fhAcK/ofke8/7akDLoq0mE0CYCBy
	GePs=
X-Gm-Gg: ASbGncvfD413BuDKHEqtgSTZ2xcb8luAWYqSbIOWDKAYW2xppkoM+HRFp2HzzbiYYQk
	cwCAiHfjanWGQ4llBC0rITeLYXbeUbykU3wHHct11rynkLxvNr09uFiYZRgMCFI7kqTr4UsSgKY
	eianeN42AH0CsSVVAERtztAYEQL9/ntI6xaQn1vNxKEF6Zl4iufhuWjUav6N3jWF+ST9tCX2VZs
	hUSXAr4UvhYbIghljbn16CWi6Vu4Rf/Xt8uu7L0s46/Xf9xLIfNQCTe7uROo6YjrEZGsqx/oGE2
	sofhekyWimoAcpCsIWoyQNPzNDWOkZ/h45A2+tOBD9qUyh7YVsDv61nLB+wSHCgzCAZZQXx0bdA
	cdDlKMoFEbtKrsQ==
X-Google-Smtp-Source: AGHT+IG0BvFDUI7ZzPBhP4pD1vvX0tHr0NmvdjD83GQcGluEoM9jjCiL45j2ttNYkLT3LMB5hjuygw==
X-Received: by 2002:a5d:64ae:0:b0:39c:1efb:ec9a with SMTP id ffacd0b85a97d-39ee5b13b3emr1483641f8f.6.1744804746627;
        Wed, 16 Apr 2025 04:59:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Lin Liu <lin.liu@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 04/15] xen/device-tree: Remove use of *_to_cpup() helpers
Date: Wed, 16 Apr 2025 12:58:49 +0100
Message-Id: <20250416115900.2491661-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

These wrappers simply hide a deference, which adds to the cognitive complexity
of reading the code.  As such, they're not going to be included in the new
byteswap infrastructure.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * Rebase
 * Split out of later patch
---
 xen/common/device-tree/device-tree.c | 44 ++++++++++++++--------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index e8f810b2fe10..90fee2ba0315 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -173,7 +173,7 @@ bool dt_property_read_u32(const struct dt_device_node *np,
     if ( !val || len < sizeof(*out_value) )
         return 0;
 
-    *out_value = be32_to_cpup(val);
+    *out_value = be32_to_cpu(*val);
 
     return 1;
 }
@@ -266,7 +266,7 @@ int dt_property_read_variable_u32_array(const struct dt_device_node *np,
 
     count = sz;
     while ( count-- )
-        *out_values++ = be32_to_cpup(val++);
+        *out_values++ = be32_to_cpu(*val++);
 
     return sz;
 }
@@ -493,7 +493,7 @@ static int __dt_n_addr_cells(const struct dt_device_node *np, bool parent)
 
         ip = dt_get_property(np, "#address-cells", NULL);
         if ( ip )
-            return be32_to_cpup(ip);
+            return be32_to_cpu(*ip);
     } while ( np->parent );
     /* No #address-cells property for the root node */
     return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
@@ -510,7 +510,7 @@ static int __dt_n_size_cells(const struct dt_device_node *np, bool parent)
 
         ip = dt_get_property(np, "#size-cells", NULL);
         if ( ip )
-            return be32_to_cpup(ip);
+            return be32_to_cpu(*ip);
     } while ( np->parent );
     /* No #address-cells property for the root node */
     return DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
@@ -643,7 +643,7 @@ static void dt_bus_pci_count_cells(const struct dt_device_node *np,
 static unsigned int dt_bus_pci_get_flags(const __be32 *addr)
 {
     unsigned int flags = 0;
-    u32 w = be32_to_cpup(addr);
+    u32 w = be32_to_cpu(*addr);
 
     switch((w >> 24) & 0x03) {
     case 0x01:
@@ -1096,7 +1096,7 @@ dt_irq_find_parent(const struct dt_device_node *child)
         if ( parp == NULL )
             p = dt_get_parent(child);
         else
-            p = dt_find_node_by_phandle(be32_to_cpup(parp));
+            p = dt_find_node_by_phandle(be32_to_cpu(*parp));
         child = p;
     } while ( p && dt_get_property(p, "#interrupt-cells", NULL) == NULL );
 
@@ -1129,7 +1129,7 @@ unsigned int dt_number_of_irq(const struct dt_device_node *device)
     intlen /= sizeof(*intspec);
 
     dt_dprintk(" using 'interrupts' property\n");
-    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
+    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpu(*intspec), intlen);
 
     /* Look for the interrupt parent. */
     p = dt_irq_find_parent(device);
@@ -1260,7 +1260,7 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
         imaplen -= addrsize + intsize;
 
         /* Get the interrupt parent */
-        ipar = dt_find_node_by_phandle(be32_to_cpup(imap));
+        ipar = dt_find_node_by_phandle(be32_to_cpu(*imap));
         imap++;
         --imaplen;
 
@@ -1377,8 +1377,8 @@ static int dt_irq_map_raw(const struct dt_device_node *parent,
     int match, i;
 
     dt_dprintk("dt_irq_map_raw: par=%s,intspec=[0x%08x 0x%08x...],ointsize=%d\n",
-               parent->full_name, be32_to_cpup(intspec),
-               be32_to_cpup(intspec + 1), ointsize);
+               parent->full_name, be32_to_cpu(*intspec),
+               be32_to_cpu(*(intspec+1)), ointsize);
 
     ipar = parent;
 
@@ -1490,7 +1490,7 @@ static int dt_irq_map_raw(const struct dt_device_node *parent,
             dt_dprintk(" -> match=%d (imaplen=%d)\n", match, imaplen);
 
             /* Get the interrupt parent */
-            newpar = dt_find_node_by_phandle(be32_to_cpup(imap));
+            newpar = dt_find_node_by_phandle(be32_to_cpu(*imap));
             imap++;
             --imaplen;
 
@@ -1584,7 +1584,7 @@ int dt_device_get_raw_irq(const struct dt_device_node *device,
     intlen /= sizeof(*intspec);
 
     dt_dprintk(" using 'interrupts' property\n");
-    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
+    dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpu(*intspec), intlen);
 
     /* Look for the interrupt parent. */
     p = dt_irq_find_parent(device);
@@ -1695,7 +1695,7 @@ static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
          * If phandle is 0, then it is an empty entry with no
          * arguments.  Skip forward to the next entry.
          * */
-        phandle = be32_to_cpup(list++);
+        phandle = be32_to_cpu(*list++);
         if ( phandle )
         {
             /*
@@ -1764,7 +1764,7 @@ static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
                 out_args->np = node;
                 out_args->args_count = count;
                 for ( i = 0; i < count; i++ )
-                    out_args->args[i] = be32_to_cpup(list++);
+                    out_args->args[i] = be32_to_cpu(*list++);
             }
 
             /* Found it! return success */
@@ -1845,7 +1845,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
     int has_name = 0;
     int new_format = 0;
 
-    tag = be32_to_cpup((__be32 *)(*p));
+    tag = be32_to_cpu(*(__be32 *)(*p));
     if ( tag != FDT_BEGIN_NODE )
     {
         printk(XENLOG_WARNING "Weird tag at start of node: %x\n", tag);
@@ -1938,7 +1938,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
         u32 sz, noff;
         const char *pname;
 
-        tag = be32_to_cpup((__be32 *)(*p));
+        tag = be32_to_cpu(*(__be32 *)(*p));
         if ( tag == FDT_NOP )
         {
             *p += 4;
@@ -1947,8 +1947,8 @@ static unsigned long unflatten_dt_node(const void *fdt,
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
@@ -1975,13 +1975,13 @@ static unsigned long unflatten_dt_node(const void *fdt,
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
@@ -2053,7 +2053,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
             *p += 4;
         else
             mem = unflatten_dt_node(fdt, mem, p, np, allnextpp, fpsize);
-        tag = be32_to_cpup((__be32 *)(*p));
+        tag = be32_to_cpu(*(__be32 *)(*p));
     }
     if ( tag != FDT_END_NODE )
     {
@@ -2099,7 +2099,7 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
     /* Second pass, do actual unflattening */
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
-    if ( be32_to_cpup((__be32 *)start) != FDT_END )
+    if ( be32_to_cpu(*(__be32 *)start) != FDT_END )
     {
         printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
-- 
2.39.5


