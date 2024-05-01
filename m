Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800A8B904B
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 21:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715419.1117029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2G5b-0007aO-CA; Wed, 01 May 2024 19:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715419.1117029; Wed, 01 May 2024 19:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2G5b-0007Yx-9C; Wed, 01 May 2024 19:58:03 +0000
Received: by outflank-mailman (input) for mailman id 715419;
 Wed, 01 May 2024 19:58:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2G5a-0007WT-1m
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 19:58:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1adfaa9f-07f5-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 21:58:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 14305CE138C;
 Wed,  1 May 2024 19:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0343C072AA;
 Wed,  1 May 2024 19:57:48 +0000 (UTC)
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
X-Inumbo-ID: 1adfaa9f-07f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714593471;
	bh=VZoNuTPfViOoSZdutjXK3PMT5252Fbw5CeEXYvzJA8k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kc4OLJ3VjP3j2Vjxxys81xPn9b2HfOxojZQk58ZvoYR6uPh4g1ccTRiuKlfC3c6JU
	 qG0j2GuYOPNX6admphH+vFQ+9x7gQGKbHJJFUBR3/UAVcW1fw7Zw7/HhzpQiAgURre
	 /QaSkV4ov++9+Mk9++RdNvLXcQ6xW3zYKtO1lFfKVq427f6jjK6LrNLPe/7wjtlCQk
	 9pzBQDhmHpczUloJxUEhVpxtH6L5+crDUqnIGPVwQaBb/iwSF6eJX9LtjYGHZ4Rxr8
	 eQEy8StACYDqqytrxkNp1FaxyuxilMJt9HiDIczBskxDK/KRsrMYvDz373jnXYcaJ9
	 yWulCRvt3yaug==
Date: Wed, 1 May 2024 12:57:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 1/3] drivers: char: address violation of MISRA C
 Rule 20.7
In-Reply-To: <3ae8aa13a5562440cf60e4b30f713e5b2f73c577.1714487169.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405011257290.497719@ubuntu-linux-20-04-desktop>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com> <3ae8aa13a5562440cf60e4b30f713e5b2f73c577.1714487169.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional chage.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - drop excess parentheses from val parameter.
> ---
>  xen/drivers/char/omap-uart.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
> index 03b5b66e7acb..e0128225f927 100644
> --- a/xen/drivers/char/omap-uart.c
> +++ b/xen/drivers/char/omap-uart.c
> @@ -48,8 +48,9 @@
>  /* System configuration register */
>  #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
>  
> -#define omap_read(uart, off)       readl((uart)->regs + (off<<REG_SHIFT))
> -#define omap_write(uart, off, val) writel((val), (uart)->regs + (off<<REG_SHIFT))
> +#define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
> +#define omap_write(uart, off, val) writel(val, (uart)->regs + \
> +                                               ((off) << REG_SHIFT))

the alignment looks off but could be fixed on commit


>  static struct omap_uart {
>      u32 baud, clock_hz, data_bits, parity, stop_bits, fifo_size;


