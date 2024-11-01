Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B359B91C3
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829112.1244205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWN-00013P-8n; Fri, 01 Nov 2024 13:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829112.1244205; Fri, 01 Nov 2024 13:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rWN-00010z-5K; Fri, 01 Nov 2024 13:16:59 +0000
Received: by outflank-mailman (input) for mailman id 829112;
 Fri, 01 Nov 2024 13:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZeD=R4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6rWL-0000WD-8V
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:16:57 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e866fbe-9853-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 14:16:51 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539f7606199so2014122e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 06:16:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbcf6sm549745e87.194.2024.11.01.06.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:16:47 -0700 (PDT)
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
X-Inumbo-ID: 8e866fbe-9853-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzMiLCJoZWxvIjoibWFpbC1sZjEteDEzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhlODY2ZmJlLTk4NTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDY3MDExLjM4Nzc2Miwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467010; x=1731071810; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raCa0Y19+glB0odfz1RMTbbLMqPF4E5Qqp9OuEhrM1g=;
        b=DPzaaxiexH/8i3wfHvGCMsFZi5Ro8ERvvjjP4QavweyKNITbhyKfKeC3+QPCKPGXMo
         ms4HnYJphjQcvVTj3BYcrGnRBdPb12X2rdfEwugwjlJapX4IXRV8tGLTV2QS2AqOypnG
         RjAtIl5i4o7qiHXuwca2qXrpSOyHE/a/bL795iR+6aMz72NF5UK3nf8t6oqm5zmcmEHH
         rR3FwtG/WYkKl6shOKzBTMs0ctfm6J7XXQkLDVu3Sj783Ql7gFWOiAGwQf/GDzS7Nlvt
         Xo20Px3cs4tsV2Rhqob0x/Uw9vm181YyOec11V2xH48jAz8Ftr+pf3umjiw49qlxJSKv
         Sb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467010; x=1731071810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raCa0Y19+glB0odfz1RMTbbLMqPF4E5Qqp9OuEhrM1g=;
        b=olucdAaj1K9KYb2ShCLfr2E00oaaHjlIYOjLy8DoatpCyUoCi5R206jnsXIxB+pYY7
         +X3KcVq7E8pPnze+lH8nACY3s6SnjXPnAlL3e+M4ELvVZmdpJJfrAy7EHWwKyzMYNiov
         spL/su6aSu1DH7eEj7wC5pnGGqjn3o7/fb7oTbB3kgMkBBWHPyGjTBIHTIXk5bTeqIgg
         EAcVtwLLc1s/yywcU4AlbH9JBA6Uyyx6vcmRf5jhdPNEeOYzZhwMkeLqE308TGTqWr9S
         D3XsoT2NfoHqpLz3eE58aM4mpvxUu3hNaBTi1n11GBaMdrEqSbNhONNb6+FJgkxgXqty
         OOlg==
X-Gm-Message-State: AOJu0YzT7zbxF8AuP8QegyWdwmFjLtX7qEfK+Al/fwnLYQATfBG+DH2P
	y2/D82J/ue1MBA2Y16dEV3z9QwH7Nqcmb4vZnW43YuSLdJuJ+RnNGnBINA==
X-Google-Smtp-Source: AGHT+IEdYtglvc8ZrGe4Lg6gkk4TyLs2TxMc6upOoe9rOr1KLBp/NjIVK0naj8wGyjRpZY5zzJeERQ==
X-Received: by 2002:a05:6512:281b:b0:536:55ef:69e8 with SMTP id 2adb3069b0e04-53b7eb9d73fmr6363459e87.0.1730467010294;
        Fri, 01 Nov 2024 06:16:50 -0700 (PDT)
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
Subject: [PATCH v3 2/3] xen/riscv: initialize the VMAP_DEFAULT virtual range
Date: Fri,  1 Nov 2024 14:16:41 +0100
Message-ID: <98f8bd0253a8988283610fabb19de664a523c6f8.1730465154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730465154.git.oleksii.kurochko@gmail.com>
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call vm_init() to initialize the VMAP_DEFAULT virtual range.

To support this, introduce the populate_pt_range() and
arch_vmap_virt_end() functions, which are used by
vm_init()->vm_init_type().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V3:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/mm.c    | 11 +++++------
 xen/arch/riscv/pt.c    |  6 ++++++
 xen/arch/riscv/setup.c |  3 +++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 185008f4c6..db75aa1d4f 100644
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
@@ -564,3 +558,8 @@ void __init setup_mm(void)
     setup_frametable_mappings(0, ram_end);
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


