Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB6974AD79
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560296.876101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhKh-0002oo-RB; Fri, 07 Jul 2023 09:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560296.876101; Fri, 07 Jul 2023 09:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhKh-0002mM-Nh; Fri, 07 Jul 2023 09:00:55 +0000
Received: by outflank-mailman (input) for mailman id 560296;
 Fri, 07 Jul 2023 09:00:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHhKg-0002m0-AW
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:00:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHhKf-0004pa-OI; Fri, 07 Jul 2023 09:00:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHhKf-0004qo-FI; Fri, 07 Jul 2023 09:00:53 +0000
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
	bh=I+JnvBLIaHDyCFrFRMos4NrcRhxmHidcaEWQHAa28IM=; b=GBmpRZn5Ptwq3BUuTGeH5M7uwI
	WPVL0e7AMWzbSAC84aK4LzwqASRG5XbBru0dFU3LtYbKVZi86RL3sbFZ6YGNlNSsPcUvhlmyuJ3CH
	45VUDwWXGYCDFrzswhqsJEiPf0rm7+P2XW56bcQZnM5WDQtnFWfeDpKzJwKC+WpL+Gio=;
Message-ID: <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
Date: Fri, 7 Jul 2023 10:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230707014754.51333-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/07/2023 02:47, Stewart Hildebrand wrote:
> Remove is_hardware_domain check in has_vpci, and select HAS_VPCI_GUEST_SUPPORT
> in Kconfig.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> As the tag implies, this patch is not intended to be merged (yet).

Can this be included in the vPCI series or resent afterwards?

> 
> Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
> code base. It will be used by the vPCI series [1]. This patch is intended to be
> merged as part of the vPCI series.
> 
> v1->v2:
> * new patch
> ---
>   xen/arch/arm/Kconfig              | 1 +
>   xen/arch/arm/include/asm/domain.h | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 4e0cc421ad48..75dfa2f5a82d 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
>   	depends on ARM_64
>   	select HAS_PCI
>   	select HAS_VPCI
> +	select HAS_VPCI_GUEST_SUPPORT
>   	default n
>   	help
>   	  This option enables PCI device passthrough
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 1a13965a26b8..6e016b00bae1 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>   
>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>   
> -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })

As I mentioned in the previous patch, wouldn't this enable vPCI 
unconditionally for all the domain? Shouldn't this be instead an 
optional feature which would be selected by the toolstack?

Cheers,

-- 
Julien Grall

