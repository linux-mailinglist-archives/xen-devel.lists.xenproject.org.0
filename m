Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B8A9D5DE
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968767.1358239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Rpw-0008L2-16; Fri, 25 Apr 2025 22:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968767.1358239; Fri, 25 Apr 2025 22:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Rpv-0008Is-UX; Fri, 25 Apr 2025 22:47:59 +0000
Received: by outflank-mailman (input) for mailman id 968767;
 Fri, 25 Apr 2025 22:47:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u8Rpv-0008Im-CC
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:47:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54de4543-2227-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 00:47:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47FD05C6FD0;
 Fri, 25 Apr 2025 22:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E033BC4CEE4;
 Fri, 25 Apr 2025 22:47:54 +0000 (UTC)
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
X-Inumbo-ID: 54de4543-2227-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745621276;
	bh=4DyDDs99NXZezut37j9Az93ySzhfwA7FhvkGEOvQzW0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qvR3/UEaMc2Apwv5qgr64ERv6f1dVCTHMT4e2shb8VS3G0plqAnKspCThyYU7cW0g
	 aolDrZ7WecxQXqKK6H9zFe6WF66St7VTIX7QJXpqj4SKKxNdLjoWqntDsVlsBYb3jc
	 VhZkRacwq6P39x48DuyjvJebafLJRdVwNT31GhN5iZLc2hszL8g6rfm9EWundVJ4En
	 xK0eB8q79u+fXl3GA+LlNtRgQtjCB91p96UdI+20Ya03fULhc70caaLnV6qsYIiKXW
	 MQ10VWi8ip7IOtTxSNzBERjFJUi4dJjITjHj1KDxR/dac59p8XRftetTyMxkiroxr9
	 2ALoSiGwpGXcw==
Date: Fri, 25 Apr 2025 15:47:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 2/3] xen/console: introduce console_puts()
In-Reply-To: <20250403000604.169619-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504251545480.785180@ubuntu-linux-20-04-desktop>
References: <20250403000604.169619-1-dmukhin@ford.com> <20250403000604.169619-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> guest_console_write() duplicates the code from __putstr(), eliminate code
> duplication.
> 
> Introduce console_puts() for writing a buffer to console devices.
> 
> Also, introduce internal console flags to control which console devices
> should be used.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 112 ++++++++++++++++++++++---------------
>  1 file changed, 66 insertions(+), 46 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index aaa97088aa..2618c2e47d 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -41,6 +41,20 @@
>  #include <asm/vpl011.h>
>  #endif
>  
> +/* Internal console flags. */
> +enum {
> +    CONSOLE_SERIAL  = BIT(0, U),    /* Use serial device. */
> +    CONSOLE_PV      = BIT(1, U),    /* Use PV console. */
> +    CONSOLE_VIDEO   = BIT(2, U),    /* Use video device. */
> +    CONSOLE_DEBUG   = BIT(3, U),    /* Use debug device. */
> +    CONSOLE_RING    = BIT(4, U),    /* Use console ring. */
> +    CONSOLE_DEFAULT = CONSOLE_SERIAL | CONSOLE_PV | CONSOLE_VIDEO |
> +                      CONSOLE_DEBUG,
> +    CONSOLE_ALL     = CONSOLE_DEFAULT | CONSOLE_RING,
> +};
> +
> +static void console_puts(const char *str, size_t len, unsigned int flags);
> +
>  /* console: comma-separated list of console outputs. */
>  static char __initdata opt_console[30] = OPT_CONSOLE_STR;
>  string_param("console", opt_console);
> @@ -338,8 +352,6 @@ static bool console_locks_busted;
>  
>  static void conring_puts(const char *str, size_t len)
>  {
> -    ASSERT(rspin_is_locked(&console_lock));
> -
>      while ( len-- )
>          conring[CONRING_IDX_MASK(conringp++)] = *str++;
>  
> @@ -432,9 +444,6 @@ void console_serial_puts(const char *s, size_t nr)
>          serial_steal_fn(s, nr);
>      else
>          serial_puts(sercon_handle, s, nr);
> -
> -    /* Copy all serial output into PV console */
> -    pv_console_puts(s, nr);
>  }
>  
>  static void cf_check dump_console_ring_key(unsigned char key)
> @@ -468,8 +477,7 @@ static void cf_check dump_console_ring_key(unsigned char key)
>          c += len;
>      }
>  
> -    console_serial_puts(buf, sofar);
> -    video_puts(buf, sofar);
> +    console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);

Actually I take back the R-b. It looks like this change is breaking
because console_puts now requires the console_lock to be held, while
here the console_lock is not held.

If I am not mistaken if you try to use the 'w' key with this patch
applied you'll hit the ASSERT at the beginning of console_puts


>      free_xenheap_pages(buf, order);
>  }
> @@ -618,11 +626,61 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
>  }
>  #endif
>  
> +static inline void console_debug_puts(const char *str, size_t len)
> +{
> +#ifdef CONFIG_X86
> +    if ( opt_console_xen )
> +    {
> +        if ( xen_guest )
> +            xen_hypercall_console_write(str, len);
> +        else
> +            xen_console_write_debug_port(str, len);
> +    }
> +#endif
> +}
> +
> +/*
> + * Write buffer to all enabled console devices.
> + *
> + * That will handle all possible scenarios working w/ console
> + * - physical console (serial console, VGA console (x86 only));
> + * - PV console;
> + * - debug console (x86 only): debug I/O port or __HYPERVISOR_console_io
> + *   hypercall;
> + * - console ring.
> + */
> +static void console_puts(const char *str, size_t len, unsigned int flags)
> +{
> +    ASSERT(rspin_is_locked(&console_lock));
> +
> +    if ( flags & CONSOLE_SERIAL )
> +        console_serial_puts(str, len);
> +
> +    if ( flags & CONSOLE_PV )
> +        pv_console_puts(str, len);
> +
> +    if ( flags & CONSOLE_VIDEO )
> +        video_puts(str, len);
> +
> +    if ( flags & CONSOLE_DEBUG )
> +        console_debug_puts(str, len);
> +
> +    if ( flags & CONSOLE_RING )
> +        conring_puts(str, len);
> +}
> +
> +static inline void __putstr(const char *str)
> +{
> +    console_puts(str, strlen(str), CONSOLE_ALL);
> +}
> +
>  static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>                                  unsigned int count)
>  {
>      char kbuf[128];
>      unsigned int kcount = 0;
> +    unsigned int flags = opt_console_to_ring
> +                         ? CONSOLE_ALL : CONSOLE_DEFAULT;
>      struct domain *cd = current->domain;
>  
>      while ( count > 0 )
> @@ -640,23 +698,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          {
>              /* Use direct console output as it could be interactive */
>              nrspin_lock_irq(&console_lock);
> -
> -            console_serial_puts(kbuf, kcount);
> -            video_puts(kbuf, kcount);
> -
> -#ifdef CONFIG_X86
> -            if ( opt_console_xen )
> -            {
> -                if ( xen_guest )
> -                    xen_hypercall_console_write(kbuf, kcount);
> -                else
> -                    xen_console_write_debug_port(kbuf, kcount);
> -            }
> -#endif
> -
> -            if ( opt_console_to_ring )
> -                conring_puts(kbuf, kcount);
> -
> +            console_puts(kbuf, kcount, flags);
>              nrspin_unlock_irq(&console_lock);
>          }
>          else
> @@ -757,28 +799,6 @@ long do_console_io(
>   * *****************************************************
>   */
>  
> -static void __putstr(const char *str)
> -{
> -    size_t len = strlen(str);
> -
> -    ASSERT(rspin_is_locked(&console_lock));
> -
> -    console_serial_puts(str, len);
> -    video_puts(str, len);
> -
> -#ifdef CONFIG_X86
> -    if ( opt_console_xen )
> -    {
> -        if ( xen_guest )
> -            xen_hypercall_console_write(str, len);
> -        else
> -            xen_console_write_debug_port(str, len);
> -    }
> -#endif
> -
> -    conring_puts(str, len);
> -}
> -
>  static int printk_prefix_check(char *p, char **pp)
>  {
>      int loglvl = -1;
> -- 
> 2.34.1
> 
> 

