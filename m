Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D23B17A58
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 02:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066631.1431790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhdJt-0000jy-OG; Fri, 01 Aug 2025 00:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066631.1431790; Fri, 01 Aug 2025 00:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhdJt-0000gr-LV; Fri, 01 Aug 2025 00:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1066631;
 Fri, 01 Aug 2025 00:08:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u8vk=2N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhdJr-0000gl-So
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 00:08:20 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a041f6dc-6e6b-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 02:08:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B6ADF6112C;
 Fri,  1 Aug 2025 00:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0B3C4CEEF;
 Fri,  1 Aug 2025 00:08:14 +0000 (UTC)
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
X-Inumbo-ID: a041f6dc-6e6b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754006896;
	bh=lJQIBzNL1lvveTPl1/GpzzTgX4flsXoy5JpFVJH4sek=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iqWHlRiaSt5EM0sRYeejujFmrdzm0tBI25YtuXqKpxT8qgXBrPECDHxFNP0IDOBeO
	 bF+Ofpq4l+llH5muq6xAuPGNfOPEi4NOaKVpSYkeiFd0zQ/0BRW4Jg00p/psW1Cs5A
	 nf1XdR5eArUZq6In7wUcXrCNmdWrUK3nnRMaZDX25gnfBZTIGlvLmUreI5eLUb0cRW
	 zWAvmQG1EiZ2LxT4QhxftnvBuKQZG/jxddlPSrJhG8oknpkXsYYqkl8FmD8GM40rX7
	 oAAbx3+7mLRdwr2WxuzZ91MKIjaGXy7I4LqPfOxhV6G6VZQv9EqJ/v/HjG9w7GXyBK
	 p3DjEBogUxZwg==
Date: Thu, 31 Jul 2025 17:08:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART
 emulators
In-Reply-To: <20250731192130.3948419-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2507311659220.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce a driver framework to abstract UART emulators in the hypervisor.
> 
> That allows for architecture-independent handling of virtual UARTs in the
> console driver and simplifies enabling new UART emulators.
> 
> The framework is built under CONFIG_HAS_VUART, which will be automatically
> enabled once the user enables any UART emulator.
> 
> Current implementation supports maximum of one vUART of each kind per domain.
> 
> Use new domain_has_vuart() in the console driver code to check whether to
> forward console input to the domain using vUART.
> 
> Note: existing vUARTs are deliberately *not* hooked to the new framework to
> minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and "vuart" (i.e.
> minimalistic MMIO-mapped dtuart for hwdoms on Arm) are kept unmodified.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - new patch
> - original patch from ML: https://lore.kernel.org/xen-devel/20250624035443.344099-16-dmukhin@ford.com/
> ---
>  xen/arch/arm/xen.lds.S         |   1 +
>  xen/arch/ppc/xen.lds.S         |   1 +
>  xen/arch/riscv/xen.lds.S       |   1 +
>  xen/arch/x86/xen.lds.S         |   1 +
>  xen/common/Kconfig             |   2 +
>  xen/common/Makefile            |   1 +
>  xen/common/emul/Kconfig        |   6 ++
>  xen/common/emul/Makefile       |   1 +
>  xen/common/emul/vuart/Kconfig  |   6 ++
>  xen/common/emul/vuart/Makefile |   1 +
>  xen/common/emul/vuart/vuart.c  | 112 +++++++++++++++++++++++++++++++++
>  xen/common/keyhandler.c        |   3 +
>  xen/drivers/char/console.c     |   4 ++
>  xen/include/xen/vuart.h        |  84 +++++++++++++++++++++++++
>  xen/include/xen/xen.lds.h      |  10 +++
>  15 files changed, 234 insertions(+)
>  create mode 100644 xen/common/emul/Kconfig
>  create mode 100644 xen/common/emul/Makefile
>  create mode 100644 xen/common/emul/vuart/Kconfig
>  create mode 100644 xen/common/emul/vuart/Makefile
>  create mode 100644 xen/common/emul/vuart/vuart.c
>  create mode 100644 xen/include/xen/vuart.h
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 9f30c3a13ed1..bdba7eaa4f65 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -58,6 +58,7 @@ SECTIONS
>         *(.rodata)
>         *(.rodata.*)
>         VPCI_ARRAY
> +       VUART_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>  
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 1de0b77fc6b9..f9d4e5b0dcd8 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -52,6 +52,7 @@ SECTIONS
>          *(.rodata)
>          *(.rodata.*)
>          VPCI_ARRAY
> +        VUART_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>  
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index edcadff90bfe..59dcaa5fef9a 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -47,6 +47,7 @@ SECTIONS
>          *(.rodata)
>          *(.rodata.*)
>          VPCI_ARRAY
> +        VUART_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>  
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 8e9cac75b09e..43426df33092 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -136,6 +136,7 @@ SECTIONS
>         *(.rodata)
>         *(.rodata.*)
>         VPCI_ARRAY
> +       VUART_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>  
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 16936418a6e6..4e0bd524dc43 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -1,6 +1,8 @@
>  
>  menu "Common Features"
>  
> +source "common/emul/Kconfig"
> +
>  config COMPAT
>  	bool
>  	help
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index c316957fcb36..c0734480ee4b 100644
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
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
> new file mode 100644
> index 000000000000..02f7dd6dc1a1
> --- /dev/null
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -0,0 +1,6 @@
> +config HAS_VUART
> +	bool
> +
> +menu "UART Emulation"
> +
> +endmenu
> diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
> new file mode 100644
> index 000000000000..c6400b001e85
> --- /dev/null
> +++ b/xen/common/emul/vuart/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_HAS_VUART) += vuart.o
> diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
> new file mode 100644
> index 000000000000..14a7f8bd8b79
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
> +
> +extern const struct vuart_ops *const __start_vuart_array[];
> +extern const struct vuart_ops *const __start_vuart_end[];
> +
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
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}

Maybe skip this function until we needed? Without the reference
implementation of vuart-ns16550.c it is hard to tell what it is supposed
to do.


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

This works because there is only one emulator (NS16550) but if there
were multiple possible emulators, I think we would want to only
initialize the emulator enabled in the specific domain.

One domain could only have NS16550 and another domain could only have
PL011, while both NS16550 and PL011 might be possible.

I think it is OK for now and this function can be fixed/improved when
adding the second emulator.


> +    return 0;
> +}
> +
> +/*
> + * Release any resources taken by UART emulators.
> + *
> + * NB: no flags are cleared, since currently exit() is called only during
> + * domain destroy.
> + */
> +void vuart_deinit(struct domain *d)
> +{
> +    const struct vuart_ops *vdev;
> +
> +    for_each_vuart(vdev)
> +        vdev->deinit(d);
> +}
> +
> +void vuart_dump_state(const struct domain *d)
> +{
> +    const struct vuart_ops *vdev;
> +
> +    for_each_vuart(vdev)
> +        vdev->dump_state(d);
> +}
> +
> +/*
> + * Put character to the first suitable emulated UART's FIFO.
> + */
> +int vuart_put_rx(struct domain *d, char c)
> +{
> +    const struct vuart_ops *vdev = NULL;
> +
> +    ASSERT(domain_has_vuart(d));
> +
> +    for_each_vuart(vdev)
> +        if ( vdev->put_rx )
> +            break;
> +
> +    return vdev ? vdev->put_rx(d, c) : -ENODEV;

I don't think this would work with multiple emulators possible, maybe
enable or maybe not, for the same domain.

In a situation where there is both PL011 and NS16550 enable in the Xen
kconfig, but only NS16550 enabled for this specific domain,
for_each_vuart might find PL011 as the first emulator with a put_rx
implementation, but it is not actually the one the domain can use.

I think this is OK for now, but it would have to be fixed when adding a
second emulator.


> +}
> +
> +bool domain_has_vuart(const struct domain *d)
> +{
> +    uint32_t mask = 0;
> +
> +    return !!(d->emulation_flags & mask);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index eccd97c565c6..af427d25dc0d 100644
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
>      }
>  
>      for_each_domain ( d )
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 963c7b043cd8..93254979817b 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>  #include <asm/setup.h>
>  #include <xen/sections.h>
>  #include <xen/consoled.h>
> +#include <xen/vuart.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> @@ -601,6 +602,7 @@ static void __serial_rx(char c)
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
> +         * NB: must be the first check: hardware domain may have emulated UART.
>           */
>          if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> @@ -611,6 +613,8 @@ static void __serial_rx(char c)
>           */
>          send_global_virq(VIRQ_CONSOLE);
>      }
> +    else if ( domain_has_vuart(d) )
> +        rc = vuart_put_rx(d, c);
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>      else
>          /* Deliver input to the emulated UART. */
> diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
> new file mode 100644
> index 000000000000..e843026df4b1
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
> +
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
> +
> +#endif /* CONFIG_HAS_VUART */
> +
> +#endif /* XEN_VUART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index b126dfe88792..c2da180948ca 100644
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
> +       __start_vuart_end = .;
> +#else
> +#define VUART_ARRAY
> +#endif
> +
>  #endif /* __XEN_LDS_H__ */
> -- 
> 2.34.1
> 
> 

