Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6658E215
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 23:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383203.618334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLX5A-0002Rw-Vz; Tue, 09 Aug 2022 21:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383203.618334; Tue, 09 Aug 2022 21:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLX5A-0002PS-SP; Tue, 09 Aug 2022 21:48:12 +0000
Received: by outflank-mailman (input) for mailman id 383203;
 Tue, 09 Aug 2022 21:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oLX59-0002PK-Ke
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 21:48:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f56519d6-182c-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 23:48:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2686FCE1AAB;
 Tue,  9 Aug 2022 21:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B8AC433C1;
 Tue,  9 Aug 2022 21:48:03 +0000 (UTC)
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
X-Inumbo-ID: f56519d6-182c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660081684;
	bh=Sx2rcAFleWSXhA30GrbO/eH0VT3+/nj5z8QkUZZfZU8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K1ye2QRQVtmjtseM50Q9kCkaEZe4Waj8FaqCJ615OXkhSOV2i1hg7Ms0x08eRYGXW
	 fiNVqE9hgeaxNc8Im7N6RAI98urYUmBoWFIG3mQCXvXUVAxO231PLIX0svdtulcG7T
	 3XxUJvMhm2ZnTILcCsBXITJQinAbokvO4qAsfi6dFw3tra1Oh29mEDfAZOKqWUKkt2
	 5PBMrNXWpA6mjyOObSed9hxxH8RRhjyivTRNzB3MkL6fjgG/ihjMGx89hA0XDNFmVm
	 S1DYHcH2RgLWZG4oMN2nRaphJBCq3b7E2bEFcJogFFqsaYjktx66X9BweupAWA9tFH
	 4M1FWYdyNKDJA==
Date: Tue, 9 Aug 2022 14:48:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: regs: Fix MISRA C 2012 Rule 20.7 violation
In-Reply-To: <20220808094837.1880522-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208091447520.3790@ubuntu-linux-20-04-desktop>
References: <20220808094837.1880522-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Aug 2022, Xenia Ragiadakou wrote:
> In macro psr_mode(), the macro parameter 'm' is used as expression and
> therefore it is good to be enclosed in parentheses to prevent against
> unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/arch/arm/include/asm/regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
> index 794721a103..0693a68131 100644
> --- a/xen/arch/arm/include/asm/regs.h
> +++ b/xen/arch/arm/include/asm/regs.h
> @@ -11,7 +11,7 @@
>  #include <asm/current.h>
>  #include <asm/processor.h>
>  
> -#define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == m)
> +#define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == (m))
>  
>  static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
>  {
> -- 
> 2.34.1
> 

