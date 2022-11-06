Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469FE61E578
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 20:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438691.692793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orl4H-0001Go-J0; Sun, 06 Nov 2022 19:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438691.692793; Sun, 06 Nov 2022 19:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orl4H-0001EG-GH; Sun, 06 Nov 2022 19:12:29 +0000
Received: by outflank-mailman (input) for mailman id 438691;
 Sun, 06 Nov 2022 19:12:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orl4F-0001Cy-SO
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 19:12:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orl4F-0006cg-Jg; Sun, 06 Nov 2022 19:12:27 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orl4F-0002vc-Dq; Sun, 06 Nov 2022 19:12:27 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=taBjr1yUIz3RVTFY6ODxg4z6regOT8VnBXuEwKOvOfI=; b=sLIfe3ZwrsO8KI7Ft+iUjQLSBz
	/2PZRV5QLhau396xgn6oO06R2FARGRh8YCmfMnPRCEF5SGHO6G/Q/D79OTPp5yb/RMfQrwUSuhCYW
	uSA3ZCXzQhGaGP/pjDEIcdLVXW/FqrKjl5UB7urKjPX8iF1SPh+pN0BSAjKe1rW5P6xI=;
Message-ID: <a85280bd-de4c-a6e5-c0c3-a4272b6f6af7@xen.org>
Date: Sun, 6 Nov 2022 19:12:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-4-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 03/11] xen/arm: disable EFI boot services for MPU
 systems
In-Reply-To: <20221104100741.2176307-4-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 04/11/2022 10:07, Wei Chen wrote:
> Current EFI boot services support of Arm64 could not
> work well for Armv8-R64 system that only has MPU in
> EL2. That is because EFI boot services may need some
> relocation support or partial PIE/PIC support.

I am a bit confused with argument. We have nothing in Xen today to deal 
with relocation/partial PIE/PIC support. So what is the exact problem? 
Is it because UEFI can load Xen anywwhere?

> But these will not be supported in the initial stage of
> porting Xen to MPU systems. So in this patch, we
> disable EFI boot services support for Arm MPU systems.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/Kconfig      | 2 +-
>   xen/arch/arm/arm64/head.S | 8 ++++++--
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 1fe5faf847..ad592367bd 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -7,7 +7,7 @@ config ARM_64
>   	def_bool y
>   	depends on !ARM_32
>   	select 64BIT
> -	select ARM_EFI
> +	select ARM_EFI if !HAS_MPU

I think it would make sense to allow ARM_EFI to be disabled even without 
the MPU support. So this would remove nearly 3K lines (just using wc -l 
*.c in the efi directories) for someone that don't need to boot using EFI.

>   	select HAS_FAST_MULTIPLY
>   
>   config ARM
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index ad014716db..ccedf20dc7 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -172,8 +172,10 @@ efi_head:
>           .byte   0x52
>           .byte   0x4d
>           .byte   0x64
> -        .long   pe_header - efi_head        /* Offset to the PE header. */
> -
> +#ifndef CONFIG_ARM_EFI
> +        .long   0                    /* 0 means no PE header. */
> +#else
> +        .long   pe_header - efi_head /* Offset to the PE header. */
>           /*
>            * Add the PE/COFF header to the file.  The address of this header
>            * is at offset 0x3c in the file, and is part of Linux "Image"
> @@ -279,6 +281,8 @@ section_table:
>           .short  0                /* NumberOfLineNumbers  (0 for executables) */
>           .long   0xe0500020       /* Characteristics (section flags) */
>           .align  5
> +#endif /* CONFIG_ARM_EFI */
> +
>   real_start:
>           /* BSS should be zeroed when booting without EFI */
>           mov   x26, #0                /* x26 := skip_zero_bss */

Shouldn't the function efi_xen_start be stubbed as well?

Cheers,

-- 
Julien Grall

