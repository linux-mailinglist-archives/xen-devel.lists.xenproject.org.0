Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971A64AD51
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460113.717925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4uLP-0003Um-5s; Tue, 13 Dec 2022 01:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460113.717925; Tue, 13 Dec 2022 01:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4uLP-0003SD-2O; Tue, 13 Dec 2022 01:44:31 +0000
Received: by outflank-mailman (input) for mailman id 460113;
 Tue, 13 Dec 2022 01:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4uLM-0003Ru-QJ
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 01:44:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad5b2733-7a87-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 02:44:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35D6E612E6;
 Tue, 13 Dec 2022 01:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FACAC433D2;
 Tue, 13 Dec 2022 01:44:24 +0000 (UTC)
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
X-Inumbo-ID: ad5b2733-7a87-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670895865;
	bh=yIbg22ZJ/th1Rtmuk7E39ML4JFvAS9/gt7U3VOhL+Pk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ahae6/0EM717nE+Vi8XJEUyIKKVncFsy13yB6w+4x4X44/Dsp6q4wbJ57xHDz18Af
	 /wqOmnExQgjfMiM180M/8pTCTbB4osRWO5QjPPC0QEgGZXA27CBcOGj6ZxJVsJPGgg
	 7EOzLxhhH7+6WQ9oNh2UEAGdsuFpAlUoyfK+5lslym/e6VNiIpPqlUQTtWIyTM6uGS
	 I4c70EYuHBJ88gcCkZ+CmNcDHa2/+yMBp5YPu8HnF+MEpWw/AWoPr4z4gTmlJoY5YL
	 FJq6QlrzVbsdo0cK9E5mzjeNCM9pb3vSIrBJlb6ryokytGgnFmoy5tLUifRHM/mpDE
	 baAC6GRN7BW4w==
Date: Mon, 12 Dec 2022 17:44:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 17/18] xen/arm: linker: The identitymap check should
 cover the whole .text.header
In-Reply-To: <20221212095523.52683-18-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121743540.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-18-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, we are only checking that only some part of .text.header
> is part of the identity mapping. However, this doesn't take into account
> the litteral pool which will be located at the end of the section.
      ^ literal


> While we could try to avoid using a literal pool, in the near future we
> will also want to use an identity mapping for switch_ttbr().
> 
> Not everything in .text.header requires to be part of the identity
> mapping. But it is below a page size (i.e. 4KB) so take a shortcut and
> check that .text.header is smaller than a page size.
> 
> With that _end_boot can be removed as it is now unused. Take the
> pportunity to avoid assuming that a page size is always 4KB in the
  ^ opportunity

> error message and comment.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
>     Changes in v3:
>         - Patch added
> ---
>  xen/arch/arm/arm32/head.S |  2 --
>  xen/arch/arm/arm64/head.S |  2 --
>  xen/arch/arm/xen.lds.S    | 10 +++++++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 2658625bc775..e47f90f15b3d 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -730,8 +730,6 @@ fail:   PRINT("- Boot failed -\r\n")
>          b     1b
>  ENDPROC(fail)
>  
> -GLOBAL(_end_boot)
> -
>  /*
>   * Switch TTBR
>   * r1:r0       ttbr
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 23c2c7491db2..663f5813b12e 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -812,8 +812,6 @@ fail:   PRINT("- Boot failed -\r\n")
>          b     1b
>  ENDPROC(fail)
>  
> -GLOBAL(_end_boot)
> -
>  /*
>   * Switch TTBR
>   *
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index ae8c3b4c6c5f..3f7ebd19f3ed 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -32,7 +32,9 @@ SECTIONS
>    _start = .;
>    .text : {
>         _stext = .;             /* Text section */
> +       _idmap_start = .;
>         *(.text.header)
> +       _idmap_end = .;
>  
>         *(.text.cold)
>         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> @@ -225,10 +227,12 @@ SECTIONS
>  }
>  
>  /*
> - * We require that Xen is loaded at a 4K boundary, so this ensures that any
> - * code running on the boot time identity map cannot cross a section boundary.
> + * We require that Xen is loaded at a page boundary, so this ensures that any
> + * code running on the identity map cannot cross a section boundary.
>   */
> -ASSERT( _end_boot - start <= PAGE_SIZE, "Boot code is larger than 4K")
> +ASSERT(IS_ALIGNED(_idmap_start, PAGE_SIZE), "_idmap_start should be page-aligned")
> +ASSERT(_idmap_end - _idmap_start <= PAGE_SIZE, "Identity mapped code is larger than a page size")
> +
>  /*
>   * __init_[begin|end] MUST be at word size boundary otherwise we cannot
>   * write fault instructions in the space properly.
> -- 
> 2.38.1
> 

