Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD22B9F62
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 01:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31499.61917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfuUP-0002MV-08; Fri, 20 Nov 2020 00:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31499.61917; Fri, 20 Nov 2020 00:41:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfuUO-0002M6-TF; Fri, 20 Nov 2020 00:41:24 +0000
Received: by outflank-mailman (input) for mailman id 31499;
 Fri, 20 Nov 2020 00:41:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfuUN-0002M1-97
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 00:41:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee2ecc27-d0f6-4e78-8d2b-1fa6c64a921c;
 Fri, 20 Nov 2020 00:41:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D66F22244;
 Fri, 20 Nov 2020 00:41:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfuUN-0002M1-97
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 00:41:23 +0000
X-Inumbo-ID: ee2ecc27-d0f6-4e78-8d2b-1fa6c64a921c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ee2ecc27-d0f6-4e78-8d2b-1fa6c64a921c;
	Fri, 20 Nov 2020 00:41:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1D66F22244;
	Fri, 20 Nov 2020 00:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605832881;
	bh=GavnnliBtrzqeKWl7EDe8YQ9zUGuVT+EuXBe3yvCsYM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bdC78CeOzGxNqd+CTmurgBmyVlGmtoXT0yOSXVvOp28KDY8cnsgLp7Rv1+jfng5Pt
	 WpH9TK70S4YfGsvgTmJwglRhgCMthTRRrzmwqmmwJ2+RXPf4OSyaKDc6HE7knQfOd7
	 HzTHHDDdbOANr4btC8E59AE5h03G7b6UWlgNm1dA=
Date: Thu, 19 Nov 2020 16:41:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 2/6] xen/arm: mm: Remove ; at the end of
 mm_printk()
In-Reply-To: <20201119190751.22345-3-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2011191641100.7979@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-3-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The ; at the end of mm_printk() means the following code will not build
> correctly:
> 
> if ( ... )
>     mm_printk(...);
> else
>     ...
> 
> As we treat the macro as a function, we want to remove the ; at the end
> of it.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 4dd886f7c80d..59f8a3f15fd1 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -59,7 +59,7 @@ mm_printk(const char *fmt, ...) {}
>      {                                       \
>          dprintk(XENLOG_ERR, fmt, ## args);  \
>          WARN();                             \
> -    } while (0);
> +    } while (0)
>  #endif
>  
>  /*
> -- 
> 2.17.1
> 

