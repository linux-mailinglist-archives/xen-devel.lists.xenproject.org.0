Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6495B4DD2C7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291834.495629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV21v-0004dp-P5; Fri, 18 Mar 2022 02:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291834.495629; Fri, 18 Mar 2022 02:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV21v-0004al-L2; Fri, 18 Mar 2022 02:07:51 +0000
Received: by outflank-mailman (input) for mailman id 291834;
 Fri, 18 Mar 2022 02:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nV1vY-0000eL-Fb
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 02:01:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b26918c-a65f-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 03:01:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16A8EB820EE;
 Fri, 18 Mar 2022 02:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679B4C340E9;
 Fri, 18 Mar 2022 02:01:13 +0000 (UTC)
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
X-Inumbo-ID: 4b26918c-a65f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647568873;
	bh=/IS5hnCt0ALq8NOAd68oImHCikXoD85MbDbLsNeotK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PXjHt1m3wANlDQHwvVHPnt7CEzbumna4Cejxb/sVlTmIsDKOEmi1yoCKyom4c/+2B
	 3gXkiXSsSnfCJcsUDRiZhMHvE87LflJoJIoV8rocAVudbt+m6w8JnYBGZ5ovkRqVD2
	 dCiDIOknZbqzNRNSrzn3nDq0gBtT9egxGhF5JuKznN9E/lZXASuBy29uD4tM5+R7TL
	 tCxK3PlTcYxG5GATYUjmwQvZZ306Eq9/0r3gT5u5WzIc6XBgLRzKT/lPtu4pSQdwkp
	 KBco1R28rEhdC2fx5mFcqv3/VZtkYmetwlOF0r7w7TSvl7p59QwIyw3TY0KvkYvR+h
	 yIj3bMyaxBVSQ==
Date: Thu, 17 Mar 2022 19:01:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 11/13] xen/arm: store shm-info for deferred foreign
 memory map
In-Reply-To: <20220311061123.1883189-12-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203171831410.3497@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-12-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Mar 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> In a few scenarios where owner domain, is defined after borrower domain in
> device tree configuration, then statically shared pages haven't been properly
> allocated if borrower domain tries to do foreign memory map during
> domain construction.
> 
> In order to cover such scenario, we defer all borrower domains' foreign
> memory map after all domain construction finished, then only need to store
> shm-info during domain construction.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain.c             |  3 +++
>  xen/arch/arm/domain_build.c       | 34 ++++++++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/domain.h | 25 +++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index f0bfd67fe5..73ffbfb918 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -47,6 +47,9 @@ DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
>  
>  #ifdef CONFIG_STATIC_SHM
>  struct domain *__read_mostly dom_shared;
> +
> +shm_info_t shm_list[NR_MEM_BANKS];

Instead of adding shm_list, maybe we can we re-use mem->bank
(bootinfo.reserved_mem)?

It is already storing the physical address and size (added in patch #1
with process_shm_node). We should be able to find the other info from
the mfn: mfn_to_page, page_get_owner, mfn_to_gfn. At most, we need to
mark the memory bank as shared and we could do that with another field
in struct membank. 


> +DECLARE_BITMAP(shm_list_mask, NR_MEM_BANKS);

This is the third bitmask we introduce :-)

Can we narrow it down to a single bitmask? Maybe we don't need it at all
if we switch to using bootinfo.mem.bank.


>  #endif
>  
>  static void do_idle(void)
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7ee4d33e0b..4b19160674 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -771,7 +771,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>  
>  }
>  
> -static int __init allocate_shared_memory(struct domain *d,
> +static int __init allocate_shared_memory(struct domain *d, u32 shm_id,

No need for it to be u32?


>                                           u32 addr_cells, u32 size_cells,
>                                           paddr_t pbase, paddr_t psize,
>                                           paddr_t gbase)
> @@ -795,6 +795,18 @@ static int __init allocate_shared_memory(struct domain *d,
>          return ret;
>      }
>  
> +    /*
> +     * If owner domain is not default dom_shared, shm-info of owner domain
> +     * shall also be recorded for later deferred foreign memory map.
> +     */
> +    if ( d != dom_shared )
> +    {
> +        shm_list[shm_id].owner_dom = d->domain_id;
> +        shm_list[shm_id].owner_gbase = gbase;
> +        shm_list[shm_id].size = psize;
> +        set_bit(shm_id, shm_list_mask);
> +    }
>      return ret;
>  }
>  
> @@ -962,6 +974,26 @@ static int __init process_shm(struct domain *d,
>              if ( ret )
>                  return ret;
>          }
> +        else
> +        {
> +            if ( strcmp(role_str, "borrower") == 0 )
> +            {
> +                /*
> +                 * In a few scenarios where owner domain, is defined after
> +                 * borrower domain in device tree configuration, statically
> +                 * shared pages haven't been properly allocated if borrower
> +                 * domain here tries to do foreign memory map.
> +                 * In order to cover such scenario, we defer all borrower
> +                 * domains'foreign memory map after all domain construction
> +                 * finished, and only store shm-info here for later use.
> +                 */
> +                shm_list[shm_id].borrower_dom[shm_list[shm_id].nr_borrower] =
> +                                                                d->domain_id;
> +                shm_list[shm_id].borrower_gbase[shm_list[shm_id].nr_borrower] =
> +                                                                gbase;
> +                shm_list[shm_id].nr_borrower++;
> +            }
> +        }

Maybe we don't need to defer this at all. guest_physmap_add_shm does
only two things:

1) get a page ref using the owner domain
2) add page to borrower p2m


We can do 2) straight away even if the owner is not yet allocated.

For 1), we need to get the right amount of references when the owner is
allocated (which could be after the borrowers).

Keeping in mind that we have already parsed all the info in
xen/arch/arm/bootfdt.c:process_shm_node, I wonder if we can add a field
to mem->bank[mem->nr_banks] to keep a count of the number of borrowers.

Then when we allocate the page to the owner here, we just get as many
additional reference as the number of borrowers.

This would:
- add a field to bootinfo.reserved_mem
- remove the need for shm_list
- remove the need for shm_list_mask
- remove the need for the deferral

Just trying to make things simpler :-)


>          /*
>           * Record static shared memory region info for later setting
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 6df37d2c46..1c0f2e22ca 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -10,6 +10,7 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
>  #include <asm/vpl011.h>
> +#include <asm/setup.h>
>  #include <public/hvm/params.h>
>  
>  struct hvm_domain
> @@ -33,6 +34,30 @@ enum domain_type {
>  
>  #ifdef CONFIG_STATIC_SHM
>  extern struct domain *dom_shared;
> +
> +/* Maximum number of borrower domains. */
> +#define NR_SHM_DOMAIN 32
> +/*
> + * shm_list is indexed by unique identifier "xen,shm-id", but it only stores
> + * a subset of static shared memory regions, of which owner domain is not the
> + * default dom_shared.
> + * shm_list_mask bitmask is to record the position of these static shared
> + * memory regions.
> + * Per bit represents a entry in shm_list, and setting it 1 means the
> + * static shared memory region here is owned by a specific domain, then bit 0
> + * means the static shared memory region here is either owned by the default
> + * dom_shared or no static shared memory region here at all.
> + */
> +typedef struct {
> +    domid_t owner_dom;
> +    paddr_t owner_gbase;
> +    paddr_t size;
> +    domid_t borrower_dom[NR_SHM_DOMAIN];
> +    paddr_t borrower_gbase[NR_SHM_DOMAIN];
> +    unsigned long nr_borrower;
> +} shm_info_t;
> +extern shm_info_t shm_list[NR_MEM_BANKS];
> +extern unsigned long shm_list_mask[BITS_TO_LONGS(NR_MEM_BANKS)];
>  #else
>  #define dom_shared NULL
>  #endif
> -- 
> 2.25.1
> 

