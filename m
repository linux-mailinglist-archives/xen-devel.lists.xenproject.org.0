Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2F2373558
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122804.231641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leBd6-0007VP-Ru; Wed, 05 May 2021 07:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122804.231641; Wed, 05 May 2021 07:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leBd6-0007Sr-OO; Wed, 05 May 2021 07:07:32 +0000
Received: by outflank-mailman (input) for mailman id 122804;
 Wed, 05 May 2021 07:07:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leBd5-0007Si-VC
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:07:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30847763-fba8-429a-8753-3fefd6499226;
 Wed, 05 May 2021 07:07:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 335E4AD21;
 Wed,  5 May 2021 07:07:30 +0000 (UTC)
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
X-Inumbo-ID: 30847763-fba8-429a-8753-3fefd6499226
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620198450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kYTzdg2mxmFflEqULrHidRTMw57MXGtclBCaf+QyRYc=;
	b=plqUjaTrzBtuHB7WnUGwH4cOoa9GeVXeF7OsdnXxIYcHSAk7mzich15R0MzBDHzhOtP06D
	MG+Do7TVCuaT6XuSduxLM6ETrKSThbo4W27UTjRo5zg5mV9gOSsn4ErCsx8/T/MsxoQrN/
	1m/UKJeW6iBFIAG5l/FTAQlieVI+svE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/p2m: please Clang after making certain parts HVM-only
Message-ID: <cfac6284-d4ec-af2f-6be4-c114c7c10009@suse.com>
Date: Wed, 5 May 2021 09:07:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Move a few #ifdef-s, to account for diagnostics like

p2m.c:549:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]

which appear despite paging_mode_translate() resolving to constant
"false" when !HVM. All of the affected functions are intended to become
fully HVM-only anyway, with their non-translated stub handling split off
elsewhere.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 8d012d3ddffc ("x86/p2m: {get,set}_entry hooks and p2m-pt.c are HVM-only")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -497,21 +497,23 @@ mfn_t __get_gfn_type_access(struct p2m_d
 #ifdef CONFIG_HVM
     mfn_t mfn;
     gfn_t gfn = _gfn(gfn_l);
-#endif
-
-    /* Unshare makes no sense withuot populate. */
-    if ( q & P2M_UNSHARE )
-        q |= P2M_ALLOC;
 
     if ( !p2m || !paging_mode_translate(p2m->domain) )
     {
-        /* Not necessarily true, but for non-translated guests, we claim
-         * it's the most generic kind of memory */
+#endif
+        /*
+         * Not necessarily true, but for non-translated guests we claim
+         * it's the most generic kind of memory.
+         */
         *t = p2m_ram_rw;
         return _mfn(gfn_l);
+#ifdef CONFIG_HVM
     }
 
-#ifdef CONFIG_HVM
+    /* Unshare makes no sense without populate. */
+    if ( q & P2M_UNSHARE )
+        q |= P2M_ALLOC;
+
     if ( locked )
         /* Grab the lock here, don't release until put_gfn */
         gfn_lock(p2m, gfn, 0);
@@ -1417,18 +1419,18 @@ int set_identity_p2m_entry(struct domain
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int ret;
-#endif
 
     if ( !paging_mode_translate(d) )
     {
+#endif
         if ( !is_iommu_enabled(d) )
             return 0;
         return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
                                 1ul << PAGE_ORDER_4K,
                                 IOMMUF_readable | IOMMUF_writable);
+#ifdef CONFIG_HVM
     }
 
-#ifdef CONFIG_HVM
     gfn_lock(p2m, gfn, 0);
 
     mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
@@ -1464,16 +1466,16 @@ int clear_identity_p2m_entry(struct doma
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int ret;
-#endif
 
     if ( !paging_mode_translate(d) )
     {
+#endif
         if ( !is_iommu_enabled(d) )
             return 0;
         return iommu_legacy_unmap(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K);
+#ifdef CONFIG_HVM
     }
 
-#ifdef CONFIG_HVM
     gfn_lock(p2m, gfn, 0);
 
     mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);

