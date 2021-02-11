Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012373188AB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 11:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83820.156932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9bD-0006GA-JL; Thu, 11 Feb 2021 10:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83820.156932; Thu, 11 Feb 2021 10:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9bD-0006Fl-GI; Thu, 11 Feb 2021 10:53:27 +0000
Received: by outflank-mailman (input) for mailman id 83820;
 Thu, 11 Feb 2021 10:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cmTu=HN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lA9bC-0006Fg-1G
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 10:53:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e292099-fb78-4098-90fa-f55e5f101bf8;
 Thu, 11 Feb 2021 10:53:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8840DB11A;
 Thu, 11 Feb 2021 10:53:23 +0000 (UTC)
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
X-Inumbo-ID: 3e292099-fb78-4098-90fa-f55e5f101bf8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613040804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9xCMOru1/Zj81RD4aoWE/w0ZfHdvMe1Cb500/kNnBc=;
	b=s0OmhzXzKBbfO921BFeUxxT/ihk9SFXl7epMlPgOjbgR6yN2M4AUqSnSyTjwhH7Dd3Fp7s
	FeDSPBTOPkers18yXi01hmlp6e518rfVmCeJGbzmmAeEgqMq+vGDAIo5LvC7A+YVKAVxbC
	Y9vMsgVC9OJaTxyCYqIQ2pnYd+vRDiw=
Subject: Re: [PATCH v2 4/8] xen/netback: fix spurious event detection for
 common event case
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c164ff57-69f2-8a5f-43f4-ec170bd99c22@suse.com>
Date: Thu, 11 Feb 2021 11:53:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211101616.13788-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.02.2021 11:16, Juergen Gross wrote:
> --- a/drivers/net/xen-netback/interface.c
> +++ b/drivers/net/xen-netback/interface.c
> @@ -162,13 +162,15 @@ irqreturn_t xenvif_interrupt(int irq, void *dev_id)
>  {
>  	struct xenvif_queue *queue = dev_id;
>  	int old;
> +	bool has_rx, has_tx;
>  
>  	old = atomic_fetch_or(NETBK_COMMON_EOI, &queue->eoi_pending);
>  	WARN(old, "Interrupt while EOI pending\n");
>  
> -	/* Use bitwise or as we need to call both functions. */
> -	if ((!xenvif_handle_tx_interrupt(queue) |
> -	     !xenvif_handle_rx_interrupt(queue))) {
> +	has_tx = xenvif_handle_tx_interrupt(queue);
> +	has_rx = xenvif_handle_rx_interrupt(queue);
> +
> +	if (!has_rx && !has_tx) {
>  		atomic_andnot(NETBK_COMMON_EOI, &queue->eoi_pending);
>  		xen_irq_lateeoi(irq, XEN_EOI_FLAG_SPURIOUS);
>  	}
> 

Ah yes, what was originally meant really was

	if (!(xenvif_handle_tx_interrupt(queue) |
	      xenvif_handle_rx_interrupt(queue))) {

(also hinted at by the otherwise pointless inner parentheses),
which you simply write in an alternative way.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

