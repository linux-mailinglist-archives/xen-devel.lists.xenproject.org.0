Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E676DB5DD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 23:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519099.806291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkttk-00076V-Ja; Fri, 07 Apr 2023 21:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519099.806291; Fri, 07 Apr 2023 21:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkttk-00074Z-G9; Fri, 07 Apr 2023 21:45:32 +0000
Received: by outflank-mailman (input) for mailman id 519099;
 Fri, 07 Apr 2023 21:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEkE=76=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pktti-00074P-Nl
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 21:45:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83004f4b-d58d-11ed-85db-49a42c6b2330;
 Fri, 07 Apr 2023 23:45:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 041B6654D8;
 Fri,  7 Apr 2023 21:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725BAC4339B;
 Fri,  7 Apr 2023 21:45:26 +0000 (UTC)
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
X-Inumbo-ID: 83004f4b-d58d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680903927;
	bh=eBSbdsqfNNt6f8OYUMdxJVCz21US87S40JrcPEDoLQA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MLZKZBmudlRnVWoZB4Uwz0xTgAFEZ+RyjUrsS8h+3RaUn0O0fPoczVmlmtrWjHoQX
	 8PnG/E5E4Ejw3i3yl6aDslCywXyDAe1Q9ciHSIyky0KIxxsmEc311ka5AVerlzRrQ5
	 QO6fQvM8enrWMyPa/DfSWOxPOdWlDzXsuFQpQON8MwIfGMiORjHHvzef4OCGp/09YX
	 4eBdCtQWosz0b2N4cFY3zuIyqCBMioH8UG14tilQu+T77lWHHxdYleG6ekeBufirSk
	 ZkBjQuCN1l9+MM5470jpe8m7FvNG9iKRpz6mOSUg+t0lFP2cjzGJtAuH67+qwS+mUt
	 SR1LMxa/Hwmpg==
Date: Fri, 7 Apr 2023 14:45:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: vpl011: Do not try to handle TX FIFO status
 when backend in Xen
In-Reply-To: <20230405111750.12491-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2304071445111.111906@ubuntu-linux-20-04-desktop>
References: <20230405111750.12491-1-michal.orzel@amd.com> <20230405111750.12491-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Apr 2023, Michal Orzel wrote:
> >From vpl011_rx_char_xen(), we call vpl011_data_avail() that handles both
> RX and TX state. Because we are passing 0 as out_fifo_level and
> SBSA_UART_FIFO_SIZE as out_size, we end up calling a function
> vpl011_update_tx_fifo_status() which performs TXI bit handling
> depending on the FIFO trigger level. This does not make sense when backend
> is in Xen, as we maintain a single TX state where data can always be
> written and as such there is no TX FIFO handling. Furthermore, this
> function assumes that the backend is in domain by making use of struct
> xencons_interface unconditionally. Fix it by calling this function only
> when backend is in domain. Also add an assert for sanity.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/vpl011.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index ff06deeb645c..7856b4b5f5a3 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -261,6 +261,9 @@ static void vpl011_update_tx_fifo_status(struct vpl011 *vpl011,
>      struct xencons_interface *intf = vpl011->backend.dom.ring_buf;
>      unsigned int fifo_threshold = sizeof(intf->out) - SBSA_UART_FIFO_LEVEL;
>  
> +    /* No TX FIFO handling when backend is in Xen */
> +    ASSERT(vpl011->backend_in_domain);
> +
>      BUILD_BUG_ON(sizeof(intf->out) < SBSA_UART_FIFO_SIZE);
>  
>      /*
> @@ -547,7 +550,13 @@ static void vpl011_data_avail(struct domain *d,
>           */
>          vpl011->uartfr &= ~BUSY;
>  
> -        vpl011_update_tx_fifo_status(vpl011, out_fifo_level);
> +        /*
> +         * When backend is in Xen, we are always ready for new data to be
> +         * written (i.e. no TX FIFO handling), therefore we do not want
> +         * to change the TX FIFO status in such case.
> +         */
> +        if ( vpl011->backend_in_domain )
> +            vpl011_update_tx_fifo_status(vpl011, out_fifo_level);
>      }
>  
>      vpl011_update_interrupt_status(d);
> -- 
> 2.25.1
> 

