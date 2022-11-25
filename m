Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C9638561
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 09:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448102.704948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUI1-0006wx-A6; Fri, 25 Nov 2022 08:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448102.704948; Fri, 25 Nov 2022 08:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUI1-0006u3-6U; Fri, 25 Nov 2022 08:42:29 +0000
Received: by outflank-mailman (input) for mailman id 448102;
 Fri, 25 Nov 2022 08:42:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oyUHz-0006tx-C8
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 08:42:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyUHy-0004wg-Sp; Fri, 25 Nov 2022 08:42:26 +0000
Received: from [54.239.6.184] (helo=[192.168.1.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyUHy-0006bX-JP; Fri, 25 Nov 2022 08:42:26 +0000
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
	bh=3w8RZjfjM7HOri5SFXtIlWFVQRX/ulTsNJ9C8cE5Ozc=; b=TEM4/TJyaJoMXxeCrG5UI+DIzw
	lzRKDC6pf5cm9vuV+iXI+JzWzI6etF6dZp4YSFOHhdyKZ1Sv+TvoSj4ubFyqaOxauZN6NlHl8a6Ar
	XZAgy+Iy7ehnBm/x0kuNS8NwuzaVZaQ++7kfrth5qxXfvftNLqEUoB2clfvQMPMikDtY=;
Message-ID: <c75ad8d8-90db-8fb3-c071-03de2ee2d8a7@xen.org>
Date: Fri, 25 Nov 2022 09:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v3 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-13-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221111141739.2872-13-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> One can now use GICv3 on AArch32 systems. However, ITS is not supported.
> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
> implement LPI support."
> 
> By default GICv3 is disabled on AArch32 and enabled on AArch64.
> 
> Updated SUPPORT.md to state that GICv3 on Arm32 is not security supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changed from :-
> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
> 2. Updated SUPPORT.md.
> 
> v2 - 1. GICv3 is enabled by default only on ARM_64.
> 2. Updated SUPPORT.md.
> 
>   SUPPORT.md                            | 7 +++++++
>   xen/arch/arm/Kconfig                  | 9 +++++----
>   xen/arch/arm/include/asm/cpufeature.h | 1 +
>   3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ab71464cf6..3f16d83191 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -82,6 +82,13 @@ Extension to the GICv3 interrupt controller to support MSI.
>   
>       Status: Experimental
>   
> +### ARM/GICv3
> +
> +GICv3 is an interrupt controller specification designed by Arm.
> +
> +    Status, Arm64: Security supported
> +    Status, Arm32: Supported, not security supported
> +
>   ## Guest Type
>   
>   ### x86/PV
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 1fe5faf847..b90930955b 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -9,6 +9,7 @@ config ARM_64
>   	select 64BIT
>   	select ARM_EFI
>   	select HAS_FAST_MULTIPLY
> +	select GICV3

AFAIU "select" will force the GICV3 to be enabled. IOW, it would not be 
possible to disable it for Arm64 anymore. You want to remove the 
"select" and ...

>   
>   config ARM
>   	def_bool y
> @@ -41,16 +42,16 @@ config ARM_EFI
>   
>   config GICV3
>   	bool "GICv3 driver"
> -	depends on ARM_64 && !NEW_VGIC
> -	default y
> +	depends on !NEW_VGIC
> +	default n

... replace the "default n" with:

         default n if ARM_32
         default y if ARM_64

>   	---help---
>   
>   	  Driver for the ARM Generic Interrupt Controller v3.
> -	  If unsure, say Y
> +	  If unsure, say N

That's technically incorrect. For Arm64, we still want the user to 
select it by default. So I think we need to differentiate 32-bit vs 
64-bit for the "If unsure" part.

Cheers,

-- 
Julien Grall

