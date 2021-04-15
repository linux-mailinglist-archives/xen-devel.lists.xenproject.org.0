Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480B360FA5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111381.213024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4Or-0001z6-2b; Thu, 15 Apr 2021 15:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111381.213024; Thu, 15 Apr 2021 15:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4Oq-0001yh-Uw; Thu, 15 Apr 2021 15:59:24 +0000
Received: by outflank-mailman (input) for mailman id 111381;
 Thu, 15 Apr 2021 15:59:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EEd9=JM=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lX4Op-0001yc-ME
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 15:59:23 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffbe45f5-159c-409b-9c96-d90ce670d948;
 Thu, 15 Apr 2021 15:59:22 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lX4Ol-0008Kk-BQ; Thu, 15 Apr 2021 15:59:19 +0000
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
X-Inumbo-ID: ffbe45f5-159c-409b-9c96-d90ce670d948
Date: Thu, 15 Apr 2021 16:59:19 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: adjust callback arrays
Message-ID: <YHhi19OqHN2cqMBA@deinos.phlegethon.org>
References: <621aa6f6-d7f8-25eb-9aeb-f181a9cb3bbc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <621aa6f6-d7f8-25eb-9aeb-f181a9cb3bbc@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 12:42 +0200 on 12 Apr (1618231332), Jan Beulich wrote:
> Some of them have entries with stale comments. Rather than correcting
> these comments, re-arrange how these arrays get populated, shrinking
> their sizes at the same time (by omitting trailing NULL entries: Use
> dedicated element initializers, serving the purpose of what the
> comments did so far. This then also makes these arrays independent of
> the actual ordering of the individual SH_type_*.
> 
> While tightening respective ASSERT()s in hash_{vcpu,domain}_foreach(),
> also tighten related ones in shadow_hash_{insert,delete}().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good, but please leave the arrays at full size.  With the full
array, a bug could lead to an assertion failure or NULL deref; with
a short array it could mean following a bogus funtion pointer.

With that change, Acked-by: Tim Deegan <tim@xen.org>

Cheers,

Tim.

> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1565,7 +1565,7 @@ void shadow_hash_insert(struct domain *d
>  
>      ASSERT(paging_locked_by_me(d));
>      ASSERT(d->arch.paging.shadow.hash_table);
> -    ASSERT(t);
> +    ASSERT(t >= SH_type_min_shadow && t <= SH_type_max_shadow);
>  
>      sh_hash_audit(d);
>  
> @@ -1590,7 +1590,7 @@ void shadow_hash_delete(struct domain *d
>  
>      ASSERT(paging_locked_by_me(d));
>      ASSERT(d->arch.paging.shadow.hash_table);
> -    ASSERT(t);
> +    ASSERT(t >= SH_type_min_shadow && t <= SH_type_max_shadow);
>  
>      sh_hash_audit(d);
>  
> @@ -1668,7 +1668,7 @@ static void hash_vcpu_foreach(struct vcp
>          {
>              if ( callback_mask & (1 << x->u.sh.type) )
>              {
> -                ASSERT(x->u.sh.type < SH_type_unused);
> +                ASSERT(x->u.sh.type <= SH_type_max_shadow);
>                  ASSERT(callbacks[x->u.sh.type] != NULL);
>                  done = callbacks[x->u.sh.type](v, page_to_mfn(x),
>                                                 callback_mfn);
> @@ -1715,7 +1715,7 @@ static void hash_domain_foreach(struct d
>          {
>              if ( callback_mask & (1 << x->u.sh.type) )
>              {
> -                ASSERT(x->u.sh.type < SH_type_unused);
> +                ASSERT(x->u.sh.type <= SH_type_max_shadow);
>                  ASSERT(callbacks[x->u.sh.type] != NULL);
>                  done = callbacks[x->u.sh.type](d, page_to_mfn(x),
>                                                 callback_mfn);
> @@ -1819,26 +1819,16 @@ int sh_remove_write_access(struct domain
>                             unsigned long fault_addr)
>  {
>      /* Dispatch table for getting per-type functions */
> -    static const hash_domain_callback_t callbacks[SH_type_unused] = {
> -        NULL, /* none    */
> +    static const hash_domain_callback_t callbacks[] = {
>  #ifdef CONFIG_HVM
> -        SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2), /* l1_32   */
> -        SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2), /* fl1_32  */
> -        NULL, /* l2_32   */
> -        SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3), /* l1_pae  */
> -        SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3), /* fl1_pae */
> -        NULL, /* l2_pae  */
> +        [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
> +        [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
> +        [SH_type_l1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3),
> +        [SH_type_fl1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3),
>  #endif
> -        SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4), /* l1_64   */
> -        SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4), /* fl1_64  */
> -        NULL, /* l2_64   */
> -        NULL, /* l2h_64  */
> -        NULL, /* l3_64   */
> -        NULL, /* l4_64   */
> -        NULL, /* p2m     */
> -        NULL  /* unused  */
> +        [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4),
> +        [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4),
>      };
> -
>      static const unsigned int callback_mask = SHF_L1_ANY | SHF_FL1_ANY;
>      struct page_info *pg = mfn_to_page(gmfn);
>  #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
> @@ -2044,26 +2034,16 @@ int sh_remove_all_mappings(struct domain
>      struct page_info *page = mfn_to_page(gmfn);
>  
>      /* Dispatch table for getting per-type functions */
> -    static const hash_domain_callback_t callbacks[SH_type_unused] = {
> -        NULL, /* none    */
> +    static const hash_domain_callback_t callbacks[] = {
>  #ifdef CONFIG_HVM
> -        SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2), /* l1_32   */
> -        SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2), /* fl1_32  */
> -        NULL, /* l2_32   */
> -        SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3), /* l1_pae  */
> -        SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3), /* fl1_pae */
> -        NULL, /* l2_pae  */
> +        [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
> +        [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
> +        [SH_type_l1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3),
> +        [SH_type_fl1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3),
>  #endif
> -        SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4), /* l1_64   */
> -        SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4), /* fl1_64  */
> -        NULL, /* l2_64   */
> -        NULL, /* l2h_64  */
> -        NULL, /* l3_64   */
> -        NULL, /* l4_64   */
> -        NULL, /* p2m     */
> -        NULL  /* unused  */
> +        [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4),
> +        [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4),
>      };
> -
>      static const unsigned int callback_mask = SHF_L1_ANY | SHF_FL1_ANY;
>  
>      perfc_incr(shadow_mappings);
> @@ -2189,45 +2169,27 @@ void sh_remove_shadows(struct domain *d,
>  
>      /* Dispatch table for getting per-type functions: each level must
>       * be called with the function to remove a lower-level shadow. */
> -    static const hash_domain_callback_t callbacks[SH_type_unused] = {
> -        NULL, /* none    */
> +    static const hash_domain_callback_t callbacks[] = {
>  #ifdef CONFIG_HVM
> -        NULL, /* l1_32   */
> -        NULL, /* fl1_32  */
> -        SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2), /* l2_32   */
> -        NULL, /* l1_pae  */
> -        NULL, /* fl1_pae */
> -        SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3), /* l2_pae  */
> +        [SH_type_l2_32_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2),
> +        [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
>  #endif
> -        NULL, /* l1_64   */
> -        NULL, /* fl1_64  */
> -        SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4), /* l2_64   */
> -        SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4), /* l2h_64  */
> -        SHADOW_INTERNAL_NAME(sh_remove_l2_shadow, 4), /* l3_64   */
> -        SHADOW_INTERNAL_NAME(sh_remove_l3_shadow, 4), /* l4_64   */
> -        NULL, /* p2m     */
> -        NULL  /* unused  */
> +        [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
> +        [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
> +        [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l2_shadow, 4),
> +        [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l3_shadow, 4),
>      };
>  
>      /* Another lookup table, for choosing which mask to use */
> -    static const unsigned int masks[SH_type_unused] = {
> -        0, /* none    */
> +    static const unsigned int masks[SH_type_max_shadow + 1] = {
>  #ifdef CONFIG_HVM
> -        SHF_L2_32, /* l1_32   */
> -        0, /* fl1_32  */
> -        0, /* l2_32   */
> -        SHF_L2_PAE, /* l1_pae  */
> -        0, /* fl1_pae */
> -        0, /* l2_pae  */
> +        [SH_type_l1_32_shadow] = SHF_L2_32,
> +        [SH_type_l1_pae_shadow] = SHF_L2_PAE,
>  #endif
> -        SHF_L2H_64 | SHF_L2_64, /* l1_64   */
> -        0, /* fl1_64  */
> -        SHF_L3_64, /* l2_64   */
> -        SHF_L3_64, /* l2h_64  */
> -        SHF_L4_64, /* l3_64   */
> -        0, /* l4_64   */
> -        0, /* p2m     */
> -        0  /* unused  */
> +        [SH_type_l1_64_shadow] = SHF_L2H_64 | SHF_L2_64,
> +        [SH_type_l2_64_shadow] = SHF_L3_64,
> +        [SH_type_l2h_64_shadow] = SHF_L3_64,
> +        [SH_type_l3_64_shadow] = SHF_L4_64,
>      };
>  
>      ASSERT(!(all && fast));
> @@ -2356,24 +2318,8 @@ static int sh_clear_up_pointer(struct vc
>  
>  void sh_reset_l3_up_pointers(struct vcpu *v)
>  {
> -    static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
> -        NULL, /* none    */
> -#ifdef CONFIG_HVM
> -        NULL, /* l1_32   */
> -        NULL, /* fl1_32  */
> -        NULL, /* l2_32   */
> -        NULL, /* l1_pae  */
> -        NULL, /* fl1_pae */
> -        NULL, /* l2_pae  */
> -#endif
> -        NULL, /* l1_64   */
> -        NULL, /* fl1_64  */
> -        NULL, /* l2_64   */
> -        NULL, /* l2h_64  */
> -        sh_clear_up_pointer, /* l3_64   */
> -        NULL, /* l4_64   */
> -        NULL, /* p2m     */
> -        NULL  /* unused  */
> +    static const hash_vcpu_callback_t callbacks[] = {
> +        [SH_type_l3_64_shadow] = sh_clear_up_pointer,
>      };
>      static const unsigned int callback_mask = SHF_L3_64;
>  
> @@ -3381,25 +3327,23 @@ int shadow_domctl(struct domain *d,
>  void shadow_audit_tables(struct vcpu *v)
>  {
>      /* Dispatch table for getting per-type functions */
> -    static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
> -        NULL, /* none    */
> +    static const hash_vcpu_callback_t callbacks[] = {
>  #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
>  # ifdef CONFIG_HVM
> -        SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),  /* l1_32   */
> -        SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 2), /* fl1_32  */
> -        SHADOW_INTERNAL_NAME(sh_audit_l2_table, 2),  /* l2_32   */
> -        SHADOW_INTERNAL_NAME(sh_audit_l1_table, 3),  /* l1_pae  */
> -        SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 3), /* fl1_pae */
> -        SHADOW_INTERNAL_NAME(sh_audit_l2_table, 3),  /* l2_pae  */
> +        [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),
> +        [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 2),
> +        [SH_type_l2_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 2),
> +        [SH_type_l1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 3),
> +        [SH_type_fl1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 3),
> +        [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 3),
>  # endif
> -        SHADOW_INTERNAL_NAME(sh_audit_l1_table, 4),  /* l1_64   */
> -        SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 4), /* fl1_64  */
> -        SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),  /* l2_64   */
> -        SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),  /* l2h_64   */
> -        SHADOW_INTERNAL_NAME(sh_audit_l3_table, 4),  /* l3_64   */
> -        SHADOW_INTERNAL_NAME(sh_audit_l4_table, 4),  /* l4_64   */
> +        [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 4),
> +        [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 4),
> +        [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),
> +        [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),
> +        [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l3_table, 4),
> +        [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l4_table, 4),
>  #endif
> -        NULL  /* All the rest */
>      };
>      unsigned int mask;
>  
> @@ -3427,7 +3371,9 @@ void shadow_audit_tables(struct vcpu *v)
>          }
>      }
>  
> -    HASH_CALLBACKS_CHECK(SHF_page_type_mask);
> +    HASH_CALLBACKS_CHECK(SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES |
> +                                         SHADOW_AUDIT_ENTRIES_FULL)
> +                         ? SHF_page_type_mask : 0);
>      hash_vcpu_foreach(v, mask, callbacks, INVALID_MFN);
>  }
>  

