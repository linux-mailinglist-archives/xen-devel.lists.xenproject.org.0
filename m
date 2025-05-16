Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89D1ABA628
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987683.1372896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG44o-0002Dd-FC; Fri, 16 May 2025 23:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987683.1372896; Fri, 16 May 2025 23:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG44o-0002Ae-BZ; Fri, 16 May 2025 23:02:50 +0000
Received: by outflank-mailman (input) for mailman id 987683;
 Fri, 16 May 2025 23:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uG44n-0001yQ-GG
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:02:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a51b98-32a9-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:02:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECC6DA4E3A0;
 Fri, 16 May 2025 23:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28325C4CEE4;
 Fri, 16 May 2025 23:02:46 +0000 (UTC)
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
X-Inumbo-ID: e2a51b98-32a9-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747436567;
	bh=0q5vKVy/f59Np49UUn8XheEyTrFnrZAHgxEm7gLkGW8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L7re55XFsrq+PO4oM5dklPQPXeuiDfc7iSk0K3FVbFchaOn5IhvBWfxWIE8QTKUy7
	 72Y42B1YoK7SHuASwDrZw+QExXnaiv2rGIbp0z1evQKkgOf4OodLSOHz9/2otyshME
	 pQBqYrO8uhWqXNTRCNWrAROhA2ODJiICYvOGBseq1qwUG9Vpog92tdPaG6QbGXh1uj
	 eDOTVJryXToZPCesnaIZwIMtPsbuPTIKgTpR4kQVuxTQ+TCM54cC6ni2V6SRrwbaUX
	 fhsI5ZU016P7kxJydbVcOZBvznrasSYfMh7GyS7XDUe4X461MefDGgUsmVyvJPnD1v
	 qA5xWAVhFzNow==
Date: Fri, 16 May 2025 16:02:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 2/3] xen/console: introduce console_send()
In-Reply-To: <20250516013508.1144162-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505161602190.145034@ubuntu-linux-20-04-desktop>
References: <20250516013508.1144162-1-dmukhin@ford.com> <20250516013508.1144162-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> guest_console_write() duplicates the code from __putstr(), eliminate code
> duplication.
> 
> Introduce console_send() for sending a message on console devices.
> 
> Also, introduce internal console flags to control which console devices
> should be used.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v3:
> - renamed console_puts() to console_send()
> ---
>  xen/drivers/char/console.c | 131 +++++++++++++++++++++++--------------
>  1 file changed, 82 insertions(+), 49 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index b4757844e6..3420e9630a 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -41,6 +41,28 @@
>  #include <asm/vpl011.h>
>  #endif
>  
> +/* Internal console flags. */
> +enum {
> +    CONSOLE_SERIAL          = BIT(0, U),    /* Use serial device. */
> +    CONSOLE_PV              = BIT(1, U),    /* Use PV console. */
> +    CONSOLE_VIDEO           = BIT(2, U),    /* Use video device. */
> +    CONSOLE_DEBUG           = BIT(3, U),    /* Use debug device. */
> +    CONSOLE_RING            = BIT(4, U),    /* Use console ring. */
> +    CONSOLE_RING_VIRQ       = BIT(5, U),    /* Use console ring VIRQ. */
> +
> +    /* Default console flags. */
> +    CONSOLE_DEFAULT         = CONSOLE_SERIAL |
> +                              CONSOLE_PV |
> +                              CONSOLE_VIDEO |
> +                              CONSOLE_RING_VIRQ |
> +                              CONSOLE_DEBUG,
> +
> +    /* Use all known console devices. */
> +    CONSOLE_ALL             = CONSOLE_DEFAULT | CONSOLE_RING,
> +};
> +
> +static void console_send(const char *str, size_t len, unsigned int flags);
> +
>  /* console: comma-separated list of console outputs. */
>  static char __initdata opt_console[30] = OPT_CONSOLE_STR;
>  string_param("console", opt_console);
> @@ -428,9 +450,6 @@ void console_serial_puts(const char *s, size_t nr)
>          serial_steal_fn(s, nr);
>      else
>          serial_puts(sercon_handle, s, nr);
> -
> -    /* Copy all serial output into PV console */
> -    pv_console_puts(s, nr);
>  }
>  
>  static void cf_check dump_console_ring_key(unsigned char key)
> @@ -464,8 +483,7 @@ static void cf_check dump_console_ring_key(unsigned char key)
>          c += len;
>      }
>  
> -    console_serial_puts(buf, sofar);
> -    video_puts(buf, sofar);
> +    console_send(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
>  
>      free_xenheap_pages(buf, order);
>  }
> @@ -614,11 +632,69 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
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
> + * Send a message on console device(s).
> + *
> + * That will handle all possible scenarios working w/ console
> + * - physical console (serial console, VGA console (x86 only));
> + * - PV console;
> + * - debug console (x86 only): debug I/O port or __HYPERVISOR_console_io
> + *   hypercall;
> + * - console ring.
> + */
> +static void console_send(const char *str, size_t len, unsigned int flags)
> +{
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
> +
> +    if ( flags & CONSOLE_RING_VIRQ )
> +        tasklet_schedule(&conring_tasklet);
> +}
> +
> +static inline void __putstr(const char *str)
> +{
> +    unsigned int flags = CONSOLE_ALL;
> +
> +    ASSERT(rspin_is_locked(&console_lock));
> +
> +    if ( conring_no_notify )
> +        flags &= ~CONSOLE_RING_VIRQ;
> +
> +    console_send(str, strlen(str), flags);
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
> @@ -636,26 +712,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
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
> -            {
> -                conring_puts(kbuf, kcount);
> -                tasklet_schedule(&conring_tasklet);
> -            }
> -
> +            console_send(kbuf, kcount, flags);
>              nrspin_unlock_irq(&console_lock);
>          }
>          else
> @@ -756,30 +813,6 @@ long do_console_io(
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
> -    if ( !conring_no_notify )
> -        tasklet_schedule(&conring_tasklet);
> -}
> -
>  static int printk_prefix_check(char *p, char **pp)
>  {
>      int loglvl = -1;
> -- 
> 2.34.1
> 
> 

