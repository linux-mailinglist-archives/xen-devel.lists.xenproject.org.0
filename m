Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF278BB18
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591857.924404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakwT-0006wJ-2O; Mon, 28 Aug 2023 22:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591857.924404; Mon, 28 Aug 2023 22:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakwS-0006ud-UG; Mon, 28 Aug 2023 22:42:40 +0000
Received: by outflank-mailman (input) for mailman id 591857;
 Mon, 28 Aug 2023 22:42:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakwS-0006uX-46
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:42:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fb74dbc-45f4-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 00:42:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B323661454;
 Mon, 28 Aug 2023 22:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63218C433C8;
 Mon, 28 Aug 2023 22:42:35 +0000 (UTC)
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
X-Inumbo-ID: 2fb74dbc-45f4-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693262556;
	bh=anFHAMAYLwqizNV1F3xoLLBU8uPb7jhSW3D4tJ5Ar2E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Da7iEqj56ntwu9wDTyfMsycd1UZsI0s2mvbKs2FAep+rHMNGNwHPvc9gxnYauwNlv
	 PK3I47buPx1/p5OZ9H8x3shaGyG7Owx/vxnP+z4a1qZHXz7TvYe0lL8Bm75wVMnefs
	 AZOIdwwMPPlrDA+s9H2tEXrDePmfXF0cQRbeNfNp0obAP7ryU0mWRmRzxSGQX+TILW
	 FQbCVbO3P2fqY15i4WYSkyns2qZqxnGc0rOp90s84XhqpfXzm5GWYE6AP0gX0KCNiV
	 er44S9GCfPbRoNQilWibtVx5Qy67RKCsVQ9+SMq+nDJYvtreZRAi1cOi6W/6F//B3j
	 W0MNbvh/nGfIw==
Date: Mon, 28 Aug 2023 15:42:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 10/13] xen/efi: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <7726a38c4bf15a94b9bbcbc465bd499f94067ddc.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281542080.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <7726a38c4bf15a94b9bbcbc465bd499f94067ddc.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Also C files, if included somewhere, need to comply with the guideline.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/common/efi/efi.h     | 5 +++++
>  xen/common/efi/runtime.c | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
> index c02fbb7b69..cef9381d30 100644
> --- a/xen/common/efi/efi.h
> +++ b/xen/common/efi/efi.h
> @@ -1,3 +1,6 @@
> +#ifndef __COMMON_EFI_EFI_H__
> +#define __COMMON_EFI_EFI_H__
> +
>  #include <asm/efibind.h>
>  #include <efi/efidef.h>
>  #include <efi/efierr.h>
> @@ -51,3 +54,5 @@ void free_ebmalloc_unused_mem(void);
>  
>  const void *pe_find_section(const void *image, const UINTN image_size,
>                              const CHAR16 *section_name, UINTN *size_out);
> +
> +#endif /* __COMMON_EFI_EFI_H__ */
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 5cb7504c96..fb6fd17ba3 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -6,6 +6,10 @@
>  #include <xen/irq.h>
>  #include <xen/time.h>
>  
> +#ifndef __COMMON_EFI_RUNTIME_C__
> +#define __COMMON_EFI_RUNTIME_C__

Shouldn't this be at the top of the file?


>  DEFINE_XEN_GUEST_HANDLE(CHAR16);
>  
>  struct efi_rs_state {
> @@ -704,3 +708,5 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>      return rc;
>  }
>  #endif
> +
> +#endif /* __COMMON_EFI_RUNTIME_C__ */
> -- 
> 2.34.1
> 

