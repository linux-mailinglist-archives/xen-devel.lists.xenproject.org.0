Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BDA9FDC7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 01:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971291.1359751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Xxl-0005Df-Qh; Mon, 28 Apr 2025 23:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971291.1359751; Mon, 28 Apr 2025 23:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Xxl-0005C6-Nz; Mon, 28 Apr 2025 23:32:37 +0000
Received: by outflank-mailman (input) for mailman id 971291;
 Mon, 28 Apr 2025 23:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9Xxk-0005By-1w
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 23:32:36 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f332e08-2489-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 01:32:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 50744614AE;
 Mon, 28 Apr 2025 23:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50BDC4CEE4;
 Mon, 28 Apr 2025 23:32:30 +0000 (UTC)
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
X-Inumbo-ID: 0f332e08-2489-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745883152;
	bh=9agsQy7PpzKI1uD0DLWtZbEGAstvnzVTkHiGr2/7os8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mOJlBRGKKOyIQ/rxYujlhrJkN+Jxm5e09cYAnoobwo+2Jw8wvU4nDTgFCyzIxq4tv
	 rgO8h5mAhQkH+aP0ivsGly9rPxTZyV0ubyoh1o+TK/u+9n1KOLHNmNUGcwGm2PnxpT
	 J71+QJAQ1S+XRM6+Q3taEe42/4mWDYki2BXz0MvxQRpS8IydxfYYcuQSdKX+6cCqnr
	 tK7qRFKhbFaH8bzcPb7nd94T8IyOih8a2D3BKOrCGJwTN0SSW4uH8uKgJ03ETJ77Jh
	 XLWRK8JYW34eD4MnVfS6F1dKmRp/jwFfXExtH2moVKqyXkilEAgmF88/o2LpdI034X
	 z3gIDeShXVCNA==
Date: Mon, 28 Apr 2025 16:32:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 2/3] xen/console: introduce console_puts()
In-Reply-To: <20250426185021.100646-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504281632200.785180@ubuntu-linux-20-04-desktop>
References: <20250426185021.100646-1-dmukhin@ford.com> <20250426185021.100646-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Apr 2025, dmkhn@proton.me wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes v1->v2:
> - fixed locking in dump_console_ring_key()
> ---
>  xen/drivers/char/console.c | 117 ++++++++++++++++++++++---------------
>  1 file changed, 71 insertions(+), 46 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index aaa97088aa..8f882a47d1 100644
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
> @@ -442,6 +451,7 @@ static void cf_check dump_console_ring_key(unsigned char key)
>      uint32_t idx, len, sofar, c;
>      unsigned int order;
>      char *buf;
> +    unsigned long flags;
>  
>      printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
>  
> @@ -455,6 +465,8 @@ static void cf_check dump_console_ring_key(unsigned char key)
>          return;
>      }
>  
> +    flags = console_lock_recursive_irqsave();
> +
>      c = conringc;
>      sofar = 0;
>      while ( (c != conringp) )
> @@ -468,8 +480,9 @@ static void cf_check dump_console_ring_key(unsigned char key)
>          c += len;
>      }
>  
> -    console_serial_puts(buf, sofar);
> -    video_puts(buf, sofar);
> +    console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
> +
> +    console_unlock_recursive_irqrestore(flags);
>  
>      free_xenheap_pages(buf, order);
>  }
> @@ -618,11 +631,61 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
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
> @@ -640,23 +703,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
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
> @@ -757,28 +804,6 @@ long do_console_io(
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

