Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15CF730CE2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 03:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549378.857870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9c8F-00053f-UP; Thu, 15 Jun 2023 01:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549378.857870; Thu, 15 Jun 2023 01:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9c8F-00050Z-Qf; Thu, 15 Jun 2023 01:50:39 +0000
Received: by outflank-mailman (input) for mailman id 549378;
 Thu, 15 Jun 2023 01:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9c8F-00050T-CQ
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 01:50:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05c10386-0b1f-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 03:50:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21FA8601D6;
 Thu, 15 Jun 2023 01:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CB5C433C0;
 Thu, 15 Jun 2023 01:50:34 +0000 (UTC)
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
X-Inumbo-ID: 05c10386-0b1f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686793835;
	bh=BvL13o8J7hMok5/C+Ksec38j3C0V4DkPm9ObeIcMTVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K1Tq1O3DxdFT9RZbrsflNBkqgG/a9wW/woUJQkipUyKNAbd52EeqHhb7akQk2gaY9
	 45C+3nFWwvAP+EHTpEhHdVZL+imtHDszf0RL5Ie8YeSfsxb2D5Rc6whUuRVY++VJ2q
	 0Mqam2WN0XfOpIKYIgZrzuG2+UNWCOIqvZES2xViYJPOfspdalz/NTv22xBKNIsZcx
	 719X+KujULdGAeazCiDpF5KlRjBNPt9Vez5AiFZ1yJP9YGKpknoVcC5yZzH0Jhl1vV
	 JUf37FliKxKLAdhjNLyyvkvEQv520vAg7jNel0EWOx40R6h9LaLowU9UyXJokxTWtj
	 OcZob2PX9chwQ==
Date: Wed, 14 Jun 2023 18:50:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/4] xen/arm: pl011: Add SBSA UART device-tree support
In-Reply-To: <20230607092727.19654-5-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306141850250.897208@ubuntu-linux-20-04-desktop>
References: <20230607092727.19654-1-michal.orzel@amd.com> <20230607092727.19654-5-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Jun 2023, Michal Orzel wrote:
> We already have all the bits necessary in PL011 driver to support SBSA
> UART thanks to commit 032ea8c736d10f02672863c6e369338f948f7ed8 that
> enabled it for ACPI. Plumb in the remaining part for device-tree boot:
>  - add arm,sbsa-uart compatible to pl011_dt_match (no need for a separate
>    struct and DT_DEVICE_START as SBSA is a subset of PL011),
>  - from pl011_dt_uart_init(), check for SBSA UART compatible to determine
>    the UART type in use.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> After this series the last thing not to be in spec for newer UARTs (well,
> for rev1.5 introduced in 2007 I believe) is incorrect FIFO size. We hardcode it
> to 16 but in r1.5 it is 32. This requires checking the peripheral ID register
> or using arm,primecell-periphid dt property for overriding HW. Something to
> be done in the future (at least 16 is not harmful).
> ---
>  xen/drivers/char/pl011.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index 403b1ac06551..f7bf3ad117af 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -286,7 +286,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>      int res;
>      paddr_t addr, size;
>      uint32_t io_width;
> -    bool mmio32 = false;
> +    bool mmio32 = false, sbsa;
>  
>      if ( strcmp(config, "") )
>      {
> @@ -320,7 +320,9 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>          }
>      }
>  
> -    res = pl011_uart_init(res, addr, size, false, mmio32);
> +    sbsa = dt_device_is_compatible(dev, "arm,sbsa-uart");
> +
> +    res = pl011_uart_init(res, addr, size, sbsa, mmio32);
>      if ( res < 0 )
>      {
>          printk("pl011: Unable to initialize\n");
> @@ -335,6 +337,8 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>  static const struct dt_device_match pl011_dt_match[] __initconst =
>  {
>      DT_MATCH_COMPATIBLE("arm,pl011"),
> +    /* No need for a separate struct as SBSA UART is a subset of PL011 */
> +    DT_MATCH_COMPATIBLE("arm,sbsa-uart"),
>      { /* sentinel */ },
>  };
>  
> -- 
> 2.25.1
> 

