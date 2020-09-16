Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AD526BDF6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:29:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRs2-00026K-5v; Wed, 16 Sep 2020 07:28:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIRs1-00026F-Aa
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:28:49 +0000
X-Inumbo-ID: 5f6d04b5-5094-41f1-acc1-0b90b5aeedb4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f6d04b5-5094-41f1-acc1-0b90b5aeedb4;
 Wed, 16 Sep 2020 07:28:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24EB2AD65;
 Wed, 16 Sep 2020 07:29:03 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] mm: adjust get_page()'s types
Message-ID: <ba4a5dcf-3d43-09bd-870e-46a540850cc3@suse.com>
Date: Wed, 16 Sep 2020 09:28:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The passed in domain doesn't get altered and hence can be const. While
modifying its prototype anyway, also switch to bool.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1560,17 +1560,17 @@ void put_page(struct page_info *page)
     }
 }
 
-int get_page(struct page_info *page, struct domain *domain)
+bool get_page(struct page_info *page, const struct domain *domain)
 {
-    struct domain *owner = page_get_owner_and_reference(page);
+    const struct domain *owner = page_get_owner_and_reference(page);
 
     if ( likely(owner == domain) )
-        return 1;
+        return true;
 
     if ( owner != NULL )
         put_page(page);
 
-    return 0;
+    return false;
 }
 
 /* Common code requires get_page_type and put_page_type.
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2510,12 +2510,12 @@ struct domain *page_get_owner_and_refere
 }
 
 
-int get_page(struct page_info *page, struct domain *domain)
+bool get_page(struct page_info *page, const struct domain *domain)
 {
-    struct domain *owner = page_get_owner_and_reference(page);
+    const struct domain *owner = page_get_owner_and_reference(page);
 
     if ( likely(owner == domain) )
-        return 1;
+        return true;
 
     if ( !paging_mode_refcounts(domain) && !domain->is_dying )
         gprintk(XENLOG_INFO,
@@ -2526,7 +2526,7 @@ int get_page(struct page_info *page, str
     if ( owner )
         put_page(page);
 
-    return 0;
+    return false;
 }
 
 /*
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -151,7 +151,7 @@ TYPE_SAFE(unsigned long, pfn);
 struct page_info;
 
 void put_page(struct page_info *);
-int get_page(struct page_info *, struct domain *);
+bool get_page(struct page_info *, const struct domain *);
 struct domain *__must_check page_get_owner_and_reference(struct page_info *);
 
 /* Boot-time allocator. Turns into generic allocator after bootstrap. */

