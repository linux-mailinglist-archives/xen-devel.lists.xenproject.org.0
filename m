Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA084CE20
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677774.1054606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjwh-0003UN-Gc; Wed, 07 Feb 2024 15:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677774.1054606; Wed, 07 Feb 2024 15:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjwh-0003SE-DH; Wed, 07 Feb 2024 15:34:43 +0000
Received: by outflank-mailman (input) for mailman id 677774;
 Wed, 07 Feb 2024 15:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXjwg-0003S3-0H
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:34:42 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68c1c7c3-c5ce-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 16:34:41 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fdd65a9bdso6532175e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:34:41 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y8-20020a1c4b08000000b0040efa7e0ef6sm1982413wma.1.2024.02.07.07.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:34:39 -0800 (PST)
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
X-Inumbo-ID: 68c1c7c3-c5ce-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707320079; x=1707924879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAUGm5BQ2CDJSgo+yjmiDzO6K/rlrbqNJIMvARSp6N8=;
        b=cXCnLLh9N84OdjthCIE7V6f4S1TmpJV8f/bfd/gPL1jrSTbI+0ozoVGZ+ItjVZyow3
         8HWsFSvC0uYBvjwlhQ8dl4wR9vgEiIFVNh9kQvMN73oS58IH/W4YArZ8QRbD1Vef8jNx
         ytgE13TY4EMPuWqQGHMsirJMnTUoiKZBpH9uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320079; x=1707924879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAUGm5BQ2CDJSgo+yjmiDzO6K/rlrbqNJIMvARSp6N8=;
        b=T5imYbETbnS+5zgvT4OqpOlrVbBZf81smlmep0sX8hqEKj85fUsiJXv398W18811GV
         Slnf3oEI/JiC+UM2XhCrLL/sUj0PlLvA0L/zZ0d3Tu8ZfV9eVc0FO/C0TXVUndsF5Y/T
         mWzQs1zVo12YdR1J6Cfb0i1UNJ4iKM6t8Ww25kX/vZQsKRA1Ri8v2B+Ovo55vNZnVhey
         Y6estN0FG8WDUwl8N00JKWF2rscBSl3lvKwxoJgUmlgvcHp5ItR9a9z/fAbbUw7HZz+f
         oKlxZvhZ0KU2kwYcZD1w8eYL9lc2Q+5Hjsh3MkeqkHcfWpD0EXZme9SO2zUjToLF27cj
         Mexg==
X-Gm-Message-State: AOJu0Ywwf36XxlYqDIOhokbTQqx7ks+UEHsOp8OzT+hGgezIfvX2ca8W
	vJd/75Z6v/7Z9LBRVz11wy0QsjHzi3XG7fkiaM3w6t6Si4A9SLYZ60TQTIzKPu+Bm2MDDeDHeOk
	w
X-Google-Smtp-Source: AGHT+IHQdJiMUElRKYkV3M2QvteScs7wP8fNpCIY8aDlKhEMYuhQkII21gP4aWfhMtW72liPaTE1zg==
X-Received: by 2002:a05:600c:1546:b0:40e:e6ce:71ff with SMTP id f6-20020a05600c154600b0040ee6ce71ffmr5121019wmg.41.1707320079483;
        Wed, 07 Feb 2024 07:34:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEiYt/ZlEJtoORU7kmwIMAhM8Iw4nesL+AsoVCyQWc//fgThW/YHUyMTIdqcVkI0YEo5s3eJqOwNKl9tQpnLqYVTZNvq80ayXn9GaWa+BCvAhclfq4k69iza2SPd8Oapy1kXpxsx9EfEuj6d+QiB45Z3t36+5C
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 1/2] iommu/x86: introduce a generic IVMD/RMRR range validity helper
Date: Wed,  7 Feb 2024 16:34:16 +0100
Message-ID: <20240207153417.89975-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207153417.89975-1-roger.pau@citrix.com>
References: <20240207153417.89975-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

IVMD and RMRR ranges are functionally equivalent, and as so could use the same
validity checker.

Move the IVMD to x86 common IOMMU code and adjust the function to take a pair
of [start, end] mfn parameters.

So far only the AMD-Vi side is adjusted to use the newly introduced helper, the
VT-d side will be adjusted in a further change.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Fix usage of ERR/WARN in messages.
 - Pass region as an inclusive range.
 - Pass log message prefix.
---
 xen/arch/x86/include/asm/iommu.h         |  3 ++
 xen/drivers/passthrough/amd/iommu_acpi.c | 38 ++------------------
 xen/drivers/passthrough/x86/iommu.c      | 46 ++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 15a848ddc329..2b97cb442edd 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -135,6 +135,9 @@ struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
                                                    uint64_t contig_mask);
 void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
 
+/* Check [start, end] unity map range for correctness. */
+bool iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end);
+
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
  * Local variables:
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index ca70f4f3ae2c..3f5508eba049 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -405,41 +405,9 @@ static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)
         return 0;
     }
 
-    if ( !e820_all_mapped(base, limit + PAGE_SIZE, E820_RESERVED) )
-    {
-        paddr_t addr;
-
-        AMD_IOMMU_WARN("IVMD: [%lx,%lx) is not (entirely) in reserved memory\n",
-                       base, limit + PAGE_SIZE);
-
-        for ( addr = base; addr <= limit; addr += PAGE_SIZE )
-        {
-            unsigned int type = page_get_ram_type(maddr_to_mfn(addr));
-
-            if ( type == RAM_TYPE_UNKNOWN )
-            {
-                if ( e820_add_range(addr, addr + PAGE_SIZE,
-                                    E820_RESERVED) )
-                    continue;
-                AMD_IOMMU_ERROR("IVMD: page at %lx couldn't be reserved\n",
-                                addr);
-                return -EIO;
-            }
-
-            /*
-             * Types which aren't RAM are considered good enough.
-             * Note that a page being partially RESERVED, ACPI or UNUSABLE will
-             * force Xen into assuming the whole page as having that type in
-             * practice.
-             */
-            if ( type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
-                         RAM_TYPE_UNUSABLE) )
-                continue;
-
-            AMD_IOMMU_ERROR("IVMD: page at %lx can't be converted\n", addr);
-            return -EIO;
-        }
-    }
+    if ( !iommu_unity_region_ok("IVMD", maddr_to_mfn(base),
+                                maddr_to_mfn(limit)) )
+        return -EIO;
 
     if ( ivmd_block->header.flags & ACPI_IVMD_EXCLUSION_RANGE )
         exclusion = true;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index c90755ff58fa..d867490e25dc 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -792,6 +792,52 @@ static int __init cf_check adjust_irq_affinities(void)
 }
 __initcall(adjust_irq_affinities);
 
+bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
+{
+    mfn_t addr;
+
+    if ( e820_all_mapped(mfn_to_maddr(start), mfn_to_maddr(end) + PAGE_SIZE,
+                         E820_RESERVED) )
+        return true;
+
+    printk(XENLOG_WARNING "%s: [%#" PRI_mfn " ,%#" PRI_mfn
+           "] is not (entirely) in reserved memory\n",
+           prefix, mfn_x(start), mfn_x(end));
+
+    for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
+    {
+        unsigned int type = page_get_ram_type(addr);
+
+        if ( type == RAM_TYPE_UNKNOWN )
+        {
+            if ( e820_add_range(mfn_to_maddr(addr),
+                                mfn_to_maddr(addr) + PAGE_SIZE, E820_RESERVED) )
+                continue;
+            printk(XENLOG_ERR
+                   "%s: page at %#" PRI_mfn " couldn't be reserved\n",
+                   prefix, mfn_x(addr));
+            return false;
+        }
+
+        /*
+         * Types which aren't RAM are considered good enough.
+         * Note that a page being partially RESERVED, ACPI or UNUSABLE will
+         * force Xen into assuming the whole page as having that type in
+         * practice.
+         */
+        if ( type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
+                     RAM_TYPE_UNUSABLE) )
+            continue;
+
+        printk(XENLOG_ERR
+               "%s: page at %#" PRI_mfn " can't be converted\n",
+               prefix, mfn_x(addr));
+        return false;
+    }
+
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.43.0


