Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88A8C58F0
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 17:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721651.1125235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uFS-00088j-MO; Tue, 14 May 2024 15:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721651.1125235; Tue, 14 May 2024 15:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uFS-00085z-Jl; Tue, 14 May 2024 15:39:26 +0000
Received: by outflank-mailman (input) for mailman id 721651;
 Tue, 14 May 2024 15:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6uFR-00085m-Ce
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 15:39:25 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 227a6774-1208-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 17:39:22 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34e28e32ea4so3605668f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 08:39:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc83sm13958607f8f.16.2024.05.14.08.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 08:39:21 -0700 (PDT)
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
X-Inumbo-ID: 227a6774-1208-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715701161; x=1716305961; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rFS0byviflQCNG2nFalv8QEIIekxcFumIxXCjB1Dx0=;
        b=UCka3p415KK721X0iRsphTLVmRaDRrTc73W54R3+IcXTwCbRuH/wl1RaLURfjog4MI
         2bvjv0iX0CVWSmJ/hiQljb3MSBiGSEpbPg8//aJfggUL7HtXT6nXmli6Na2x2AXSexqU
         0Lf3VROUhqabqopZ3FV7z/F/gujXHClyEa3kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701161; x=1716305961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rFS0byviflQCNG2nFalv8QEIIekxcFumIxXCjB1Dx0=;
        b=rq401qpyIBTKCSNx4AlVV9FQmOUplz6oqEPAKHsNHsIp8sARF7gw1Xi+3TllaJpUQS
         9AjnLyMtu5upEgPi2nn+GmkrBT1IPXWO6NA1zmzxu7zt+k0+EqxQPeaiV/WZgPUbGtco
         5ylFhMNGKjwIvNoF34i8hrEmNGr8pI9Wk40lx7p6XoF2i4sf/n8Agib9t8nlfegoIiOY
         5b5BUaFvrnFLGnbIWLZn3mnrcidotTnqxkneppL6V00G7YieZG3uZT/8+CkycKiPh3NP
         WQeeQB9p4Ae/A2yCrWKW7aPnY/ppygOqHmEv0YRC+0Fu96H9zB0Plw6o+m9v1diahWQP
         99Sw==
X-Gm-Message-State: AOJu0YzawTTFTuqjK/AuFBomz0nQREihWhpdCsPVkRQt7/VATgeV8CGh
	426b+Y3ZcPkTd/7GVVXiLoA3Q5EcQocA74l5Cu9Fjnjwyrysz+Z490VZiB3en2o=
X-Google-Smtp-Source: AGHT+IF2qc8pdS+Vc83sojdXB3vFa5nk+Jxva2fEq/ZkeStufP7ZbhO/GJ9eIR1/vB1qafBM244zqw==
X-Received: by 2002:a5d:53c5:0:b0:34c:e9b5:d746 with SMTP id ffacd0b85a97d-3504a632ff4mr10319302f8f.6.1715701161401;
        Tue, 14 May 2024 08:39:21 -0700 (PDT)
Date: Tue, 14 May 2024 17:39:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 13/19] x86/setup: Do not create valid
 mappings when directmap=no
Message-ID: <ZkOFqFrSs41UtjIU@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-14-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-14-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:40PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Create empty mappings in the second e820 pass. Also, destroy existing
> direct map mappings created in the first pass.
> 
> To make xenheap pages visible in guests, it is necessary to create empty
> L3 tables in the direct map even when directmap=no, since guest cr3s
> copy idle domain's L4 entries, which means they will share mappings in
> the direct map if we pre-populate idle domain's L4 entries and L3
> tables. A helper is introduced for this.
> 
> Also, after the direct map is actually gone, we need to stop updating
> the direct map in update_xen_mappings().
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f26c9799e4..919347d8c2 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -978,6 +978,57 @@ static struct domain *__init create_dom0(const module_t *image,
>  /* How much of the directmap is prebuilt at compile time. */
>  #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>  
> +/*
> + * This either populates a valid direct map, or allocates empty L3 tables and
> + * creates the L4 entries for virtual address between [start, end) in the
> + * direct map depending on has_directmap();
> + *
> + * When directmap=no, we still need to populate empty L3 tables in the
> + * direct map region. The reason is that on-demand xenheap mappings are
> + * created in the idle domain's page table but must be seen by
> + * everyone. Since all domains share the direct map L4 entries, they
> + * will share xenheap mappings if we pre-populate the L4 entries and L3
> + * tables in the direct map region for all RAM. We also rely on the fact
> + * that L3 tables are never freed.
> + */
> +static void __init populate_directmap(uint64_t pstart, uint64_t pend,

paddr_t for both.

> +                                      unsigned int flags)
> +{
> +    unsigned long vstart = (unsigned long)__va(pstart);
> +    unsigned long vend = (unsigned long)__va(pend);
> +
> +    if ( pstart >= pend )
> +        return;
> +
> +    BUG_ON(vstart < DIRECTMAP_VIRT_START);
> +    BUG_ON(vend > DIRECTMAP_VIRT_END);
> +
> +    if ( has_directmap() )
> +        /* Populate valid direct map. */
> +        BUG_ON(map_pages_to_xen(vstart, maddr_to_mfn(pstart),
> +                                PFN_DOWN(pend - pstart), flags));
> +    else
> +    {
> +        /* Create empty L3 tables. */
> +        unsigned long vaddr = vstart & ~((1UL << L4_PAGETABLE_SHIFT) - 1);
> +
> +        for ( ; vaddr < vend; vaddr += (1UL << L4_PAGETABLE_SHIFT) )

It might be clearer (by avoiding some of the bitops and masks to simply
do:

for ( unsigned int idx = l4_table_offset(vstart);
      idx <= l4_table_offset(vend);
      idx++ )
{
...

> +        {
> +            l4_pgentry_t *pl4e = &idle_pg_table[l4_table_offset(vaddr)];
> +
> +            if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
> +            {
> +                mfn_t mfn = alloc_boot_pages(1, 1);

Hm, why not use alloc_xen_pagetable()?

> +                void *v = map_domain_page(mfn);
> +
> +                clear_page(v);
> +                UNMAP_DOMAIN_PAGE(v);

Maybe use clear_domain_page()?

> +                l4e_write(pl4e, l4e_from_mfn(mfn, __PAGE_HYPERVISOR));
> +            }
> +        }
> +    }
> +}
> +
>  void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>  {
>      const char *memmap_type = NULL, *loader, *cmdline = "";
> @@ -1601,8 +1652,17 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          map_e = min_t(uint64_t, e,
>                        ARRAY_SIZE(l2_directmap) << L2_PAGETABLE_SHIFT);
>  
> -        /* Pass mapped memory to allocator /before/ creating new mappings. */
> +        /*
> +         * Pass mapped memory to allocator /before/ creating new mappings.
> +         * The direct map for the bottom 4GiB has been populated in the first
> +         * e820 pass. In the second pass, we make sure those existing mappings
> +         * are destroyed when directmap=no.

Quite likely a stupid question, but why has the directmap been
populated for memory below 4GB?  IOW: why do we need to create those
mappings just to have them destroyed here.

Thanks, Roger.

