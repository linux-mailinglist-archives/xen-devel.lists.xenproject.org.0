Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638FAFB2B5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 13:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035537.1407854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkSE-0001cH-QW; Mon, 07 Jul 2025 11:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035537.1407854; Mon, 07 Jul 2025 11:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkSE-0001Z9-NW; Mon, 07 Jul 2025 11:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1035537;
 Mon, 07 Jul 2025 11:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paoO=ZU=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uYkSD-0001Z3-Iu
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 11:56:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 609447dd-5b29-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 13:56:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 344C41762;
 Mon,  7 Jul 2025 04:55:59 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.86.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C10463F694;
 Mon,  7 Jul 2025 04:56:10 -0700 (PDT)
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
X-Inumbo-ID: 609447dd-5b29-11f0-a316-13f23c93f187
Date: Mon, 7 Jul 2025 12:56:08 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
Message-ID: <ugfgau3ucts3ltdxe5tkxu5lmuqhv5ncyvzqdgogxt7vjoffag@sklw54xnec35>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075428.33485-3-michal.orzel@amd.com>

Hi Michal,

> On Fri, Jul 04, 2025 at 09:54:28AM +0000, Michal Orzel wrote:
> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
> sense to keep the two loops iterating over all the memory banks.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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

Minor/question: Would we potentially prefer to move the declaration of
the loop counter `bank` variables to each for loop? As the variable is
not used outside of the loops and is always initialized to 0, this seems
perhaps better from a variable scope perspective?

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

Otherwise, LGTM! Tested (compilation) via both Arm AArch32 and AArch64 builds.

Many thanks,
Hari

