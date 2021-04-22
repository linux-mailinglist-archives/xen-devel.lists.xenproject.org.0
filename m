Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29183368345
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115649.220702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbDc-0002iT-MB; Thu, 22 Apr 2021 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115649.220702; Thu, 22 Apr 2021 15:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbDc-0002i4-J3; Thu, 22 Apr 2021 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 115649;
 Thu, 22 Apr 2021 15:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L918=JT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lZbDa-0002hz-Ve
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:26:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0b926d3-e210-4484-976c-88f07d05528f;
 Thu, 22 Apr 2021 15:26:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C73B61450;
 Thu, 22 Apr 2021 15:26:13 +0000 (UTC)
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
X-Inumbo-ID: f0b926d3-e210-4484-976c-88f07d05528f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619105173;
	bh=xX6LHIsRNYix3onntFIfW+HfRKfpkeI2B6kAC3uJGjo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NL/wD7kcp0LWQl8BHPTRtH4K8sjhyKxz8dKu6JJ9zex8W02AVjrKwc5oGH2wjR5Ft
	 V963FDtSwb1VGuEUtLls82/088eRox+90An9FjfNvkS7cRXfmO5OCtgIXcz0yivw34
	 xsv0pms4da82pN0nCDee+PRiM6J/sNMWp7XJ/Nmitq5KztZWojtLacg9DCQUzylJnW
	 4d1XR5X8B1YxODY0iCMTdUPJhb0uEnVHEZHc9S0U/9j/FMHGX1vRpVvW1dWu3BU5Yg
	 7GfPfdUrnmlLb0XUE+0lhUgmcIQBvVpnv+fgmyWuQLw/9ZRiG/UbHJFgHswa2yzZT3
	 IJv7sjAqo/Xug==
Date: Thu, 22 Apr 2021 08:26:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] xen: check required Xen features
In-Reply-To: <20210422151007.2205-2-jgross@suse.com>
Message-ID: <alpine.DEB.2.21.2104220823160.5018@sstabellini-ThinkPad-T480s>
References: <20210422151007.2205-1-jgross@suse.com> <20210422151007.2205-2-jgross@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Apr 2021, Juergen Gross wrote:
> Linux kernel is not supported to run on Xen versions older than 4.0.
> 
> Add tests for required Xen features always being present in Xen 4.0
> and newer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/features.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/xen/features.c b/drivers/xen/features.c
> index 25c053b09605..60503299c9bc 100644
> --- a/drivers/xen/features.c
> +++ b/drivers/xen/features.c
> @@ -9,13 +9,26 @@
>  #include <linux/types.h>
>  #include <linux/cache.h>
>  #include <linux/export.h>
> +#include <linux/printk.h>
>  
>  #include <asm/xen/hypercall.h>
>  
> +#include <xen/xen.h>
>  #include <xen/interface/xen.h>
>  #include <xen/interface/version.h>
>  #include <xen/features.h>
>  
> +/*
> + * Linux kernel expects at least Xen 4.0.
> + *
> + * Assume some features to be available for that reason (depending on guest
> + * mode, of course).
> + */
> +#define chk_feature(f) {						\
> +		if (!xen_feature(f))					\
> +			pr_err("Xen: feature %s not available!\n", #f);	\
> +	}

I think this could be done as a static inline function in
include/xen/features.h. That way it would be available everywhere. Also,
static inlines are better than macro when it is possible to use them in
terms of code safety.


>  u8 xen_features[XENFEAT_NR_SUBMAPS * 32] __read_mostly;
>  EXPORT_SYMBOL_GPL(xen_features);
>  
> @@ -31,4 +44,9 @@ void xen_setup_features(void)
>  		for (j = 0; j < 32; j++)
>  			xen_features[i * 32 + j] = !!(fi.submap & 1<<j);
>  	}
> +
> +	if (xen_pv_domain()) {
> +		chk_feature(XENFEAT_mmu_pt_update_preserve_ad);
> +		chk_feature(XENFEAT_gnttab_map_avail_bits);
> +	}
>  }
> -- 
> 2.26.2
> 

