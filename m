Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58C3A20C21
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 15:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878520.1288698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmfN-0007WP-MW; Tue, 28 Jan 2025 14:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878520.1288698; Tue, 28 Jan 2025 14:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmfN-0007TK-Jc; Tue, 28 Jan 2025 14:34:13 +0000
Received: by outflank-mailman (input) for mailman id 878520;
 Tue, 28 Jan 2025 14:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcmfM-0007TE-AJ
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 14:34:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0335d76-dd84-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 15:34:10 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so818297366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 06:34:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc18619346sm7259833a12.8.2025.01.28.06.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 06:34:09 -0800 (PST)
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
X-Inumbo-ID: f0335d76-dd84-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738074850; x=1738679650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FrOZuR8YN0J8NFphtjvgsh/CUngd3QXSCk7CgN8cugs=;
        b=WmRscV78Ycme0AW2qx2ukEoRBaJN5xOCWJfpUXQgdsDTp2S+PMq3HN6rZ6r6DXFUYP
         BNEmX3NFYh4ADzi/Ak+8YTBxImTvysCWfuyO4T+ykj/xohSe8vYZ7llCspkYlWagMC/Q
         TicaXNCUWVVS6b9ukoxXZ7tP9OuZgrQ7YJpt0tK2i8fVZKr0B596vf1mXplTGNUCbdLu
         dxjjulD18oAPracrPyTdRWJPYDKr9GR2VblbuZs/dS7vd+7aeXyvADtZzoty3gMEgUkN
         ZDKda+z4cvyqSPAlvh/R69qWRNpNl36OUaldsAM3CdjrgjWOrJLv5T5Z444EIDSTHO6a
         WoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738074850; x=1738679650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrOZuR8YN0J8NFphtjvgsh/CUngd3QXSCk7CgN8cugs=;
        b=OmU9ZxxyUSpEq4QdHeThnRTkk0s8k3szLlpWJDYkKrR5866a6cWKOMA1lrAUJUc58j
         FP0Ow161/8pJ8aonrIeUpVHRTVWDfw42tqVmZG5PuCbGH6zizQYBcNVIwBee9mu6h8DI
         mnUldtjK3srSjP2P6uxJoANBOOqwhq2/2sPUMpZV7/Mm6E2XnoIOQ7qif3kannYSTqON
         KYTyl9Yhs8/A12dzmMvCImXuIrOcs8FRm2WcL4e4nicHFTxeEO8FnARIPSAwzsG+Tyva
         JuSDfN9KtEjWOhxkT79kcAAfSdjpZJP4uV73yXeXuzw4yhwidopU0mdmkJ4SjquSqr4Y
         1UOA==
X-Forwarded-Encrypted: i=1; AJvYcCUNs2oQXfAmar89TpQAQbqsJIQ1+EflAnbRhChlg8eGMHW8TqBQpu8tqlzzy5iooeYWQU/O03qRMR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YximcJ/KvHSngVexpCQ87XlO6nCN14+5GgsRCr253CljaCx9vtU
	8Sl18wryotE95riaga+NBkuR34Yt8iaUkIfL08h9EPD8CfDcfU8HPi2XOxCb+A==
X-Gm-Gg: ASbGncsPxVzvkDSJmxSoitXX18VvX+dnA7mwRYwqsCQt6O2w4jpSNwp1EoRAkCQZcre
	5fl0dSwS0XmqJesb+Az8RK5FgngFGsWhJadvQ2Hg1ecrzlAbkBaKceY2s2aEsvnd7i7VpQBChAz
	+OcZ3RMSIuSoqHnwOJlK7Ken2xkLKjQmlSMwv2snbtGpoosTU00zzZVgQZ38QXa72uA7vvx/Hke
	eenaiIn24wYw0DtDUS8g409qzaHq94bMsbVqDF1hmoERN6Obt3pCjILlmRK0Ewxoc+Rkgmo470c
	8BDUmPUoHLopSJgPmLB7Y+GPrIMJfEFGX9Vf9OkggAb/w17rQ5+eHtGpLMeic3FoGhEpsjVGhe8
	K
X-Google-Smtp-Source: AGHT+IH2LZ4wexQGoBvT0Bz50LBdt2EJehB9n5V/+aQJuFTdvEdgAazb532fr5rclg/mJhO1NKbQ4g==
X-Received: by 2002:a05:6402:2745:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5db7db07846mr100313182a12.23.1738074849867;
        Tue, 28 Jan 2025 06:34:09 -0800 (PST)
Message-ID: <e9a5af87-a80e-464c-bd67-8509dfac1d18@suse.com>
Date: Tue, 28 Jan 2025 15:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/24] xen/console: introduce framework for UART
 emulators
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-7-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250103-vuart-ns8250-v3-v1-7-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce a driver framework to abstract UART emulators in the hypervisor.
> 
> That allows for architecture-independent handling of virtual UARTs from Xen
> console driver and simplifies enabling new architecture-dependent UART
> emulators.
> 
> The framework is built under CONFIG_HAS_VUART, which is automatically enabled
> once the user selects a specific UART emulator.
> 
> All domains w/ enabled vUART will have VIRTDEV_UART bit set in
> d->arch.emulation_flags.
> 
> Current implementation supports maximum of one vUART per domain, excluding
> emulators for hardware domains.
> 
> Use domain_has_vuart() in Xen console driver code to check whether the
> domain can own the physical console focus.

Purely from how it is spelled out here this looks wrong: A domain having a
vUART may not necessarily imply it may also own console focus. Imo the two
need to be treated separately (perhaps even involving XSM), with it merely
being a prereq to have a vUART in order to possible also own console focus.

> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -785,7 +785,7 @@ static int __init construct_domU(struct domain *d,
>       */
>      if ( kinfo.vpl011 )
>      {
> -        rc = domain_vpl011_init(d, NULL);
> +        rc = virtdev_uart_init(d, NULL);

Like I said for the public header, "virt" as in "virtdev" is ambiguous.
Is there anything wrong with calling this function vuart_init()? While
you may say that the 'v' in there is then as ambiguous, I think that's
not actually the case.

> @@ -891,7 +891,7 @@ void __init create_domUs(void)
>               * d->arch.vpl011.irq. So the logic to find the vIRQ has to
>               * be hardcoded.
>               * The logic here shall be consistent with the one in
> -             * domain_vpl011_init().
> +             * vpl011_init().
>               */

Since you relaxed the tying to vpl011 in the earlier hunk, why is the
tight connection being retained here?

> @@ -30,10 +31,7 @@ static int handle_vuart_init(struct domain *d,
>                               struct xen_domctl_vuart_op *vuart_op)
>  {
>      int rc;
> -    struct vpl011_init_info info;
> -
> -    info.console_domid = vuart_op->console_domid;
> -    info.gfn = _gfn(vuart_op->gfn);
> +    struct virtdev_uart_params info;
>  
>      if ( d->creation_finished )
>          return -EPERM;
> @@ -41,8 +39,11 @@ static int handle_vuart_init(struct domain *d,
>      if ( vuart_op->type != XEN_DOMCTL_VUART_TYPE_VPL011 )
>          return -EOPNOTSUPP;
>  
> -    rc = domain_vpl011_init(d, &info);
> +    info.console_domid = vuart_op->console_domid;
> +    info.gfn = _gfn(vuart_op->gfn);
> +    info.evtchn = (evtchn_port_t)-1;

Where's the literal -1 coming from? Port 0 being guaranteed invalid, that's
what we normally use as sentinel. (It's also unclear why the field needs
setting now, when it wasn't set before.)

Also: Can't all three fields be set in the variable's initializer?

> @@ -783,6 +788,12 @@ void domain_vpl011_deinit(struct domain *d)
>          XFREE(vpl011->backend.xen);
>  }
>  
> +static void cf_check vpl011_dump(struct domain *d)
> +{
> +}

If at all possible, can we try to avoid having empty handler functions.
Putting NULL there and having the caller check is generally preferable,
at least from cf_check perspective.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -30,6 +30,7 @@
>  #include <xen/vpci.h>
>  #include <xen/nospec.h>
>  #include <xen/vm_event.h>
> +#include <xen/virtdev-uart.h>
>  #include <asm/shadow.h>
>  #include <asm/hap.h>
>  #include <asm/current.h>

Why would this be needed at this time?

> --- a/xen/drivers/Makefile
> +++ b/xen/drivers/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_HAS_VPCI) += vpci/
>  obj-$(CONFIG_HAS_PASSTHROUGH) += passthrough/
>  obj-$(CONFIG_ACPI) += acpi/
>  obj-$(CONFIG_VIDEO) += video/
> +obj-$(CONFIG_HAS_VUART) += virtdev-uart.o

I'm unconvinced we want any C files directly under drivers/.

> --- /dev/null
> +++ b/xen/drivers/virtdev-uart.c
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/errno.h>
> +#include <xen/event.h>
> +#include <xen/virtdev-uart.h>
> +#include <public/virtdev.h>
> +
> +extern const struct virtdev_uart *__start_virtdev_uart;

Imo this wants to be an array from the very beginning, no matter that
for now you expect the array to have just (at most) one element.

> +int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params)
> +{
> +    int rc;
> +
> +    ASSERT(__start_virtdev_uart);

What is this to guard against? If the linker script doesn't define the
symbol, linking will fail (as the symbol isn't weak). If it does define
it, its address will be guaranteed non-NULL. What you instead need to
assure is for ...

> +    rc = __start_virtdev_uart->init(d, params);

... this de-ref to actually be within bounds (i.e. __start_virtdev_uart
< __end_virtdev_uart at the very least).

> +    if ( rc )
> +        return rc;
> +
> +#if !defined(__i386__) && !defined(__x86_64__)
> +    d->arch.emulation_flags |= VIRTDEV_UART;
> +#endif

This isn't how emulation_flags has been used so far: The field is set
once, and then isn't further modified. Question is what you mean to
achieve by setting this conditionally. Depending on that it may be
possible to suggest alternatives.

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -54,6 +54,9 @@ void arch_get_domain_info(const struct domain *d,
>  
>  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
> +#define domain_has_vuart(d) \
> +    ( IS_ENABLED(CONFIG_HAS_VUART) && \
> +      (d)->arch.emulation_flags & VIRTDEV_UART )

Nit: Parentheses around the & operation, to separate it from the && one.

As to the IS_ENABLED(): If you look at how CDF_staticmem and
CDF_directmap you'll find that we conditionally #define them to zero
when the respective CONFIG_* isn't / aren't enabled. That would be nice
to have here, too.

> --- /dev/null
> +++ b/xen/include/xen/virtdev-uart.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__VIRTDEV_UART_H
> +#define XEN__VIRTDEV_UART_H
> +
> +#include <public/xen.h>
> +#include <public/event_channel.h>
> +#include <xen/types.h>
> +
> +struct virtdev_uart_params {
> +    domid_t console_domid;
> +    gfn_t gfn;
> +    evtchn_port_t evtchn;
> +};
> +
> +struct virtdev_uart {
> +    int (*putchar)(struct domain *d, char c);
> +    int (*init)(struct domain *d, struct virtdev_uart_params *params);
> +    void (*exit)(struct domain *d);
> +    void (*dump)(struct domain *d);
> +};
> +
> +#define VIRTDEV_UART_REGISTER(x) \
> +    static const struct virtdev_uart *x##_entry \
> +           __used_section(".data.virtdev.uart") = \
> +    &(const struct virtdev_uart){ \
> +        .init    = x ## _init, \
> +        .exit    = x ## _exit, \
> +        .dump    = x ## _dump, \
> +        .putchar = x ## _putchar, \
> +    }

Why the extra level of indirection? Can't the section consist of instances
of struct virtdev_uart rather than pointers to such?

> +#ifdef CONFIG_HAS_VUART
> +
> +int virtdev_uart_putchar(struct domain *d, char c);
> +int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params);
> +void virtdev_uart_exit(struct domain *d);
> +void virtdev_uart_dump(struct domain *d);
> +
> +#else
> +
> +static inline int virtdev_uart_putchar(struct domain *d, char c)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -ENODEV;
> +}
> +
> +static inline int virtdev_uart_init(struct domain *d,
> +                                    struct virtdev_uart_params *params)
> +{
> +    return 0;
> +}
> +
> +static inline void virtdev_uart_exit(struct domain *d)
> +{
> +}
> +
> +static inline void virtdev_uart_dump(struct domain *d)
> +{
> +}

Are all of these stubs really needed? The sole putchar call site suggests
the stub isn't needed (as the call will be DCE'd by the compiler). The
dump invocation likely also wants guarding by a domain_has_vuart() check.
Perhaps also the exit one.

At least for the dump hook it would also be quite desirable if it could
have a pointer-to-const parameter.

Jan

