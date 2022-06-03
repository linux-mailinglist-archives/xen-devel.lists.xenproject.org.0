Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE053D3A0
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 00:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341689.566923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxFph-0004Xv-CF; Fri, 03 Jun 2022 22:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341689.566923; Fri, 03 Jun 2022 22:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxFph-0004Vb-9G; Fri, 03 Jun 2022 22:31:53 +0000
Received: by outflank-mailman (input) for mailman id 341689;
 Fri, 03 Jun 2022 22:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nxFpf-0004VK-Qu
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 22:31:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5c91fbb-e38c-11ec-bd2c-47488cf2e6aa;
 Sat, 04 Jun 2022 00:31:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEB0661B04;
 Fri,  3 Jun 2022 22:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE42BC385A9;
 Fri,  3 Jun 2022 22:31:48 +0000 (UTC)
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
X-Inumbo-ID: f5c91fbb-e38c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654295509;
	bh=4YRymr/7MusvD0AOvlJ/NnAqXxFe39jTCG5ekZbC/ZQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HJY+B3ZahBAJsBPMB/o5atjBGKKDkYlbeWKiDzGaWCjrh+Lk75EY+xSuPHLEWoeUi
	 7+byfHdn1EjOKdG9ppHGUHTH7bRbfkYzhDgoPhivZhasLjXE2KdWaa+3G7MbCBo95x
	 OJBwz4SHaZ320z9+VwLXt7ylo+0Z99j1mp3tY9cQ6gRkKKBp9+2IugDKAo6jRJUg/h
	 CPUNBzcIwd3P+puteU890Dzfb2tvR8lJ6ah1Q3wPgf0WH3zVEoBNgj+YqjPkqRM7Ax
	 9boRtZXWD9YzxNhTPAQtAiiBaSWRnFU2YPYie8169hhmMbCaagfJ50FcSPs8Se5JqH
	 jRBsRR/N3wpcg==
Date: Fri, 3 Jun 2022 15:31:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>, Hongda Deng <Hongda.Heng@arm.com>
Subject: Re: [PATCH 04/16] xen/arm: mm: Don't open-code Xen PT update in
 remove_early_mappings()
In-Reply-To: <20220520120937.28925-5-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206031531410.2783803@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-5-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that xen_pt_update_entry() is able to deal with different mapping
> size, we can replace the open-coding of the page-tables update by a call
> to modify_xen_mappings().
> 
> As the function is not meant to fail, a BUG_ON() is added to check the
> return.
> 
> Note that we don't use destroy_xen_mappings() because the helper doesn't
> allow us to pass a flags. In theory we could add an extra parameter to
> the function, however there are no other expected users. Hence why
> modify_xen_mappings() is used.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Hongda Deng <Hongda.Heng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v4:
>         - Add Hongda's reviewed-by
>         - Add a comment to explain what modify_xen_mappings() does.
>         - Clarify in the commit message hwy modify_xen_mappings() is
>           used rather than destroy_xen_mappings().
> 
>     Changes in v2:
>         - Stay consistent with how function name are used in the commit
>         message
>         - Add my AWS signed-off-by
> ---
>  xen/arch/arm/mm.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 747083d820dd..64a79d45b38c 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -614,11 +614,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>  void __init remove_early_mappings(void)
>  {
> -    lpae_t pte = {0};
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
> -              pte);
> -    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
> +    int rc;
> +
> +    /* destroy the _PAGE_BLOCK mapping */
> +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
> +                             _PAGE_BLOCK);
> +    BUG_ON(rc);
>  }
>  
>  /*
> -- 
> 2.32.0
> 

