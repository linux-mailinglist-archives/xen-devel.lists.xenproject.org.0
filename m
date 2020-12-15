Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559992DB155
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54466.94636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDAk-0003pl-9g; Tue, 15 Dec 2020 16:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54466.94636; Tue, 15 Dec 2020 16:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDAk-0003pM-5p; Tue, 15 Dec 2020 16:27:34 +0000
Received: by outflank-mailman (input) for mailman id 54466;
 Tue, 15 Dec 2020 16:27:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpDAi-0003pE-PI
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:27:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e24b1aca-844e-4236-8a4b-a42a3fd7108a;
 Tue, 15 Dec 2020 16:27:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0526CAF73;
 Tue, 15 Dec 2020 16:27:31 +0000 (UTC)
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
X-Inumbo-ID: e24b1aca-844e-4236-8a4b-a42a3fd7108a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2InyiU20QXavHCYQ7QiW/K+4yItlOuaF3sK2py5UaPY=;
	b=RRmUPuqyj7Okjezg4vgHpSqG86r2xUJXyGfm/BHX17A3F8mJ2/WkyKjiPwbiRl2bJ4X3n7
	anILlklPb5y3g84Fb81vx57zn5tJ97I3eXud0b3FOf23bbHWn+59vLkzT9Mmh3qJPyMAHB
	i/ziR/q+5A/3vAqpA1c6izL+sqrbfkA=
Subject: [PATCH 5/6] x86/mm: the gva_to_gfn() hook is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Message-ID: <cc141f1f-7af8-9d23-de1d-a22ba320ca80@suse.com>
Date: Tue, 15 Dec 2020 17:27:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As is the adjacent ga_to_gfn() one as well as paging_gva_to_gfn().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1772,7 +1772,6 @@ void np2m_schedule(int dir)
         p2m_unlock(p2m);
     }
 }
-#endif
 
 unsigned long paging_gva_to_gfn(struct vcpu *v,
                                 unsigned long va,
@@ -1820,6 +1819,8 @@ unsigned long paging_gva_to_gfn(struct v
     return hostmode->gva_to_gfn(v, hostp2m, va, pfec);
 }
 
+#endif /* CONFIG_HVM */
+
 /*
  * If the map is non-NULL, we leave this function having acquired an extra ref
  * on mfn_to_page(*mfn).  In all cases, *pfec contains appropriate
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3414,6 +3414,7 @@ static bool sh_invlpg(struct vcpu *v, un
     return true;
 }
 
+#ifdef CONFIG_HVM
 
 static unsigned long
 sh_gva_to_gfn(struct vcpu *v, struct p2m_domain *p2m,
@@ -3447,6 +3448,7 @@ sh_gva_to_gfn(struct vcpu *v, struct p2m
     return gfn_x(gfn);
 }
 
+#endif /* CONFIG_HVM */
 
 static inline void
 sh_update_linear_entries(struct vcpu *v)
@@ -4571,7 +4573,9 @@ int sh_audit_l4_table(struct vcpu *v, mf
 const struct paging_mode sh_paging_mode = {
     .page_fault                    = sh_page_fault,
     .invlpg                        = sh_invlpg,
+#ifdef CONFIG_HVM
     .gva_to_gfn                    = sh_gva_to_gfn,
+#endif
     .update_cr3                    = sh_update_cr3,
     .update_paging_modes           = shadow_update_paging_modes,
     .flush_tlb                     = shadow_flush_tlb,
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -127,6 +127,7 @@ struct paging_mode {
                                             struct cpu_user_regs *regs);
     bool          (*invlpg                )(struct vcpu *v,
                                             unsigned long linear);
+#ifdef CONFIG_HVM
     unsigned long (*gva_to_gfn            )(struct vcpu *v,
                                             struct p2m_domain *p2m,
                                             unsigned long va,
@@ -136,6 +137,7 @@ struct paging_mode {
                                             unsigned long cr3,
                                             paddr_t ga, uint32_t *pfec,
                                             unsigned int *page_order);
+#endif
     void          (*update_cr3            )(struct vcpu *v, int do_locking,
                                             bool noflush);
     void          (*update_paging_modes   )(struct vcpu *v);
@@ -286,6 +288,8 @@ unsigned long paging_gva_to_gfn(struct v
                                 unsigned long va,
                                 uint32_t *pfec);
 
+#ifdef CONFIG_HVM
+
 /* Translate a guest address using a particular CR3 value.  This is used
  * to by nested HAP code, to walk the guest-supplied NPT tables as if
  * they were pagetables.
@@ -304,6 +308,8 @@ static inline unsigned long paging_ga_to
         page_order);
 }
 
+#endif /* CONFIG_HVM */
+
 /* Update all the things that are derived from the guest's CR3.
  * Called when the guest changes CR3; the caller can then use v->arch.cr3
  * as the value to load into the host CR3 to schedule this vcpu */


