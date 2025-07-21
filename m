Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF97B0C3B3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 13:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051428.1419764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udp4h-0007Ah-2a; Mon, 21 Jul 2025 11:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051428.1419764; Mon, 21 Jul 2025 11:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udp4g-00077w-V4; Mon, 21 Jul 2025 11:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1051428;
 Mon, 21 Jul 2025 11:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ESUV=2C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1udp4f-00077q-15
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 11:52:53 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2c286f-6629-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 13:52:50 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo6561540a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 04:52:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c90bb932sm5300056a12.67.2025.07.21.04.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 04:52:49 -0700 (PDT)
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
X-Inumbo-ID: 3a2c286f-6629-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753098770; x=1753703570; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GD5VcUCEMLcE/+ey2empvahAwcsLquBB4cJPN18rfA=;
        b=RJb7GPEZP0Eb/da2xmkbLUpnDg79Q3Tusm/beniYfI0BcqqrR3HZRjlCU8DEgr6om0
         2tKVTBk+y6Je88+YfFalGzvrnZhdA3U6otiyZYN6UwKBdwOCFGm+UNpCUTDUJZkwb0f1
         glRloQ1sAmBQihbIrXpgZ6D9eLzRuYT+kvxQMnvbBUA20qsO5OUJZhHHEPfoH4Yn+ZV1
         YClUpzrr/kg66X/e1uWRnqQpvADY9ejFSaR9xEMG3EcDmXo3E4K2z7FkGRFZLM7e5swH
         adGgf1f1UJjIFCx93m+au3nmJ86+nlSh1PVnHAPzQKZr92x1k3UmSjHssjrjKgRnp+bl
         Wpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753098770; x=1753703570;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GD5VcUCEMLcE/+ey2empvahAwcsLquBB4cJPN18rfA=;
        b=TQPasB0RLrCq/20a6mRAUTxHmrbcEOpRR9Q1iwfzBBDiFfRVIDZlspSmhUS6XyYkwT
         G8A7n5b0yQSgFcieNvwezcygI75pBGg37U/fvGqhdKMf92q7AKBs9PsVWmRfcrCVy/l1
         iNHvwxiPkMuFlYZXCGbdo4spy4dCgMbiA0G4HxWwN2LjNr1GRkbwTvhBAZ1gdqvrf6T/
         QFlhXe1gRBnmWMSeQtGhQ3hPvlHsBtje0yWig0A8A6Ufh7C9/dJWOZJvUwIPssNB9Zpb
         Jos3b927dStR4GpFmn01vb2t9tr8iIZjYWHd112rCrtF98yHX6fWmNyPf0kQYEyvLANJ
         8/YA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6WL6/PR9mzvN3vOnHCEzel888VBAWVyBR5VbjaarQcA9TwngFHbgDhlgFeBq5ejshch2Ypf2/YY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydn88hIpmc6QaS33gznbUZUMm98Nr/E+sThIkUW2ANdF3oQF9Q
	SoPn7x1lBnl1/g+pe/77I/aUWgAOKZOX4LRXTEmP+aezjLaMAFDFpT5R
X-Gm-Gg: ASbGncsznGn5AnMX9K+9NzoiKN7iNeQF8/UI22NIzYu/2eh8SiqTapU80DK7X3RtoEd
	oStj+vg7SNIgr9Ybw1n4MD9DrzV/UzJqRZOHHOSU83QnS8m04cM1LHR/XQOu9R/BClPd1Ay2e9v
	LRTusBCtag88YJHS8i5XdO7j9b5T629iFjpW4hWWlgwJ/LWF07toepI60WPcHmtAXK+C0E3Bhal
	3lLIK27p26vf/NB/5rYa9UWq4iqzZAYery2kHO/MAph5p1NYnn/w1wDaswdchDKBheo4iupR9Gm
	tPPeLKdQid6vd0IFHyx3BamHQ5NI6pCdCvpHH/JfL+qZQ0+BLDKDqPOpsg9ZzDiKP1JGRzwAifV
	9Z6bx0Mt6yNThsTL3MOvjbmZoahyCxXn4ZQZVe6gUdbfAABMWwV12PEb3hn+2NN/mpcbUxAV+JM
	q3RMRmWQ==
X-Google-Smtp-Source: AGHT+IHPi9Q821xAEQWPzKBih4taoGotX4dca++HF3kJLW+srBMWxW/Tr2GvT+ReFZ/3nfVd5QPqhQ==
X-Received: by 2002:a05:6402:51d1:b0:611:d10e:ebd7 with SMTP id 4fb4d7f45d1cf-61285be0175mr18300011a12.19.1753098769599;
        Mon, 21 Jul 2025 04:52:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UKrm4pQkX7fqReI96zmTesup"
Message-ID: <d9554d2b-4a44-4401-b490-2a10f3f29ca0@gmail.com>
Date: Mon, 21 Jul 2025 13:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] xen/dt: Move bootinfo functions to a new
 bootinfo.h
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-6-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250715161108.141126-6-alejandro.garciavallejo@amd.com>

This is a multi-part message in MIME format.
--------------UKrm4pQkX7fqReI96zmTesup
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/25 6:11 PM, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of
> bootinfo to a separate file for x86 to take.
>
> With this, bootfdt.h can be cleanly included from x86. A later patch
> extracts the definitions so the functions may be called too.
>
> Not a functional change.
>
> Signed-off-by: Alejandro Vallejo<alejandro.garciavallejo@amd.com>
> Reviewed-by: Stefano Stabellini<sstabellini@kernel.org>

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com> # riscv

~ Oleksii

> ---
>   xen/arch/arm/domain_build.c             |   1 +
>   xen/arch/arm/include/asm/setup.h        |   2 +-
>   xen/arch/arm/setup.c                    |   1 +
>   xen/arch/riscv/mm.c                     |   2 +-
>   xen/arch/riscv/setup.c                  |   2 +-
>   xen/common/device-tree/bootfdt.c        |   2 +-
>   xen/common/device-tree/bootinfo.c       |   2 +-
>   xen/common/device-tree/dom0less-build.c |   2 +-
>   xen/common/device-tree/domain-build.c   |   2 +-
>   xen/common/device-tree/kernel.c         |   2 +-
>   xen/include/xen/bootfdt.h               | 207 -----------------------
>   xen/include/xen/bootinfo.h              | 213 ++++++++++++++++++++++++
>   xen/include/xen/fdt-domain-build.h      |   2 +-
>   xen/include/xen/fdt-kernel.h            |   2 +-
>   14 files changed, 225 insertions(+), 217 deletions(-)
>   create mode 100644 xen/include/xen/bootinfo.h
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index edc9a82c15..b66a172eb8 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   #include <xen/init.h>
> +#include <xen/bootinfo.h>
>   #include <xen/compile.h>
>   #include <xen/fdt-domain-build.h>
>   #include <xen/fdt-kernel.h>
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index b199d92a42..1eaf13bd66 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -3,7 +3,7 @@
>   
>   #include <public/version.h>
>   #include <asm/p2m.h>
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/device_tree.h>
>   
>   #if defined(CONFIG_MMU)
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 12b76a0a98..8abc1d641d 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -8,6 +8,7 @@
>    * Copyright (c) 2011 Citrix Systems.
>    */
>   
> +#include <xen/bootinfo.h>
>   #include <xen/compile.h>
>   #include <xen/device_tree.h>
>   #include <xen/domain_page.h>
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 774ea42f2d..1ef015f179 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/bug.h>
>   #include <xen/compiler.h>
>   #include <xen/domain_page.h>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index a17096bf02..483cdd7e17 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -2,7 +2,7 @@
>   
>   #include <xen/acpi.h>
>   #include <xen/bug.h>
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/compile.h>
>   #include <xen/console.h>
>   #include <xen/device_tree.h>
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 67fe5c3cc3..e372096b19 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -5,7 +5,7 @@
>    * Copyright (C) 2012-2014 Citrix Systems, Inc.
>    */
>   
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/device_tree.h>
>   #include <xen/efi.h>
>   #include <xen/init.h>
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index 2a27d1318b..00a43fb358 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -10,7 +10,7 @@
>    */
>   
>   #include <xen/acpi.h>
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/bug.h>
>   #include <xen/device_tree.h>
>   #include <xen/init.h>
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index e950691d1e..93734e0ea8 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/device_tree.h>
>   #include <xen/domain.h>
>   #include <xen/domain_page.h>
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 2fdea6624a..95b383e00f 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/fdt-domain-build.h>
>   #include <xen/init.h>
>   #include <xen/lib.h>
> diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
> index 6de2334dbe..ef393182b6 100644
> --- a/xen/common/device-tree/kernel.c
> +++ b/xen/common/device-tree/kernel.c
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/device_tree.h>
>   #include <xen/fdt-kernel.h>
>   #include <xen/errno.h>
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index a5dfaa5c1d..b22d7b39c2 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -5,10 +5,7 @@
>   #include <xen/byteorder.h>
>   #include <xen/bug.h>
>   #include <xen/types.h>
> -#include <xen/kernel.h>
>   #include <xen/lib.h>
> -#include <xen/macros.h>
> -#include <xen/xmalloc.h>
>   
>   #if __has_include(<asm/bootfdt.h>)
>   #include <asm/bootfdt.h>
> @@ -16,15 +13,10 @@
>   
>   #define MIN_FDT_ALIGN 8
>   
> -#define NR_MEM_BANKS 256
> -#define NR_SHMEM_BANKS 32
> -
>   /* Default #address and #size cells */
>   #define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
>   #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>   
> -#define MAX_MODULES 32 /* Current maximum useful modules */
> -
>   #define DEVICE_TREE_MAX_DEPTH 16
>   
>   /* Helper to read a big number; size is in cells (not bytes) */
> @@ -116,77 +108,6 @@ typedef enum {
>       BOOTMOD_UNKNOWN
>   }  boot_module_kind;
>   
> -enum membank_type {
> -    /*
> -     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> -     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> -     * the bank is in 'mem').
> -     */
> -    MEMBANK_DEFAULT,
> -    /*
> -     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
> -     * bank is bound to a static Xen domain. It is only valid when the bank
> -     * is in reserved_mem.
> -     */
> -    MEMBANK_STATIC_DOMAIN,
> -    /*
> -     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
> -     * bank is reserved as static heap. It is only valid when the bank is
> -     * in reserved_mem.
> -     */
> -    MEMBANK_STATIC_HEAP,
> -    /*
> -     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
> -     * bank is from the FDT reserve map.
> -     */
> -    MEMBANK_FDT_RESVMEM,
> -};
> -
> -enum region_type {
> -    MEMORY,
> -    RESERVED_MEMORY,
> -    STATIC_SHARED_MEMORY
> -};
> -
> -/* Indicates the maximum number of characters(\0 included) for shm_id */
> -#define MAX_SHM_ID_LENGTH 16
> -
> -struct shmem_membank_extra {
> -    char shm_id[MAX_SHM_ID_LENGTH];
> -    unsigned int nr_shm_borrowers;
> -};
> -
> -struct membank {
> -    paddr_t start;
> -    paddr_t size;
> -    union {
> -        enum membank_type type;
> -#ifdef CONFIG_STATIC_SHM
> -        struct shmem_membank_extra *shmem_extra;
> -#endif
> -    };
> -};
> -
> -struct membanks {
> -    __struct_group(membanks_hdr, common, ,
> -        unsigned int nr_banks;
> -        unsigned int max_banks;
> -        enum region_type type;
> -    );
> -    struct membank bank[];
> -};
> -
> -struct meminfo {
> -    struct membanks_hdr common;
> -    struct membank bank[NR_MEM_BANKS];
> -};
> -
> -struct shared_meminfo {
> -    struct membanks_hdr common;
> -    struct membank bank[NR_SHMEM_BANKS];
> -    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
> -};
> -
>   struct boot_domain {
>       struct domain *d;
>   
> @@ -220,134 +141,6 @@ struct boot_module {
>   #endif
>   };
>   
> -/* DT_MAX_NAME is the node name max length according the DT spec */
> -#define DT_MAX_NAME 41
> -struct bootcmdline {
> -    boot_module_kind kind;
> -    bool domU;
> -    paddr_t start;
> -    char dt_name[DT_MAX_NAME];
> -    char cmdline[BOOTMOD_MAX_CMDLINE];
> -};
> -
> -struct boot_modules {
> -    int nr_mods;
> -    struct boot_module module[MAX_MODULES];
> -};
> -
> -struct bootcmdlines {
> -    unsigned int nr_mods;
> -    struct bootcmdline cmdline[MAX_MODULES];
> -};
> -
> -struct bootinfo {
> -    struct meminfo mem;
> -    /* The reserved regions are only used when booting using Device-Tree */
> -    struct meminfo reserved_mem;
> -    struct boot_modules modules;
> -    struct bootcmdlines cmdlines;
> -#ifdef CONFIG_ACPI
> -    struct meminfo acpi;
> -#endif
> -#ifdef CONFIG_STATIC_SHM
> -    struct shared_meminfo shmem;
> -#endif
> -};
> -
> -#ifdef CONFIG_ACPI
> -#define BOOTINFO_ACPI_INIT                          \
> -    .acpi.common.max_banks = NR_MEM_BANKS,          \
> -    .acpi.common.type = MEMORY,
> -#else
> -#define BOOTINFO_ACPI_INIT
> -#endif
> -
> -#ifdef CONFIG_STATIC_SHM
> -#define BOOTINFO_SHMEM_INIT                         \
> -    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
> -    .shmem.common.type = STATIC_SHARED_MEMORY,
> -#else
> -#define BOOTINFO_SHMEM_INIT
> -#endif
> -
> -#define BOOTINFO_INIT                               \
> -{                                                   \
> -    .mem.common.max_banks = NR_MEM_BANKS,           \
> -    .mem.common.type = MEMORY,                      \
> -    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
> -    .reserved_mem.common.type = RESERVED_MEMORY,    \
> -    BOOTINFO_ACPI_INIT                              \
> -    BOOTINFO_SHMEM_INIT                             \
> -}
> -
> -extern struct bootinfo bootinfo;
> -
> -bool check_reserved_regions_overlap(paddr_t region_start,
> -                                    paddr_t region_size,
> -                                    bool allow_memreserve_overlap);
> -
> -struct boot_module *add_boot_module(boot_module_kind kind,
> -                                   paddr_t start, paddr_t size, bool domU);
> -struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
> -struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
> -                                                             paddr_t start);
> -void add_boot_cmdline(const char *name, const char *cmdline,
> -                      boot_module_kind kind, paddr_t start, bool domU);
> -struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
> -struct bootcmdline * boot_cmdline_find_by_name(const char *name);
> -const char *boot_module_kind_as_string(boot_module_kind kind);
> -
> -void populate_boot_allocator(void);
> -
> -size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> -
> -const char *boot_fdt_cmdline(const void *fdt);
> -int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
> -
> -static inline struct membanks *bootinfo_get_reserved_mem(void)
> -{
> -    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
> -}
> -
> -static inline struct membanks *bootinfo_get_mem(void)
> -{
> -    return container_of(&bootinfo.mem.common, struct membanks, common);
> -}
> -
> -#ifdef CONFIG_ACPI
> -static inline struct membanks *bootinfo_get_acpi(void)
> -{
> -    return container_of(&bootinfo.acpi.common, struct membanks, common);
> -}
> -#endif
> -
> -#ifdef CONFIG_STATIC_SHM
> -static inline struct membanks *bootinfo_get_shmem(void)
> -{
> -    return container_of(&bootinfo.shmem.common, struct membanks, common);
> -}
> -
> -static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
> -{
> -    return bootinfo.shmem.extra;
> -}
> -#endif
> -
> -static inline struct membanks *membanks_xzalloc(unsigned int nr,
> -                                                enum region_type type)
> -{
> -    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
> -
> -    if ( !banks )
> -        goto out;
> -
> -    banks->max_banks = nr;
> -    banks->type = type;
> -
> - out:
> -    return banks;
> -}
> -
>   /*
>    * Interpret the property `prop_name` of `node` as a u32.
>    *
> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> new file mode 100644
> index 0000000000..f834f19571
> --- /dev/null
> +++ b/xen/include/xen/bootinfo.h
> @@ -0,0 +1,213 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN_BOOTINFO_H
> +#define XEN_BOOTINFO_H
> +
> +#include <xen/bootfdt.h>
> +#include <xen/kernel.h>
> +#include <xen/macros.h>
> +#include <xen/xmalloc.h>
> +
> +#define NR_MEM_BANKS 256
> +#define NR_SHMEM_BANKS 32
> +
> +#define MAX_MODULES 32 /* Current maximum useful modules */
> +
> +enum membank_type {
> +    /*
> +     * The MEMBANK_DEFAULT type refers to either reserved memory for the
> +     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> +     * the bank is in 'mem').
> +     */
> +    MEMBANK_DEFAULT,
> +    /*
> +     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
> +     * bank is bound to a static Xen domain. It is only valid when the bank
> +     * is in reserved_mem.
> +     */
> +    MEMBANK_STATIC_DOMAIN,
> +    /*
> +     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
> +     * bank is reserved as static heap. It is only valid when the bank is
> +     * in reserved_mem.
> +     */
> +    MEMBANK_STATIC_HEAP,
> +    /*
> +     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
> +     * bank is from the FDT reserve map.
> +     */
> +    MEMBANK_FDT_RESVMEM,
> +};
> +
> +enum region_type {
> +    MEMORY,
> +    RESERVED_MEMORY,
> +    STATIC_SHARED_MEMORY
> +};
> +
> +/* Indicates the maximum number of characters(\0 included) for shm_id */
> +#define MAX_SHM_ID_LENGTH 16
> +
> +struct shmem_membank_extra {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +};
> +
> +struct membank {
> +    paddr_t start;
> +    paddr_t size;
> +    union {
> +        enum membank_type type;
> +#ifdef CONFIG_STATIC_SHM
> +        struct shmem_membank_extra *shmem_extra;
> +#endif
> +    };
> +};
> +
> +struct membanks {
> +    __struct_group(membanks_hdr, common, ,
> +        unsigned int nr_banks;
> +        unsigned int max_banks;
> +        enum region_type type;
> +    );
> +    struct membank bank[];
> +};
> +
> +struct meminfo {
> +    struct membanks_hdr common;
> +    struct membank bank[NR_MEM_BANKS];
> +};
> +
> +struct shared_meminfo {
> +    struct membanks_hdr common;
> +    struct membank bank[NR_SHMEM_BANKS];
> +    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
> +};
> +
> +/* DT_MAX_NAME is the node name max length according the DT spec */
> +#define DT_MAX_NAME 41
> +struct bootcmdline {
> +    boot_module_kind kind;
> +    bool domU;
> +    paddr_t start;
> +    char dt_name[DT_MAX_NAME];
> +    char cmdline[BOOTMOD_MAX_CMDLINE];
> +};
> +
> +struct boot_modules {
> +    int nr_mods;
> +    struct boot_module module[MAX_MODULES];
> +};
> +
> +struct bootcmdlines {
> +    unsigned int nr_mods;
> +    struct bootcmdline cmdline[MAX_MODULES];
> +};
> +
> +struct bootinfo {
> +    struct meminfo mem;
> +    /* The reserved regions are only used when booting using Device-Tree */
> +    struct meminfo reserved_mem;
> +    struct boot_modules modules;
> +    struct bootcmdlines cmdlines;
> +#ifdef CONFIG_ACPI
> +    struct meminfo acpi;
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +    struct shared_meminfo shmem;
> +#endif
> +};
> +
> +#ifdef CONFIG_ACPI
> +#define BOOTINFO_ACPI_INIT                          \
> +    .acpi.common.max_banks = NR_MEM_BANKS,          \
> +    .acpi.common.type = MEMORY,
> +#else
> +#define BOOTINFO_ACPI_INIT
> +#endif
> +
> +#ifdef CONFIG_STATIC_SHM
> +#define BOOTINFO_SHMEM_INIT                         \
> +    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
> +    .shmem.common.type = STATIC_SHARED_MEMORY,
> +#else
> +#define BOOTINFO_SHMEM_INIT
> +#endif
> +
> +#define BOOTINFO_INIT                               \
> +{                                                   \
> +    .mem.common.max_banks = NR_MEM_BANKS,           \
> +    .mem.common.type = MEMORY,                      \
> +    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
> +    .reserved_mem.common.type = RESERVED_MEMORY,    \
> +    BOOTINFO_ACPI_INIT                              \
> +    BOOTINFO_SHMEM_INIT                             \
> +}
> +
> +extern struct bootinfo bootinfo;
> +
> +bool check_reserved_regions_overlap(paddr_t region_start,
> +                                    paddr_t region_size,
> +                                    bool allow_memreserve_overlap);
> +
> +struct boot_module *add_boot_module(boot_module_kind kind,
> +                                    paddr_t start, paddr_t size, bool domU);
> +struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
> +struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
> +                                                             paddr_t start);
> +void add_boot_cmdline(const char *name, const char *cmdline,
> +                      boot_module_kind kind, paddr_t start, bool domU);
> +struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
> +struct bootcmdline * boot_cmdline_find_by_name(const char *name);
> +const char *boot_module_kind_as_string(boot_module_kind kind);
> +
> +void populate_boot_allocator(void);
> +
> +size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> +const char *boot_fdt_cmdline(const void *fdt);
> +int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
> +
> +static inline struct membanks *bootinfo_get_reserved_mem(void)
> +{
> +    return container_of(&bootinfo.reserved_mem.common, struct membanks, common);
> +}
> +
> +static inline struct membanks *bootinfo_get_mem(void)
> +{
> +    return container_of(&bootinfo.mem.common, struct membanks, common);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static inline struct membanks *bootinfo_get_acpi(void)
> +{
> +    return container_of(&bootinfo.acpi.common, struct membanks, common);
> +}
> +#endif
> +
> +#ifdef CONFIG_STATIC_SHM
> +static inline struct membanks *bootinfo_get_shmem(void)
> +{
> +    return container_of(&bootinfo.shmem.common, struct membanks, common);
> +}
> +
> +static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
> +{
> +    return bootinfo.shmem.extra;
> +}
> +#endif
> +
> +static inline struct membanks *membanks_xzalloc(unsigned int nr,
> +                                                enum region_type type)
> +{
> +    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
> +
> +    if ( !banks )
> +        goto out;
> +
> +    banks->max_banks = nr;
> +    banks->type = type;
> +
> + out:
> +    return banks;
> +}
> +
> +#endif /* XEN_BOOTINFO_H */
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> index 3a20623cf5..886a853816 100644
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -3,7 +3,7 @@
>   #ifndef __XEN_FDT_DOMAIN_BUILD_H__
>   #define __XEN_FDT_DOMAIN_BUILD_H__
>   
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/device_tree.h>
>   #include <xen/fdt-kernel.h>
>   #include <xen/mm.h>
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 8363865282..33a60597bb 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -7,7 +7,7 @@
>   #ifndef __XEN_FDT_KERNEL_H__
>   #define __XEN_FDT_KERNEL_H__
>   
> -#include <xen/bootfdt.h>
> +#include <xen/bootinfo.h>
>   #include <xen/device_tree.h>
>   #include <xen/types.h>
>   
--------------UKrm4pQkX7fqReI96zmTesup
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
      cite="mid:20250715161108.141126-6-alejandro.garciavallejo@amd.com">
      <pre wrap="" class="moz-quote-pre">Part of an unpicking process to extract bootfdt contents independent of
bootinfo to a separate file for x86 to take.

With this, bootfdt.h can be cleanly included from x86. A later patch
extracts the definitions so the functions may be called too.

Not a functional change.

Signed-off-by: Alejandro Vallejo <a class="moz-txt-link-rfc2396E" href="mailto:alejandro.garciavallejo@amd.com">&lt;alejandro.garciavallejo@amd.com&gt;</a>
Reviewed-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a></pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a> # riscv

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20250715161108.141126-6-alejandro.garciavallejo@amd.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/arm/domain_build.c             |   1 +
 xen/arch/arm/include/asm/setup.h        |   2 +-
 xen/arch/arm/setup.c                    |   1 +
 xen/arch/riscv/mm.c                     |   2 +-
 xen/arch/riscv/setup.c                  |   2 +-
 xen/common/device-tree/bootfdt.c        |   2 +-
 xen/common/device-tree/bootinfo.c       |   2 +-
 xen/common/device-tree/dom0less-build.c |   2 +-
 xen/common/device-tree/domain-build.c   |   2 +-
 xen/common/device-tree/kernel.c         |   2 +-
 xen/include/xen/bootfdt.h               | 207 -----------------------
 xen/include/xen/bootinfo.h              | 213 ++++++++++++++++++++++++
 xen/include/xen/fdt-domain-build.h      |   2 +-
 xen/include/xen/fdt-kernel.h            |   2 +-
 14 files changed, 225 insertions(+), 217 deletions(-)
 create mode 100644 xen/include/xen/bootinfo.h

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index edc9a82c15..b66a172eb8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include &lt;xen/init.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/compile.h&gt;
 #include &lt;xen/fdt-domain-build.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index b199d92a42..1eaf13bd66 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -3,7 +3,7 @@
 
 #include &lt;public/version.h&gt;
 #include &lt;asm/p2m.h&gt;
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/device_tree.h&gt;
 
 #if defined(CONFIG_MMU)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 12b76a0a98..8abc1d641d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2011 Citrix Systems.
  */
 
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/compile.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/domain_page.h&gt;
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 774ea42f2d..1ef015f179 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/bug.h&gt;
 #include &lt;xen/compiler.h&gt;
 #include &lt;xen/domain_page.h&gt;
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a17096bf02..483cdd7e17 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,7 +2,7 @@
 
 #include &lt;xen/acpi.h&gt;
 #include &lt;xen/bug.h&gt;
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/compile.h&gt;
 #include &lt;xen/console.h&gt;
 #include &lt;xen/device_tree.h&gt;
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 67fe5c3cc3..e372096b19 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2012-2014 Citrix Systems, Inc.
  */
 
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/efi.h&gt;
 #include &lt;xen/init.h&gt;
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index 2a27d1318b..00a43fb358 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -10,7 +10,7 @@
  */
 
 #include &lt;xen/acpi.h&gt;
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/bug.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/init.h&gt;
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index e950691d1e..93734e0ea8 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/domain.h&gt;
 #include &lt;xen/domain_page.h&gt;
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 2fdea6624a..95b383e00f 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/fdt-domain-build.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/lib.h&gt;
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index 6de2334dbe..ef393182b6 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
 #include &lt;xen/errno.h&gt;
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index a5dfaa5c1d..b22d7b39c2 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -5,10 +5,7 @@
 #include &lt;xen/byteorder.h&gt;
 #include &lt;xen/bug.h&gt;
 #include &lt;xen/types.h&gt;
-#include &lt;xen/kernel.h&gt;
 #include &lt;xen/lib.h&gt;
-#include &lt;xen/macros.h&gt;
-#include &lt;xen/xmalloc.h&gt;
 
 #if __has_include(&lt;asm/bootfdt.h&gt;)
 #include &lt;asm/bootfdt.h&gt;
@@ -16,15 +13,10 @@
 
 #define MIN_FDT_ALIGN 8
 
-#define NR_MEM_BANKS 256
-#define NR_SHMEM_BANKS 32
-
 /* Default #address and #size cells */
 #define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
 #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
 
-#define MAX_MODULES 32 /* Current maximum useful modules */
-
 #define DEVICE_TREE_MAX_DEPTH 16
 
 /* Helper to read a big number; size is in cells (not bytes) */
@@ -116,77 +108,6 @@ typedef enum {
     BOOTMOD_UNKNOWN
 }  boot_module_kind;
 
-enum membank_type {
-    /*
-     * The MEMBANK_DEFAULT type refers to either reserved memory for the
-     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
-     * the bank is in 'mem').
-     */
-    MEMBANK_DEFAULT,
-    /*
-     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
-     * bank is bound to a static Xen domain. It is only valid when the bank
-     * is in reserved_mem.
-     */
-    MEMBANK_STATIC_DOMAIN,
-    /*
-     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
-     * bank is reserved as static heap. It is only valid when the bank is
-     * in reserved_mem.
-     */
-    MEMBANK_STATIC_HEAP,
-    /*
-     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
-     * bank is from the FDT reserve map.
-     */
-    MEMBANK_FDT_RESVMEM,
-};
-
-enum region_type {
-    MEMORY,
-    RESERVED_MEMORY,
-    STATIC_SHARED_MEMORY
-};
-
-/* Indicates the maximum number of characters(\0 included) for shm_id */
-#define MAX_SHM_ID_LENGTH 16
-
-struct shmem_membank_extra {
-    char shm_id[MAX_SHM_ID_LENGTH];
-    unsigned int nr_shm_borrowers;
-};
-
-struct membank {
-    paddr_t start;
-    paddr_t size;
-    union {
-        enum membank_type type;
-#ifdef CONFIG_STATIC_SHM
-        struct shmem_membank_extra *shmem_extra;
-#endif
-    };
-};
-
-struct membanks {
-    __struct_group(membanks_hdr, common, ,
-        unsigned int nr_banks;
-        unsigned int max_banks;
-        enum region_type type;
-    );
-    struct membank bank[];
-};
-
-struct meminfo {
-    struct membanks_hdr common;
-    struct membank bank[NR_MEM_BANKS];
-};
-
-struct shared_meminfo {
-    struct membanks_hdr common;
-    struct membank bank[NR_SHMEM_BANKS];
-    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
-};
-
 struct boot_domain {
     struct domain *d;
 
@@ -220,134 +141,6 @@ struct boot_module {
 #endif
 };
 
-/* DT_MAX_NAME is the node name max length according the DT spec */
-#define DT_MAX_NAME 41
-struct bootcmdline {
-    boot_module_kind kind;
-    bool domU;
-    paddr_t start;
-    char dt_name[DT_MAX_NAME];
-    char cmdline[BOOTMOD_MAX_CMDLINE];
-};
-
-struct boot_modules {
-    int nr_mods;
-    struct boot_module module[MAX_MODULES];
-};
-
-struct bootcmdlines {
-    unsigned int nr_mods;
-    struct bootcmdline cmdline[MAX_MODULES];
-};
-
-struct bootinfo {
-    struct meminfo mem;
-    /* The reserved regions are only used when booting using Device-Tree */
-    struct meminfo reserved_mem;
-    struct boot_modules modules;
-    struct bootcmdlines cmdlines;
-#ifdef CONFIG_ACPI
-    struct meminfo acpi;
-#endif
-#ifdef CONFIG_STATIC_SHM
-    struct shared_meminfo shmem;
-#endif
-};
-
-#ifdef CONFIG_ACPI
-#define BOOTINFO_ACPI_INIT                          \
-    .acpi.common.max_banks = NR_MEM_BANKS,          \
-    .acpi.common.type = MEMORY,
-#else
-#define BOOTINFO_ACPI_INIT
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-#define BOOTINFO_SHMEM_INIT                         \
-    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
-    .shmem.common.type = STATIC_SHARED_MEMORY,
-#else
-#define BOOTINFO_SHMEM_INIT
-#endif
-
-#define BOOTINFO_INIT                               \
-{                                                   \
-    .mem.common.max_banks = NR_MEM_BANKS,           \
-    .mem.common.type = MEMORY,                      \
-    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
-    .reserved_mem.common.type = RESERVED_MEMORY,    \
-    BOOTINFO_ACPI_INIT                              \
-    BOOTINFO_SHMEM_INIT                             \
-}
-
-extern struct bootinfo bootinfo;
-
-bool check_reserved_regions_overlap(paddr_t region_start,
-                                    paddr_t region_size,
-                                    bool allow_memreserve_overlap);
-
-struct boot_module *add_boot_module(boot_module_kind kind,
-                                   paddr_t start, paddr_t size, bool domU);
-struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
-struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
-                                                             paddr_t start);
-void add_boot_cmdline(const char *name, const char *cmdline,
-                      boot_module_kind kind, paddr_t start, bool domU);
-struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
-struct bootcmdline * boot_cmdline_find_by_name(const char *name);
-const char *boot_module_kind_as_string(boot_module_kind kind);
-
-void populate_boot_allocator(void);
-
-size_t boot_fdt_info(const void *fdt, paddr_t paddr);
-
-const char *boot_fdt_cmdline(const void *fdt);
-int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
-
-static inline struct membanks *bootinfo_get_reserved_mem(void)
-{
-    return container_of(&amp;bootinfo.reserved_mem.common, struct membanks, common);
-}
-
-static inline struct membanks *bootinfo_get_mem(void)
-{
-    return container_of(&amp;bootinfo.mem.common, struct membanks, common);
-}
-
-#ifdef CONFIG_ACPI
-static inline struct membanks *bootinfo_get_acpi(void)
-{
-    return container_of(&amp;bootinfo.acpi.common, struct membanks, common);
-}
-#endif
-
-#ifdef CONFIG_STATIC_SHM
-static inline struct membanks *bootinfo_get_shmem(void)
-{
-    return container_of(&amp;bootinfo.shmem.common, struct membanks, common);
-}
-
-static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
-{
-    return bootinfo.shmem.extra;
-}
-#endif
-
-static inline struct membanks *membanks_xzalloc(unsigned int nr,
-                                                enum region_type type)
-{
-    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
-
-    if ( !banks )
-        goto out;
-
-    banks-&gt;max_banks = nr;
-    banks-&gt;type = type;
-
- out:
-    return banks;
-}
-
 /*
  * Interpret the property `prop_name` of `node` as a u32.
  *
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
new file mode 100644
index 0000000000..f834f19571
--- /dev/null
+++ b/xen/include/xen/bootinfo.h
@@ -0,0 +1,213 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_BOOTINFO_H
+#define XEN_BOOTINFO_H
+
+#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/kernel.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/xmalloc.h&gt;
+
+#define NR_MEM_BANKS 256
+#define NR_SHMEM_BANKS 32
+
+#define MAX_MODULES 32 /* Current maximum useful modules */
+
+enum membank_type {
+    /*
+     * The MEMBANK_DEFAULT type refers to either reserved memory for the
+     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
+     * the bank is in 'mem').
+     */
+    MEMBANK_DEFAULT,
+    /*
+     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
+     * bank is bound to a static Xen domain. It is only valid when the bank
+     * is in reserved_mem.
+     */
+    MEMBANK_STATIC_DOMAIN,
+    /*
+     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
+     * bank is reserved as static heap. It is only valid when the bank is
+     * in reserved_mem.
+     */
+    MEMBANK_STATIC_HEAP,
+    /*
+     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
+     * bank is from the FDT reserve map.
+     */
+    MEMBANK_FDT_RESVMEM,
+};
+
+enum region_type {
+    MEMORY,
+    RESERVED_MEMORY,
+    STATIC_SHARED_MEMORY
+};
+
+/* Indicates the maximum number of characters(\0 included) for shm_id */
+#define MAX_SHM_ID_LENGTH 16
+
+struct shmem_membank_extra {
+    char shm_id[MAX_SHM_ID_LENGTH];
+    unsigned int nr_shm_borrowers;
+};
+
+struct membank {
+    paddr_t start;
+    paddr_t size;
+    union {
+        enum membank_type type;
+#ifdef CONFIG_STATIC_SHM
+        struct shmem_membank_extra *shmem_extra;
+#endif
+    };
+};
+
+struct membanks {
+    __struct_group(membanks_hdr, common, ,
+        unsigned int nr_banks;
+        unsigned int max_banks;
+        enum region_type type;
+    );
+    struct membank bank[];
+};
+
+struct meminfo {
+    struct membanks_hdr common;
+    struct membank bank[NR_MEM_BANKS];
+};
+
+struct shared_meminfo {
+    struct membanks_hdr common;
+    struct membank bank[NR_SHMEM_BANKS];
+    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
+};
+
+/* DT_MAX_NAME is the node name max length according the DT spec */
+#define DT_MAX_NAME 41
+struct bootcmdline {
+    boot_module_kind kind;
+    bool domU;
+    paddr_t start;
+    char dt_name[DT_MAX_NAME];
+    char cmdline[BOOTMOD_MAX_CMDLINE];
+};
+
+struct boot_modules {
+    int nr_mods;
+    struct boot_module module[MAX_MODULES];
+};
+
+struct bootcmdlines {
+    unsigned int nr_mods;
+    struct bootcmdline cmdline[MAX_MODULES];
+};
+
+struct bootinfo {
+    struct meminfo mem;
+    /* The reserved regions are only used when booting using Device-Tree */
+    struct meminfo reserved_mem;
+    struct boot_modules modules;
+    struct bootcmdlines cmdlines;
+#ifdef CONFIG_ACPI
+    struct meminfo acpi;
+#endif
+#ifdef CONFIG_STATIC_SHM
+    struct shared_meminfo shmem;
+#endif
+};
+
+#ifdef CONFIG_ACPI
+#define BOOTINFO_ACPI_INIT                          \
+    .acpi.common.max_banks = NR_MEM_BANKS,          \
+    .acpi.common.type = MEMORY,
+#else
+#define BOOTINFO_ACPI_INIT
+#endif
+
+#ifdef CONFIG_STATIC_SHM
+#define BOOTINFO_SHMEM_INIT                         \
+    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
+    .shmem.common.type = STATIC_SHARED_MEMORY,
+#else
+#define BOOTINFO_SHMEM_INIT
+#endif
+
+#define BOOTINFO_INIT                               \
+{                                                   \
+    .mem.common.max_banks = NR_MEM_BANKS,           \
+    .mem.common.type = MEMORY,                      \
+    .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
+    .reserved_mem.common.type = RESERVED_MEMORY,    \
+    BOOTINFO_ACPI_INIT                              \
+    BOOTINFO_SHMEM_INIT                             \
+}
+
+extern struct bootinfo bootinfo;
+
+bool check_reserved_regions_overlap(paddr_t region_start,
+                                    paddr_t region_size,
+                                    bool allow_memreserve_overlap);
+
+struct boot_module *add_boot_module(boot_module_kind kind,
+                                    paddr_t start, paddr_t size, bool domU);
+struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
+struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
+                                                             paddr_t start);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      boot_module_kind kind, paddr_t start, bool domU);
+struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
+struct bootcmdline * boot_cmdline_find_by_name(const char *name);
+const char *boot_module_kind_as_string(boot_module_kind kind);
+
+void populate_boot_allocator(void);
+
+size_t boot_fdt_info(const void *fdt, paddr_t paddr);
+const char *boot_fdt_cmdline(const void *fdt);
+int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
+
+static inline struct membanks *bootinfo_get_reserved_mem(void)
+{
+    return container_of(&amp;bootinfo.reserved_mem.common, struct membanks, common);
+}
+
+static inline struct membanks *bootinfo_get_mem(void)
+{
+    return container_of(&amp;bootinfo.mem.common, struct membanks, common);
+}
+
+#ifdef CONFIG_ACPI
+static inline struct membanks *bootinfo_get_acpi(void)
+{
+    return container_of(&amp;bootinfo.acpi.common, struct membanks, common);
+}
+#endif
+
+#ifdef CONFIG_STATIC_SHM
+static inline struct membanks *bootinfo_get_shmem(void)
+{
+    return container_of(&amp;bootinfo.shmem.common, struct membanks, common);
+}
+
+static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
+{
+    return bootinfo.shmem.extra;
+}
+#endif
+
+static inline struct membanks *membanks_xzalloc(unsigned int nr,
+                                                enum region_type type)
+{
+    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
+
+    if ( !banks )
+        goto out;
+
+    banks-&gt;max_banks = nr;
+    banks-&gt;type = type;
+
+ out:
+    return banks;
+}
+
+#endif /* XEN_BOOTINFO_H */
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 3a20623cf5..886a853816 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -3,7 +3,7 @@
 #ifndef __XEN_FDT_DOMAIN_BUILD_H__
 #define __XEN_FDT_DOMAIN_BUILD_H__
 
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
 #include &lt;xen/mm.h&gt;
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 8363865282..33a60597bb 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -7,7 +7,7 @@
 #ifndef __XEN_FDT_KERNEL_H__
 #define __XEN_FDT_KERNEL_H__
 
-#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/bootinfo.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/types.h&gt;
 
</pre>
    </blockquote>
  </body>
</html>

--------------UKrm4pQkX7fqReI96zmTesup--

