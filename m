Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C19EE8A6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 15:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856058.1268799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLk47-0006Cu-38; Thu, 12 Dec 2024 14:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856058.1268799; Thu, 12 Dec 2024 14:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLk47-0006AI-0C; Thu, 12 Dec 2024 14:21:19 +0000
Received: by outflank-mailman (input) for mailman id 856058;
 Thu, 12 Dec 2024 14:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLk45-0006A9-Iw
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 14:21:17 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57eb84b6-b894-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 15:21:14 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3f249f3b2so817561a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 06:21:14 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3cedbb8fesm8890319a12.22.2024.12.12.06.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 06:21:13 -0800 (PST)
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
X-Inumbo-ID: 57eb84b6-b894-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734013273; x=1734618073; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCBmeOoyE/4VgfiRB4jwDsmFs4HDFreoB7cO2NrDIhM=;
        b=H6rSrpgcwrKUOyhlzmu+QG6gCZ86XaLup37Ygtvt9ZpXuPsIGKj8zXsXXDEqOEftV0
         /wlQKaQcDm/2uyEH/cy7jgPvF5/yVCLXQJpJRXqAP3YrcmKtTJvl81omb/f6NyYwVwZd
         EdddDwUVmCNieg1Jno8hOdgbGKMTjnGPGX2ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734013273; x=1734618073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCBmeOoyE/4VgfiRB4jwDsmFs4HDFreoB7cO2NrDIhM=;
        b=pLKOtBEuBvQTeL9ENuN3GsKEi8tlG7z5hZECNMkkije6dPtb4erVj4rN465V0QAJm+
         5IndKrZ0pPnYTYMMyW1E4qVC89O93SQASyCINuSeGEEBnvYfA2zdBG2tck3sI4marL7i
         IaGTtpKplTF5VadDFYdxkAxmEfD64WI7E+AYBJvtwNGHLExpwy6AS5ISOL6vdZ4e6ndm
         fsXQyGlUChfCFbkYid3yaLcY7iv/guXIobI+1wS+KiSXNtyoS9jJZtAS9jqcTcsq2q28
         dItvFgKbg2Y4XBbF0WIkcnVq4P6obLyzZ7jgOWwj3ibVNMmNn92p69JR7khEAwEou/eg
         QymA==
X-Gm-Message-State: AOJu0YwObIODtOGHao0qTfUDWv3jU9RCz/AQvfIv3C+sJaP2vwS5CBVl
	NLC8pBwPKZvLHCLqIrNM6HSW97b970fMDdmGRNy+Yv1RuyKm5JtQRVgcMvNdGvc=
X-Gm-Gg: ASbGncuphQJ2HRRUqK6hihI8cqwAe3t/9z8OJkRh+pSSECMpnPINq9QTJjL0CjnBQ4u
	1j2O3xuHN3tzPshcEfeLfAdOZtVN8oDbIutpa39J7Gxv64/NuAaXSlsspL/CK+0NL8bTEfsdeCk
	QjYTYKBJ4THxNIMujAmMWYh/70YKUPfjb5Valmt+Ni6catewkplHr6c3HLwIlFpi1ez/E+Vc+JL
	R5+dBCTr1m9p5ZEhGEyHswKcfyeUOIsKB8/WvawFkpfmci7pIBsBsZF1BWe1JpKGQ==
X-Google-Smtp-Source: AGHT+IEZw84v496fP9moR0cO66NB7YJYtJNUhODJpaiqxhZjHpsCP8GRx2l6Ljbu6RJCBrPyJR1KtA==
X-Received: by 2002:a05:6402:40c7:b0:5d3:ff93:f5f9 with SMTP id 4fb4d7f45d1cf-5d63238cf10mr905826a12.20.1734013273566;
        Thu, 12 Dec 2024 06:21:13 -0800 (PST)
Date: Thu, 12 Dec 2024 15:21:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 27/35] xen/console: flush console ring to physical
 console
Message-ID: <Z1rxWJtUGsUsMn91@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-27-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-27-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:57PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Messages printed before the serial and VGA consoles are initialized end up in
> the internal console buffer (conring). Flush contents of conring to all
> external consoles after external consoles are fully initialied.
> 
> Link: https://gitlab.com/xen-project/xen/-/issues/184
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 54 +++++++++++++++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 581ee22b85302a54db5b9d5d28e8b2d689d31403..a26daee9c4c4b1134d0ae3d105ffdb656340b6df 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -426,23 +426,35 @@ void console_serial_puts(const char *s, size_t nr)
>      pv_console_puts(s, nr);
>  }
>  
> -static void cf_check dump_console_ring_key(unsigned char key)
> +/*
> + * Write characters to physical console(s).
> + * That covers:
> + * - serial console;
> + * - video output.
> + */
> +static void console_puts(const char *str, size_t len)
> +{
> +    ASSERT(rspin_is_locked(&console_lock));
> +
> +    console_serial_puts(str, len);
> +    video_puts(str, len);
> +}
> +
> +/*
> + * Flush contents of the conring to the physical console devices.
> + */
> +static int console_flush(void)
>  {
>      uint32_t idx, len, sofar, c;
>      unsigned int order;
>      char *buf;
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
> +
> +    nrspin_lock_irq(&console_lock);
>  
>      c = conringc;
>      sofar = 0;
> @@ -457,10 +469,23 @@ static void cf_check dump_console_ring_key(unsigned char key)
>          c += len;
>      }
>  
> -    console_serial_puts(buf, sofar);
> -    video_puts(buf, sofar);
> +    console_puts(buf, sofar);
> +
> +    nrspin_unlock_irq(&console_lock);
>  
>      free_xenheap_pages(buf, order);
> +
> +    return 0;
> +}
> +
> +static void cf_check dump_console_ring_key(unsigned char key)
> +{
> +    int rc;
> +
> +    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
> +    rc = console_flush();
> +    if ( rc )
> +        printk("failed to dump console ring buffer: %d\n", rc);
>  }
>  
>  /*
> @@ -707,10 +732,7 @@ static inline void xen_console_write(const char *str, size_t len)
>   */
>  static void console_write(const char *str, size_t len)
>  {
> -    ASSERT(rspin_is_locked(&console_lock));
> -
> -    console_serial_puts(str, len);
> -    video_puts(str, len);
> +    console_puts(str, len);
>  
>      if ( opt_console_xen )
>          xen_console_write(str, len);
> @@ -1177,6 +1199,8 @@ void __init console_endboot(void)
>  
>      video_endboot();
>  
> +    /* NB: send conring contents to all enabled physical consoles, if any */
> +    console_flush();

This is way too late: at this point Xen has already finished booting,
and is about to handover execution to dom0.  Flushing here will result
in duplicating almost all Xen output already printed?

The flush needs to be done inside of console_init_preirq(), just
before printing xen_banner() I think.  This sequentially after the
console has been initialized.  Otherwise you are just duplicating
messages.

Thanks, Roger.

