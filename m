Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2958A9D5F1
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968779.1358249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Rv8-00026u-J1; Fri, 25 Apr 2025 22:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968779.1358249; Fri, 25 Apr 2025 22:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Rv8-00025B-Fr; Fri, 25 Apr 2025 22:53:22 +0000
Received: by outflank-mailman (input) for mailman id 968779;
 Fri, 25 Apr 2025 22:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u8Rv7-000255-L5
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:53:21 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 103aa2cf-2228-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 00:53:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E98B61136;
 Fri, 25 Apr 2025 22:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A16C4CEE4;
 Fri, 25 Apr 2025 22:53:09 +0000 (UTC)
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
X-Inumbo-ID: 103aa2cf-2228-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745621590;
	bh=yTtrrDaW1P20Qbv4JoXB9aTWanUig3L3OgoFL4bbTyY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oniAvwowpn/fS0qazRJu63/n3fNsAmWb6qTuWW1DkS4riMRWLGInd1RuHhkf7AEPr
	 jQlUTXtA/LeLUeMayQimyt5iRtvykFrwCJFw9rl1eJWcBXDVnT5URusZf9o41V32xu
	 meioYzVRUX+gOq0xwUCnv0xLbP5Uy3XJN9y8+BlHeqsQDRLI6BUwRdhR3O0eIi6hsZ
	 4hl+F5JSrLwjfgof7B690zTFmCgCD8m13YVL3ax0isrXdop2YWbA77TfNkHyEPm66i
	 fmOgm9Fosnkpg7PfqLdY9I9lclRnIXDF4lzZRWvGBY7qsXEI/rVaYZNcliXxsbVBZv
	 nzUlNexAESvRQ==
Date: Fri, 25 Apr 2025 15:53:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 3/3] xen/console: introduce conring_flush()
In-Reply-To: <20250403000604.169619-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504251552180.785180@ubuntu-linux-20-04-desktop>
References: <20250403000604.169619-1-dmukhin@ford.com> <20250403000604.169619-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce conring_flush() to ensure all messages kept in the internal
> console ring are sent to all physical consoles (serial, VGA (x86))
> after their initialization is completed.
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/184
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> The patch conflicts with
>   https://lore.kernel.org/xen-devel/20250331230508.440198-7-dmukhin@ford.com/
> in console_init_preirq()
> ---
>  xen/drivers/char/console.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 2618c2e47d..18eb66df89 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -446,24 +446,22 @@ void console_serial_puts(const char *s, size_t nr)
>          serial_puts(sercon_handle, s, nr);
>  }
>  
> -static void cf_check dump_console_ring_key(unsigned char key)
> +/*
> + * Flush contents of the conring to the physical console devices.
> + */
> +static int conring_flush(void)
>  {
>      uint32_t idx, len, sofar, c;
>      unsigned int order;
>      char *buf;
> +    unsigned long flags;
>  
> -    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
> -
> -    /* create a buffer in which we'll copy the ring in the correct
> -       order and NUL terminate */
>      order = get_order_from_bytes(conring_size + 1);
>      buf = alloc_xenheap_pages(order, 0);
>      if ( buf == NULL )
> -    {
> -        printk("unable to allocate memory!\n");
> -        return;
> -    }
> +        return -ENOMEM;
>  
> +    flags = console_lock_recursive_irqsave();

This patch is OK but it looks like this bit might have to change to
rebase on top of a modified patch #2


>      c = conringc;
>      sofar = 0;
>      while ( (c != conringp) )
> @@ -478,8 +476,21 @@ static void cf_check dump_console_ring_key(unsigned char key)
>      }
>  
>      console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
> +    console_unlock_recursive_irqrestore(flags);
>  
>      free_xenheap_pages(buf, order);
> +
> +    return 0;
> +}
> +
> +static void cf_check conring_dump_keyhandler(unsigned char key)
> +{
> +    int rc;
> +
> +    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
> +    rc = conring_flush();
> +    if ( rc )
> +        printk("failed to dump console ring buffer: %d\n", rc);
>  }
>  
>  /*
> @@ -1044,6 +1055,9 @@ void __init console_init_preirq(void)
>      serial_set_rx_handler(sercon_handle, serial_rx);
>      pv_console_set_rx_handler(serial_rx);
>  
> +    /* NB: send conring contents to all enabled physical consoles, if any */
> +    conring_flush();
> +
>      /* HELLO WORLD --- start-of-day banner text. */
>      nrspin_lock(&console_lock);
>      __putstr(xen_banner());
> @@ -1134,7 +1148,7 @@ void __init console_endboot(void)
>      if ( opt_conswitch[1] == 'x' )
>          console_rx = max_console_rx;
>  
> -    register_keyhandler('w', dump_console_ring_key,
> +    register_keyhandler('w', conring_dump_keyhandler,
>                          "synchronously dump console ring buffer (dmesg)", 0);
>      register_irq_keyhandler('+', &do_inc_thresh,
>                              "increase log level threshold", 0);
> -- 
> 2.34.1
> 
> 

