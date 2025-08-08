Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8AB1EDC0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074910.1437383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQmb-0008Ca-75; Fri, 08 Aug 2025 17:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074910.1437383; Fri, 08 Aug 2025 17:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQmb-0008A5-4O; Fri, 08 Aug 2025 17:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1074910;
 Fri, 08 Aug 2025 17:21:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukQmZ-00089z-Mt
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:21:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQmZ-0083Ki-0A;
 Fri, 08 Aug 2025 17:21:31 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQmY-009N2g-2m;
 Fri, 08 Aug 2025 17:21:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=hS/RSivYCtyHijQmtH3hyBlWsLYA+NJJub2+aT6ayy8=; b=wgZ2dABwtvyzz6lByjkwWJn/0a
	ZBUi6j0gnWCBDpMfQgSJ6bsMYSHmc8mX1QPP0yuALCWC5sYpxz8outIRdiYlL7C1B4hUNkbOXc1Sg
	N+hmyrBjcW95BzBMZSf0fS8X8UXfr8wnkaCaLnmjYscSEkd1Ac5fyH0RuDJXSAAxgvio=;
Message-ID: <5b940bdf-9bc0-49b2-af92-7251b2780c71@xen.org>
Date: Fri, 8 Aug 2025 18:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] pdx: provide a unified set of unit functions
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-3-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250805095257.74975-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roger,

On 05/08/2025 10:52, Roger Pau Monne wrote:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index a77b31071ed8..ba35bf1fe3bb 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -256,9 +256,11 @@ void __init init_pdx(void)
>   {
>       const struct membanks *mem = bootinfo_get_mem();
>       paddr_t bank_start, bank_size, bank_end, ram_end = 0;
> -    int bank;
> +    unsigned int bank;
>   
>   #ifndef CONFIG_PDX_NONE
> +    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
>       /*
>        * Arm does not have any restrictions on the bits to compress. Pass 0 to
>        * let the common code further restrict the mask.
> @@ -266,26 +268,24 @@ void __init init_pdx(void)
>        * If the logic changes in pfn_pdx_hole_setup we might have to
>        * update this function too.
>        */
> -    uint64_t mask = pdx_init_mask(0x0);
> -
> -    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> -    {
> -        bank_start = mem->bank[bank].start;
> -        bank_size = mem->bank[bank].size;
> -
> -        mask |= bank_start | pdx_region_mask(bank_start, bank_size);
> -    }
> +    pfn_pdx_compression_setup(0);
>   
>       for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>       {
> -        bank_start = mem->bank[bank].start;
> -        bank_size = mem->bank[bank].size;
> -
> -        if (~mask & pdx_region_mask(bank_start, bank_size))
> -            mask = 0;
> +        if ( !pdx_is_region_compressible(
> +                  mem->bank[bank].start,
> +                  PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
> +                  PFN_DOWN(mem->bank[bank].start)) )

This code is a bit too verbose. Can we at least introduce "bank = 
&mem->bank[bank]" to reduce a bit the verbosity?

The rest of the logic looks fine. So:

Acked-by: Julien Grall <jgrall@amazon.com> # ARM

Cheers,

-- 
Julien Grall


