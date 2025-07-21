Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D189B0C2CA
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 13:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051389.1419723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udodi-0001MC-1E; Mon, 21 Jul 2025 11:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051389.1419723; Mon, 21 Jul 2025 11:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udodh-0001Ke-UK; Mon, 21 Jul 2025 11:25:01 +0000
Received: by outflank-mailman (input) for mailman id 1051389;
 Mon, 21 Jul 2025 11:25:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ESUV=2C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1udodg-0001KY-CP
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 11:25:00 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554f0854-6625-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 13:24:58 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-606b58241c9so6743542a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 04:24:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca7d2dasm661618766b.127.2025.07.21.04.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 04:24:56 -0700 (PDT)
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
X-Inumbo-ID: 554f0854-6625-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753097097; x=1753701897; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNQW9Qf0S0WN2QX/ONmlu6xjNfUUnhiLTphTcAVvHbc=;
        b=kNWyUtTHIzQrVCT7UGzHCuC73PY5oE/aTTymoDPD5LVWf2rSZmYnJV62KVkdibk+tB
         xZR5QbuV3TjhbQmb07sQ4hUO/gF0/KnkNsBlZNBgRh1D7ZF9Rx/I+07k+YlOK672XP8F
         tK2aHmrlKdRVEOPNX57FRWtFmMQA35tcwTRb4cOvdnWs7Euv51o9G8i6kuaZZMVipr9c
         Rglj3wGZWFCj6yhDlesD2enw+MgN5tTnj6e0f2a4TOHsnbCQnh8IsGPAWfywQ6kFgeNE
         3cy0ibD5b2wqsXOtLCdWaiabV69VjfpIDVOsxSPONcAAvpleWH+aWUTGAnZcihOL8tJF
         y66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753097097; x=1753701897;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zNQW9Qf0S0WN2QX/ONmlu6xjNfUUnhiLTphTcAVvHbc=;
        b=iK5xNKoRanCb0LFxajv6+qzSlIdKJqREXRZFeN8aQH6OD27pi9KZ37ogq8mxTQ+lCi
         sqNjmVkp6ZJk59/1A5Ce/60uePv8+hk2V0bwogXSekc+Ni3IehVBW/6ELm5AfkV/+NoY
         l4cBnM1MnaKbM+9gEaprrYUf2/Y9ElpEpBjviESn/1MUQwy2UwrFkAxJQOGk8wa3fbI8
         gg8/I3UUKTyilCA4OeUxDzNgzMtwS0d81y9itTVhn/dNhHhyxeK9RrikVFy0AJjEO275
         ua2fVuvBxOEBvHMtX2HOka5aQUdBQ1lZX8MgSFHBVHJqt5yeXFPFyOl9aEdzwD27IRcA
         vv8w==
X-Forwarded-Encrypted: i=1; AJvYcCWBJ4geGi7qvPt3f96/qlN1mo8SkT5I5WJ4dH2zkUa9HaPDQcoDnLsccGg/sisqTSAagGWf9XQWO3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL3665JkpWmjta6F1iBPCQMaCJyKE8uTkiK1ukHfo6sIiA/IHp
	J2rR/Vad04YWySJQu36mFuM5hpiTNo2wgfQdJl8MF4IjPoKDD8ib/uq3
X-Gm-Gg: ASbGncu98PX9QtJcRugD6V9J4PXz5eveAXPgH8BMSGXnif84nPC2mwqpNy637w9IQt/
	m52hYT7T1ZR8mOVpfnwZ/uq9fr1bEvVLCqoPjz6OnAz8Qshbl5budVlquidJH15+gwPW2lIP6Lw
	BLyeF0EyCMBNt5Cs1cyaZwD9XBNvdT+2dAR+a32w/nI4XyBKe/7U8F5JEdGnAM4lYnMetvc+AA5
	B+gVj+JStd2xUK477Uxziy0czZso/ERJDpx58/02787GRUn9OS5+V/sMytppSG3jueJq/EDJqVI
	E7QXQpIsE9GFb40AI1WFoZXft+EYM18tSFxWFTSYzMVV+8AwRi7z8+aK/x+S53BV8B5gHGQnzuo
	Ru/85HwVZJAS+UakeR3zqO1kG2p2nkLD317fu1y9o4coR9SDfW9RAXOdQQ3QZUnv0XS3VSgPuHt
	TYi92POA==
X-Google-Smtp-Source: AGHT+IG99M7CxjJXXWph+p4cQMLsxyQ3gxsaeyDEr4G6isxt59IS7GJbZ69fVDLqo9Usios0T+M+rA==
X-Received: by 2002:a17:906:63c9:b0:ae0:cadc:e745 with SMTP id a640c23a62f3a-ae9ce0f70admr1507572866b.40.1753097096983;
        Mon, 21 Jul 2025 04:24:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Cp6RiKO02KwMqvMTI0nRhlOn"
Message-ID: <8a07f04a-af37-4572-adff-a2784b6d9f21@gmail.com>
Date: Mon, 21 Jul 2025 13:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/11] xen/dt: Move bootfdt functions to xen/bootfdt.h
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-5-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250715161108.141126-5-alejandro.garciavallejo@amd.com>

This is a multi-part message in MIME format.
--------------Cp6RiKO02KwMqvMTI0nRhlOn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/25 6:10 PM, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of bootinfo
> to a separate file for x86 to take.
>
> Move functions required for early FDT parsing from device_tree.h and arm's
> setup.h onto bootfdt.h
>
> Declaration motion only. Not a functional change.
>
> Signed-off-by: Alejandro Vallejo<alejandro.garciavallejo@amd.com>
> Reviewed-by: Stefano Stabellini<sstabellini@kernel.org>

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com> # riscv

~ Oleksii

> ---
> v7:
>    * v6 was misrebased, and dt_read_number()'s refactor was lost. v7 ensures
>      it's preserved in the code motion
> ---
>   xen/arch/riscv/cpufeature.c            |   1 +
>   xen/arch/riscv/smpboot.c               |   1 +
>   xen/common/device-tree/bootfdt.c       |  12 ---
>   xen/common/device-tree/device-tree.c   |   1 +
>   xen/common/device-tree/static-evtchn.c |   1 +
>   xen/common/sched/boot-cpupool.c        |   1 +
>   xen/include/xen/bootfdt.h              | 103 +++++++++++++++++++++++++
>   xen/include/xen/device_tree.h          |  78 -------------------
>   8 files changed, 108 insertions(+), 90 deletions(-)
>
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index b7d5ec6580..b846a106a3 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include <xen/bitmap.h>
> +#include <xen/bootfdt.h>
>   #include <xen/ctype.h>
>   #include <xen/device_tree.h>
>   #include <xen/errno.h>
> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
> index 470f6d1311..3b8bf98e20 100644
> --- a/xen/arch/riscv/smpboot.c
> +++ b/xen/arch/riscv/smpboot.c
> @@ -1,3 +1,4 @@
> +#include <xen/bootfdt.h>
>   #include <xen/cpumask.h>
>   #include <xen/device_tree.h>
>   #include <xen/errno.h>
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 08d919aba6..67fe5c3cc3 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -215,18 +215,6 @@ u32 __init device_tree_get_u32(const void *fdt, int node,
>       return fdt32_to_cpu(get_unaligned_t(uint32_t, prop->data));
>   }
>   
> -/**
> - * device_tree_for_each_node - iterate over all device tree sub-nodes
> - * @fdt: flat device tree.
> - * @node: parent node to start the search from
> - * @func: function to call for each sub-node.
> - * @data: data to pass to @func.
> - *
> - * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
> - *
> - * Returns 0 if all nodes were iterated over successfully.  If @func
> - * returns a value different from 0, that value is returned immediately.
> - */
>   int __init device_tree_for_each_node(const void *fdt, int node,
>                                        device_tree_node_func func,
>                                        void *data)
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index 7bede20fa6..4ebdb2e52e 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include <xen/bitops.h>
> +#include <xen/bootfdt.h>
>   #include <xen/types.h>
>   #include <xen/init.h>
>   #include <xen/guest_access.h>
> diff --git a/xen/common/device-tree/static-evtchn.c b/xen/common/device-tree/static-evtchn.c
> index 8b82e6b3d8..88342b44a1 100644
> --- a/xen/common/device-tree/static-evtchn.c
> +++ b/xen/common/device-tree/static-evtchn.c
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> +#include <xen/bootfdt.h>
>   #include <xen/event.h>
>   #include <xen/static-evtchn.h>
>   
> diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
> index 641f3495cb..03be73efdd 100644
> --- a/xen/common/sched/boot-cpupool.c
> +++ b/xen/common/sched/boot-cpupool.c
> @@ -7,6 +7,7 @@
>    * Copyright (C) 2022 Arm Ltd.
>    */
>   
> +#include <xen/bootfdt.h>
>   #include <xen/acpi.h>
>   #include <xen/sched.h>
>   
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index ac2a79b59b..a5dfaa5c1d 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -2,8 +2,11 @@
>   #ifndef XEN_BOOTFDT_H
>   #define XEN_BOOTFDT_H
>   
> +#include <xen/byteorder.h>
> +#include <xen/bug.h>
>   #include <xen/types.h>
>   #include <xen/kernel.h>
> +#include <xen/lib.h>
>   #include <xen/macros.h>
>   #include <xen/xmalloc.h>
>   
> @@ -16,8 +19,92 @@
>   #define NR_MEM_BANKS 256
>   #define NR_SHMEM_BANKS 32
>   
> +/* Default #address and #size cells */
> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> +
>   #define MAX_MODULES 32 /* Current maximum useful modules */
>   
> +#define DEVICE_TREE_MAX_DEPTH 16
> +
> +/* Helper to read a big number; size is in cells (not bytes) */
> +static inline u64 dt_read_number(const __be32 *cell, int size)
> +{
> +    u64 r = be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r = (r << 32) | be32_to_cpu(cell[1]);
> +        break;
> +    default:
> +        /* Nonsensical size. default to 1 */
> +        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
> +        ASSERT_UNREACHABLE();
> +        break;
> +    };
> +
> +    return r;
> +}
> +
> +/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
> +static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
> +{
> +    uint64_t dt_r;
> +    paddr_t r;
> +
> +    /*
> +     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
> +     */
> +    dt_r = dt_read_number(cell, size);
> +
> +    if ( dt_r != (paddr_t)dt_r )
> +    {
> +        printk("Physical address greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    /*
> +     * Xen will truncate the address/size if it is greater than the maximum
> +     * supported width and it will give an appropriate warning.
> +     */
> +    r = dt_r;
> +
> +    return r;
> +}
> +
> +static inline u64 dt_next_cell(int s, const __be32 **cellp)
> +{
> +    const __be32 *p = *cellp;
> +
> +    *cellp = p + s;
> +    return dt_read_number(p, s);
> +}
> +
> +typedef int (*device_tree_node_func)(const void *fdt,
> +                                     int node, const char *name, int depth,
> +                                     u32 address_cells, u32 size_cells,
> +                                     void *data);
> +
> +/**
> + * device_tree_for_each_node - iterate over all device tree sub-nodes
> + * @fdt: flat device tree.
> + * @node: parent node to start the search from
> + * @func: function to call for each sub-node.
> + * @data: data to pass to @func.
> + *
> + * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
> + *
> + * Returns 0 if all nodes were iterated over successfully.  If @func
> + * returns a value different from 0, that value is returned immediately.
> + */
> +int device_tree_for_each_node(const void *fdt, int node,
> +                              device_tree_node_func func,
> +                              void *data);
> +
>   typedef enum {
>       BOOTMOD_XEN,
>       BOOTMOD_FDT,
> @@ -261,4 +348,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
>       return banks;
>   }
>   
> +/*
> + * Interpret the property `prop_name` of `node` as a u32.
> + *
> + * Returns the property value on success; otherwise returns `dflt`.
> + */
> +u32 device_tree_get_u32(const void *fdt, int node,
> +                        const char *prop_name, u32 dflt);
> +
> +/*
> + * Interpret the property `prop_name` of `node` as a "reg".
> + *
> + * Returns outputs in `start` and `size`.
> + */
> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> +
>   #endif /* XEN_BOOTFDT_H */
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index a7cc092d05..8a39a60c54 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -22,8 +22,6 @@
>   #include <xen/list.h>
>   #include <xen/rwlock.h>
>   
> -#define DEVICE_TREE_MAX_DEPTH 16
> -
>   /*
>    * Struct used for matching a device
>    */
> @@ -164,17 +162,8 @@ struct dt_raw_irq {
>       u32 specifier[DT_MAX_IRQ_SPEC];
>   };
>   
> -typedef int (*device_tree_node_func)(const void *fdt,
> -                                     int node, const char *name, int depth,
> -                                     u32 address_cells, u32 size_cells,
> -                                     void *data);
> -
>   extern const void *device_tree_flattened;
>   
> -int device_tree_for_each_node(const void *fdt, int node,
> -                              device_tree_node_func func,
> -                              void *data);
> -
>   /**
>    * dt_unflatten_host_device_tree - Unflatten the host device tree
>    *
> @@ -245,10 +234,6 @@ void intc_dt_preinit(void);
>   #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
>   #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
>   
> -/* Default #address and #size cells */
> -#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> -#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> -
>   #define dt_for_each_property_node(dn, pp)                   \
>       for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
>   
> @@ -258,55 +243,6 @@ void intc_dt_preinit(void);
>   #define dt_for_each_child_node(dt, dn)                      \
>       for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
>   
> -/* Helper to read a big number; size is in cells (not bytes) */
> -static inline u64 dt_read_number(const __be32 *cell, int size)
> -{
> -    u64 r = be32_to_cpu(*cell);
> -
> -    switch ( size )
> -    {
> -    case 1:
> -        break;
> -    case 2:
> -        r = (r << 32) | be32_to_cpu(cell[1]);
> -        break;
> -    default:
> -        /* Nonsensical size. default to 1 */
> -        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
> -        ASSERT_UNREACHABLE();
> -        break;
> -    };
> -
> -    return r;
> -}
> -
> -/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
> -static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
> -{
> -    uint64_t dt_r;
> -    paddr_t r;
> -
> -    /*
> -     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
> -     * Thus, there is an implicit cast from uint64_t to paddr_t.
> -     */
> -    dt_r = dt_read_number(cell, size);
> -
> -    if ( dt_r != (paddr_t)dt_r )
> -    {
> -        printk("Physical address greater than max width supported\n");
> -        WARN();
> -    }
> -
> -    /*
> -     * Xen will truncate the address/size if it is greater than the maximum
> -     * supported width and it will give an appropriate warning.
> -     */
> -    r = dt_r;
> -
> -    return r;
> -}
> -
>   /* Helper to convert a number of cells to bytes */
>   static inline int dt_cells_to_size(int size)
>   {
> @@ -319,14 +255,6 @@ static inline int dt_size_to_cells(int bytes)
>       return (bytes / sizeof(u32));
>   }
>   
> -static inline u64 dt_next_cell(int s, const __be32 **cellp)
> -{
> -    const __be32 *p = *cellp;
> -
> -    *cellp = p + s;
> -    return dt_read_number(p, s);
> -}
> -
>   static inline const char *dt_node_full_name(const struct dt_device_node *np)
>   {
>       return (np && np->full_name) ? np->full_name : "<no-node>";
> @@ -984,12 +912,6 @@ int dt_map_id(const struct dt_device_node *np, uint32_t id,
>   
>   struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>   
> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> -                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> -
> -u32 device_tree_get_u32(const void *fdt, int node,
> -                        const char *prop_name, u32 dflt);
> -
>   #ifdef CONFIG_DEVICE_TREE_DEBUG
>   #define dt_dprintk(fmt, args...)  \
>       printk(XENLOG_DEBUG fmt, ## args)
--------------Cp6RiKO02KwMqvMTI0nRhlOn
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
    <div class="moz-cite-prefix">On 7/15/25 6:10 PM, Alejandro Vallejo
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250715161108.141126-5-alejandro.garciavallejo@amd.com">
      <pre wrap="" class="moz-quote-pre">Part of an unpicking process to extract bootfdt contents independent of bootinfo
to a separate file for x86 to take.

Move functions required for early FDT parsing from device_tree.h and arm's
setup.h onto bootfdt.h

Declaration motion only. Not a functional change.

Signed-off-by: Alejandro Vallejo <a class="moz-txt-link-rfc2396E" href="mailto:alejandro.garciavallejo@amd.com">&lt;alejandro.garciavallejo@amd.com&gt;</a>
Reviewed-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a></pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a> # riscv

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:20250715161108.141126-5-alejandro.garciavallejo@amd.com">
      <pre wrap="" class="moz-quote-pre">
---
v7:
  * v6 was misrebased, and dt_read_number()'s refactor was lost. v7 ensures
    it's preserved in the code motion
---
 xen/arch/riscv/cpufeature.c            |   1 +
 xen/arch/riscv/smpboot.c               |   1 +
 xen/common/device-tree/bootfdt.c       |  12 ---
 xen/common/device-tree/device-tree.c   |   1 +
 xen/common/device-tree/static-evtchn.c |   1 +
 xen/common/sched/boot-cpupool.c        |   1 +
 xen/include/xen/bootfdt.h              | 103 +++++++++++++++++++++++++
 xen/include/xen/device_tree.h          |  78 -------------------
 8 files changed, 108 insertions(+), 90 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index b7d5ec6580..b846a106a3 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -8,6 +8,7 @@
  */
 
 #include &lt;xen/bitmap.h&gt;
+#include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/ctype.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/errno.h&gt;
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
index 470f6d1311..3b8bf98e20 100644
--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -1,3 +1,4 @@
+#include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/cpumask.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/errno.h&gt;
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 08d919aba6..67fe5c3cc3 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -215,18 +215,6 @@ u32 __init device_tree_get_u32(const void *fdt, int node,
     return fdt32_to_cpu(get_unaligned_t(uint32_t, prop-&gt;data));
 }
 
-/**
- * device_tree_for_each_node - iterate over all device tree sub-nodes
- * @fdt: flat device tree.
- * @node: parent node to start the search from
- * @func: function to call for each sub-node.
- * @data: data to pass to @func.
- *
- * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
- *
- * Returns 0 if all nodes were iterated over successfully.  If @func
- * returns a value different from 0, that value is returned immediately.
- */
 int __init device_tree_for_each_node(const void *fdt, int node,
                                      device_tree_node_func func,
                                      void *data)
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 7bede20fa6..4ebdb2e52e 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -8,6 +8,7 @@
  */
 
 #include &lt;xen/bitops.h&gt;
+#include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/types.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/guest_access.h&gt;
diff --git a/xen/common/device-tree/static-evtchn.c b/xen/common/device-tree/static-evtchn.c
index 8b82e6b3d8..88342b44a1 100644
--- a/xen/common/device-tree/static-evtchn.c
+++ b/xen/common/device-tree/static-evtchn.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/event.h&gt;
 #include &lt;xen/static-evtchn.h&gt;
 
diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
index 641f3495cb..03be73efdd 100644
--- a/xen/common/sched/boot-cpupool.c
+++ b/xen/common/sched/boot-cpupool.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2022 Arm Ltd.
  */
 
+#include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/acpi.h&gt;
 #include &lt;xen/sched.h&gt;
 
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index ac2a79b59b..a5dfaa5c1d 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -2,8 +2,11 @@
 #ifndef XEN_BOOTFDT_H
 #define XEN_BOOTFDT_H
 
+#include &lt;xen/byteorder.h&gt;
+#include &lt;xen/bug.h&gt;
 #include &lt;xen/types.h&gt;
 #include &lt;xen/kernel.h&gt;
+#include &lt;xen/lib.h&gt;
 #include &lt;xen/macros.h&gt;
 #include &lt;xen/xmalloc.h&gt;
 
@@ -16,8 +19,92 @@
 #define NR_MEM_BANKS 256
 #define NR_SHMEM_BANKS 32
 
+/* Default #address and #size cells */
+#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
+#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
+
 #define MAX_MODULES 32 /* Current maximum useful modules */
 
+#define DEVICE_TREE_MAX_DEPTH 16
+
+/* Helper to read a big number; size is in cells (not bytes) */
+static inline u64 dt_read_number(const __be32 *cell, int size)
+{
+    u64 r = be32_to_cpu(*cell);
+
+    switch ( size )
+    {
+    case 1:
+        break;
+    case 2:
+        r = (r &lt;&lt; 32) | be32_to_cpu(cell[1]);
+        break;
+    default:
+        /* Nonsensical size. default to 1 */
+        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
+        ASSERT_UNREACHABLE();
+        break;
+    };
+
+    return r;
+}
+
+/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
+static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
+{
+    uint64_t dt_r;
+    paddr_t r;
+
+    /*
+     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
+     */
+    dt_r = dt_read_number(cell, size);
+
+    if ( dt_r != (paddr_t)dt_r )
+    {
+        printk("Physical address greater than max width supported\n");
+        WARN();
+    }
+
+    /*
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
+     */
+    r = dt_r;
+
+    return r;
+}
+
+static inline u64 dt_next_cell(int s, const __be32 **cellp)
+{
+    const __be32 *p = *cellp;
+
+    *cellp = p + s;
+    return dt_read_number(p, s);
+}
+
+typedef int (*device_tree_node_func)(const void *fdt,
+                                     int node, const char *name, int depth,
+                                     u32 address_cells, u32 size_cells,
+                                     void *data);
+
+/**
+ * device_tree_for_each_node - iterate over all device tree sub-nodes
+ * @fdt: flat device tree.
+ * @node: parent node to start the search from
+ * @func: function to call for each sub-node.
+ * @data: data to pass to @func.
+ *
+ * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
+ *
+ * Returns 0 if all nodes were iterated over successfully.  If @func
+ * returns a value different from 0, that value is returned immediately.
+ */
+int device_tree_for_each_node(const void *fdt, int node,
+                              device_tree_node_func func,
+                              void *data);
+
 typedef enum {
     BOOTMOD_XEN,
     BOOTMOD_FDT,
@@ -261,4 +348,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
     return banks;
 }
 
+/*
+ * Interpret the property `prop_name` of `node` as a u32.
+ *
+ * Returns the property value on success; otherwise returns `dflt`.
+ */
+u32 device_tree_get_u32(const void *fdt, int node,
+                        const char *prop_name, u32 dflt);
+
+/*
+ * Interpret the property `prop_name` of `node` as a "reg".
+ *
+ * Returns outputs in `start` and `size`.
+ */
+void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                         uint32_t size_cells, paddr_t *start, paddr_t *size);
+
 #endif /* XEN_BOOTFDT_H */
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index a7cc092d05..8a39a60c54 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -22,8 +22,6 @@
 #include &lt;xen/list.h&gt;
 #include &lt;xen/rwlock.h&gt;
 
-#define DEVICE_TREE_MAX_DEPTH 16
-
 /*
  * Struct used for matching a device
  */
@@ -164,17 +162,8 @@ struct dt_raw_irq {
     u32 specifier[DT_MAX_IRQ_SPEC];
 };
 
-typedef int (*device_tree_node_func)(const void *fdt,
-                                     int node, const char *name, int depth,
-                                     u32 address_cells, u32 size_cells,
-                                     void *data);
-
 extern const void *device_tree_flattened;
 
-int device_tree_for_each_node(const void *fdt, int node,
-                              device_tree_node_func func,
-                              void *data);
-
 /**
  * dt_unflatten_host_device_tree - Unflatten the host device tree
  *
@@ -245,10 +234,6 @@ void intc_dt_preinit(void);
 #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
 #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
 
-/* Default #address and #size cells */
-#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
-#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
-
 #define dt_for_each_property_node(dn, pp)                   \
     for ( pp = (dn)-&gt;properties; (pp) != NULL; pp = (pp)-&gt;next )
 
@@ -258,55 +243,6 @@ void intc_dt_preinit(void);
 #define dt_for_each_child_node(dt, dn)                      \
     for ( dn = (dt)-&gt;child; (dn) != NULL; dn = (dn)-&gt;sibling )
 
-/* Helper to read a big number; size is in cells (not bytes) */
-static inline u64 dt_read_number(const __be32 *cell, int size)
-{
-    u64 r = be32_to_cpu(*cell);
-
-    switch ( size )
-    {
-    case 1:
-        break;
-    case 2:
-        r = (r &lt;&lt; 32) | be32_to_cpu(cell[1]);
-        break;
-    default:
-        /* Nonsensical size. default to 1 */
-        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
-        ASSERT_UNREACHABLE();
-        break;
-    };
-
-    return r;
-}
-
-/* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
-static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
-{
-    uint64_t dt_r;
-    paddr_t r;
-
-    /*
-     * dt_read_number will return uint64_t whereas paddr_t may not be 64-bit.
-     * Thus, there is an implicit cast from uint64_t to paddr_t.
-     */
-    dt_r = dt_read_number(cell, size);
-
-    if ( dt_r != (paddr_t)dt_r )
-    {
-        printk("Physical address greater than max width supported\n");
-        WARN();
-    }
-
-    /*
-     * Xen will truncate the address/size if it is greater than the maximum
-     * supported width and it will give an appropriate warning.
-     */
-    r = dt_r;
-
-    return r;
-}
-
 /* Helper to convert a number of cells to bytes */
 static inline int dt_cells_to_size(int size)
 {
@@ -319,14 +255,6 @@ static inline int dt_size_to_cells(int bytes)
     return (bytes / sizeof(u32));
 }
 
-static inline u64 dt_next_cell(int s, const __be32 **cellp)
-{
-    const __be32 *p = *cellp;
-
-    *cellp = p + s;
-    return dt_read_number(p, s);
-}
-
 static inline const char *dt_node_full_name(const struct dt_device_node *np)
 {
     return (np &amp;&amp; np-&gt;full_name) ? np-&gt;full_name : "&lt;no-node&gt;";
@@ -984,12 +912,6 @@ int dt_map_id(const struct dt_device_node *np, uint32_t id,
 
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
 
-void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                         uint32_t size_cells, paddr_t *start, paddr_t *size);
-
-u32 device_tree_get_u32(const void *fdt, int node,
-                        const char *prop_name, u32 dflt);
-
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
</pre>
    </blockquote>
  </body>
</html>

--------------Cp6RiKO02KwMqvMTI0nRhlOn--

