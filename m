Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A878BB01
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591825.924354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakid-0001ss-VS; Mon, 28 Aug 2023 22:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591825.924354; Mon, 28 Aug 2023 22:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakid-0001qV-Ql; Mon, 28 Aug 2023 22:28:23 +0000
Received: by outflank-mailman (input) for mailman id 591825;
 Mon, 28 Aug 2023 22:28:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakic-0001qN-JJ
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:28:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30288a43-45f2-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 00:28:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 621666112C;
 Mon, 28 Aug 2023 22:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC671C433C7;
 Mon, 28 Aug 2023 22:28:16 +0000 (UTC)
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
X-Inumbo-ID: 30288a43-45f2-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693261697;
	bh=kFQXRfTz/KCUo2CyBUmyL/qanaVySu+u2Nqmr4D1M8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mVSbrXsvzZqrcwrGjOhjvG+LKBH/dqUH2Jvav33BMDVV3BtQwZq3VtCPZyCpVtID7
	 cSrS0y9Hzb+qqFwfu4orsOxwOXJUkaYvCwoyz0ciK+3rQ03KbDHuXkyYfx8JljTqKW
	 z0wbVTBA03c6vEuKbUaSPybDfWN0Thjqo/cAjtdCyVJW1J5Ia5RGl9mXVVlJzHWXGD
	 FnwAm4IP5Jg/lc9rEsvgdBPGxZuqUuafJxKBhjURu1yfXyaEy2aLF19QjjrvM9wa1U
	 EpUAJVHJKsgNTtg/vcG0TBXMEl4T+ot0vA7mS9rREfoD/QiyLkvkKuLGuMSuXQSRxh
	 BTsr0S2o2Lshg==
Date: Mon, 28 Aug 2023 15:28:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 06/13] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <e5d9700d6ca237aed64ad11a9025a71a6fd3e792.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281527570.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <e5d9700d6ca237aed64ad11a9025a71a6fd3e792.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/efi/efi-boot.h | 6 ++++++
>  xen/arch/x86/efi/runtime.h  | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 92f4cfe8bd..2c6be062cc 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -3,6 +3,10 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef __X86_EFI_EFI_BOOT_H__
> +#define __X86_EFI_EFI_BOOT_H__
> +
>  #include <xen/vga.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
> @@ -913,6 +917,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>      efi_exit_boot(ImageHandle, SystemTable);
>  }
>  
> +#endif /* __X86_EFI_EFI_BOOT_H__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
> index 77866c5f21..10b36bcb89 100644
> --- a/xen/arch/x86/efi/runtime.h
> +++ b/xen/arch/x86/efi/runtime.h
> @@ -1,3 +1,6 @@
> +#ifndef __X86_EFI_RUNTIME_H__
> +#define __X86_EFI_RUNTIME_H__
> +
>  #include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <asm/atomic.h>
> @@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
>      }
>  }
>  #endif
> +
> +#endif /* __X86_EFI_RUNTIME_H__ */
> -- 
> 2.34.1
> 

