Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603E442FE70
	for <lists+xen-devel@lfdr.de>; Sat, 16 Oct 2021 00:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211121.368232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbW72-0005Ed-68; Fri, 15 Oct 2021 22:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211121.368232; Fri, 15 Oct 2021 22:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbW72-0005Cm-1j; Fri, 15 Oct 2021 22:55:40 +0000
Received: by outflank-mailman (input) for mailman id 211121;
 Fri, 15 Oct 2021 22:55:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB3O=PD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mbW70-0005Cg-Jc
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 22:55:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02d0b67c-2e0b-11ec-826a-12813bfff9fa;
 Fri, 15 Oct 2021 22:55:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE9346105A;
 Fri, 15 Oct 2021 22:55:35 +0000 (UTC)
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
X-Inumbo-ID: 02d0b67c-2e0b-11ec-826a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634338536;
	bh=3bxZhWBUcCw55RihIAnDgki0ivkuQs6PuULt0GyliDk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ic71hPWiInirVNvoquJTuQWOV8f2K45FgrYpKBbKsx7az+6mn4ajf2sY09iN+icnw
	 4+gEop0ARmmxtBVbP5DKE0rBknZcJDrhSzVzO70ZZIUCWZpr8awJ4Xnmnicjz3R9qn
	 5V2EmyUymgqltpyH0jOk6DmwUMZ6g27dKo4bbqOfWWSlaOh2SSyFxro117difHS66I
	 UpiBlw0/Zhtk6eQ6N7wU+kJXqt//qXuWg2hJvrpyo1fU+gbzBI+gE06FLs+qrHwb/I
	 3mAWvKect14DpXrZ3rQOHb3r6g2PoWVZOfdjsK/WmagLAh0mlInf3ss0JuOg45rCxI
	 RMLpxWrsPJvew==
Date: Fri, 15 Oct 2021 15:55:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    iwj@xenproject.org
Subject: Re: [PATCH 1/2] x86/shadow: adjust some shadow_set_l<N>e() callers
In-Reply-To: <298846aa-f93f-4564-dbf4-4f893df8f328@suse.com>
Message-ID: <alpine.DEB.2.21.2110151554450.31303@sstabellini-ThinkPad-T480s>
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com> <298846aa-f93f-4564-dbf4-4f893df8f328@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

This patch broke gitlab-ci:

https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1684530258

In file included from guest_4.c:2:
./multi.c:2159:9: error: unused variable 'r' [-Werror,-Wunused-variable]
    int r;
        ^
1 error generated.
make[5]: *** [/builds/xen-project/people/sstabellini/xen/xen/Rules.mk:197: guest_4.o] Error 1


To be sure I got the right commit, I confirmed that by reverting the
commit gitlab-ci passes again:

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/389383466


On Wed, 13 Oct 2021, Jan Beulich wrote:
> Coverity dislikes sh_page_fault() storing the return value into a local
> variable but then never using the value (and oddly enough spots this in
> the 2- and 3-level cases, but not in the 4-level one). Instead of adding
> yet another cast to void as replacement, take the opportunity and drop a
> bunch of such casts at the same time - not using function return values
> is a common thing to do. (It of course is an independent question
> whether ignoring errors like this is a good idea.)
> 
> Coverity-ID: 1492856
> Coverity-ID: 1492858
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -1416,7 +1416,7 @@ void sh_unhook_32b_mappings(struct domai
>      shadow_l2e_t *sl2e;
>      SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
>          if ( !user_only || (sl2e->l2 & _PAGE_USER) )
> -            (void) shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
> +            shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
>      });
>  }
>  
> @@ -1428,7 +1428,7 @@ void sh_unhook_pae_mappings(struct domai
>      shadow_l2e_t *sl2e;
>      SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
>          if ( !user_only || (sl2e->l2 & _PAGE_USER) )
> -            (void) shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
> +            shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
>      });
>  }
>  
> @@ -1439,7 +1439,7 @@ void sh_unhook_64b_mappings(struct domai
>      shadow_l4e_t *sl4e;
>      SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, 0, d, {
>          if ( !user_only || (sl4e->l4 & _PAGE_USER) )
> -            (void) shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
> +            shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
>      });
>  }
>  
> @@ -1969,7 +1969,7 @@ static void sh_prefetch(struct vcpu *v,
>  
>          /* Propagate the entry.  */
>          l1e_propagate_from_guest(v, gl1e, gmfn, &sl1e, ft_prefetch, p2mt);
> -        (void) shadow_set_l1e(d, ptr_sl1e + i, sl1e, p2mt, sl1mfn);
> +        shadow_set_l1e(d, ptr_sl1e + i, sl1e, p2mt, sl1mfn);
>  
>  #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
>          if ( snpl1p != NULL )
> @@ -2534,7 +2534,7 @@ static int sh_page_fault(struct vcpu *v,
>  
>      /* Calculate the shadow entry and write it */
>      l1e_propagate_from_guest(v, gw.l1e, gmfn, &sl1e, ft, p2mt);
> -    r = shadow_set_l1e(d, ptr_sl1e, sl1e, p2mt, sl1mfn);
> +    shadow_set_l1e(d, ptr_sl1e, sl1e, p2mt, sl1mfn);
>  
>  #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
>      if ( mfn_valid(gw.l1mfn)
> @@ -3014,8 +3014,7 @@ static bool sh_invlpg(struct vcpu *v, un
>                  shadow_l1e_t *sl1;
>                  sl1 = sh_linear_l1_table(v) + shadow_l1_linear_offset(linear);
>                  /* Remove the shadow entry that maps this VA */
> -                (void) shadow_set_l1e(d, sl1, shadow_l1e_empty(),
> -                                      p2m_invalid, sl1mfn);
> +                shadow_set_l1e(d, sl1, shadow_l1e_empty(), p2m_invalid, sl1mfn);
>              }
>              paging_unlock(d);
>              /* Need the invlpg, to pick up the disappeareance of the sl1e */
> @@ -3608,7 +3607,8 @@ int sh_rm_write_access_from_l1(struct do
>               && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(readonly_mfn)) )
>          {
>              shadow_l1e_t ro_sl1e = shadow_l1e_remove_flags(*sl1e, _PAGE_RW);
> -            (void) shadow_set_l1e(d, sl1e, ro_sl1e, p2m_ram_rw, sl1mfn);
> +
> +            shadow_set_l1e(d, sl1e, ro_sl1e, p2m_ram_rw, sl1mfn);
>  #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
>              /* Remember the last shadow that we shot a writeable mapping in */
>              if ( curr->domain == d )
> @@ -3637,8 +3637,7 @@ int sh_rm_mappings_from_l1(struct domain
>          if ( (flags & _PAGE_PRESENT)
>               && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(target_mfn)) )
>          {
> -            (void) shadow_set_l1e(d, sl1e, shadow_l1e_empty(),
> -                                  p2m_invalid, sl1mfn);
> +            shadow_set_l1e(d, sl1e, shadow_l1e_empty(), p2m_invalid, sl1mfn);
>              if ( sh_check_page_has_no_refs(mfn_to_page(target_mfn)) )
>                  /* This breaks us cleanly out of the FOREACH macro */
>                  done = 1;
> @@ -3656,20 +3655,20 @@ void sh_clear_shadow_entry(struct domain
>      switch ( mfn_to_page(smfn)->u.sh.type )
>      {
>      case SH_type_l1_shadow:
> -        (void) shadow_set_l1e(d, ep, shadow_l1e_empty(), p2m_invalid, smfn);
> +        shadow_set_l1e(d, ep, shadow_l1e_empty(), p2m_invalid, smfn);
>          break;
>      case SH_type_l2_shadow:
>  #if GUEST_PAGING_LEVELS >= 4
>      case SH_type_l2h_shadow:
>  #endif
> -        (void) shadow_set_l2e(d, ep, shadow_l2e_empty(), smfn);
> +        shadow_set_l2e(d, ep, shadow_l2e_empty(), smfn);
>          break;
>  #if GUEST_PAGING_LEVELS >= 4
>      case SH_type_l3_shadow:
> -        (void) shadow_set_l3e(d, ep, shadow_l3e_empty(), smfn);
> +        shadow_set_l3e(d, ep, shadow_l3e_empty(), smfn);
>          break;
>      case SH_type_l4_shadow:
> -        (void) shadow_set_l4e(d, ep, shadow_l4e_empty(), smfn);
> +        shadow_set_l4e(d, ep, shadow_l4e_empty(), smfn);
>          break;
>  #endif
>      default: BUG(); /* Called with the wrong kind of shadow. */
> @@ -3689,7 +3688,7 @@ int sh_remove_l1_shadow(struct domain *d
>          if ( (flags & _PAGE_PRESENT)
>               && (mfn_x(shadow_l2e_get_mfn(*sl2e)) == mfn_x(sl1mfn)) )
>          {
> -            (void) shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
> +            shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
>              if ( mfn_to_page(sl1mfn)->u.sh.type == 0 )
>                  /* This breaks us cleanly out of the FOREACH macro */
>                  done = 1;
> @@ -3712,7 +3711,7 @@ int sh_remove_l2_shadow(struct domain *d
>          if ( (flags & _PAGE_PRESENT)
>               && (mfn_x(shadow_l3e_get_mfn(*sl3e)) == mfn_x(sl2mfn)) )
>          {
> -            (void) shadow_set_l3e(d, sl3e, shadow_l3e_empty(), sl3mfn);
> +            shadow_set_l3e(d, sl3e, shadow_l3e_empty(), sl3mfn);
>              if ( mfn_to_page(sl2mfn)->u.sh.type == 0 )
>                  /* This breaks us cleanly out of the FOREACH macro */
>                  done = 1;
> @@ -3734,7 +3733,7 @@ int sh_remove_l3_shadow(struct domain *d
>          if ( (flags & _PAGE_PRESENT)
>               && (mfn_x(shadow_l4e_get_mfn(*sl4e)) == mfn_x(sl3mfn)) )
>          {
> -            (void) shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
> +            shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
>              if ( mfn_to_page(sl3mfn)->u.sh.type == 0 )
>                  /* This breaks us cleanly out of the FOREACH macro */
>                  done = 1;
> 
> 

