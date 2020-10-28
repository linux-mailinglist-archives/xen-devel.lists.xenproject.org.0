Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11529CF31
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 10:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13426.34062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhgI-0005SY-9A; Wed, 28 Oct 2020 09:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13426.34062; Wed, 28 Oct 2020 09:23:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhgI-0005S7-5X; Wed, 28 Oct 2020 09:23:46 +0000
Received: by outflank-mailman (input) for mailman id 13426;
 Wed, 28 Oct 2020 09:23:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXhgG-0005Ry-Jg
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:23:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51916575-9bb7-4837-a3e0-4485b7de8df7;
 Wed, 28 Oct 2020 09:23:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D7D9AE55;
 Wed, 28 Oct 2020 09:23:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXhgG-0005Ry-Jg
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:23:44 +0000
X-Inumbo-ID: 51916575-9bb7-4837-a3e0-4485b7de8df7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 51916575-9bb7-4837-a3e0-4485b7de8df7;
	Wed, 28 Oct 2020 09:23:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603877021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ldwy/42iIo0sCTIc18oLAOIhkEM9oMjLPSiF7ItDO6A=;
	b=d1ADUAQyyFUI5XPvjZrMvxa7fbW5nx6uYZ2x76+G4OxQVF6a/8D3953Der42YgiufWgwaq
	pU0gZg+yCkDQoGRT/GV7jDbhARuDfrvBelfA2iO2aEMUrv31G0NowcZvsRrb5+c6yx2bvQ
	j77ku8ZK5XWVCUFY5OpYz89d0hzj+co=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8D7D9AE55;
	Wed, 28 Oct 2020 09:23:41 +0000 (UTC)
Subject: [PATCH 3/5] x86/p2m: suppress audit_p2m hook when possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Message-ID: <722cf75e-da6a-49c5-472a-898796c9030e@suse.com>
Date: Wed, 28 Oct 2020 10:23:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When P2M_AUDIT is false, it's unused, so instead of having a dangling
NULL pointer sit there, omit the field altogether.

Instead of adding "#if P2M_AUDIT && defined(CONFIG_HVM)" in even more
places, fold the latter part right into the definition of P2M_AUDIT.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1012,7 +1012,7 @@ long arch_do_domctl(
         break;
 #endif
 
-#if P2M_AUDIT && defined(CONFIG_HVM)
+#if P2M_AUDIT
     case XEN_DOMCTL_audit_p2m:
         if ( d == currd )
             ret = -EPERM;
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1260,7 +1260,9 @@ int ept_p2m_init(struct p2m_domain *p2m)
     p2m->change_entry_type_global = ept_change_entry_type_global;
     p2m->change_entry_type_range = ept_change_entry_type_range;
     p2m->memory_type_changed = ept_memory_type_changed;
+#if P2M_AUDIT
     p2m->audit_p2m = NULL;
+#endif
     p2m->tlb_flush = ept_tlb_flush;
 
     /* Set the memory type used when accessing EPT paging structures. */
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -971,8 +971,8 @@ static int p2m_pt_change_entry_type_rang
     return err;
 }
 
-#if P2M_AUDIT && defined(CONFIG_HVM)
-long p2m_pt_audit_p2m(struct p2m_domain *p2m)
+#if P2M_AUDIT
+static long p2m_pt_audit_p2m(struct p2m_domain *p2m)
 {
     unsigned long entry_count = 0, pmbad = 0;
     unsigned long mfn, gfn, m2pfn;
@@ -1120,8 +1120,6 @@ long p2m_pt_audit_p2m(struct p2m_domain
 
     return pmbad;
 }
-#else
-# define p2m_pt_audit_p2m NULL
 #endif /* P2M_AUDIT */
 
 /* Set up the p2m function pointers for pagetable format */
@@ -1141,8 +1139,6 @@ void p2m_pt_init(struct p2m_domain *p2m)
 
 #if P2M_AUDIT
     p2m->audit_p2m = p2m_pt_audit_p2m;
-#else
-    p2m->audit_p2m = NULL;
 #endif
 }
 
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2435,7 +2435,7 @@ int p2m_altp2m_propagate_change(struct d
 
 /*** Audit ***/
 
-#if P2M_AUDIT && defined(CONFIG_HVM)
+#if P2M_AUDIT
 void audit_p2m(struct domain *d,
                uint64_t *orphans,
                 uint64_t *m2p_bad,
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -31,6 +31,14 @@
 #include <asm/mem_sharing.h>
 #include <asm/page.h>    /* for pagetable_t */
 
+/* Debugging and auditing of the P2M code? */
+#ifndef NDEBUG
+#define P2M_AUDIT     defined(CONFIG_HVM)
+#else
+#define P2M_AUDIT     0
+#endif
+#define P2M_DEBUGGING 0
+
 extern bool_t opt_hap_1gb, opt_hap_2mb;
 
 /*
@@ -268,7 +276,9 @@ struct p2m_domain {
     int                (*write_p2m_entry)(struct p2m_domain *p2m,
                                           unsigned long gfn, l1_pgentry_t *p,
                                           l1_pgentry_t new, unsigned int level);
+#if P2M_AUDIT
     long               (*audit_p2m)(struct p2m_domain *p2m);
+#endif
 
     /*
      * P2M updates may require TLBs to be flushed (invalidated).
@@ -758,14 +768,6 @@ extern void p2m_pt_init(struct p2m_domai
 void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
                      p2m_query_t q, uint32_t *pfec);
 
-/* Debugging and auditing of the P2M code? */
-#ifndef NDEBUG
-#define P2M_AUDIT     1
-#else
-#define P2M_AUDIT     0
-#endif
-#define P2M_DEBUGGING 0
-
 #if P2M_AUDIT
 extern void audit_p2m(struct domain *d,
                       uint64_t *orphans,


