Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC179DD6D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 03:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600896.936717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgER2-0005rm-6d; Wed, 13 Sep 2023 01:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600896.936717; Wed, 13 Sep 2023 01:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgER2-0005pT-3E; Wed, 13 Sep 2023 01:12:52 +0000
Received: by outflank-mailman (input) for mailman id 600896;
 Wed, 13 Sep 2023 01:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgER1-0005pM-Dl
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 01:12:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a77c24ab-51d2-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 03:12:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83B65B81E16;
 Wed, 13 Sep 2023 01:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE4EC433C7;
 Wed, 13 Sep 2023 01:12:45 +0000 (UTC)
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
X-Inumbo-ID: a77c24ab-51d2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694567566;
	bh=A/ZEJ2+oi9Em6UzniRvc6VqcZ5BW53Kdr/bMi+b9MzU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=joK/TOrsBfIFbNhCsioKtTETJPOMeHD2nmIg8RtsNc12NNr5jxW2Du3W/ZaKjtLsO
	 /HpqXSehbq/a6dQFH3UySzFeQKA14NUQ6BNxnU6Z2UyWP7GlIkLdIyd7AOa8nC5M80
	 HenqTFio87Q4SV6Jkyz9EQ6QRTnnhLkF47+x8Noy6BLtUtCVcyMfRREcyH0GfMdSY1
	 y4208j8VG+bOW6UOOqdmbLWZTVHrsnhWnSJVSV8dOM0tu0IoEOxkCqs1BC8G9fp+Ge
	 nwL70OEXFX1B5QHm7HopcuwOmipOZV+k3vIIhsWe6tgwufPe/eUxbDqheK7Usbxrb+
	 qFRbjG4d5hv7Q==
Date: Tue, 12 Sep 2023 18:12:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 04/10] xen/arm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <e58d82c2a2c77c7451ae9bc70b093f2c5575d83f.1694510856.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309121812320.2295162@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <e58d82c2a2c77c7451ae9bc70b093f2c5575d83f.1694510856.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Simone Ballarin wrote:
> Add inclusion guard to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - drop changes in xen/arch/arm/include/asm/hypercall.h
> - drop changes in xen/arch/arm/include/asm/iocap.h since they are
>   not related with the directive
> ---
>  xen/arch/arm/efi/efi-boot.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 1c3640bb65..aaa468f186 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -3,6 +3,10 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef __ARM_EFI_EFI_BOOT_H__
> +#define __ARM_EFI_EFI_BOOT_H__
> +
>  #include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <asm/setup.h>
> @@ -1003,6 +1007,8 @@ static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
>      __flush_dcache_area(vaddr, size);
>  }
>  
> +#endif /* __ARM_EFI_EFI_BOOT_H__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> -- 
> 2.34.1
> 

