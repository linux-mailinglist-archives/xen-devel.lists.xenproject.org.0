Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F0ADDAFE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 19:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018437.1395339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaZf-0001gf-I8; Tue, 17 Jun 2025 17:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018437.1395339; Tue, 17 Jun 2025 17:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaZf-0001eq-FX; Tue, 17 Jun 2025 17:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1018437;
 Tue, 17 Jun 2025 17:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRaZe-0001eQ-Nw
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 17:58:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a487654b-4ba4-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 19:58:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4C65E5C67E1;
 Tue, 17 Jun 2025 17:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B00C4CEE3;
 Tue, 17 Jun 2025 17:58:13 +0000 (UTC)
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
X-Inumbo-ID: a487654b-4ba4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750183094;
	bh=2DmOSNKBo5Sbby04E2nvUQ2EOWwkSnyxYx/uVcxEfKo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D06oi1zG7+mz+MV4Vlql8zgSpu346pUeQwUja7MBVIEnk06lxUO0jQ2GLY4eqxgw/
	 jBHx7it+/uhjX066wtTAUGve6pNQmMVrKaskARWyxQ9ReGZp53nuzqwCJ+heYdlEqn
	 xWR2yCWBoibnC5NoSjUeB7LYHNsZNYXKvsBV2aOMz5oq1Vcmoi2q7tSjJY1G7lnIOl
	 SEp7nsyZXWhVd4lmxvFY3U/afADTAqRcBcTKwyzoqIu4WotJQcu3Zucb69+rt/6+0i
	 wSJ2hrgKBmMTxX/dTC7VMkN29CbdWYXTKIK6BlTnQD6heMQzvafcAf+V500p1kqVCa
	 T+ne2AUJE35Eg==
Date: Tue, 17 Jun 2025 10:58:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] console: Do not duplicate early printk messages on
 conring flush
In-Reply-To: <20250617071940.10445-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506171058030.1384757@ubuntu-linux-20-04-desktop>
References: <20250617071940.10445-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Michal Orzel wrote:
> Commit f6d1bfa16052 introduced flushing conring in console_init_preirq().
> However, when CONFIG_EARLY_PRINTK is enabled, the early boot messages
> had already been sent to serial before main console initialization. This
> results in all the early boot messages being duplicated.
> 
> Change conring_flush() to accept argument listing devices to which to
> flush conring. We don't want to send to serial at console initialization
> when using early printk, but we want these messages to be send at conring
> dump triggered by keyhandler.
> 
> Fixes: f6d1bfa16052 ("xen/console: introduce conring_flush()")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/char/console.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 9a9836ba91e7..5879e31786ba 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -453,9 +453,9 @@ void console_serial_puts(const char *s, size_t nr)
>  }
>  
>  /*
> - * Flush contents of the conring to the physical console devices.
> + * Flush contents of the conring to the selected console devices.
>   */
> -static int conring_flush(void)
> +static int conring_flush(unsigned int flags)
>  {
>      uint32_t idx, len, sofar, c;
>      unsigned int order;
> @@ -479,7 +479,7 @@ static int conring_flush(void)
>          c += len;
>      }
>  
> -    console_send(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
> +    console_send(buf, sofar, flags);
>  
>      free_xenheap_pages(buf, order);
>  
> @@ -491,7 +491,7 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
>      int rc;
>  
>      printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
> -    rc = conring_flush();
> +    rc = conring_flush(CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
>      if ( rc )
>          printk("failed to dump console ring buffer: %d\n", rc);
>  }
> @@ -1042,6 +1042,7 @@ void __init console_init_preirq(void)
>  {
>      char *p;
>      int sh;
> +    unsigned int flags = CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV;
>  
>      serial_init_preirq();
>  
> @@ -1084,8 +1085,15 @@ void __init console_init_preirq(void)
>      serial_set_rx_handler(sercon_handle, serial_rx);
>      pv_console_set_rx_handler(serial_rx);
>  
> -    /* NB: send conring contents to all enabled physical consoles, if any */
> -    conring_flush();
> +    /*
> +     * NB: send conring contents to all enabled physical consoles, if any.
> +     * Skip serial if CONFIG_EARLY_PRINTK is enabled, which means the early
> +     * messages have already been sent to serial.
> +     */
> +    if ( IS_ENABLED(CONFIG_EARLY_PRINTK) )
> +        flags &= ~CONSOLE_SERIAL;
> +
> +    conring_flush(flags);
>  
>      /* HELLO WORLD --- start-of-day banner text. */
>      nrspin_lock(&console_lock);
> -- 
> 2.25.1
> 

