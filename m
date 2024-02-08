Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763E84EA16
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 22:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678472.1055793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYBaY-0000Oi-LQ; Thu, 08 Feb 2024 21:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678472.1055793; Thu, 08 Feb 2024 21:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYBaY-0000Mx-Hk; Thu, 08 Feb 2024 21:05:42 +0000
Received: by outflank-mailman (input) for mailman id 678472;
 Thu, 08 Feb 2024 21:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cv+=JR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rYBaX-0000Mr-Dc
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 21:05:41 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdff2921-c6c5-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 22:05:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 36FE3CE1E5A;
 Thu,  8 Feb 2024 21:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BD0C433F1;
 Thu,  8 Feb 2024 21:05:31 +0000 (UTC)
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
X-Inumbo-ID: cdff2921-c6c5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707426332;
	bh=uXsBbejCKZT2gnWzgYDT9prt95WAobjzVIID+8hP2/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VkzE29WU6pxlECZMgFlcC+6TFZWyaluX3yvLieSujfVcaPXmJXaKlsuudNckYUGSw
	 Iln41SAvK//bZe3E0UnPhPVRR7fyzghTCk/l+IAKTp8rFe9LmVFVQm1t7jO2Z7WdCs
	 +GS0xlO2ZFm2YpZuz7LK1pyFKdnnBnS3/MfvubGg6em1a3nU27m6wZCbfKmKRESZHj
	 6yDRDS6p3qDIiTHawHFZDrNGN/+qOYe8yIJk8Z2VTAij1OfUzyHDdvxWyiHv74VSzC
	 8BrW3rTRqzdiY9QNLAKBPC7sDybXTYnYTrs8b9nf2rp59XO5udTErKFgBIW59tQyqb
	 9+Z/1A2mN7Anw==
Date: Thu, 8 Feb 2024 13:05:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/serial: Drop serial_{put,get}c
In-Reply-To: <20240208141601.78023-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402081305250.1925432@ubuntu-linux-20-04-desktop>
References: <20240208141601.78023-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Feb 2024, Michal Orzel wrote:
> After removal of gdbstub by commit d182f9feae6d ("x86: Remove gdbstub"),
> we no longer have users of serial_{put,get}c functions, so remove them.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/char/serial.c | 72 ---------------------------------------
>  xen/include/xen/serial.h  | 10 ------
>  2 files changed, 82 deletions(-)
> 
> diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> index 324024c29a10..93e217d34859 100644
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -196,36 +196,6 @@ static void __serial_putc(struct serial_port *port, char c)
>      }
>  }
>  
> -void serial_putc(int handle, char c)
> -{
> -    struct serial_port *port;
> -    unsigned long flags;
> -
> -    if ( handle == -1 )
> -        return;
> -
> -    port = &com[handle & SERHND_IDX];
> -    if ( !port->driver || !port->driver->putc )
> -        return;
> -
> -    spin_lock_irqsave(&port->tx_lock, flags);
> -
> -    if ( (c == '\n') && (handle & SERHND_COOKED) )
> -        __serial_putc(port, '\r' | ((handle & SERHND_HI) ? 0x80 : 0x00));
> -
> -    if ( handle & SERHND_HI )
> -        c |= 0x80;
> -    else if ( handle & SERHND_LO )
> -        c &= 0x7f;
> -
> -    __serial_putc(port, c);
> -
> -    if ( port->driver->flush )
> -        port->driver->flush(port);
> -
> -    spin_unlock_irqrestore(&port->tx_lock, flags);
> -}
> -
>  void serial_puts(int handle, const char *s, size_t nr)
>  {
>      struct serial_port *port;
> @@ -261,48 +231,6 @@ void serial_puts(int handle, const char *s, size_t nr)
>      spin_unlock_irqrestore(&port->tx_lock, flags);
>  }
>  
> -char serial_getc(int handle)
> -{
> -    struct serial_port *port;
> -    char c;
> -    unsigned long flags;
> -
> -    if ( handle == -1 )
> -        return '\0';
> -
> -    port = &com[handle & SERHND_IDX];
> -    if ( !port->driver || !port->driver->getc )
> -        return '\0';
> -
> -    do {
> -        for ( ; ; )
> -        {
> -            spin_lock_irqsave(&port->rx_lock, flags);
> -            
> -            if ( port->rxbufp != port->rxbufc )
> -            {
> -                c = port->rxbuf[mask_serial_rxbuf_idx(port->rxbufc++)];
> -                spin_unlock_irqrestore(&port->rx_lock, flags);
> -                break;
> -            }
> -            
> -            if ( port->driver->getc(port, &c) )
> -            {
> -                spin_unlock_irqrestore(&port->rx_lock, flags);
> -                break;
> -            }
> -
> -            spin_unlock_irqrestore(&port->rx_lock, flags);
> -
> -            cpu_relax();
> -            udelay(100);
> -        }
> -    } while ( ((handle & SERHND_LO) &&  (c & 0x80)) ||
> -              ((handle & SERHND_HI) && !(c & 0x80)) );
> -    
> -    return c & 0x7f;
> -}
> -
>  int __init serial_parse_handle(const char *conf)
>  {
>      int handle, flags = 0;
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 12ef24351d0f..7548bb73249b 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -112,19 +112,9 @@ void serial_endboot(void);
>  /* Takes a config string and creates a numeric handle on the COM port. */
>  int serial_parse_handle(const char *conf);
>  
> -/* Transmit a single character via the specified COM port. */
> -void serial_putc(int handle, char c);
> -
>  /* Transmit a string via the specified COM port. */
>  void serial_puts(int handle, const char *s, size_t nr);
>  
> -/*
> - * An alternative to registering a character-receive hook. This function
> - * will not return until a character is available. It can safely be
> - * called with interrupts disabled.
> - */
> -char serial_getc(int handle);
> -
>  /* Forcibly prevent serial lockup when the system is in a bad way. */
>  /* (NB. This also forces an implicit serial_start_sync()). */
>  void serial_force_unlock(int handle);
> -- 
> 2.25.1
> 

