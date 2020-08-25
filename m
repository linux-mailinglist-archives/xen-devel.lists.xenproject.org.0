Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4B252482
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 01:58:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAipb-0004iQ-A8; Tue, 25 Aug 2020 23:58:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kAipa-0004iK-Al
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 23:58:22 +0000
X-Inumbo-ID: bd77c31d-9c40-4ccb-8896-9b0a92a78a46
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd77c31d-9c40-4ccb-8896-9b0a92a78a46;
 Tue, 25 Aug 2020 23:58:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C12920738;
 Tue, 25 Aug 2020 23:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598399900;
 bh=3KxviMUqBBhHalifzs+hlwYRvmc3u61PifFM/QwSugU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ybjIKbSUqAQRkRCZrBGiWzOJMyh5CWg+udgylusPsJj03XB280vZPZcmt3PcsjlQ7
 qlNTOgZK6tpi78r0foYsPU20GVILMj0xDNx/rCyI+JmUKxsyiFowiwso+RYrCmnJ1e
 hw7cMY7Z2iU9R57gWDpAFsPCbDNUixSk73BwdzNQ=
Date: Tue, 25 Aug 2020 16:58:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Simon Leiner <simon@leiner.me>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, jgross@suse.com, 
 julien@xen.org
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
In-Reply-To: <20200825093153.35500-2-simon@leiner.me>
Message-ID: <alpine.DEB.2.21.2008251658090.24407@sstabellini-ThinkPad-T480s>
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 25 Aug 2020, Simon Leiner wrote:
> As virt_to_gfn uses virt_to_phys, it will return invalid addresses when
> used with vmalloc'd addresses. This patch introduces a warning, when
> virt_to_gfn is used in this way.
> 
> Signed-off-by: Simon Leiner <simon@leiner.me>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  include/xen/arm/page.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> index d7f6af50e200..b0d303b633d0 100644
> --- a/include/xen/arm/page.h
> +++ b/include/xen/arm/page.h
> @@ -76,7 +76,11 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
>  #define bfn_to_local_pfn(bfn)	bfn_to_pfn(bfn)
>  
>  /* VIRT <-> GUEST conversion */
> -#define virt_to_gfn(v)		(pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT))
> +#define virt_to_gfn(v)                                                         \
> +	({                                                                     \
> +		WARN_ON_ONCE(is_vmalloc_addr(v));                              \
> +		pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT);                 \
> +	})
>  #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
>  
>  /* Only used in PV code. But ARM guests are always HVM. */
> -- 
> 2.24.3 (Apple Git-128)
> 

