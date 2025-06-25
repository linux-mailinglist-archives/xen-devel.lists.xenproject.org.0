Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82EAE8030
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024696.1400531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNiY-0003HJ-Q7; Wed, 25 Jun 2025 10:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024696.1400531; Wed, 25 Jun 2025 10:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNiY-0003FB-Mp; Wed, 25 Jun 2025 10:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1024696;
 Wed, 25 Jun 2025 10:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUNiW-0003F5-Vh
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:51:00 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a47d5b-51b2-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 12:50:59 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so51455305e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 03:50:59 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45382363f7fsm16389415e9.27.2025.06.25.03.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:50:58 -0700 (PDT)
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
X-Inumbo-ID: 47a47d5b-51b2-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750848659; x=1751453459; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ6l13ZT3eRbCEJcy5ZWmFHCxqPUIBe+vkntGYJzXXw=;
        b=QlKD1aF6aBihRm+18PV4HiLDxWXihqGIkmE619OqBj8/wFO6PLRVLy139sDgD46Oaa
         p9MfHOxu8KP8NYuce1MYdkHulDD3w83fUy9+K4TSDlqSvEBYhmmPDIKN8IAX96ZgMbEa
         xycWjm7rlNHeX3eRRqMdSzBKHhpG4031NG11M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848659; x=1751453459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ6l13ZT3eRbCEJcy5ZWmFHCxqPUIBe+vkntGYJzXXw=;
        b=PChX8dJDDrKvXRGRGTCyleo7l2/xZK3mgho4NUyzTd+XWKzFoeJw3cNYDWkMM59n2b
         OMazGoDP/XpWNUJR6mNqdg34kJxLJsN8Fhkj8u5A4ewmMrKt19bkZKMyJXZC9LjK6V8X
         zNwJPuyzVHxX/lKML2sKMVu5a3LbIqrQ/Kl2N156KAdYmeMC4A8fVy8Baed2g6Rbgc/m
         YW8gQXkimOqNxc7nc2AaRBM4wpBHm6cydapp0rbfushbc4+TSs4YJ1m2frpPEVknG3fH
         OieRIGC/PkCySm2WrHqhObu8EvZ731ZjUoPKvXeHQd4dwE8JchgDvf/TI6mK7HEC/zhk
         8nxQ==
X-Gm-Message-State: AOJu0YyjjeG1B514U83oJ59XY11Ud6MuzgppbqYQATynAC3iiasblojY
	YeAAW/AH0VKq2GxOHVOsU38wS10XQ4ucDYd1y7sCt7H9zi8GP2BPNI65wEKQ/ncwdsc=
X-Gm-Gg: ASbGncsULtyY3PfXqITyBctep8AQQ3Vjjfn1rLIoRl5OtiK7Sj+CksVs2MMKAsVrPtN
	E66OSZ/wVzSpyMGoY+2LN7Pmdlwm9jfZD/lOoZdCp9zxEpXDb3mM+jvRud4r70baP/SYW77BZfA
	tUXdrOrqjqvpIi6tjo1BSGLMBhyKbZqzTPCc9GosmTgLUUpvwMAfsseGRKmw3gRn12OFTfMhQQB
	yjeqvO2sFpdHw4Vrju+HXtZvnpuTM69m/RrEYUCQ7ZAQdCxxO+JY96S70zSdxljX8+0wPduKiEB
	mTjDPVbHSX9fRH3vbZZjNjiTJi/nmxyJqBL35aZE9VuRuFki+6BQVMYf1Z6qAT5Gm6okT9wPlQs
	le/at4norRLLv+fF52oRNGo95mOfxDKX2QOn2dvs0
X-Google-Smtp-Source: AGHT+IGLL21mVjMWWaLY1wjOTNBoiZMctgY94sCw6GOMbubN4M9h0f87NGdxZ4772t1eCtXMs6gCqA==
X-Received: by 2002:a05:600c:8b14:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-45381aafee6mr21855615e9.2.1750848659106;
        Wed, 25 Jun 2025 03:50:59 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:50:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
Message-ID: <aFvUkWvIAmu4sMHO@macbook.local>
References: <20250606201102.2414022-1-dmukhin@ford.com>
 <20250606201102.2414022-3-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606201102.2414022-3-dmukhin@ford.com>

On Fri, Jun 06, 2025 at 08:11:26PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> If virtual UART from domain X prints on the physical console, the behavior is
> updated to (see [1]):
> - console focus in domain X: do not prefix messages;
> - no console focus in domain X: prefix all messages with "(dX)".
> 
> Use guest_printk() in all current in-hypervisor UART emulators. That aligns the
> behavior with debug I/O port 0xe9 handler on x86 and slightly improves the
> logging since guest_printk() already prints the domain ID. guest_printk() was
> modified to account for console focus ownership.
> 
> Modify guest_console_write() for hardware domain case by adding domain ID to
> the message when hwdom does not have console focus.
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360.463523@ubuntu-linux-20-04-desktop/
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - dropped rate-limiting change for vuart
> ---
>  xen/arch/arm/vpl011.c      |  6 +++---
>  xen/arch/arm/vuart.c       |  2 +-
>  xen/drivers/char/console.c | 23 +++++++++++++++++++++--
>  3 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 480fc664fc..2b6f2a09bc 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -87,7 +87,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>      {
>          if ( intf->out_prod == 1 )
>          {
> -            printk("%c", data);
> +            guest_printk(d, "%c", data);
>              intf->out_prod = 0;
>          }
>          else
> @@ -95,7 +95,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>              if ( data != '\n' )
>                  intf->out[intf->out_prod++] = '\n';
>              intf->out[intf->out_prod++] = '\0';
> -            printk("%s", intf->out);
> +            guest_printk(d, "%s", intf->out);
>              intf->out_prod = 0;
>          }
>      }
> @@ -107,7 +107,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
>              if ( data != '\n' )
>                  intf->out[intf->out_prod++] = '\n';
>              intf->out[intf->out_prod++] = '\0';
> -            printk("DOM%u: %s", d->domain_id, intf->out);
> +            guest_printk(d, "%s", intf->out);
>              intf->out_prod = 0;
>          }
>      }
> diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
> index bd2f425214..6641f9d775 100644
> --- a/xen/arch/arm/vuart.c
> +++ b/xen/arch/arm/vuart.c
> @@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
>          if ( c != '\n' )
>              uart->buf[uart->idx++] = '\n';
>          uart->buf[uart->idx] = '\0';
> -        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
> +        guest_printk(d, XENLOG_G_DEBUG "%s", uart->buf);
>          uart->idx = 0;
>      }
>      spin_unlock(&uart->lock);
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 6e77b4af82..3855962af7 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( is_hardware_domain(cd) )
>          {
>              /* Use direct console output as it could be interactive */
> +            char prefix[16] = "";
> +            struct domain *consd;
> +
> +            consd = console_get_domain();
> +            if ( consd != cd )
> +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_id);
> +            console_put_domain(consd);
> +
>              nrspin_lock_irq(&console_lock);
> +            if ( prefix[0] != '\0' )
> +                console_send(prefix, strlen(prefix), flags);
>              console_send(kbuf, kcount, flags);
>              nrspin_unlock_irq(&console_lock);
>          }
> @@ -1032,12 +1042,21 @@ void printk(const char *fmt, ...)
>      va_end(args);
>  }
>  
> +/*
> + * Print message from the guest on the diagnostic console.
> + * Prefixes all messages w/ "(dX)" if domain X does not own physical console
> + * focus.
> + */
>  void guest_printk(const struct domain *d, const char *fmt, ...)
>  {
>      va_list args;
> -    char prefix[16];
> +    char prefix[16] = "";
> +    struct domain *consd;
>  
> -    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> +    consd = console_get_domain();
> +    if ( consd != d )
> +        snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> +    console_put_domain(consd);

It might be helpful to abstract this into a separate helper, as it's
used by both functions:

static void fill_console_prefix(char *prefix, unsigned int len,
                                const struct domain *d)
{
    struct domain *consd = console_get_domain();

    if ( consd ? consd != d : !is_hardware_domain(d)) )
       snprintf(prefix, len, "(d%d) ", d->domain_id);
    console_put_domain(consd);
}

Note the above code should also handle the current discussion of not
printing the (d0) prefix for the hardware domain when the console
target is Xen.  I think this keeps the previous behavior when console
input is switched to Xen, while still providing unified (dX) prefixes
otherwise.

Thanks, Roger.

