Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060076E514
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576164.902001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRV65-0007vW-JO; Thu, 03 Aug 2023 09:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576164.902001; Thu, 03 Aug 2023 09:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRV65-0007st-GE; Thu, 03 Aug 2023 09:58:21 +0000
Received: by outflank-mailman (input) for mailman id 576164;
 Thu, 03 Aug 2023 09:58:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRV64-0007sn-AH
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:58:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRV64-0002O8-11; Thu, 03 Aug 2023 09:58:20 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRV63-0005mA-RY; Thu, 03 Aug 2023 09:58:19 +0000
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
	bh=vXXwLeKSesqW6P0my9eiMh/3Mour9Agu9cMHmw+/bag=; b=tDs27RUoq2EUCDFlW61kovnrf4
	SR3j64V3PtXa4DW23CdIIcJNPcdTa8JsaQ7SkWOnvxt4inXOZUrE3n6y+Dn49CwMOTooER5F4W3Wg
	pa6qyaoG4cQnGkSK+egfm9JjLUBehIkrRZxGHs+Y64uMSx294h9msiJ99YzBXIBMyDNk=;
Message-ID: <9320a2b7-18cd-2766-b115-300755d64932@xen.org>
Date: Thu, 3 Aug 2023 10:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230802135350.745251-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/08/2023 14:53, Luca Fancellu wrote:
> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
> when needed, the option is active by default.
> 
> Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
> the GICv2 emulation for guests, it is required only when using GICV2
> driver, otherwise using GICV3 it is optional and can be deselected
> if the user doesn't want to offer the vGICv2 interface to guests or
> maybe its GICv3 hardware can't offer the GICv2 compatible mode.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/Kconfig        | 13 +++++++++++++
>   xen/arch/arm/Makefile       |  4 ++--
>   xen/arch/arm/domain_build.c |  4 ++++
>   xen/arch/arm/gic-v3.c       |  4 ++++
>   xen/arch/arm/vgic.c         |  2 ++
>   5 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index fd57a82dd284..dc702f08ace7 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -78,6 +78,14 @@ config ARM_EFI
>   	  UEFI firmware. A UEFI stub is provided to allow Xen to
>   	  be booted as an EFI application.
>   
> +config GICV2
> +	bool "GICv2 driver"
> +	default y
> +	select VGICV2
> +	help
> +	  Driver for the ARM Generic Interrupt Controller v2.
> +	  If unsure, say Y
> +
>   config GICV3
>   	bool "GICv3 driver"
>   	depends on !NEW_VGIC
> @@ -92,6 +100,11 @@ config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC && !ARM_32
>   
> +config VGICV2
> +	bool "vGICv2 interface for guests"

This description is a bit misleading as the vGICv2 will also be used for 
dom0 in the case of vGICv2.

> +	default y

Please add a longer help.

> +	depends on (GICV2 || GICV3) && !NEW_VGIC

In the near future, I don't expect anyone to introduce a new non-GIC of 
interrupt controller for Arm. But I would expect new version of the GIC. 
So I would drop (GICV2 || GICV3).

Also when !NEW_VGIC is selected, this will make VGICV2 will be 
unselected. I was actually expecting the other way around given that new 
vGIC only offer v2 support.

The rest of the changes LGTM.

Cheers,

-- 
Julien Grall

