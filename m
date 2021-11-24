Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA9E45CE7F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 21:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230550.398575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHE-0006tf-L0; Wed, 24 Nov 2021 20:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230550.398575; Wed, 24 Nov 2021 20:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHE-0006lt-5p; Wed, 24 Nov 2021 20:54:00 +0000
Received: by outflank-mailman (input) for mailman id 230550;
 Wed, 24 Nov 2021 20:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMcq=QL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpzHC-0006Ii-7a
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 20:53:58 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a46d192c-4d68-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 21:53:57 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id r26so10535265lfn.8
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 12:53:57 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j11sm97608ljc.9.2021.11.24.12.53.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Nov 2021 12:53:56 -0800 (PST)
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
X-Inumbo-ID: a46d192c-4d68-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nydXLX52YwrHL717y8JqACIh70K6s4jPJYJ5FVkEQUc=;
        b=S0/Hy1VQztqXfLaIdZ7NRLcy4Cgt6AjxC+os3QZfoymrzkANGOjalWy4PtASDhqR04
         pm2YGuGHn9XAoNxspfeD2BLjYJYjVd35jWL8n4aUjcM6uMr+LmjP2bpqByxIQ3+jnDtl
         GpbI92uRpPAX2LTIrua/vR8eVu4Oa8D/DrLbUKeDp5zhCz7PJcw1fDQLKjGOKrYlgfAz
         Cgad1nVB+6DyjxeTHMuA7GpiLVQvKd/xwkSzmYVmATePlD+6UnEAtovn99Y/+3LL8+0T
         a2eSjaZ9kJ7aim9YZugUpe9w2xjQ64bl/BKq8E/eqb7shRsHSxrlf4LEoRsQ65dFIOhP
         swDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nydXLX52YwrHL717y8JqACIh70K6s4jPJYJ5FVkEQUc=;
        b=F/BB67iDsyFxOf6lirEEeGmSTdgJp7U5xYOwgAU8XyXkjFDRw4XUb3/66qn794spW0
         3edgCMzGXyT/hg45FuhzqRxMllLNtgu6m5sjix5L/cXp38bO9nNpVZjIRBz0RbZpy30h
         Xt2uSxcQ0Z7KLcDGkzmw5TwutVz1DXJaQhrwZ7DJ8W89bPYQD+m+lbUl1AFaKVa+l2z2
         dHhLmcxCQ3Y5iURLOA3XxlfO5gH+lhSUm/2P1EIIjKlddUjqYTyLHhcB2Henpoxr30at
         tcIX6u4FoPJbt6SIKqIsdUelYyYMdXtCyRZiYqT3ly3x5uAyntc0yHq0LOFtmzeOHMop
         Spvg==
X-Gm-Message-State: AOAM530jm2SkDc/FCJCc5ErneTXrJtE0no2tUIwQ+jHKB0BAOxhjUXH/
	oOmYScRkuH8wg+mJ8JF+GuAuOYBSOx8bFw==
X-Google-Smtp-Source: ABdhPJwxLBaQ/pthWYqMY7rBHUSim2HWNTWs+jYcNptICKdkjq/HMfAIPtaj2d48/TFdo6Z2j08r6A==
X-Received: by 2002:a05:6512:3602:: with SMTP id f2mr18457888lfs.399.1637787236781;
        Wed, 24 Nov 2021 12:53:56 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V3 4/6] xen/unpopulated-alloc: Add mechanism to use Xen resource
Date: Wed, 24 Nov 2021 22:53:41 +0200
Message-Id: <1637787223-21129-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
scratch pages. If arch doesn't define arch_xen_unpopulated_init()
the default "iomem_resource" will be used.

Update the arguments list of allocate_resource() in fill_list()
to always allocate a region from the hotpluggable range
(maximum possible addressable physical memory range for which
the linear mapping could be created). If arch doesn't define
arch_get_mappable_range() the default range (0,-1) will be used.

The behaviour on x86 won't be changed by current patch as both
arch_xen_unpopulated_init() and arch_get_mappable_range()
are not implemented for it.

Also fallback to allocate xenballooned pages (balloon out RAM
pages) if we do not have any suitable resource to work with
(target_resource is invalid) and as the result we won't be able
to provide unpopulated pages on a request.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Please note the following:
for V3 arch_xen_unpopulated_init() was moved to init() as was agreed
and gained __init specifier. So the target_resource is initialized there.

With current patch series applied if CONFIG_XEN_UNPOPULATED_ALLOC
is enabled:

1. On Arm, under normal circumstances, the xen_alloc_unpopulated_pages()
won't be called “before” arch_xen_unpopulated_init(). It will only be
called "before" when either ACPI is in use or something wrong happened
with DT (and we failed to read xen_grant_frames), so we fallback to
xen_xlate_map_ballooned_pages() in arm/xen/enlighten.c:xen_guest_init(),
please see "arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT"
for details. But in that case, I think, it doesn't matter much whether
xen_alloc_unpopulated_pages() is called "before" of "after" target_resource
initialization, as we don't have extended regions in place the target_resource
will remain invalid even after initialization, so xen_alloc_ballooned_pages()
will be used in both scenarios.

2. On x86, I am not quite sure which modes use unpopulated-alloc (PVH?),
but it looks like xen_alloc_unpopulated_pages() can (and will) be called
“before” arch_xen_unpopulated_init().
At least, I see that xen_xlate_map_ballooned_pages() is called in
x86/xen/grant-table.c:xen_pvh_gnttab_setup(). According to the initcall
levels for both xen_pvh_gnttab_setup() and init() I expect the former
to be called earlier.
If it is true, the sentence in the commit description which mentions
that “behaviour on x86 is not changed” is not precise. I don’t think
it would be correct to fallback to xen_alloc_ballooned_pages() just
because we haven’t initialized target_resource yet (on x86 it is just
assigning it iomem_resource), at least this doesn't look like an expected
behaviour and unlikely would be welcome.

I am wondering whether it would be better to move arch_xen_unpopulated_init()
to a dedicated init() marked with an appropriate initcall level (early_initcall?)
to make sure it will always be called *before* xen_xlate_map_ballooned_pages().
What do you think?

Changes RFC -> V2:
   - new patch, instead of
    "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space"

Changes V2 -> V3:
   - update patch description and comments in code
   - modify arch_xen_unpopulated_init() to pass target_resource as an argument
     and update default helper to assign iomem_resource to it, also drop
     xen_resource as it will be located in arch code in the future
   - allocate region from hotpluggable range instead of hardcoded range (0,-1)
     in fill_list()
   - use %pR specifier in error message
   - do not call unpopulated_init() at runtime from xen_alloc_unpopulated_pages(),
     drop an extra helper and call arch_xen_unpopulated_init() directly from __init()
   - include linux/ioport.h instead of forward declaration of struct resource
   - replace insert_resource() with request_resource() in fill_list()
   - add __init specifier to arch_xen_unpopulated_init()
---
 drivers/xen/unpopulated-alloc.c | 83 +++++++++++++++++++++++++++++++++++++----
 include/xen/xen.h               |  2 +
 2 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index a03dc5b..07d3578 100644
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
+
+/*
+ * If arch is not happy with system "iomem_resource" being used for
+ * the region allocation it can provide it's own view by creating specific
+ * Xen resource with unused regions of guest physical address space provided
+ * by the hypervisor.
+ */
+int __weak __init arch_xen_unpopulated_init(struct resource **res)
+{
+	*res = &iomem_resource;
+
+	return 0;
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
+	struct range mhp_range;
+	int ret;
 
 	res = kzalloc(sizeof(*res), GFP_KERNEL);
 	if (!res)
@@ -30,14 +47,40 @@ static int fill_list(unsigned int nr_pages)
 	res->name = "Xen scratch";
 	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 
-	ret = allocate_resource(&iomem_resource, res,
-				alloc_pages * PAGE_SIZE, 0, -1,
+	mhp_range = mhp_get_pluggable_range(true);
+
+	ret = allocate_resource(target_resource, res,
+				alloc_pages * PAGE_SIZE, mhp_range.start, mhp_range.end,
 				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
 	if (ret < 0) {
 		pr_err("Cannot allocate new IOMEM resource\n");
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
+		ret = request_resource(&iomem_resource, tmp_res);
+		if (ret < 0) {
+			pr_err("Cannot request resource %pR (%d)\n", tmp_res, ret);
+			kfree(tmp_res);
+			goto err_insert;
+		}
+	}
+
 	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
 	if (!pgmap) {
 		ret = -ENOMEM;
@@ -95,6 +138,11 @@ static int fill_list(unsigned int nr_pages)
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
@@ -112,6 +160,14 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 	unsigned int i;
 	int ret = 0;
 
+	/*
+	 * Fallback to default behavior if we do not have any suitable resource
+	 * to allocate required region from and as the result we won't be able to
+	 * construct pages.
+	 */
+	if (!target_resource)
+		return xen_alloc_ballooned_pages(nr_pages, pages);
+
 	mutex_lock(&list_lock);
 	if (list_count < nr_pages) {
 		ret = fill_list(nr_pages - list_count);
@@ -159,6 +215,11 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 {
 	unsigned int i;
 
+	if (!target_resource) {
+		xen_free_ballooned_pages(nr_pages, pages);
+		return;
+	}
+
 	mutex_lock(&list_lock);
 	for (i = 0; i < nr_pages; i++) {
 		pages[i]->zone_device_data = page_list;
@@ -169,9 +230,11 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL(xen_free_unpopulated_pages);
 
-#ifdef CONFIG_XEN_PV
 static int __init init(void)
 {
+	int ret;
+
+#ifdef CONFIG_XEN_PV
 	unsigned int i;
 
 	if (!xen_domain())
@@ -196,8 +259,14 @@ static int __init init(void)
 			list_count++;
 		}
 	}
+#endif
 
-	return 0;
+	ret = arch_xen_unpopulated_init(&target_resource);
+	if (ret) {
+		pr_err("xen:unpopulated: Cannot initialize target resource\n");
+		target_resource = NULL;
+	}
+
+	return ret;
 }
 subsys_initcall(init);
-#endif
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 86c5b37..a99bab8 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -55,6 +55,8 @@ extern u64 xen_saved_max_mem_size;
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
+#include <linux/ioport.h>
+int arch_xen_unpopulated_init(struct resource **res);
 #else
 #include <xen/balloon.h>
 static inline int xen_alloc_unpopulated_pages(unsigned int nr_pages,
-- 
2.7.4


