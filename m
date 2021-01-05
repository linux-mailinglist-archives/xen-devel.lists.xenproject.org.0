Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA7A2EABDE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61985.109417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmMX-00031z-T9; Tue, 05 Jan 2021 13:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61985.109417; Tue, 05 Jan 2021 13:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmMX-00031a-Ov; Tue, 05 Jan 2021 13:27:01 +0000
Received: by outflank-mailman (input) for mailman id 61985;
 Tue, 05 Jan 2021 13:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwmMW-00031U-Pt
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:27:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8564505d-956d-4b3a-a1a5-f36349b517ad;
 Tue, 05 Jan 2021 13:26:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00BEBAA35;
 Tue,  5 Jan 2021 13:26:58 +0000 (UTC)
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
X-Inumbo-ID: 8564505d-956d-4b3a-a1a5-f36349b517ad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609853219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZpqOLd3W+OJl5ienbqqet14b78a9F1FtSvWUnVcTds=;
	b=OARqU68ffbZx0eT6pwqVy+CFnPxmIY3Euq6KVykCiX7yLkcMwasrvYHwBrAICA2a7W2Pu2
	2HtU813obQ9vuvRx+7jO5fDl6lW3T587BS5gxwHROM5pL4C67fi0nn6FjsH9ZYAUi6yy0Y
	jVDECd2yPOMv/y7SxyJA1w2zB2Y5Rtc=
Subject: [PATCH 4/5] x86: don't pointlessly use get_domain_by_id()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Message-ID: <d81347be-5f46-0bb3-2ecf-ab69983679aa@suse.com>
Date: Tue, 5 Jan 2021 14:26:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

For short-lived references rcu_lock_domain_by_id() is the better
(slightly cheaper) alternative.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -87,7 +87,7 @@ mc_memerr_dhandler(struct mca_binfo *bin
             BUG_ON( bank->mc_domid == DOMID_COW );
             if ( bank->mc_domid != DOMID_XEN )
             {
-                d = get_domain_by_id(bank->mc_domid);
+                d = rcu_lock_domain_by_id(bank->mc_domid);
                 ASSERT(d);
                 gfn = get_gpfn_from_mfn((bank->mc_addr) >> PAGE_SHIFT);
 
@@ -132,6 +132,8 @@ mc_memerr_dhandler(struct mca_binfo *bin
                     goto vmce_failed;
                 }
 
+                rcu_unlock_domain(d);
+
                 /*
                  * Impacted domain go on with domain's recovery job
                  * if the domain has its own MCA handler.
@@ -139,12 +141,11 @@ mc_memerr_dhandler(struct mca_binfo *bin
                  * its own recovery job.
                  */
                 *result = MCER_RECOVERED;
-                put_domain(d);
 
                 return;
 vmce_failed:
-                put_domain(d);
                 domain_crash(d);
+                rcu_unlock_domain(d);
             }
         }
     }
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1497,7 +1497,6 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_m
 
         if ( mc_msrinject->mcinj_flags & MC_MSRINJ_F_GPADDR )
         {
-            domid_t domid;
             struct domain *d;
             struct mcinfo_msr *msr;
             unsigned int i;
@@ -1505,17 +1504,17 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_m
             unsigned long gfn, mfn;
             p2m_type_t t;
 
-            domid = (mc_msrinject->mcinj_domid == DOMID_SELF) ?
-                    current->domain->domain_id : mc_msrinject->mcinj_domid;
-            if ( domid >= DOMID_FIRST_RESERVED )
-                return x86_mcerr("do_mca inject: incompatible flag "
-                                 "MC_MSRINJ_F_GPADDR with domain %d",
-                                 -EINVAL, domid);
-
-            d = get_domain_by_id(domid);
+            d = rcu_lock_domain_by_any_id(mc_msrinject->mcinj_domid);
             if ( d == NULL )
+            {
+                if ( mc_msrinject->mcinj_domid >= DOMID_FIRST_RESERVED )
+                    return x86_mcerr("do_mca inject: incompatible flag "
+                                     "MC_MSRINJ_F_GPADDR with domain %d",
+                                     -EINVAL, domid);
+
                 return x86_mcerr("do_mca inject: bad domain id %d",
                                  -EINVAL, domid);
+            }
 
             for ( i = 0, msr = &mc_msrinject->mcinj_msr[0];
                   i < mc_msrinject->mcinj_count;
@@ -1528,7 +1527,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_m
                 if ( mfn == mfn_x(INVALID_MFN) )
                 {
                     put_gfn(d, gfn);
-                    put_domain(d);
+                    rcu_unlock_domain(d);
                     return x86_mcerr("do_mca inject: bad gfn %#lx of domain %d",
                                      -EINVAL, gfn, domid);
                 }
@@ -1538,7 +1537,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_m
                 put_gfn(d, gfn);
             }
 
-            put_domain(d);
+            rcu_unlock_domain(d);
         }
 
         if ( !x86_mc_msrinject_verify(mc_msrinject) )
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -164,13 +164,13 @@ unsigned int dbg_rw_mem(void * __user ad
                         unsigned int len, domid_t domid, bool toaddr,
                         uint64_t pgd3)
 {
-        struct domain *d = get_domain_by_id(domid);
+    struct domain *d = rcu_lock_domain_by_id(domid);
 
     if ( d )
     {
         if ( !d->is_dying )
             len = dbg_rw_guest_mem(d, addr, buf, len, toaddr, pgd3);
-        put_domain(d);
+        rcu_unlock_domain(d);
     }
 
     return len;
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -323,7 +323,7 @@ void destroy_irq(unsigned int irq)
 
     if ( desc->arch.creator_domid != DOMID_INVALID )
     {
-        struct domain *d = get_domain_by_id(desc->arch.creator_domid);
+        struct domain *d = rcu_lock_domain_by_id(desc->arch.creator_domid);
 
         if ( d )
         {
@@ -334,7 +334,7 @@ void destroy_irq(unsigned int irq)
                        "Could not revoke %pd access to IRQ%u (error %d)\n",
                        d, irq, err);
 
-            put_domain(d);
+            rcu_unlock_domain(d);
         }
 
         desc->arch.creator_domid = DOMID_INVALID;


