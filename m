Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2E9ACF6D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 17:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824768.1238964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de6-0005zI-BA; Wed, 23 Oct 2024 15:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824768.1238964; Wed, 23 Oct 2024 15:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de6-0005tp-8H; Wed, 23 Oct 2024 15:51:38 +0000
Received: by outflank-mailman (input) for mailman id 824768;
 Wed, 23 Oct 2024 15:51:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cWG=RT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t3de4-0005bd-Tv
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 15:51:36 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aead0d55-9156-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 17:51:35 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9abe139088so158736266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 08:51:35 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm493214466b.79.2024.10.23.08.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 08:51:34 -0700 (PDT)
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
X-Inumbo-ID: aead0d55-9156-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729698695; x=1730303495; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1/gFSOgI0n7fD5scAMG4iAUzufNhbJI1UL9lZIj5zM=;
        b=Zk71UPDrnWoY++hFGPKQBAsCVAsJlBr56+deoeKqP/M138aUtadvOhOuxDTwcAYtVf
         +I3oGbQ7MqRir6rld9u0guhcLk0je5SpYXnFmGsQKIkrjzqty4OIeoCgbuxn3vWi1SF6
         aY7/iqcWwVuOqIuZltWnlndr+HUe+0rQH0+iGmJsTG6H2QG5uKjBAl+yruJUuFrSoTDQ
         GCC5KYuKW4qmVWzeR0bjaMf+cnqVG4f/bXxyHRhHQYqhvUvMxp91N+7+XERQfUT3263B
         Q7o8fqRYHcGuS8AfYJihoHwsRUbmpIOQliPlHHkhSK92mqnCN3H0GqNdmx6i70l8zXQL
         X6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729698695; x=1730303495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1/gFSOgI0n7fD5scAMG4iAUzufNhbJI1UL9lZIj5zM=;
        b=J2ffRWD2ebAk2Yi2V4ZTw8HlvgowhWec8dwsfHQmqLjfkhF05XmB/x5Bqar1uSc6jp
         FxkVDzeL7uOyIX+ChnEyWj8JgV6lt9E270LZHF41YMp7F8UvOsrEXM0vs6TaQ9Er4Pmo
         1vJeAhLw2ia7mfk8NFeuPN58+uepr12XOvFOLtEPJNm6LG7bpwQ7XUJF4EIxBG4RxJA+
         PooG1672RMZfztlPbGL6FvZiSgCr6DRW2WVbIuaq1sM2fr+ENAetWAnWH+FnVW7Q3d+v
         G/3F62KW+QgMdPdOc5p4MwGBDsIA54wKoDMgpcCKk98VQ6nC34dwa8jA52pgtzWYHFqK
         dApA==
X-Gm-Message-State: AOJu0YyHQAdA91mJgIjH+dWqzIOZX1348CqL2EU8IEjE+7joTSY/yHC6
	QY3srC12qutkhi0KBhFB1oYk8xRetpuHZA8q9DnCzHEPOChyn4aODIyq0Q==
X-Google-Smtp-Source: AGHT+IHz/V25m9u1OlsezUz8Gn3how6y3qg3H8yFaNBhmaZQT6vgjI8xnBXhKGQmXrWyYFCGTrWPXw==
X-Received: by 2002:a17:906:6a25:b0:a9a:7899:eb87 with SMTP id a640c23a62f3a-a9abf84884amr360254966b.13.1729698694717;
        Wed, 23 Oct 2024 08:51:34 -0700 (PDT)
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
Subject: [PATCH v2 2/3] xen/riscv: initialize the VMAP_DEFAULT virtual range
Date: Wed, 23 Oct 2024 17:50:23 +0200
Message-ID: <4ae2957044e4e17be652d5fd28d54fd38110e4cf.1729697111.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729697111.git.oleksii.kurochko@gmail.com>
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call vm_init() to initialize the VMAP_DEFAULT virtual range.

To support this, introduce the populate_pt_range() and
arch_vmap_virt_end() functions, which are used by
vm_init()->vm_init_type().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/mm.c    | 11 +++++------
 xen/arch/riscv/pt.c    |  6 ++++++
 xen/arch/riscv/setup.c |  3 +++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 5be5a7b52a..262cec811e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -352,12 +352,6 @@ void arch_dump_shared_mem_info(void)
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
@@ -544,3 +538,8 @@ void __init setup_mm(void)
 #else /* CONFIG_RISCV_32 */
 #error setup_mm(), setup_{directmap,frametable}_mapping() should be implemented for RV_32
 #endif
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


