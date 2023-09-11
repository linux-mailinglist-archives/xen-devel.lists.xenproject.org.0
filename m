Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABC79A97D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599562.935038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfibS-0006ZT-Pm; Mon, 11 Sep 2023 15:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599562.935038; Mon, 11 Sep 2023 15:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfibS-0006WR-MT; Mon, 11 Sep 2023 15:13:30 +0000
Received: by outflank-mailman (input) for mailman id 599562;
 Mon, 11 Sep 2023 15:13:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qfibR-0006WL-SM
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:13:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfibR-0001n0-HU; Mon, 11 Sep 2023 15:13:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfibR-0002Je-Bl; Mon, 11 Sep 2023 15:13:29 +0000
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
	bh=1K4A3mQdOf873QVrb8d4E0WIeE4ATceIZQdq/E4iz/c=; b=oKS9y6wvkEobQm9qYnBFMgm4qQ
	zKLKR9B7hsXDjNPtItudYRSyymo9K7jewTddeXjppRmSQGXxdpsV+GXDW7C7zYAFiQ/xDHQNKMNrl
	o8acLZUCyC+tRUG/SnbBOv5gmlI9XCf/ucHIj6DVQV3KIYPkpw9eIT/ckeMD3TKIcjp4=;
Message-ID: <d526b697-ca64-473d-8a82-72b9052487fa@xen.org>
Date: Mon, 11 Sep 2023 16:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/2] xen/arm: Enlarge identity map space to
 127TiB
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20230909083410.870726-1-leo.yan@linaro.org>
 <20230909083410.870726-3-leo.yan@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230909083410.870726-3-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo,

I know you said you will respin the series. I'd like to leave some 
comments to avoid having another round afterwards.

On 09/09/2023 09:34, Leo Yan wrote:
> On some platforms, the memory regions could be:

Can you add some details in the commit message on which platform you saw 
the issue?

Also, in v1, the problem was also depending on the firmware version. Do 
you know if it fails booting on a new or old firmware?

> 
>    (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>    (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>    (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>    (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> 
> In this case, the Xen binary is loaded above 2TiB.  2TiB is the maximum
> identity map space supported by Xen, thus it fails to boot up due to the
> out of the range.
> 
> This patch introduces several macros to present the zeroth page table's

Typo: s/zeroth/zeroeth/

> slot numbers for easier readable.  Based on the defined macros, it
> enlarges identity map space to 127TiB, which can support the memory
> space [0x0 .. 0x00007eff_ffff_ffff] so has flexibility for various
> platforms.

Reserving 127 TiB for just the identity mapping is quite a lot. How did 
you decide the limit? What limit do you need on your platform?

> 
> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   xen/arch/arm/arm64/mm.c           | 12 ++++++++----
>   xen/arch/arm/include/asm/config.h | 15 ++++++++-------
>   xen/arch/arm/mm.c                 |  2 +-
>   3 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> index 78b7c7eb00..802170cf29 100644
> --- a/xen/arch/arm/arm64/mm.c
> +++ b/xen/arch/arm/arm64/mm.c
> @@ -40,8 +40,10 @@ static void __init prepare_boot_identity_mapping(void)
>       clear_page(boot_second_id);
>       clear_page(boot_third_id);
>   
> -    if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
> -        panic("Cannot handle ID mapping above 2TB\n");
> +    if ( id_offsets[0] >= XEN_IDENTITY_MAP_L0_END )

I don't see the value of renaming IDENTIY_MAPPING_AREA_NR_L0 to 
XEN_IDENTIY_MAP_L0_END. See more below.

> +        /* 1TiB occupies 2 slots in zeroeth table */

I don't understand how this comment is related to the message below.

> +        panic("Cannot handle ID mapping above %dTiB\n",

The value is unsigned, so this you should use "%u". Also we have been 
using "TB" in Xen rather than "TiB". I would rather prefer if we keep 
the same for consistency even if this is not totally accurate.

> +              XEN_IDENTITY_MAP_L0_END>>1);

Coding style: please add a space before and after >>.

>   
>       /* Link first ID table */
>       pte = mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
> @@ -73,8 +75,10 @@ static void __init prepare_runtime_identity_mapping(void)
>       lpae_t pte;
>       DECLARE_OFFSETS(id_offsets, id_addr);
>   
> -    if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
> -        panic("Cannot handle ID mapping above 2TB\n");
> +    if ( id_offsets[0] >= XEN_IDENTITY_MAP_L0_END )
> +        /* 1TiB occupies 2 slots in zeroeth table */
> +        panic("Cannot handle ID mapping above %dTiB\n",
> +              XEN_IDENTITY_MAP_L0_END>>1);

Similar remarks here.

>   
>       /* Link first ID table */
>       pte = pte_of_xenaddr((vaddr_t)xen_first_id);
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 21f4e68a40..b772f1574d 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -87,11 +87,11 @@
>    *   2G -   4G   Domheap: on-demand-mapped
>    *
>    * ARM64 layout:
> - * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> + * 0x0000000000000000 - 0x00007effffffffff (127TB, L0 slots [0..253])
>    *
>    *  Reserved to identity map Xen
>    *
> - * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
> + * 0x000007f000000000 - 0x00007fffffffffff (1TB, L0 slot [254..255])

I don't understand why this is changed.

>    *  (Relative offsets)
>    *   0  -   2M   Unmapped
>    *   2M -  10M   Xen text, data, bss
> @@ -103,9 +103,6 @@
>    *
>    *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>    *
> - * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
> - *  Unused
> - *
>    * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
>    *  1:1 mapping of RAM
>    *
> @@ -117,8 +114,12 @@
>   #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
>   #else
>   
> -#define IDENTITY_MAPPING_AREA_NR_L0	4
> -#define XEN_VM_MAPPING			SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
> +#define XEN_IDENTITY_MAP_L0_START       0

So what's the value of L0_START when you don't use it in the code? 
Overall, I think it will actually mislead the developper because none of 
the code in Xen can cope with the value been non-zero.

And FAOD, I don't think we should handle it in Xen. So I would rather 
prefer if the renaming is avoided.

> +#define XEN_IDENTITY_MAP_L0_NUM         254
> +#define XEN_IDENTITY_MAP_L0_END         (XEN_IDENTITY_MAP_L0_START + \
> +                                         XEN_IDENTITY_MAP_L0_NUM)
> +#define XEN_VM_MAP_L0_START             (XEN_IDENTITY_MAP_L0_END)
> +#define XEN_VM_MAPPING                  SLOT0(XEN_VM_MAP_L0_START)
>   
>   #define SLOT0_ENTRY_BITS  39
>   #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index c34cc94c90..218552783e 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -156,7 +156,7 @@ static void __init __maybe_unused build_assertions(void)
>        * with it.
>        */
>   #define CHECK_OVERLAP_WITH_IDMAP(virt) \
> -    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
> +    BUILD_BUG_ON(zeroeth_table_offset(virt) < XEN_IDENTITY_MAP_L0_END)
>   
>       CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
>       CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);

Cheers,

-- 
Julien Grall

