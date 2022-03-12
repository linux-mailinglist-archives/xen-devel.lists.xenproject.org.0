Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4814D6BAA
	for <lists+xen-devel@lfdr.de>; Sat, 12 Mar 2022 02:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289300.490841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSqbx-00074j-97; Sat, 12 Mar 2022 01:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289300.490841; Sat, 12 Mar 2022 01:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSqbx-00073V-4d; Sat, 12 Mar 2022 01:32:01 +0000
Received: by outflank-mailman (input) for mailman id 289300;
 Sat, 12 Mar 2022 01:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b/J2=TX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSqbv-00073P-6G
 for xen-devel@lists.xenproject.org; Sat, 12 Mar 2022 01:31:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34c0402b-a1a4-11ec-8eba-a37418f5ba1a;
 Sat, 12 Mar 2022 02:31:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9878EB82C0F;
 Sat, 12 Mar 2022 01:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2E6C340E9;
 Sat, 12 Mar 2022 01:31:54 +0000 (UTC)
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
X-Inumbo-ID: 34c0402b-a1a4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647048715;
	bh=CXK5Q7puLgFc5u6bvpSQ6R2EKfCDS2Td2kizgzyjcEY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PS5gfpPmk1iYPt0Lbqyom6thPCShkNODRoz9iC/3p19yYkE2+9rg600YTTGiH3voA
	 wtN6dNxOveBaWMbYr/s3lXlJPGFAFXzVfn56L2XZKtR48N3Qb3DLQNJ2B0gWoWk6X0
	 i7Tce3d1VcRZ6Jznxl/RlRlbf/nRmU6Q2aLWb9Bl7y7nBgPkJAf2orPD9H2EXEoV19
	 1qYStP+xl1YHZaC2ezvV0fVDUpIrFk5+dktWmNQ9Mp5QgROgz82ioKSkRGBmNGPTvA
	 okVTXxYbNbzX6gmHitSPlcvlI+fQiqZVSuo/sdwRlsgEBRR6FVzdRUH2vpvYKFDe3d
	 Ikt+och2/lxlw==
Date: Fri, 11 Mar 2022 17:31:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech, 
    lucmiccio@gmail.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
In-Reply-To: <20220309112048.17377-5-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203111721130.3497@ubuntu-linux-20-04-desktop>
References: <20220309112048.17377-1-julien@xen.org> <20220309112048.17377-5-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Mar 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
> still on.
> 
> Switching TTBR is like replacing existing mappings with new ones. So
> we need to follow the break-before-make sequence.
> 
> In this case, it means the MMU needs to be switched off while the
> TTBR is updated. In order to disable the MMU, we need to first
> jump to an identity mapping.
> 
> Rename switch_ttbr() to switch_ttbr_id() and create an helper on
> top to temporary map the identity mapping and call switch_ttbr()
> via the identity address.
> 
> switch_ttbr_id() is now reworked to temporarily turn off the MMU
> before updating the TTBR.
> 
> We also need to make sure the helper switch_ttbr() is part of the
> identity mapping. So move _end_boot past it.
> 
> Take the opportunity to instruction cache flush as the operation is
> only necessary when the memory is updated.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
>     TODO:
>         * Rename _end_boot to _end_id_mapping or similar
>         * Check the memory barriers
>         * I suspect the instruction cache flush will be necessary
>           for cache coloring.
> ---
>  xen/arch/arm/arm64/head.S | 31 ++++++++++++++++++++-----------
>  xen/arch/arm/mm.c         | 14 +++++++++++++-
>  2 files changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 878649280d73..c5cc72b8fe6f 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -803,36 +803,45 @@ fail:   PRINT("- Boot failed -\r\n")
>          b     1b
>  ENDPROC(fail)
>  
> -GLOBAL(_end_boot)
> -
>  /*
>   * Switch TTBR
>   *
>   * x0    ttbr
>   *
> - * TODO: This code does not comply with break-before-make.
> + * XXX: Check the barriers
>   */
> -ENTRY(switch_ttbr)
> +ENTRY(switch_ttbr_id)
>          dsb   sy                     /* Ensure the flushes happen before
>                                        * continuing */
>          isb                          /* Ensure synchronization with previous
>                                        * changes to text */
> +
> +        /* Turn off MMU */
> +        mrs    x1, SCTLR_EL2
> +        bic    x1, x1, #SCTLR_Axx_ELx_M
> +        msr    SCTLR_EL2, x1
> +        dsb    sy
> +        isb
> +
>          tlbi   alle2                 /* Flush hypervisor TLB */
> -        ic     iallu                 /* Flush I-cache */
>          dsb    sy                    /* Ensure completion of TLB flush */
>          isb
>  
> -        msr    TTBR0_EL2, x0
> +        msr   TTBR0_EL2, x0
> +
> +        mrs   x1, SCTLR_EL2
> +        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
> +        msr   SCTLR_EL2, x1
>  
>          isb                          /* Ensure synchronization with previous
>                                        * changes to text */
> -        tlbi   alle2                 /* Flush hypervisor TLB */
> -        ic     iallu                 /* Flush I-cache */
> -        dsb    sy                    /* Ensure completion of TLB flush */
> -        isb
> +        /* Turn on the MMU */
> +
>  
>          ret
> -ENDPROC(switch_ttbr)
> +ENDPROC(switch_ttbr_id)
> +
> +GLOBAL(_end_boot)
>  
>  #ifdef CONFIG_EARLY_PRINTK
>  /*
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 5c4dece16f7f..a53760af7af0 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -660,7 +660,19 @@ static void xen_pt_enforce_wnx(void)
>      flush_xen_tlb_local();
>  }
>  
> -extern void switch_ttbr(uint64_t ttbr);
> +extern void switch_ttbr_id(uint64_t ttbr);
> +
> +typedef void (switch_ttbr_fn)(uint64_t ttbr);
> +
> +static void switch_ttbr(uint64_t ttbr)
> +{
> +    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
> +    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
> +
> +    update_identity_mapping(true);
> +    fn(ttbr);
> +    update_identity_mapping(false);
> +}

Controversial question: does it really matter that XEN_VIRT_START >
512GB and that _start < 512GB?

I am totally fine with the limit, I am just brainstorming: given that
the mapping is used very temporarely, it wouldn't really be an issue if
it conflicts with something important. Let's say that it conflicts with
the VMAP or the FRAMETABLE. As long as:

- we save the current mapping
- update it with the Xen 1:1
- switch_ttbr
- remove Xen 1:1
- restore mapping

It should work, right? Basically, a mapping conflict shouldn't be an
issue given that the mapping has only to live long enough to call
switch_ttbr_id.

I am less sure about patch #5 but it doesn't seem it would be a problem
there either.

That said, I am totally fine with _start < 512GB.

