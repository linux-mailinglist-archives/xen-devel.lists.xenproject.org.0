Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5698B836
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807875.1219579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZ38-0007PK-2H; Tue, 01 Oct 2024 09:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807875.1219579; Tue, 01 Oct 2024 09:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZ37-0007N4-UV; Tue, 01 Oct 2024 09:20:05 +0000
Received: by outflank-mailman (input) for mailman id 807875;
 Tue, 01 Oct 2024 09:20:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svZ35-0006z1-V7
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:20:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZ35-0007D3-5D; Tue, 01 Oct 2024 09:20:03 +0000
Received: from [15.248.2.236] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZ34-0004Lm-Tz; Tue, 01 Oct 2024 09:20:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=DSYL+i0P78OGlK0q+SoD75JOvetdKVRfzR6GpP3kp+0=; b=pY+iGIJz+WeVVa/Dv5kmsZCw3M
	36XdOdDlQCv76bCXyVUNAGvJedsymDtAy8V2yavTqhr1qldZcsBHwL5v2hhceA7Nnoqr4az/To4jO
	OG0cmxuFymBogEiJLdIUOaQuHvgQKQNQnMRDUoY1a23RWTuu5d+oUw+hYLBrDHr5Sf4U=;
Message-ID: <b0e2f8d8-5cc2-46dd-90fb-47c61d79f703@xen.org>
Date: Tue, 1 Oct 2024 10:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] xen/arm: Add NXP LINFlexD UART Driver
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-2-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240930114715.642978-2-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrei,

On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
> +static void __init linflex_uart_init_preirq(struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t ibr, fbr, divisr, dividr, ctrl;
> +
> +    /* Disable RX/TX before init mode */
> +    ctrl = linflex_uart_readl(uart, UARTCR);
> +    ctrl &= ~(UARTCR_RXEN | UARTCR_TXEN);
> +    linflex_uart_writel(uart, UARTCR, ctrl);
> +
> +    /*
> +     * Smoothen the transition from early_printk by waiting
> +     * for all pending characters to transmit
> +     */

Just to note that early_printk() will still be used by secondary CPUs 
when booting which happens after init_preirq() is called. Will this be a 
problem for you?

I haven't compared the code against the specification. But the logic 
LGTM from a Xen PoV. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


