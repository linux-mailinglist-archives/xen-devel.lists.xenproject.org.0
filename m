Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3222F63D6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67143.119593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04HY-0007kF-2w; Thu, 14 Jan 2021 15:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67143.119593; Thu, 14 Jan 2021 15:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04HX-0007jo-Vj; Thu, 14 Jan 2021 15:11:27 +0000
Received: by outflank-mailman (input) for mailman id 67143;
 Thu, 14 Jan 2021 15:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04HW-0007jd-EP
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:11:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d2e5c5f-82fd-4222-97be-c2d314783dac;
 Thu, 14 Jan 2021 15:11:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D589AF32;
 Thu, 14 Jan 2021 15:11:24 +0000 (UTC)
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
X-Inumbo-ID: 2d2e5c5f-82fd-4222-97be-c2d314783dac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=miBa0r1mNWyRNEoesGZrImnMauvIr2miR/AEZlAYlTQ=;
	b=UziqbAaEnsgy+A4/ea90IWGIUiEY1O2apV1I+62JX594H4mGkiNqr4zOyew86cHonEnuIN
	7J0g0WTBBgHHmvFXEWcKjw7GppqEJJlQNS/66UlOXJoWNNDKRVz/O9e2qnXgb2K/RaKI5o
	Gp9gS1XOvObp74OWld9L12kV8kk6Gho=
Subject: [PATCH 17/17] x86/shadow: adjust is_pv_*() checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <74e68907-d60a-e8ff-f0d2-f4f3b5c2090a@suse.com>
Date: Thu, 14 Jan 2021 16:11:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

To cover for "x86: correct is_pv_domain() when !CONFIG_PV" (or any other
change along those lines) we should prefer is_hvm_*(), as it may become
a build time constant while is_pv_*() generally won't.

Also when a domain pointer is in scope, prefer is_*_domain() over
is_*_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -674,7 +674,7 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
     if ( pg->shadow_flags &
          ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
          || sh_page_has_multiple_shadows(pg)
-         || is_pv_vcpu(v)
+         || !is_hvm_vcpu(v)
          || !v->domain->arch.paging.shadow.oos_active )
         return 0;
 
@@ -2419,7 +2419,7 @@ static void sh_update_paging_modes(struc
         v->arch.paging.mode->shadow.detach_old_tables(v);
 
 #ifdef CONFIG_HVM
-    if ( !is_pv_domain(d) )
+    if ( is_hvm_domain(d) )
     {
         const struct paging_mode *old_mode = v->arch.paging.mode;
 
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -666,8 +666,8 @@ _sh_propagate(struct vcpu *v,
     // PV guests in 64-bit mode use two different page tables for user vs
     // supervisor permissions, making the guest's _PAGE_USER bit irrelevant.
     // It is always shadowed as present...
-    if ( (GUEST_PAGING_LEVELS == 4) && !is_pv_32bit_domain(d)
-         && is_pv_domain(d) )
+    if ( (GUEST_PAGING_LEVELS == 4) && !is_hvm_domain(d) &&
+         !is_pv_32bit_domain(d) )
     {
         sflags |= _PAGE_USER;
     }
@@ -1119,7 +1119,7 @@ static shadow_l2e_t * shadow_get_and_cre
         unsigned int t = SH_type_l2_shadow;
 
         /* Tag compat L2 containing hypervisor (m2p) mappings */
-        if ( is_pv_32bit_vcpu(v) &&
+        if ( is_pv_32bit_domain(d) &&
              guest_l4_table_offset(gw->va) == 0 &&
              guest_l3_table_offset(gw->va) == 3 )
             t = SH_type_l2h_shadow;
@@ -2313,7 +2313,7 @@ static int sh_page_fault(struct vcpu *v,
         return 0;
     }
 
-    cpl = is_pv_vcpu(v) ? (regs->ss & 3) : hvm_get_cpl(v);
+    cpl = is_hvm_domain(d) ? hvm_get_cpl(v) : (regs->ss & 3);
 
  rewalk:
 
@@ -3236,7 +3236,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
 #endif
 
     /* Don't do anything on an uninitialised vcpu */
-    if ( is_pv_domain(d) && !v->is_initialised )
+    if ( !is_hvm_domain(d) && !v->is_initialised )
     {
         ASSERT(v->arch.cr3 == 0);
         return;
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -27,7 +27,7 @@ int shadow_domain_init(struct domain *d)
     };
 
     paging_log_dirty_init(d, &sh_none_ops);
-    return is_pv_domain(d) ? 0 : -EOPNOTSUPP;
+    return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
 }
 
 static int _page_fault(struct vcpu *v, unsigned long va,


