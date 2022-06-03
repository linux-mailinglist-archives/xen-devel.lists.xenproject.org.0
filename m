Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715E53D39E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 00:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341681.566912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxFoE-0003fB-0w; Fri, 03 Jun 2022 22:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341681.566912; Fri, 03 Jun 2022 22:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxFoD-0003cU-UH; Fri, 03 Jun 2022 22:30:21 +0000
Received: by outflank-mailman (input) for mailman id 341681;
 Fri, 03 Jun 2022 22:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nxFoB-0003cF-Ls
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 22:30:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf2993b1-e38c-11ec-837f-e5687231ffcc;
 Sat, 04 Jun 2022 00:30:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CED42B824CB;
 Fri,  3 Jun 2022 22:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4965FC385A9;
 Fri,  3 Jun 2022 22:30:16 +0000 (UTC)
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
X-Inumbo-ID: bf2993b1-e38c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654295416;
	bh=atfnncD2H3LRRgyTYv2tMls9s3FmBiZ/DMqBNAVMSfU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KMdZl20tzhNW61FQFgpU8NwKjAtHI8PHrI+AU1HW95bvB8qr4kOrYzMSxtkXY3Oab
	 UAe0UGfRti6aiRT3hSoDjycL2jrD/hQXd6r/B8fgB4Qf8s67zFSLMEvnkYPHDpV8lx
	 rUldZDLZOn4sp4A1eNiSecYktt9FYpEkDjBLI1bgmdc5NXl3wxRPTyg3AWvFik/P+4
	 3Js54obF8LLCw2MKQBHB2F0bVgz0JWqtHfR70blsJCaIUBACPcQ3hv9JEOZ5IBYGey
	 oqrHXc1+1zdQidmqvmGFdyfE+Q5TOQwxSIXQwXgqPtFB99k9WZXGZPIFAAKtVyX8zH
	 Y6fL93BUE8yWw==
Date: Fri, 3 Jun 2022 15:30:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 03/16] xen/arm: mm: Avoid flushing the TLBs when mapping
 are inserted
In-Reply-To: <20220520120937.28925-4-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206031529490.2783803@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-4-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Julien Grall wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v4:
>         - Switch the check to a different expression that will still
>         result to the same truth table.
> 
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index c4487dd7fc46..747083d820dd 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1119,7 +1119,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
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
> @@ -1434,11 +1440,16 @@ static int xen_pt_update(unsigned long virt,
>      }
>  
>      /*
> -     * Flush the TLBs even in case of failure because we may have
> +     * The TLBs flush can be safely skipped when a mapping is inserted
> +     * as we don't allow mapping replacement (see xen_pt_check_entry()).
> +     *
> +     * For all the other cases, the TLBs will be flushed unconditionally
> +     * even if the mapping has failed. This is because we may have
>       * partially modified the PT. This will prevent any unexpected
>       * behavior afterwards.
>       */
> -    flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> +    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
> +        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
>  
>      spin_unlock(&xen_pt_lock);
>  
> -- 
> 2.32.0
> 

