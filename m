Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022656747EA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 01:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481417.746281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIf7w-0001iJ-HO; Fri, 20 Jan 2023 00:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481417.746281; Fri, 20 Jan 2023 00:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIf7w-0001gV-EO; Fri, 20 Jan 2023 00:19:28 +0000
Received: by outflank-mailman (input) for mailman id 481417;
 Fri, 20 Jan 2023 00:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIf7v-0001gP-Fj
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 00:19:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1904926a-9858-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 01:19:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0519EB82624;
 Fri, 20 Jan 2023 00:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B027EC433EF;
 Fri, 20 Jan 2023 00:19:23 +0000 (UTC)
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
X-Inumbo-ID: 1904926a-9858-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674173964;
	bh=yh7TVqTJPJmJ/ye4MlX6W8P1qoVxWP3RAfJ279PctU8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TC1Et5PPjpmJKoHcsnVdlhN1SFI/gdFNBJNqgMyVHCWTsPFn3zAWlXxrGAvMyzmj6
	 PyWzGh6ETB0qeF7dCBsxjhFtERy3iWV5VUawiR1dOSYK7z7jG+5jKSeegtEomUqUQG
	 mDpypcxTBiDEaRVjEPSLNGokBh88U468J2amJxYm9ibaQg69mgck0inVrXcj1qBlPu
	 CqXKLWmDZ+hKOD+QNZYLImLWQwLKU9tkdJPVJnja+vh4rXGIKQspjY3bU7OrbkzjiL
	 wDK4XGL88SGPRDJ+U+QEJ221GzdMoFeS/htlFotRwO5nb549pAHj8yo7LKNVvhI5a0
	 bulvlTpPILg6Q==
Date: Thu, 19 Jan 2023 16:19:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 10/11] xen/arm: Restrict zeroeth_table_offset for
 ARM_64
In-Reply-To: <20230117174358.15344-11-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191553570.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-11-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> zeroeth_table_offset is not accessed by ARM_32.
> Also, when 32 bit physical addresses are used (ie ARM_PA_32=y), this
> causes an overflow.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> 
> v1 - Removed the duplicate declaration for DECLARE_OFFSETS.
> 
>  xen/arch/arm/include/asm/lpae.h | 4 ++++
>  xen/arch/arm/mm.c               | 7 +------
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index 3fdd5d0de2..2744e0eebf 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
>  #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
>  #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
>  #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
> +#ifdef CONFIG_ARM_64

Julien was asking for a selectable Kconfig option that would allow us to
have 32-bit paddr_t even on ARM_64. If we do that, assuming we are on
aarch64, and we set VTCR_T0SZ to 0x20, hence we get 32-bit IPA, are we
going to have a 3-level or a 4-level p2m pagetable?

In any case I think this should be:
#ifndef CONFIG_PADDR_32

And if it doesn't work today on aarch64 due to pagetable levels or other
reasons, than I would make CONFIG_PADDR_32 not (yet) selectable on
ARM_64 (until it is fixed).


>  #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
> +#else
> +#define zeroeth_table_offset(va)  0

Rather than 0 it might be better to have 32, hence zeroing the input
address


> +#endif
>  
>  /*
>   * Macros to define page-tables:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index fab54618ab..95784e0c59 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -207,12 +207,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>  {
>      static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
>      const mfn_t root_mfn = maddr_to_mfn(ttbr);
> -    const unsigned int offsets[4] = {
> -        zeroeth_table_offset(addr),
> -        first_table_offset(addr),
> -        second_table_offset(addr),
> -        third_table_offset(addr)
> -    };
> +    DECLARE_OFFSETS(offsets, addr);
>      lpae_t pte, *mapping;
>      unsigned int level, root_table;
>  
> -- 
> 2.17.1
> 

