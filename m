Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5A1AD1D3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 23:24:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPC01-0001Xz-P2; Thu, 16 Apr 2020 21:24:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DlbZ=6A=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jPC00-0001Xu-Kv
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 21:24:40 +0000
X-Inumbo-ID: accce481-8028-11ea-8c11-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id accce481-8028-11ea-8c11-12813bfff9fa;
 Thu, 16 Apr 2020 21:24:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5977322201;
 Thu, 16 Apr 2020 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587072278;
 bh=RRSObpGdrqNjfvIEEsG9Z/f7yPIRU00BfWL00R3oQI4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jI3mqniXkjRzCj5RdMnIQkietwemkVIBM4mQtulV72/U7JOWC8lpxOr4B+KyrKssC
 upzZmCbx89P2OYVS8pe6EyeWIgs9QcbA55HfYWaLbt86LykbuIQOQ7oQnzpPpWxQIa
 rDe0O27DWQeHq+pIexYRjp1VA2dURAAspGXaOq1Q=
Date: Thu, 16 Apr 2020 14:24:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] arm/xen: make _xen_start_info static
In-Reply-To: <20200415084853.5808-1-yanaijie@huawei.com>
Message-ID: <alpine.DEB.2.21.2004161424090.8316@sstabellini-ThinkPad-T480s>
References: <20200415084853.5808-1-yanaijie@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, sstabellini@kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 15 Apr 2020, Jason Yan wrote:
> Fix the following sparse warning:
> 
> arch/arm64/xen/../../arm/xen/enlighten.c:39:19: warning: symbol
> '_xen_start_info' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  arch/arm/xen/enlighten.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index dd6804a64f1a..fd4e1ce1daf9 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -36,7 +36,7 @@
>  
>  #include <linux/mm.h>
>  
> -struct start_info _xen_start_info;
> +static struct start_info _xen_start_info;
>  struct start_info *xen_start_info = &_xen_start_info;
>  EXPORT_SYMBOL(xen_start_info);
>  
> -- 
> 2.21.1
> 

