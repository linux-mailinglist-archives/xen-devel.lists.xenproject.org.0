Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266334F3F63
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 22:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299287.509887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqGF-0003JM-4H; Tue, 05 Apr 2022 20:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299287.509887; Tue, 05 Apr 2022 20:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqGF-0003HI-0M; Tue, 05 Apr 2022 20:58:47 +0000
Received: by outflank-mailman (input) for mailman id 299287;
 Tue, 05 Apr 2022 20:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbqGD-0003HC-Uy
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 20:58:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2de7ee99-b523-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 22:58:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9257060AD1;
 Tue,  5 Apr 2022 20:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48DBC385A1;
 Tue,  5 Apr 2022 20:58:42 +0000 (UTC)
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
X-Inumbo-ID: 2de7ee99-b523-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649192323;
	bh=I2zxw/R3wS1Dp+h5spkxYQftOjNOge307lmdkxwI4kw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kjUB4IppbrZYKQTbFga1tr7U6h24JCQFctJ/yG2Djqu8Cd6DyJpQGndezYZU4sGFm
	 maxQbF2RUoGCSHxar2H2/NPAXOz4Ny3uXznvXya4MBSDMU5Rn5i00jYBqh8FyzZ/SN
	 U9dNetyTT3RiZ5AgcFPAbJ5V3IUUZfFamWaOZwrr8An4CzhlUQdHAwLWAJDGVA8Ig/
	 59Pzq8dsNgGgxE8nDYUzEu/qOkXk1EzcR3it0/TsrhmvDckwbypHjMBl/URKd+w4RE
	 b44bwPmeVC27xzJoPuJMlET3YfoVPiUsuGCHBeG0LmyuwUBhONO1PqW775WohXYBtX
	 G1267UQiUBDbQ==
Date: Tue, 5 Apr 2022 13:58:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 12/19] xen/arm: mm: Allow page-table allocation from
 the boot allocator
In-Reply-To: <20220221102218.33785-13-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051354010.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-13-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> At the moment, page-table can only be allocated from domheap. This means
> it is not possible to create mapping in the page-tables via
> map_pages_to_xen() if page-table needs to be allocated.
> 
> In order to avoid open-coding page-tables update in early boot, we need
> to be able to allocate page-tables much earlier. Thankfully, we have the
> boot allocator for those cases.
> 
> create_xen_table() is updated to cater early boot allocation by using
> alloc_boot_pages().
> 
> Note, this is not sufficient to bootstrap the page-tables (i.e mapping
> before any memory is actually mapped). This will be addressed
> separately.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 58364bb6c820..f70b8cc7ce87 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1014,19 +1014,27 @@ static void xen_unmap_table(const lpae_t *table)
>  
>  static int create_xen_table(lpae_t *entry)
>  {
> -    struct page_info *pg;
> +    mfn_t mfn;
>      void *p;
>      lpae_t pte;
>  
> -    pg = alloc_domheap_page(NULL, 0);
> -    if ( pg == NULL )
> -        return -ENOMEM;
> +    if ( system_state != SYS_STATE_early_boot )
> +    {
> +        struct page_info *pg = alloc_domheap_page(NULL, 0);
> +
> +        if ( pg == NULL )
> +            return -ENOMEM;
> +
> +        mfn = page_to_mfn(pg);
> +    }
> +    else
> +        mfn = alloc_boot_pages(1, 1);
>  
> -    p = xen_map_table(page_to_mfn(pg));
> +    p = xen_map_table(mfn);
>      clear_page(p);
>      xen_unmap_table(p);
>  
> -    pte = mfn_to_xen_entry(page_to_mfn(pg), MT_NORMAL);
> +    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
>      pte.pt.table = 1;
>      write_pte(entry, pte);

