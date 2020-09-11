Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9882C265E04
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:35:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGgNs-00027V-HF; Fri, 11 Sep 2020 10:34:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGgNs-00027Q-2u
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:34:24 +0000
X-Inumbo-ID: dd147413-d4f6-49d3-b74a-6821e55a1981
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd147413-d4f6-49d3-b74a-6821e55a1981;
 Fri, 11 Sep 2020 10:34:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3912B1EE;
 Fri, 11 Sep 2020 10:34:37 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: make post-migration page state consistent
Message-ID: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
Date: Fri, 11 Sep 2020 12:34:24 +0200
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

When a page table page gets de-validated, its type reference count drops
to zero (and PGT_validated gets cleared), but its type remains intact.
XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
such pages. An intermediate write to such a page via e.g.
MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
return. In libxc the decision which pages to normalize / localize
depends solely on the type returned from the domctl. As a result without
further precautions the guest won't be able to tell whether such a page
has had its (apparent) PTE entries transitioned to the new MFNs.

Add a check of PGT_validated, thus consistently avoiding normalization /
localization in the tool stack.

Alongside using XEN_DOMCTL_PFINFO_NOTAB instead of plain zero for the
change at hand, also change the variable's initializer to use this
constant, too. Take the opportunity and also adjust its type.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -215,7 +215,8 @@ long arch_do_domctl(
 
         for ( i = 0; i < num; ++i )
         {
-            unsigned long gfn = 0, type = 0;
+            unsigned long gfn = 0;
+            unsigned int type = XEN_DOMCTL_PFINFO_NOTAB;
             struct page_info *page;
             p2m_type_t t;
 
@@ -255,6 +256,8 @@ long arch_do_domctl(
 
                 if ( page->u.inuse.type_info & PGT_pinned )
                     type |= XEN_DOMCTL_PFINFO_LPINTAB;
+                else if ( !(page->u.inuse.type_info & PGT_validated) )
+                    type = XEN_DOMCTL_PFINFO_NOTAB;
 
                 if ( page->count_info & PGC_broken )
                     type = XEN_DOMCTL_PFINFO_BROKEN;

