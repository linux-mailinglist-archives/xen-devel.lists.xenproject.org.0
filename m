Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D135E35C847
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109173.208359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxDe-0004iD-28; Mon, 12 Apr 2021 14:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109173.208359; Mon, 12 Apr 2021 14:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxDd-0004hr-VN; Mon, 12 Apr 2021 14:07:13 +0000
Received: by outflank-mailman (input) for mailman id 109173;
 Mon, 12 Apr 2021 14:07:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxDc-0004hl-W8
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:07:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4421fbc-ab4a-4cf0-85cd-98c7ae45dba4;
 Mon, 12 Apr 2021 14:07:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53B18B01E;
 Mon, 12 Apr 2021 14:07:11 +0000 (UTC)
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
X-Inumbo-ID: e4421fbc-ab4a-4cf0-85cd-98c7ae45dba4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9yqIDWLh5sL3LqtehE9yMAlebDtEpvP4PzPBcBcKu8=;
	b=gBemrL+XQb9PjafG9Nm2xTEp1U7Txo/JkyIlEp4O5dpko8uD0OYBsuYOUhIrSBJaQee3IA
	JzRwWFglL54Bz88RFVWnPUUmIPFU7kV9Qp7skw1zn8uFwh4EUzklxXsqV4w9sybHeQCHTs
	ZcRx3kZKf8C0lG54XssEVqOM7uFj+zQ=
Subject: [PATCH v2 03/12] x86/mm: the gva_to_gfn() hook is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <ff26a66b-3cee-5f92-01a4-6096e7d28556@suse.com>
Date: Mon, 12 Apr 2021 16:07:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As is the adjacent ga_to_gfn() one as well as paging_gva_to_gfn().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Fix !SHADOW_PAGING && !HVM build.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1793,7 +1793,6 @@ void np2m_schedule(int dir)
         p2m_unlock(p2m);
     }
 }
-#endif
 
 unsigned long paging_gva_to_gfn(struct vcpu *v,
                                 unsigned long va,
@@ -1844,6 +1843,8 @@ unsigned long paging_gva_to_gfn(struct v
     return hostmode->gva_to_gfn(v, hostp2m, va, pfec);
 }
 
+#endif /* CONFIG_HVM */
+
 /*
  * If the map is non-NULL, we leave this function having acquired an extra ref
  * on mfn_to_page(*mfn).  In all cases, *pfec contains appropriate
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3030,6 +3030,7 @@ static bool sh_invlpg(struct vcpu *v, un
     return true;
 }
 
+#ifdef CONFIG_HVM
 
 static unsigned long
 sh_gva_to_gfn(struct vcpu *v, struct p2m_domain *p2m,
@@ -3063,6 +3064,7 @@ sh_gva_to_gfn(struct vcpu *v, struct p2m
     return gfn_x(gfn);
 }
 
+#endif /* CONFIG_HVM */
 
 static inline void
 sh_update_linear_entries(struct vcpu *v)
@@ -4183,7 +4185,9 @@ int sh_audit_l4_table(struct vcpu *v, mf
 const struct paging_mode sh_paging_mode = {
     .page_fault                    = sh_page_fault,
     .invlpg                        = sh_invlpg,
+#ifdef CONFIG_HVM
     .gva_to_gfn                    = sh_gva_to_gfn,
+#endif
     .update_cr3                    = sh_update_cr3,
     .update_paging_modes           = shadow_update_paging_modes,
     .flush_tlb                     = shadow_flush_tlb,
--- a/xen/arch/x86/mm/shadow/none.c
+++ b/xen/arch/x86/mm/shadow/none.c
@@ -43,12 +43,14 @@ static bool _invlpg(struct vcpu *v, unsi
     return true;
 }
 
+#ifdef CONFIG_HVM
 static unsigned long _gva_to_gfn(struct vcpu *v, struct p2m_domain *p2m,
                                  unsigned long va, uint32_t *pfec)
 {
     ASSERT_UNREACHABLE();
     return gfn_x(INVALID_GFN);
 }
+#endif
 
 static void _update_cr3(struct vcpu *v, int do_locking, bool noflush)
 {
@@ -63,7 +65,9 @@ static void _update_paging_modes(struct
 static const struct paging_mode sh_paging_none = {
     .page_fault                    = _page_fault,
     .invlpg                        = _invlpg,
+#ifdef CONFIG_HVM
     .gva_to_gfn                    = _gva_to_gfn,
+#endif
     .update_cr3                    = _update_cr3,
     .update_paging_modes           = _update_paging_modes,
 };
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
@@ -287,6 +289,8 @@ unsigned long paging_gva_to_gfn(struct v
                                 unsigned long va,
                                 uint32_t *pfec);
 
+#ifdef CONFIG_HVM
+
 /* Translate a guest address using a particular CR3 value.  This is used
  * to by nested HAP code, to walk the guest-supplied NPT tables as if
  * they were pagetables.
@@ -305,6 +309,8 @@ static inline unsigned long paging_ga_to
         page_order);
 }
 
+#endif /* CONFIG_HVM */
+
 /* Update all the things that are derived from the guest's CR3.
  * Called when the guest changes CR3; the caller can then use v->arch.cr3
  * as the value to load into the host CR3 to schedule this vcpu */


