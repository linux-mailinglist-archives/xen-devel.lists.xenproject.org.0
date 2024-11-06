Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BE9BE6C2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830845.1245932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8enO-0006hR-06; Wed, 06 Nov 2024 12:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830845.1245932; Wed, 06 Nov 2024 12:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8enN-0006ff-TW; Wed, 06 Nov 2024 12:05:57 +0000
Received: by outflank-mailman (input) for mailman id 830845;
 Wed, 06 Nov 2024 12:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bDCL=SB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8enL-0006fS-Tw
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:05:56 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7795129b-9c37-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:05:52 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7b14554468fso475115285a.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:05:52 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b2f39fadcbsm624619385a.39.2024.11.06.04.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 04:05:50 -0800 (PST)
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
X-Inumbo-ID: 7795129b-9c37-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjo3MzUiLCJoZWxvIjoibWFpbC1xazEteDczNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc3OTUxMjliLTljMzctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk0NzUyLjI1MzI2Miwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730894751; x=1731499551; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShCiVDp4xDH6xbz/t3F6iZ/jlXLHnluVEd8482zdrhM=;
        b=EYin+zFYcMcD49eaVWSteZ/E/wEQym2wx94CuIosmSlqm2G6Oa1ZH+PJcFju8YkFT+
         oWzfnjtNV+zl7TtW4v7gRxQB1jEamBhIR9qA50j/xJc+4Q1BVDqQSgwqG3fRyPGb2aTM
         TzMJPlQeS+A/izn2h55OVhmSVW40cIIDyYsyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894751; x=1731499551;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ShCiVDp4xDH6xbz/t3F6iZ/jlXLHnluVEd8482zdrhM=;
        b=mnzX5Af9YvHFnv7X6+GXF2Z9m5HK8XEe6ZT5hkM4HqQTZcZhMnh6/MXLgIM4UvMF98
         okmg/wPalX0SMo7TrLhYlSi6SO7fQTh80q4YNgTYwaJYKZBUfP4Cw/qakfLXkrE6sZzD
         hfat3mpZALAeAYbgw9WsTqOYTbkOtoojCW38TgNFwoZssxKgwG810jidXyCH2nHiolR+
         3ixL/vNyILMehsuHN0hR/sa9C/SIsgz/tV+fo3N/ZYOh7xvbVEZcSX/82er6/zah83Kb
         ODY+5YIKcrTUQShHGdH8fPQMJRJ7F/1y2dN9GosVWdhCiMCDDz5LAJKRe4i1k9T7mxSs
         +PTA==
X-Forwarded-Encrypted: i=1; AJvYcCUUiI+nuZagQVvgACrSIsw+T+eRgFddHrUy26e5QAs35pT9hkq/zuTh9J8JMacD+CbQi3Ef57WhQr0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0Ou04tHQOXfse9vZhvSMoMCthKWp4BkbhB7TIgf5/jpFlCPzE
	uy29fxnTFhFwfB1X4fNfHbDRZphKOXwk0XF2JBk7gswHdBUEGbFDGu/qPE7cPLM=
X-Google-Smtp-Source: AGHT+IGc7Elr6D4+p67Zk8gdtlzP0LjF7lzb/Vl2uvH5BVeICMlKekwgrfve001kAMuIdhvKyNEqYQ==
X-Received: by 2002:a05:620a:2944:b0:7af:cdd7:d6e5 with SMTP id af79cd13be357-7b193ed6f4dmr4890649485a.5.1730894750856;
        Wed, 06 Nov 2024 04:05:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 12:05:48 +0000
Message-Id: <D5F2ZA4NEECE.553IV6IZ4G4V@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [XEN RFC PATCH v4 5/5] xen/public: Introduce PV-IOMMU hypercall
 interface
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <cover.1730718102.git.teddy.astie@vates.tech>
 <78b44f9f800b8f786835ecebdaf2d6ce7366f3da.1730718102.git.teddy.astie@vates.tech>
In-Reply-To: <78b44f9f800b8f786835ecebdaf2d6ce7366f3da.1730718102.git.teddy.astie@vates.tech>

Hi,

A bunch of mostly ABI-related minor comments. Mostly about adding implicit
padding. Still reading through the logic, but this should be helpful as is =
so
I'm sending it early.

On Mon Nov 4, 2024 at 2:28 PM GMT, Teddy Astie wrote:
> Introduce a new pv interface to manage the underlying IOMMU and manage co=
ntexts
> and devices. This interface allows creation of new contexts from Dom0 and
> addition of IOMMU mappings using guest PoV.
>
> This interface doesn't allow creation of mapping to other domains.
>
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> ---
> Changed in V2:
> * formatting
>
> Changed in V3:
> * prevent IOMMU operations on dying contexts
>
> Changed in V4:
> * redesigned hypercall interface [1]
> * added remote_cmd and init logic
>
> [1] https://lore.kernel.org/all/fdfa32c9-c177-4d05-891a-138f9b663f19@vate=
s.tech/
> ---
>  xen/common/Makefile           |   1 +
>  xen/common/pv-iommu.c         | 539 ++++++++++++++++++++++++++++++++++
>  xen/include/hypercall-defs.c  |   6 +
>  xen/include/public/pv-iommu.h | 341 +++++++++++++++++++++
>  xen/include/public/xen.h      |   1 +
>  5 files changed, 888 insertions(+)
>  create mode 100644 xen/common/pv-iommu.c
>  create mode 100644 xen/include/public/pv-iommu.h
>

[snip]

> diff --git a/xen/include/public/pv-iommu.h b/xen/include/public/pv-iommu.=
h
> new file mode 100644
> index 0000000000..c14b8435c9
> --- /dev/null
> +++ b/xen/include/public/pv-iommu.h
> @@ -0,0 +1,341 @@
> +/* SPDX-License-Identifier: MIT */
> +/**
> + * pv-iommu.h
> + *
> + * Paravirtualized IOMMU driver interface.
> + *
> + * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
> + */
> +
> +#ifndef __XEN_PUBLIC_PV_IOMMU_H__
> +#define __XEN_PUBLIC_PV_IOMMU_H__
> +
> +#include "xen.h"
> +#include "physdev.h"
> +
> +#ifndef uint64_aligned_t
> +#define uint64_aligned_t uint64_t
> +#endif

Why did you need this? This header ought to depend on whatever implements
uint64_aligned_t, which is most definitely not a simple uint64_t on 32bit
machines.

> +
> +#define IOMMU_DEFAULT_CONTEXT (0)
> +
> +enum {

nit: If you give the enum a fully qualified name (e.g: iommucmd), then you =
can
add a comment on the field in the struct saying "See iommucmd" and folks wi=
ll
be able to follow the tag back here via cscope/ctags/global/whatever.

> +    /* Basic cmd */
> +    IOMMU_noop =3D 0,
> +    IOMMU_query_capabilities,

nit: I think we want "=3D N" for every cmd. Otherwise it's very annoying to=
 find
out which variant has which number as the number of variants increases. Als=
o
makes it (a bit) more annoying to deprecate numbers.

> +    IOMMU_init,
> +    IOMMU_alloc_context,
> +    IOMMU_free_context,
> +    IOMMU_reattach_device,
> +    IOMMU_map_pages,
> +    IOMMU_unmap_pages,
> +    IOMMU_remote_cmd,
> +
> +    /* Extended cmd */
> +    IOMMU_alloc_nested,     /* if IOMMUCAP_nested */
> +    IOMMU_flush_nested,     /* if IOMMUCAP_nested */
> +    IOMMU_attach_pasid,     /* if IOMMUCAP_pasid */
> +    IOMMU_detach_pasid,     /* if IOMMUCAP_pasid */
> +};
> +
> +/**
> + * Indicate if the default context is a identity mapping to domain memor=
y.
> + * If not defined, default context blocks all DMA to domain memory.
> + */

nit: s/is a/is an/. Though seeing how it's a bit in a bitmap it might make =
more
sense to rephrase it as "if set: X; if cleared: Y". The bit is always defin=
ed,
it's its state that signals a boolean property.

> +#define IOMMUCAP_default_identity  (1 << 0)

This one, and all others want a U suffix (i.e: 1U << 0). Otherwise things l=
ike
1 << 31 (if we ever get to that) will misbehave.

> +
> +/**
> + * IOMMU_MAP_cache support.
> + */
> +#define IOMMUCAP_cache     (1 << 1)
> +
> +/**
> + * Support for IOMMU_alloc_nested.
> + */
> +#define IOMMUCAP_nested    (1 << 2)
> +
> +/**
> + * Support for IOMMU_attach_pasid and IOMMU_detach_pasid and pasid param=
eter in
> + * reattach_context.
> + */
> +#define IOMMUCAP_pasid     (1 << 3)
> +
> +/**
> + * Support for IOMMU_ALLOC_identity
> + */
> +#define IOMMUCAP_identity (1 << 4)
> +
> +/**
> + * IOMMU_query_capabilities
> + * Query PV-IOMMU capabilities for this domain.
> + */
> +struct pv_iommu_capabilities {
> +    /*
> +     * OUT: Maximum device address (iova) that the guest can use for map=
pings.
> +     */
> +    uint64_aligned_t max_iova_addr;
> +
> +    /* OUT: IOMMU capabilities flags */
> +    uint32_t cap_flags;
> +
> +    /* OUT: Mask of all supported page sizes. */
> +    uint32_t pgsize_mask;
> +
> +    /* OUT: Maximum pasid (if IOMMUCAP_pasid) */
> +    uint32_t max_pasid;
> +
> +    /* OUT: Maximum number of IOMMU context this domain can use. */
> +    uint16_t max_ctx_no;

Missing u16 padding at the tail

> +};
> +typedef struct pv_iommu_capabilities pv_iommu_capabilities_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_capabilities_t);
> +
> +/**
> + * IOMMU_init
> + * Initialize PV-IOMMU for this domain.
> + *
> + * Fails with -EACCESS if PV-IOMMU is already initialized.
> + */
> +struct pv_iommu_init {
> +    /* IN: Maximum number of IOMMU context this domain can use. */
> +    uint32_t max_ctx_no;
> +
> +    /* IN: Arena size in pages (in power of two) */
> +    uint32_t arena_order;
> +};
> +typedef struct pv_iommu_init pv_iommu_init_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_init_t);
> +
> +/**
> + * Create a 1:1 identity mapped context to domain memory
> + * (needs IOMMUCAP_identity).
> + */
> +#define IOMMU_ALLOC_identity (1 << 0)

Same consideration as above. Wants to be 1U.

> +
> +/**
> + * IOMMU_alloc_context
> + * Allocate an IOMMU context.
> + * Fails with -ENOSPC if no context number is available.
> + */
> +struct pv_iommu_alloc {
> +    /* OUT: allocated IOMMU context number */
> +    uint16_t ctx_no;

Missing u16 padding

> +
> +    /* IN: allocation flags */
> +    uint32_t alloc_flags;
> +};
> +typedef struct pv_iommu_alloc pv_iommu_alloc_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_t);
> +
> +/**
> + * Move all devices to default context before freeing the context.
> + */
> +#define IOMMU_FREE_reattach_default (1 << 0)
> +
> +/**
> + * IOMMU_free_context
> + * Destroy a IOMMU context.
> + *
> + * If IOMMU_FREE_reattach_default is specified, move all context devices=
 to
> + * default context before destroying this context.
> + *
> + * If there are devices in the context and IOMMU_FREE_reattach_default i=
s not
> + * specified, fail with -EBUSY.
> + *
> + * The default context can't be destroyed.
> + */
> +struct pv_iommu_free {
> +    /* IN: IOMMU context number to free */
> +    uint16_t ctx_no;

missing u16 padding

> +
> +    /* IN: Free operation specific flags */
> +    uint32_t free_flags;
> +};
> +typedef struct pv_iommu_free pv_iommu_free_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_free_t);
> +
> +/* Device has read access */
> +#define IOMMU_MAP_readable (1 << 0)
> +
> +/* Device has write access */
> +#define IOMMU_MAP_writeable (1 << 1)
> +
> +/* Enforce DMA coherency */
> +#define IOMMU_MAP_cache (1 << 2)
> +
> +/**
> + * IOMMU_map_pages
> + * Map pages on a IOMMU context.
> + *
> + * pgsize must be supported by pgsize_mask.
> + * Fails with -EINVAL if mapping on top of another mapping.
> + * Report actually mapped page count in mapped field (regardless of fail=
ure).
> + */
> +struct pv_iommu_map_pages {
> +    /* IN: IOMMU context number */
> +    uint16_t ctx_no;

missing 6 octets worth of padding.

> +
> +    /* IN: Guest frame number */
> +    uint64_aligned_t gfn;
> +
> +    /* IN: Device frame number */
> +    uint64_aligned_t dfn;
> +
> +    /* IN: Map flags */
> +    uint32_t map_flags;
> +
> +    /* IN: Size of pages to map */
> +    uint32_t pgsize;
> +
> +    /* IN: Number of pages to map */
> +    uint32_t nr_pages;
> +
> +    /* OUT: Number of pages actually mapped */
> +    uint32_t mapped;
> +};
> +typedef struct pv_iommu_map_pages pv_iommu_map_pages_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_map_pages_t);
> +
> +/**
> + * IOMMU_unmap_pages
> + * Unmap pages on a IOMMU context.
> + *
> + * pgsize must be supported by pgsize_mask.
> + * Report actually unmapped page count in mapped field (regardless of fa=
ilure).
> + * Fails with -ENOENT when attempting to unmap a page without any mappin=
g
> + */
> +struct pv_iommu_unmap_pages {
> +    /* IN: IOMMU context number */
> +    uint16_t ctx_no;

missing 6 octets worth of padding. There's little reason for it to be the f=
irst
member though, afaics. Which means it could move to the end and use part of=
 the
existing padding there instead...

> +
> +    /* IN: Device frame number */
> +    uint64_aligned_t dfn;
> +
> +    /* IN: Size of pages to unmap */
> +    uint32_t pgsize;
> +
> +    /* IN: Number of pages to unmap */
> +    uint32_t nr_pages;
> +
> +    /* OUT: Number of pages actually unmapped */
> +    uint32_t unmapped;

... (which is a u32). We'd go from 10 octets worth of padding to a single u=
16.

> +};
> +typedef struct pv_iommu_unmap_pages pv_iommu_unmap_pages_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_unmap_pages_t);
> +
> +/**
> + * IOMMU_reattach_device
> + * Reattach a device to another IOMMU context.
> + * Fails with -ENODEV if no such device exist.
> + */
> +struct pv_iommu_reattach_device {
> +    /* IN: Target IOMMU context number */
> +    uint16_t ctx_no;
> +
> +    /* IN: Physical device to move */
> +    struct physdev_pci_device dev;

Missing u16 padding , I think?

> +
> +    /* IN: PASID of the device (if IOMMUCAP_pasid) */
> +    uint32_t pasid;
> +};
> +typedef struct pv_iommu_reattach_device pv_iommu_reattach_device_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_reattach_device_t);
> +
> +
> +/**
> + * IOMMU_remote_cmd
> + * Do a PV-IOMMU operation on another domain.
> + * Current domain needs to be allowed to act on the target domain, other=
wise
> + * fails with -EPERM.
> + */
> +struct pv_iommu_remote_cmd {
> +    /* IN: Target domain to do the subop on */
> +    uint16_t domid;
> +
> +    /* IN: Command to do on target domain. */
> +    uint16_t subop;

missing u32 padding.

> +
> +    /* INOUT: Command argument from current domain memory */
> +    XEN_GUEST_HANDLE(void) arg;
> +};
> +typedef struct pv_iommu_remote_cmd pv_iommu_remote_cmd_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_remote_cmd_t);
> +
> +/**
> + * IOMMU_alloc_nested
> + * Create a nested IOMMU context (needs IOMMUCAP_nested).
> + *
> + * This context uses a platform-specific page table from domain address =
space
> + * specified in pgtable_gfn and use it for nested translations.
> + *
> + * Explicit flushes needs to be submited with IOMMU_flush_nested on
> + * modification of the nested pagetable to ensure coherency between IOTL=
B and
> + * nested page table.
> + *
> + * This context can be destroyed using IOMMU_free_context.
> + * This context cannot be modified using map_pages, unmap_pages.
> + */
> +struct pv_iommu_alloc_nested {
> +    /* OUT: allocated IOMMU context number */
> +    uint16_t ctx_no;

missing 6 octets worth of padding.

nit: For this one and others, might be more helpful to have it at the tail =
to
allow more flexibility in how to use that padding in the future.

> +
> +    /* IN: guest frame number of the nested page table */
> +    uint64_aligned_t pgtable_gfn;
> +
> +    /* IN: nested mode flags */
> +    uint64_aligned_t nested_flags;
> +};
> +typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> +
> +/**
> + * IOMMU_flush_nested (needs IOMMUCAP_nested)
> + * Flush the IOTLB for nested translation.
> + */
> +struct pv_iommu_flush_nested {
> +    /* TODO */
> +};
> +typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);
> +
> +/**
> + * IOMMU_attach_pasid (needs IOMMUCAP_pasid)
> + * Attach a new device-with-pasid to a IOMMU context.
> + * If a matching device-with-pasid already exists (globally),
> + * fail with -EEXIST.
> + * If pasid is 0, fails with -EINVAL.
> + * If physical device doesn't exist in domain, fail with -ENOENT.
> + */
> +struct pv_iommu_attach_pasid {
> +    /* IN: IOMMU context to add the device-with-pasid in */
> +    uint16_t ctx_no;
> +
> +    /* IN: Physical device */
> +    struct physdev_pci_device dev;

This subfield is non-obviously 16bit aligned (and we can't change it becaus=
e
it's already part of the ABI). This means (I think), there's a missing u16
padding here.

> +
> +    /* IN: pasid of the device to attach */
> +    uint32_t pasid;
> +};
> +typedef struct pv_iommu_attach_pasid pv_iommu_attach_pasid_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_attach_pasid_t);
> +
> +/**
> + * IOMMU_detach_pasid (needs IOMMUCAP_pasid)
> + * detach a device-with-pasid.
> + * If the device-with-pasid doesn't exist or belong to the domain,
> + * fail with -ENOENT.
> + * If pasid is 0, fails with -EINVAL.
> + */
> +struct pv_iommu_detach_pasid {
> +    /* IN: Physical device */
> +    struct physdev_pci_device dev;
> +
> +    /* pasid of the device to detach */
> +    uint32_t pasid;
> +};
> +typedef struct pv_iommu_detach_pasid pv_iommu_detach_pasid_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_detach_pasid_t);
> +
> +/* long do_iommu_op(int subop, XEN_GUEST_HANDLE_PARAM(void) arg) */
> +
> +#endif
> \ No newline at end of file
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index b47d48d0e2..28ab815ebc 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -118,6 +118,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>  #define __HYPERVISOR_xenpmu_op            40
>  #define __HYPERVISOR_dm_op                41
>  #define __HYPERVISOR_hypfs_op             42
> +#define __HYPERVISOR_iommu_op             43
> =20
>  /* Architecture-specific hypercall definitions. */
>  #define __HYPERVISOR_arch_0               48


