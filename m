Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA911D9B22
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:28:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4A2-0000P8-1s; Tue, 19 May 2020 15:28:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jb4A0-0000P3-0I
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:28:04 +0000
X-Inumbo-ID: 53bca976-99e5-11ea-a939-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53bca976-99e5-11ea-a939-12813bfff9fa;
 Tue, 19 May 2020 15:28:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 329AFB270;
 Tue, 19 May 2020 15:28:04 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mem-paging: further adjustments to
 p2m_mem_paging_prep()'s error handling
Message-ID: <4543e93b-f861-ea0b-9de0-cba1aa938eb7@suse.com>
Date: Tue, 19 May 2020 17:28:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Address late comments on ecb913be4aaa ("x86/mem-paging: correct
p2m_mem_paging_prep()'s error handling"):
- insert a gprintk() ahead of domain_crash(),
- add a comment.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -385,6 +385,9 @@ static int prepare(struct domain *d, gfn
              * The domain can't possibly know about this page yet, so failure
              * here is a clear indication of something fishy going on.
              */
+            gprintk(XENLOG_ERR,
+                    "%pd: fresh page for GFN %"PRI_gfn" in unexpected state\n",
+                    d, gfn_x(gfn));
             domain_crash(d);
             page = NULL;
             goto out;
@@ -423,6 +426,10 @@ static int prepare(struct domain *d, gfn
 
     if ( page )
     {
+        /*
+         * Free the page on error.  Drop our temporary reference in all
+         * cases.
+         */
         if ( ret )
             put_page_alloc_ref(page);
         put_page(page);

