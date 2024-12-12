Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A28F9EE481
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855732.1268558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgmy-0003sH-47; Thu, 12 Dec 2024 10:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855732.1268558; Thu, 12 Dec 2024 10:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgmy-0003pQ-1V; Thu, 12 Dec 2024 10:51:24 +0000
Received: by outflank-mailman (input) for mailman id 855732;
 Thu, 12 Dec 2024 10:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLgmw-0003ig-0n
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:51:22 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c1d663-b877-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:51:21 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3d479b1e6so577722a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:51:21 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm7176044a12.56.2024.12.12.02.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:51:20 -0800 (PST)
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
X-Inumbo-ID: 05c1d663-b877-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734000680; x=1734605480; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ia5fGrLJCCZZbPn6F1drPOFD+LT9NslQOlZL2Wxfma0=;
        b=KEAtdNvtWfmQWzkiz51vJI560ySzBdCzGXztHnWePUaDlrWCGhrMTA39JpOJjMxDlU
         of1oI/TeImJBOYIoebpOdh9AiJMB77m8nraiOh8DzSTEd+u4cH/8T9wbctid9eLMbzxn
         sINf8hs7bEAbeKzXmY2bcZrUdLkYqSBr/0q90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734000680; x=1734605480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia5fGrLJCCZZbPn6F1drPOFD+LT9NslQOlZL2Wxfma0=;
        b=Nrd2KyvRfmYEygkA+2FIlnSaQ0kz/3HaoE0WSw3pdtZwKPkGXk77FBtvVcQx8ldPj/
         CM4BTkyVnfiumEyAms+V0WBIypAK2bmdEF2YmSxwq8WhOj860d9B1Wzq0EmCnlj6e8M6
         4vYsvcVy7a/jzxqv1j+e9Ns96HxThfPdG0YrH1W/hiCQ2KXvCHsS7Ekan2dsYLkyUOna
         2EtVLF+kzL4YDdHtvfWQUC7es9CJoigOJsK6Setd/hrmbJTyGwBFJiptfWrqiCWsx36e
         yfNNk83UoeSWnAZKMdwqKyqqlK+8LdL9zXQkg4uQm1zMQxH6/T79Z4ImXCrOBkPdJLsG
         nh7g==
X-Gm-Message-State: AOJu0YyiO3oEkLjw1ZuYlTEns0NsG+XNujMcj0I/rMeSEKdSGRnjxrS1
	ui7r2DXh3mZ995IVoIgUY9jTqxJQLO1ZVub5+dz4/13fZ0GA2fCDL+GHYe0bYdY=
X-Gm-Gg: ASbGncse4yKDT22O+dpTwNy3XaV80gLy56gMXzXA0Y3r1nqLTVkYHzqma5AsHK4mKSF
	HWZqRhTKGFXyFukdTuU5qyqxFvwB9nkq5oNRfYhN25ZLhsESZcerpqW7r7gpUIje9ujdabvJykJ
	qKfNnpsmk1S7DgfPtts48Oqh9H4y5mX81M537zPIbuWEgCHIulcd1v7RuRY6/gtGC5BahbZXMB+
	JVYYyDifywA1+Ok4e9lS0AAEz/APDbU6IXSlaQu/fwonKuFN8DjCpTMGV+AVmGmlQ==
X-Google-Smtp-Source: AGHT+IFTRb2T6vw9Etj/GW7CZb6IcuT9AkFzoHjZ3J25ZUfnbKAA1rVsN1viT6swWWivdxgcUfH9Vg==
X-Received: by 2002:a05:6402:40c2:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5d4fa1b2a38mr1309519a12.32.1734000680425;
        Thu, 12 Dec 2024 02:51:20 -0800 (PST)
Date: Thu, 12 Dec 2024 11:51:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 22/35] xen/console: introduce
 handle_keypress_in_domain()
Message-ID: <Z1rAJwSJvD-6rtM7@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-22-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-22-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:52PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> With introduction of NS8250 emulator for x86, the logic of switching console
> focus gets more convoluted: HVM domain w/ NS8205 must be able to receive the
> physical console input for guest VM debugging.
> 
> Also, existing code does not honor `hardware_dom=` xen command line parameter
> (hardware domain ID does _not_ necessarily starts from 0).
> 
> Introduce handle_keypress_in_domain() to account for all scenarios of console
> input forwarding.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 72 +++++++++++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 6261bdb5a2ac1075bc89fa408c0fd6cfef380ae6..ce3639a4cdcda00ea63e3bf119bc3b242cbfdf6a 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -570,14 +570,16 @@ static void console_init_owner(void)
>      console_set_owner(domid);
>  }
>  
> -static void __serial_rx(char c)
> +static void handle_keypress_in_domain(struct domain *d, char c)
>  {
> -    switch ( console_owner )
> -    {
> -    case DOMID_XEN:
> -        return handle_keypress(c, false);
> +    int rc = 0;
>  
> -    case 0:
> +    /*
> +     * Deliver input to the hardware domain buffer.
> +     * NB: must be the first check: hardware domain may have emulated UART.
> +     */
> +    if ( d == hardware_domain )

is_hardware_domain(d)

> +    {
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
> @@ -590,34 +592,44 @@ static void __serial_rx(char c)
>           * getting stuck.
>           */
>          send_global_virq(VIRQ_CONSOLE);
> -        break;
> -
> -#ifdef CONFIG_SBSA_VUART_CONSOLE
> -    default:
> -    {
> -        struct domain *d = rcu_lock_domain_by_id(console_owner);
> -
> -        /*
> -         * If we have a properly initialized vpl011 console for the
> -         * domain, without a full PV ring to Dom0 (in that case input
> -         * comes from the PV ring), then send the character to it.
> -         */
> -        if ( d != NULL )
> -            vpl011_rx_char_xen(d, c);
> -        else
> -            printk("Cannot send chars to Dom%d: no UART available\n",
> -                   console_owner);
> -
> -        if ( d != NULL )
> -            rcu_unlock_domain(d);
> -
> -        break;
>      }
> +    /*
> +     * Deliver input to the emulated UART.
> +     */

For one-line comments you can use:
/* Deliver input to the emulated UART. */

I would however place the comment inside the `if` body.

> +    else if ( domain_has_vuart(d) )
> +    {
> +#if defined(CONFIG_SBSA_VUART_CONSOLE)
> +        rc = vpl011_rx_char_xen(d, c);
>  #endif

You can possibly make the preprocessor conditional also contain the
if condition itself?  As otherwise the if condition is dead code.

>      }
> -
> +    /*
> +     * Deliver input to the PV shim console.
> +     */
>      if ( consoled_is_enabled() )
> -        consoled_guest_tx(c);
> +        rc = consoled_guest_tx(c);
> +
> +    if ( rc && rc != -ENODEV )
> +        printk(KERN_WARNING "console input domain %d: not ready: %d\n",
> +               d->domain_id, rc);

XENLOG_ERR instead of KERN_WARNING, and use %pd to print domains, ie:

printk(XENLOG_ERR "%pd: delivery of console input failed: %d\n",
       d, rc);

And I wonder whether this should be printed just once per domain,
or whether the domain should be marked as not having a console
(is_console = false) after delivery of input keys failed.

Otherwise you could spam the console with such error messages on every
serial key press.

> +}
> +
> +static void __serial_rx(char c)
> +{
> +    struct domain *d;
> +
> +    if ( console_owner == DOMID_XEN )
> +    {
> +        handle_keypress(c, false);
> +        return;
> +    }
> +
> +    d = rcu_lock_domain_console_owner();
> +    if ( d == NULL )
> +        return;
> +
> +    handle_keypress_in_domain(d, c);

Is __serial_rx() the only caller of handle_keypress_in_domain() after
the series?  If so, I'm not sure it's worth placing this logic in a
separate function.

Thanks, Roger.

