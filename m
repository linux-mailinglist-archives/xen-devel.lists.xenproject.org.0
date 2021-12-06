Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F246A213
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239438.415074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHQK-0003yR-O7; Mon, 06 Dec 2021 17:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239438.415074; Mon, 06 Dec 2021 17:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHQK-0003wR-Km; Mon, 06 Dec 2021 17:05:08 +0000
Received: by outflank-mailman (input) for mailman id 239438;
 Mon, 06 Dec 2021 17:05:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muHQJ-0003w9-PI
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:05:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muHQJ-0002MJ-FL; Mon, 06 Dec 2021 17:05:07 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.26.205]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muHQJ-0007Rn-9M; Mon, 06 Dec 2021 17:05:07 +0000
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
	bh=iA9VwzgeLjQmDbv4EP3jDSQdCyXowGa9YKkwLg0zx9A=; b=Vl0GTnROOex8INQUCbOUucg6Hl
	/kB6MJ6vUQV/og2gpMLkhAQd1Rqyi3kS+ZKYIGGPe7TzZm86Fpf7iamTtoIQB5mFqOUUo8OrUA5Ou
	s51AyPvo5uT2bVyePYRDwTnErzdM45eo5DHMVK4XOdFu1saP/LLgPS6X0IRQj9RufkW8=;
Message-ID: <f439d5c4-aa6c-4066-3941-e497b67aeae1@xen.org>
Date: Mon, 6 Dec 2021 17:05:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm: Add Kconfig parameter for memory banks number
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211206153730.49791-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211206153730.49791-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 06/12/2021 15:37, Luca Fancellu wrote:
> Currently the maximum number of memory banks is fixed to
> 128, but on some new platforms that have a large amount
> of memory, this value is not enough 

Can you provide some information on the setup? Is it using UEFI?

> and prevents Xen
> from booting.

AFAIK, the restriction should only prevent Xen to use all the memory. If 
that's not the case, then this should be fixed.

> 
> Create a Kconfig parameter to set the value, by default
> 128.

I think Xen should be able to boot on any platform with the default 
configuration. So the value should at least be bumped.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/Kconfig        | 8 ++++++++
>   xen/include/asm-arm/setup.h | 2 +-
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4d3..805e3c417e89 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -25,6 +25,14 @@ menu "Architecture Features"
>   
>   source "arch/Kconfig"
>   
> +config MEM_BANKS
> +	int "Maximum number of memory banks."
> +	default "128"
> +	help
> +	  Controls the build-time size memory bank array.
> +	  It is the upper bound of the number of logical entities describing
> +	  the memory.

NR_MEM_BANKS is going to be used by multiple internal structure in Xen 
(e.g. static memory, reserved memory, normal memory). So how could an 
admin decide the correct value?

In particular for UEFI, we are at the mercy of the firmware that can 
expose any kind of memory map (that's why we had to increase the 
original number of banks).

So maybe it is time for us to move out from a static array and re-think 
how we discover the memory.

That this is probably going to take some time to get it properly, so
I would be OK with bumping the value + a config gated UNSUPPORTED.

> +
>   config ACPI
>   	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>   	depends on ARM_64
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 95da0b7ab9cd..785a8fe81450 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -6,7 +6,7 @@
>   #define MIN_FDT_ALIGN 8
>   #define MAX_FDT_SIZE SZ_2M
>   
> -#define NR_MEM_BANKS 128
> +#define NR_MEM_BANKS CONFIG_MEM_BANKS
>   
>   #define MAX_MODULES 32 /* Current maximum useful modules */
>   
> 

Cheers,

-- 
Julien Grall

