Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A787B17A5B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 02:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066638.1431798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhdLo-0002Bo-2c; Fri, 01 Aug 2025 00:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066638.1431798; Fri, 01 Aug 2025 00:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhdLn-0002AE-W6; Fri, 01 Aug 2025 00:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1066638;
 Fri, 01 Aug 2025 00:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u8vk=2N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhdLm-0002A8-Od
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 00:10:18 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e763c998-6e6b-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 02:10:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD21B61132;
 Fri,  1 Aug 2025 00:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB335C4CEF7;
 Fri,  1 Aug 2025 00:10:14 +0000 (UTC)
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
X-Inumbo-ID: e763c998-6e6b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754007016;
	bh=ABITAMX6yrmcnsQg+uqPo44MlCfP6dZUlwqGmgZN1s8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ew2+r1fpQQ5doti1EOh678reX4CB+QcADL7/ihsqOU1OyE6us1honi+b78jOFk+H0
	 TF318gn8ve1qlemQ/F0Tds60pXE7HDngKYS3kUsyayHUytPBHkvppyAu9jz3CSKHAt
	 OPjPc3dOfcs37Bx36FASfH/Ni0XLWp4t/35o9iNF3wV0U5lqwUx136CQ37objdxKHA
	 wAv2RjlkEYXPuaALFzvh6JU1Oy+wfWU2T6tjVOUeeQ2MJRch5WbdSvq30CrTiP7fbB
	 ugOjnRy7ltxKYnmTcAjt316g5GtX8cTvutiDb0kRtkEKe+hRLYStvamRpF9ER0xchL
	 E2Fj18x17sI6w==
Date: Thu, 31 Jul 2025 17:10:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 8/8] emul/vuart: introduce console forwarding enforcement
 via vUART
In-Reply-To: <20250731192130.3948419-9-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2507311709221.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-9-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> It may be useful to enforce console forwarding over the virtual UART. E.g.
> hardware domain uses PV console by default, but it may be necessary to have
> console forwarded to the hardware domain via emulated UART.
> 
> Add CONFIG_VUART_CONSOLE_FOCUS to enforce such behavior.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

I realize that hyperlaunch is not merged yet, but I think this one would
be best as a hyperlaunch configuration option rather than a kconfig. But
it is certainly useful for testing until Hyperlaunch is merged!


> ---
> Changes since v3:
> - new patch
> ---
>  xen/arch/x86/domain.c         | 6 ++++++
>  xen/common/emul/vuart/Kconfig | 5 +++++
>  xen/drivers/char/console.c    | 2 +-
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 39b0c0b199b9..40ff92ad6c61 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -848,6 +848,12 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && is_pv_domain(d) )
>          emflags |= XEN_X86_EMU_PIT;
>  
> +    if ( IS_ENABLED(CONFIG_VUART_CONSOLE_FOCUS) &&
> +         IS_ENABLED(CONFIG_VUART_NS16550) &&
> +         is_hardware_domain(d) &&
> +         is_hvm_domain(d) )
> +        emflags |= XEN_X86_EMU_NS16550;
> +
>      if ( emflags & ~XEN_X86_EMU_ALL )
>      {
>          printk(XENLOG_G_ERR
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
> index ebefd90d913e..1069ca95f2db 100644
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -51,4 +51,9 @@ config VUART_NS16550_DEBUG
>  	help
>  	  Enable development debugging.
>  
> +config VUART_CONSOLE_FOCUS
> +	bool "Console input forwarding via UART emulator"
> +	help
> +	  Enable physical console input forwarding to guest OS via emulated UART.
> +
>  endmenu
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 93254979817b..d142f5511d61 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -597,7 +597,7 @@ static void __serial_rx(char c)
>      if ( !d )
>          return;
>  
> -    if ( is_hardware_domain(d) )
> +    if ( !IS_ENABLED(CONFIG_VUART_CONSOLE_FOCUS) && is_hardware_domain(d) )
>      {
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
> -- 
> 2.34.1
> 
> 

