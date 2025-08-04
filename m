Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07AB19F83
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 12:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069025.1432868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uis9q-0002fg-Ai; Mon, 04 Aug 2025 10:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069025.1432868; Mon, 04 Aug 2025 10:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uis9q-0002ci-87; Mon, 04 Aug 2025 10:11:06 +0000
Received: by outflank-mailman (input) for mailman id 1069025;
 Mon, 04 Aug 2025 10:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uis9p-0002cW-Ne
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 10:11:05 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530c919d-711b-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 12:11:02 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso3904304a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 03:11:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f26cc6sm6633294a12.23.2025.08.04.03.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 03:11:01 -0700 (PDT)
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
X-Inumbo-ID: 530c919d-711b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754302261; x=1754907061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FnYaJI1V2XWrtQAK1N+wRN1uuvnOhji6nallZ3Lyaf4=;
        b=FWud6tk/q12mtfQs/HYTVqSprcSWbffBn5ITYiAplovoiL4obP5k6QkQ4dwo0tFe9j
         XY9rg8uSiIEgIJcrd4Cto+4CwioXuoCAQ1EQJIwFwO4SFzwz77aPcf14D7loJGOhMG2J
         SysLXABrin9w71sK2kLwPxjWFL+5c9PVQ5VUWxbatcdHFbHXkSTp7d9EnHxT1UTbKW8T
         3lQhN6a+bv2ryh+rG4HLqYoPnfozPAA7sU/ESolbtTOfKgdcdbUlBgwWLmp3uvT7QCMy
         wLulhG/DFF4TqXTf1bDnw2k5KNXIMgHpfyRTY+j1sXSD/kGLbNVkFOj2/2aUDmwBaoh3
         apKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754302261; x=1754907061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnYaJI1V2XWrtQAK1N+wRN1uuvnOhji6nallZ3Lyaf4=;
        b=wUgi8+asqVdctOtnSsjiFu2dXHwNyPft+DojDVgMXWKWKa7IPmKIAowFiFKnQkTZvZ
         qIX24+VH6oeZUbwYtDeYY8GRNGWgfj1MBrWX1uiK9TwOmP2M7CYlEDna2cT+JRZ8IJo/
         tCabKbZgtZIDXvhZd61h2uIVPUCDT93dWmvd2yr6xcQIxPLOxQXG5Y9yFJ7zLcKaWqBn
         N/E/YzvGurJlPp/l0Us42IvQn2hAyj8xYyZO6f/HlvGfyOFcu1O/+bIEPGOah5mTWrHK
         sDzbv+Q80iNiBiOOfaBFxSgn8dgcGHrBatPNkvVebgyBISvklyGEEY+d2ntukMI687LU
         NcMw==
X-Forwarded-Encrypted: i=1; AJvYcCUOqe8bizHKT6CyR5XJlvTMQgoaVPxlvIAZ/jtTIXLWbREvUV6ekIMbjxIy6ttu69h4V1QqrZ5IqU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ1WMyVyrDAKY3b7vpffa/lLxES574PB98GxbSC5nvmKfpN/uk
	cVkI0LBFkIAb1dGR8/JP6bfp8foMxpD4ACCglnWlsHWojNwdsGzfc1Jlbg2oEeG2YQ==
X-Gm-Gg: ASbGncuCxjMTc9vE+vt8e+zZ2tLwC8RDgpYtuswGso9RjdPolti4yz9fA/Q/KH4ZDXL
	MQIw/GYaRJtGeRZJI4z3x5bTcJ0c7hVTQs2cYrZvIbiIrvlwZMDUjRWX7cMJ2hIa0oeZ/+J9zu3
	Fw+kdAkOiFmx8QDL4PAaRplp1ifW5lT7qXY7Geqi4oDa0ToHhxpzNodUrlD0t9+0FFUEIPJf/XW
	bypvD2X+s6qdgnT72o631cvSDcw5+VJVYOlESaGcd9L59MBvIxQQSRkYHXga/iJKFZ/G8R5aKke
	CGg/Bqj1tha9/jXgAaqyrA4nkJE+hWhuoG9Gxe9OToRcu1lijb2hoc0VG1mW5q8GdXl0N2s9yAb
	Gj7vXHZU0dGr4bJVRsA2/1ev9AVrD4+fZ79ga+DrfNVv9+997yQk3V1kdW80JYTlOzR29EtEpoM
	WqI4nHSzg=
X-Google-Smtp-Source: AGHT+IHfg8UkPao3X4ZCKd/GRrvOlp8iAmbzRvf9iVZtCTDK3F335VBwhMrDttEIt6p+/Xgbhk472w==
X-Received: by 2002:a17:907:9407:b0:af9:3eea:65bd with SMTP id a640c23a62f3a-af940248c89mr874133266b.61.1754302261413;
        Mon, 04 Aug 2025 03:11:01 -0700 (PDT)
Message-ID: <a416cc08-5970-433a-8015-5d2aa961a000@suse.com>
Date: Mon, 4 Aug 2025 12:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART emulators
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-3-dmukhin@ford.com>
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
In-Reply-To: <20250731192130.3948419-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 21:21, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce a driver framework to abstract UART emulators in the hypervisor.
> 
> That allows for architecture-independent handling of virtual UARTs in the
> console driver and simplifies enabling new UART emulators.
> 
> The framework is built under CONFIG_HAS_VUART, which will be automatically
> enabled once the user enables any UART emulator.

Yet then still - why "HAS"? Call it just VUART or VUART_FRAMEWORK or some such.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -1,6 +1,8 @@
>  
>  menu "Common Features"
>  
> +source "common/emul/Kconfig"
> +
>  config COMPAT

Why at the very top?

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>  obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-y += emul/
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
> diff --git a/xen/common/emul/Kconfig b/xen/common/emul/Kconfig
> new file mode 100644
> index 000000000000..7c6764d1756b
> --- /dev/null
> +++ b/xen/common/emul/Kconfig
> @@ -0,0 +1,6 @@
> +menu "Domain Emulation Features"
> +	visible if EXPERT
> +
> +source "common/emul/vuart/Kconfig"
> +
> +endmenu
> diff --git a/xen/common/emul/Makefile b/xen/common/emul/Makefile
> new file mode 100644
> index 000000000000..670682102c13
> --- /dev/null
> +++ b/xen/common/emul/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_HAS_VUART) += vuart/

With this you can ...

> --- /dev/null
> +++ b/xen/common/emul/vuart/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_HAS_VUART) += vuart.o

... use the simpler obj-y here.

> --- /dev/null
> +++ b/xen/common/emul/vuart/vuart.c
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +#include <xen/vuart.h>
> +
> +#define VUART_ARRAY_SIZE    (__start_vuart_end - __start_vuart_array)
> +
> +#define for_each_vuart(vdev) \
> +    for (unsigned __i = 0; \
> +         __i < VUART_ARRAY_SIZE && (vdev = __start_vuart_array[__i], 1); \
> +         __i++)

Nit: Xen style please. Any preferably no leading underscores; in no case
two of them.

> +extern const struct vuart_ops *const __start_vuart_array[];
> +extern const struct vuart_ops *const __start_vuart_end[];

Is there an actual need for this extra level of indirection? It is in the
process of being done away with for vPCI.

> +int vuart_add_node(struct domain *d, const void *node)
> +{
> +    const struct vuart_ops *vdev;
> +    int rc;
> +
> +    for_each_vuart(vdev)
> +    {
> +        if ( !vdev->add_node )
> +            continue;
> +
> +        rc = vdev->add_node(d, node);

Here and below - shouldn't you call hooks only when the kind of driver is
actually enabled for the domkain in question?

> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +int vuart_init(struct domain *d, struct vuart_params *params)
> +{
> +    const struct vuart_ops *vdev;
> +    int rc;
> +
> +    if ( !domain_has_vuart(d) )
> +        return 0;
> +
> +    for_each_vuart(vdev)
> +    {
> +        rc = vdev->init(d, params);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    d->console.input_allowed = true;

Unconditionally?

> +void vuart_deinit(struct domain *d)
> +{
> +    const struct vuart_ops *vdev;
> +
> +    for_each_vuart(vdev)
> +        vdev->deinit(d);
> +}

I can perhaps see why this hook wants to uniformly be set, but ...

> +void vuart_dump_state(const struct domain *d)
> +{
> +    const struct vuart_ops *vdev;
> +
> +    for_each_vuart(vdev)
> +        vdev->dump_state(d);
> +}

... state dumping pretty surely wants to be optional?

> +/*
> + * Put character to the first suitable emulated UART's FIFO.
> + */

What's "suitable"? Along the lines of the earlier remark, what if the domain
has vUART kind A configured, ...

> +int vuart_put_rx(struct domain *d, char c)
> +{
> +    const struct vuart_ops *vdev = NULL;
> +
> +    ASSERT(domain_has_vuart(d));
> +
> +    for_each_vuart(vdev)
> +        if ( vdev->put_rx )

... but only kind B offers this hook?

> +            break;
> +
> +    return vdev ? vdev->put_rx(d, c) : -ENODEV;

The check for NULL helps for the "no vUART drivers" case, but it won't
help if you exhausted the array without finding a driver with the wanted
hook.

> +}
> +
> +bool domain_has_vuart(const struct domain *d)
> +{
> +    uint32_t mask = 0;

unsigned int?

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -22,6 +22,7 @@
>  #include <xen/mm.h>
>  #include <xen/watchdog.h>
>  #include <xen/init.h>
> +#include <xen/vuart.h>
>  #include <asm/div64.h>
>  
>  static unsigned char keypress_key;
> @@ -354,6 +355,8 @@ static void cf_check dump_domains(unsigned char key)
>                             v->periodic_period / 1000000);
>              }
>          }
> +
> +        vuart_dump_state(d);

How verbose is this going to get?

> --- /dev/null
> +++ b/xen/include/xen/vuart.h
> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#ifndef XEN_VUART_H
> +#define XEN_VUART_H
> +
> +#include <public/xen.h>
> +#include <public/event_channel.h>
> +#include <xen/types.h>

The order is wrong - types must be available before public headers are included.

> +struct vuart_params {
> +    domid_t console_domid;
> +    gfn_t gfn;
> +    evtchn_port_t evtchn;
> +};
> +
> +struct vuart_ops {
> +    int (*add_node)(struct domain *d, const void *node);
> +    int (*init)(struct domain *d, struct vuart_params *params);
> +    void (*deinit)(struct domain *d);
> +    void (*dump_state)(const struct domain *d);
> +    int (*put_rx)(struct domain *d, char c);
> +};
> +
> +#define VUART_REGISTER(name, x) \
> +    static const struct vuart_ops *const __name##_entry \
> +        __used_section(".data.vuart." #name) = (x);
> +
> +#ifdef CONFIG_HAS_VUART
> +
> +int vuart_add_node(struct domain *d, const void *node);
> +int vuart_init(struct domain *d, struct vuart_params *params);
> +void vuart_deinit(struct domain *d);
> +void vuart_dump_state(const struct domain *d);
> +int vuart_put_rx(struct domain *d, char c);
> +bool domain_has_vuart(const struct domain *d);
> +
> +#else
> +
> +static inline int vuart_add_node(struct domain *d, const void *node)
> +{
> +    return 0;
> +}
> +
> +static inline int vuart_init(struct domain *d, struct vuart_params *params)
> +{
> +    return 0;
> +}
> +
> +static inline void vuart_deinit(struct domain *d)
> +{
> +}
> +
> +static inline void vuart_dump_state(const struct domain *d)
> +{
> +}
> +
> +static inline int vuart_put_rx(struct domain *d, char c)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -ENODEV;
> +}
> +
> +static inline bool domain_has_vuart(const struct domain *d)
> +{
> +    return false;
> +}

With this, some of the other stubs should not be necessary. Declarations
will suffice, e.g. for vuart_put_rx().

> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -194,4 +194,14 @@
>  #define VPCI_ARRAY
>  #endif
>  
> +#ifdef CONFIG_HAS_VUART
> +#define VUART_ARRAY     \
> +       . = ALIGN(POINTER_ALIGN); \
> +       __start_vuart_array = .;  \
> +       *(SORT(.data.vuart.*))    \

This is r/o data afaict, so would want naming .rodata.vuart.*. Which in
turn means the uses of the macros need to move up in the linker scripts.

Jan

