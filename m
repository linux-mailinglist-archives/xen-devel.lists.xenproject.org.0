Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6AC38285C
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 11:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128126.240597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZbR-0006SA-DL; Mon, 17 May 2021 09:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128126.240597; Mon, 17 May 2021 09:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZbR-0006QI-A7; Mon, 17 May 2021 09:31:57 +0000
Received: by outflank-mailman (input) for mailman id 128126;
 Mon, 17 May 2021 09:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liZbP-0006QC-Nn
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 09:31:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d0e0010-f48c-4ade-bb2c-dedf2fceadaf;
 Mon, 17 May 2021 09:31:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 372A5B05C;
 Mon, 17 May 2021 09:31:54 +0000 (UTC)
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
X-Inumbo-ID: 7d0e0010-f48c-4ade-bb2c-dedf2fceadaf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621243914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tA3XRwdT8ok6d1059+xvA8E+I4telJ7GeyBKUaR4o14=;
	b=mAhY5yhHPYD3W2hP39/fxKfs6wNBqpydeAo2pLbRj/XbaPdsPUkMCt6xWN9nmg3GUvnzvm
	wr5LGulJL3xSZQwJhPg0+IBh/7/6VEr9qNracpZIJ+ImNiIFacbG2ajapD5UzViYA/wdy1
	EEOK7ksb34J50ytZqhi9FMnaPebwk5s=
Subject: Re: [PATCH v2 1/4] usb: early: Avoid using DbC if already enabled
To: Connor Davis <connojdavis@gmail.com>
Cc: Jann Horn <jannh@google.com>, Lee Jones <lee.jones@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1620950220.git.connojdavis@gmail.com>
 <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ccce25a-e3ca-cb30-f6a3-f9243a85a49b@suse.com>
Date: Mon, 17 May 2021 11:32:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.05.2021 02:56, Connor Davis wrote:
> Check if the debug capability is enabled in early_xdbc_parse_parameter,
> and if it is, return with an error. This avoids collisions with whatever
> enabled the DbC prior to linux starting.

Doesn't this go too far and prevent use even if firmware (perhaps
mistakenly) left it enabled?

Jan

> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  drivers/usb/early/xhci-dbc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index be4ecbabdd58..ca67fddc2d36 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -642,6 +642,16 @@ int __init early_xdbc_parse_parameter(char *s)
>  	}
>  	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
>  
> +	if (readl(&xdbc.xdbc_reg->control) & CTRL_DBC_ENABLE) {
> +		pr_notice("xhci debug capability already in use\n");
> +		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
> +		xdbc.xdbc_reg = NULL;
> +		xdbc.xhci_base = NULL;
> +		xdbc.xhci_length = 0;
> +
> +		return -ENODEV;
> +	}
> +
>  	return 0;
>  }
>  
> 


