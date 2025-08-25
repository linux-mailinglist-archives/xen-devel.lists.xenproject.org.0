Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC4B33B23
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092819.1448450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTX0-0004aY-Bi; Mon, 25 Aug 2025 09:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092819.1448450; Mon, 25 Aug 2025 09:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTX0-0004Y4-7y; Mon, 25 Aug 2025 09:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1092819;
 Mon, 25 Aug 2025 09:30:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uqTWy-0004Xs-Lx
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:30:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqTWx-005npM-0b;
 Mon, 25 Aug 2025 09:30:23 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqTWx-000A12-0L;
 Mon, 25 Aug 2025 09:30:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=gD3fsG1WGg7SbvOvckqc+yuNA1IsvTlrAmKBEvQfQvE=; b=X5XZv2Xrvk7bkhtDgR5NWseWfF
	FocFqNoA4tS1p+iFeGl9zzZ6xFEvvzVLAYKdFOgOGwQw7lrgRum7y9/EXTBNE/L1EFx1pAC79qSB8
	HCERPEQMnYKwZAydVhmjUQF4k0aUo/IgENG+eaAOzHBgwan7TZfJCa6Ceeqzigk10BJg=;
Date: Mon, 25 Aug 2025 11:30:20 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v16 2/4] tools/include: move xc_bitops.h to
 xen-tools/bitops.h
Message-ID: <aKwtLMAslH6v5L82@l14>
References: <20250812223024.2364749-1-dmukhin@ford.com>
 <20250812223024.2364749-3-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812223024.2364749-3-dmukhin@ford.com>

On Tue, Aug 12, 2025 at 10:30:45PM +0000, dmkhn@proton.me wrote:
> diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
> index f17930d98bf7..8531e90f8e21 100644
> --- a/tools/libs/guest/xg_dom_elfloader.c
> +++ b/tools/libs/guest/xg_dom_elfloader.c
> @@ -25,8 +25,9 @@
>  #include <stdarg.h>
>  #include <inttypes.h>
>  
> +#include <xen-tools/bitops.h>

It doesn't looks like xg_dom_elfloader.c is using anything from
bitops.h. The last use of it was probably removed in ed04ca95981f
("libelf: rewrite symtab/strtab loading")

> +
>  #include "xg_private.h"
> -#include "xc_bitops.h"
>  
>  #define XEN_VER "xen-3.0"
>  
> diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
> index 39e1e5f579a7..0f569c20c522 100644
> --- a/tools/libs/guest/xg_dom_hvmloader.c
> +++ b/tools/libs/guest/xg_dom_hvmloader.c
> @@ -24,8 +24,9 @@
>  #include <inttypes.h>
>  #include <assert.h>
>  
> +#include <xen-tools/bitops.h>
> +

I think there's two reason to remove this include:
- it doesn't looks like xg_dom_hvmloader.c is using any macro from it.
- bitops.h is already included by xg_private.h.


>  #include "xg_private.h"
> -#include "xc_bitops.h"
>  
>  /* ------------------------------------------------------------------------ */
>  /* parse elf binary                                                         */
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index 2f058ee3a6ff..2e583f2eac72 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -2,11 +2,10 @@
>  #define __COMMON__H
>  
>  #include <stdbool.h>
> +#include <xen-tools/bitops.h>

It's already included in xg_private.h, so this feels unnecessary.
>  
>  #include "xg_private.h"
>  #include "xg_save_restore.h"
> -#include "xc_bitops.h"
> -


If the extraneous includes could be removed, that would be nice. In
anycase:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

