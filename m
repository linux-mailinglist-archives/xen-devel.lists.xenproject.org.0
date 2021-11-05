Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC734469C7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 21:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222620.384912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj5uX-00045a-Ix; Fri, 05 Nov 2021 20:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222620.384912; Fri, 05 Nov 2021 20:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj5uX-00042j-EG; Fri, 05 Nov 2021 20:34:05 +0000
Received: by outflank-mailman (input) for mailman id 222620;
 Fri, 05 Nov 2021 20:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mj5uV-00042d-Td
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 20:34:04 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4c562c9-3e77-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 21:34:01 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D18F8611C0;
 Fri,  5 Nov 2021 20:33:58 +0000 (UTC)
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
X-Inumbo-ID: b4c562c9-3e77-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636144439;
	bh=Rj60RohdBZKaYozXIpiWS4oKBoiKvp+5KpQeieB1hFQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mfi9GpkvQNpfUO0Ppj1WBGhGrggPl1Mh1+4p0w3nWJ+Fl5ropYimA+mb2qQAcCYuc
	 7300FnfUob6F1uGdMdhBMtYP0hHz69BEz4T2nADaLlqfxXVPYu16XC1qOJgNbnfHjB
	 7CLn5rcuqovrOseMJc48tEmJygjDsK2a/CDWzXneSX02zTfv/p8xljQLMPwTQrRecQ
	 zOhCkN3esRAmfnKsQ4DWD42cJ10pARA4HJL4u/Mr44yWhtMsymjxv5F05er+CZWlPM
	 hT2oxoGq8Gs7vfw0zr6NVFxtR9Ff/PYmrTteGzJn9IciC518Pd725xPY1IBbuCjbst
	 7V/Ehz1YSrTcA==
Date: Fri, 5 Nov 2021 13:33:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <fnu.vikram@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, volodymyr_babchuk@epam.com
Subject: Re: [XEN][PATCH 2/2] xen: libfdt: Changes to make libfdt v1.6.1
 compatible with Xen
In-Reply-To: <1636136354-68413-3-git-send-email-fnu.vikram@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2111051333312.284830@ubuntu-linux-20-04-desktop>
References: <1636136354-68413-1-git-send-email-fnu.vikram@xilinx.com> <1636136354-68413-3-git-send-email-fnu.vikram@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Nov 2021, Vikram Garhwal wrote:
> A few minor changes are done to make it compatible with Xen:
>     fdt_overlay.c: overlay_fixup_phandle()
> 
>         Replace strtoul() with simple_strtoul() as strtoul() is not available in
>         Xen lib and included lib.h.
> 
>         Change char *endptr to const char *endptr.
> 
>     libfdt_env.h:
>         Changed path for config.h and stdbool.h. Remaining Xen changes to
>         libfdt_env.h carried over from existing libfdt (v1.4.0)
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>

Thanks! All makes sense to me.


> ---
>  xen/common/libfdt/fdt_overlay.c     |  6 ++++--
>  xen/include/xen/libfdt/libfdt.h     |  4 ++--
>  xen/include/xen/libfdt/libfdt_env.h | 14 ++++++++------
>  3 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
> index d217e79..7b95e2b 100644
> --- a/xen/common/libfdt/fdt_overlay.c
> +++ b/xen/common/libfdt/fdt_overlay.c
> @@ -8,6 +8,7 @@
>  
>  #include <fdt.h>
>  #include <libfdt.h>
> +#include <xen/lib.h>
>  
>  #include "libfdt_internal.h"
>  
> @@ -446,7 +447,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
>  		const char *fixup_str = value;
>  		uint32_t path_len, name_len;
>  		uint32_t fixup_len;
> -		char *sep, *endptr;
> +		char *sep;
> +		const char *endptr;
>  		int poffset, ret;
>  
>  		fixup_end = memchr(value, '\0', len);
> @@ -476,7 +478,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
>  		if (!name_len)
>  			return -FDT_ERR_BADOVERLAY;
>  
> -		poffset = strtoul(sep + 1, &endptr, 10);
> +		poffset = simple_strtoul(sep + 1, &endptr, 10);
>  		if ((*endptr != '\0') || (endptr <= (sep + 1)))
>  			return -FDT_ERR_BADOVERLAY;
>  
> diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
> index 73467f7..c71689e 100644
> --- a/xen/include/xen/libfdt/libfdt.h
> +++ b/xen/include/xen/libfdt/libfdt.h
> @@ -6,8 +6,8 @@
>   * Copyright (C) 2006 David Gibson, IBM Corporation.
>   */
>  
> -#include <libfdt_env.h>
> -#include <fdt.h>
> +#include <xen/libfdt/libfdt_env.h>
> +#include <xen/libfdt/fdt.h>
>  
>  #ifdef __cplusplus
>  extern "C" {
> diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
> index 73b6d40..03380d5 100644
> --- a/xen/include/xen/libfdt/libfdt_env.h
> +++ b/xen/include/xen/libfdt/libfdt_env.h
> @@ -7,12 +7,11 @@
>   * Copyright 2012 Kim Phillips, Freescale Semiconductor.
>   */
>  
> -#include <stdbool.h>
> -#include <stddef.h>
> -#include <stdint.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <limits.h>
> +#include <xen/config.h>
> +#include <xen/types.h>
> +#include <xen/string.h>
> +#include <asm/byteorder.h>
> +#include <xen/stdbool.h>
>  
>  #ifdef __CHECKER__
>  #define FDT_FORCE __attribute__((force))
> @@ -35,6 +34,9 @@ typedef uint64_t FDT_BITWISE fdt64_t;
>  			 (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
>  			 (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
>  
> +/* Xen-specific libfdt error code. */
> +#define FDT_ERR_XEN(err) (FDT_ERR_MAX + (err))
> +
>  static inline uint16_t fdt16_to_cpu(fdt16_t x)
>  {
>  	return (FDT_FORCE uint16_t)CPU_TO_FDT16(x);
> -- 
> 2.7.4
> 

