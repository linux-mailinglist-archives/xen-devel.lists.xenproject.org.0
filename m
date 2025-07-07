Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3ECAFBCC9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 22:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035772.1408132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYslN-0007Ha-4k; Mon, 07 Jul 2025 20:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035772.1408132; Mon, 07 Jul 2025 20:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYslN-0007F1-1c; Mon, 07 Jul 2025 20:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1035772;
 Mon, 07 Jul 2025 20:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYslL-0007EX-1p
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 20:48:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc5106e4-5b73-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 22:48:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B2CA5C5707;
 Mon,  7 Jul 2025 20:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E95C4CEE3;
 Mon,  7 Jul 2025 20:48:26 +0000 (UTC)
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
X-Inumbo-ID: bc5106e4-5b73-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751921307;
	bh=+6iqzKgrT/sttRWzZFweIjdUpglt/tuxdO1WcGXFpRA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=agW5WNWTBmpkq5vhgmxcx1jCBaWNtNb2iBy+GnAhDMknNimI+o3i4otmioB6s9l5U
	 Cg1xqkQZcZnSlYDB5mBvdN4BdxUG8/7hcXiLnyuvqE1MMRtJiBSiuVjTY3UzBQCI3G
	 qxGjLvfjUMKCZRzcVClYRMZOHTuq/uMwkkEYHceRzJPkiq0AfuCZOrAJMNmMaY4vL9
	 KCwEa9xtfXf3RsZfa25AIFBOetmTdumKVuYGbmJpCZCXI6Zn9qMEqzzMeVuxbrfhwj
	 7a4bEYKcHnzCaApXUvrpnub+vjqZVoTFTDI8dugAPmeE6Irq3r5U+tCAsyLWFkNmUF
	 qdJnSZCEydHOA==
Date: Mon, 7 Jul 2025 13:48:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
In-Reply-To: <20250704075428.33485-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507071344340.605088@ubuntu-linux-20-04-desktop>
References: <20250704075428.33485-1-michal.orzel@amd.com> <20250704075428.33485-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jul 2025, Michal Orzel wrote:
> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
> sense to keep the two loops iterating over all the memory banks.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/setup.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 93b730ffb5fb..12b76a0a9837 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -255,7 +255,9 @@ void __init init_pdx(void)
>  {
>      const struct membanks *mem = bootinfo_get_mem();
>      paddr_t bank_start, bank_size, bank_end, ram_end = 0;
> +    int bank;
>  
> +#ifdef CONFIG_PDX_COMPRESSION
>      /*
>       * Arm does not have any restrictions on the bits to compress. Pass 0 to
>       * let the common code further restrict the mask.
> @@ -264,7 +266,6 @@ void __init init_pdx(void)
>       * update this function too.
>       */
>      uint64_t mask = pdx_init_mask(0x0);
> -    int bank;
>  
>      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>      {
> @@ -284,6 +285,7 @@ void __init init_pdx(void)
>      }
>  
>      pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
> +#endif
>  
>      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>      {
> -- 
> 2.25.1
> 

