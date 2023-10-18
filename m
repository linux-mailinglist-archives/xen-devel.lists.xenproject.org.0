Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAA7CE0A8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 17:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618668.962614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt85B-0006Zc-5G; Wed, 18 Oct 2023 15:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618668.962614; Wed, 18 Oct 2023 15:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt85B-0006X0-2M; Wed, 18 Oct 2023 15:03:37 +0000
Received: by outflank-mailman (input) for mailman id 618668;
 Wed, 18 Oct 2023 15:03:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qt859-0006Wu-Qj
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:03:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qt859-0000fd-2t; Wed, 18 Oct 2023 15:03:35 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qt858-0001oB-RZ; Wed, 18 Oct 2023 15:03:34 +0000
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
	bh=LbAdJf0MMKBtdjmajrqXqd40ALMr8XuEiDLtdaOwfVk=; b=qjWwpx/5Lg2IH+om0sPjlJaDfv
	TXc1HyctEBDPpmqtPukha4GL+sIyAtGTzBjQHCvvsYJWzyiHOSCQbXckg50sLu6O6PxNqLg1mJJfR
	GZAV0GqhC1K2Y1dG4VV1QTPMlxgjGZFfXMJ3Ze9XP4BcYivnpfwqv2PU5XAgaYPabsh0=;
Message-ID: <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
Date: Wed, 18 Oct 2023 16:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule
 13.1
Content-Language: en-GB
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/10/2023 15:18, Simone Ballarin wrote:
> Rule 13.1: Initializer lists shall not contain persistent side effects
> 
> This patch moves expressions with side-effects into new variables before
> the initializer lists.

Looking at the code, I feel the commit message should be a bit more 
verbose because they are no apparent side-effects.

> 
> Function calls do not necessarily have side-effects, in these cases the
> GCC pure or const attributes are added when possible.

You are only adding pure in this patch.

> 
> No functional changes.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Function attributes pure and const do not need to be added as GCC
> attributes, they can be added using ECLAIR configurations.
> ---
>   xen/arch/arm/device.c              |  6 +++---
>   xen/arch/arm/guestcopy.c           | 12 ++++++++----
>   xen/arch/arm/include/asm/current.h |  2 +-
>   3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 1f631d3274..e9be078415 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -319,6 +319,8 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>       int res;
>       paddr_t addr, size;
>       bool own_device = !dt_device_for_passthrough(dev);
> +    bool dev_is_hostbridge = is_pci_passthrough_enabled() &&
> +                             device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE;

The commit message suggests that the code is moved because there are 
side-effects. But none of them should have any side-effects.

In fact, if I am not mistaken, both is_pci_passthrough_enabled() and 
device_get_class() could be marked as pure.

>       /*
>        * We want to avoid mapping the MMIO in dom0 for the following cases:
>        *   - The device is owned by dom0 (i.e. it has been flagged for
> @@ -329,9 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>       struct map_range_data mr_data = {
>           .d = d,
>           .p2mt = p2mt,
> -        .skip_mapping = !own_device ||
> -                        (is_pci_passthrough_enabled() &&
> -                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
> +        .skip_mapping = !own_device || dev_is_hostbridge,
>           .iomem_ranges = iomem_ranges,
>           .irq_ranges = irq_ranges
>       };
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index 6716b03561..3ec6743bf6 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -109,27 +109,31 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>   
>   unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>   {
> +    struct vcpu *current_vcpu = current;

It is not clear to me what is the perceived side effect here and the 
others below. Can you clarify?

>       return copy_guest((void *)from, (vaddr_t)to, len,
> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
> +                      GVA_INFO(current_vcpu), COPY_to_guest | COPY_linear);
>   }
>   
>   unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>                                                unsigned int len)
>   {
> -    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
> +    struct vcpu *current_vcpu = current;
> +    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current_vcpu),
>                         COPY_to_guest | COPY_flush_dcache | COPY_linear);
>   }
>   
>   unsigned long raw_clear_guest(void *to, unsigned int len)
>   {
> -    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
> +    struct vcpu *current_vcpu = current;
> +    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current_vcpu),
>                         COPY_to_guest | COPY_linear);
>   }
>   
>   unsigned long raw_copy_from_guest(void *to, const void __user *from,
>                                     unsigned int len)
>   {
> -    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
> +    struct vcpu *current_vcpu = current;
> +    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current_vcpu),
>                         COPY_from_guest | COPY_linear);
>   }
>   
> diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
> index 6973eeb1d1..a66e28fefb 100644
> --- a/xen/arch/arm/include/asm/current.h
> +++ b/xen/arch/arm/include/asm/current.h
> @@ -28,7 +28,7 @@ struct cpu_info {
>       uint32_t flags;
>   };
>   
> -static inline struct cpu_info *get_cpu_info(void)
> +static inline __attribute_pure__ struct cpu_info *get_cpu_info(void)
>   {
>   #ifdef __clang__
>       unsigned long sp;

Cheers,

-- 
Julien Grall

