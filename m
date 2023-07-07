Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C201374AD73
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 10:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560292.876091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhFp-0001LO-8z; Fri, 07 Jul 2023 08:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560292.876091; Fri, 07 Jul 2023 08:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhFp-0001Iq-5x; Fri, 07 Jul 2023 08:55:53 +0000
Received: by outflank-mailman (input) for mailman id 560292;
 Fri, 07 Jul 2023 08:55:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHhFo-0001Ik-F6
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 08:55:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHhFn-0004hg-Pd; Fri, 07 Jul 2023 08:55:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHhFn-0004bK-KX; Fri, 07 Jul 2023 08:55:51 +0000
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
	bh=5ZAAbAQXVlujAsv+zONtr4yalme7diH22JQeb/wvX3U=; b=e70se+6OLsTEE7BFGE5ckNuUfu
	T8XjNGh/U8ubjA9+k0aGgwD2MF65TVpv9VVmeD6uaPcJc6MDd0evzl4ZxBQA9NlWIzzxYkSU2eEqK
	kJT2Yu9PKL8x0Gt4g2hkHbjDRhT2AEv/UhJX7OYhQzJDxvI3SLpUGWJCZUKXkn2aM9wE=;
Message-ID: <d7964e48-4461-2126-5570-3425cbe5ce24@xen.org>
Date: Fri, 7 Jul 2023 09:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] xen/arm: make has_vpci depend on CONFIG_HAS_VPCI
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>, Rahul Singh <rahul.singh@arm.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-3-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230707014754.51333-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/07/2023 02:47, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> VPCI is disabled on ARM. Make it depend on CONFIG_HAS_VPCI to test the PCI
> passthrough support. Also make it depend on is_hardware_domain for now. The
> is_hardware_domain check should be removed when vPCI is upstreamed.
> 
> While here, remove the comment on the preceding line.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> There are two downstreams [1] [2] that have independently made a version this
> change, each with different Signed-off-by's. I simply picked one at random for
> the Author: field, and added both Signed-off-by lines. Please let me know if
> there are any objections.
> 
> v1->v2:
> * add is_hardware_domain check. This will need to be removed after the vPCI
>    series [3] is merged.
> 
> downstream->v1:
> * change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
> * remove the comment on the preceding line
> 
> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
> [2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
> [3] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
> ---
>   xen/arch/arm/include/asm/domain.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 99e798ffff68..1a13965a26b8 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>   
>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>   
> -/* vPCI is not available on Arm */
> -#define has_vpci(d)    ({ (void)(d); false; })
> +#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })

So in v1, I asked whether we should use is_hardware_domain() or 
d->arch.pci. I see you went with the former, but wouldn't this mean that 
the vPCI is always enabled for dom0 when CONFIG_HAS_VPCI=y?

Shouldn't this instead be conditional to pci_passthrough_enabled?

So you could return d->arch.pci in has_vcpi(). The field would be set by 
domain_create() based on the flags passed by the caller. I would 
properly plumb to xen_domctl_createdomain and has a check in 
arch_sanitise_domain_config() to confirm the flag can be set.

Cheers,

-- 
Julien Grall

