Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7370D77C2C7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 23:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583824.914157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVfSJ-0006Ef-6o; Mon, 14 Aug 2023 21:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583824.914157; Mon, 14 Aug 2023 21:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVfSJ-0006Bw-4C; Mon, 14 Aug 2023 21:50:31 +0000
Received: by outflank-mailman (input) for mailman id 583824;
 Mon, 14 Aug 2023 21:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BKCc=D7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qVfSH-0006Bq-Mh
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 21:50:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 947ba45a-3aec-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 23:50:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03289611B0;
 Mon, 14 Aug 2023 21:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9BBC433C7;
 Mon, 14 Aug 2023 21:50:24 +0000 (UTC)
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
X-Inumbo-ID: 947ba45a-3aec-11ee-b289-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692049826;
	bh=BbkPiy9vhk+CnVt+c3/OqzfDT0gOe87yqh26ziHMQ68=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WanGi3w5bFAJf/OIfqob9wsrxHJx+6OU5nfDubN5fp7bTR2PxSOIVqdnlsvHvk/QA
	 I1Ek+lh6nx2RY/8j+oiuJK+5yAc+FVK3NMYDFstKxYOCOcTxFP9RIsurUrIShAF1CV
	 joelLpLdzeypLMD29tjy9hA+mgGsGrLW4nFNCEE5YMYqG19k71RahfFpiikrEwFORM
	 y+6eJZYjywBsoyUiFx/QF0YKFBaG5X7SAuGsRpkhaoHcT1dM8pYhdNsX2aEIdmsX2Z
	 ZcJKYSrSrgWKFLkuBeRLKmsk8BKcgujyWJMvXC3XwqIs9F7tksVbvb2Upcmz8M1fT2
	 X8p1zTZZslBGQ==
Date: Mon, 14 Aug 2023 14:50:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2] xen/arm: traps: remove unused function
 'dump_guest_s1_walk'
In-Reply-To: <771478833d2f5f0d0c7ee706fcc7e57637b5068b.1692003039.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308141450070.6458@ubuntu-linux-20-04-desktop>
References: <771478833d2f5f0d0c7ee706fcc7e57637b5068b.1692003039.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Aug 2023, Nicola Vetrini wrote:
> The function has no uses in the codebase, and can be removed.
> This also avoids the violation of MISRA C:2012 Rule 8.4 and Rule 2.1
> because it has no declaration and the function's code is unreachable.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes in v2:
> - Modified commit message according to review suggestions.
> 
> The function in question has no callers and its removal has already
> been proposed (and acked) as part of this larger series [1].
> There have been further bugfixes to that function (commits
> a43cc8fc0827 and 60e06f2b1b2b) but they do not add any caller,
> hence it can be removed.
> 
> [1] https://lore.kernel.org/xen-devel/1395766541-23979-27-git-send-email-julien.grall@linaro.org/
> ---
>  xen/arch/arm/traps.c | 57 --------------------------------------------
>  1 file changed, 57 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 7baddfdc57b3..46c9a4031b30 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1686,63 +1686,6 @@ void handle_ro_raz(struct cpu_user_regs *regs,
>      handle_ro_read_val(regs, regidx, read, hsr, min_el, 0);
>  }
> 
> -void dump_guest_s1_walk(struct domain *d, vaddr_t addr)
> -{
> -    register_t ttbcr = READ_SYSREG(TCR_EL1);
> -    uint64_t ttbr0 = READ_SYSREG64(TTBR0_EL1);
> -    uint32_t offset;
> -    uint32_t *first = NULL, *second = NULL;
> -    mfn_t mfn;
> -
> -    mfn = gfn_to_mfn(d, gaddr_to_gfn(ttbr0));
> -
> -    printk("dom%d VA 0x%08"PRIvaddr"\n", d->domain_id, addr);
> -    printk("    TTBCR: 0x%"PRIregister"\n", ttbcr);
> -    printk("    TTBR0: 0x%016"PRIx64" = 0x%"PRIpaddr"\n",
> -           ttbr0, mfn_to_maddr(mfn));
> -
> -    if ( ttbcr & TTBCR_EAE )
> -    {
> -        printk("Cannot handle LPAE guest PT walk\n");
> -        return;
> -    }
> -    if ( (ttbcr & TTBCR_N_MASK) != 0 )
> -    {
> -        printk("Cannot handle TTBR1 guest walks\n");
> -        return;
> -    }
> -
> -    if ( mfn_eq(mfn, INVALID_MFN) )
> -    {
> -        printk("Failed TTBR0 maddr lookup\n");
> -        goto done;
> -    }
> -    first = map_domain_page(mfn);
> -
> -    offset = addr >> (12+8);
> -    printk("1ST[0x%"PRIx32"] (0x%"PRIpaddr") = 0x%08"PRIx32"\n",
> -           offset, mfn_to_maddr(mfn), first[offset]);
> -    if ( !(first[offset] & 0x1) ||
> -          (first[offset] & 0x2) )
> -        goto done;
> -
> -    mfn = gfn_to_mfn(d, gaddr_to_gfn(first[offset]));
> -
> -    if ( mfn_eq(mfn, INVALID_MFN) )
> -    {
> -        printk("Failed L1 entry maddr lookup\n");
> -        goto done;
> -    }
> -    second = map_domain_page(mfn);
> -    offset = (addr >> 12) & 0x3FF;
> -    printk("2ND[0x%"PRIx32"] (0x%"PRIpaddr") = 0x%08"PRIx32"\n",
> -           offset, mfn_to_maddr(mfn), second[offset]);
> -
> -done:
> -    if ( second ) unmap_domain_page(second);
> -    if ( first ) unmap_domain_page(first);
> -}
> -
>  /*
>   * Return the value of the hypervisor fault address register.
>   *
> --
> 2.34.1
> 

