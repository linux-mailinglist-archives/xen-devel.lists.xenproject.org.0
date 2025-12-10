Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA5CB3EB6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 21:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183257.1506010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQVR-0002UE-1t; Wed, 10 Dec 2025 20:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183257.1506010; Wed, 10 Dec 2025 20:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQVQ-0002Rx-V9; Wed, 10 Dec 2025 20:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1183257;
 Wed, 10 Dec 2025 20:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TEw+=6Q=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTQVP-0002Rr-NY
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 20:09:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4b14f5-d604-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 21:09:46 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 0D2574EEBC5F;
 Wed, 10 Dec 2025 21:09:45 +0100 (CET)
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
X-Inumbo-ID: 2c4b14f5-d604-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765397385;
	b=tCiti8y/KjmTrqcS5bNjlMWxTwiI+GWILojn5dDiP+46TKgicABwXybsJofzP5dCf5zd
	 O3GGdtgEDhS/47vt/TB15oWwb+kja+poSEEqHLsHAvwNleMrTAesGEHV/2xj/T+415P1k
	 D0vrZkDWnry4Tg5n62cMt7BB5GDDVwQxnGXbYzizW7zNncjRFP8EpHxY7SEw4tio383V6
	 Kr3qOYc+m3eujjU30TrGAsxDs65MtQqhDKxlTozygAx7Yi83kFjMUjW6/FaLzkL/x/Myn
	 1sY2pLpYG9mRpV2vckWb5vyewD4LCQVyu2hpv0/4ZEbgCwqvuZ/r+pzw0cOPhD7XjEneY
	 Cx+XeofEmGjg4FrGIpMsfctyM2M/FsVY+3iwDOnN9kRg0vxBBaAw3B6u1Y1ftBLkgMujm
	 xE8YUV0C757NyyhfYHJPIhAYS0DiLcFxD/wq4SlLniqUE67sYEOFM36BXVc88DCr6BVHo
	 Kkm6bJWMd8Bltx9jsv05gFiU5QDFSg1RWSnK4936qzqbObCnM2cBomlT7rtAJXATc+TrT
	 wJecFCvnCULtoZxWw6qaC4F8qejQRPw2PfdRvYF09W3tQDKqRKsPLuzoD9AGtbQo+1njl
	 8rh741nrxLbsxTc5Lsuvj/8JJzKBK3s0gVPKtTmgjUurNFXvl2HZoHXN+1TVqy0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765397385;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=TQZSv/ZAfzAbTr1Jb7h5R+TM/7j4xM7ok+ujWemEz2w=;
	b=RdrVhgk1NGkFuZ3ID0ek4KN8N+VOs0fF1tZrg3Utprqg3qBv4F0LMhLlo0RndBDfaGBe
	 bpJxYphFVMh8DWg2QuXvpdiNL8UMq034NdstvSmIp/mpdWr/Dx3taXil8UqkVohAIONmv
	 4nUu89sci699kDi2JkJTCAYfk7vMdwIKqscZgwsbw71IkVnL61GwgAt7dqZ35gkBfkalj
	 Oxgsc+kXrYVXSXcN4HDRbB0ZtuGE4EU2Bs/wDmqw526s9UM7xWQWosmr2XcKsyPpwbSd1
	 62pyIGnggGUCYBg9rq97exy1rJCFUHeOtGWxpM5XqSrny5VPK0K6I7wOSM8K9dQQMKPf6
	 pR4nrQVyp0BpibOEHDLIRU0rhs8ayFZqP0d/LXu73VXGSsuRMvLycot53yzByHs+J3HU7
	 XEK/zbsCNh+9114c+MdWF+NtB3EFN91m2iWfu7xZqMHGXv58+UNizDnbiHG6xX2d7GduG
	 3JK+hSF81RsS5HXcisSGO2inTj2mFavolX7neqgMI8arPGlIJ6Evxov0XBDghooyrFoOl
	 kXCKKhBXHFJ/wA/tCNHslPFpZD1bubGixX1ByZXFlKZQLMwq04fwHaQptCB11x4K2uUW9
	 wpnAO7W0mGeh7eJNoMMRRMWRop8x+/JcJe0gYkGQ5E1KWjkMu9WBDfhQX32h/HU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765397385; bh=pbRcp0ci817zxENpMK0OeYIwB1KIJsa+w5IfexFOb40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HZa3oyk8DxikE/NTFUerXLu9E8kM6NSQFC06tQ2diR/EyocnHK8mDGr1XCMlDW+Rs
	 D3cNnX8Kg+ItXW+SxzNweyd8cUhbNgn1rQ8MEuVP8YQf0ZcFvjmQ+/8L/g+6kBKBUC
	 CxuNFbxwc/qTx+XaGIErR8USMb95f1yQ/fup5olpV4cDKz5knQx9IayhdykBHlKSbT
	 QRWor9ZXzeZFqPCe41frZx7aTAn9gscnXK7CEQd9UQmSF87xOCIB2leOEVh9sFSB5g
	 9M8UEWFRV1JB7ccBhxuMMnoQLidPZNGjSpa0+Cic+VQhl1I6jtzDZOvZmoscl5iIYU
	 wMwO/3grlT8LQ==
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 21:09:45 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 1/5] x86: Misra fixes for U/L suffixes
In-Reply-To: <20251210183019.2241560-2-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-2-andrew.cooper3@citrix.com>
Message-ID: <c9c7deeecc839295d04c5374691f848d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-10 19:30, Andrew Cooper wrote:
> With the wider testing, some more violations have been spotted.  This
> addresses violations of Rule 7.2 (suffixes required) and Rule 7.3 (L 
> must be
> uppercase).
> 
> For ELF64_R_TYPE(), cast to uint32_t matching the surrounding examples.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/mm/shadow/common.c     | 4 ++--
>  xen/arch/x86/pv/descriptor-tables.c | 2 +-
>  xen/drivers/passthrough/vtd/iommu.h | 2 +-
>  xen/include/xen/elfstructs.h        | 2 +-
>  xen/include/xen/sizes.h             | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/shadow/common.c 
> b/xen/arch/x86/mm/shadow/common.c
> index 0176e33bc9c7..423764a32653 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1961,7 +1961,7 @@ int sh_remove_write_access(struct domain *d, 
> mfn_t gmfn,
>               /* FreeBSD 64bit: linear map 0xffff800000000000 */
>               switch ( level )
>               {
> -             case 1: GUESS(0xffff800000000000
> +             case 1: GUESS(0xffff800000000000UL
>                             + ((fault_addr & VADDR_MASK) >> 9), 6); 
> break;
>               case 2: GUESS(0xffff804000000000UL
>                             + ((fault_addr & VADDR_MASK) >> 18), 6); 
> break;
> @@ -1969,7 +1969,7 @@ int sh_remove_write_access(struct domain *d, 
> mfn_t gmfn,
>                             + ((fault_addr & VADDR_MASK) >> 27), 6); 
> break;
>               }
>               /* FreeBSD 64bit: direct map at 0xffffff0000000000 */
> -             GUESS(0xffffff0000000000 + gfn_to_gaddr(gfn), 6);
> +             GUESS(0xffffff0000000000UL + gfn_to_gaddr(gfn), 6);
>          }
> 
>  #undef GUESS
> diff --git a/xen/arch/x86/pv/descriptor-tables.c 
> b/xen/arch/x86/pv/descriptor-tables.c
> index 02647a2c5047..26f7d18b11b5 100644
> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -216,7 +216,7 @@ static bool check_descriptor(const struct domain 
> *dom, seg_desc_t *d)
>               * 0xf6800000. Extend these to allow access to the larger 
> read-only
>               * M2P table available in 32on64 mode.
>               */
> -            base = (b & 0xff000000) | ((b & 0xff) << 16) | (a >> 16);
> +            base = (b & 0xff000000U) | ((b & 0xff) << 16) | (a >> 16);
> 
>              limit = (b & 0xf0000) | (a & 0xffff);
>              limit++; /* We add one because limit is inclusive. */
> diff --git a/xen/drivers/passthrough/vtd/iommu.h 
> b/xen/drivers/passthrough/vtd/iommu.h
> index 29d350b23db6..4f41360c53c0 100644
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -266,7 +266,7 @@ struct dma_pte {
>  #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
>  #define DMA_PTE_SP   (1 << 7)
>  #define DMA_PTE_SNP  (1 << 11)
> -#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
> +#define DMA_PTE_CONTIG_MASK  (0xfULL << PADDR_BITS)
>  #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
>  #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
>  #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} 
> while(0)
> diff --git a/xen/include/xen/elfstructs.h 
> b/xen/include/xen/elfstructs.h
> index eb6b87a823a8..8770e7454672 100644
> --- a/xen/include/xen/elfstructs.h
> +++ b/xen/include/xen/elfstructs.h
> @@ -360,7 +360,7 @@ typedef struct {
>  } Elf64_Rela;
> 
>  #define	ELF64_R_SYM(info)	((info) >> 32)
> -#define	ELF64_R_TYPE(info)	((info) & 0xFFFFFFFF)
> +#define	ELF64_R_TYPE(info)	((uint32_t)(info))
>  #define ELF64_R_INFO(s,t) 	(((s) << 32) + (uint32_t)(t))
> 
>  /*
> diff --git a/xen/include/xen/sizes.h b/xen/include/xen/sizes.h
> index f7b728ddab06..d309ebf04406 100644
> --- a/xen/include/xen/sizes.h
> +++ b/xen/include/xen/sizes.h
> @@ -43,6 +43,6 @@
>  #define SZ_512M                         0x20000000
> 
>  #define SZ_1G                           0x40000000
> -#define SZ_2G                           0x80000000
> +#define SZ_2G                           0x80000000U
> 
>  #endif /* __XEN_SIZES_H__ */

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

