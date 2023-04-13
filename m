Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0436E15E1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 22:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520959.809138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3bi-0005bD-LN; Thu, 13 Apr 2023 20:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520959.809138; Thu, 13 Apr 2023 20:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3bi-0005Yb-Ie; Thu, 13 Apr 2023 20:31:50 +0000
Received: by outflank-mailman (input) for mailman id 520959;
 Thu, 13 Apr 2023 20:31:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn3bh-0005YV-Ih
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 20:31:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3bh-0005Bo-6d; Thu, 13 Apr 2023 20:31:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3bg-0005Be-Vj; Thu, 13 Apr 2023 20:31:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=TyxIEsaM6b1l/hR5s5xSX0h5w0Zjr2PVNfKqKVoiay0=; b=UU0yZ6CQNOv687RN68enSt5ATZ
	34w0CDqDJlt9904+eDqMsPKJYLsHkUURnywVbBvmZB3jrxO4aeXh0Ym1QwEnFjI+j3vmfMgzXgADN
	qTNjV1hO89jZa87e6ExihV4fy9drZbAEPa+tzMRBrpva2gPjejdoDdZdAR3YD7R1lHgs=;
Message-ID: <6d1b8904-374c-4392-6945-2746f97c31f6@xen.org>
Date: Thu, 13 Apr 2023 21:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-13-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v8 12/22] xen/arm: ffa: support mapping guest RX/TX
 buffers
In-Reply-To: <20230413071424.3273490-13-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 13/04/2023 08:14, Jens Wiklander wrote:
> +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +                                register_t rx_addr, uint32_t page_count)
> +{
> +    uint32_t ret = FFA_RET_INVALID_PARAMETERS;
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.tee;
> +    struct page_info *tx_pg;
> +    struct page_info *rx_pg;
> +    p2m_type_t t;
> +    void *rx;
> +    void *tx;
> +
> +    if ( !smccc_is_conv_64(fid) )
> +    {
> +        /*
> +         * Calls using the 32-bit calling convention must ignore the upper
> +         * 32 bits in the argument registers.
> +         */
> +        tx_addr &= UINT32_MAX;
> +        rx_addr &= UINT32_MAX;
> +    }
> +
> +    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT ) {

Coding style:

if ( ... )
{

> +        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n",
> +               page_count, FFA_MAX_RXTX_PAGE_COUNT);
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M_ALLOC);

I might be missing something. Here you only get the reference on one 
page. Per the value of FFA_MAX_RXTX_PAGE_COUNT, it looks like the buffer 
can be up to 32 pages.

Can you clarify?

> +    if ( !tx_pg )
> +        return FFA_RET_INVALID_PARAMETERS;
> +    /* Only normal RAM for now */
> +    if ( !p2m_is_ram(t) )

p2m_is_ram() would allow RAM page marked read-only in stage-2. Is it 
intended?

If not, then I think you want to use t != p2m_ram_rw.

> +        goto err_put_tx_pg;
> +
> +    rx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M_ALLOC);
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;
> +    /* Only normal RAM for now */
> +    if ( !p2m_is_ram(t) )

Same here.

> +        goto err_put_rx_pg;
> +
> +    tx = __map_domain_page_global(tx_pg);
> +    if ( !tx )
> +        goto err_put_rx_pg;
> +
> +    rx = __map_domain_page_global(rx_pg);
> +    if ( !rx )
> +        goto err_unmap_tx;
> +
> +    ctx->rx = rx;
> +    ctx->tx = tx;
> +    ctx->rx_pg = rx_pg;
> +    ctx->tx_pg = tx_pg;
> +    ctx->page_count = page_count;
> +    ctx->tx_is_free = true;
> +    return FFA_RET_OK;

Cheers,

-- 
Julien Grall

