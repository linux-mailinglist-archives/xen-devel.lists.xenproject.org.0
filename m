Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75BC9CDE9A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837503.1253448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvjv-0005v2-JX; Fri, 15 Nov 2024 12:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837503.1253448; Fri, 15 Nov 2024 12:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvjv-0005sA-F1; Fri, 15 Nov 2024 12:47:55 +0000
Received: by outflank-mailman (input) for mailman id 837503;
 Fri, 15 Nov 2024 12:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwMO=SK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBvjt-0005bz-Kx
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:47:53 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d262acb8-a34f-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 13:47:50 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cf8ef104a8so997724a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 04:47:50 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08617esm177517666b.182.2024.11.15.04.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 04:47:48 -0800 (PST)
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
X-Inumbo-ID: d262acb8-a34f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQyNjJhY2I4LWEzNGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc0ODcwLjA4NTcyMywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731674869; x=1732279669; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEabXhnDCZBkAxQb2YAcqwtP5dRDr3GWAS7aIXDMD3Q=;
        b=f/KnMpJU1Mo0kz3nC3t/D0yYeEMt39r9oBVFZjhu6vtjbX3u5ZNIkyujnW9MhE4GsT
         nP7+cDvT7v1x7Bs4QhHyhgCcGLIKA+rwrSWyT2twaVrRhq47fCIN0+x5weBYZBvX+YW/
         w3gef7LQbaGFtizmszdcjeLA6C2tbcCiKVYysncYIDoG28hjZKtMKCiY/I4c+H5xNqHT
         yvXpl2X7236Oayfr7U/0jou3jqVxdG4IYuU+ab2fkjSP4QuDrYlNqe7iQsdMvvdGgxLV
         lyyyJOB6pDMNVeeIpyhi03pwz2AePf13Lu6/YOz7Sbvb4v/MBAhIr8SEadYBUXmBl1It
         JD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674869; x=1732279669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEabXhnDCZBkAxQb2YAcqwtP5dRDr3GWAS7aIXDMD3Q=;
        b=KUvyIGOURXfzvYMm9gdfkItcxpDyZV+nohXYX+2oUOrVmjhFv4uB/Z/a12AWYs+2I6
         BAbbQwGX3EAPT01Zkr5aukI9lkNmG9e0+CCfpMlasL5peIIISwyHzkgZUWEWn5vDpve7
         WLereJOUj5eIYIhklkKo/QQLxL1TtTfuldsnBtP6mEVZgl0NqEX8sVwVvFNPuajdHJil
         dS24JaZlwc26ehp8RdPIgiWmk8FPzfmoQTNcZIEEurHlvJnJ46GB98ZveKBf7MabtbEi
         AwSKfbBeA9YBZiPwxBlIA4a4kJv9iFKP/Xz+zlQOsuiXFgF3EnUNYp3gLgy7Bk4pqOfB
         MbNw==
X-Gm-Message-State: AOJu0YyRBtaOT/P7yYEVFNhHmU5b+2kk4JovFbLwFYl3/uGEFZC20/vQ
	Hb07henPhvA/VZWjjypsc2DWCCgf5kIW6l9LpRVji/xjaxChixgrDvzD2Q==
X-Google-Smtp-Source: AGHT+IHyL8W6BnfA0G569rqa7yqsFxUp+TICeophepF8sdr4q6qb5ORNahh4H1KInpL14tOcU2gaPw==
X-Received: by 2002:a17:907:7faa:b0:a9f:508:5f5a with SMTP id a640c23a62f3a-aa4835096c0mr171572066b.40.1731674868955;
        Fri, 15 Nov 2024 04:47:48 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 2/3] xen/riscv: initialize the VMAP_DEFAULT virtual range
Date: Fri, 15 Nov 2024 13:47:43 +0100
Message-ID: <807e532e8c7d07778dfe58a442f318d557ca4f77.1731672668.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731672668.git.oleksii.kurochko@gmail.com>
References: <cover.1731672668.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call vm_init() to initialize the VMAP_DEFAULT virtual range.

To support this, introduce the populate_pt_range() and
arch_vmap_virt_end() functions, which are used by
vm_init()->vm_init_type().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V6:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/mm.c    | 11 +++++------
 xen/arch/riscv/pt.c    |  6 ++++++
 xen/arch/riscv/setup.c |  3 +++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 2db1193bac..9359dc7f33 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -351,12 +351,6 @@ void arch_dump_shared_mem_info(void)
     BUG_ON("unimplemented");
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
-
 int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
                               union add_to_physmap_extra extra,
                               unsigned long idx, gfn_t gfn)
@@ -571,3 +565,8 @@ void __init setup_mm(void)
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
 }
+
+void *__init arch_vmap_virt_end(void)
+{
+    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
+}
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index cc5e2d3266..d62aceb36c 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -1,6 +1,7 @@
 #include <xen/bug.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
@@ -419,3 +420,8 @@ int map_pages_to_xen(unsigned long virt,
 
     return pt_update(virt, mfn, nr_mfns, flags);
 }
+
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 2887a18c0c..3652cb056d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
+#include <xen/vmap.h>
 
 #include <public/version.h>
 
@@ -62,6 +63,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     setup_mm();
 
+    vm_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


