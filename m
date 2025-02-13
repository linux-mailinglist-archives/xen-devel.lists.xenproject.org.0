Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93CCA351F8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 00:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888179.1297575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiiFp-0007z1-Dp; Thu, 13 Feb 2025 23:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888179.1297575; Thu, 13 Feb 2025 23:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiiFp-0007xX-B3; Thu, 13 Feb 2025 23:04:21 +0000
Received: by outflank-mailman (input) for mailman id 888179;
 Thu, 13 Feb 2025 23:04:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiiFo-0007xR-Bj
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 23:04:20 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da1a7bd8-ea5e-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 00:04:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27A9DA4287C;
 Thu, 13 Feb 2025 23:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0D2C4CED1;
 Thu, 13 Feb 2025 23:04:15 +0000 (UTC)
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
X-Inumbo-ID: da1a7bd8-ea5e-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739487857;
	bh=g7W/a1S8AeQIXZh8jnVJsfW7YdLr4o/F0W5VTcn7Z/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X2LG/KgCE7KfYt6EwAawZ/cbhG+5kavqfrEk1RRS93QSUAbfyTJZHpDK5Bs8uJw6N
	 CELeTy7cJVzzYlFK+0XaBt9QOL7OvbJanDgtzOhmetUpeVNB0sIfSoqDDgKjz7CQnm
	 T7Mx5XXoyAqF52zC4qR10btusMng5jDP3S90s9dCCPvW6oTtbpFLtbP1oORQa1PoJ6
	 GP7KFP7ZnQemWtnTBJOxWYUKedgDiajxGXR58jl4PUCZGHcLss8KH897ncODFzmHaq
	 yyjT6Wcw9KZRAMi8OQb/15JudSbcDTPjbTB2Z5p59PnSJluoXmwPQkQ0tHMYi/gbPg
	 ZIIYDvmRW4O2g==
Date: Thu, 13 Feb 2025 15:04:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH] xen/console: make console buffer size configurable
In-Reply-To: <20250212222157.2974150-1-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2502131504070.619090@ubuntu-linux-20-04-desktop>
References: <20250212222157.2974150-1-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, dmkhn@proton.me wrote:
> Add new CONRING_SIZE Kconfig parameter to specify the boot console buffer size
> in bytes. The value is rounded to the nearest power of 2 to match existing
> conring_size= behavior.
> 
> The supported range is [16KiB..128MiB].
> 
> Bump default size to 32 KiB.
> 
> Link: https://gitlab.com/xen-project/xen/-/issues/185
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Link to the original change:
> - https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-15-c5d36b31d66c@ford.com/
> ---
>  docs/misc/xen-command-line.pandoc |  5 ++++-
>  xen/drivers/char/Kconfig          | 12 ++++++++++++
>  xen/drivers/char/console.c        |  6 +++---
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 9bbd00baef..563cdbdd49 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -425,10 +425,13 @@ The following are examples of correct specifications:
>  ### conring_size
>  > `= <size>`
>  
> -> Default: `conring_size=16k`
> +> Default: `conring_size=32k`
>  
>  Specify the size of the console ring buffer.
>  
> +The console ring buffer size can be selected at build time via
> +CONFIG_CONRING_SIZE.
> +
>  ### console
>  > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
>  
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index e6e12bb413..54a3a79da3 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_SIZE
> +	int "Console buffer size"
> +	default 32768
> +	range 16384 134217728
> +	help
> +	  Select the boot console buffer size (in bytes).
> +	  Note, the value provided will be rounded down to the nearest power of 2.
> +	  Run-time console buffer size is the same as the boot console size,
> +	  unless overridden via 'conring_size=' boot parameter.
> +
> +	  Default value is 32768 (32KiB).
> +
>  config XHCI
>  	bool "XHCI DbC UART driver"
>  	depends on X86
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ee5f720de4..73d24a7821 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -101,12 +101,12 @@ static int cf_check parse_console_timestamps(const char *s);
>  custom_runtime_param("console_timestamps", parse_console_timestamps,
>                       con_timestamp_mode_upd);
>  
> -/* conring_size: allows a large console ring than default (16kB). */
> +/* conring_size: override build-time CONRING_SIZE setting. */
>  static uint32_t __initdata opt_conring_size;
>  size_param("conring_size", opt_conring_size);
>  
> -#define _CONRING_SIZE 16384
> -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> +#define _CONRING_SIZE       (1UL << (31 - __builtin_clz(CONFIG_CONRING_SIZE)))
> +#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
>  static char __initdata _conring[_CONRING_SIZE];
>  static char *__read_mostly conring = _conring;
>  static uint32_t __read_mostly conring_size = _CONRING_SIZE;
> -- 
> 2.34.1
> 
> 

