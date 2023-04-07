Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD66DB5D9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 23:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519094.806281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pktrD-0006Vv-7F; Fri, 07 Apr 2023 21:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519094.806281; Fri, 07 Apr 2023 21:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pktrD-0006T2-3u; Fri, 07 Apr 2023 21:42:55 +0000
Received: by outflank-mailman (input) for mailman id 519094;
 Fri, 07 Apr 2023 21:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEkE=76=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pktrB-0006Su-3S
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 21:42:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2577c318-d58d-11ed-85db-49a42c6b2330;
 Fri, 07 Apr 2023 23:42:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F03066409B;
 Fri,  7 Apr 2023 21:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DECBC433EF;
 Fri,  7 Apr 2023 21:42:49 +0000 (UTC)
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
X-Inumbo-ID: 2577c318-d58d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680903770;
	bh=lVWwJy+ZKB+OJ2ogGpVmHsex9c5zOoBzr31cr4qWLaU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d04Gd5vbHDZwvIeRDa2zeLFqGpWu/YOu4ZH0lL9AtbfXnD7XAEexo030Ac6lXvs+m
	 qMGuYNuEuLGKtr7SpKYMh7BEPV2yuBztRjmfJxhJ002fEj1aNvaz2+HcycQpVgGD72
	 On68uJPoLQap8VKjYTEZ00auiZ99xcOaV7Q4eFDT+pSLwgGQeOuveRxWaZoQitV1MX
	 jgURF+cw4zEm28G14eA2GXDGwqBPuy+DfUeRh1z9SGAswEFIy8JrDtxCYfhEVmi5gx
	 +5tO4fx4/PYfwVR56pFYGJryuC7JIGi6HX4EScnvrTDnzH9zKey6VrtWRMpYInk4Vz
	 DKr2aucx6qJRg==
Date: Fri, 7 Apr 2023 14:42:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/3] xen/arm: vpl011: Handle correctly TXFE when backend
 in Xen
In-Reply-To: <20230405111750.12491-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2304071442110.111906@ubuntu-linux-20-04-desktop>
References: <20230405111750.12491-1-michal.orzel@amd.com> <20230405111750.12491-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Apr 2023, Michal Orzel wrote:
> When backend is in Xen, the handling of data written to DR register is a
> bit special because we want to tell guest that we are always ready for new
> data to be written (i.e. no real FIFO, TXFF/BUSY never set and TXI always
> set). This conflicts with the current handling of TXFE bit, which we
> always clear and never set on a write path (we happen to set it when we
> receive char from serial input due to use of vpl011_data_avail() but this
> might never be called). This can lead to issues if a guest driver makes
> use of TXFE bit to check for TX transmission completion (such guest could
> then wait endlessly). Fix it by keeping TXFE always set to match the
> current emulation logic.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> We don't have to look far for an example of a PL011/SBSA driver relying on TXFE.
> If a guest had a driver like we have in Xen, we would end up with no messages
> being printed.
> ---
>  xen/arch/arm/vpl011.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 0186d8a31834..ff06deeb645c 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -112,8 +112,14 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>          }
>      }
>  
> +    /*
> +     * When backend is in Xen, we tell guest we are always ready for new data
> +     * to be written. This is fulfilled by having:
> +     * - TXI/TXFE -> always set,
> +     * - TXFF/BUSY -> never set.
> +     */
>      vpl011->uartris |= TXI;
> -    vpl011->uartfr &= ~TXFE;
> +    vpl011->uartfr |= TXFE;
>      vpl011_update_interrupt_status(d);
>  
>      VPL011_UNLOCK(d, flags);
> -- 
> 2.25.1
> 

