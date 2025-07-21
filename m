Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB1B0C312
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 13:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051409.1419743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udomf-0003ab-7y; Mon, 21 Jul 2025 11:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051409.1419743; Mon, 21 Jul 2025 11:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udomf-0003YN-49; Mon, 21 Jul 2025 11:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1051409;
 Mon, 21 Jul 2025 11:34:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ESUV=2C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1udomd-0003Xf-Gs
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 11:34:15 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0501ee8-6626-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 13:34:13 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so6765744a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 04:34:13 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca7d7a4sm663676166b.116.2025.07.21.04.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 04:34:12 -0700 (PDT)
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
X-Inumbo-ID: a0501ee8-6626-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753097653; x=1753702453; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkySJDdzjz7KhYsa0gptQtd5ecsV5TLY9kJIz7hXiwY=;
        b=jcyK1LuKID5hs2n7kWVIdIeacHfxoWl/ZZswzbqMbGAujfZVbYpgiXmPBmsW+A8+ix
         8Zk3ZZWFfdREZ4fIDdtVxSwmb0KG3FEcDFgFBHrJkoJh/KCLrbqiZE/h+VeTczxfIuM/
         U2f58+B4K/7Co3Yv/h//+kMckpZGmR3leMMKPaPuK1jh3j5e+jGHhFuDTKy4W6ZgKy7o
         R5oN1fWaZrd4bi2CJbyJlb/AO3/I4yPgtbxoAZSNmEOdm8gJ66bZcsxg9HVvgrcZGG/y
         8NAK0HJfAp4yRFlqwX0Cu1NOhK5N804oWC3YtY/jfawCFm9PqAA6eujpQG0lRj0H0WER
         ntbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753097653; x=1753702453;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AkySJDdzjz7KhYsa0gptQtd5ecsV5TLY9kJIz7hXiwY=;
        b=C+/dbfYqt8w0XMxc+gUZqc/Wg7895GSC7KYXXHUiRGfBo85Xyt7mcGuLTZT5JAV3xM
         lQzGzgDpO3MkhXROJ62ibUGKDlTPgkhNjplULv48lvnY8pZOwuA00+Q5iUHstC7kSkft
         8oIBRFDSg0vVdIDnXilrcEbcVPgKA7aZHT5WLTqmKPd/AgVCE4YGf2nGahpo/IIclLyb
         o3U3p/ZZ3VQGdB1ApMYugLojKEvtymk2NoLDTTZT4EyoERN/lcq7OM0fN6Meh0HkVAQF
         63iPnQ3GqN21fU4IUnJCLWNe+lZh9gPhKXNcN6/VUBpg2vImlZGowV/uJivqHLeuZ7ys
         RD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXiSRIpXKrN5cFvF5GQw5wVye7pOz81o0etwJUcLLam/8wp3NuBStm0eVmVWnw8iULV6T6i3KwUbLQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznTcF4E2Xm6TSfT1sHVeY8aBBT4NT0VV3wq1fSzzH6VeMfjJjc
	LKmIqwBn7wfkHyU723NCJh0r4M1SMAgjw5ueDz5PvTHgRq6C1elWGgA1
X-Gm-Gg: ASbGncsRSHmfd8cmD06i+ZKyLjFPnm5WdcaSFMWJwbZP3T6a5OxMBKejHD4PnyR19YF
	8jw3XITTrZYo3PiRAkh/hrRSE2QCZQTdIHPyR0sgmMwPN5FTm8tjQVyJ02mMAZhypI8QO5tlX+Z
	QnPWn97TrA4wqQkiZTDZcbCLlCI1H1NPP3jlflinfTnCSeiMNLjQuFlbIZnTDeUo2EQ9QU3nz9A
	l3sI6td3t2zcbL6y3lfayexdo4lhoafJHnnu5rFOmnl4NVaRqx9C3wYS3e4QDh+RtDCW54PmTtE
	JIGutIzSCw2435wY3aNXlm3vLcRYkvGLsHGflWXAgJ0MRSWlPda1TVAwuHPpFRo45PbXZNQi1Wr
	wSBk932kmuBjX3EFeObfBn6dFx8iimTTNwYwl6L0EaBzL7iZ/uw6P4fwGf7Yrya2aLgYT9f0=
X-Google-Smtp-Source: AGHT+IHQ+WUlO/TJTPeSPTxOSYiT2Fiwq7+Ne9QwykSSMXPJHjCSX+S6AJi+nxxY1+yfZKz8ajghAQ==
X-Received: by 2002:a17:907:f1c7:b0:ae0:a597:2959 with SMTP id a640c23a62f3a-ae9ce0d5bb8mr1946108466b.32.1753097652368;
        Mon, 21 Jul 2025 04:34:12 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Mi4Jfu1pDSJtXZsfBRAzMCKd"
Message-ID: <4cc51425-120c-48a4-b66f-a8de2feda064@gmail.com>
Date: Mon, 21 Jul 2025 13:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] xen: Split HAS_DEVICE_TREE in two
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-10-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250715161108.141126-10-alejandro.garciavallejo@amd.com>

This is a multi-part message in MIME format.
--------------Mi4Jfu1pDSJtXZsfBRAzMCKd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/25 6:11 PM, Alejandro Vallejo wrote:
> Moving forward the idea is for there to be:
>
>    1. Basic DT support: used by dom0less/hyperlaunch.
>    2. Full DT support: used for device discovery and HW setup.
>
> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2) and
> create a new DEVICE_TREE_PARSE to describe (1).
>
> Have DEVICE_TREE_PARSE selected by both HAS_DEVICE_TREE_DISCOVERY and
> DOM0LESS_BOOT.
>
> Add a dependency on STATIC_MEMORY for discovery, as it relies on
> the memory map itself being described on the DTB.
>
> Signed-off-by: Alejandro Vallejo<alejandro.garciavallejo@amd.com>
> Acked-by: Jan Beulich<jbeulich@suse.com> #iommu

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com> # riscv

~ Oleksii

> ---
>   xen/Kconfig.debug                |  2 +-
>   xen/arch/arm/Kconfig             |  2 +-
>   xen/arch/ppc/Kconfig             |  2 +-
>   xen/arch/riscv/Kconfig           |  2 +-
>   xen/common/Kconfig               | 15 ++++++++++-----
>   xen/common/Makefile              |  4 ++--
>   xen/common/device.c              |  4 ++--
>   xen/common/efi/boot.c            |  2 +-
>   xen/common/sched/Kconfig         |  2 +-
>   xen/drivers/char/ns16550.c       |  6 +++---
>   xen/drivers/passthrough/Makefile |  2 +-
>   xen/drivers/passthrough/iommu.c  |  2 +-
>   xen/include/asm-generic/device.h | 10 +++++-----
>   xen/include/xen/iommu.h          |  8 ++++----
>   xen/include/xsm/dummy.h          |  4 ++--
>   xen/include/xsm/xsm.h            | 12 ++++++------
>   xen/xsm/dummy.c                  |  2 +-
>   xen/xsm/flask/hooks.c            |  6 +++---
>   xen/xsm/xsm_core.c               |  4 ++--
>   xen/xsm/xsm_policy.c             |  4 ++--
>   20 files changed, 50 insertions(+), 45 deletions(-)
>
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index 38a134fa3b..d900d926c5 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -92,7 +92,7 @@ config VERBOSE_DEBUG
>   
>   config DEVICE_TREE_DEBUG
>   	bool "Device tree debug messages"
> -	depends on HAS_DEVICE_TREE
> +	depends on DEVICE_TREE_PARSE
>   	help
>   	  Device tree parsing and DOM0 device tree building messages are
>   	  logged in the Xen ring buffer.
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 95a2cd3d00..ce15bf22d0 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -17,7 +17,7 @@ config ARM
>   	select FUNCTION_ALIGNMENT_4B
>   	select GENERIC_UART_INIT
>   	select HAS_ALTERNATIVE if HAS_VMAP
> -	select HAS_DEVICE_TREE
> +	select HAS_DEVICE_TREE_DISCOVERY
>   	select HAS_DOM0LESS
>   	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>   	select HAS_STACK_PROTECTOR
> diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
> index 917f5d53a6..5bedf6055e 100644
> --- a/xen/arch/ppc/Kconfig
> +++ b/xen/arch/ppc/Kconfig
> @@ -1,7 +1,7 @@
>   config PPC
>   	def_bool y
>   	select FUNCTION_ALIGNMENT_4B
> -	select HAS_DEVICE_TREE
> +	select HAS_DEVICE_TREE_DISCOVERY
>   	select HAS_UBSAN
>   	select HAS_VMAP
>   
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index 96bef90751..89876b3217 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -3,7 +3,7 @@ config RISCV
>   	select FUNCTION_ALIGNMENT_16B
>   	select GENERIC_BUG_FRAME
>   	select GENERIC_UART_INIT
> -	select HAS_DEVICE_TREE
> +	select HAS_DEVICE_TREE_DISCOVERY
>   	select HAS_PMAP
>   	select HAS_UBSAN
>   	select HAS_VMAP
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 65f07289dd..fb3845c197 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -12,9 +12,14 @@ config CORE_PARKING
>   	bool
>   	depends on NR_CPUS > 1
>   
> +config DEVICE_TREE_PARSE
> +	bool
> +	select LIBFDT
> +
>   config DOM0LESS_BOOT
>   	bool "Dom0less boot support" if EXPERT
> -	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
> +	depends on HAS_DOM0LESS && DOMAIN_BUILD_HELPERS
> +	select DEVICE_TREE_PARSE
>   	default y
>   	help
>   	  Dom0less boot support enables Xen to create and start domU guests during
> @@ -85,9 +90,9 @@ config HAS_ALTERNATIVE
>   config HAS_COMPAT
>   	bool
>   
> -config HAS_DEVICE_TREE
> +config HAS_DEVICE_TREE_DISCOVERY
>   	bool
> -	select LIBFDT
> +	select DEVICE_TREE_PARSE
>   
>   config HAS_DOM0LESS
>   	bool
> @@ -154,7 +159,7 @@ config NUMA
>   
>   config STATIC_MEMORY
>   	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
> -	depends on DOM0LESS_BOOT
> +	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
>   	help
>   	  Static Allocation refers to system or sub-system(domains) for
>   	  which memory areas are pre-defined by configuration using physical
> @@ -553,7 +558,7 @@ config DOM0_MEM
>   
>   config DTB_FILE
>   	string "Absolute path to device tree blob"
> -	depends on HAS_DEVICE_TREE
> +	depends on HAS_DEVICE_TREE_DISCOVERY
>   	help
>   	  When using a bootloader that has no device tree support or when there
>   	  is no bootloader at all, use this option to specify the absolute path
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 98f0873056..d541fbcf49 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -6,9 +6,9 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>   obj-$(CONFIG_CORE_PARKING) += core_parking.o
>   obj-y += cpu.o
>   obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> -obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
>   obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
> -obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
>   obj-$(CONFIG_IOREQ_SERVER) += dm.o
>   obj-y += domain.o
>   obj-y += event_2l.o
> diff --git a/xen/common/device.c b/xen/common/device.c
> index 33e0d58f2f..0c0afad49f 100644
> --- a/xen/common/device.c
> +++ b/xen/common/device.c
> @@ -11,7 +11,7 @@
>   
>   #include <asm/device.h>
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   
>   extern const struct device_desc _sdevice[], _edevice[];
>   
> @@ -56,7 +56,7 @@ enum device_class device_get_class(const struct dt_device_node *dev)
>       return DEVICE_UNKNOWN;
>   }
>   
> -#endif
> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>   
>   #ifdef CONFIG_ACPI
>   
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 9306dc8953..31b4039049 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -623,7 +623,7 @@ static int __init __maybe_unused set_color(uint32_t mask, int bpp,
>      return max(*pos + *sz, bpp);
>   }
>   
> -#ifndef CONFIG_HAS_DEVICE_TREE
> +#ifndef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>   {
>       return 0;
> diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
> index 18ca1ce7ab..1fb622e6cf 100644
> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -67,7 +67,7 @@ endmenu
>   
>   config BOOT_TIME_CPUPOOLS
>   	bool "Create cpupools at boot time"
> -	depends on HAS_DEVICE_TREE
> +	depends on HAS_DEVICE_TREE_DISCOVERY
>   	help
>   	  Creates cpupools during boot time and assigns cpus to them. Cpupools
>   	  options can be specified in the device tree.
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 6b4fb4ad31..c1c08b235e 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -34,7 +34,7 @@
>   #include <xen/8250-uart.h>
>   #include <xen/vmap.h>
>   #include <asm/io.h>
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   #include <asm/device.h>
>   #endif
>   #ifdef CONFIG_X86
> @@ -1766,7 +1766,7 @@ void __init ns16550_init(int index, struct ns16550_defaults *defaults)
>   
>   #endif /* CONFIG_X86 */
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>                                          const void *data)
>   {
> @@ -1845,7 +1845,7 @@ DT_DEVICE_START(ns16550, "NS16550 UART", DEVICE_SERIAL)
>           .init = ns16550_uart_dt_init,
>   DT_DEVICE_END
>   
> -#endif /* HAS_DEVICE_TREE */
> +#endif /* HAS_DEVICE_TREE_DISCOVERY */
>   
>   #if defined(CONFIG_ACPI) && defined(CONFIG_ARM)
>   #include <xen/acpi.h>
> diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
> index a1621540b7..eb4aeafb42 100644
> --- a/xen/drivers/passthrough/Makefile
> +++ b/xen/drivers/passthrough/Makefile
> @@ -5,6 +5,6 @@ obj-$(CONFIG_ARM) += arm/
>   
>   obj-y += iommu.o
>   obj-$(CONFIG_HAS_PCI) += pci.o
> -obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device_tree.o
>   obj-$(CONFIG_HAS_PCI) += ats.o
>   obj-$(CONFIG_HAS_PCI_MSI) += msi.o
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index 16aad86973..c9425d6971 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -638,7 +638,7 @@ int iommu_do_domctl(
>       ret = iommu_do_pci_domctl(domctl, d, u_domctl);
>   #endif
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>       if ( ret == -ENODEV )
>           ret = iommu_do_dt_domctl(domctl, d, u_domctl);
>   #endif
> diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
> index 1acd1ba1d8..3bd97e33c5 100644
> --- a/xen/include/asm-generic/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -6,7 +6,7 @@
>   
>   enum device_type
>   {
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>       DEV_DT,
>   #endif
>       DEV_PCI
> @@ -26,7 +26,7 @@ enum device_class
>   struct device
>   {
>       enum device_type type;
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>       struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>   #endif
>   #ifdef CONFIG_HAS_PASSTHROUGH
> @@ -37,7 +37,7 @@ struct device
>   
>   typedef struct device device_t;
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   
>   #include <xen/device_tree.h>
>   
> @@ -87,9 +87,9 @@ struct device_desc {
>       int (*init)(struct dt_device_node *dev, const void *data);
>   };
>   
> -#else /* !CONFIG_HAS_DEVICE_TREE */
> +#else /* !CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>   #define dev_is_dt(dev) ((void)(dev), false)
> -#endif /* CONFIG_HAS_DEVICE_TREE */
> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>   
>   #define dev_is_pci(dev) ((dev)->type == DEV_PCI)
>   
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 57f338e2a0..37c4a1dc82 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -232,7 +232,7 @@ struct msi_msg;
>   #define PT_IRQ_TIME_OUT MILLISECS(8)
>   #endif /* HAS_PCI */
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   #include <xen/device_tree.h>
>   
>   #ifdef CONFIG_HAS_PASSTHROUGH
> @@ -309,7 +309,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>   
>   #endif /* HAS_PASSTHROUGH */
>   
> -#endif /* HAS_DEVICE_TREE */
> +#endif /* HAS_DEVICE_TREE_DISCOVERY */
>   
>   struct page_info;
>   
> @@ -376,7 +376,7 @@ struct iommu_ops {
>       int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
>       void (*dump_page_tables)(struct domain *d);
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>       /*
>        * All IOMMU drivers which support generic IOMMU DT bindings should use
>        * this callback. This is a way for the framework to provide the driver
> @@ -424,7 +424,7 @@ struct domain_iommu {
>       /* iommu_ops */
>       const struct iommu_ops *platform_ops;
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>       /* List of DT devices assigned to this domain */
>       struct list_head dt_devices;
>   #endif
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 9227205fcd..12792c3a43 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -423,7 +423,7 @@ static XSM_INLINE int cf_check xsm_deassign_device(
>   
>   #endif /* HAS_PASSTHROUGH && HAS_PCI */
>   
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>   static XSM_INLINE int cf_check xsm_assign_dtdevice(
>       XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
>   {
> @@ -438,7 +438,7 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice(
>       return xsm_default_action(action, current->domain, d);
>   }
>   
> -#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
> +#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
>   
>   static XSM_INLINE int cf_check xsm_resource_plug_core(XSM_DEFAULT_VOID)
>   {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 24acc16125..abeb4b04ad 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -125,7 +125,7 @@ struct xsm_ops {
>       int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
>   #endif
>   
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>       int (*assign_dtdevice)(struct domain *d, const char *dtpath);
>       int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
>   #endif
> @@ -535,7 +535,7 @@ static inline int xsm_deassign_device(
>   }
>   #endif /* HAS_PASSTHROUGH && HAS_PCI) */
>   
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>   static inline int xsm_assign_dtdevice(
>       xsm_default_t def, struct domain *d, const char *dtpath)
>   {
> @@ -548,7 +548,7 @@ static inline int xsm_deassign_dtdevice(
>       return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
>   }
>   
> -#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
> +#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
>   
>   static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
>   {
> @@ -789,7 +789,7 @@ int xsm_multiboot_policy_init(
>       struct boot_info *bi, void **policy_buffer, size_t *policy_size);
>   #endif
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   /*
>    * Initialize XSM
>    *
> @@ -839,7 +839,7 @@ static inline int xsm_multiboot_init(struct boot_info *bi)
>   }
>   #endif
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   static inline int xsm_dt_init(void)
>   {
>       return 0;
> @@ -849,7 +849,7 @@ static inline bool has_xsm_magic(paddr_t start)
>   {
>       return false;
>   }
> -#endif /* CONFIG_HAS_DEVICE_TREE */
> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>   
>   #endif /* CONFIG_XSM */
>   
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 93fbfc43cc..7f67683839 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -81,7 +81,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>       .deassign_device               = xsm_deassign_device,
>   #endif
>   
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>       .assign_dtdevice               = xsm_assign_dtdevice,
>       .deassign_dtdevice             = xsm_deassign_dtdevice,
>   #endif
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 6a53487ea4..78bad6e56b 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1456,7 +1456,7 @@ static int cf_check flask_deassign_device(
>   }
>   #endif /* HAS_PASSTHROUGH && HAS_PCI */
>   
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>   static int flask_test_assign_dtdevice(const char *dtpath)
>   {
>       uint32_t rsid;
> @@ -1517,7 +1517,7 @@ static int cf_check flask_deassign_dtdevice(
>       return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE,
>                                   NULL);
>   }
> -#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
> +#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
>   
>   static int cf_check flask_platform_op(uint32_t op)
>   {
> @@ -1981,7 +1981,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>       .deassign_device = flask_deassign_device,
>   #endif
>   
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>       .assign_dtdevice = flask_assign_dtdevice,
>       .deassign_dtdevice = flask_deassign_dtdevice,
>   #endif
> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
> index f255fb63bf..b7e864a874 100644
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -25,7 +25,7 @@
>   #include <asm/setup.h>
>   #endif
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   #include <asm/setup.h>
>   #endif
>   
> @@ -166,7 +166,7 @@ int __init xsm_multiboot_init(struct boot_info *bi)
>   }
>   #endif
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   int __init xsm_dt_init(void)
>   {
>       int ret = 0;
> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 1b4030edb4..3f04375347 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -24,7 +24,7 @@
>   #include <asm/setup.h>
>   #endif
>   #include <xen/bitops.h>
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   # include <asm/setup.h>
>   # include <xen/device_tree.h>
>   #endif
> @@ -65,7 +65,7 @@ int __init xsm_multiboot_policy_init(
>   }
>   #endif
>   
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>   int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
>   {
>       struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM);
--------------Mi4Jfu1pDSJtXZsfBRAzMCKd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/15/25 6:11 PM, Alejandro Vallejo
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20250715161108.141126-10-alejandro.garciavallejo@amd.com">
      <pre wrap="" class="moz-quote-pre">Moving forward the idea is for there to be:

  1. Basic DT support: used by dom0less/hyperlaunch.
  2. Full DT support: used for device discovery and HW setup.

Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2) and
create a new DEVICE_TREE_PARSE to describe (1).

Have DEVICE_TREE_PARSE selected by both HAS_DEVICE_TREE_DISCOVERY and
DOM0LESS_BOOT.

Add a dependency on STATIC_MEMORY for discovery, as it relies on
the memory map itself being described on the DTB.

Signed-off-by: Alejandro Vallejo <a class="moz-txt-link-rfc2396E" href="mailto:alejandro.garciavallejo@amd.com">&lt;alejandro.garciavallejo@amd.com&gt;</a>
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a> #iommu</pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a> # riscv

~ Oleksii</pre>
    <blockquote type="cite"
cite="mid:20250715161108.141126-10-alejandro.garciavallejo@amd.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/Kconfig.debug                |  2 +-
 xen/arch/arm/Kconfig             |  2 +-
 xen/arch/ppc/Kconfig             |  2 +-
 xen/arch/riscv/Kconfig           |  2 +-
 xen/common/Kconfig               | 15 ++++++++++-----
 xen/common/Makefile              |  4 ++--
 xen/common/device.c              |  4 ++--
 xen/common/efi/boot.c            |  2 +-
 xen/common/sched/Kconfig         |  2 +-
 xen/drivers/char/ns16550.c       |  6 +++---
 xen/drivers/passthrough/Makefile |  2 +-
 xen/drivers/passthrough/iommu.c  |  2 +-
 xen/include/asm-generic/device.h | 10 +++++-----
 xen/include/xen/iommu.h          |  8 ++++----
 xen/include/xsm/dummy.h          |  4 ++--
 xen/include/xsm/xsm.h            | 12 ++++++------
 xen/xsm/dummy.c                  |  2 +-
 xen/xsm/flask/hooks.c            |  6 +++---
 xen/xsm/xsm_core.c               |  4 ++--
 xen/xsm/xsm_policy.c             |  4 ++--
 20 files changed, 50 insertions(+), 45 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 38a134fa3b..d900d926c5 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -92,7 +92,7 @@ config VERBOSE_DEBUG
 
 config DEVICE_TREE_DEBUG
 	bool "Device tree debug messages"
-	depends on HAS_DEVICE_TREE
+	depends on DEVICE_TREE_PARSE
 	help
 	  Device tree parsing and DOM0 device tree building messages are
 	  logged in the Xen ring buffer.
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 95a2cd3d00..ce15bf22d0 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -17,7 +17,7 @@ config ARM
 	select FUNCTION_ALIGNMENT_4B
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
-	select HAS_DEVICE_TREE
+	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index 917f5d53a6..5bedf6055e 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -1,7 +1,7 @@
 config PPC
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
-	select HAS_DEVICE_TREE
+	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_UBSAN
 	select HAS_VMAP
 
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 96bef90751..89876b3217 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -3,7 +3,7 @@ config RISCV
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
-	select HAS_DEVICE_TREE
+	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_PMAP
 	select HAS_UBSAN
 	select HAS_VMAP
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 65f07289dd..fb3845c197 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,9 +12,14 @@ config CORE_PARKING
 	bool
 	depends on NR_CPUS &gt; 1
 
+config DEVICE_TREE_PARSE
+	bool
+	select LIBFDT
+
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
-	depends on HAS_DOM0LESS &amp;&amp; HAS_DEVICE_TREE &amp;&amp; DOMAIN_BUILD_HELPERS
+	depends on HAS_DOM0LESS &amp;&amp; DOMAIN_BUILD_HELPERS
+	select DEVICE_TREE_PARSE
 	default y
 	help
 	  Dom0less boot support enables Xen to create and start domU guests during
@@ -85,9 +90,9 @@ config HAS_ALTERNATIVE
 config HAS_COMPAT
 	bool
 
-config HAS_DEVICE_TREE
+config HAS_DEVICE_TREE_DISCOVERY
 	bool
-	select LIBFDT
+	select DEVICE_TREE_PARSE
 
 config HAS_DOM0LESS
 	bool
@@ -154,7 +159,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on DOM0LESS_BOOT
+	depends on DOM0LESS_BOOT &amp;&amp; HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Static Allocation refers to system or sub-system(domains) for
 	  which memory areas are pre-defined by configuration using physical
@@ -553,7 +558,7 @@ config DOM0_MEM
 
 config DTB_FILE
 	string "Absolute path to device tree blob"
-	depends on HAS_DEVICE_TREE
+	depends on HAS_DEVICE_TREE_DISCOVERY
 	help
 	  When using a bootloader that has no device tree support or when there
 	  is no bootloader at all, use this option to specify the absolute path
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..d541fbcf49 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,9 +6,9 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/device.c b/xen/common/device.c
index 33e0d58f2f..0c0afad49f 100644
--- a/xen/common/device.c
+++ b/xen/common/device.c
@@ -11,7 +11,7 @@
 
 #include &lt;asm/device.h&gt;
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 
 extern const struct device_desc _sdevice[], _edevice[];
 
@@ -56,7 +56,7 @@ enum device_class device_get_class(const struct dt_device_node *dev)
     return DEVICE_UNKNOWN;
 }
 
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #ifdef CONFIG_ACPI
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9306dc8953..31b4039049 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -623,7 +623,7 @@ static int __init __maybe_unused set_color(uint32_t mask, int bpp,
    return max(*pos + *sz, bpp);
 }
 
-#ifndef CONFIG_HAS_DEVICE_TREE
+#ifndef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
 {
     return 0;
diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 18ca1ce7ab..1fb622e6cf 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -67,7 +67,7 @@ endmenu
 
 config BOOT_TIME_CPUPOOLS
 	bool "Create cpupools at boot time"
-	depends on HAS_DEVICE_TREE
+	depends on HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Creates cpupools during boot time and assigns cpus to them. Cpupools
 	  options can be specified in the device tree.
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 6b4fb4ad31..c1c08b235e 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -34,7 +34,7 @@
 #include &lt;xen/8250-uart.h&gt;
 #include &lt;xen/vmap.h&gt;
 #include &lt;asm/io.h&gt;
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include &lt;asm/device.h&gt;
 #endif
 #ifdef CONFIG_X86
@@ -1766,7 +1766,7 @@ void __init ns16550_init(int index, struct ns16550_defaults *defaults)
 
 #endif /* CONFIG_X86 */
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
                                        const void *data)
 {
@@ -1845,7 +1845,7 @@ DT_DEVICE_START(ns16550, "NS16550 UART", DEVICE_SERIAL)
         .init = ns16550_uart_dt_init,
 DT_DEVICE_END
 
-#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE_DISCOVERY */
 
 #if defined(CONFIG_ACPI) &amp;&amp; defined(CONFIG_ARM)
 #include &lt;xen/acpi.h&gt;
diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index a1621540b7..eb4aeafb42 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -5,6 +5,6 @@ obj-$(CONFIG_ARM) += arm/
 
 obj-y += iommu.o
 obj-$(CONFIG_HAS_PCI) += pci.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device_tree.o
 obj-$(CONFIG_HAS_PCI) += ats.o
 obj-$(CONFIG_HAS_PCI_MSI) += msi.o
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 16aad86973..c9425d6971 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -638,7 +638,7 @@ int iommu_do_domctl(
     ret = iommu_do_pci_domctl(domctl, d, u_domctl);
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     if ( ret == -ENODEV )
         ret = iommu_do_dt_domctl(domctl, d, u_domctl);
 #endif
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8..3bd97e33c5 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -6,7 +6,7 @@
 
 enum device_type
 {
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     DEV_DT,
 #endif
     DEV_PCI
@@ -26,7 +26,7 @@ enum device_class
 struct device
 {
     enum device_type type;
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     struct dt_device_node *of_node; /* Used by drivers imported from Linux */
 #endif
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -37,7 +37,7 @@ struct device
 
 typedef struct device device_t;
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 
 #include &lt;xen/device_tree.h&gt;
 
@@ -87,9 +87,9 @@ struct device_desc {
     int (*init)(struct dt_device_node *dev, const void *data);
 };
 
-#else /* !CONFIG_HAS_DEVICE_TREE */
+#else /* !CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 #define dev_is_dt(dev) ((void)(dev), false)
-#endif /* CONFIG_HAS_DEVICE_TREE */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #define dev_is_pci(dev) ((dev)-&gt;type == DEV_PCI)
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 57f338e2a0..37c4a1dc82 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -232,7 +232,7 @@ struct msi_msg;
 #define PT_IRQ_TIME_OUT MILLISECS(8)
 #endif /* HAS_PCI */
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include &lt;xen/device_tree.h&gt;
 
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -309,7 +309,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
 
 #endif /* HAS_PASSTHROUGH */
 
-#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE_DISCOVERY */
 
 struct page_info;
 
@@ -376,7 +376,7 @@ struct iommu_ops {
     int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
     void (*dump_page_tables)(struct domain *d);
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     /*
      * All IOMMU drivers which support generic IOMMU DT bindings should use
      * this callback. This is a way for the framework to provide the driver
@@ -424,7 +424,7 @@ struct domain_iommu {
     /* iommu_ops */
     const struct iommu_ops *platform_ops;
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     /* List of DT devices assigned to this domain */
     struct list_head dt_devices;
 #endif
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 9227205fcd..12792c3a43 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -423,7 +423,7 @@ static XSM_INLINE int cf_check xsm_deassign_device(
 
 #endif /* HAS_PASSTHROUGH &amp;&amp; HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static XSM_INLINE int cf_check xsm_assign_dtdevice(
     XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
@@ -438,7 +438,7 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice(
     return xsm_default_action(action, current-&gt;domain, d);
 }
 
-#endif /* HAS_PASSTHROUGH &amp;&amp; HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH &amp;&amp; HAS_DEVICE_TREE_DISCOVERY */
 
 static XSM_INLINE int cf_check xsm_resource_plug_core(XSM_DEFAULT_VOID)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..abeb4b04ad 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -125,7 +125,7 @@ struct xsm_ops {
     int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     int (*assign_dtdevice)(struct domain *d, const char *dtpath);
     int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
 #endif
@@ -535,7 +535,7 @@ static inline int xsm_deassign_device(
 }
 #endif /* HAS_PASSTHROUGH &amp;&amp; HAS_PCI) */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static inline int xsm_assign_dtdevice(
     xsm_default_t def, struct domain *d, const char *dtpath)
 {
@@ -548,7 +548,7 @@ static inline int xsm_deassign_dtdevice(
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
-#endif /* HAS_PASSTHROUGH &amp;&amp; HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH &amp;&amp; HAS_DEVICE_TREE_DISCOVERY */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
@@ -789,7 +789,7 @@ int xsm_multiboot_policy_init(
     struct boot_info *bi, void **policy_buffer, size_t *policy_size);
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 /*
  * Initialize XSM
  *
@@ -839,7 +839,7 @@ static inline int xsm_multiboot_init(struct boot_info *bi)
 }
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 static inline int xsm_dt_init(void)
 {
     return 0;
@@ -849,7 +849,7 @@ static inline bool has_xsm_magic(paddr_t start)
 {
     return false;
 }
-#endif /* CONFIG_HAS_DEVICE_TREE */
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #endif /* CONFIG_XSM */
 
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 93fbfc43cc..7f67683839 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -81,7 +81,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .deassign_device               = xsm_deassign_device,
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     .assign_dtdevice               = xsm_assign_dtdevice,
     .deassign_dtdevice             = xsm_deassign_dtdevice,
 #endif
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6a53487ea4..78bad6e56b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1456,7 +1456,7 @@ static int cf_check flask_deassign_device(
 }
 #endif /* HAS_PASSTHROUGH &amp;&amp; HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
 static int flask_test_assign_dtdevice(const char *dtpath)
 {
     uint32_t rsid;
@@ -1517,7 +1517,7 @@ static int cf_check flask_deassign_dtdevice(
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE,
                                 NULL);
 }
-#endif /* HAS_PASSTHROUGH &amp;&amp; HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH &amp;&amp; HAS_DEVICE_TREE_DISCOVERY */
 
 static int cf_check flask_platform_op(uint32_t op)
 {
@@ -1981,7 +1981,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .deassign_device = flask_deassign_device,
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_PASSTHROUGH) &amp;&amp; defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
     .assign_dtdevice = flask_assign_dtdevice,
     .deassign_dtdevice = flask_deassign_dtdevice,
 #endif
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index f255fb63bf..b7e864a874 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -25,7 +25,7 @@
 #include &lt;asm/setup.h&gt;
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #include &lt;asm/setup.h&gt;
 #endif
 
@@ -166,7 +166,7 @@ int __init xsm_multiboot_init(struct boot_info *bi)
 }
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 int __init xsm_dt_init(void)
 {
     int ret = 0;
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 1b4030edb4..3f04375347 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -24,7 +24,7 @@
 #include &lt;asm/setup.h&gt;
 #endif
 #include &lt;xen/bitops.h&gt;
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 # include &lt;asm/setup.h&gt;
 # include &lt;xen/device_tree.h&gt;
 #endif
@@ -65,7 +65,7 @@ int __init xsm_multiboot_policy_init(
 }
 #endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 {
     struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM);
</pre>
    </blockquote>
  </body>
</html>

--------------Mi4Jfu1pDSJtXZsfBRAzMCKd--

