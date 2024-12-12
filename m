Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163A9EE636
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855932.1268709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhvy-0003jN-Qe; Thu, 12 Dec 2024 12:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855932.1268709; Thu, 12 Dec 2024 12:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhvy-0003h3-Nk; Thu, 12 Dec 2024 12:04:46 +0000
Received: by outflank-mailman (input) for mailman id 855932;
 Thu, 12 Dec 2024 12:04:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLhvw-0003gx-Gs
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:04:44 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 424b7de2-b881-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 13:04:37 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa66e4d1d5aso83932966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:04:42 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa67d6fcd3dsm656070466b.80.2024.12.12.04.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:04:41 -0800 (PST)
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
X-Inumbo-ID: 424b7de2-b881-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734005082; x=1734609882; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CosiXLC70EQ5Hq7B/A6HMe8QGiCjRXU4Dc3u9daacOk=;
        b=DMKCoquugWO3XCs9MegSWXxdWoRNh8apoFI3mYUwPMcXJAbpX8szNH9Fnlly7W/MhS
         IkAdUK1PKCwGs23Sg+vywDbrMfR4BgVPhewhJf/FNZbnb+KkconqPEixtTjxy/Lz+6Zp
         nKev7HcZhMXf3/LvbJHmJiCgoh2mR7GELenZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005082; x=1734609882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CosiXLC70EQ5Hq7B/A6HMe8QGiCjRXU4Dc3u9daacOk=;
        b=lAocux+V7AcLxj8xWpF4t9tDXmOE0X0WeMbdaeTwqTmw7wubUi+C6NglgzpIZU0/Fo
         NWVBCzfcA7lUqkkXqio6t/QMqOMWJpPwPWjuS7qsUlp6ENgghYZTmujG8KLdL5TbnWjX
         2WtlUlCpiFmH1kR/7rFohwI9JYeihjIUeeTNTreeo7qL0ym3mSyLaCtANpO3V7FTDE2P
         ck/yNvJJl2p382DFycHUFVgflrFQQeTP1OrY59ScdYb0HhphRvkpCgvEYkRQ5d1ZHXus
         tIJWdN+cE0KWa7SbK1f3jzB0w6xKQYVTODyJxv1BhGzZDTZRTsACzo3FfArnUNEdkGpO
         690Q==
X-Gm-Message-State: AOJu0Yyzz2QIDDKmFjt5m9s4RyQ73ArDfodFtPZPhLWiMWEfjiviY6m2
	DGn917tIvXGrjKaFWrmfyQX0O2683m8K5gtP97rEut8eZGXpgCZx9VKsk78vkZE=
X-Gm-Gg: ASbGncvvpzzo5ePenEwyhjSWC3uQnwaebgpD08ntSe8G6sa7Qn+rLV+ujwljZIfMynI
	hFg7lovqYJ/P2Jt6/gbEgasNt7/p4EiqCOM3zP0FEJJMGcp6PGdmsgyvxAJn35lQGZ5u2Ucb85v
	68Lr14gLK+l4OGg1fZwjhw5dwppejFQ0273JgfBlaMt5AIa0Ds9krhKhxltubqp0SVh/xEUaqWD
	tCGhWSbPfZJ6F/AQcW3mWOY6XisygPciFS2z8DDtvLc2oHg5hYplAP0dMJsOzGRVw==
X-Google-Smtp-Source: AGHT+IFld8r2qPMzH52o0LNdnFRgizWAcXOC5ouav3qbmso94KapH4ryfiOklM5qcTJk0ZsNAs/wVA==
X-Received: by 2002:a17:907:1de7:b0:aa6:653c:409a with SMTP id a640c23a62f3a-aa6b13f1b34mr610896466b.57.1734005081757;
        Thu, 12 Dec 2024 04:04:41 -0800 (PST)
Date: Thu, 12 Dec 2024 13:04:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 23/35] xen/console: introduce console_write()
Message-ID: <Z1rRWAWzC1pnD3PW@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-23-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-23-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:53PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> PV Linux kernel uses HYPERVISOR_console_io hypercall for early console which
> ends up being handled by Xen's console driver's guest_console_write().
> 
> guest_console_write() duplicates the code from __putstr(), elimitate code
> duplication.

It might be better to split the code that unifies
guest_console_write() and __putstr() as a non-functional change.
While the introduction of use_conring is likely a functional change.

> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 97 +++++++++++++++++++++++++---------------------
>  1 file changed, 53 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ce3639a4cdcda00ea63e3bf119bc3b242cbfdf6a..115967d179998cba4a81578caba09db4e4aca7f7 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -63,6 +63,8 @@ static const char __initconst warning_sync_console[] =
>      "However it can introduce SIGNIFICANT latencies and affect\n"
>      "timekeeping. It is NOT recommended for production use!\n";
>  
> +/* Flag: use conring for early console; switches to opt_console_to_ring */
> +static bool __read_mostly use_conring = true;

__ro_after_init instead of __read_mostly.

>  /* console_to_ring: send guest (incl. dom 0) console data to console ring. */
>  static bool __read_mostly opt_console_to_ring;
>  boolean_param("console_to_ring", opt_console_to_ring);
> @@ -661,6 +663,16 @@ static void cf_check notify_dom0_con_ring(void *unused)
>  static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
>                                 notify_dom0_con_ring, NULL);
>  
> +static bool console_locks_busted;
> +
> +static void conring_write(const char *str, size_t len)
> +{
> +    conring_puts(str, len);
> +
> +    if ( !console_locks_busted )
> +        tasklet_schedule(&notify_dom0_con_ring_tasklet);
> +}
> +
>  #ifdef CONFIG_X86
>  static inline void xen_console_write_debug_port(const char *buf, size_t len)
>  {
> @@ -669,8 +681,44 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
>                     : "=&S" (tmp), "=&c" (tmp)
>                     : "0" (buf), "1" (len), "d" (XEN_HVM_DEBUGCONS_IOPORT) );
>  }
> +
> +static void xen_console_write(const char *str, size_t len)
> +{
> +    if ( xen_guest )
> +        xen_hypercall_console_write(str, len);
> +    else
> +        xen_console_write_debug_port(str, len);
> +}
> +#else
> +static inline void xen_console_write(const char *str, size_t len)
> +{

opt_console_xen would only be set on x86 with the current command line
parsing done in console_init_preirq(), so you could add an
ASSERT_UNREACHABLE() here.

> +}
>  #endif
>  
> +/*
> + * Write characters to console.
> + *
> + * That will handle all possible scenarios working w/ console
> + * - serial console;
> + * - video output;
> + * - __HYPERVISOR_console_io hypercall (x86 only);
> + * - debug I/O port (x86 only);
> + * - forward to Xen event channel.

"Xen event channel" is not the correct term.  I would use "PV
console".  The event channel is just used to send the notification.

> + */
> +static void console_write(const char *str, size_t len)
> +{
> +    ASSERT(rspin_is_locked(&console_lock));
> +
> +    console_serial_puts(str, len);
> +    video_puts(str, len);
> +
> +    if ( opt_console_xen )
> +        xen_console_write(str, len);

Are you sure this builds?  opt_console_xen is only defined on x86, and
AFAICT console_write() is generic.  AFAICT you need to keep the X86
preprocessor guards, or alternatively do something like:

#define opt_console_xen false

For non-x86 arches in xen/console.h

> +
> +    if ( use_conring )
> +        conring_write(str, len);
> +}
> +
>  static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>                                  unsigned int count)
>  {
> @@ -691,28 +739,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>  
>          if ( is_hardware_domain(cd) )
>          {
> -            /* Use direct console output as it could be interactive */
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
> -                tasklet_schedule(&notify_dom0_con_ring_tasklet);
> -            }
> -
> +            console_write(kbuf, kcount);
>              nrspin_unlock_irq(&console_lock);
>          }
>          else
> @@ -813,31 +841,9 @@ long do_console_io(
>   * *****************************************************
>   */
>  
> -static bool console_locks_busted;
> -
>  static void __putstr(const char *str)
>  {
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
> -
> -    if ( !console_locks_busted )
> -        tasklet_schedule(&notify_dom0_con_ring_tasklet);
> +    console_write(str, strlen(str));
>  }
>  
>  static int printk_prefix_check(char *p, char **pp)
> @@ -1171,6 +1177,9 @@ void __init console_endboot(void)
>  
>      video_endboot();
>  
> +    use_conring = opt_console_to_ring;
> +    smp_wmb();

Do you really need the barrier?  If so it would need a comment
describing exactly why it's needed.  I don't think it's possible for
the write to be reordered past the return of the function, which would
be enough to ensure correctness?

Thanks, Roger.

