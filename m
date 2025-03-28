Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F3A74B61
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930664.1333289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0p-0006Sq-Bo; Fri, 28 Mar 2025 13:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930664.1333289; Fri, 28 Mar 2025 13:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0p-0006OE-3n; Fri, 28 Mar 2025 13:44:43 +0000
Received: by outflank-mailman (input) for mailman id 930664;
 Fri, 28 Mar 2025 13:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0n-0005Dj-1d
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:41 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb7af4c3-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:39 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so21519985e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:39 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:38 -0700 (PDT)
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
X-Inumbo-ID: cb7af4c3-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169479; x=1743774279; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLn8srVkw3Yg8gfwsGTdOECt81wVzaI0OabRG++w1eI=;
        b=iEEuRzEkzv5c8FcoYVegB9/wT3rXdc8PnT3tjiz+5oa6oZF69jM8bIbwWv8FBBXwx8
         1zYgG//xj8l+qc+jSzGojr4MomacheXeFjXZuIWUx3SsNLOSDhsBcZRxsgMmCsWHexuE
         lU/kmafPlRs9S2MhC2rGafsnaYcYYvSW7fvbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169479; x=1743774279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLn8srVkw3Yg8gfwsGTdOECt81wVzaI0OabRG++w1eI=;
        b=co81OiL1JnFpixxStUuBgUdnASUgTKWyOrdJ20pkAsGjQ26v6BJdgiNFNJJSU7LQoQ
         r8lqYUnLTeEQVD+2V59bzemMP2MU6XXn/sfqRQEaVPzWrvk56dqa6b0Fmj2SdUomrfjh
         eoUTWOQ9PVeaR+nwN4iVBP0LWCgE8HSKBmmrfiko9xgoOq+HM4cp+3StDWZess7HLtT2
         Wbp5uhkxpdBjGz9GRY8gdKO+jk0j4lCs1xqAt9/oYDqItTWn491GVldzt4XgHaumxk9l
         CI0nEqH10XZkAEQ7rxfBeGeXVd+bKFIdnhjqt/bpmSUv1IF1SF6UuvJjqLA2I2c6LCqK
         kN1g==
X-Gm-Message-State: AOJu0Ywi/2T+VH9tYqRN/Krh2bq++Fu3Ak9opnnMhGqQl+vHOD9l+pKb
	JfdeI6tuPZSi97YW2Xm5mztgvTOVuuW/beQFZOHKQvOz4P/SI5irHcaPUo9yWzdxlu4x9wIgPkS
	fDP0=
X-Gm-Gg: ASbGncv4bEbMh8NAQEII0aLsgUdVBSa3I/3kzQyxb5Bx8olSOHiJvpgh9AQ8/gtPp7+
	OvrlLLc7FZMCFSiY0bDVy/Rtb5QWAnrcQzIOya7vz9DPOXNDNrVev2LHIqZ7DXkb+TZMCn2yv2j
	/qddPNHoLH1eAkQe8ACyM+txJVgSdOruwlb2kYXUFMBPBBb00z4ilHS87moIfFtwedkERmpntjv
	DVBJDLhvxqqtmWufyRWNgm/JTOiDfSWqFfRcI6FeQqT/YrZliATrBM+PZBBnId7pUNBizY/l/iB
	+qZ4pwfdDiyNUaQL3FlhcB8czLeysu1q9GNGk7rdjbJ/km9rRaIMCZSZ2Edr8+eShGHyKjEFDZF
	zHV57hoQaMzR3OwzC6w==
X-Google-Smtp-Source: AGHT+IFpGaM1UkpZQawuV8q0zxzITdIPLaEq+TB4g1vBMIklq4bOPRRgoT1JeWiE0tZFtBzJtvDfEg==
X-Received: by 2002:a05:600c:4585:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43d84f8843dmr74418325e9.9.1743169478514;
        Fri, 28 Mar 2025 06:44:38 -0700 (PDT)
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
Subject: [PATCH v5 05/16] xen/device-tree: Remove use of *_to_cpup() helpers
Date: Fri, 28 Mar 2025 13:44:16 +0000
Message-Id: <20250328134427.874848-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
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


