Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30426A79BA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 03:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504294.776909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXZ7r-0005CS-MI; Thu, 02 Mar 2023 02:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504294.776909; Thu, 02 Mar 2023 02:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXZ7r-0005An-GX; Thu, 02 Mar 2023 02:56:59 +0000
Received: by outflank-mailman (input) for mailman id 504294;
 Thu, 02 Mar 2023 02:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXZ7q-0005Ah-2p
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 02:56:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2633351-b8a5-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 03:56:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D7A1614CD;
 Thu,  2 Mar 2023 02:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FF5C433EF;
 Thu,  2 Mar 2023 02:56:50 +0000 (UTC)
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
X-Inumbo-ID: e2633351-b8a5-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677725811;
	bh=Zq+So03lJSoy8rAUDR19kmxTbmAlsBXZMBJxiclw+0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LF2eHQybbFKcDn3koz42UAqRnIwJatT371YmmhRpSYzZUA7sbG9cFqe6LFuqnTHxl
	 DbL620iauIHETNW66XHGvt8Uon8/w+uT+P4JJCO15ZnVmyGFHJ2tkmF8iwJZYGMVOt
	 rZKUI03vFDZfvl7+FiKjj4I4bRwzbLkbnkUsOLrz9ICidsHyXgFxNUWdNvKHAghaNw
	 fcXdfT7lVAJwSrnxcsv5rA63CJTRSMpB6BqaW91lV8c361yg+ixb0FCHU1Nbx/gENy
	 V2nZbZ8YGXB0i4GxRuGVCF8jyTJl/cegzGat/EGwuQc/eQqcu3zKKV+v0oWTysQrKH
	 A58yvg4a8rIbw==
Date: Wed, 1 Mar 2023 18:56:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: check max_init_domid validity
In-Reply-To: <0cf2013e5e6018cae300c39fb65ed526eac5c35c.1677511937.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303011856340.686499@ubuntu-linux-20-04-desktop>
References: <0cf2013e5e6018cae300c39fb65ed526eac5c35c.1677511937.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Feb 2023, Bertrand Marquis wrote:
> Before trying to create a dom0less guest, check that max_init_domid
> increment will generate a valid domain ID, lower than
> DOMID_FIRST_RESERVED.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain_build.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index edca23b986d2..9707eb7b1bb1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3879,6 +3879,9 @@ void __init create_domUs(void)
>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
>  
> +        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
> +            panic("No more domain IDs available\n");
> +
>          if ( dt_find_property(node, "xen,static-mem", NULL) )
>              flags |= CDF_staticmem;
>  
> -- 
> 2.25.1
> 

