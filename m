Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A19F0BE8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 13:09:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856643.1269197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM4T6-0005Ud-CO; Fri, 13 Dec 2024 12:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856643.1269197; Fri, 13 Dec 2024 12:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM4T6-0005SI-9Y; Fri, 13 Dec 2024 12:08:28 +0000
Received: by outflank-mailman (input) for mailman id 856643;
 Fri, 13 Dec 2024 12:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8nQu=TG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tM4T4-0005Qf-Rp
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 12:08:26 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4cd3256-b94a-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 13:08:26 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso2015931a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 04:08:25 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68770c481sm692330766b.110.2024.12.13.04.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 04:08:24 -0800 (PST)
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
X-Inumbo-ID: f4cd3256-b94a-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734091705; x=1734696505; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3uiSySdXOdAjSyfpFkZEBuFnMElPBj8h17XrCKrLRdo=;
        b=WyPzwd4FD77GO/mVHs7HAz6pDw6txrilU4eDRLyESyVygeMchIAMjM8kQhweCiipsE
         2uF5pB/ENTylIEMI5gli4cUK2bBhgRBTZ3xKHIPtOe9OKL8nr10W07cFHIYi3+nv8UG1
         BI6drpDiwjoxa8paoA1ZvLR86PIAU34rKK9o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734091705; x=1734696505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uiSySdXOdAjSyfpFkZEBuFnMElPBj8h17XrCKrLRdo=;
        b=edos7G7rPE08NnA4DXfQ0YOvyYXmktUqpu3EfKtq2XFvb01Xs0wLJrJAGVs3l19XH2
         HD4bgL3aE9mBbBRnlfalfQJOII2tN2WFobNewVn9wemeukXOhqSXqilde7mxokJfTeuI
         kIE3tgDKm/QVTbTD/eUj2+HArwEbyJCJKVBm0ZdfTZZcu/9LXv9AVEjajXE9IpavEd3P
         OSszisE2scc/CtKeXm9VvbWX8wQdwW3PCmAuMjC4S6uHarBnI6ZqlQO+mSiBrGJtDiG5
         5d49O0ntA3x9ElupdbtQcY3o+4Q7ksmhy/TXAXzAD4uT2Z4bALj8DnhB9DISdq0MqrQ0
         /Rtg==
X-Gm-Message-State: AOJu0YwggQ7zmu8IuHlciB/FhgWkUf58YQifzCXJWhqGd9/f3YOi6m5L
	r5WVktA0VS9rMjojs/N7LTvzt+mR1Mk4/SYemU5QJ2o18zQcycaAn2qZhNON5wY8vKMNFZNUoyP
	L
X-Gm-Gg: ASbGnctRIEJykUn0+Q7xu+vToIEfEsbEviKx2JwgFNcH6opYD4/qHTbs1oDnoBUVdPp
	TaKAZZx8aekUkaSrIo5T4tTlc2wjgwRnB+dM/zsITT92hzZiIINcviV+AKeGuFBwEBeFloFH89k
	aTUmxSJFTkB7TJVLJEcHNUoc3KRSxn0e0kRk4UtCJtUd2AOo2VMTsvEvAMMdG/z/K06PAmLT6on
	C2Fkb+m0ISLW8q349E4g3ItHjXrzV3m9yWtv9Ib3sGmSovI2LrVi5e+fTsCM+GAhA==
X-Google-Smtp-Source: AGHT+IEN3k0DWZjpDNTuZ/Fs8fa1Vs6JmtyOmIeE3RZv5q9XAyOogPj/+3iuh9cYMAweQSCi4oYogg==
X-Received: by 2002:a05:6402:5109:b0:5d0:abb8:7a3 with SMTP id 4fb4d7f45d1cf-5d63c30097cmr4772116a12.6.1734091705164;
        Fri, 13 Dec 2024 04:08:25 -0800 (PST)
Date: Fri, 13 Dec 2024 13:08:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 32/35] x86/hvm: add debugging facility to NS8250 UART
 emulator
Message-ID: <Z1wjt-JR95YoJBMs@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-32-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-32-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:42:02PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Enable keyhandler mechanism for dumping state of emulated NS8250 on the
> console.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/hvm/vuart_ns8250.c | 122 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vuart_ns8250.c b/xen/arch/x86/hvm/vuart_ns8250.c
> index 779dbd80d7be4e070ea9df3ae736ecdc662a527a..c8c75afaf2b2419d1dae999da1d1e400fd367791 100644
> --- a/xen/arch/x86/hvm/vuart_ns8250.c
> +++ b/xen/arch/x86/hvm/vuart_ns8250.c
> @@ -25,6 +25,7 @@
>  
>  /* Development debugging */
>  #define NS8250_LOG_LEVEL    0
> +#undef NS8250_DEBUG
>  
>  #include <xen/types.h>
>  #include <xen/event.h>
> @@ -35,6 +36,9 @@
>  #include <xen/resource.h>
>  #include <xen/ctype.h>
>  #include <xen/param.h>
> +#if defined(NS8250_DEBUG)
> +#include <xen/keyhandler.h>
> +#endif
>  #include <xen/console.h> /* console_input_domid() */
>  #include <asm/setup.h>   /* max_init_domid */
>  #include <asm/iocap.h>
> @@ -625,6 +629,121 @@ static const char *ns8250_regname(
>      return reg_names[reg][dir];
>  }
>  
> +#if defined(NS8250_DEBUG)

I don't think the keyhandler should be gated on NS8250_DEBUG, it
should always be present if Xen is built with vUART support.

> +static void ns8250_dump(struct vuart_ns8250 *vdev)
> +{
> +    struct xencons_interface *cons = vdev->cons;

const for both.

> +    uint8_t val;
> +
> +    printk("I/O port %02"PRIx64" IRQ %d flags %"PRIx32" owner %d\n",

I think you want 04 for the io_addr field width?  So that the width is
always fixed, and %pd for owner.

> +            vdev->io_addr, vdev->irq,
> +            vdev->flags, vdev->owner->domain_id);
> +
> +    printk("RX size %ld in_prod %d in_cons %d used %d\n",
> +            sizeof(cons->in),
> +            cons->in_prod, cons->in_cons,
> +            cons->in_prod - cons->in_cons);
> +
> +    printk("TX size %ld out_prod %d out_cons %d used %d\n",
> +            sizeof(cons->out),
> +            cons->out_prod, cons->out_cons,
> +            cons->out_prod - cons->out_cons);
> +
> +    printk("%02x RBR [ %c ] THR [ %c ] DLL %02x DLM %02x\n",
> +            UART_RBR,
> +            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons)],
> +            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons)],
> +            vdev->dl & 0xFFU, vdev->dl >> 8);
> +
> +    printk("%02"PRIx8" IER %02"PRIx8"\n", UART_IER, vdev->regs[UART_IER]);
> +
> +    val = (vdev->regs[UART_FCR] & UART_FCR_ENABLE) ? UART_IIR_FE_MASK : 0;
> +    val |= ns8250_irq_reason(vdev);
> +    printk("%02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
> +            UART_FCR, vdev->regs[UART_FCR], val);
> +
> +    printk("%02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, vdev->regs[UART_LCR]);
> +    printk("%02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, vdev->regs[UART_MCR]);
> +    printk("%02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, vdev->regs[UART_LSR]);
> +    printk("%02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, vdev->regs[UART_MSR]);
> +}
> +
> +static struct domain *rcu_find_first_domain_with_vuart(void)
> +{
> +    struct domain *d = NULL;
> +    domid_t i;
> +
> +    for ( i = 0; i < max_init_domid + 1; i++ )
> +    {
> +        d = rcu_lock_domain_by_id(i);
> +        if ( d == NULL )
> +            continue;
> +
> +        if ( domain_has_vuart(d) )
> +            break;
> +
> +        rcu_unlock_domain(d);
> +    }
> +
> +    return d;
> +}
> +
> +static void cf_check ns8250_keyhandler_show(unsigned char key)
> +{
> +    struct vuart_ns8250 *vdev;
> +    struct domain *d;
> +
> +    d = rcu_find_first_domain_with_vuart();
> +    if ( d == NULL )
> +        return;

I wonder whether you should dump the state of all domains with a
vUART, rather than just a single domain?

> +
> +    printk("'%c' pressed -> dumping virtual NS8250 state (d%d)\n",
> +            key, d->domain_id);
> +
> +    vdev = &d->arch.hvm.vuart;
> +    spin_lock(&vdev->lock);

This should likely be a trylock, so that you can still print the
console state in case of a deadlock.

> +    ns8250_dump(vdev);
> +    spin_unlock(&vdev->lock);
> +
> +    rcu_unlock_domain(d);
> +}
> +
> +static void cf_check ns8250_keyhandler_irq(unsigned char key)
> +{
> +    struct vuart_ns8250 *vdev;
> +    struct domain *d;
> +
> +    d = rcu_find_first_domain_with_vuart();
> +    if ( d == NULL )
> +        return;
> +
> +    printk("'%c' pressed -> triggering IRQ on virtual NS8250 (d%d)\n",
> +            key, d->domain_id);
> +
> +    vdev = &d->arch.hvm.vuart;
> +    spin_lock(&vdev->lock);
> +    ns8250_irq_assert(vdev);
> +    spin_unlock(&vdev->lock);
> +
> +    rcu_unlock_domain(d);
> +}
> +
> +static void ns8250_keyhandler_init(void)
> +{
> +    register_keyhandler('1', ns8250_keyhandler_show,
> +                        "dump virtual NS8250 state", 0);
> +    register_keyhandler('2', ns8250_keyhandler_irq,
> +                        "trigger IRQ from virtual NS8250", 0);
> +}
> +#else
> +static inline void ns8250_keyhandler_init(void)
> +{
> +}
> +static inline void ns8250_dump(struct vuart_ns8250 *vdev)
> +{
> +}
> +#endif /* #if defined(NS8250_DEBUG) */
> +
>  /*
>   * Emulate I/O access to NS8250 register.
>   */
> @@ -688,6 +807,7 @@ static int cf_check ns8250_io_handle(
>      rc = X86EMUL_OKAY;
>  
>  out:
> +    ns8250_dump(vdev);

Likely a remaining of some debugging?  Printing the state for every
access is too verbose.

>      spin_unlock(&vdev->lock);
>  
>      return rc;
> @@ -786,6 +906,7 @@ static int ns8250_init(struct domain *d, const struct resource *r)
>      }
>  
>      spin_lock_init(&vdev->lock);
> +    ns8250_keyhandler_init();

The keyhandler init should be in a __initcall(), otherwise you are
calling it for each domain creation that has a vUART.

Thanks, Roger.

