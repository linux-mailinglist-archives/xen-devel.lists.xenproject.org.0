Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D26265E05
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:35:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGgOp-0002Al-T8; Fri, 11 Sep 2020 10:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGgOo-0002Ad-Jg
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:35:22 +0000
X-Inumbo-ID: 63d758b8-d93f-4c25-9ded-35bd71d3ed25
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63d758b8-d93f-4c25-9ded-35bd71d3ed25;
 Fri, 11 Sep 2020 10:35:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDA7CAD2F;
 Fri, 11 Sep 2020 10:35:36 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: fold exit paths of ptwr_do_page_fault()
Message-ID: <839f005e-e36a-14be-c2bb-83cb999e783b@suse.com>
Date: Fri, 11 Sep 2020 12:35:24 +0200
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

One less aspect to keep an eye on for things to stay in sync.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
FAOD I did consider (and even try) reducing the scope of ptwr_ctxt at
the same occasion - this results in worse code with gcc 10 at least, as
the compiler then indeed defers populating of the struct, and hence
needs to retain the respective function arguments across prior calls.

--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -262,29 +262,23 @@ static int ptwr_do_page_fault(struct x86
         .pte = pte,
     };
     struct page_info *page;
-    int rc;
+    int rc = X86EMUL_UNHANDLEABLE;
 
     page = get_page_from_mfn(l1e_get_mfn(pte), current->domain);
     if ( !page )
         return X86EMUL_UNHANDLEABLE;
 
-    if ( !page_lock(page) )
+    if ( page_lock(page) )
     {
-        put_page(page);
-        return X86EMUL_UNHANDLEABLE;
-    }
+        if ( (page->u.inuse.type_info & PGT_type_mask) == PGT_l1_page_table )
+        {
+            ctxt->data = &ptwr_ctxt;
+            rc = x86_emulate(ctxt, &ptwr_emulate_ops);
+        }
 
-    if ( (page->u.inuse.type_info & PGT_type_mask) != PGT_l1_page_table )
-    {
         page_unlock(page);
-        put_page(page);
-        return X86EMUL_UNHANDLEABLE;
     }
 
-    ctxt->data = &ptwr_ctxt;
-    rc = x86_emulate(ctxt, &ptwr_emulate_ops);
-
-    page_unlock(page);
     put_page(page);
 
     return rc;

