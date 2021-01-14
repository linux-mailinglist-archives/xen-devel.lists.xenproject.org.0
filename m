Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F02F63CE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:10:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67128.119556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04GD-0007IH-2V; Thu, 14 Jan 2021 15:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67128.119556; Thu, 14 Jan 2021 15:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04GC-0007GZ-V8; Thu, 14 Jan 2021 15:10:04 +0000
Received: by outflank-mailman (input) for mailman id 67128;
 Thu, 14 Jan 2021 15:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04GC-00076f-0A
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:10:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 754297b1-04a5-4f9a-b418-e2be9910d5da;
 Thu, 14 Jan 2021 15:10:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51B49B934;
 Thu, 14 Jan 2021 15:10:02 +0000 (UTC)
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
X-Inumbo-ID: 754297b1-04a5-4f9a-b418-e2be9910d5da
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=466TJ9y3krZUXMaSrsJMQevJp2wKDieN7MPbPHgLxGA=;
	b=Z4+QZDEXDX/IyK6nG17YoZZbi9F6Ucqzl1+Ni/pCp1+DiExJA7EDDlgLhTBcYtL12oJfjM
	3MihKYxABPEz/yLLH7F4Tlz/UFmXMhl62QEnlMymmtvY5PxjlGHx7CAerbEuUcnDv/o0Sl
	BmeGjx20uZwXMTWnShoih5MPyodX+WA=
Subject: [PATCH 14/17] x86/shadow: SH_type_l2h_shadow is PV-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <005651ab-4af5-edf4-3bc1-f68635cd97d8@suse.com>
Date: Thu, 14 Jan 2021 16:10:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

..., i.e. being used only with 4 guest paging levels. Drop its L2/PAE
alias and adjust / drop conditionals. Use >= 4 where touching them
anyway, in preparation for 5-level paging.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -334,7 +334,7 @@ static void sh_audit_gw(struct vcpu *v,
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2_shadow))) )
             (void) sh_audit_l2_table(v, smfn, INVALID_MFN);
-#if GUEST_PAGING_LEVELS == 3
+#if GUEST_PAGING_LEVELS >= 4 /* 32-bit PV only */
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2h_shadow))) )
             (void) sh_audit_l2_table(v, smfn, INVALID_MFN);
@@ -937,7 +937,8 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
         /* Lower-level shadow, not yet linked form a higher level */
         mfn_to_page(smfn)->up = 0;
 
-#if GUEST_PAGING_LEVELS == 4
+#if GUEST_PAGING_LEVELS >= 4
+
 #if (SHADOW_OPTIMIZATIONS & SHOPT_LINUX_L3_TOPLEVEL)
     if ( shadow_type == SH_type_l4_64_shadow &&
          unlikely(d->arch.paging.shadow.opt_flags & SHOPT_LINUX_L3_TOPLEVEL) )
@@ -969,14 +970,12 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
         }
     }
 #endif
-#endif
 
     // Create the Xen mappings...
     if ( !shadow_mode_external(d) )
     {
         switch (shadow_type)
         {
-#if GUEST_PAGING_LEVELS == 4
         case SH_type_l4_shadow:
         {
             shadow_l4e_t *l4t = map_domain_page(smfn);
@@ -988,8 +987,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
             unmap_domain_page(l4t);
         }
         break;
-#endif
-#if GUEST_PAGING_LEVELS >= 3
+
         case SH_type_l2h_shadow:
             BUILD_BUG_ON(sizeof(l2_pgentry_t) != sizeof(shadow_l2e_t));
             if ( is_pv_32bit_domain(d) )
@@ -1000,11 +998,12 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
                 unmap_domain_page(l2t);
             }
             break;
-#endif
         default: /* Do nothing */ break;
         }
     }
 
+#endif /* GUEST_PAGING_LEVELS >= 4 */
+
     shadow_promote(d, gmfn, shadow_type);
     set_shadow_status(d, gmfn, shadow_type, smfn);
 
@@ -1334,7 +1333,7 @@ void sh_destroy_l2_shadow(struct domain
 
     SHADOW_DEBUG(DESTROY_SHADOW, "%"PRI_mfn"\n", mfn_x(smfn));
 
-#if GUEST_PAGING_LEVELS >= 3
+#if GUEST_PAGING_LEVELS >= 4
     ASSERT(t == SH_type_l2_shadow || t == SH_type_l2h_shadow);
 #else
     ASSERT(t == SH_type_l2_shadow);
@@ -1858,7 +1857,7 @@ int
 sh_map_and_validate_gl2he(struct vcpu *v, mfn_t gl2mfn,
                            void *new_gl2p, u32 size)
 {
-#if GUEST_PAGING_LEVELS >= 3
+#if GUEST_PAGING_LEVELS >= 4
     return sh_map_and_validate(v, gl2mfn, new_gl2p, size,
                                 SH_type_l2h_shadow,
                                 shadow_l2_index,
@@ -3359,9 +3358,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
                 gl2gfn = guest_l3e_get_gfn(gl3e[i]);
                 gl2mfn = get_gfn_query_unlocked(d, gfn_x(gl2gfn), &p2mt);
                 if ( p2m_is_ram(p2mt) )
-                    sh_set_toplevel_shadow(v, i, gl2mfn, (i == 3)
-                                           ? SH_type_l2h_shadow
-                                           : SH_type_l2_shadow,
+                    sh_set_toplevel_shadow(v, i, gl2mfn, SH_type_l2_shadow,
                                            sh_make_shadow);
                 else
                     sh_set_toplevel_shadow(v, i, INVALID_MFN, 0,
@@ -3663,7 +3660,7 @@ void sh_clear_shadow_entry(struct domain
         (void) shadow_set_l1e(d, ep, shadow_l1e_empty(), p2m_invalid, smfn);
         break;
     case SH_type_l2_shadow:
-#if GUEST_PAGING_LEVELS >= 3
+#if GUEST_PAGING_LEVELS >= 4
     case SH_type_l2h_shadow:
 #endif
         (void) shadow_set_l2e(d, ep, shadow_l2e_empty(), smfn);
@@ -4115,10 +4112,8 @@ int sh_audit_l3_table(struct vcpu *v, mf
             mfn = shadow_l3e_get_mfn(*sl3e);
             gmfn = get_shadow_status(d, get_gfn_query_unlocked(
                                         d, gfn_x(gfn), &p2mt),
-                                     ((GUEST_PAGING_LEVELS == 3 ||
-                                       is_pv_32bit_domain(d))
-                                      && !shadow_mode_external(d)
-                                      && (guest_index(gl3e) % 4) == 3)
+                                     (is_pv_32bit_domain(d) &&
+                                      guest_index(gl3e) == 3)
                                      ? SH_type_l2h_shadow
                                      : SH_type_l2_shadow);
             if ( !mfn_eq(gmfn, mfn) )
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -195,7 +195,6 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define SH_type_l1_shadow  SH_type_l1_pae_shadow
 #define SH_type_fl1_shadow SH_type_fl1_pae_shadow
 #define SH_type_l2_shadow  SH_type_l2_pae_shadow
-#define SH_type_l2h_shadow SH_type_l2h_pae_shadow
 #elif GUEST_PAGING_LEVELS == 4
 #define SH_type_l1_shadow  SH_type_l1_64_shadow
 #define SH_type_fl1_shadow SH_type_fl1_64_shadow


