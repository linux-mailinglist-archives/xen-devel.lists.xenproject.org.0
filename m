Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A9B1A008
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 12:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069068.1432909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uispA-00066l-4N; Mon, 04 Aug 2025 10:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069068.1432909; Mon, 04 Aug 2025 10:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uispA-00065D-0d; Mon, 04 Aug 2025 10:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1069068;
 Mon, 04 Aug 2025 10:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uisp8-000657-DX
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 10:53:46 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4596847f-7121-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 12:53:36 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-615378b42ecso5389876a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 03:53:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e8359sm713248066b.89.2025.08.04.03.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 03:53:35 -0700 (PDT)
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
X-Inumbo-ID: 4596847f-7121-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754304816; x=1754909616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5thSatIIffGJF2EE/O1+kPAkc3FW/i8kZdo7nDThmU8=;
        b=Gcew6F6KbY3g+Ml3RSpChxoNzHvmIt4c+CZlmmVyWUuSNAm9JNOeo/jiC7IMO2NAD6
         XENkJO9oYjzHzGOhQZjdqCY9Ly5l9V3E7H/2lH6IvkEGLybCiXnv42wnSZqfJ70W/Go8
         ua6DUs6UjmRRIzqjzKAaH04OAnJHyXxQKwZNqUWDV+bteYEUHpstJPXm6Pmq87lwCapK
         2g1cuQfJbg1FCrJU2Ucf4tRJmiU1DRHoQTtW6sSRIF2l0D6oO8zO8mGGGlRb1PA9mgRl
         8jjgnqYw+E+bXI+1fmj4jT9DlFSqcgZHwOIh/9kQrlScGEv55UMwjwTbd8zami2f3LsU
         UZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754304816; x=1754909616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5thSatIIffGJF2EE/O1+kPAkc3FW/i8kZdo7nDThmU8=;
        b=BvXf3wukB+qDeOfp/kcLg2g1Si7ohsYkkyZom7e1cjwRqj7VyWQ2BjHfPnxTaPQyfU
         VFc4tUr7wix2EVZDkRVt5aHrdsDNNxVUJb6goOw8pICTbzdGu44u7llRq+PTKZ2p+Akm
         hGsWKDDsmdOK3yiLFC+hdXeaR4hsw35CB2u5RJ+ERX+8cByPhW/DwwY+DfQPXEXLxdo1
         08utbLYufHkjIVeMoZvcSNu2kErI1E4QL/O56N0b9vj0j6q4PPSTbju6HPPTsezvYSst
         a3Wl8T6mj73IjxFuGcx1CmVR9wS7PBWWwlDP1Qa/CBUMM5a86sE2e+EjTqhcrfyxraPP
         9zcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcg44WHTff3Z0NOlCMgq8VrerQAsdT+hT9B4W+PGe4L5VWlxSBz8vrOps3jI8O2OlCvs+AtKiOHtM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzV4NuCGkrS+V8yxa3Zd/mnCL6y7R2m6yEhJ/Hzc6v05KP7OxZ
	NqeMl9+qtDfpm+ftdJCYyzb/iZkRGpiQXt5j6ojDIzQUNY4MJb/eL8AeIGK9/Qpw1w==
X-Gm-Gg: ASbGncsbTOLq6BDDTXfqDgZca3/SMngB5++YfLW+tTdqhc6poBiQ4uWFiVWoQWvGhRE
	RAz73TBgQs3O9npA0wZ2xdCkrF+TMIIEctqCxfDBikQx8S9fmu01bgmxGWpnx/dZkkCrkXMVuPu
	6zaDn2UBjEHbki9WFAQ7qCtcigDcMm3usUuYNbw34UFgBOeOed9DtRPX7f9frLDf+5zxaOXVxtj
	rALVs+1iEYtEfRA7r0bCitO5w2M1VppkFB7Z3ajdA8gRZSd83CQjewHHrRC6IxUICqseOps1lvE
	2DZF9REQgAEmCQnPCfZ4bD1o+2hcPXyvG3WUVGfssaU/l9F0yYCV9h5Si7Yz79Q/8gr1NestDLM
	G6X/6IKPhMNjK8OneQCJRy6+ebssvD5QmJnPoSM0O+4YrXzy9KzLt7Ulmhs39PU19qO/s3ZJbhD
	92upIArmo=
X-Google-Smtp-Source: AGHT+IFd2dXEDINpICav9JHl3kbXZLHdq8muOONpwot7D1JgKZrXUhYmANTF2+BMDdxxjp8eZQsGCQ==
X-Received: by 2002:a17:907:724a:b0:af9:3c4d:e978 with SMTP id a640c23a62f3a-af94018ffdbmr870389366b.41.1754304815657;
        Mon, 04 Aug 2025 03:53:35 -0700 (PDT)
Message-ID: <5c0589a2-91fe-484d-bded-5a68a1626355@suse.com>
Date: Mon, 4 Aug 2025 12:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible
 UART emulator (x86)
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-6-dmukhin@ford.com>
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
In-Reply-To: <20250731192130.3948419-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 21:22, dmkhn@proton.me wrote:
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

Overall I think this patch is too large to sensibly review. Surely base structure
and then (incrementally) fleshing out of the hooks can be separated from one
another?

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

Would be better if vuart_deinit() was idempotent, and hence could be called
unconditionally here.

> @@ -787,6 +794,8 @@ void hvm_domain_destroy(struct domain *d)
>      if ( hvm_funcs.domain_destroy )
>          alternative_vcall(hvm_funcs.domain_destroy, d);
>  
> +    vuart_deinit(d);

You require a fair level of idempotency already anyway, as a domain may not
have any vUART, so this call already needs to be "capabale" of doing nothing.

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

With your framework you allow for multiple vUART drivers. Either the field
looks misnamed or the CONFIG_* option checked is the wrong one.

Also, why's this x86-specific? NS16550s can exist anywhere, can't they?
(The present, but presumably temporary tying to x86 looks to be the use of
I/O ports.)

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

For someone merely running kconfig but not otherwise knowing the sources,
this isn't an overly helful pointer. But I question the need for such a
control anyway, and I think I did say so already before.

> +config VUART_NS16550_DEBUG
> +	bool "UART emulator development debugging"
> +	depends on VUART_NS16550

&& DEBUG ?

> --- a/xen/common/emul/vuart/Makefile
> +++ b/xen/common/emul/vuart/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_HAS_VUART) += vuart.o
> +obj-$(CONFIG_VUART_NS16550) += vuart-ns16550.o

I don't think files in this directory need a vuart- name prefix.

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

Except for cases where Xen itself runs as a guest, I don't think any of these
headers should be used in Xen sources. If I'm not mistaken, ...

> +/*
> + * Virtual NS16550 device state.
> + */
> +struct vuart_ns16550 {
> +    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */

... this also isn't to communicate with some remote, but merely to use some
of the fields conveniently.

> +    uint8_t regs[NS16550_EMU_REGS_NUM]; /* Emulated registers */
> +    unsigned int irq;                   /* Emulated IRQ# */
> +    uint64_t io_addr;                   /* Emulated I/O region base address */
> +    uint64_t io_size;                   /* Emulated I/O region size */

These are huge; for the size that's true even if considering future MMIO-
based emulation.

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

The choice of COMn is at build time. Why do we need all four configurations
resident not only in the binary, but even at (post-init) runtime? Also, the
way you do initialization of .res, I think adding __initconst to the main
array wouldn't have the effect of pulling all those inti .init.* as well.
For the time being I simply don't see the need for the extra level of
indirection: All instances have two entries (plus the then likely not
necessary sentinel).

> +static bool cf_check ns16550_iir_check_lsi(const struct vuart_ns16550 *vdev)
> +{
> +    return !!(vdev->regs[UART_LSR] & UART_LSR_MASK);

No need for !! (also elsewhere).

> --- a/xen/include/xen/resource.h
> +++ b/xen/include/xen/resource.h
> @@ -31,4 +31,7 @@ struct resource {
>  
>  #define resource_size(res)      ((res)->size)
>  
> +#define for_each_resource(res) \
> +    for ( ; (res) && (res)->type != IORESOURCE_UNKNOWN; (res)++ )

I'm not sure this is a good generic #define; imo it wants keeping local to
the one file that uses it.

Jan

