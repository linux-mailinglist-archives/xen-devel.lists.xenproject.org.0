Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D52E8568D5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681893.1060880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeFM-0002Wv-99; Thu, 15 Feb 2024 16:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681893.1060880; Thu, 15 Feb 2024 16:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeFM-0002UK-5s; Thu, 15 Feb 2024 16:06:00 +0000
Received: by outflank-mailman (input) for mailman id 681893;
 Thu, 15 Feb 2024 16:05:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1raeFK-0002UE-Bz
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:05:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raeFJ-0002ao-M3; Thu, 15 Feb 2024 16:05:57 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raeFJ-00025p-Fz; Thu, 15 Feb 2024 16:05:57 +0000
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
	bh=rzCXWsyN+fWS91dgkWDFhBJoHWMF31PZniuXD9BFIx0=; b=yIeFSCUrF2ZiCKUKrD8eJzOPyd
	L20ULzGzdQkIdmF2bhrXlCS9p32xdHoGLfqpc1iMdq/h0BB8/4NYT/O2vn60Zz09hASfcd4ZW3pFq
	mfRaPpPk1t5W8OUAFo6zrcbNFjRl4EL3IagANnh/+LkR0HuoFnMb7qUwaG4YbnOpQnhY=;
Message-ID: <8ea2f0ef-29ab-4a50-a59f-1f01af2f1b2a@xen.org>
Date: Thu, 15 Feb 2024 16:05:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Make hwdom vUART optional feature
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240215143947.90073-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240215143947.90073-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 15/02/2024 14:39, Michal Orzel wrote:
> At the moment, the hardware domain vUART is always compiled in. In the
> spirit of fine granular configuration, make it optional so that the
> feature can be disabled if not needed. This UART is not exposed (e.g.
> via device tree) to a domain and is mostly used to support special use
> cases like Linux early printk, prints from the decompressor code, etc.
> 
> Introduce Kconfig option CONFIG_HWDOM_VUART, enabled by default (to keep
> the current behavior) and use it to protect the vUART related code.
> Provide stubs for domain_vuart_{init,free}() in case the feature is
> disabled. Take the opportunity to add a struct domain forward declaration
> to vuart.h, so that the header is self contained.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/Kconfig              |  8 ++++++++
>   xen/arch/arm/Makefile             |  2 +-
>   xen/arch/arm/include/asm/domain.h |  2 ++
>   xen/arch/arm/vuart.h              | 15 +++++++++++++++
>   4 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 50e9bfae1ac8..72af329564b7 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -150,6 +150,14 @@ config SBSA_VUART_CONSOLE
>   	  Allows a guest to use SBSA Generic UART as a console. The
>   	  SBSA Generic UART implements a subset of ARM PL011 UART.
>   
> +config HWDOM_VUART
> +	bool "Emulated UART for hardware domain"
> +	default y
> +	help
> +	  Allows a hardware domain to use a minimalistic UART (single transmit
> +	  and status register) which takes information from dtuart. Note that this
> +	  UART is not intended to be exposed (e.g. via device-tree) to a domain.
> +
>   config ARM_SSBD
>   	bool "Speculative Store Bypass Disable" if EXPERT
>   	depends on HAS_ALTERNATIVE
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 33c677672fe6..7b1350e2ef0a 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -71,7 +71,7 @@ obj-y += vtimer.o
>   obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
>   obj-y += vsmc.o
>   obj-y += vpsci.o
> -obj-y += vuart.o
> +obj-$(CONFIG_HWDOM_VUART) += vuart.o
>   
>   extra-y += xen.lds
>   
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 5fb8cd79c01a..8218afb8626a 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -91,6 +91,7 @@ struct arch_domain
>   
>       struct vgic_dist vgic;
>   
> +#ifdef CONFIG_HWDOM_VUART
>       struct vuart {
>   #define VUART_BUF_SIZE 128
>           char                        *buf;
> @@ -98,6 +99,7 @@ struct arch_domain
>           const struct vuart_info     *info;
>           spinlock_t                  lock;
>       } vuart;
> +#endif
>   
>       unsigned int evtchn_irq;
>   #ifdef CONFIG_ACPI
> diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
> index bd23bd92f631..36658b4a8c7f 100644
> --- a/xen/arch/arm/vuart.h
> +++ b/xen/arch/arm/vuart.h
> @@ -20,9 +20,24 @@
>   #ifndef __ARCH_ARM_VUART_H__
>   #define __ARCH_ARM_VUART_H__
>   
> +struct domain;
> +
> +#ifdef CONFIG_HWDOM_VUART
> +
>   int domain_vuart_init(struct domain *d);
>   void domain_vuart_free(struct domain *d);
>   
> +#else
> +
> +static inline int domain_vuart_init(struct domain *d)
> +{
> +    return 0;

NIT: I was going to query why we return 0 rather than -EOPNOSUPP. But it 
looks like this is because domain_vuart_init() is unconditionally called 
for the hardware domain. This is unusual and would be worth adding a 
comment.

In any case,

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

