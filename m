Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81078220965
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveGv-00064x-Ez; Wed, 15 Jul 2020 10:04:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveGt-000641-AL
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:04:15 +0000
X-Inumbo-ID: 89790662-c682-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89790662-c682-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 10:04:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2205FAFB0;
 Wed, 15 Jul 2020 10:04:17 +0000 (UTC)
Subject: [PATCH 2/2] VT-d: use clear_page() in alloc_pgtable_maddr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
Message-ID: <14f8b940-252f-9837-8958-5e76e1c3f06f@suse.com>
Date: Wed, 15 Jul 2020 12:04:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For full pages this is (meant to be) more efficient. Also change the
type and reduce the scope of the involved local variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -199,7 +199,6 @@ static void sync_cache(const void *addr,
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node)
 {
     struct page_info *pg, *cur_pg;
-    u64 *vaddr;
     unsigned int i;
 
     pg = alloc_domheap_pages(NULL, get_order_from_pages(npages),
@@ -210,8 +209,9 @@ uint64_t alloc_pgtable_maddr(unsigned lo
     cur_pg = pg;
     for ( i = 0; i < npages; i++ )
     {
-        vaddr = __map_domain_page(cur_pg);
-        memset(vaddr, 0, PAGE_SIZE);
+        void *vaddr = __map_domain_page(cur_pg);
+
+        clear_page(vaddr);
 
         if ( (iommu_ops.init ? &iommu_ops : &vtd_ops)->sync_cache )
             sync_cache(vaddr, PAGE_SIZE);


