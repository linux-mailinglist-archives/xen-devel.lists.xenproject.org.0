Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5F93145F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 14:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758855.1168370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTKti-0000sM-Ti; Mon, 15 Jul 2024 12:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758855.1168370; Mon, 15 Jul 2024 12:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTKti-0000qr-Qr; Mon, 15 Jul 2024 12:33:42 +0000
Received: by outflank-mailman (input) for mailman id 758855;
 Mon, 15 Jul 2024 12:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7y3=OP=bounce.vates.tech=bounce-md_30504962.66951720.v1-03bb9302b18643a991dcd9bbd106dc90@srs-se1.protection.inumbo.net>)
 id 1sTKth-0000ql-7S
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 12:33:41 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75986521-42a6-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 14:33:38 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WN1p84dgyzB5p4tc
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 12:33:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 03bb9302b18643a991dcd9bbd106dc90; Mon, 15 Jul 2024 12:33:36 +0000
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
X-Inumbo-ID: 75986521-42a6-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721046816; x=1721307316;
	bh=HSU+eNrOExZikRzL/L6GIb3JxAZDyHnl4sp5SDE2r4I=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Mw62wdGxV7B9xlJd9Zjizt/DBRKPsomtDfzFCi5ayiglWgvgxRp0sj0UdBMBvRF7Y
	 7RBX8pSjHyK1zBvEJFkWLy14TlE4roURZabiTuLIuXyHm83qOn2XUa/G26Y8oFrC+0
	 aakoRKk/yyDsMc70XJxdoJAcG4RwrI0Qz3qlSS7sEwrOu8NVslo6Jyvd3AeAZCRH6s
	 8aJem+GEObydAKi95LQEzfPAjDq94IsxpWk8idE5bbe5IfMN5CbWjNHSPd+Ykks/oF
	 ruVqJNNUDBLh6V7BakTzHyHKJKInJ2oU0F7dzLFmI05ovrT7bK6zFpBG6oqXusluce
	 sUdFgNED0cKtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721046816; x=1721307316; i=teddy.astie@vates.tech;
	bh=HSU+eNrOExZikRzL/L6GIb3JxAZDyHnl4sp5SDE2r4I=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=VAr4e+GHzpd3NS9yxJJh9wMRwG3rUr5LFQ/I0R8ZE/hSlVseWUuQpX24MHp/FnwVU
	 ev4ScqcPE3MWVwrC+3vCdE60KGERgzW0bRSDvleq2XyofsPsJOW0Ot2kJphi1dJ9Q6
	 I4woMiLlVkYGOMbOdw1z8W7iYyemnVrMT7HEu3kUMdDlQdSHvVH2rcg2UiBKw32w9Y
	 zRGvHeyk9xh+q6XzYBukeZ/7aDMx18irZxpMSCbXmwAff4XyJ1rsKF+QLZ4hp3Mwow
	 6WS1+tUxbYRwrJTFPo3Oq9q8e9DsbMw+MD28HXyVxlYCjcmsCYQ1DmaKfBnMGki1+l
	 7dwhhgXF9r9tw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN]=20xen/public:=20PV-IOMMU=20interface=20header=20proposal?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721046815495
Message-Id: <fdfa32c9-c177-4d05-891a-138f9b663f19@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.03bb9302b18643a991dcd9bbd106dc90?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240715:md
Date: Mon, 15 Jul 2024 12:33:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

After some discussions with Alejandro and Jan on the PV-IOMMU design 
patch [1], I've redesigned parts of the interface with some proposals 
and to be more similar to other hypercalls.

In addition to that, I've took a step further and added tentative design 
for some new features (including optional ones) that could be worth to 
consider as well.

[1] : 
https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00641.html

A summary of the changes :
- I replaced the tagged union style with a parameter in the hypercall 
with various structures in a similar fashion than other Xen hypercalls.
- There is no more page limit on map/unmap operation (it can be 
implemented with continuations hypervisor-side).
- Map/Unmap now take a "pgsize" parameter (that needs to be supported)
- There is now a capability "bitmap" (cap_flags) that inform the guest 
of what features are supported.
- Added cache, nested and pasid optional features.
- Add a flag indicating if the "default context" is a identity one, the 
idea is to allow to create domain where device doesn't have access to 
guest memory by default (e.g to implement pre-boot DMA protection). If 
supported and needed, the guest can create a "identity mapped" context.
- Add a way to do operations on other domains [2]

[2] : The idea is to use this feature for VT-d/AMD-Vi emulation with 
physical/passed-through devices, such as QEMU can reflect on IOMMU 
subsystem operations made on emulated-IOMMU. It can also be combined 
with nested to allow hardware assisted IOMMU emulation.

## Pasid feature

The idea behind the PASID implementation is (if supported by IOMMU) to 
allow a single device (identified with BDF) to access multiples address 
spaces using PASID tagged DMA (VT-d specs describe it as 
"Requests-with-PASID"). To do that, we can introduce the concept of 
"device-with-pasid" which is a IOMMU subsystem device unit that we can 
summon and at some point, move to another domain (similarly to PCI 
passthrough but without BAR).
This is a part of introducing support for Scalable IOV and could be 
useful for virtio-gpu as well. That can also be used for adding support 
for Linux SVA.

---

/* SPDX-License-Identifier: MIT */
/**
  * pv-iommu.h
  *
  * Paravirtualized IOMMU driver interface.
  *
  * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
  */

#ifndef __XEN_PUBLIC_PV_IOMMU_H__
#define __XEN_PUBLIC_PV_IOMMU_H__

#include "stdint.h"
#include "xen.h"
#include "physdev.h"

#define IOMMU_DEFAULT_CONTEXT (0)

enum {
     /* Basic cmd */
     IOMMU_noop = 0,
     IOMMU_query_capabilities,
     IOMMU_alloc_context,
     IOMMU_free_context,
     IOMMU_reattach_device,
     IOMMU_map_pages,
     IOMMU_unmap_pages,
     IOMMU_lookup_page,
     IOMMU_remote_cmd,

     /* Extended cmd */
     IOMMU_alloc_nested,     /* if IOMMUCAP_nested */
     IOMMU_flush_nested,     /* if IOMMUCAP_nested */
     IOMMU_attach_pasid,     /* if IOMMUCAP_pasid */
     IOMMU_detach_pasid,     /* if IOMMUCAP_pasid */
};

/**
  * Indicate if the default context is a identity mapping to domain memory.
  * If not defined, default context blocks all DMA to domain memory.
  */
#define IOMMUCAP_default_identity  (1 << 0)

/**
  * IOMMU_MAP_cache support.
  */
#define IOMMUCAP_cache     (1 << 1)

/**
  * Support for IOMMU_alloc_nested.
  */
#define IOMMUCAP_nested    (1 << 2)

/**
  * Support for IOMMU_attach_pasid and IOMMU_detach_pasid and pasid 
parameter in
  * reattach_context.
  */
#define IOMMUCAP_pasid     (1 << 3)

/**
  * Support for IOMMU_ALLOC_identity
  */
#define IOMMUCAP_identity (1 << 4)

/**
  * IOMMU_query_capabilities
  * Query PV-IOMMU capabilities for this domain.
  */
struct pv_iommu_capabilities {
     /*
      * OUT: Maximum device address (iova) that the guest can use for 
mappings.
      */
     uint64_aligned_t max_iova_addr;

     /* OUT: IOMMU capabilities flags */
     uint32_t cap_flags;

     /* OUT: Mask of all supported page sizes. */
     uint32_t pgsize_mask;

     /* OUT: Maximum pasid (if IOMMUCAP_pasid) */
     uint32_t max_pasid;

     /* OUT: Maximum number of IOMMU context this domain can use. */
     uint16_t max_ctx_no;
};
typedef struct pv_iommu_capabilities pv_iommu_capabilities_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_capabilities_t);

/**
  * Create a 1:1 identity mapped context to domain memory
  * (needs IOMMUCAP_identity).
  */
#define IOMMU_ALLOC_identity (1 << 0)

/**
  * IOMMU_alloc_context
  * Allocate an IOMMU context.
  * Fails with -ENOSPC if no context number is available.
  */
struct pv_iommu_alloc {
     /* OUT: allocated IOMMU context number */
     uint16_t ctx_no;

     /* IN: allocation flags */
     uint32_t alloc_flags;
};
typedef struct pv_iommu_alloc pv_iommu_alloc_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_t);

/**
  * Move all devices to default context before freeing the context.
  */
#define IOMMU_FREE_reattach_default (1 << 0)

/**
  * IOMMU_free_context
  * Destroy a IOMMU context.
  *
  * If IOMMU_FREE_reattach_default is specified, move all context devices to
  * default context before destroying this context.
  *
  * If there are devices in the context and IOMMU_FREE_reattach_default 
is not
  * specified, fail with -EBUSY.
  *
  * The default context can't be destroyed.
  */
struct pv_iommu_free {
     /* IN: IOMMU context number to free */
     uint16_t ctx_no;

     /* IN: Free operation specific flags */
     uint32_t free_flags;
};
typedef struct pv_iommu_free pv_iommu_free_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_free_t);

/* Device has read access */
#define IOMMU_MAP_readable (1 << 0)

/* Device has write access */
#define IOMMU_MAP_writeable (1 << 1)

/* Enforce DMA coherency */
#define IOMMU_MAP_cache (1 << 2)

/**
  * IOMMU_map_pages
  * Map pages on a IOMMU context.
  *
  * pgsize must be supported by pgsize_mask.
  * Fails with -EINVAL if mapping on top of another mapping.
  * Report actually mapped page count in mapped field (regardless of 
failure).
  */
struct pv_iommu_map_pages {
     /* IN: IOMMU context number */
     uint16_t ctx_no;

     /* IN: Guest frame number */
     uint64_aligned_t gfn;

     /* IN: Device frame number */
     uint64_aligned_t dfn;

     /* IN: Map flags */
     uint32_t map_flags;

     /* IN: Size of pages to map */
     uint32_t pgsize;

     /* IN: Number of pages to map */
     uint32_t nr_pages;

     /* OUT: Number of pages actually mapped */
     uint32_t mapped;
};
typedef struct pv_iommu_map_pages pv_iommu_map_pages_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_map_pages_t);

/**
  * IOMMU_unmap_pages
  * Unmap pages on a IOMMU context.
  *
  * pgsize must be supported by pgsize_mask.
  * Report actually unmapped page count in mapped field (regardless of 
failure).
  * Fails with -ENOENT when attempting to unmap a page without any mapping
  */
struct pv_iommu_unmap_pages {
     /* IN: IOMMU context number */
     uint16_t ctx_no;

     /* IN: Device frame number */
     uint64_aligned_t dfn;

     /* IN: Size of pages to unmap */
     uint32_t pgsize;

     /* IN: Number of pages to unmap */
     uint32_t nr_pages;

     /* OUT: Number of pages actually unmapped */
     uint32_t unmapped;
};
typedef struct pv_iommu_unmap_pages pv_iommu_unmap_pages_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_unmap_pages_t);

/**
  * IOMMU_lookup_page
  * Lookup the GFN associated to a DFN.
  * Fails with -ENOENT if no such mapping exists.
  */
struct pv_iommu_lookup_page {
     /* IN: IOMMU context number */
     uint16_t ctx_no;

     /* IN: Device frame number to lookup */
     uint64_aligned_t dfn;
     /* OUT: Corresponding guest frame number */
     uint64_aligned_t gfn;
};
typedef struct pv_iommu_lookup_page pv_iommu_lookup_page_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_lookup_page_t);

/**
  * IOMMU_reattach_device
  * Reattach a device to another IOMMU context.
  * Fails with -ENODEV if no such device exist.
  */
struct pv_iommu_reattach_device {
     /* IN: Target IOMMU context number */
     uint16_t ctx_no;

     /* IN: Physical device to move */
     struct physdev_pci_device dev;

     /* IN: PASID of the device (if IOMMUCAP_pasid) */
     uint32_t pasid;
};
typedef struct pv_iommu_reattach_device pv_iommu_reattach_device_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_reattach_device_t);


/**
  * IOMMU_remote_cmd
  * Do a PV-IOMMU operation on another domain.
  * Current domain needs to be allowed to act on the target domain, 
otherwise
  * fails with -EPERM.
  */
struct pv_iommu_remote_cmd {
     /* IN: Target domain to do the subop on */
     uint16_t domid;

     /* IN: Command to do on target domain. */
     uint16_t cmd;

     /* INOUT: Command argument from current domain memory */
     XEN_GUEST_HANDLE(void) arg;
};
typedef struct pv_iommu_remote_cmd pv_iommu_remote_cmd_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_remote_cmd_t);

/**
  * IOMMU_alloc_nested
  * Create a nested IOMMU context (needs IOMMUCAP_nested).
  *
  * This context uses a platform-specific page table from domain address 
space
  * specified in pgtable_gfn and use it for nested translations.
  *
  * Explicit flushes needs to be submited with IOMMU_flush_nested on
  * modification of the nested pagetable to ensure coherency between 
IOTLB and
  * nested page table.
  *
  * This context can be destroyed using IOMMU_free_context.
  * This context cannot be modified nor queried using map_pages, 
unmap_pages and
  * lookup_page.
  */
struct pv_iommu_alloc_nested {
     /* OUT: allocated IOMMU context number */
     uint16_t ctx_no;

     /* IN: guest frame number of the nested page table */
     uint64_aligned_t pgtable_gfn;

     /* IN: nested mode flags */
     uint64_aligned_t nested_flags;
};
typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);

/**
  * IOMMU_flush_nested (needs IOMMUCAP_nested)
  * Flush the IOTLB for nested translation.
  */
struct pv_iommu_flush_nested {
     /* TODO */
};
typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);

/**
  * IOMMU_attach_pasid (needs IOMMUCAP_pasid)
  * Attach a new device-with-pasid to a IOMMU context.
  * If a matching device-with-pasid already exists (globally),
  * fail with -EEXIST.
  * If pasid is 0, fails with -EINVAL.
  * If physical device doesn't exist in domain, fail with -ENOENT.
  */
struct pv_iommu_attach_pasid {
     /* IN: IOMMU context to add the device-with-pasid in */
     uint16_t ctx_no;

     /* IN: Physical device */
     struct physdev_pci_device dev;

     /* IN: pasid of the device to attach */
     uint32_t pasid;
};
typedef struct pv_iommu_attach_pasid pv_iommu_attach_pasid_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_attach_pasid_t);

/**
  * IOMMU_detach_pasid (needs IOMMUCAP_pasid)
  * detach a device-with-pasid.
  * If the device-with-pasid doesn't exist or belong to the domain,
  * fail with -ENOENT.
  * If pasid is 0, fails with -EINVAL.
  */
struct pv_iommu_detach_pasid {
     /* IN: Physical device */
     struct physdev_pci_device dev;

     /* pasid of the device to detach */
     uint32_t pasid;
};
typedef struct pv_iommu_detach_pasid pv_iommu_detach_pasid_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_detach_pasid_t);

/* long do_iommu_op(int subop, XEN_GUEST_HANDLE_PARAM(void) arg) */

#endif

---


Thanks

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

