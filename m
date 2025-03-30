Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C412A75CA1
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 23:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931770.1333958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyzwa-0007gv-Ka; Sun, 30 Mar 2025 21:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931770.1333958; Sun, 30 Mar 2025 21:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyzwa-0007eB-HV; Sun, 30 Mar 2025 21:11:48 +0000
Received: by outflank-mailman (input) for mailman id 931770;
 Sun, 30 Mar 2025 21:11:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyzwZ-0007e5-Nw
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 21:11:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyzwZ-000VXK-18;
 Sun, 30 Mar 2025 21:11:47 +0000
Received: from [2a02:8012:3a1:0:51d5:4bad:16b9:5cff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyzwZ-00AQEL-0Z;
 Sun, 30 Mar 2025 21:11:47 +0000
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
	bh=bsZOJ0EYeK7OFqcSGsTP22FtU7fVpMXfMkHhjmjMIVw=; b=lR8N2wwBrEwc+t31jMeb62/uEa
	hYLbDtf/Z+S1/sIg5OElgz2WGaWC4OJSJRKvu6vnqWIJ/229rMPoqEI7unMHpbctAD2VbLe6M55mz
	Eezc6z/zLK39LUmYBe0aQsb81nyyQDcxzHfTPju1M0ulKTG9US1P3urliu+sHvcUagcU=;
Message-ID: <6a767fe1-2d77-4cd4-9726-498fbb27ce87@xen.org>
Date: Sun, 30 Mar 2025 22:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] xen/arm32: mpu: Stubs to build MPU for arm32
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
 <20250330180308.2551195-6-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250330180308.2551195-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 30/03/2025 19:03, Ayan Kumar Halder wrote:
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1, v2 -
> 1. New patch introduced in v3.
> 2. Should be applied on top of
> https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/
> 
>   xen/arch/arm/Kconfig             |  2 +-
>   xen/arch/arm/arm32/mpu/Makefile  |  2 ++
>   xen/arch/arm/arm32/mpu/p2m.c     | 18 ++++++++++++++++++
>   xen/arch/arm/arm32/mpu/smpboot.c | 23 +++++++++++++++++++++++
>   xen/arch/arm/include/asm/mm.h    |  5 +++++
>   5 files changed, 49 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
>   create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 565f288331..a1dd942091 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -1,7 +1,7 @@
>   config ARM_32
>   	def_bool y
>   	depends on "$(ARCH)" = "arm32"
> -	select ARCH_MAP_DOMAIN_PAGE
> +	select ARCH_MAP_DOMAIN_PAGE if MMU

If ARCH_MAP_DOMAIN_PAGE is not present, then the assumption is Xen will 
be able to access all the memory. Is this what we want long term?

If not, then I would consider providing stubs rather than disable 
ARCH_MAP_DOMAIN_PAGE.

>   
>   config ARM_64
>   	def_bool y
> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
> index 3340058c08..38797f28af 100644
> --- a/xen/arch/arm/arm32/mpu/Makefile
> +++ b/xen/arch/arm/arm32/mpu/Makefile
> @@ -1 +1,3 @@
>   obj-y += head.o
> +obj-y += smpboot.o
> +obj-y += p2m.o
> diff --git a/xen/arch/arm/arm32/mpu/p2m.c b/xen/arch/arm/arm32/mpu/p2m.c
> new file mode 100644
> index 0000000000..df8de5c7d8
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/p2m.c
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <asm/p2m.h>
> +
> +void __init setup_virt_paging(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm32/mpu/smpboot.c b/xen/arch/arm/arm32/mpu/smpboot.c
> new file mode 100644
> index 0000000000..3f3e54294e
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/smpboot.c
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/mm.h>
> +
> +int prepare_secondary_mm(int cpu)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +void update_boot_mapping(bool enable)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index fbffaccef4..a894e28ac9 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -171,12 +171,17 @@ struct page_info
>   #define PGC_need_scrub    PGC_allocated
>   
>   #ifdef CONFIG_ARM_32
> +#ifdef CONFIG_MPU
> +#define is_xen_heap_page(page) false
> +#define is_xen_heap_mfn(mfn) false

Can you clarify whether this is the intended implementation? If not then 
we can be use BUG_ON("unimplemented")?

Also...

> +#else
>   #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
>   #define is_xen_heap_mfn(mfn) ({                                 \
>       unsigned long mfn_ = mfn_x(mfn);                            \
>       (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
>        mfn_ < mfn_x(directmap_mfn_end));                          \
>   })
> +#endif

... is the implementation will be similar to is_xen_heap_page() for MMU?

>   #else
>   #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>   #define is_xen_heap_mfn(mfn) \

Cheers,

-- 
Julien Grall


