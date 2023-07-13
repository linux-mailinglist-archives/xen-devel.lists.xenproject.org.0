Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A4751D97
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 11:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563064.880011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJsqn-0008CR-HM; Thu, 13 Jul 2023 09:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563064.880011; Thu, 13 Jul 2023 09:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJsqn-00089X-DL; Thu, 13 Jul 2023 09:43:05 +0000
Received: by outflank-mailman (input) for mailman id 563064;
 Thu, 13 Jul 2023 09:43:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJsqm-00089R-34
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 09:43:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJsql-0004Ww-6c; Thu, 13 Jul 2023 09:43:03 +0000
Received: from [15.248.2.150] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJsql-00028h-0D; Thu, 13 Jul 2023 09:43:03 +0000
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
	bh=VDTftAUGfVfdWCue+V47lISMjulisJSRWjxTzf9wXfA=; b=1pWwKEAiQKq5XzsHqE7vz/p7Oz
	b2CiDD7JfWEqHc8EYS8y854Hlt4sasqftqgHAwKaMq0cxhwwIyuE2pMMvt8a5M0f+m0h6aTazvI6D
	QlZMrAEzjd4LD2KKpVDU4b5/pVBIu/8bYf1EtEVHVGUuSEggUJf8m9rSheqI9E9s8eKE=;
Message-ID: <ca31c7aa-1879-a196-ace0-4418d8a5b0c9@xen.org>
Date: Thu, 13 Jul 2023 10:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

Title: IMO, Your patch doesn't do any refactor. Instead, it add support 
for polling when using the DT.

On 13/07/2023 10:30, Oleksii Kurochko wrote:
> In ns16550_init_postirq() there is the following check:
>      if ( uart->irq > 0 )
>      {
>          uart->irqaction.handler = ns16550_interrupt;
>          uart->irqaction.name    = "ns16550";
>          uart->irqaction.dev_id  = port;
>          if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
>              printk("ERROR: Failed to allocate ns16550 IRQ %d\n", uart->irq);
>      }
> 
> Thereby to have ns16550 work in polling mode uart->irq, should be equal to 0.
> 
> So it is needed to relax the following check in ns16550_uart_dt_init():
>      res = platform_get_irq(dev, 0);
>      if ( ! res )
>          return -EINVAL;
>      uart->irq = res;
> If 'res' equals to -1 then polling mode should be used instead of return
> -EINVAL.

This commit message has a bit too much code in it for me taste. I don't 
think it is necessary to quote the code. Instead, you can explain the 
following:

  * Why you want to support polling
  * Why this is valid to have a node without interrupts (add a reference 
to the bindings)
  * That polling is indicated by using 'irq = 0'. I would consider to 
provide a define (e.g NO_IRQ_POLL) to make it more clearer.

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/drivers/char/ns16550.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 2aed6ec707..f30f10d175 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1791,8 +1791,16 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>       }
>   
>       res = platform_get_irq(dev, 0);
> -    if ( ! res )
> -        return -EINVAL;
> +    if ( res == -1 )

Why do you check explicitely for -1 instead of < 0? Also, the behavior 
is somewhat change now. Before, we would return -EINVAL when res equals 
0. Can you explain in the commit message why this is done?

> +    {
> +        printk("ns1650: polling will be used\n");
> +        /*
> +         * There is the check 'if ( uart->irq > 0 )' in ns16550_init_postirq().
> +         * If the check is true then interrupt mode will be used otherwise
> +         * ( when irq = 0 )polling.
> +         */

Similar remark to the commit message. You could write:

"If the node doesn't have any interrupt, then it means the driver will 
want to using polling."

> +        res = 0;
> +    }
>       uart->irq = res;
>   
>       uart->dw_usr_bsy = dt_device_is_compatible(dev, "snps,dw-apb-uart");

Cheers,

-- 
Julien Grall

