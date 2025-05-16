Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D888ABA623
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987669.1372875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG42j-000135-Re; Fri, 16 May 2025 23:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987669.1372875; Fri, 16 May 2025 23:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG42j-00011e-Ot; Fri, 16 May 2025 23:00:41 +0000
Received: by outflank-mailman (input) for mailman id 987669;
 Fri, 16 May 2025 23:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uG42h-0000zu-KF
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:00:39 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b46d0e-32a9-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:00:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C138A4E493;
 Fri, 16 May 2025 23:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F14C4CEE4;
 Fri, 16 May 2025 23:00:35 +0000 (UTC)
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
X-Inumbo-ID: 94b46d0e-32a9-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747436436;
	bh=sm+D6mlO34imKeVXRJyE8Im9/JUApQb6eEdbreYNC8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OyiBNednOXRkNbT22I/DyQ4ZU+9YhsFKh/AgbWzkBnSNUe5dv3Ac8q/icWeucqf26
	 uW4duekP7LxeWoHt2gwhKT1DR19NPi7uYmaPoJDsis3DGg3dNVWcQXoLMVvjWluHF8
	 i2Adk5bLetHJP7glNUFxKFS6la60YJu+uLybogJdL0Vgg4L2BkrzodG4SZtIQBGqUU
	 OQg3+1oMZI/fuFCFpcIHvxb6G0qnTyivBST6nlNoLvWK7VWQxEBht5epmNpF1H8eMp
	 5Mt6jNfmImCd4HpBxGT8V0AjRz1tS6mSYbUree0nLE22WsNAQ1WRkbjEgc5PFLMird
	 Wp/7JGu5DR2Qw==
Date: Fri, 16 May 2025 16:00:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v3 2/3] xen/console: introduce console_puts()
In-Reply-To: <20250504181423.2302345-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505161600240.145034@ubuntu-linux-20-04-desktop>
References: <20250504181423.2302345-1-dmukhin@ford.com> <20250504181423.2302345-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 4 May 2025, dmkhn@proton.me wrote:
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
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v2:
> - added CONSOLE_RING_VIRQ flag
> - dropped locking changes
> ---
>  xen/drivers/char/console.c | 123 ++++++++++++++++++++++++-------------
>  1 file changed, 79 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 20504060cb..b788427aa5 100644
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
> +static void console_puts(const char *str, size_t len, unsigned int flags);
> +
>  /* console: comma-separated list of console outputs. */
>  static char __initdata opt_console[30] = OPT_CONSOLE_STR;
>  string_param("console", opt_console);
> @@ -431,9 +453,6 @@ void console_serial_puts(const char *s, size_t nr)
>          serial_steal_fn(s, nr);
>      else
>          serial_puts(sercon_handle, s, nr);
> -
> -    /* Copy all serial output into PV console */
> -    pv_console_puts(s, nr);
>  }
>  
>  static void cf_check dump_console_ring_key(unsigned char key)
> @@ -467,8 +486,7 @@ static void cf_check dump_console_ring_key(unsigned char key)
>          c += len;
>      }
>  
> -    console_serial_puts(buf, sofar);
> -    video_puts(buf, sofar);
> +    console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
>  
>      free_xenheap_pages(buf, order);
>  }
> @@ -617,11 +635,66 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
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
> +        conring_puts(str, len, !!(flags & CONSOLE_RING_VIRQ) );
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
> +    console_puts(str, strlen(str), flags);
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
> @@ -639,23 +712,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
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
> -                conring_puts(kbuf, kcount, true);
> -
> +            console_puts(kbuf, kcount, flags);
>              nrspin_unlock_irq(&console_lock);
>          }
>          else
> @@ -756,28 +813,6 @@ long do_console_io(
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
> -    conring_puts(str, len, !conring_no_notify);
> -}
> -
>  static int printk_prefix_check(char *p, char **pp)
>  {
>      int loglvl = -1;
> -- 
> 2.34.1
> 
> 

