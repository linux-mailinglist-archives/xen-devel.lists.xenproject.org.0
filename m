Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E79B17A50
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 01:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066621.1431778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhd9C-0006hT-0k; Thu, 31 Jul 2025 23:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066621.1431778; Thu, 31 Jul 2025 23:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhd9B-0006fs-UM; Thu, 31 Jul 2025 23:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1066621;
 Thu, 31 Jul 2025 23:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qgQ=2M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhd9A-0006fm-Ex
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 23:57:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7812a1-6e6a-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 01:57:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D2F36112C;
 Thu, 31 Jul 2025 23:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92B6C4CEEF;
 Thu, 31 Jul 2025 23:57:02 +0000 (UTC)
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
X-Inumbo-ID: 0f7812a1-6e6a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754006224;
	bh=Xo7qs4DFTgG01kiMalaOp/Jomxu+Fs69u6SPWDnGc2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mUhwLTFmGkmI6lQ7atvup1dw21+NclVSJbeN3DkVlD6A2b1Xq+5Q9IQEJYeGrGLZV
	 Y9FgBsLeeBo4GzJQrisCJFv81kN53/L1DnRON4MHhowauSs+b1csGQIUlvqjqgjKA6
	 ihXAFk4CJeLmK7N/tSGKs18fBzyamG3I+27Asx3oIlVkepXwqZ5BUprbH9pY97kRBA
	 JLBnUWx+MnUi+mFrKdvXW8mJQwVUU2EpoWC9VraAxoBarbheejdfCsQydq7E+rbNPx
	 E002L9v6nwaSe4UBdoAUtKVeT9sAJqHZvctnDF8zzgs9PA0clm3V0gc2/RoCYjPpa1
	 LmDsb/LViSLWg==
Date: Thu, 31 Jul 2025 16:57:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible
 UART emulator (x86)
In-Reply-To: <20250731192130.3948419-6-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2507311647480.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-6-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add initial in-hypervisor emulator for NS8250/NS16x50-compatible UARTs under
> CONFIG_VUART_NS16550 for x86 port of Xen.
> 
> x86 port of Xen lacks vUART facility similar to Arm's SBSA emulator to support
> x86 guest OS bring up in the embedded setups.
> 
> In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
> early guest firmware and/or OS bringup debugging, because it eliminates
> dependency on the external emulator (qemu) being operational by the time
> domains are created.
> 
> The emulator also allows to forward the physical console input to the x86
> domain which is useful when a system has only one physical UART for early
> debugging and this UART is owned by Xen. Such functionality is limited to dom0
> use currently.
> 
> By default, CONFIG_VUART_NS16550 enables emulation of NS16550 at I/O port
> 0x3f8, IRQ#4 in guest OS (legacy COM1).
> 
> Legacy COM resources can be selected at built-time and cannot be configured
> per-domain via .cfg or DT yet.
> 
> Introduce new emulation flag for virtual UART on x86 and plumb it through
> domain creation code so NS16550 emulator can be instantiated properly.
> 
> Please refer to the NS16550 emulator code for full list of limitations.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - feedback addressed
> - adjusted to new vUART framework APIs
> - Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-21-c5d36b31d66c@ford.com/
> ---
>  xen/arch/x86/hvm/hvm.c                |    9 +
>  xen/arch/x86/include/asm/domain.h     |    4 +-
>  xen/arch/x86/include/asm/hvm/domain.h |    4 +
>  xen/common/emul/vuart/Kconfig         |   48 ++
>  xen/common/emul/vuart/Makefile        |    1 +
>  xen/common/emul/vuart/vuart-ns16550.c | 1009 +++++++++++++++++++++++++
>  xen/common/emul/vuart/vuart.c         |    4 +
>  xen/include/public/arch-x86/xen.h     |    4 +-
>  xen/include/xen/resource.h            |    3 +
>  9 files changed, 1084 insertions(+), 2 deletions(-)
>  create mode 100644 xen/common/emul/vuart/vuart-ns16550.c
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index b7edb1d6555d..1156e7ebcc4c 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -31,6 +31,7 @@
>  #include <xen/nospec.h>
>  #include <xen/vm_event.h>
>  #include <xen/console.h>
> +#include <xen/vuart.h>
>  #include <asm/shadow.h>
>  #include <asm/hap.h>
>  #include <asm/current.h>
> @@ -702,6 +703,10 @@ int hvm_domain_initialise(struct domain *d,
>      if ( rc != 0 )
>          goto fail1;
>  
> +    rc = vuart_init(d, NULL);
> +    if ( rc != 0 )
> +        goto out_vioapic_deinit;
> +
>      stdvga_init(d);
>  
>      rtc_init(d);
> @@ -725,6 +730,8 @@ int hvm_domain_initialise(struct domain *d,
>      return 0;
>  
>   fail2:
> +    vuart_deinit(d);
> + out_vioapic_deinit:
>      vioapic_deinit(d);
>   fail1:
>      if ( is_hardware_domain(d) )
> @@ -787,6 +794,8 @@ void hvm_domain_destroy(struct domain *d)
>      if ( hvm_funcs.domain_destroy )
>          alternative_vcall(hvm_funcs.domain_destroy, d);
>  
> +    vuart_deinit(d);
> +
>      vioapic_deinit(d);
>  
>      XFREE(d->arch.hvm.pl_time);
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index eafd5cfc903d..1ecc7c2cae32 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -468,6 +468,7 @@ struct arch_domain
>  #define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
>  #define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
>  #define X86_EMU_VPCI     XEN_X86_EMU_VPCI
> +#define X86_EMU_NS16550  XEN_X86_EMU_NS16550
>  #else
>  #define X86_EMU_LAPIC    0
>  #define X86_EMU_HPET     0
> @@ -479,6 +480,7 @@ struct arch_domain
>  #define X86_EMU_IOMMU    0
>  #define X86_EMU_USE_PIRQ 0
>  #define X86_EMU_VPCI     0
> +#define X86_EMU_NS16550  0
>  #endif
>  
>  #define X86_EMU_PIT     XEN_X86_EMU_PIT
> @@ -489,7 +491,7 @@ struct arch_domain
>                                   X86_EMU_IOAPIC | X86_EMU_PIC |         \
>                                   X86_EMU_VGA | X86_EMU_IOMMU |          \
>                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
> -                                 X86_EMU_VPCI)
> +                                 X86_EMU_VPCI | X86_EMU_NS16550)
>  
>  #define has_vlapic(d)      (!!((d)->emulation_flags & X86_EMU_LAPIC))
>  #define has_vhpet(d)       (!!((d)->emulation_flags & X86_EMU_HPET))
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 333501d5f2ac..9945b16d1a6e 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -149,6 +149,10 @@ struct hvm_domain {
>  #ifdef CONFIG_MEM_SHARING
>      struct mem_sharing_domain mem_sharing;
>  #endif
> +
> +#ifdef CONFIG_VUART_NS16550
> +    void *vuart; /* Virtual UART handle. */
> +#endif
>  };
>  
>  #endif /* __ASM_X86_HVM_DOMAIN_H__ */
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
> index 02f7dd6dc1a1..ebefd90d913e 100644
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -3,4 +3,52 @@ config HAS_VUART
>  
>  menu "UART Emulation"
>  
> +config VUART_NS16550
> +	bool "NS16550-compatible UART Emulation" if EXPERT
> +	depends on X86 && HVM
> +	select HAS_VUART
> +	help
> +	  In-hypervisor NS16550/NS16x50 UART emulation.
> +
> +	  Only legacy PC I/O ports are emulated.
> +
> +	  This is strictly for testing purposes (such as early HVM guest console),
> +	  and not appropriate for use in production.
> +
> +choice VUART_NS16550_PC
> +	prompt "IBM PC COM resources"
> +	depends on VUART_NS16550
> +	default VUART_NS16550_PC_COM1
> +	help
> +	  Default emulated NS16550 resources.
> +
> +config VUART_NS16550_PC_COM1
> +	bool "COM1 (I/O port 0x3f8, IRQ#4)"
> +
> +config VUART_NS16550_PC_COM2
> +	bool "COM2 (I/O port 0x2f8, IRQ#3)"
> +
> +config VUART_NS16550_PC_COM3
> +	bool "COM3 (I/O port 0x3e8, IRQ#4)"
> +
> +config VUART_NS16550_PC_COM4
> +	bool "COM4 (I/O port 0x2e8, IRQ#3)"
> +
> +endchoice
> +
> +config VUART_NS16550_LOG_LEVEL
> +	int "UART emulator verbosity level"
> +	range 0 3
> +	default "1"
> +	depends on VUART_NS16550
> +	help
> +	  Set the default log level of UART emulator.
> +	  See include/xen/config.h for more details.
> +
> +config VUART_NS16550_DEBUG
> +	bool "UART emulator development debugging"
> +	depends on VUART_NS16550
> +	help
> +	  Enable development debugging.
> +
>  endmenu
> diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
> index c6400b001e85..85650ca5d8ce 100644
> --- a/xen/common/emul/vuart/Makefile
> +++ b/xen/common/emul/vuart/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_HAS_VUART) += vuart.o
> +obj-$(CONFIG_VUART_NS16550) += vuart-ns16550.o
> diff --git a/xen/common/emul/vuart/vuart-ns16550.c b/xen/common/emul/vuart/vuart-ns16550.c
> new file mode 100644
> index 000000000000..48bbf58264fe
> --- /dev/null
> +++ b/xen/common/emul/vuart/vuart-ns16550.c
> @@ -0,0 +1,1009 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * NS16550-compatible UART Emulator.
> + *
> + * See:
> + * - Serial and UART Tutorial:
> + *     https://download.freebsd.org/doc/en/articles/serial-uart/serial-uart_en.pdf
> + * - UART w/ 16 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> + * - UART w/ 64 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
> + *
> + * Limitations:
> + * - Only x86;
> + * - Only HVM domains support (build-time), PVH domains are not supported yet;
> + * - Only legacy COM{1,2,3,4} resources via Kconfig, custom I/O ports/IRQs
> + *   are not supported;
> + * - Only Xen console as a backend, no inter-domain communication (similar to
> + *   vpl011 on Arm);
> + * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> + * - No toolstack integration;
> + * - No baud rate emulation (reports 115200 baud to the guest OS);
> + * - No FIFO-less mode emulation;
> + * - No RX FIFO interrupt moderation (FCR) emulation;
> + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> + *   friends);
> + * - No ISA IRQ sharing allowed;
> + * - No MMIO-based UART emulation.
> + */
> +
> +#define pr_prefix               "ns16550"
> +#define pr_fmt(fmt)             pr_prefix ": " fmt
> +#define pr_log_level            CONFIG_VUART_NS16550_LOG_LEVEL
> +
> +#include <xen/8250-uart.h>
> +#include <xen/console.h>
> +#include <xen/iocap.h>
> +#include <xen/ioreq.h>
> +#include <xen/resource.h>
> +#include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <public/io/console.h>
> +
> +#define pr_err(fmt, args...) do { \
> +    gprintk(KERN_ERR, pr_fmt(fmt), ## args); \
> +} while (0)
> +
> +#define pr_warn(fmt, args...) do { \
> +    if ( pr_log_level >= 1) \
> +        gprintk(KERN_WARNING, pr_fmt(fmt), ## args); \
> +} while (0)
> +
> +#define pr_info(fmt, args...) do { \
> +    if ( pr_log_level >= 2 ) \
> +        gprintk(KERN_INFO, pr_fmt(fmt), ## args); \
> +} while (0)
> +
> +#define pr_debug(fmt, args...) do { \
> +    if ( pr_log_level >= 3 ) \
> +        gprintk(KERN_DEBUG, pr_fmt(fmt), ## args); \
> +} while (0)
> +
> +#if defined(CONFIG_VUART_NS16550_PC_COM1)
> +#define X86_PC_UART_IDX         0
> +#elif defined(CONFIG_VUART_NS16550_PC_COM2)
> +#define X86_PC_UART_IDX         1
> +#elif defined(CONFIG_VUART_NS16550_PC_COM3)
> +#define X86_PC_UART_IDX         2
> +#elif defined(CONFIG_VUART_NS16550_PC_COM4)
> +#define X86_PC_UART_IDX         3
> +#else
> +#error "Unsupported I/O port"
> +#endif
> +
> +#ifdef CONFIG_VUART_NS16550_DEBUG
> +#define guest_prefix            "FROM GUEST "
> +#else
> +#define guest_prefix            ""
> +#endif
> +
> +/*
> + * Number of supported registers in the UART.
> + */
> +#define NS16550_REGS_NUM        ( UART_SCR + 1 )
> +
> +/*
> + * Number of emulated registers.
> + *
> + * - Emulated registers [0..NS16550_REGS_NUM] are R/W registers for DLAB=0.
> + * - DLAB=1, R/W, DLL            = NS16550_REGS_NUM + 0
> + * - DLAB=1, R/W, DLM            = NS16550_REGS_NUM + 1
> + * -         R/O, IIR (IIR_THR)  = NS16550_REGS_NUM + 2
> + */
> +#define NS16550_EMU_REGS_NUM    ( NS16550_REGS_NUM + 3 )
> +
> +/*
> + * Virtual NS16550 device state.
> + */
> +struct vuart_ns16550 {
> +    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
> +    uint8_t regs[NS16550_EMU_REGS_NUM]; /* Emulated registers */
> +    unsigned int irq;                   /* Emulated IRQ# */
> +    uint64_t io_addr;                   /* Emulated I/O region base address */
> +    uint64_t io_size;                   /* Emulated I/O region size */
> +    const char *name;                   /* Device name */
> +    struct domain *owner;               /* Owner domain */
> +    spinlock_t lock;                    /* Protection */
> +};
> +
> +/*
> + * Virtual device description.
> + */
> +struct virtdev_desc {
> +    const char *name;
> +    const struct resource *res;
> +};
> +
> +/*
> + * Legacy IBM PC NS16550 resources.
> + * There are only 4 I/O port ranges, hardcoding all of them here.
> + */
> +static const struct virtdev_desc x86_pc_uarts[4] = {
> +    [0] = {
> +        .name = "COM1",
> +        .res = (const struct resource[]){
> +            { .type = IORESOURCE_IO,  .addr = 0x3f8, .size = NS16550_REGS_NUM },
> +            { .type = IORESOURCE_IRQ, .addr = 4,     .size = 1 },
> +            { .type = IORESOURCE_UNKNOWN },
> +        },
> +    },
> +    [1] = {
> +        .name = "COM2",
> +        .res = (const struct resource[]){
> +            { .type = IORESOURCE_IO,  .addr = 0x2f8, .size = NS16550_REGS_NUM },
> +            { .type = IORESOURCE_IRQ, .addr = 3,     .size = 1 },
> +            { .type = IORESOURCE_UNKNOWN },
> +        },
> +    },
> +    [2] = {
> +        .name = "COM3",
> +        .res = (const struct resource[]){
> +            { .type = IORESOURCE_IO,  .addr = 0x3e8, .size = NS16550_REGS_NUM },
> +            { .type = IORESOURCE_IRQ, .addr = 4,     .size = 1 },
> +            { .type = IORESOURCE_UNKNOWN },
> +        },
> +    },
> +    [3] = {
> +        .name = "COM4",
> +        .res = (const struct resource[]){
> +            { .type = IORESOURCE_IO,  .addr = 0x2e8, .size = NS16550_REGS_NUM },
> +            { .type = IORESOURCE_IRQ, .addr = 3,     .size = 1 },
> +            { .type = IORESOURCE_UNKNOWN },
> +        },
> +    },
> +};
> +
> +static bool ns16550_fifo_rx_empty(const struct vuart_ns16550 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->in_prod == cons->in_cons;
> +}
> +
> +static bool ns16550_fifo_rx_full(const struct vuart_ns16550 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->in_prod - cons->in_cons == ARRAY_SIZE(cons->in);
> +}
> +
> +static void ns16550_fifo_rx_reset(struct vuart_ns16550 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    cons->in_cons = cons->in_prod;
> +}
> +
> +static int ns16550_fifo_rx_getchar(struct vuart_ns16550 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    int rc;
> +
> +    if ( ns16550_fifo_rx_empty(vdev) )
> +    {
> +        pr_debug("%s: RX FIFO empty\n", vdev->name);
> +        rc = -ENODATA;
> +    }
> +    else
> +    {
> +        rc = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
> +        cons->in_cons++;
> +    }
> +
> +    return rc;
> +}
> +
> +static int ns16550_fifo_rx_putchar(struct vuart_ns16550 *vdev, char c)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    int rc;
> +
> +    /*
> +     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
> +     * of the THR.
> +     */
> +    if ( ns16550_fifo_rx_full(vdev) )
> +    {
> +        pr_debug("%s: RX FIFO full; resetting\n", vdev->name);
> +        ns16550_fifo_rx_reset(vdev);
> +        rc = -ENOSPC;
> +    }
> +    else
> +        rc = 0;
> +
> +    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] = c;
> +    cons->in_prod++;
> +
> +    return rc;
> +}
> +
> +static bool ns16550_fifo_tx_empty(const struct vuart_ns16550 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->out_prod == cons->out_cons;
> +}
> +
> +static void ns16550_fifo_tx_reset(struct vuart_ns16550 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    cons->out_prod = 0;
> +    ASSERT(cons->out_cons == cons->out_prod);
> +}
> +
> +/*
> + * Flush cached output to Xen console.
> + */
> +static void ns16550_fifo_tx_flush(struct vuart_ns16550 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    if ( ns16550_fifo_tx_empty(vdev) )
> +        return;
> +
> +    ASSERT(cons->out_prod < ARRAY_SIZE(cons->out));
> +    cons->out[cons->out_prod] = '\0';
> +    cons->out_prod++;
> +
> +    guest_printk(vdev->owner, guest_prefix "%s", cons->out);
> +
> +    ns16550_fifo_tx_reset(vdev);
> +}
> +
> +/*
> + * Accumulate guest OS output before sending to Xen console.
> + */
> +static void ns16550_fifo_tx_putchar(struct vuart_ns16550 *vdev, char ch)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    if ( !is_console_printable(ch) )
> +        return;
> +
> +    if ( ch != '\0' )
> +    {
> +        cons->out[cons->out_prod] = ch;
> +        cons->out_prod++;
> +    }
> +
> +    if ( cons->out_prod == ARRAY_SIZE(cons->out) - 1 ||
> +         ch == '\n' || ch == '\0' )
> +        ns16550_fifo_tx_flush(vdev);
> +}
> +
> +static inline uint8_t cf_check ns16550_dlab_get(const struct vuart_ns16550 *vdev)
> +{
> +    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
> +}
> +
> +static bool cf_check ns16550_iir_check_lsi(const struct vuart_ns16550 *vdev)
> +{
> +    return !!(vdev->regs[UART_LSR] & UART_LSR_MASK);
> +}
> +
> +static bool cf_check ns16550_iir_check_rda(const struct vuart_ns16550 *vdev)
> +{
> +    return !ns16550_fifo_rx_empty(vdev);
> +}
> +
> +static bool cf_check ns16550_iir_check_thr(const struct vuart_ns16550 *vdev)
> +{
> +    return !!(vdev->regs[NS16550_REGS_NUM + UART_IIR] & UART_IIR_THR);
> +}
> +
> +static bool cf_check ns16550_iir_check_msi(const struct vuart_ns16550 *vdev)
> +{
> +    return !!(vdev->regs[UART_MSR] & UART_MSR_CHANGE);
> +}
> +
> +/*
> + * Get the interrupt identity reason.
> + *
> + * IIR is re-calculated once called, because NS16550 always reports high
> + * priority events first.
> + * regs[NS16550_REGS_NUM + UART_IIR] is used to store THR reason only.
> + */
> +static uint8_t ns16550_iir_get(const struct vuart_ns16550 *vdev)
> +{
> +    /*
> +     * Interrupt identity reasons by priority.
> +     * NB: high priority are at lower indexes below.
> +     */
> +    static const struct {
> +        bool (*check)(const struct vuart_ns16550 *vdev);
> +        uint8_t ier;
> +        uint8_t iir;
> +    } iir_by_prio[] = {
> +        [0] = { ns16550_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
> +        [1] = { ns16550_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
> +        [2] = { ns16550_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
> +        [3] = { ns16550_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
> +    };
> +    const uint8_t *regs = vdev->regs;
> +    uint8_t iir = 0;
> +    unsigned int i;
> +
> +    /*
> +     * NB: every interaction w/ NS16550 registers (except DLAB=1) goes
> +     * through that call.
> +     */
> +    ASSERT(spin_is_locked(&vdev->lock));
> +
> +    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
> +    {
> +        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
> +             iir_by_prio[i].check(vdev) )
> +            break;
> +
> +    }
> +    if ( i == ARRAY_SIZE(iir_by_prio) )
> +        iir |= UART_IIR_NOINT;
> +    else
> +        iir |= iir_by_prio[i].iir;
> +
> +    if ( regs[UART_FCR] & UART_FCR_ENABLE )
> +        iir |= UART_IIR_FE;
> +
> +    return iir;
> +}
> +
> +static void ns16550_irq_assert(const struct vuart_ns16550 *vdev)
> +{
> +    struct domain *d = vdev->owner;
> +    int vector;
> +
> +    if ( has_vpic(d) ) /* HVM */
> +        vector = hvm_isa_irq_assert(d, vdev->irq, vioapic_get_vector);
> +    else
> +        ASSERT_UNREACHABLE();
> +
> +    pr_debug("%s: IRQ#%d vector %d assert\n", vdev->name, vdev->irq, vector);
> +}
> +
> +static void ns16550_irq_deassert(const struct vuart_ns16550 *vdev)
> +{
> +    struct domain *d = vdev->owner;
> +
> +    if ( has_vpic(d) ) /* HVM */
> +        hvm_isa_irq_deassert(d, vdev->irq);
> +    else
> +        ASSERT_UNREACHABLE();
> +
> +    pr_debug("%s: IRQ#%d deassert\n", vdev->name, vdev->irq);
> +}
> +
> +/*
> + * Assert/deassert virtual NS16550 interrupt line.
> + */
> +static void ns16550_irq_check(const struct vuart_ns16550 *vdev)
> +{
> +    uint8_t iir = ns16550_iir_get(vdev);
> +
> +    if ( iir & UART_IIR_NOINT )
> +        ns16550_irq_assert(vdev);
> +    else
> +        ns16550_irq_deassert(vdev);
> +
> +    pr_debug("%s: IRQ#%d IIR 0x%02x %s\n", vdev->name, vdev->irq, iir,
> +             (iir & UART_IIR_NOINT) ? "deassert" : "assert");
> +}
> +
> +/*
> + * Emulate 8-bit write access to NS16550 register.
> + */
> +static int ns16550_io_write8(
> +    struct vuart_ns16550 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    uint8_t *regs = vdev->regs;
> +    uint8_t val = *data;
> +    int rc = 0;
> +
> +    if ( ns16550_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
> +        regs[NS16550_REGS_NUM + reg] = val;
> +    else
> +    {
> +        switch ( reg )
> +        {
> +        case UART_THR:
> +            if ( regs[UART_MCR] & UART_MCR_LOOP )
> +            {
> +                (void)ns16550_fifo_rx_putchar(vdev, val);
> +                regs[UART_LSR] |= UART_LSR_OE;

Why is UART_LSR_OE set unconditionally here instead of checking if
ns16550_fifo_rx_putchar returned -ENOSPC?


> +            }
> +            else
> +                ns16550_fifo_tx_putchar(vdev, val);
> +
> +            regs[NS16550_REGS_NUM + UART_IIR] |= UART_IIR_THR;
> +
> +            break;
> +
> +        case UART_IER:
> +            /*
> +             * NB: Make sure THR interrupt is re-triggered once guest OS
> +             * re-enabled ETHREI in EIR.
> +             */
> +            if ( val & regs[UART_IER] & UART_IER_ETHREI )
> +                regs[NS16550_REGS_NUM + UART_IIR] |= UART_IIR_THR;
> +
> +            regs[UART_IER] = val & UART_IER_MASK;
> +
> +            break;
> +
> +        case UART_FCR: /* WO */
> +            if ( val & UART_FCR_RESERVED0 )
> +                pr_warn("%s: FCR: attempt to set reserved bit: %x\n",
> +                        vdev->name, UART_FCR_RESERVED0);
> +
> +            if ( val & UART_FCR_RESERVED1 )
> +                pr_warn("%s: FCR: attempt to set reserved bit: %x\n",
> +                        vdev->name, UART_FCR_RESERVED1);
> +
> +            if ( val & UART_FCR_CLRX )
> +                ns16550_fifo_rx_reset(vdev);
> +
> +            if ( val & UART_FCR_CLTX )
> +                ns16550_fifo_tx_flush(vdev);
> +
> +            if ( val & UART_FCR_ENABLE )
> +                val &= UART_FCR_ENABLE | UART_FCR_DMA | UART_FCR_TRG_MASK;
> +            else
> +                val = 0;
> +
> +            regs[UART_FCR] = val;
> +
> +            break;
> +
> +        case UART_LCR:
> +            regs[UART_LCR] = val;
> +            break;
> +
> +        case UART_MCR: {
> +            uint8_t msr_curr, msr_next, msr_delta;
> +
> +            msr_curr = regs[UART_MSR];
> +            msr_next = 0;
> +            msr_delta = 0;
> +
> +            if ( val & UART_MCR_RESERVED0 )
> +                pr_warn("%s: MCR: attempt to set reserved bit: %x\n",
> +                        vdev->name, UART_MCR_RESERVED0);
> +
> +            if ( val & UART_MCR_TCRTLR )
> +                pr_warn("%s: MCR: not supported: %x\n",
> +                        vdev->name, UART_MCR_TCRTLR);
> +
> +            if ( val & UART_MCR_RESERVED1 )
> +                pr_warn("%s: MCR: attempt to set reserved bit: %x\n",
> +                        vdev->name, UART_MCR_RESERVED1);
> +
> +            /* Set modem status */
> +            if ( val & UART_MCR_LOOP )
> +            {
> +                if ( val & UART_MCR_DTR )
> +                    msr_next |= UART_MSR_DSR;
> +                if ( val & UART_MCR_RTS )
> +                    msr_next |= UART_MSR_CTS;
> +                if ( val & UART_MCR_OUT1 )
> +                    msr_next |= UART_MSR_RI;
> +                if ( val & UART_MCR_OUT2 )
> +                    msr_next |= UART_MSR_DCD;
> +            }
> +            else
> +                msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
> +
> +            /* Calculate changes in modem status */
> +            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
> +                msr_delta |= UART_MSR_DCTS;
> +            if ( (msr_curr & UART_MCR_RTS) ^ (msr_next & UART_MCR_RTS) )
> +                msr_delta |= UART_MSR_DDSR;

Should we check UART_MSR_DSR instead of UART_MCR_RTS to set
UART_MSR_DDSR ?


> +            if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
> +                msr_delta |= UART_MSR_TERI;
> +            if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
> +                msr_delta |= UART_MSR_DDCD;
> +
> +            regs[UART_MCR] = val & UART_MCR_MASK;
> +            regs[UART_MSR] = msr_next | msr_delta;
> +
> +            break;
> +        }
> +
> +        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
> +        case UART_SCR:
> +            regs[UART_SCR] = val;
> +            break;
> +
> +        case UART_LSR: /* RO */
> +        case UART_MSR: /* RO */
> +        default:
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        ns16550_irq_check(vdev);
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 16-bit write access to NS16550 register.
> + * NB: some guest OSes use outw() to access UART_DLL.
> + */
> +static int ns16550_io_write16(
> +    struct vuart_ns16550 *vdev, uint32_t reg, uint16_t *data)
> +{
> +    uint16_t val = *data;
> +    int rc;
> +
> +    if ( ns16550_dlab_get(vdev) && reg == UART_DLL )
> +    {
> +        vdev->regs[NS16550_REGS_NUM + UART_DLL] = val & 0xff;
> +        vdev->regs[NS16550_REGS_NUM + UART_DLM] = (val >> 8) & 0xff;
> +        rc = 0;
> +    }
> +    else
> +        rc = -EINVAL;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate write access to NS16550 register.
> + */
> +static int ns16550_io_write(
> +    struct vuart_ns16550 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
> +{
> +    int rc;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        rc = ns16550_io_write8(vdev, reg, (uint8_t *)data);
> +        break;
> +
> +    case 2:
> +        rc = ns16550_io_write16(vdev, reg, (uint16_t *)data);
> +        break;
> +
> +    default:
> +        rc = -EINVAL;
> +        break;
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 8-bit read access to NS16550 register.
> + */
> +static int ns16550_io_read8(
> +    struct vuart_ns16550 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    uint8_t *regs = vdev->regs;
> +    uint8_t val = 0xff;
> +    int rc = 0;
> +
> +    if ( ns16550_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
> +        val = regs[NS16550_REGS_NUM + reg];
> +    else {
> +        switch ( reg )
> +        {
> +        case UART_RBR:
> +            /* NB: do not forget to clear overrun condition */
> +            regs[UART_LSR] &= ~UART_LSR_OE;
> +
> +            rc = ns16550_fifo_rx_getchar(vdev);
> +            if ( rc >= 0 )
> +                val = (uint8_t)rc;
> +
> +            rc = 0;
> +            break;
> +
> +        case UART_IER:
> +            val = regs[UART_IER];
> +            break;
> +
> +        case UART_IIR: /* RO */
> +            val = ns16550_iir_get(vdev);
> +
> +            /* NB: clear IIR scratch location */
> +            if ( val & UART_IIR_THR )
> +                regs[NS16550_REGS_NUM + UART_IIR] &= ~UART_IIR_THR;
> +
> +            break;
> +
> +        case UART_LCR:
> +            val = regs[UART_LCR];
> +            break;
> +
> +        case UART_MCR:
> +            val = regs[UART_MCR];
> +            break;
> +
> +        case UART_LSR:
> +            val = regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
> +            if ( ns16550_fifo_rx_empty(vdev) )
> +                val &= ~UART_LSR_DR;
> +            else
> +                val |= UART_LSR_DR;
> +
> +            regs[UART_LSR] = val & ~UART_LSR_MASK;
> +
> +            break;
> +
> +        case UART_MSR:
> +            val = regs[UART_MSR];
> +            regs[UART_MSR] &= ~UART_MSR_CHANGE;
> +            break;
> +
> +        case UART_SCR:
> +            val = regs[UART_SCR];
> +            break;
> +
> +        default:
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        ns16550_irq_check(vdev);
> +    }
> +
> +    *data = val;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate 16-bit read access to NS16550 register.
> + */
> +static int ns16550_io_read16(
> +    struct vuart_ns16550 *vdev, uint32_t reg, uint16_t *data)
> +{
> +    uint16_t val = 0xffff;
> +    int rc = -EINVAL;
> +
> +    if ( ns16550_dlab_get(vdev) && reg == UART_DLL )
> +    {
> +        val = vdev->regs[NS16550_REGS_NUM + UART_DLM] << 8 |
> +              vdev->regs[NS16550_REGS_NUM + UART_DLL];
> +        rc = 0;
> +    }
> +
> +    *data = val;
> +
> +    return rc;
> +}
> +
> +/*
> + * Emulate read access to NS16550 register.
> + */
> +static int ns16550_io_read(
> +    struct vuart_ns16550 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
> +{
> +    int rc;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        rc = ns16550_io_read8(vdev, reg, (uint8_t *)data);
> +        break;
> +
> +    case 2:
> +        rc = ns16550_io_read16(vdev, reg, (uint16_t *)data);
> +        break;
> +
> +    default:
> +        *data = 0xffffffff;
> +        rc = -EINVAL;
> +        break;
> +    }
> +
> +    return rc;
> +}
> +
> +static void cf_check ns16550_dump_state(const struct domain *d)
> +{
> +    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
> +    const struct xencons_interface *cons;
> +    const uint8_t *regs;
> +
> +    if ( !vdev )
> +        return;
> +
> +    /* Allow printing state in case of a deadlock. */
> +    if ( !spin_trylock(&vdev->lock) )
> +        return;
> +
> +    cons = &vdev->cons;
> +    regs = &vdev->regs[0];
> +
> +    printk("Virtual " pr_prefix " (%s) I/O port 0x%04"PRIx64" IRQ#%d owner %pd\n",
> +            vdev->name, vdev->io_addr, vdev->irq, vdev->owner);
> +
> +    printk("  RX FIFO size %ld in_prod %d in_cons %d used %d\n",
> +            ARRAY_SIZE(cons->in), cons->in_prod, cons->in_cons,
> +            cons->in_prod - cons->in_cons);
> +
> +    printk("  TX FIFO size %ld out_prod %d out_cons %d used %d\n",
> +            ARRAY_SIZE(cons->out), cons->out_prod, cons->out_cons,
> +            cons->out_prod - cons->out_cons);
> +
> +    printk("  %02"PRIx8" RBR %02"PRIx8" THR %02"PRIx8" DLL %02"PRIx8" DLM %02"PRIx8"\n",
> +            UART_RBR,
> +            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons)],
> +            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons)],
> +            regs[NS16550_REGS_NUM + UART_DLL],
> +            regs[NS16550_REGS_NUM + UART_DLM]);
> +
> +    printk("  %02"PRIx8" IER %02"PRIx8"\n", UART_IER, regs[UART_IER]);
> +
> +    printk("  %02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
> +            UART_FCR, regs[UART_FCR], ns16550_iir_get(vdev));
> +
> +    printk("  %02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, regs[UART_LCR]);
> +    printk("  %02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, regs[UART_MCR]);
> +    printk("  %02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, regs[UART_LSR]);
> +    printk("  %02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, regs[UART_MSR]);
> +    printk("  %02"PRIx8" SCR %02"PRIx8"\n", UART_SCR, regs[UART_SCR]);
> +
> +    spin_unlock(&vdev->lock);
> +}
> +
> +/*
> + * Emulate I/O access to NS16550 register.
> + * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enabled.
> + */
> +static int cf_check ns16550_io_handle(
> +    int dir, unsigned int addr, unsigned int size, uint32_t *data)
> +{
> +#define op(dir)     (((dir) == IOREQ_WRITE) ? 'W' : 'R')
> +    struct domain *d = rcu_lock_current_domain();
> +    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
> +    uint32_t reg;
> +    unsigned dlab;
> +    int rc;
> +
> +    if ( !vdev )
> +    {
> +        pr_err("%s: %c io 0x%04x %d: not initialized\n",
> +                vdev->name, op(dir), addr, size);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
> +    if ( d != vdev->owner )
> +    {
> +        pr_err("%s: %c io 0x%04x %d: does not match current domain %pv\n",
> +                vdev->name, op(dir), addr, size, d);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
> +    reg = addr - vdev->io_addr;
> +    if ( !IS_ALIGNED(reg, size) )
> +    {
> +        pr_err("%s: %c 0x%04x %d: unaligned access\n",
> +                vdev->name, op(dir), addr, size);
> +        goto out;
> +    }
> +
> +    dlab = ns16550_dlab_get(vdev);
> +    if ( reg >= NS16550_REGS_NUM )
> +    {
> +        pr_err("%s: %c io 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": not implemented\n",
> +                vdev->name, op(dir), addr, size,
> +                dlab, reg, *data);
> +        goto out;
> +    }
> +
> +    spin_lock(&vdev->lock);
> +
> +    if ( dir == IOREQ_WRITE )
> +    {
> +        pr_debug("%s: %c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
> +                 vdev->name, op(dir), addr, size,
> +                 dlab, reg, *data);
> +        rc = ns16550_io_write(vdev, reg, size, data);
> +    }
> +    else
> +    {
> +        rc = ns16550_io_read(vdev, reg, size, data);
> +        pr_debug("%s: %c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
> +                 vdev->name, op(dir), addr, size,
> +                 dlab, reg, *data);
> +    }
> +    if ( rc < 0 )
> +        pr_err("%s: %c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": unsupported access\n",
> +               vdev->name, op(dir), addr, size,
> +               dlab, reg, *data);
> +
> +    spin_unlock(&vdev->lock);
> +#ifdef CONFIG_VUART_NS16550_DEBUG
> +    ns16550_dump_state(d);
> +#endif
> +
> +out:
> +    rcu_unlock_domain(d);
> +
> +    return X86EMUL_OKAY;
> +#undef op
> +}
> +
> +static int cf_check ns16550_init(struct domain *d,
> +                                 struct vuart_params *params)
> +{
> +    const struct virtdev_desc *desc = &x86_pc_uarts[X86_PC_UART_IDX];
> +    const struct resource *r = desc->res;
> +    const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;
> +    struct vuart_ns16550 *vdev;
> +    int rc;
> +
> +    BUG_ON(d->arch.hvm.vuart);
> +
> +    if ( !is_hvm_domain(d) )
> +    {
> +        pr_err("%s: not an HVM domain\n", desc->name);
> +        return -ENOSYS;
> +    }
> +
> +    vdev = xvzalloc(typeof(*vdev));
> +    if ( !vdev )
> +    {
> +        pr_err("%s: failed to allocate memory\n", desc->name);
> +        return -ENOMEM;
> +    }
> +
> +    for_each_resource(r)
> +    {
> +        if ( r->type & IORESOURCE_IO )
> +        {
> +            /* Disallow sharing physical I/O port */
> +            rc = ioports_deny_access(d, r->addr, r->addr + r->size - 1);
> +            if ( rc )
> +            {
> +                pr_err("%s: virtual I/O port range [0x%04x"PRIx64"..0x%04x"PRIx64"]: conflict w/ physical range\n",
> +                        desc->name,
> +                        (unsigned int)r->addr,
> +                        (unsigned int)(r->addr + r->size - 1));
> +                return rc;
> +            }
> +
> +            register_portio_handler(d, r->addr, r->size, ns16550_io_handle);
> +
> +            vdev->io_addr = r->addr;
> +            vdev->io_size = r->size;
> +        }
> +        else if ( r->type & IORESOURCE_IRQ )
> +        {
> +            /* Disallow sharing physical IRQ */
> +            rc = irq_deny_access(d, r->addr);
> +            if ( rc )
> +            {
> +                pr_err("%s: virtual IRQ#%"PRIu64": conflict w/ physical IRQ: %d\n",
> +                        desc->name, r->addr, rc);
> +                return rc;
> +            }
> +
> +            vdev->irq = r->addr;
> +        }
> +        else
> +            ASSERT_UNREACHABLE();
> +    }
> +
> +    spin_lock_init(&vdev->lock);
> +
> +    vdev->owner = d;
> +    vdev->name = desc->name;
> +
> +    /* NB: report 115200 baud rate */
> +    vdev->regs[NS16550_REGS_NUM + UART_DLL] = divisor & 0xff;
> +    vdev->regs[NS16550_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
> +
> +    /* NS16550 shall assert UART_IIR_THR whenever transmitter is empty. */
> +    vdev->regs[NS16550_REGS_NUM + UART_IIR] = UART_IIR_THR;
> +
> +    d->arch.hvm.vuart = vdev;
> +
> +    spin_lock(&vdev->lock);
> +    ns16550_irq_check(vdev);
> +    spin_unlock(&vdev->lock);
> +
> +    return 0;
> +}
> +
> +static void cf_check ns16550_deinit(struct domain *d)
> +{
> +    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
> +
> +    if ( !vdev )
> +        return;
> +
> +    spin_lock(&vdev->lock);
> +
> +    ns16550_fifo_tx_flush(vdev);
> +
> +    spin_unlock(&vdev->lock);
> +
> +    XVFREE(d->arch.hvm.vuart);
> +}
> +
> +static int cf_check ns16550_put_rx(struct domain *d, char ch)
> +{
> +    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
> +    uint8_t *regs;
> +    uint8_t dlab;
> +    int rc;
> +
> +    ASSERT(d == vdev->owner);
> +    if ( !vdev )
> +        return -ENODEV;
> +
> +    spin_lock(&vdev->lock);
> +
> +    dlab = ns16550_dlab_get(vdev);
> +    regs = vdev->regs;
> +
> +    if ( dlab )
> +    {
> +        pr_debug("%s: THR/RBR access disabled: DLAB=1\n", vdev->name);
> +        rc = -EBUSY;
> +    }
> +    else if ( regs[UART_MCR] & UART_MCR_LOOP )
> +    {
> +        pr_debug("%s: THR/RBR access disabled: loopback mode\n", vdev->name);
> +        rc = -EBUSY;
> +    }
> +    else
> +    {
> +        uint8_t val = 0;
> +
> +        rc = ns16550_fifo_rx_putchar(vdev, ch);
> +        if ( rc == -ENOSPC )
> +            val |= UART_LSR_OE;
> +
> +        /* NB: UART_LSR_DR is also set when UART_LSR is accessed. */
> +        regs[UART_LSR] |= UART_LSR_DR | val;
> +
> +        /*
> +         * Echo the user input on Xen console iff Xen console input is owned
> +         * by NS16550 domain.
> +         * NB: use 'console_timestamps=none' to disable Xen timestamps.
> +         */
> +        if ( is_console_printable(ch) )
> +            guest_printk(d, "%c", ch);
> +
> +        /* FIXME: check FCR when to fire an interrupt */
> +        ns16550_irq_check(vdev);
> +    }
> +
> +    spin_unlock(&vdev->lock);
> +#ifdef CONFIG_VUART_NS16550_DEBUG
> +    ns16550_dump_state(d);
> +#endif
> +
> +    return rc;
> +}
> +
> +static const struct vuart_ops ns16550_ops = {
> +    .add_node   = NULL,
> +    .init       = ns16550_init,
> +    .deinit     = ns16550_deinit,
> +    .dump_state = ns16550_dump_state,
> +    .put_rx     = ns16550_put_rx,
> +};
> +
> +VUART_REGISTER(ns16550, &ns16550_ops);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
> index 14a7f8bd8b79..7971813a723d 100644
> --- a/xen/common/emul/vuart/vuart.c
> +++ b/xen/common/emul/vuart/vuart.c
> @@ -99,6 +99,10 @@ bool domain_has_vuart(const struct domain *d)
>  {
>      uint32_t mask = 0;
>  
> +#ifdef CONFIG_VUART_NS16550
> +    mask |= XEN_X86_EMU_NS16550;
> +#endif
> +
>      return !!(d->emulation_flags & mask);
>  }
>  
> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
> index fc2487986642..f905e1252c70 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -283,13 +283,15 @@ struct xen_arch_domainconfig {
>  #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
>  #define _XEN_X86_EMU_VPCI           10
>  #define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
> +#define _XEN_X86_EMU_NS16550        11
> +#define XEN_X86_EMU_NS16550         (1U<<_XEN_X86_EMU_NS16550)
>  
>  #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
>                                       XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
>                                       XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
>                                       XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
>                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
> -                                     XEN_X86_EMU_VPCI)
> +                                     XEN_X86_EMU_VPCI | XEN_X86_EMU_NS16550)
>      uint32_t emulation_flags;
>  
>  /*
> diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
> index 5d103631288d..56fb8101edd6 100644
> --- a/xen/include/xen/resource.h
> +++ b/xen/include/xen/resource.h
> @@ -31,4 +31,7 @@ struct resource {
>  
>  #define resource_size(res)      ((res)->size)
>  
> +#define for_each_resource(res) \
> +    for ( ; (res) && (res)->type != IORESOURCE_UNKNOWN; (res)++ )
> +
>  #endif /* XEN__RESOURCE_H */
> -- 
> 2.34.1
> 
> 

