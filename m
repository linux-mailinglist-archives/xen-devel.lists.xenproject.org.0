Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3257C8D06
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616868.959180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMnu-0002eJ-NT; Fri, 13 Oct 2023 18:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616868.959180; Fri, 13 Oct 2023 18:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMnu-0002bY-K3; Fri, 13 Oct 2023 18:22:30 +0000
Received: by outflank-mailman (input) for mailman id 616868;
 Fri, 13 Oct 2023 18:22:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrMns-0002bQ-PO
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:22:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMns-0000ps-DL; Fri, 13 Oct 2023 18:22:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMns-0000hy-80; Fri, 13 Oct 2023 18:22:28 +0000
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
	bh=lGI2UamTnNm9RiDcOaFhPJTmjQIxWc3TJQ8Ym2NEcGE=; b=k4VRNQnCY1KITT/YY6Fk7FxijW
	x6+778OhZVcjetWL8gihIrV8cf099fDl7utEXYrpMBFpWQMoR0Dxyxp8dscieLu/2GJcrOYneDQor
	Qzz7O8o0/PUM57RXg6beNjZhfXLi7CRtomoXDM3j5sWfDkz0iNJvoo+ZieCYjLJuJqX4=;
Message-ID: <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
Date: Fri, 13 Oct 2023 19:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-9-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Current P2M implementation is designed for MMU system only.
> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
> Also expose previously static functions p2m_vmid_allocator_init(),
> p2m_alloc_vmid(), and setup_virt_paging_one() for further MPU usage.
> 
> With the code movement, global variable max_vmid is used in multiple
> files instead of a single file (and will be used in MPU P2M
> implementation), declare it in the header and remove the "static" of
> this variable.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Some remarks about some of the code not moved:
  * struct p2m_domain: The bulk of the fields seems to be MMU specific. 
So depending on the number of common fields we either want to split or 
move the structure to p2m_domain. I would be ok to wait until the MPU 
code is present.
  * p2m_type_t: It is not yet clear how this will apply to the MPU. I am 
ok to wait before moving it.
  * p2m_cache_flush_range(): I expect the code will need some change 
because you may get large chunk of memory for the MPU.
  * p2m_set_way_flush()/p2m_toggle_cache(): This was a giant hack to 
support cache flush operations via set/way. To make it efficient, we 
track the pages that have been touched and only flush them. For the MPU, 
this would not work. Can we attempt to not emulate the instructions?

> ---
> v7:
> - No change.
> v6:
> - Also move relinquish_p2m_mapping() to mmu/p2m.c, make
>    __p2m_set_entry() static.
> - Also move p2m_clear_root_pages() and p2m_flush_vm() to mmu/p2m.c.
> - Don't add #ifdef CONFIG_MMU to the p2m_tlb_flush_sync() in
>    p2m_write_unlock(), this need further discussion.
> - Correct typo in commit message.
> v5:
> - No change
> v4:
> - Rework the patch to drop the unnecessary changes.
> - Rework the commit msg a bit.
> v3:
> - remove MPU stubs
> - adapt to the introduction of new directories: mmu/
> v2:
> - new commit
> ---
>   xen/arch/arm/include/asm/mmu/p2m.h |   18 +
>   xen/arch/arm/include/asm/p2m.h     |   26 +-
>   xen/arch/arm/mmu/Makefile          |    1 +
>   xen/arch/arm/mmu/p2m.c             | 1736 ++++++++++++++++++++++++++
>   xen/arch/arm/p2m.c                 | 1837 +---------------------------
>   5 files changed, 1832 insertions(+), 1786 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/mmu/p2m.h
>   create mode 100644 xen/arch/arm/mmu/p2m.c
> 
> diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/asm/mmu/p2m.h
> new file mode 100644
> index 0000000000..f829e325ce
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mmu/p2m.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ARM_MMU_P2M_H__
> +#define __ARM_MMU_P2M_H__
> +
> +struct p2m_domain;
> +void p2m_force_tlb_flush_sync(struct p2m_domain *p2m);
> +void p2m_tlb_flush_sync(struct p2m_domain *p2m);
> +
> +#endif /* __ARM_MMU_P2M_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 940495d42b..a9622dac9a 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -19,6 +19,22 @@ extern unsigned int p2m_root_level;
>   #define P2M_ROOT_ORDER    p2m_root_order

You seem to use P2M_ROOT_ORDER to allocate p2m->root in arm/p2m.c. 
However, as I mentioned before, I don't think the defintion of p2m->root 
is suitable for the MPU. I think the two functions using p2m->root 
should be moved in mmu/p2m.c and P2M_ROOT_ORDER should be moved in 
mmu/p2m.h.

>   #define P2M_ROOT_LEVEL p2m_root_level

P2M_ROOT_LEVEL doesn't seem to make sense for the MPU. The only use in 
arch/arm/p2m.c seems to be in dump_p2m_lookup() which is calling an MMU 
specific function. So I think this wants to be moved in the MMU code.

>   
> +#define MAX_VMID_8_BIT  (1UL << 8)
> +#define MAX_VMID_16_BIT (1UL << 16)
> +
> +#define INVALID_VMID 0 /* VMID 0 is reserved */
> +
> +#ifdef CONFIG_ARM_64
> +extern unsigned int max_vmid;
> +/* VMID is by default 8 bit width on AArch64 */
> +#define MAX_VMID       max_vmid
> +#else
> +/* VMID is always 8 bit width on AArch32 */
> +#define MAX_VMID        MAX_VMID_8_BIT
> +#endif
> +
> +#define P2M_ROOT_PAGES    (1<<P2M_ROOT_ORDER)

See above.

Also NIT, I would suggest to take the opportunity to use 1U and add 
space before/after <<.

> +
>   struct domain;
>   
>   extern void memory_type_changed(struct domain *);
> @@ -156,6 +172,10 @@ typedef enum {
>   #endif
>   #include <xen/p2m-common.h>
>   
> +#ifdef CONFIG_MMU
> +#include <asm/mmu/p2m.h>
> +#endif
> +
>   static inline bool arch_acquire_resource_check(struct domain *d)
>   {
>       /*
> @@ -180,7 +200,11 @@ void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
>    */
>   void p2m_restrict_ipa_bits(unsigned int ipa_bits);
>   
> +void p2m_vmid_allocator_init(void);
> +int p2m_alloc_vmid(struct domain *d);
> +
>   /* Second stage paging setup, to be called on all CPUs */
> +void setup_virt_paging_one(void *data);

I don't much like the idea to export setup_virt_paging_one(). Could we 
instead move cpu_virt_paging_callback() & co to mmu/p2m.c?

Cheers,

-- 
Julien Grall

