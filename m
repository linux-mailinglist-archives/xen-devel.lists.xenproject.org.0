Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4937B1A1
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 00:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126051.237274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgaw7-0002gY-Sg; Tue, 11 May 2021 22:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126051.237274; Tue, 11 May 2021 22:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgaw7-0002dH-PX; Tue, 11 May 2021 22:33:07 +0000
Received: by outflank-mailman (input) for mailman id 126051;
 Tue, 11 May 2021 22:33:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgaw6-0002YY-Cr
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 22:33:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe7239c4-5821-42fb-9f9d-8b608b8fd5a8;
 Tue, 11 May 2021 22:33:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72AD16191C;
 Tue, 11 May 2021 22:33:04 +0000 (UTC)
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
X-Inumbo-ID: fe7239c4-5821-42fb-9f9d-8b608b8fd5a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620772384;
	bh=3DpZvIgBp1ulrbcu0FkPePDrABNMuMRAR+2mI6RbEpY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dcThtVxaE12GIaRfqzBi1QUhgrsFjSQMpbNiGQz9wURSgtURoW1m9K0ITCAFoHEnS
	 hXj5UH0xp4R59o0R3kVp9HWfwLzKEauNf8roE9z2RRm5C1VvEz5c+nmYgNkrpHPBT7
	 cxpYGGNWcWL/05a7+M8MZ2BR7SkJc/Cu33QzIEDQ7xyHj9HlOZvM32SL0OetTVs5Ui
	 OEO+4AcM8QorZByhlEFeVvvNgxAr+tx/ezGbd8ExOVNSP+dUky/Hul9bX9ZMvANCNm
	 ThuoDFmbLxe6gg7uTpmtaD80DKd7hFbB91LXkCAGKzKP9SLkTzQDvnCD0pLtYzYIK0
	 nAC1goDWFoI+A==
Date: Tue, 11 May 2021 15:33:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 03/15] xen/arm: p2m: Replace level_{orders, masks}
 arrays with LEVEL_{ORDER, MASK}
In-Reply-To: <20210425201318.15447-4-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105111528180.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-4-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The array level_orders and level_masks can be replaced with the
> recently introduced macros LEVEL_ORDER and LEVEL_MASK.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

So you actually planned to use LEVEL_ORDER and LEVEL_MASK in the xen/
code. I take back the previous comment :-)

Is the 4KB size "hiding" (for the lack of a better word) done on purpose?

Let me rephrase. Are you trying to consolidate info about pages being
4KB in xen/include/asm-arm/lpae.h ?

In any case:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/p2m.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index ac5031262061..1b04c3534439 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -36,12 +36,6 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>   */
>  unsigned int __read_mostly p2m_ipa_bits = 64;
>  
> -/* Helpers to lookup the properties of each level */
> -static const paddr_t level_masks[] =
> -    { ZEROETH_MASK, FIRST_MASK, SECOND_MASK, THIRD_MASK };
> -static const uint8_t level_orders[] =
> -    { ZEROETH_ORDER, FIRST_ORDER, SECOND_ORDER, THIRD_ORDER };
> -
>  static mfn_t __read_mostly empty_root_mfn;
>  
>  static uint64_t generate_vttbr(uint16_t vmid, mfn_t root_mfn)
> @@ -232,7 +226,7 @@ static lpae_t *p2m_get_root_pointer(struct p2m_domain *p2m,
>       * we can't use (P2M_ROOT_LEVEL - 1) because the root level might be
>       * 0. Yet we still want to check if all the unused bits are zeroed.
>       */
> -    root_table = gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] + LPAE_SHIFT);
> +    root_table = gfn_x(gfn) >> (LEVEL_ORDER(P2M_ROOT_LEVEL) + LPAE_SHIFT);
>      if ( root_table >= P2M_ROOT_PAGES )
>          return NULL;
>  
> @@ -378,7 +372,7 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>      if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
>      {
>          for ( level = P2M_ROOT_LEVEL; level < 3; level++ )
> -            if ( (gfn_x(gfn) & (level_masks[level] >> PAGE_SHIFT)) >
> +            if ( (gfn_x(gfn) & (LEVEL_MASK(level) >> PAGE_SHIFT)) >
>                   gfn_x(p2m->max_mapped_gfn) )
>                  break;
>  
> @@ -421,7 +415,7 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>           * The entry may point to a superpage. Find the MFN associated
>           * to the GFN.
>           */
> -        mfn = mfn_add(mfn, gfn_x(gfn) & ((1UL << level_orders[level]) - 1));
> +        mfn = mfn_add(mfn, gfn_x(gfn) & ((1UL << LEVEL_ORDER(level)) - 1));
>  
>          if ( valid )
>              *valid = lpae_is_valid(entry);
> @@ -432,7 +426,7 @@ out_unmap:
>  
>  out:
>      if ( page_order )
> -        *page_order = level_orders[level];
> +        *page_order = LEVEL_ORDER(level);
>  
>      return mfn;
>  }
> @@ -806,7 +800,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, lpae_t *entry,
>      /* Convenience aliases */
>      mfn_t mfn = lpae_get_mfn(*entry);
>      unsigned int next_level = level + 1;
> -    unsigned int level_order = level_orders[next_level];
> +    unsigned int level_order = LEVEL_ORDER(next_level);
>  
>      /*
>       * This should only be called with target != level and the entry is
> -- 
> 2.17.1
> 

