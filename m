Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE5A58F5B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906305.1313754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZLB-0006aE-FP; Mon, 10 Mar 2025 09:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906305.1313754; Mon, 10 Mar 2025 09:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZLB-0006Y1-CZ; Mon, 10 Mar 2025 09:22:29 +0000
Received: by outflank-mailman (input) for mailman id 906305;
 Mon, 10 Mar 2025 09:22:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKOj=V5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1trZLA-0006Xc-13
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:22:28 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e796db1-fd91-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 10:22:26 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so613371466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:22:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2a385e16dsm125368766b.34.2025.03.10.02.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:22:25 -0700 (PDT)
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
X-Inumbo-ID: 2e796db1-fd91-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741598546; x=1742203346; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayK2D74ea6xS810N4YwCrZqY6fvbNlzkRgOUegdtIkU=;
        b=kHqqg7jP0Jofk2KGF7yqSVhee0zGQWMsdhczAHipSfcM/jOnJQI2O3/uzYbn7E9IGW
         IBSHrL05CAS3rmw1InbJ7GNy3KfCjulF5teYPL4XJBuG6fu84JgMNQv4lVhccGdGMP1J
         SEKKzx9psQfSaqE/ZG5/1d+d3FizPwfM0uSKImH1Ygp5/e+l0uILtBKbIVMYprOJBavB
         AXgl1ld6uBFNGA1hvLYpeOxp2xHYHRixyuQjXFuVsA2EWtU1XAMECaCcTGAfkqivZ0R3
         Xba2zzJG22M/1Ku0hraq7xQYe9esJh2vD7Hq5S6KpuumFyokJKoyqoXZvFRMgmRBehOe
         p7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598546; x=1742203346;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ayK2D74ea6xS810N4YwCrZqY6fvbNlzkRgOUegdtIkU=;
        b=Q4GMnRbBn9BDH2jds4OPFQaIlJShAZPIDAOmlwTVq16hJPShiKftcdmtTevJ1p0w4p
         +VvviWUynOa+wIyCGeknHxh4jfeJYKqfh1ayvihVVdXRxAxACbbBjuQx++pDnNAV/vow
         LFxb2GVPzQEb5I/UwDygKhAqjqIwtewOeM+/6Ay3+Z+e5fDCQaVgKTucd2Chdlv/jO3q
         aHrUwUAqQA0YRd4zms6D4T0tSvL4U6uRF1xx/L8zWNLIDGQSUSBILhSZ9cXT+uv9a9/I
         wqzlRtCi8aLayUMA4ye4hL5TdzdPfPIVtMEokNcQOhro95X6iHTrt7d33GtDPMJkHB19
         wMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ23A1m+f5DNlBIvZhOzSoL1k6Cq0J1ANessW/25Bz+XhlLoAdJ/y7bSQdPLfu9Yec5W0KY4Ts/ro=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yym8ellPeV4rgAH+V3TaH+gMLwRn8H/GZRxbCoryxKdSojiZ7m1
	GR5cfYehT9IH260yYnJ/9SJu2Ag/Gjh2ooPvSIdx/b2FqSjoGfPf
X-Gm-Gg: ASbGncsPgpXFp9n+oIvkMXqqaENCX1Lf+JPhNgv/kOVJ2zD7hZg8LLmssCdnb9m3R4f
	pbFR7hkt0YQXVYZC5ecyY5+apg3dXunCYs/0gU63ZWSPP54YXilrlXY+JD3X9z8JXr0C6lJfREl
	QvpBxykU+624JiQ7Ec9nKO7H+xNLCbt1HR1uErY+47QvKcVwIiOj8FQTtzJKRFY5QxhaLPZLzWQ
	UaTWZfBgDvKF4AmYyY2S9JYZgqbsWjGJNHhrzSDihg/doRR/K4S9t9NXFx6DufuS/i9uRxtByH+
	xUK7B1HXiNXXuolmiYSjry/7GyT9BRCkTuyqt58pJLgfpSxLS8OrD1qSNVGzf+hSIminoiPjzIA
	NbqK5E/1hIBG2R4Yss8VW
X-Google-Smtp-Source: AGHT+IEj78ER55TmiH7GXRwtWvsPXTfmPsCXasFh12qjWcotpX075LB9rm0Xc/5U7lSy+OQO/yhQnQ==
X-Received: by 2002:a17:907:c91f:b0:ac1:e1da:8744 with SMTP id a640c23a62f3a-ac252e9e437mr1119437966b.38.1741598545673;
        Mon, 10 Mar 2025 02:22:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------K5BGzePJBkNe0qR0rXRM17gM"
Message-ID: <803f27c4-c04b-4382-b7b0-e958134e1fd0@gmail.com>
Date: Mon, 10 Mar 2025 10:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/mm: Introduce per-arch pte_attr_t type for PTE
 flags
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <a8417544cc8139ceafc1314acc6f9970358061ee.1741284947.git.sanastasio@raptorengineering.com>
 <818891459587be5e7263fa958701dc34abc4d16d.1741284947.git.sanastasio@raptorengineering.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <818891459587be5e7263fa958701dc34abc4d16d.1741284947.git.sanastasio@raptorengineering.com>

This is a multi-part message in MIME format.
--------------K5BGzePJBkNe0qR0rXRM17gM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/6/25 7:25 PM, Shawn Anastasio wrote:
> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
> represent architecture-dependent page table entry flags. This assumption
> is not well-suited for PPC/radix where some flags go past 32-bits, so
> introduce the pte_attr_t type to allow architectures to opt in to larger
> types to store PTE flags.
>
> Suggested-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Signed-off-by: Shawn Anastasio<sanastasio@raptorengineering.com>
> ---
> Changes in v4:
>    - Change definitions of map_pages_to_xen, modify_xen_mappings in all arches
>    to match new prototype.
>    - Use new flag types in modify_xen_mappings_lite as well (previously missed)
>
> Changes in v3:
>    - Use new asm/mm-types.h to pull in pte_attr_t definition when
>    necessary.
>    - Drop define+ifdef since pte_attr_t is now always defined.
>
> Changes in v2:
>    - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
>    opt-in to defining the type.
>    - Move default pte_attr_definition to xen/types.h
>    - Update commit message to reflect that this change isn't strictly
>    necessary for arches w/ >32bit pte flags
>
>   xen/arch/arm/mmu/pt.c               | 4 ++--
>   xen/arch/ppc/include/asm/Makefile   | 1 -
>   xen/arch/ppc/include/asm/mm-types.h | 7 +++++++
>   xen/arch/ppc/mm-radix.c             | 2 +-
>   xen/arch/riscv/pt.c                 | 2 +-

Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>   xen/arch/x86/mm.c                   | 6 +++---
>   xen/common/efi/boot.c               | 5 +++--
>   xen/common/vmap.c                   | 2 +-
>   xen/include/asm-generic/mm-types.h  | 2 ++
>   xen/include/xen/mm.h                | 7 ++++---
>   xen/include/xen/vmap.h              | 4 +++-
>   11 files changed, 27 insertions(+), 15 deletions(-)
>   create mode 100644 xen/arch/ppc/include/asm/mm-types.h
>
> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index da28d669e7..9dc99db352 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -701,7 +701,7 @@ static int xen_pt_update(unsigned long virt,
>   int map_pages_to_xen(unsigned long virt,
>                        mfn_t mfn,
>                        unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>   {
>       return xen_pt_update(virt, mfn, nr_mfns, flags);
>   }
> @@ -719,7 +719,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>       return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
>   }
>
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
>   {
>       ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index c0dbc68ac6..c989a7f89b 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -5,7 +5,6 @@ generic-y += div64.h
>   generic-y += hardirq.h
>   generic-y += hypercall.h
>   generic-y += iocap.h
> -generic-y += mm-types.h
>   generic-y += paging.h
>   generic-y += percpu.h
>   generic-y += perfc_defn.h
> diff --git a/xen/arch/ppc/include/asm/mm-types.h b/xen/arch/ppc/include/asm/mm-types.h
> new file mode 100644
> index 0000000000..0cb850f4f6
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/mm-types.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_PPC_MM_TYPES_H__
> +#define __ASM_PPC_MM_TYPES_H__
> +
> +typedef unsigned long pte_attr_t;
> +
> +#endif /* __ASM_PPC_MM_TYPES_H__ */
> diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
> index 24232f3907..e02dffa7c5 100644
> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -265,7 +265,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>   int map_pages_to_xen(unsigned long virt,
>                        mfn_t mfn,
>                        unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>   {
>       BUG_ON("unimplemented");
>   }
> diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
> index 857619d48d..918b1b91ab 100644
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -504,7 +504,7 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
>   int map_pages_to_xen(unsigned long virt,
>                        mfn_t mfn,
>                        unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>   {
>       /*
>        * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index bfdc8fb019..53c17c6f88 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5472,7 +5472,7 @@ int map_pages_to_xen(
>       unsigned long virt,
>       mfn_t mfn,
>       unsigned long nr_mfns,
> -    unsigned int flags)
> +    pte_attr_t flags)
>   {
>       bool locking = system_state > SYS_STATE_boot;
>       l3_pgentry_t *pl3e = NULL, ol3e;
> @@ -5890,7 +5890,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>    *
>    * It is an error to call with present flags over an unpopulated range.
>    */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
>   {
>       bool locking = system_state > SYS_STATE_boot;
>       l3_pgentry_t *pl3e = NULL;
> @@ -6186,7 +6186,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>    * the non-inclusive boundary will be updated.
>    */
>   void init_or_livepatch modify_xen_mappings_lite(
> -    unsigned long s, unsigned long e, unsigned int nf)
> +    unsigned long s, unsigned long e, pte_attr_t nf)
>   {
>       unsigned long v = s, fm, flags;
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index efbec00af9..999dbce4dc 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1,4 +1,5 @@
>   #include "efi.h"
> +#include <asm/mm-types.h>
>   #include <efi/efiprot.h>
>   #include <efi/efipciio.h>
>   #include <public/xen.h>
> @@ -1656,7 +1657,7 @@ void __init efi_init_memory(void)
>       struct rt_extra {
>           struct rt_extra *next;
>           unsigned long smfn, emfn;
> -        unsigned int prot;
> +        pte_attr_t prot;
>       } *extra, *extra_head = NULL;
>
>       free_ebmalloc_unused_mem();
> @@ -1671,7 +1672,7 @@ void __init efi_init_memory(void)
>           EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>           u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
>           unsigned long smfn, emfn;
> -        unsigned int prot = PAGE_HYPERVISOR_RWX;
> +        pte_attr_t prot = PAGE_HYPERVISOR_RWX;
>           paddr_t mem_base;
>           unsigned long mem_npages;
>
> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
> index 47225fecc0..d6991421f3 100644
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -222,7 +222,7 @@ static void vm_free(const void *va)
>   }
>
>   void *__vmap(const mfn_t *mfn, unsigned int granularity,
> -             unsigned int nr, unsigned int align, unsigned int flags,
> +             unsigned int nr, unsigned int align, pte_attr_t flags,
>                enum vmap_region type)
>   {
>       void *va = vm_alloc(nr * granularity, align, type);
> diff --git a/xen/include/asm-generic/mm-types.h b/xen/include/asm-generic/mm-types.h
> index 26490e48db..9eb3cba698 100644
> --- a/xen/include/asm-generic/mm-types.h
> +++ b/xen/include/asm-generic/mm-types.h
> @@ -2,4 +2,6 @@
>   #ifndef __ASM_GENERIC_MM_TYPES_H__
>   #define __ASM_GENERIC_MM_TYPES_H__
>
> +typedef unsigned int pte_attr_t;
> +
>   #endif /* __ASM_GENERIC_MM_TYPES_H__ */
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 16f733281a..e79f1728c3 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -69,6 +69,7 @@
>   #include <xen/spinlock.h>
>   #include <xen/perfc.h>
>   #include <public/memory.h>
> +#include <asm/mm-types.h>
>
>   struct page_info;
>
> @@ -113,11 +114,11 @@ int map_pages_to_xen(
>       unsigned long virt,
>       mfn_t mfn,
>       unsigned long nr_mfns,
> -    unsigned int flags);
> +    pte_attr_t flags);
>   /* Alter the permissions of a range of Xen virtual address space. */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf);
>   void modify_xen_mappings_lite(unsigned long s, unsigned long e,
> -                              unsigned int nf);
> +                              pte_attr_t nf);
>   int destroy_xen_mappings(unsigned long s, unsigned long e);
>   /* Retrieve the MFN mapped by VA in Xen virtual address space. */
>   mfn_t xen_map_to_mfn(unsigned long va);
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index 26c831757a..e1155ed14a 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -8,8 +8,10 @@
>   #ifndef __XEN_VMAP_H__
>   #define __XEN_VMAP_H__
>
> +#include <xen/mm.h>
>   #include <xen/mm-frame.h>
>   #include <xen/page-size.h>
> +#include <asm/mm-types.h>
>
>   /* Identifiers for the linear ranges tracked by vmap */
>   enum vmap_region {
> @@ -57,7 +59,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
>    * @return Pointer to the mapped area on success; NULL otherwise.
>    */
>   void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
> -             unsigned int align, unsigned int flags, enum vmap_region type);
> +             unsigned int align, pte_attr_t flags, enum vmap_region type);
>
>   /*
>    * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
> --
> 2.30.2
>
--------------K5BGzePJBkNe0qR0rXRM17gM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/6/25 7:25 PM, Shawn Anastasio
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:818891459587be5e7263fa958701dc34abc4d16d.1741284947.git.sanastasio@raptorengineering.com">
      <pre wrap="" class="moz-quote-pre">Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
represent architecture-dependent page table entry flags. This assumption
is not well-suited for PPC/radix where some flags go past 32-bits, so
introduce the pte_attr_t type to allow architectures to opt in to larger
types to store PTE flags.

Suggested-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
---
Changes in v4:
  - Change definitions of map_pages_to_xen, modify_xen_mappings in all arches
  to match new prototype.
  - Use new flag types in modify_xen_mappings_lite as well (previously missed)

Changes in v3:
  - Use new asm/mm-types.h to pull in pte_attr_t definition when
  necessary.
  - Drop define+ifdef since pte_attr_t is now always defined.

Changes in v2:
  - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
  opt-in to defining the type.
  - Move default pte_attr_definition to xen/types.h
  - Update commit message to reflect that this change isn't strictly
  necessary for arches w/ &gt;32bit pte flags

 xen/arch/arm/mmu/pt.c               | 4 ++--
 xen/arch/ppc/include/asm/Makefile   | 1 -
 xen/arch/ppc/include/asm/mm-types.h | 7 +++++++
 xen/arch/ppc/mm-radix.c             | 2 +-
 xen/arch/riscv/pt.c                 | 2 +-</pre>
    </blockquote>
    <pre>Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:818891459587be5e7263fa958701dc34abc4d16d.1741284947.git.sanastasio@raptorengineering.com">
      <pre wrap="" class="moz-quote-pre">
 xen/arch/x86/mm.c                   | 6 +++---
 xen/common/efi/boot.c               | 5 +++--
 xen/common/vmap.c                   | 2 +-
 xen/include/asm-generic/mm-types.h  | 2 ++
 xen/include/xen/mm.h                | 7 ++++---
 xen/include/xen/vmap.h              | 4 +++-
 11 files changed, 27 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/mm-types.h

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index da28d669e7..9dc99db352 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -701,7 +701,7 @@ static int xen_pt_update(unsigned long virt,
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     pte_attr_t flags)
 {
     return xen_pt_update(virt, mfn, nr_mfns, flags);
 }
@@ -719,7 +719,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return xen_pt_update(s, INVALID_MFN, (e - s) &gt;&gt; PAGE_SHIFT, 0);
 }

-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 {
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index c0dbc68ac6..c989a7f89b 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,7 +5,6 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
-generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
diff --git a/xen/arch/ppc/include/asm/mm-types.h b/xen/arch/ppc/include/asm/mm-types.h
new file mode 100644
index 0000000000..0cb850f4f6
--- /dev/null
+++ b/xen/arch/ppc/include/asm/mm-types.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_PPC_MM_TYPES_H__
+#define __ASM_PPC_MM_TYPES_H__
+
+typedef unsigned long pte_attr_t;
+
+#endif /* __ASM_PPC_MM_TYPES_H__ */
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 24232f3907..e02dffa7c5 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -265,7 +265,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     pte_attr_t flags)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 857619d48d..918b1b91ab 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -504,7 +504,7 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     pte_attr_t flags)
 {
     /*
      * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bfdc8fb019..53c17c6f88 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5472,7 +5472,7 @@ int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags)
+    pte_attr_t flags)
 {
     bool locking = system_state &gt; SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL, ol3e;
@@ -5890,7 +5890,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  *
  * It is an error to call with present flags over an unpopulated range.
  */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 {
     bool locking = system_state &gt; SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
@@ -6186,7 +6186,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
  * the non-inclusive boundary will be updated.
  */
 void init_or_livepatch modify_xen_mappings_lite(
-    unsigned long s, unsigned long e, unsigned int nf)
+    unsigned long s, unsigned long e, pte_attr_t nf)
 {
     unsigned long v = s, fm, flags;

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..999dbce4dc 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1,4 +1,5 @@
 #include "efi.h"
+#include &lt;asm/mm-types.h&gt;
 #include &lt;efi/efiprot.h&gt;
 #include &lt;efi/efipciio.h&gt;
 #include &lt;public/xen.h&gt;
@@ -1656,7 +1657,7 @@ void __init efi_init_memory(void)
     struct rt_extra {
         struct rt_extra *next;
         unsigned long smfn, emfn;
-        unsigned int prot;
+        pte_attr_t prot;
     } *extra, *extra_head = NULL;

     free_ebmalloc_unused_mem();
@@ -1671,7 +1672,7 @@ void __init efi_init_memory(void)
         EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
         u64 len = desc-&gt;NumberOfPages &lt;&lt; EFI_PAGE_SHIFT;
         unsigned long smfn, emfn;
-        unsigned int prot = PAGE_HYPERVISOR_RWX;
+        pte_attr_t prot = PAGE_HYPERVISOR_RWX;
         paddr_t mem_base;
         unsigned long mem_npages;

diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 47225fecc0..d6991421f3 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -222,7 +222,7 @@ static void vm_free(const void *va)
 }

 void *__vmap(const mfn_t *mfn, unsigned int granularity,
-             unsigned int nr, unsigned int align, unsigned int flags,
+             unsigned int nr, unsigned int align, pte_attr_t flags,
              enum vmap_region type)
 {
     void *va = vm_alloc(nr * granularity, align, type);
diff --git a/xen/include/asm-generic/mm-types.h b/xen/include/asm-generic/mm-types.h
index 26490e48db..9eb3cba698 100644
--- a/xen/include/asm-generic/mm-types.h
+++ b/xen/include/asm-generic/mm-types.h
@@ -2,4 +2,6 @@
 #ifndef __ASM_GENERIC_MM_TYPES_H__
 #define __ASM_GENERIC_MM_TYPES_H__

+typedef unsigned int pte_attr_t;
+
 #endif /* __ASM_GENERIC_MM_TYPES_H__ */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 16f733281a..e79f1728c3 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -69,6 +69,7 @@
 #include &lt;xen/spinlock.h&gt;
 #include &lt;xen/perfc.h&gt;
 #include &lt;public/memory.h&gt;
+#include &lt;asm/mm-types.h&gt;

 struct page_info;

@@ -113,11 +114,11 @@ int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags);
+    pte_attr_t flags);
 /* Alter the permissions of a range of Xen virtual address space. */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf);
 void modify_xen_mappings_lite(unsigned long s, unsigned long e,
-                              unsigned int nf);
+                              pte_attr_t nf);
 int destroy_xen_mappings(unsigned long s, unsigned long e);
 /* Retrieve the MFN mapped by VA in Xen virtual address space. */
 mfn_t xen_map_to_mfn(unsigned long va);
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 26c831757a..e1155ed14a 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -8,8 +8,10 @@
 #ifndef __XEN_VMAP_H__
 #define __XEN_VMAP_H__

+#include &lt;xen/mm.h&gt;
 #include &lt;xen/mm-frame.h&gt;
 #include &lt;xen/page-size.h&gt;
+#include &lt;asm/mm-types.h&gt;

 /* Identifiers for the linear ranges tracked by vmap */
 enum vmap_region {
@@ -57,7 +59,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
  * @return Pointer to the mapped area on success; NULL otherwise.
  */
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
-             unsigned int align, unsigned int flags, enum vmap_region type);
+             unsigned int align, pte_attr_t flags, enum vmap_region type);

 /*
  * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
--
2.30.2

</pre>
    </blockquote>
  </body>
</html>

--------------K5BGzePJBkNe0qR0rXRM17gM--

