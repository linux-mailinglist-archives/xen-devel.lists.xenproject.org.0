Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C440EBD8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 22:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188707.337965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQyHr-0004Z4-J5; Thu, 16 Sep 2021 20:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188707.337965; Thu, 16 Sep 2021 20:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQyHr-0004Vo-Fx; Thu, 16 Sep 2021 20:47:15 +0000
Received: by outflank-mailman (input) for mailman id 188707;
 Thu, 16 Sep 2021 20:47:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ef7n=OG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQyHp-0004Vi-HP
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 20:47:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56da84a9-0238-4d8d-a0c1-a090dff96290;
 Thu, 16 Sep 2021 20:47:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A24A26105A;
 Thu, 16 Sep 2021 20:47:11 +0000 (UTC)
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
X-Inumbo-ID: 56da84a9-0238-4d8d-a0c1-a090dff96290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631825231;
	bh=hUUxl6qnTkEwYaeIJkEF9g5jwBeOS7mM8Haq/htk6Z0=;
	h=Date:From:To:cc:Subject:From;
	b=ICYUStp/U0HV9KnebF+TKWAF8X+IQSBN2WH3in68bQImOlpk/KvikyKqpeQXIei3s
	 HpTimv0ANfWRK5z8NNqZblLs2Wiq1UhwWjQrt4ylKUofZseGmTrNVIf1D8j/bzr6aE
	 d9EXT0PEKbakf1BtblJCAGecKzNxGHfnCZiYrO/eVAK41draXBETr6Fx6H6DdhbNQr
	 cnxhI8z54ihJVQopl0eIzqJYQvpdwY7gFP1J4OHDWeB5IU2wm8kHG+DUzqUrM9BA/A
	 tbdFdvTdItqNjwjFMejefr269c7FfM8eyZ4t2WFyqUEhO19lc1t9op3Aq3ICXnezMD
	 LkYePmE74tAoQ==
Date: Thu, 16 Sep 2021 13:47:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jbeulich@suse.com
cc: sstabellini@kernel.org, penny.zheng@arm.com, Bertrand.Marquis@arm.com, 
    Wei.Chen@arm.com, xen-devel@lists.xenproject.org, julien@xen.org
Subject: [PATCH] modify acquire_domstatic_pages to take an unsigned int size
 parameter
Message-ID: <alpine.DEB.2.21.2109161341270.21985@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

acquire_domstatic_pages currently takes an unsigned long nr_mfns
parameter, but actually it cannot handle anything larger than an
unsigned int nr_mfns. That's because acquire_domstatic_pages is based on
assign_pages which also takes an unsigned int nr parameter.

So modify the nr_mfns parameter of acquire_domstatic_pages to be
unsigned int.

There is only one caller in
xen/arch/arm/domain_build.c:allocate_static_memory. Check that the value
to be passed to acquire_domstatic_pages is no larger than UINT_MAX. If
it is, print an error and goto fail.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---

Jan, I took your suggestion of moving the check closer to where the
value is read from DT. At that point I also took the opportunity to
change acquire_domstatic_pages to take an unsigned int parameter
instead of unsigned long.


diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 62ab7d0ead..d233d634c1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -554,6 +554,12 @@ static void __init allocate_static_memory(struct domain *d,
         device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
         ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
 
+        if ( PFN_DOWN(psize) > UINT_MAX )
+        {
+            printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
+                   d, psize);
+            goto fail;
+        }
         smfn = maddr_to_mfn(pbase);
         res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
         if ( res )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b9441cb06f..b64c07ae92 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2714,7 +2714,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
  * then assign them to one specific domain #d.
  */
 int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
-                                   unsigned long nr_mfns, unsigned int memflags)
+                                   unsigned int nr_mfns, unsigned int memflags)
 {
     struct page_info *pg;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index dd49237e86..5db26ed477 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -89,7 +89,7 @@ bool scrub_free_pages(void);
 /* These functions are for static memory */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
-int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned long nr_mfns,
+int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
 #endif
 


