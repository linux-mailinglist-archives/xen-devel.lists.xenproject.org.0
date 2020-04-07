Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CF41A0C85
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 13:08:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLm4x-0000s3-JF; Tue, 07 Apr 2020 11:07:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLm4v-0000ry-If
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 11:07:37 +0000
X-Inumbo-ID: fc6f9a52-78bf-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc6f9a52-78bf-11ea-9e09-bc764e2007e4;
 Tue, 07 Apr 2020 11:07:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59125AC44;
 Tue,  7 Apr 2020 11:07:34 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PoD: correct ordering of checks in p2m_pod_zero_check()
Message-ID: <5da96b29-7f80-4bfd-eb30-5547f415d2b8@suse.com>
Date: Tue, 7 Apr 2020 13:07:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 0537d246f8db ("mm: add 'is_special_page' inline function...")
moved the is_special_page() checks first in its respective changes to
PoD code. While this is fine for p2m_pod_zero_check_superpage(), the
validity of the MFN is inferred in both cases from the p2m_is_ram()
check, which therefore also needs to come first in this 2nd instance.

Take the opportunity and address latent UB here as well - transform
the MFN into struct page_info * only after having established that
this is a valid page.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I will admit that this was build tested only. I did observe the crash
late yesterday while in the office, but got around to analyzing it only
today, where I'm again restricted in what I can reasonably test.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -877,23 +877,25 @@ p2m_pod_zero_check(struct p2m_domain *p2
     for ( i = 0; i < count; i++ )
     {
         p2m_access_t a;
-        struct page_info *pg;
 
         mfns[i] = p2m->get_entry(p2m, gfns[i], types + i, &a,
                                  0, NULL, NULL);
-        pg = mfn_to_page(mfns[i]);
 
         /*
          * If this is ram, and not a pagetable or a special page, and
          * probably not mapped elsewhere, map it; otherwise, skip.
          */
-        if ( !is_special_page(pg) && p2m_is_ram(types[i]) &&
-             (pg->count_info & PGC_allocated) &&
-             !(pg->count_info & PGC_page_table) &&
-             ((pg->count_info & PGC_count_mask) <= max_ref) )
-            map[i] = map_domain_page(mfns[i]);
-        else
-            map[i] = NULL;
+        map[i] = NULL;
+        if ( p2m_is_ram(types[i]) )
+        {
+            const struct page_info *pg = mfn_to_page(mfns[i]);
+
+            if ( !is_special_page(pg) &&
+                 (pg->count_info & PGC_allocated) &&
+                 !(pg->count_info & PGC_page_table) &&
+                 ((pg->count_info & PGC_count_mask) <= max_ref) )
+                map[i] = map_domain_page(mfns[i]);
+        }
     }
 
     /*

