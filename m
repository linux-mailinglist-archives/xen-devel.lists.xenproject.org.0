Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FC56967F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 01:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362648.592775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Ef6-0002GD-3c; Wed, 06 Jul 2022 23:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362648.592775; Wed, 06 Jul 2022 23:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Ef5-0002DL-WC; Wed, 06 Jul 2022 23:42:28 +0000
Received: by outflank-mailman (input) for mailman id 362648;
 Wed, 06 Jul 2022 23:42:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9Ef4-0002DF-Cu
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 23:42:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48c59d5b-fd85-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 01:42:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E027661E9B;
 Wed,  6 Jul 2022 23:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07631C3411C;
 Wed,  6 Jul 2022 23:42:21 +0000 (UTC)
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
X-Inumbo-ID: 48c59d5b-fd85-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657150942;
	bh=wtneZk4H1Z7lB3VpbxUxdFAoXDMjcCtol2OAdax3Vwo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iIk/GbIMmB+GFFSFClcAAxoMsvzsTRWTdmwjLPrG6Ow28loCpA4oNiD+ojg+Reqz7
	 lDu+OWkECPRVnv8yyWdV79etEVl3DFIC0Tu/s5TvpNS9odLf3PAnkcswVvY7dq6Pfm
	 /l7JlgfNwe9QY4BneDTljY4Uau2CV0+5EtrA7bNWyVQCT/Uqxf/KxOU12tJTIloYDi
	 NjrcuVvMDDgLLVHwWKQ0+pbCBWZoW4GXCens7F7QZwn+jOaxvyW611Ufpl4wG6hykl
	 4jKsNg+JZlzeW1D3+R6jv+/O2KNSJSGKDoXOB0eb42wfPViPc8lleuuNvidehhBrmI
	 MbD8bTBPywRAw==
Date: Wed, 6 Jul 2022 16:42:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [PATCH v2] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
In-Reply-To: <20220706121156.666500-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207061642120.2354836@ubuntu-linux-20-04-desktop>
References: <20220706121156.666500-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Jul 2022, Xenia Ragiadakou wrote:
> Add the function prototype of show_stack() in <asm/processor.h> header file
> so that it is visible before its definition in traps.c.
> 
> Although show_stack() is referenced only in traps.c, it is declared with
> external linkage because, during development, it is often called also by
> other files for debugging purposes. Declaring it static would increase
> development effort. Add appropriate comment
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - add a new line after show_stack() to make obvious to which set of functions
> the comment is referring to.
> 
>  xen/arch/arm/include/asm/processor.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 4188ec6bfb..55f56b33bc 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -558,7 +558,10 @@ extern register_t __cpu_logical_map[];
>  void panic_PAR(uint64_t par);
>  
>  void show_execution_state(const struct cpu_user_regs *regs);
> +/* Debugging functions are declared with external linkage to aid development. */
>  void show_registers(const struct cpu_user_regs *regs);
> +void show_stack(const struct cpu_user_regs *regs);
> +
>  //#define dump_execution_state() run_in_exception_handler(show_execution_state)
>  #define dump_execution_state() WARN()
>  
> -- 
> 2.34.1
> 

