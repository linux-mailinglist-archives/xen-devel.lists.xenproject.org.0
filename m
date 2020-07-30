Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49244233924
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:37:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EMI-0002F6-Es; Thu, 30 Jul 2020 19:36:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1EMH-0002F1-1m
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:36:53 +0000
X-Inumbo-ID: 04942e56-d29c-11ea-8dc2-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04942e56-d29c-11ea-8dc2-bc764e2007e4;
 Thu, 30 Jul 2020 19:36:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C7432072A;
 Thu, 30 Jul 2020 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596137811;
 bh=nllV0vbNRPc7LF/hscfbvxGqVtZquYkchm/h8IciEas=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TnJCxH0jwgTuAwQlP/o3yYIfGYR/Yyl4oBKKIMQ8jbi2KANC8xc1NLxlGuFn2LngA
 kSg904YjzwTunNLsdTNHKbZduffPDrp7Wn1uYTLEEy8RZUPjvFtlY6Ef9woFC4YThd
 JUCjJ4PCxFuc6wnXbg2DJ4kBezeehOChNxL6fHw4=
Date: Thu, 30 Jul 2020 12:36:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 2/7] xen/arm: kernel: Re-order the includes
In-Reply-To: <20200730181827.1670-3-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2007301216060.1767@sstabellini-ThinkPad-T480s>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-3-julien@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Jul 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> We usually have xen/ includes first and then asm/. They are also ordered
> alphabetically among themselves.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/kernel.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 8eff0748367d..f95fa392af44 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -3,20 +3,20 @@
>   *
>   * Copyright (C) 2011 Citrix Systems, Inc.
>   */
> +#include <xen/domain_page.h>
>  #include <xen/errno.h>
> +#include <xen/gunzip.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
> -#include <xen/domain_page.h>
>  #include <xen/sched.h>
> -#include <asm/byteorder.h>
> -#include <asm/setup.h>
> -#include <xen/libfdt/libfdt.h>
> -#include <xen/gunzip.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/byteorder.h>
>  #include <asm/guest_access.h>
>  #include <asm/kernel.h>
> +#include <asm/setup.h>
>  
>  #define UIMAGE_MAGIC          0x27051956
>  #define UIMAGE_NMLEN          32
> -- 
> 2.17.1
> 

