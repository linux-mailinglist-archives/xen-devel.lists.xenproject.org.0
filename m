Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F328859873
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 19:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682611.1061681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblkQ-0001qs-KD; Sun, 18 Feb 2024 18:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682611.1061681; Sun, 18 Feb 2024 18:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblkQ-0001pE-HJ; Sun, 18 Feb 2024 18:18:42 +0000
Received: by outflank-mailman (input) for mailman id 682611;
 Sun, 18 Feb 2024 18:18:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rblkP-0001op-FL
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 18:18:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblkO-0007Vh-QT; Sun, 18 Feb 2024 18:18:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblkO-0004iO-IJ; Sun, 18 Feb 2024 18:18:40 +0000
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
	bh=/EYkFiFKn06M8Qpd5VtyZLGtjiI8a1vMbq4daOrfo0U=; b=UMUuITGAn5DiZ2mSQp3ZX5V/gu
	/CgZ1QeYnhkJqwbDOMFgqXPgUchFcTl0cuSwe2xH9Gx8LGW8Az18aSju/SLgw887RDSov6yBDkzxV
	uopIPxHinkTj2ee9QQskHRV5OvAXMDXdARu5IzMOSB2LzZN0lk6CwkN00UaCJrNRfCaI=;
Message-ID: <f4f49147-0e81-4af7-8f26-a47a2c654990@xen.org>
Date: Sun, 18 Feb 2024 18:18:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/30] xen/riscv: introduce p2m.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <c2a2e872f8c32d81c3d3f428f0273819dd7df081.1707146506.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c2a2e872f8c32d81c3d3f428f0273819dd7df081.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 05/02/2024 15:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>   - update the comment above p2m_type_t. RISC-V has only 2 free for use bits in PTE, not 4 as Arm.
>   - update the comment after p2m_ram_rw: s/guest/domain/ as this also applies for dom0.
>   - return INVALID_MFN in gfn_to_mfn() instead of mfn(0).
>   - drop PPC changes.
> ---
> Changes in V3:
>   - add SPDX
>   - drop unneeded for now p2m types.
>   - return false in all functions implemented with BUG() inside.
>   - update the commit message
> ---
> Changes in V2:
>   - Nothing changed. Only rebase.
> ---
>   xen/arch/riscv/include/asm/p2m.h | 102 +++++++++++++++++++++++++++++++
>   1 file changed, 102 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/p2m.h
> 
> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
> new file mode 100644
> index 0000000000..8ad020974f
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_RISCV_P2M_H__
> +#define __ASM_RISCV_P2M_H__
> +
> +#include <asm/page-bits.h>
> +
> +#define paddr_bits PADDR_BITS
> +
> +/*
> + * List of possible type for each page in the p2m entry.
> + * The number of available bit per page in the pte for this purpose is 2 bits.

That's not a lot and I expect you will ran out fairly quickly if you 
decide to store whether...

> + * So it's possible to only have 4 fields. If we run out of value in the
> + * future, it's possible to use higher value for pseudo-type and don't store
> + * them in the p2m entry.
> + */
> +typedef enum {
> +    p2m_invalid = 0,    /* Nothing mapped here */
> +    p2m_ram_rw,         /* Normal read/write domain RAM */

... the RAM is Read-Write. Depend on your P2M implementation, you could 
rely on the HW page-attributes to augment you p2m_type. So effectively, 
your two bits would contain information you can't already store.

Anyway, your approach is ok as your aim is to only build Xen for now. 
BUt this likely want to be re-think once you add the P2M support.

> +} p2m_type_t;
> +
> +#include <xen/p2m-common.h>
> +
> +static inline int get_page_and_type(struct page_info *page,
> +                                    struct domain *domain,
> +                                    unsigned long type)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +/* Look up a GFN and take a reference count on the backing page. */
> +typedef unsigned int p2m_query_t;
> +#define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
> +#define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */

Coding style: I understansd this is what Arm did, but the style is not 
correct. Please add a space before and after <<.

> +
> +static inline struct page_info *get_page_from_gfn(
> +    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +static inline void memory_type_changed(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +
> +static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
> +                                                        unsigned int order)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int guest_physmap_add_entry(struct domain *d,
> +                            gfn_t gfn,
> +                            mfn_t mfn,
> +                            unsigned long page_order,
> +                            p2m_type_t t)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +/* Untyped version for RAM only, for compatibility */
> +static inline int __must_check
> +guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
> +                       unsigned int page_order)
> +{
> +    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
> +}
> +
> +static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
> +{
> +    BUG_ON("unimplemented");
> +    return INVALID_MFN;
> +}
> +
> +static inline bool arch_acquire_resource_check(struct domain *d)
> +{
> +    /*
> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
> +     * is supported on RISCV.
> +     */
> +    return true;

AFAICT, the current implementation of set_foreign_p2m_entry() is a 
BUG_ON(). So I think it would make sense to return 'false' as this 
reflects better the current state.

> +}
> +
> +static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> +{
> +    /* Not supported on RISCV. */
> +}
> +
> +#endif /* __ASM_RISCV_P2M_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall

