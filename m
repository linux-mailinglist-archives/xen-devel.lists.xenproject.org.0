Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CCF1ACB08
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 17:45:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP6hm-00062O-Qn; Thu, 16 Apr 2020 15:45:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP6hl-00062G-8s
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 15:45:29 +0000
X-Inumbo-ID: 4bc17702-7ff9-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bc17702-7ff9-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 15:45:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A5A6AB5C;
 Thu, 16 Apr 2020 15:45:27 +0000 (UTC)
Subject: [PATCH 2/6] x86/mem-paging: correct p2m_mem_paging_prep()'s error
 handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Message-ID: <853d915a-4748-00c2-e065-9cd8ef63f279@suse.com>
Date: Thu, 16 Apr 2020 17:45:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 


