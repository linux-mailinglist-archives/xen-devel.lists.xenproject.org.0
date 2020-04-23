Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDBF1B5750
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 10:38:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRXMl-0007Yb-EK; Thu, 23 Apr 2020 08:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRXMj-0007YP-PF
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 08:37:49 +0000
X-Inumbo-ID: b62f796a-853d-11ea-9336-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b62f796a-853d-11ea-9336-12813bfff9fa;
 Thu, 23 Apr 2020 08:37:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4DD63AFF7;
 Thu, 23 Apr 2020 08:37:47 +0000 (UTC)
Subject: [PATCH v2 2/6] x86/mem-paging: correct p2m_mem_paging_prep()'s error
 handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
Message-ID: <bf9dd27b-a7db-de0e-a804-d687e66ecf1e@suse.com>
Date: Thu, 23 Apr 2020 10:37:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Communicating errors from p2m_set_entry() to the caller is not enough:
Neither the M2P nor the stats updates should occur in such a case.
Instead the allocated page needs to be freed again; for cleanliness
reasons also properly take into account _PGC_allocated there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1781,7 +1781,7 @@ void p2m_mem_paging_populate(struct doma
  */
 int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
 {
-    struct page_info *page;
+    struct page_info *page = NULL;
     p2m_type_t p2mt;
     p2m_access_t a;
     gfn_t gfn = _gfn(gfn_l);
@@ -1816,9 +1816,19 @@ int p2m_mem_paging_prep(struct domain *d
             goto out;
         /* Get a free page */
         ret = -ENOMEM;
-        page = alloc_domheap_page(p2m->domain, 0);
+        page = alloc_domheap_page(d, 0);
         if ( unlikely(page == NULL) )
             goto out;
+        if ( unlikely(!get_page(page, d)) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            domain_crash(d);
+            page = NULL;
+            goto out;
+        }
         mfn = page_to_mfn(page);
         page_extant = 0;
 
@@ -1832,7 +1842,6 @@ int p2m_mem_paging_prep(struct domain *d
                      "Failed to load paging-in gfn %lx Dom%d bytes left %d\n",
                      gfn_l, d->domain_id, ret);
             ret = -EFAULT;
-            put_page(page); /* Don't leak pages */
             goto out;            
         }
     }
@@ -1843,13 +1852,24 @@ int p2m_mem_paging_prep(struct domain *d
     ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
                         paging_mode_log_dirty(d) ? p2m_ram_logdirty
                                                  : p2m_ram_rw, a);
-    set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
+    if ( !ret )
+    {
+        set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
 
-    if ( !page_extant )
-        atomic_dec(&d->paged_pages);
+        if ( !page_extant )
+            atomic_dec(&d->paged_pages);
+    }
 
  out:
     gfn_unlock(p2m, gfn, 0);
+
+    if ( page )
+    {
+        if ( ret )
+            put_page_alloc_ref(page);
+        put_page(page);
+    }
+
     return ret;
 }
 


