Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4898745EA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 03:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689619.1074790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri3CL-0007xi-N1; Thu, 07 Mar 2024 02:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689619.1074790; Thu, 07 Mar 2024 02:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri3CL-0007wA-KO; Thu, 07 Mar 2024 02:09:29 +0000
Received: by outflank-mailman (input) for mailman id 689619;
 Thu, 07 Mar 2024 02:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ri3CK-0007vh-KQ
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 02:09:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b89fa051-dc27-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 03:09:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEA4661A39;
 Thu,  7 Mar 2024 02:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78D4C433F1;
 Thu,  7 Mar 2024 02:09:23 +0000 (UTC)
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
X-Inumbo-ID: b89fa051-dc27-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709777364;
	bh=GuemIr9Le5eQPaPn8YSEdkoZcPoNvZsUehMUKA4mBYI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=at4ifUkLepJ3CMRiF0GS6kK2MH8ZcXWfibwX/CHle2wPA3nTyKdMtpxTctFMVTq8b
	 4lm3VQuZeXTOx4L+rXn+iipT7AMUIBniluz7VXjK/ZMM7NgOvnoxJxAgAjBFzOJTXX
	 ITrXsQsWA2tCwayBZ9u2JL+Xi5jJzCeJ1D8gdpwJKIdrh6fET/KgxAu4oDpzUL3LLu
	 nCtQcgor/+javtz4Cz3bUWJgb4XopPKiQHOtcuJnUGPKq8PBuj3XNt7ugfiGUWEFi0
	 ax7Wef77uC63EJBjV3ozsUnG86gDeur3Ypi8QijkTTtCGS3rwVeqSLNSzzzAmkz3Iw
	 4jAV5W7sqpsVw==
Date: Wed, 6 Mar 2024 18:09:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] xen/x86: bzImage parse kernel_alignment
In-Reply-To: <20240306185032.103216-3-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2403061809170.853156@ubuntu-linux-20-04-desktop>
References: <20240306185032.103216-1-jason.andryuk@amd.com> <20240306185032.103216-3-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Mar 2024, Jason Andryuk wrote:
> Expand bzimage_parse() to return kernel_alignment from the setup_header.
> This will be needed if loading a PVH kernel at a physical offset to
> compensate for a reserved E820 region.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/bzimage.c             | 4 +++-
>  xen/arch/x86/hvm/dom0_build.c      | 4 +++-
>  xen/arch/x86/include/asm/bzimage.h | 3 +--
>  xen/arch/x86/pv/dom0_build.c       | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
> index ac4fd428be..0f4cfc49f7 100644
> --- a/xen/arch/x86/bzimage.c
> +++ b/xen/arch/x86/bzimage.c
> @@ -105,7 +105,7 @@ unsigned long __init bzimage_headroom(void *image_start,
>  }
>  
>  int __init bzimage_parse(void *image_base, void **image_start,
> -                         unsigned long *image_len)
> +                         unsigned long *image_len, unsigned int *align)
>  {
>      struct setup_header *hdr = (struct setup_header *)(*image_start);
>      int err = bzimage_check(hdr, *image_len);
> @@ -118,6 +118,8 @@ int __init bzimage_parse(void *image_base, void **image_start,
>      {
>          *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
>          *image_len = hdr->payload_length;
> +        if ( align )
> +            *align = hdr->kernel_alignment;
>      }
>  
>      if ( elf_is_elfbinary(*image_start, *image_len) )
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 0ceda4140b..bbae8a5645 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -548,12 +548,14 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
>      paddr_t last_addr;
> +    unsigned int align = 0;
>      struct hvm_start_info start_info = { 0 };
>      struct hvm_modlist_entry mod = { 0 };
>      struct vcpu *v = d->vcpu[0];
>      int rc;
>  
> -    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
> +    rc = bzimage_parse(image_base, &image_start, &image_len, &align);
> +    if ( rc != 0 )
>      {
>          printk("Error trying to detect bz compressed kernel\n");
>          return rc;
> diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
> index 7ed69d3910..de4e9a446f 100644
> --- a/xen/arch/x86/include/asm/bzimage.h
> +++ b/xen/arch/x86/include/asm/bzimage.h
> @@ -4,8 +4,7 @@
>  #include <xen/init.h>
>  
>  unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
> -
>  int bzimage_parse(void *image_base, void **image_start,
> -                  unsigned long *image_len);
> +                  unsigned long *image_len, unsigned int *align);
>  
>  #endif /* __X86_BZIMAGE_H__ */
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index d8043fa58a..e9fa8a9a82 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -416,7 +416,7 @@ int __init dom0_construct_pv(struct domain *d,
>  
>      d->max_pages = ~0U;
>  
> -    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
> +    if ( (rc = bzimage_parse(image_base, &image_start, &image_len, NULL)) != 0 )
>          return rc;
>  
>      if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
> -- 
> 2.44.0
> 
> 

