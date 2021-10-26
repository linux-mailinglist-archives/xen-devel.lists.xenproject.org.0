Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E243B68C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 18:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216532.376187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfP0r-00048S-BY; Tue, 26 Oct 2021 16:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216532.376187; Tue, 26 Oct 2021 16:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfP0r-00046C-7O; Tue, 26 Oct 2021 16:09:21 +0000
Received: by outflank-mailman (input) for mailman id 216532;
 Tue, 26 Oct 2021 16:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gydQ=PO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mfP0p-00044Y-RE
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 16:09:19 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55fdda75-b496-4e7c-a0d1-49ce389de717;
 Tue, 26 Oct 2021 16:09:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w15so15349871edc.9
 for <xen-devel@lists.xenproject.org>; Tue, 26 Oct 2021 09:09:18 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id eu9sm4025195ejc.14.2021.10.26.09.05.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:05:21 -0700 (PDT)
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
X-Inumbo-ID: 55fdda75-b496-4e7c-a0d1-49ce389de717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ajewXwLh6uwl+3oBu0hbZUbC19wx0AYb/I/F6COPjeM=;
        b=U3N/q9FFvFCmmrpMt2cjbyrZGTWLI8aYWMuWlxVKon2BNKrVOdefe0pZcid+IOAgdh
         IHy6lv/3TRCGg/Iqh7kmoF4Fg4rHa+NqfAzaz9wRaL6CVBUvECbpOFAZU6RJESEkB98/
         Y5I9Oq4rdHccg0GEvwvD4whjflY43q2BjErpYMUBRbu2Lwf235S4qZ7o16ywxoHfpuxR
         gx0iLhzdsYDcnbF20A2x+L0EFGx8biMJmfAr6ix03XlJ+JOMk21G6/ZtFcdflkylF4KG
         uXX49KX7gu0kYMlocuPThS66RnoOFnmwRXxDBNs5db/f6mKW8ocFNgIKUqNmy+spVuvX
         O8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ajewXwLh6uwl+3oBu0hbZUbC19wx0AYb/I/F6COPjeM=;
        b=EnLwzEueyJnZ75/e9Jeppm2GSc2emB2/KFKqGKEGMY0q3wFy0n6BgR6P/dOAdb6KdY
         BFPIVpqvNyahbUwbHnzyZ70EDeoNeFLlHujjhMwzBfsKULPS35+d4/wSclq9M6okwSyv
         3U0Yjbzn/FKAas1T8U4Hpm78Vsx1+199XKU1iLLSywndtcRV84xYL3J2CJNw51j/EJYN
         8SUUxucipdvH9Q/5m7LUFhDOWx2GeZ9yq3TPLJquzg2DiEVkHH2xOM10+hVpaLene+HN
         Nxt3I75Lm/mhC6pxdkJ4msE2zbK/jg62rTeNXGUv8whaUartQdXT/2wyC8CcuZQdMKBa
         3vkg==
X-Gm-Message-State: AOAM531wAKnK39rOE8RNL1qhqkFal5JtI6lLY8+ZTmOW0zFnCeFreAFx
	P/WqcEuvvfS5ma7gOAu86S1yGghQ36M=
X-Google-Smtp-Source: ABdhPJyrh0WP1ZENmH/Ydn3rieWDW8GYW8YWGEy1yCC5roMzqs86ACi1TObo2NcZ97xR3N7TTReTvQ==
X-Received: by 2002:a05:6402:2808:: with SMTP id h8mr36760367ede.394.1635264321764;
        Tue, 26 Oct 2021 09:05:21 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen resource
Date: Tue, 26 Oct 2021 19:05:11 +0300
Message-Id: <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main reason of this change is that unpopulated-alloc
code cannot be used in its current form on Arm, but there
is a desire to reuse it to avoid wasting real RAM pages
for the grant/foreign mappings.

The problem is that system "iomem_resource" is used for
the address space allocation, but the really unallocated
space can't be figured out precisely by the domain on Arm
without hypervisor involvement. For example, not all device
I/O regions are known by the time domain starts creating
grant/foreign mappings. And following the advise from
"iomem_resource" we might end up reusing these regions by
a mistake. So, the hypervisor which maintains the P2M for
the domain is in the best position to provide unused regions
of guest physical address space which could be safely used
to create grant/foreign mappings.

Introduce new helper arch_xen_unpopulated_init() which purpose
is to create specific Xen resource based on the memory regions
provided by the hypervisor to be used as unused space for Xen
scratch pages.

If arch doesn't implement arch_xen_unpopulated_init() to
initialize Xen resource the default "iomem_resource" will be used.
So the behavior on x86 won't be changed.

Also fall back to allocate xenballooned pages (steal real RAM
pages) if we do not have any suitable resource to work with and
as the result we won't be able to provide unpopulated pages.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V2:
   - new patch, instead of
    "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space"
---
 drivers/xen/unpopulated-alloc.c | 89 +++++++++++++++++++++++++++++++++++++++--
 include/xen/xen.h               |  2 +
 2 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index a03dc5b..1f1d8d8 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -8,6 +8,7 @@
 
 #include <asm/page.h>
 
+#include <xen/balloon.h>
 #include <xen/page.h>
 #include <xen/xen.h>
 
@@ -15,13 +16,29 @@ static DEFINE_MUTEX(list_lock);
 static struct page *page_list;
 static unsigned int list_count;
 
+static struct resource *target_resource;
+static struct resource xen_resource = {
+	.name = "Xen unused space",
+};
+
+/*
+ * If arch is not happy with system "iomem_resource" being used for
+ * the region allocation it can provide it's own view by initializing
+ * "xen_resource" with unused regions of guest physical address space
+ * provided by the hypervisor.
+ */
+int __weak arch_xen_unpopulated_init(struct resource *res)
+{
+	return -ENOSYS;
+}
+
 static int fill_list(unsigned int nr_pages)
 {
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res, *tmp_res = NULL;
 	void *vaddr;
 	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
-	int ret = -ENOMEM;
+	int ret;
 
 	res = kzalloc(sizeof(*res), GFP_KERNEL);
 	if (!res)
@@ -30,7 +47,7 @@ static int fill_list(unsigned int nr_pages)
 	res->name = "Xen scratch";
 	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 
-	ret = allocate_resource(&iomem_resource, res,
+	ret = allocate_resource(target_resource, res,
 				alloc_pages * PAGE_SIZE, 0, -1,
 				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
 	if (ret < 0) {
@@ -38,6 +55,31 @@ static int fill_list(unsigned int nr_pages)
 		goto err_resource;
 	}
 
+	/*
+	 * Reserve the region previously allocated from Xen resource to avoid
+	 * re-using it by someone else.
+	 */
+	if (target_resource != &iomem_resource) {
+		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
+		if (!res) {
+			ret = -ENOMEM;
+			goto err_insert;
+		}
+
+		tmp_res->name = res->name;
+		tmp_res->start = res->start;
+		tmp_res->end = res->end;
+		tmp_res->flags = res->flags;
+
+		ret = insert_resource(&iomem_resource, tmp_res);
+		if (ret < 0) {
+			pr_err("Cannot insert IOMEM resource [%llx - %llx]\n",
+			       tmp_res->start, tmp_res->end);
+			kfree(tmp_res);
+			goto err_insert;
+		}
+	}
+
 	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
 	if (!pgmap) {
 		ret = -ENOMEM;
@@ -95,12 +137,40 @@ static int fill_list(unsigned int nr_pages)
 err_memremap:
 	kfree(pgmap);
 err_pgmap:
+	if (tmp_res) {
+		release_resource(tmp_res);
+		kfree(tmp_res);
+	}
+err_insert:
 	release_resource(res);
 err_resource:
 	kfree(res);
 	return ret;
 }
 
+static void unpopulated_init(void)
+{
+	static bool inited = false;
+	int ret;
+
+	if (inited)
+		return;
+
+	/*
+	 * Try to initialize Xen resource the first and fall back to default
+	 * resource if arch doesn't offer one.
+	 */
+	ret = arch_xen_unpopulated_init(&xen_resource);
+	if (!ret)
+		target_resource = &xen_resource;
+	else if (ret == -ENOSYS)
+		target_resource = &iomem_resource;
+	else
+		pr_err("Cannot initialize Xen resource\n");
+
+	inited = true;
+}
+
 /**
  * xen_alloc_unpopulated_pages - alloc unpopulated pages
  * @nr_pages: Number of pages
@@ -112,6 +182,16 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 	unsigned int i;
 	int ret = 0;
 
+	unpopulated_init();
+
+	/*
+	 * Fall back to default behavior if we do not have any suitable resource
+	 * to allocate required region from and as the result we won't be able to
+	 * construct pages.
+	 */
+	if (!target_resource)
+		return alloc_xenballooned_pages(nr_pages, pages);
+
 	mutex_lock(&list_lock);
 	if (list_count < nr_pages) {
 		ret = fill_list(nr_pages - list_count);
@@ -159,6 +239,9 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 {
 	unsigned int i;
 
+	if (!target_resource)
+		return free_xenballooned_pages(nr_pages, pages);
+
 	mutex_lock(&list_lock);
 	for (i = 0; i < nr_pages; i++) {
 		pages[i]->zone_device_data = page_list;
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 43efba0..55d2ef8 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -55,6 +55,8 @@ extern u64 xen_saved_max_mem_size;
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
+struct resource;
+int arch_xen_unpopulated_init(struct resource *res);
 #else
 #define xen_alloc_unpopulated_pages alloc_xenballooned_pages
 #define xen_free_unpopulated_pages free_xenballooned_pages
-- 
2.7.4


