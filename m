Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B65ADDBE3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 21:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018468.1395359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRbXG-0001hP-39; Tue, 17 Jun 2025 18:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018468.1395359; Tue, 17 Jun 2025 18:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRbXG-0001g0-01; Tue, 17 Jun 2025 18:59:54 +0000
Received: by outflank-mailman (input) for mailman id 1018468;
 Tue, 17 Jun 2025 18:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Ip9=ZA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uRbXC-0001fu-9G
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 18:59:52 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c89369b-4bad-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 20:59:46 +0200 (CEST)
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
X-Inumbo-ID: 3c89369b-4bad-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750186785; x=1750445985;
	bh=YebZoXWCGUK9x54d9Bs/zn4kf8VJfonuAGPBWlMfrgE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=I4UqD5U6bmYvOb9j34Tm8P5MVflSLEoKZMa0dZwQX0bpp1oVgbsiiAaaz1Y56HHTG
	 bSn+TGs+itxqf8eBaTiImqLfzOgxaLrX3xx46PtKFjdkXBktiQJ/RhU5GwvdQuSWyE
	 tPOXaf7IXu5LBbjTjq2J6HvKGaUeLewwWyM//R9vC9o8zjglzYhUyOd6KCLajWjWTB
	 5BiguvVnc7YknfAacofGfd9CjDRdGYsbASXasQk6YQiMUNtQv1LFeNNHa/F3TZ8jJH
	 APbiWfY+C5E118KVXafJQAEv5JzbAiCx1He2zGmVM4pmBzLZPma4gGzeMUwc8EstBi
	 k+8gibnrWELMQ==
Date: Tue, 17 Jun 2025 18:59:41 +0000
To: Michal Orzel <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] console: Do not duplicate early printk messages on conring flush
Message-ID: <aFG7F6vWiQdOJGpO@kraken>
In-Reply-To: <20250617071940.10445-1-michal.orzel@amd.com>
References: <20250617071940.10445-1-michal.orzel@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 419bcdb39540859e55922c88db2fc7af8e49d16b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 09:19:40AM +0200, Michal Orzel wrote:
> Commit f6d1bfa16052 introduced flushing conring in console_init_preirq().
> However, when CONFIG_EARLY_PRINTK is enabled, the early boot messages
> had already been sent to serial before main console initialization. This
> results in all the early boot messages being duplicated.
>=20
> Change conring_flush() to accept argument listing devices to which to
> flush conring. We don't want to send to serial at console initialization
> when using early printk, but we want these messages to be send at conring
> dump triggered by keyhandler.
>=20
> Fixes: f6d1bfa16052 ("xen/console: introduce conring_flush()")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
>  xen/drivers/char/console.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 9a9836ba91e7..5879e31786ba 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -453,9 +453,9 @@ void console_serial_puts(const char *s, size_t nr)
>  }
>=20
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
>          c +=3D len;
>      }
>=20
> -    console_send(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV=
);
> +    console_send(buf, sofar, flags);
>=20
>      free_xenheap_pages(buf, order);
>=20
> @@ -491,7 +491,7 @@ static void cf_check conring_dump_keyhandler(unsigned=
 char key)
>      int rc;
>=20
>      printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key)=
;
> -    rc =3D conring_flush();
> +    rc =3D conring_flush(CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
>      if ( rc )
>          printk("failed to dump console ring buffer: %d\n", rc);
>  }
> @@ -1042,6 +1042,7 @@ void __init console_init_preirq(void)
>  {
>      char *p;
>      int sh;
> +    unsigned int flags =3D CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV;
>=20
>      serial_init_preirq();
>=20
> @@ -1084,8 +1085,15 @@ void __init console_init_preirq(void)
>      serial_set_rx_handler(sercon_handle, serial_rx);
>      pv_console_set_rx_handler(serial_rx);
>=20
> -    /* NB: send conring contents to all enabled physical consoles, if an=
y */
> -    conring_flush();
> +    /*
> +     * NB: send conring contents to all enabled physical consoles, if an=
y.
> +     * Skip serial if CONFIG_EARLY_PRINTK is enabled, which means the ea=
rly
> +     * messages have already been sent to serial.
> +     */
> +    if ( IS_ENABLED(CONFIG_EARLY_PRINTK) )
> +        flags &=3D ~CONSOLE_SERIAL;
> +
> +    conring_flush(flags);
>=20
>      /* HELLO WORLD --- start-of-day banner text. */
>      nrspin_lock(&console_lock);
> --
> 2.25.1
>=20
>=20


