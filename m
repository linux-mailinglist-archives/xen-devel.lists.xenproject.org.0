Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB1845E0D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674567.1049633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaSB-0007bI-Ok; Thu, 01 Feb 2024 17:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674567.1049633; Thu, 01 Feb 2024 17:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaSB-0007Z0-KM; Thu, 01 Feb 2024 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 674567;
 Thu, 01 Feb 2024 17:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVaS9-0007Wp-Vh
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:02:17 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a67f37fb-c123-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 18:02:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a354408e6bfso393531766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 09:02:15 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 x13-20020aa7dacd000000b0055eb8830906sm5799854eds.85.2024.02.01.09.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:02:14 -0800 (PST)
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
X-Inumbo-ID: a67f37fb-c123-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706806935; x=1707411735; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaBUruy8bPZuvsCRWTLi8TtvG3+zI8gmjxbPMfpVXBQ=;
        b=lQiuQocOtK++8BUqK7RASUFT0dAorXBb8lITr9CLEtfmLuXp2/rbXS91qk7twI26SL
         JIAcGZ05qTqkOMnc96G44qVKFmU6AKFHyje8haxM62B/2DavS9hQVSWRR5UMUiWyUeaU
         YTf2agBBCDfRsbqh3Z8x7R6BWq1q86pl4nG10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806935; x=1707411735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaBUruy8bPZuvsCRWTLi8TtvG3+zI8gmjxbPMfpVXBQ=;
        b=ZeKhbMKzxR5HrtUofWqxSMDR4ChAgQs4BI4K61PcZeQO1Lk2YEyi7oLn393Xi3WwGp
         TmRL4voIf0gJeoPqoYTxSJeaQhn8N6nkdUXKJDGvYDrtosYYmALkFpm3ZjOCAEhKIVHf
         rOmiIBeY0r38yHQia+JLApTVtp0yV2ELJAAzfIkJCv3gM0hck3JsCBqemLhZ+CXJN5Vi
         q9VJzUije0PIfZqGlqSe7lf1fG46QMgfyPYkGDpxVcbJqNhTde8hUlNBTaliog1IY6LH
         hKvEwVpudXlvXgKk4xkVgkISWVJ+vzCYB6m5CY9iMINYxAqCQiJ7YKagzc67cgJxQ2pJ
         jn/Q==
X-Gm-Message-State: AOJu0YwCteBCGziwDdqJLCCbZQ/ql3230lBfKZiQ8UZCgG1VxeqNOAdQ
	L+/82K9Xch1H83pI86K+UhIAtX+NpJ7B8HYCMvRNkVtbfGDbHXipUNMQjkfIsGzrBh3ofOIClUf
	Z
X-Google-Smtp-Source: AGHT+IGXtQwRJDikIm3QRBpY+NsFJJ2VzaJ8sihA2KkXMbRjVgXNsY2axsutk7Ypvh3WHZBEw62lBw==
X-Received: by 2002:a17:907:20ee:b0:a36:83b6:385a with SMTP id rh14-20020a17090720ee00b00a3683b6385amr4052264ejb.7.1706806934981;
        Thu, 01 Feb 2024 09:02:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXz9y6qNecsuzFbhqWvYu586TWh1h6wyME4CUQvvl+rXnQoYcXO6n+vN0EpxXhLKl8Wiu3E8XwBAwUKxc2D8TZVTyBcQfdIoGy5xyisZNJMxu6cseqarQdNLbEAC101yEK4quN+35e9TF0/CLdY3xHpZRi1M43P
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 2/4] iommu/x86: introduce a generic IVMD/RMRR range validity helper
Date: Thu,  1 Feb 2024 18:01:57 +0100
Message-ID: <20240201170159.66330-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201170159.66330-1-roger.pau@citrix.com>
References: <20240201170159.66330-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

IVMD and RMRR ranges are functionally equivalent, and as so could use the same
validity checker.

Move the IVMD to x86 common IOMMU code and adjust the function to take a pair
of [start, end) mfn parameters.

So far only the AMD-Vi side is adjusted to use the newly introduced helper, the
VT-d side will be adjusted in a further change.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/iommu.h         |  3 ++
 xen/drivers/passthrough/amd/iommu_acpi.c | 38 ++------------------
 xen/drivers/passthrough/x86/iommu.c      | 46 ++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 15a848ddc329..5c7e37331aad 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -135,6 +135,9 @@ struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd,
                                                    uint64_t contig_mask);
 void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
 
+/* Check [start, end) unity map range for correctness. */
+bool iommu_unity_region_ok(mfn_t start, mfn_t end);
+
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
  * Local variables:
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index ca70f4f3ae2c..40468dbbccf3 100644
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
+    if ( !iommu_unity_region_ok(maddr_to_mfn(base),
+                                maddr_to_mfn(limit + PAGE_SIZE)) )
+        return -EIO;
 
     if ( ivmd_block->header.flags & ACPI_IVMD_EXCLUSION_RANGE )
         exclusion = true;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index c90755ff58fa..63d4cb898218 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -792,6 +792,52 @@ static int __init cf_check adjust_irq_affinities(void)
 }
 __initcall(adjust_irq_affinities);
 
+bool __init iommu_unity_region_ok(mfn_t start, mfn_t end)
+{
+    mfn_t addr;
+
+    if ( e820_all_mapped(mfn_to_maddr(start), mfn_to_maddr(end),
+                         E820_RESERVED) )
+        return true;
+
+    printk(XENLOG_WARNING "IOMMU: [%#" PRI_mfn " ,%#" PRI_mfn
+           ") is not (entirely) in reserved memory\n",
+           mfn_x(start), mfn_x(end));
+
+    for ( addr = start; !mfn_eq(addr, end); mfn_add(addr, 1) )
+    {
+        unsigned int type = page_get_ram_type(addr);
+
+        if ( type == RAM_TYPE_UNKNOWN )
+        {
+            if ( e820_add_range(mfn_to_maddr(addr),
+                                mfn_to_maddr(addr) + PAGE_SIZE, E820_RESERVED) )
+                continue;
+            printk(XENLOG_WARNING
+                   "IOMMU: page at %#" PRI_mfn " couldn't be reserved\n",
+                   mfn_x(addr));
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
+        printk(XENLOG_WARNING
+               "IOMMU: page at %#" PRI_mfn " can't be converted\n",
+               mfn_x(addr));
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


