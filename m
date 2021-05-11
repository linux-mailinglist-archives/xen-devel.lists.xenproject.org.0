Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3281437B1BD
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 00:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126064.237298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgbDl-00064N-QS; Tue, 11 May 2021 22:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126064.237298; Tue, 11 May 2021 22:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgbDl-00061X-Ma; Tue, 11 May 2021 22:51:21 +0000
Received: by outflank-mailman (input) for mailman id 126064;
 Tue, 11 May 2021 22:51:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgbDj-00061N-VV
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 22:51:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48513bfd-42bc-48c1-875f-483a0cd01633;
 Tue, 11 May 2021 22:51:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63CEE611F1;
 Tue, 11 May 2021 22:51:18 +0000 (UTC)
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
X-Inumbo-ID: 48513bfd-42bc-48c1-875f-483a0cd01633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620773478;
	bh=3txn367DopLUmPkzGdSQyo882YvI9IA72Po80b+03HY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P8y1HlNqgOVTRN3PszZBya/OkwRPpus6Hno2fjq+mhS90I9S4TgM8bI0+RlJaLGzB
	 3OpPkAQmXJc55Ykz457GymFRYdYQGnfkb9/zyg206NMcqcujUJHlbCFBYWsaAA98+N
	 7GCaausz7dBGipk/XoPAJ6K6BhMRDy4JGR8T8vvfnpNydZASRqGO7YTHOudMp5gc+5
	 DUvjxev9Uqp6j0xT2wV2MPBRil6wcLzNkoS8OENruSqYlZ6zc5fuYb2vBGBLO0tOzR
	 4XfbNJ/hSoP+SbiZJRInoiMG18cC/9LkQjm0d/v6U52xs17SPepYZueigLce8VWF1p
	 f4dyU86kp66nA==
Date: Tue, 11 May 2021 15:51:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 05/15] xen/arm: mm: Avoid flushing the TLBs when
 mapping are inserted
In-Reply-To: <20210425201318.15447-6-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105111551060.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-6-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, the function xen_pt_update() will flush the TLBs even when
> the mappings are inserted. This is a bit wasteful because we don't
> allow mapping replacement. Even if we were, the flush would need to
> happen earlier because mapping replacement should use Break-Before-Make
> when updating the entry.
> 
> A single call to xen_pt_update() can perform a single action. IOW, it
> is not possible to, for instance, mix inserting and removing mappings.
> Therefore, we can use `flags` to determine what action is performed.
> 
> This change will be particularly help to limit the impact of switching
> boot time mapping to use xen_pt_update().
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Nice improvement!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 8ebb36899314..1fe52b3af722 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1101,7 +1101,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
>          /* We should be here with a valid MFN. */
>          ASSERT(!mfn_eq(mfn, INVALID_MFN));
>  
> -        /* We don't allow replacing any valid entry. */
> +        /*
> +         * We don't allow replacing any valid entry.
> +         *
> +         * Note that the function xen_pt_update() relies on this
> +         * assumption and will skip the TLB flush. The function will need
> +         * to be updated if the check is relaxed.
> +         */
>          if ( lpae_is_valid(entry) )
>          {
>              if ( lpae_is_mapping(entry, level) )
> @@ -1333,11 +1339,16 @@ static int xen_pt_update(unsigned long virt,
>      }
>  
>      /*
> -     * Flush the TLBs even in case of failure because we may have
> +     * The TLBs flush can be safely skipped when a mapping is inserted
> +     * as we don't allow mapping replacement (see xen_pt_check_entry()).
> +     *
> +     * For all the other cases, the TLBs will be flushed unconditionally
> +     * even if the mapping are failed. This is because we may have
>       * partially modified the PT. This will prevent any unexpected
>       * behavior afterwards.
>       */
> -    flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> +    if ( !(flags & _PAGE_PRESENT) || mfn_eq(mfn, INVALID_MFN) )
> +        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
>  
>      spin_unlock(&xen_pt_lock);
>  
> -- 
> 2.17.1
> 

