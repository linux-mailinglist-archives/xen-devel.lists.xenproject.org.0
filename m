Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2CA692C2B
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 01:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493744.763764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdut-0004Ex-IW; Sat, 11 Feb 2023 00:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493744.763764; Sat, 11 Feb 2023 00:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdut-0004Cc-Fi; Sat, 11 Feb 2023 00:38:59 +0000
Received: by outflank-mailman (input) for mailman id 493744;
 Sat, 11 Feb 2023 00:38:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mMB=6H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pQdus-0004CW-60
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 00:38:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 771d8018-a9a4-11ed-933c-83870f6b2ba8;
 Sat, 11 Feb 2023 01:38:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F278ACE2A08;
 Sat, 11 Feb 2023 00:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29E0C433EF;
 Sat, 11 Feb 2023 00:38:48 +0000 (UTC)
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
X-Inumbo-ID: 771d8018-a9a4-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676075930;
	bh=xK+uegO2hwQc+JAe7itgKZBCr5RFCqTsE4BtQojh/OM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s1d43aqrPWFZLWzTyh2ks3kV0OWRMerJQCG2TJPQC5af79yjfCreN+5Uihm7ABE/O
	 Em/kivdVlFIXwh0TpUbiI3jkIxy9iJ1UZhGbNm7iJk6DkPkIt5bBGnlM/hf5ioOskH
	 6+1EgXpZ3V/lQBFDmnt0GGSiKxzSG/Ug5Yn4fjiCem5eYAlFJ1G7oqsMCwFzWPHNq7
	 ePZZpx0NwUKqjnpCU9wWXf9TYw4NoxqlTtRMQWOR0Tnh2b+8a47DBoy4ru4LGyB+3w
	 a8NFKANgA0vdlB9+G9c92tcrxBFW63L34m2osXJNzNsYmqdXgd2qhBH3Kv8stafznH
	 LeXZWGwKC436Q==
Date: Fri, 10 Feb 2023 16:38:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, 
    rahul.singh@arm.com
Subject: Re: [XEN v3 8/9] xen/arm: Restrict zeroeth_table_offset for ARM_64
In-Reply-To: <20230208120529.22313-9-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302101638310.4661@ubuntu-linux-20-04-desktop>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com> <20230208120529.22313-9-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Feb 2023, Ayan Kumar Halder wrote:
> When 32 bit physical addresses are used (ie ARM_PA_32=y),
> "va >> ZEROETH_SHIFT" causes an overflow.
> Also, there is no zeroeth level page table on Arm 32-bit.
> 
> Also took the opportunity to clean up dump_pt_walk(). One could use
> DECLARE_OFFSETS() macro instead of declaring the declaring an array
> of page table offsets.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from -
> 
> v1 - Removed the duplicate declaration for DECLARE_OFFSETS.
> 
> v2 - 1. Reworded the commit message. 
> 2. Use CONFIG_ARM_PA_32 to restrict zeroeth_table_offset.
> 
>  xen/arch/arm/include/asm/lpae.h | 4 ++++
>  xen/arch/arm/mm.c               | 7 +------
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index 3fdd5d0de2..998edeed6e 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
>  #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
>  #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
>  #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
> +#ifdef CONFIG_ARM_PA_32
> +#define zeroeth_table_offset(va)  0
> +#else
>  #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
> +#endif
>  
>  /*
>   * Macros to define page-tables:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b99806af99..44942c6a4f 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -221,12 +221,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
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
> 

