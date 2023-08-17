Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74D78017B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 01:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585670.916852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWm3k-0002HV-KT; Thu, 17 Aug 2023 23:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585670.916852; Thu, 17 Aug 2023 23:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWm3k-0002FR-H1; Thu, 17 Aug 2023 23:05:44 +0000
Received: by outflank-mailman (input) for mailman id 585670;
 Thu, 17 Aug 2023 23:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWm3j-0002FL-Ph
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 23:05:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95f0a985-3d52-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 01:05:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 643A061113;
 Thu, 17 Aug 2023 23:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AE9C433C7;
 Thu, 17 Aug 2023 23:05:38 +0000 (UTC)
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
X-Inumbo-ID: 95f0a985-3d52-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692313539;
	bh=K29tYaRkMzXeDEzFigf9E+TdbMBgr0LKDfbYx+XEj/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uKX0fIq6pgk1YBrygQnPQwaDcpZSfQJCylt05yg4PJOa6FQhqSZ9L8wdZtPzliFhb
	 0TWk0OF2O1PRYA00W183Hitrl/03V5Q3gcUYVOT1ox5/eHkGCvUZPCS4dmMJ1qqGsm
	 lQdWRQWnSaxytRcECbdSPsNN0afhAbB2e3LzDmJKIBYQIihfhCA+I6lKXbF5FNG7mi
	 V6NWtPVBBGforAFxtCr1c4hmcMtw/eKMefCkp0lt97zUFi5jpIZcsp4X+OZzO3kyzJ
	 wWP4M8gZ0DN05gJeXMrwzd4YOkgdohS+HmvHZgmiAXjUZBDRTZtf/OHvAwDZyLz6z2
	 OpofM4qFnomnw==
Date: Thu, 17 Aug 2023 16:05:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
In-Reply-To: <20230817214356.47174-4-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308171605300.6458@ubuntu-linux-20-04-desktop>
References: <20230817214356.47174-1-julien@xen.org> <20230817214356.47174-4-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Aug 2023, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The defines PSR_* are field in registers and always unsigned. So
> add 'U' to clarify.
> 
> This should help with MISRA Rule 7.2.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/public/arch-arm.h | 52 +++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index c6449893e493..492819ad22c9 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -339,36 +339,36 @@ typedef uint64_t xen_callback_t;
>  
>  /* PSR bits (CPSR, SPSR) */
>  
> -#define PSR_THUMB       (1<<5)        /* Thumb Mode enable */
> -#define PSR_FIQ_MASK    (1<<6)        /* Fast Interrupt mask */
> -#define PSR_IRQ_MASK    (1<<7)        /* Interrupt mask */
> -#define PSR_ABT_MASK    (1<<8)        /* Asynchronous Abort mask */
> -#define PSR_BIG_ENDIAN  (1<<9)        /* arm32: Big Endian Mode */
> -#define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
> -#define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
> -#define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
> -#define PSR_Z           (1<<30)       /* Zero condition flag */
> +#define PSR_THUMB       (1U <<5)      /* Thumb Mode enable */
> +#define PSR_FIQ_MASK    (1U <<6)      /* Fast Interrupt mask */
> +#define PSR_IRQ_MASK    (1U <<7)      /* Interrupt mask */
> +#define PSR_ABT_MASK    (1U <<8)      /* Asynchronous Abort mask */
> +#define PSR_BIG_ENDIAN  (1U << 9)     /* arm32: Big Endian Mode */
> +#define PSR_DBG_MASK    (1U << 9)     /* arm64: Debug Exception mask */
> +#define PSR_IT_MASK     (0x0600fc00U) /* Thumb If-Then Mask */
> +#define PSR_JAZELLE     (1U << 24)    /* Jazelle Mode */
> +#define PSR_Z           (1U << 30)    /* Zero condition flag */
>  
>  /* 32 bit modes */
> -#define PSR_MODE_USR 0x10
> -#define PSR_MODE_FIQ 0x11
> -#define PSR_MODE_IRQ 0x12
> -#define PSR_MODE_SVC 0x13
> -#define PSR_MODE_MON 0x16
> -#define PSR_MODE_ABT 0x17
> -#define PSR_MODE_HYP 0x1a
> -#define PSR_MODE_UND 0x1b
> -#define PSR_MODE_SYS 0x1f
> +#define PSR_MODE_USR 0x10U
> +#define PSR_MODE_FIQ 0x11U
> +#define PSR_MODE_IRQ 0x12U
> +#define PSR_MODE_SVC 0x13U
> +#define PSR_MODE_MON 0x16U
> +#define PSR_MODE_ABT 0x17U
> +#define PSR_MODE_HYP 0x1aU
> +#define PSR_MODE_UND 0x1bU
> +#define PSR_MODE_SYS 0x1fU
>  
>  /* 64 bit modes */
> -#define PSR_MODE_BIT  0x10 /* Set iff AArch32 */
> -#define PSR_MODE_EL3h 0x0d
> -#define PSR_MODE_EL3t 0x0c
> -#define PSR_MODE_EL2h 0x09
> -#define PSR_MODE_EL2t 0x08
> -#define PSR_MODE_EL1h 0x05
> -#define PSR_MODE_EL1t 0x04
> -#define PSR_MODE_EL0t 0x00
> +#define PSR_MODE_BIT  0x10U /* Set iff AArch32 */
> +#define PSR_MODE_EL3h 0x0dU
> +#define PSR_MODE_EL3t 0x0cU
> +#define PSR_MODE_EL2h 0x09U
> +#define PSR_MODE_EL2t 0x08U
> +#define PSR_MODE_EL1h 0x05U
> +#define PSR_MODE_EL1t 0x04U
> +#define PSR_MODE_EL0t 0x00U
>  
>  /*
>   * We set PSR_Z to be able to boot Linux kernel versions with an invalid
> -- 
> 2.40.1
> 

