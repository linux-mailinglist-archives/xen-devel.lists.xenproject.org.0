Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1399ECAD0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854547.1267726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKTe-0000UU-NE; Wed, 11 Dec 2024 11:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854547.1267726; Wed, 11 Dec 2024 11:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKTe-0000SK-K4; Wed, 11 Dec 2024 11:01:58 +0000
Received: by outflank-mailman (input) for mailman id 854547;
 Wed, 11 Dec 2024 11:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLKTd-0000SE-5m
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:01:57 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55b592e0-b7af-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 12:01:55 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso566422166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 03:01:55 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa684773405sm471516466b.46.2024.12.11.03.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 03:01:54 -0800 (PST)
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
X-Inumbo-ID: 55b592e0-b7af-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733914915; x=1734519715; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qkoaac2Af3nuHnWQBsYSkjmez2OYYRG9z9cf1RbQfYU=;
        b=FCAWK6qv9YyLmKgi3e6rSiYGCsUWSJXaBTItCLPcfrexMP13ETk4hkscwTWQjCUg2e
         frfL5Xd9zrTpu7m4WVcqZ7mJ0VGgYrZDfHHMI++QPXI7owIe781DlVHjX3yWjexJ2GbS
         gdVAQStfYLaJ0wJxYUVpXZnjZD1Y8TdQDLhUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733914915; x=1734519715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qkoaac2Af3nuHnWQBsYSkjmez2OYYRG9z9cf1RbQfYU=;
        b=mC3SI+q7qINlWatKDtHYtcu14tRxso96WkTMO6noTRmi0N9PqeyqQkTg8WTr2VZy8q
         d6IqvnMkfgpoYLHLZDb85txHO6gi+yYR+emnU+DvRBKrjGFP6NsotUpwSIMLu/JSNk5e
         vQjTa5XTGbaC5ZHu88/nQK5sv5jePH9R6ovDTqOCbVm2b7bxeQGXfrWhg9tkWXRNbSdw
         gyXKDk73VKDP0qIMeXDCJn5AqBdqw9M576T3G32j6TZZNBdVkkT1BeUm6H6SlTR0WocN
         uzvMRHveUhz9yCU2HdHxdqGullI+5uHaMStPYIp8X31Bro5v1XugQjqLhOFCAf64IdDk
         ni7w==
X-Gm-Message-State: AOJu0YzSMUorXU+d6BRe+FE9WhHIq3c4Mrz7nQSd0glq8jVCg6NLYwjB
	ZPjUlXMTQFpGlki3raMNaK8h+rUgtzChAsUErj40NnlCwNoarFTzz9P7INcBAMI=
X-Gm-Gg: ASbGncukwBiY1bmAuKpi8kIeZodTAaeb+HORothPq2oyEYgNDWpdBeFE80UMkAjt8X3
	nttJXezz51xWorRi6XhlbG1UmzbSczRVX4MQV6W11XJ2/iC5drfKep2pMrJ/3N4QvGabtR5VcYa
	MQ2/CjsO4wJS1wMDSAT2gVaLY/W46wxKFANoUZ3jJInAV2AReiXnqPjhJ9AALsrKeMcDtx8MPbk
	KLk6LuaQ7A7Y3NVGL4yih9/xgvvPihJNVhsFMtniBKZsF4KHTaqMQd3ckvWrB0=
X-Google-Smtp-Source: AGHT+IHSfY9vvcBNZmgjC6Nnb02wOpLHre4CMeomt91OB9ohhRrMa1s5mm9Seo80LzOwfB+EScccGQ==
X-Received: by 2002:a17:906:23f2:b0:a9a:161:8da4 with SMTP id a640c23a62f3a-aa6b13e0eecmr227033166b.55.1733914915248;
        Wed, 11 Dec 2024 03:01:55 -0800 (PST)
Date: Wed, 11 Dec 2024 12:01:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/35] xen: introduce resource.h
Message-ID: <Z1lxIlvZs449Pq5-@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-1-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-1-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:31PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move resource definitions to a new architecture-agnostic shared header file.
> 
> It will be used in follow on NS8250 emulator code to describe legacy
> PC COM resources.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/common/device-tree/device-tree.c | 21 +------------------
>  xen/drivers/passthrough/arm/smmu.c   | 15 +-------------
>  xen/include/xen/resource.h           | 40 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index d0528c5825651f7cc9ebca0c949229c9083063c6..e8f810b2fe10890c033ed3a9d4ca627010ad019b 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -24,6 +24,7 @@
>  #include <xen/ctype.h>
>  #include <asm/setup.h>
>  #include <xen/err.h>
> +#include <xen/resource.h>
>  
>  const void *device_tree_flattened;
>  dt_irq_xlate_func dt_irq_xlate;
> @@ -535,26 +536,6 @@ int dt_child_n_size_cells(const struct dt_device_node *parent)
>      return __dt_n_size_cells(parent, true);
>  }
>  
> -/*
> - * These are defined in Linux where much of this code comes from, but
> - * are currently unused outside this file in the context of Xen.
> - */
> -#define IORESOURCE_BITS         0x000000ff      /* Bus-specific bits */
> -
> -#define IORESOURCE_TYPE_BITS    0x00001f00      /* Resource type */
> -#define IORESOURCE_IO           0x00000100      /* PCI/ISA I/O ports */
> -#define IORESOURCE_MEM          0x00000200
> -#define IORESOURCE_REG          0x00000300      /* Register offsets */
> -#define IORESOURCE_IRQ          0x00000400
> -#define IORESOURCE_DMA          0x00000800
> -#define IORESOURCE_BUS          0x00001000
> -
> -#define IORESOURCE_PREFETCH     0x00002000      /* No side effects */
> -#define IORESOURCE_READONLY     0x00004000
> -#define IORESOURCE_CACHEABLE    0x00008000
> -#define IORESOURCE_RANGELENGTH  0x00010000
> -#define IORESOURCE_SHADOWABLE   0x00020000
> -
>  /*
>   * Default translator (generic bus)
>   */
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 03d22bce1e497e41834c273f9048b98dcbd48a54..aa6a968b574dce7cc753e8070fad3a6e585cd9e7 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -50,6 +50,7 @@
>  #include <xen/rbtree.h>
>  #include <xen/sched.h>
>  #include <xen/sizes.h>
> +#include <xen/resource.h>
>  #include <asm/atomic.h>
>  #include <asm/device.h>
>  #include <asm/io.h>
> @@ -70,22 +71,8 @@
>  #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
>  #define of_property_read_bool dt_property_read_bool
>  #define of_parse_phandle_with_args dt_parse_phandle_with_args
> -
> -/* Xen: Helpers to get device MMIO and IRQs */
> -struct resource
> -{
> -	paddr_t addr;
> -	paddr_t size;
> -	unsigned int type;
> -};
> -
> -#define resource_size(res) (res)->size;
> -
>  #define platform_device dt_device_node
>  
> -#define IORESOURCE_MEM 0
> -#define IORESOURCE_IRQ 1
> -
>  static struct resource *platform_get_resource(struct platform_device *pdev,
>  					      unsigned int type,
>  					      unsigned int num)
> diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4962e17da8387b7f324317482b19cc9fe71433fc
> --- /dev/null
> +++ b/xen/include/xen/resource.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * System resource description.
> + *
> + * Reference:
> + *   include/linux/ioport.h
> + */
> +#if !defined(XEN__RESOURCE_H)
> +#define XEN__RESOURCE_H
> +
> +#define IORESOURCE_BITS         0x000000FFU      /* Bus-specific bits */
> +
> +#define IORESOURCE_TYPE_BITS    0x00001F00U      /* Resource type */
> +#define IORESOURCE_IO           0x00000100U      /* PCI/ISA I/O ports */
> +#define IORESOURCE_MEM          0x00000200U
> +#define IORESOURCE_REG          0x00000300U      /* Register offsets */
> +#define IORESOURCE_IRQ          0x00000400U
> +#define IORESOURCE_DMA          0x00000800U
> +#define IORESOURCE_BUS          0x00001000U
> +
> +#define IORESOURCE_PREFETCH     0x00002000U      /* No side effects */
> +#define IORESOURCE_READONLY     0x00004000U
> +#define IORESOURCE_CACHEABLE    0x00008000U
> +#define IORESOURCE_RANGELENGTH  0x00010000U
> +#define IORESOURCE_SHADOWABLE   0x00020000U
> +
> +#define IORESOURCE_UNKNOWN      (~0U)
> +
> +struct resource {
> +    paddr_t addr;
> +    paddr_t size;
> +    unsigned int type;
> +};
> +
> +#define resource_size(res) (res)->size;
> +
> +#define foreach_resource(res) \

Nit: we usually name those for_each_foo instead of foreach_foo.

> +    for (; res && res->type != IORESOURCE_UNKNOWN; res++)

Missing spaces between parentheses:

for ( ; res && res->type != IORESOURCE_UNKNOWN; res++ )

Note that this macro will modify (advance) the res pointer, which is
maybe unexpected by the caller?

Also, the current logic forces the array of resources to always have a
trailing IORESOURCE_UNKNOWN element in order to break the loop, it
might be better to pass an explicit number of elements to iterate
against if possible?

As Jan said, it would be helpful to have an example usage of the
macro.

Thanks, Roger.

