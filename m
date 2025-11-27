Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4815C8F81A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174225.1499211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOepE-0008Ib-Sm; Thu, 27 Nov 2025 16:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174225.1499211; Thu, 27 Nov 2025 16:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOepE-0008DX-NW; Thu, 27 Nov 2025 16:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1174225;
 Thu, 27 Nov 2025 16:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOepC-0007Yx-Mz
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 16:26:30 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d410c3db-cbad-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 17:26:29 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-645a13e2b17so1643403a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 08:26:29 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59e8936sm195126666b.48.2025.11.27.08.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 08:26:28 -0800 (PST)
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
X-Inumbo-ID: d410c3db-cbad-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260789; x=1764865589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJO0ng5o5yyW9xuL/pTzoWvO4SGxMGvB+mY9Dx7HkYk=;
        b=H9VUKhPQ6lDgf+v++pEudFoRf1DCSOkIcQRyLVxUPnOh8te8kZyaFOeMAMsJJ1wJhg
         XleJQf/39AgB4h8u+QbkGRiRv0jDCvn3fq7BMxRSJVfu0Dr1YA4XWs2V5cS6SBS49YXd
         fNK2vUQ5DWTzXJT4rVCDCQd6ZnXB7w0Ziv+/+I3E6CEWNtIajPpyAJJ4Sq/755hHp8IO
         pK74xXX2cpA7mkou5BXBWyZgqzKA0ieK7EHx8D6/IKqfRlvgdZ0ZoS3Rr7TsGeKEdPjL
         gasNeODpGYxzX6hSuE/NaHA0YYTjRsti7RAWM6ulnmW0OvWVki9DqbeT1kps1KYOvqKA
         aa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260789; x=1764865589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJO0ng5o5yyW9xuL/pTzoWvO4SGxMGvB+mY9Dx7HkYk=;
        b=LZN+aZuxxK+ECF8XaU+jN7HPeCHmi8ZzEINRbyg7//koUaEBT22Gnr965/p43qcmGL
         szsUcpUyev6Ev1v6JS+mT0CByrVj7sBttv3VAxtmBLjSKFqoa+GKgaWocWpYnlwdDJnC
         qu8/RmEm1fdTHj4e3g9oJb6PE+1fjKzcXxgzlooPmNHOVXWZWthiaSp1D5sD2207hc0Q
         omO7BLpPMEvbGRlQKYwNDXbC7y/g/n+v9hlVghQpqcoeHiO1kjDL26Va8Pn8sI7Su9/H
         2CGpcLaZRDbS8mfec2NanPIXWInV4ONDP2FrVHBipowpdU47E5v9p9tzJWKdUyaC2qeO
         L9IA==
X-Gm-Message-State: AOJu0Yw7tjXB9WFmO2SOiaQ5PKdylL/CZwqGs3NE+K3EtpApgfI34GGF
	AVtpNdGzdC8jVZHCMZISG/Kakp7xAuBNhL3Nqrm4kfn0dI4izB+N4YqE+E5eLOBI
X-Gm-Gg: ASbGncvVMar2Az26m7m9S6uLP9fQm5D9P6e1C1kpwI131eY1XT2Q3C/M4I+9OW4Hjxl
	Po9J5ADI4s6Q86SOQLg8aAtjXQL8TYD0dEk3+tfMxv2+XvmJcGAZlzix1n4QLU2RzDyKpc1xXJ5
	5YJCebXrKua0XuG1EntF3pfK4V8XQdAWFkj0HT543ZwsQZFJezrholwLOlehPAaXucuPK8GlTSl
	onq4VEIYRw9CgIzyXvb68qpgRHrqNT/OOQq+/0idbJvkeL+2vH/rXK3O2bCYmzMrVUd08aIbJzv
	7/Y8ha1wHO9XRJ5YgoQ0sxZxSZtKLuYKArDbk/LU+ybfFjKX+RmnWtWm99rHOTgyu8wIGJgXiZh
	jb2PFWOfRqb6PEEjFj3RIwVzzp3pEHACQCochvFl1Rxb98g2fN4u2sQPAC5RRiNDuYSnHHkMKiN
	aSYH1c+MZEKW8OIhe9/0uvbU5+xcOLB2vXxU81UEknDcEAo4ztUIGKHMk=
X-Google-Smtp-Source: AGHT+IG8DwRwNQiY0JL/nWbRuKF7SR0T0SwN+vZAP3T0clF5BO6AzbohFKQfGCTYMk7eqB5w5UbUaw==
X-Received: by 2002:a17:907:1ca8:b0:b76:4c16:6b06 with SMTP id a640c23a62f3a-b76c546d9demr1278704366b.1.1764260788814;
        Thu, 27 Nov 2025 08:26:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/dom0less: move make_memory_node() to common code
Date: Thu, 27 Nov 2025 17:26:16 +0100
Message-ID: <dba41b3415313112a7612b5cfaf7ce0ee4a4a1ee.1764260246.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764260246.git.oleksii.kurochko@gmail.com>
References: <cover.1764260246.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make_memory_node() does not rely on any Arm-specific functionality and is
fully reused by RISC-V, making it a good candidate to move into common code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch
---
 xen/arch/arm/domain_build.c           | 74 --------------------------
 xen/common/device-tree/domain-build.c | 75 +++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 74 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6d1c9583b1..986a456f17 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -646,80 +646,6 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
     return res;
 }
 
-int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
-                            int sizecells, const struct membanks *mem)
-{
-    void *fdt = kinfo->fdt;
-    unsigned int i;
-    int res, reg_size = addrcells + sizecells;
-    int nr_cells = 0;
-    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
-    __be32 *cells;
-
-    if ( mem->nr_banks == 0 )
-        return -ENOENT;
-
-    /* find the first memory range that is reserved for device (or firmware) */
-    for ( i = 0; i < mem->nr_banks &&
-                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
-        ;
-
-    if ( i == mem->nr_banks )
-        return 0;
-
-    dt_dprintk("Create memory node\n");
-
-    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
-    if ( res )
-        return res;
-
-    res = fdt_property_string(fdt, "device_type", "memory");
-    if ( res )
-        return res;
-
-    cells = &reg[0];
-    for ( ; i < mem->nr_banks; i++ )
-    {
-        u64 start = mem->bank[i].start;
-        u64 size = mem->bank[i].size;
-
-        if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
-             (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
-            continue;
-
-        nr_cells += reg_size;
-        BUG_ON(nr_cells >= ARRAY_SIZE(reg));
-        dt_child_set_range(&cells, addrcells, sizecells, start, size);
-    }
-
-    /*
-     * static shared memory banks need to be listed as /memory node, so when
-     * this function is handling the normal memory, add the banks.
-     */
-    if ( mem == kernel_info_get_mem_const(kinfo) )
-        shm_mem_node_fill_reg_range(kinfo, reg, &nr_cells, addrcells,
-                                    sizecells);
-
-    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
-    {
-        uint64_t start = dt_read_number(cells, addrcells);
-        uint64_t size = dt_read_number(cells + addrcells, sizecells);
-
-        dt_dprintk("  Bank %u: %#"PRIx64"->%#"PRIx64"\n",
-                   i, start, start + size);
-    }
-
-    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
-
-    res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
-    if ( res )
-        return res;
-
-    res = fdt_end_node(fdt);
-
-    return res;
-}
-
 int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
                            void *data)
 {
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 774790aab3..6708c9dd66 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -8,6 +8,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
+#include <xen/static-shmem.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
 
@@ -451,6 +452,80 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
+int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                            int sizecells, const struct membanks *mem)
+{
+    void *fdt = kinfo->fdt;
+    unsigned int i;
+    int res, reg_size = addrcells + sizecells;
+    int nr_cells = 0;
+    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
+    __be32 *cells;
+
+    if ( mem->nr_banks == 0 )
+        return -ENOENT;
+
+    /* find the first memory range that is reserved for device (or firmware) */
+    for ( i = 0; i < mem->nr_banks &&
+                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
+        ;
+
+    if ( i == mem->nr_banks )
+        return 0;
+
+    dt_dprintk("Create memory node\n");
+
+    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "device_type", "memory");
+    if ( res )
+        return res;
+
+    cells = &reg[0];
+    for ( ; i < mem->nr_banks; i++ )
+    {
+        u64 start = mem->bank[i].start;
+        u64 size = mem->bank[i].size;
+
+        if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
+             (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
+            continue;
+
+        nr_cells += reg_size;
+        BUG_ON(nr_cells >= ARRAY_SIZE(reg));
+        dt_child_set_range(&cells, addrcells, sizecells, start, size);
+    }
+
+    /*
+     * static shared memory banks need to be listed as /memory node, so when
+     * this function is handling the normal memory, add the banks.
+     */
+    if ( mem == kernel_info_get_mem_const(kinfo) )
+        shm_mem_node_fill_reg_range(kinfo, reg, &nr_cells, addrcells,
+                                    sizecells);
+
+    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
+    {
+        uint64_t start = dt_read_number(cells, addrcells);
+        uint64_t size = dt_read_number(cells + addrcells, sizecells);
+
+        dt_dprintk("  Bank %u: %#"PRIx64"->%#"PRIx64"\n",
+                   i, start, start + size);
+    }
+
+    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
+
+    res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.52.0


