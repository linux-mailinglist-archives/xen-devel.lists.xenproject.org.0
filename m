Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC746AC83B2
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 23:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000196.1380558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKl4Z-0003J3-Ca; Thu, 29 May 2025 21:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000196.1380558; Thu, 29 May 2025 21:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKl4Z-0003HP-9p; Thu, 29 May 2025 21:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1000196;
 Thu, 29 May 2025 21:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAvS=YN=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uKl4Y-0003HJ-8v
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 21:45:58 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9c7691-3cd6-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 23:45:55 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55324062ea8so1957860e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 14:45:55 -0700 (PDT)
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
X-Inumbo-ID: 4c9c7691-3cd6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748555155; x=1749159955; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ed10ZYXxBQhdz3iy3aGPB5wBv0Q403cPvua9xeow1K8=;
        b=BnsQ2ul3bNGXJwT1sK4jhzFMws4GHTuDLXcFMUZVinJweND11l5rjY3ENEG/68vZy+
         iVLg781Am1FK0DvBLn/Rmx2OAPAdkQspDjq4nmrYZ9DmJaSHrQbc0AKY5efTdr45qQCV
         JYeWVCC7PyEE/A5gVWjOHoiQm0trtR3lEAoht6kmx2ffovH7DhRH0MLpMmaTzrDCUYm0
         XZngqLpveRhyXuhNNO1L8XE3tyNe6EVNBwOexNSoO25HYkmaGpVTQtIi+k3ewdzb4oEl
         /r0yU5qqS4wKHaIJdv4LZ/XyiIlRj7RWElzgWEZXCDtJsPkO+MgixrYc4TZ+obHAOceM
         bGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748555155; x=1749159955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ed10ZYXxBQhdz3iy3aGPB5wBv0Q403cPvua9xeow1K8=;
        b=lb4wHbCAhnpQ2aErT/jxX0OFcvywp28NLGo9vIoxgozc/CaGBFO5gachgozui3nfSi
         Xi3L5mY3sYV3mtwtK2pD1wkoIg/qsn8jLFpL4HUtn3PqI/CuEiOQkT0flsWaRhAm0QX8
         Glxkm3sE2AuQ/XA4Q4OiL/zwO/L3NBv2Kyu2H6As+gOwng9gALucKRG4ozzbZIkK4dhE
         L8ihG2mpvR7JO0GG6JL+b+m41m5FL7eeOwxDdnFyRknHX+xGmSdyy43xKoUmeC/qcixs
         QpDXtLo0Ggl58FOdC5r6Nh2toeoMMmPtcvZrK/i2dIl/BBERXUfJBjP4GLiL2HmfXuiA
         K1xA==
X-Gm-Message-State: AOJu0Yxsq/rrd3iRkPl3jKbYMg6foFvn1bEZ/HDv9qzAbfF9tivkAjOq
	WSEjPuEm2UOTQJqk24xQl4oqAqi7oXsH9W5ta4IfUlEIiKtF31MX3pyznbyno0T1KhJuNjnAa3s
	jHHWKIIr6pJK+to/vbIoFqk+y7lbFSC8=
X-Gm-Gg: ASbGncuCrynkvtjBWXQjjZlaUmVpZeFMNsmedXFgo1/meWBa7iFAm5aHDDc+sflf2u8
	XJBwWpdLnmpV0iICVwtdAQmOS8kM4x955gIamw85cmkchKN96C7rMtJ4Rz5VDE11vovGkravyMn
	vyJ7N1mVq3+bzGGDcEPEzBoU2bl7loQLqnfMl1MysdowSdcxAVD0yU
X-Google-Smtp-Source: AGHT+IGiGTse/2m4bSgjP3dTLobbU3wzhbHi+Cq4cOniLY0tIUbLdWS0TAlE7Y9m20BiUuWvQgXIgJeeTFhVlhslgHw=
X-Received: by 2002:a05:6512:e94:b0:553:24b7:2f6f with SMTP id
 2adb3069b0e04-5533b93bb29mr397129e87.51.1748555154443; Thu, 29 May 2025
 14:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250521211742.2997890-1-dmukhin@ford.com> <20250521211742.2997890-2-dmukhin@ford.com>
In-Reply-To: <20250521211742.2997890-2-dmukhin@ford.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 29 May 2025 22:45:43 +0100
X-Gm-Features: AX0GCFs907I7J5pfgAsS8eUeLyhuPaPHlHoZDLkMSMU7B9zKI6GiUa9YFb6KEok
Message-ID: <CACMJ4GbL7Xgn8KwGj3=Navu+TkOE3i-axsaQW+qMp_UnbRyX-Q@mail.gmail.com>
Subject: Re: [XTF PATCH v2 1/2] tests/argo: Add argo test suite
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	dpsmith@apertussolutions.com, michal.orzel@amd.com, persaur@gmail.com, 
	dmukhin@ford.com, Christopher Clark <christopher.clark6@baesystems.com>
Content-Type: multipart/alternative; boundary="000000000000d9d4c606364d3838"

--000000000000d9d4c606364d3838
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 10:18=E2=80=AFPM <dmkhn@proton.me> wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Simple test cases for the four Argo operations, register, unregister,
> sendv and notify exercised with a single test domain.
> Add infrastructure to access Argo: a 5-argument hypercall, number 39.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
Tested-by: Christopher Clark <christopher.w.clark@gmail.com>

Thanks for working to advance this - sorry for the slow response.

Christopher


> ---
> Original XTF argo test:
>
> https://github.com/dozylynx/meta-argo/blob/master/recipes-extended/xen/xt=
f/0001-Add-Argo-test.patch
> ---
>  docs/all-tests.dox      |   2 +
>  include/xen/argo.h      | 259 +++++++++++++++++++++++++++++
>  include/xtf/hypercall.h |   1 +
>  include/xtf/numbers.h   |   5 +
>  tests/argo/Makefile     |   9 +
>  tests/argo/main.c       | 353 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 629 insertions(+)
>  create mode 100644 include/xen/argo.h
>  create mode 100644 tests/argo/Makefile
>  create mode 100644 tests/argo/main.c
>
> diff --git a/docs/all-tests.dox b/docs/all-tests.dox
> index 566762c..1a7b4b7 100644
> --- a/docs/all-tests.dox
> +++ b/docs/all-tests.dox
> @@ -178,6 +178,8 @@ states.
>
>  @section index-utility Utilities
>
> +@subpage test-argo - Argo functionality test
> +
>  @subpage test-cpuid - Print CPUID information.
>
>  @subpage test-fep - Test availability of HVM Forced Emulation Prefix.
> diff --git a/include/xen/argo.h b/include/xen/argo.h
> new file mode 100644
> index 0000000..5ae2def
> --- /dev/null
> +++ b/include/xen/argo.h
> @@ -0,0 +1,259 @@
>
> +/***********************************************************************=
*******
> + * Argo : Hypervisor-Mediated data eXchange
> + *
> + * Derived from v4v, the version 2 of v2v.
> + *
> + * Copyright (c) 2010, Citrix Systems
> + * Copyright (c) 2018-2019, BAE Systems
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to
> + * deal in the Software without restriction, including without limitatio=
n
> the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense,
> and/or
> + * sell copies of the Software, and to permit persons to whom the
> Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __XEN_PUBLIC_ARGO_H__
> +#define __XEN_PUBLIC_ARGO_H__
> +
> +#define XEN_ARGO_DOMID_ANY       DOMID_INVALID
> +
> +/* The maximum size of an Argo ring is defined to be: 16MB (0x1000000
> bytes). */
> +#define XEN_ARGO_MAX_RING_SIZE  (0x1000000ULL)
> +
> +/* Fixed-width type for "argo port" number. Nothing to do with evtchns. =
*/
> +typedef uint32_t xen_argo_port_t;
> +
> +/* gfn type: 64-bit fixed-width on all architectures */
> +typedef uint64_t xen_argo_gfn_t;
> +
> +/*
> + * XEN_ARGO_MAXIOV : maximum number of iovs accepted in a single sendv.
> + * Caution is required if this value is increased: this determines the
> size of
> + * an array of xen_argo_iov_t structs on the hypervisor stack, so could
> cause
> + * stack overflow if the value is too large.
> + * The Linux Argo driver never passes more than two iovs.
> +*/
> +#define XEN_ARGO_MAXIOV          8U
> +
> +typedef struct xen_argo_iov
> +{
> +    unsigned long iov_hnd;
> +    uint32_t iov_len;
> +    uint32_t pad;
> +} xen_argo_iov_t;
> +
> +typedef struct xen_argo_addr
> +{
> +    xen_argo_port_t aport;
> +    domid_t domain_id;
> +    uint16_t pad;
> +} xen_argo_addr_t;
> +
> +typedef struct xen_argo_send_addr
> +{
> +    struct xen_argo_addr src;
> +    struct xen_argo_addr dst;
> +} xen_argo_send_addr_t;
> +
> +typedef struct xen_argo_ring
> +{
> +    /* Guests should use atomic operations to access rx_ptr */
> +    uint32_t rx_ptr;
> +    /* Guests should use atomic operations to access tx_ptr */
> +    uint32_t tx_ptr;
> +    /*
> +     * Header space reserved for later use. Align the start of the ring
> to a
> +     * multiple of the message slot size.
> +     */
> +    uint8_t reserved[56];
> +    uint8_t ring[];
> +} xen_argo_ring_t;
> +
> +typedef struct xen_argo_register_ring
> +{
> +    xen_argo_port_t aport;
> +    domid_t partner_id;
> +    uint16_t pad;
> +    uint32_t len;
> +} xen_argo_register_ring_t;
> +
> +typedef struct xen_argo_unregister_ring
> +{
> +    xen_argo_port_t aport;
> +    domid_t partner_id;
> +    uint16_t pad;
> +} xen_argo_unregister_ring_t;
> +
> +/* Messages on the ring are padded to a multiple of this size. */
> +#define XEN_ARGO_MSG_SLOT_SIZE 0x10
> +
> +/*
> + * Notify flags
> + */
> +/* Ring exists */
> +#define XEN_ARGO_RING_EXISTS            (1U << 0)
> +/* Ring is shared, not unicast */
> +#define XEN_ARGO_RING_SHARED            (1U << 1)
> +/* Ring is empty */
> +#define XEN_ARGO_RING_EMPTY             (1U << 2)
> +/* Sufficient space to queue space_required bytes might exist */
> +#define XEN_ARGO_RING_SUFFICIENT        (1U << 3)
> +/* Insufficient ring size for space_required bytes */
> +#define XEN_ARGO_RING_EMSGSIZE          (1U << 4)
> +/* Too many domains waiting for available space signals for this ring */
> +#define XEN_ARGO_RING_EBUSY             (1U << 5)
> +
> +typedef struct xen_argo_ring_data_ent
> +{
> +    struct xen_argo_addr ring;
> +    uint16_t flags;
> +    uint16_t pad;
> +    uint32_t space_required;
> +    uint32_t max_message_size;
> +} xen_argo_ring_data_ent_t;
> +
> +typedef struct xen_argo_ring_data
> +{
> +    uint32_t nent;
> +    uint32_t pad;
> +
> +    /*
> +     * The Xen headers have:
> +     *   struct xen_argo_ring_data_ent data[];
> +     * here.  It's useful for the hypervisor side of the interface, but
> really
> +     * not for the client side.
> +     */
> +} xen_argo_ring_data_t;
> +
> +struct xen_argo_ring_message_header
> +{
> +    uint32_t len;
> +    struct xen_argo_addr source;
> +    uint32_t message_type;
> +    uint8_t data[];
> +};
> +
> +/*
> + * Hypercall operations
> + */
> +
> +/*
> + * XEN_ARGO_OP_register_ring
> + *
> + * Register a ring using the guest-supplied memory pages.
> + * Also used to reregister an existing ring (eg. after resume from
> hibernate).
> + *
> + * The first argument struct indicates the port number for the ring to
> register
> + * and the partner domain, if any, that is to be allowed to send to the
> ring.
> + * A wildcard (XEN_ARGO_DOMID_ANY) may be supplied instead of a partner
> domid,
> + * and if the hypervisor has wildcard sender rings enabled, this will
> allow
> + * any domain (XSM notwithstanding) to send to the ring.
> + *
> + * The second argument is an array of guest frame numbers and the third
> argument
> + * indicates the size of the array. This operation only supports 4K-size=
d
> pages.
> + *
> + * arg1: XEN_GUEST_HANDLE(xen_argo_register_ring_t)
> + * arg2: XEN_GUEST_HANDLE(xen_argo_gfn_t)
> + * arg3: unsigned long npages
> + * arg4: unsigned long flags (32-bit value)
> + */
> +#define XEN_ARGO_OP_register_ring     1
> +
> +/* Register op flags */
> +/*
> + * Fail exist:
> + * If set, reject attempts to (re)register an existing established ring.
> + * If clear, reregistration occurs if the ring exists, with the new ring
> + * taking the place of the old, preserving tx_ptr if it remains valid.
> + */
> +#define XEN_ARGO_REGISTER_FLAG_FAIL_EXIST  0x1
> +
> +#ifdef __XEN__
> +/* Mask for all defined flags. */
> +#define XEN_ARGO_REGISTER_FLAG_MASK XEN_ARGO_REGISTER_FLAG_FAIL_EXIST
> +#endif
> +
> +/*
> + * XEN_ARGO_OP_unregister_ring
> + *
> + * Unregister a previously-registered ring, ending communication.
> + *
> + * arg1: XEN_GUEST_HANDLE(xen_argo_unregister_ring_t)
> + * arg2: NULL
> + * arg3: 0 (ZERO)
> + * arg4: 0 (ZERO)
> + */
> +#define XEN_ARGO_OP_unregister_ring     2
> +
> +/*
> + * XEN_ARGO_OP_sendv
> + *
> + * Send a list of buffers contained in iovs.
> + *
> + * The send address struct specifies the source and destination addresse=
s
> + * for the message being sent, which are used to find the destination
> ring:
> + * Xen first looks for a most-specific match with a registered ring with
> + *  (id.addr =3D=3D dst) and (id.partner =3D=3D sending_domain) ;
> + * if that fails, it then looks for a wildcard match (aka multicast
> receiver)
> + * where (id.addr =3D=3D dst) and (id.partner =3D=3D DOMID_ANY).
> + *
> + * For each iov entry, send iov_len bytes from iov_base to the
> destination ring.
> + * If insufficient space exists in the destination ring, it will return
> -EAGAIN
> + * and Xen will notify the caller when sufficient space becomes availabl=
e.
> + *
> + * The message type is a 32-bit data field available to communicate
> message
> + * context data (eg. kernel-to-kernel, rather than application layer).
> + *
> + * arg1: XEN_GUEST_HANDLE(xen_argo_send_addr_t) source and dest addresse=
s
> + * arg2: XEN_GUEST_HANDLE(xen_argo_iov_t) iovs
> + * arg3: unsigned long niov
> + * arg4: unsigned long message type (32-bit value)
> + */
> +#define XEN_ARGO_OP_sendv               3
> +
> +/*
> + * XEN_ARGO_OP_notify
> + *
> + * Asks Xen for information about other rings in the system.
> + *
> + * ent->ring is the xen_argo_addr_t of the ring you want information on.
> + * Uses the same ring matching rules as XEN_ARGO_OP_sendv.
> + *
> + * ent->space_required : if this field is not null then Xen will check
> + * that there is space in the destination ring for this many bytes of
> payload.
> + * If the ring is too small for the requested space_required, it will se=
t
> the
> + * XEN_ARGO_RING_EMSGSIZE flag on return.
> + * If sufficient space is available, it will set XEN_ARGO_RING_SUFFICIEN=
T
> + * and CANCEL any pending notification for that ent->ring; otherwise it
> + * will schedule a notification event and the flag will not be set.
> + *
> + * These flags are set by Xen when notify replies:
> + * XEN_ARGO_RING_EXISTS     ring exists
> + * XEN_ARGO_RING_SHARED     ring is registered for wildcard partner
> + * XEN_ARGO_RING_EMPTY      ring is empty
> + * XEN_ARGO_RING_SUFFICIENT sufficient space for space_required is there
> + * XEN_ARGO_RING_EMSGSIZE   space_required is too large for the ring siz=
e
> + * XEN_ARGO_RING_EBUSY      too many domains waiting for available space
> signals
> + *
> + * arg1: XEN_GUEST_HANDLE(xen_argo_ring_data_t) ring_data (may be NULL)
> + * arg2: NULL
> + * arg3: 0 (ZERO)
> + * arg4: 0 (ZERO)
> + */
> +#define XEN_ARGO_OP_notify              4
> +
> +#endif
> diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h
> index 0d33807..17975ba 100644
> --- a/include/xtf/hypercall.h
> +++ b/include/xtf/hypercall.h
> @@ -33,6 +33,7 @@
>  extern uint8_t hypercall_page[PAGE_SIZE];
>
>  /* All Xen ABI for includers convenience .*/
> +#include <xen/argo.h>
>  #include <xen/callback.h>
>  #include <xen/elfnote.h>
>  #include <xen/errno.h>
> diff --git a/include/xtf/numbers.h b/include/xtf/numbers.h
> index f5c73b7..b0b2c1b 100644
> --- a/include/xtf/numbers.h
> +++ b/include/xtf/numbers.h
> @@ -52,6 +52,11 @@
>   */
>  #define _u(v) ((unsigned long)(v))
>
> +/**
> + * Round up a number to the next integer
> + */
> +#define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))
> +
>  #endif /* !__ASSEMBLY__ */
>  #endif /* XTF_NUMBERS_H */
>
> diff --git a/tests/argo/Makefile b/tests/argo/Makefile
> new file mode 100644
> index 0000000..c6b3113
> --- /dev/null
> +++ b/tests/argo/Makefile
> @@ -0,0 +1,9 @@
> +include $(ROOT)/build/common.mk
> +
> +NAME      :=3D argo
> +CATEGORY  :=3D in-development
> +TEST-ENVS :=3D $(ALL_ENVIRONMENTS)
> +
> +obj-perenv +=3D main.o
> +
> +include $(ROOT)/build/gen.mk
> diff --git a/tests/argo/main.c b/tests/argo/main.c
> new file mode 100644
> index 0000000..fa54aed
> --- /dev/null
> +++ b/tests/argo/main.c
> @@ -0,0 +1,353 @@
> +/**
> + * @file tests/argo/main.c
> + * @ref test-argo
> + *
> + * @page test-argo argo
> + *
> + * @todo Docs for test-argo
> + *
> + * @see tests/argo/main.c
> + */
> +#include <xtf.h>
> +
> +const char test_title[] =3D "Argo hypercall test";
> +
> +/*
> + * The current Linux Argo driver has a default ring size of 32 4k pages,
> + * so follow that for the test ring size.
> + */
> +static uint8_t ring_buffer[32 * PAGE_SIZE] __page_aligned_bss;
> +#define TEST_RING_NPAGES (sizeof(ring_buffer) / PAGE_SIZE)
> +
> +static int probe_for_argo(domid_t own_domid)
> +{
> +    /* Attempt an Argo call to register a ring with invalid arguments */
> +    xen_argo_register_ring_t reg =3D {
> +        .aport      =3D 1,
> +        .partner_id =3D own_domid,
> +        .len        =3D 1, /* A 1-byte ring is never allowed */
> +    };
> +    int rc =3D hypercall_argo_op(XEN_ARGO_OP_register_ring, &reg, NULL, =
0,
> 0);
> +
> +    switch ( rc )
> +    {
> +    case -EINVAL: /* This is the response we are looking for */
> +        return 0;
> +
> +        /* All below here are test exit conditions */
> +    case -ENOSYS:
> +        xtf_skip("Skip: Argo support has not been enabled in this
> hypervisor\n");
> +        break;
> +    case -EOPNOTSUPP:
> +        xtf_skip("Skip: Argo is not enabled at runtime for this
> hypervisor\n");
> +        break;
> +    case -ENODEV:
> +        xtf_skip("Skip: Argo is not enabled for this domain\n");
> +        break;
> +
> +    case -EPERM:
> +        xtf_failure("Fail: ring registration by this domain is not
> permitted\n");
> +        break;
> +    case 0:
> +        xtf_failure("Fail: an invalid ring register op was not
> rejected\n");
> +        break;
> +    default:
> +        xtf_failure("Fail: unknown error %d for invalid ring
> registration\n", rc);
> +        break;
> +    }
> +
> +    return -1;
> +}
> +
> +/* notify: asks Xen for information about rings */
> +static int
> +test_notify_for_one_ring(domid_t query_domid, xen_argo_port_t query_port=
,
> +                         bool exists)
> +{
> +    struct {
> +        xen_argo_ring_data_t data;
> +        xen_argo_ring_data_ent_t ents[1];
> +    } notify =3D {
> +        .data =3D {
> +            .nent =3D ARRAY_SIZE(notify.ents),
> +        },
> +        .ents =3D {
> +            {
> +                .ring =3D {
> +                    .domain_id =3D query_domid,
> +                    .aport     =3D query_port,
> +                },
> +            },
> +        },
> +    };
> +    int rc =3D hypercall_argo_op(XEN_ARGO_OP_notify, &notify, NULL, 0, 0=
);
> +
> +    if ( rc )
> +    {
> +        xtf_failure("Fail: Unexpected error code %d in notify test\n",
> rc);
> +        return -1;
> +    }
> +
> +    if ( !exists )
> +    {
> +        /* No currently-defined flags should be set for a non-existent
> ring */
> +        if ( notify.ents[0].flags )
> +        {
> +            xtf_failure("Fail: Non-existent ring reported as existing\n"=
);
> +            return -1;
> +        }
> +    }
> +    else
> +    {
> +        if ( !(notify.ents[0].flags & XEN_ARGO_RING_EXISTS) )
> +        {
> +            xtf_failure("Fail: Ring not reported as existing\n");
> +            return -1;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/* See the Argo Linux device driver for similar use of these macros */
> +#define XEN_ARGO_ROUNDUP(x) roundup((x), XEN_ARGO_MSG_SLOT_SIZE)
> +#define ARGO_RING_OVERHEAD 80
> +#define TEST_RING_SIZE(npages)                                      \
> +    (XEN_ARGO_ROUNDUP((((PAGE_SIZE)*npages) - ARGO_RING_OVERHEAD)))
> +
> +static int
> +test_register_ring(domid_t own_domid, xen_argo_port_t aport)
> +{
> +    unsigned int i;
> +    xen_argo_register_ring_t reg =3D {
> +        .aport      =3D aport,
> +        .partner_id =3D own_domid,
> +        .len        =3D TEST_RING_SIZE(TEST_RING_NPAGES),
> +    };
> +    xen_argo_gfn_t gfns[TEST_RING_NPAGES];
> +
> +    for ( i =3D 0; i < TEST_RING_NPAGES; i++ )
> +        gfns[i] =3D virt_to_gfn(ring_buffer + (i * PAGE_SIZE));
> +
> +    int rc =3D hypercall_argo_op(XEN_ARGO_OP_register_ring, &reg, &gfns,
> +                               TEST_RING_NPAGES,
> XEN_ARGO_REGISTER_FLAG_FAIL_EXIST);
> +    switch ( rc )
> +    {
> +    case 0:
> +        return 0;
> +
> +    case -ENODEV:
> +        xtf_failure("Fail: Argo is not enabled for this domain\n");
> +        break;
> +    case -EFAULT:
> +        xtf_failure("Fail: Memory fault performing register ring test\n"=
);
> +        break;
> +    default:
> +        xtf_failure("Fail: Unexpected error code %d in register ring
> test\n", rc);
> +        break;
> +    }
> +    return -1;
> +}
> +
> +static int
> +test_unregister_ring(domid_t partner_domid, xen_argo_port_t aport,
> +                     bool exists)
> +{
> +    xen_argo_register_ring_t unreg =3D {
> +        .aport      =3D aport,
> +        .partner_id =3D partner_domid,
> +    };
> +    int rc =3D hypercall_argo_op(XEN_ARGO_OP_unregister_ring, &unreg, NU=
LL,
> 0, 0);
> +
> +    switch ( rc )
> +    {
> +    case 0:
> +        if ( exists )
> +            return 0;
> +        xtf_failure("Fail: unexpected success unregistering non-existent
> ring\n");
> +        return -1;
> +
> +    case -ENOENT:
> +        if ( !exists )
> +            return 0;
> +        xtf_failure("Fail: unexpected ring not found when unregistering
> \n");
> +        return -1;
> +
> +    default:
> +        xtf_failure("Fail: Unexpected error code %d in unregister ring
> test\n", rc);
> +        break;
> +    }
> +    return -1;
> +}
> +
> +static int
> +test_sendv(domid_t src_domid, xen_argo_port_t src_aport,
> +           domid_t dst_domid, xen_argo_port_t dst_aport,
> +           const char *msg_text, size_t msg_len, unsigned int msg_type)
> +{
> +    xen_argo_send_addr_t send_addr =3D {
> +        .src =3D {
> +            .domain_id =3D src_domid,
> +            .aport     =3D src_aport,
> +        },
> +        .dst =3D {
> +            .domain_id =3D dst_domid,
> +            .aport     =3D dst_aport,
> +        },
> +    };
> +    xen_argo_iov_t iovs[] =3D {
> +        {
> +            .iov_hnd =3D _u(msg_text),
> +            .iov_len =3D msg_len,
> +        },
> +    };
> +    int rc =3D hypercall_argo_op(XEN_ARGO_OP_sendv, &send_addr,
> +                               iovs, ARRAY_SIZE(iovs), msg_type);
> +
> +    if ( rc < 0 )
> +    {
> +        xtf_failure("Fail: Unexpected error code %d in sendv test\n", rc=
);
> +        return -1;
> +    }
> +
> +    if ( (size_t)rc !=3D msg_len )
> +    {
> +        xtf_failure("Fail: Unexpected message size %d written in sendv
> test\n", rc);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int
> +inspect_ring_after_first_single_sendv(domid_t src_domid,
> +                                      xen_argo_port_t src_aport,
> +                                      const char *sent_msg,
> +                                      unsigned int sent_msg_len,
> +                                      unsigned int sent_msg_type)
> +{
> +    int rc =3D 0;
> +    xen_argo_ring_t *ringp =3D (xen_argo_ring_t *)ring_buffer;
> +    struct xen_argo_ring_message_header *msg_hdr;
> +    unsigned int sent_length;
> +
> +    if ( ringp->rx_ptr !=3D 0 )
> +    {
> +        xtf_failure("Fail: receive pointer non-zero after sendv: %u\n",
> +                    ringp->rx_ptr);
> +        rc =3D -1;
> +    }
> +
> +    if ( ringp->tx_ptr !=3D XEN_ARGO_ROUNDUP(
> +             sizeof(struct xen_argo_ring_message_header) + sent_msg_len)=
 )
> +    {
> +        xtf_failure("Fail: transmit pointer incorrect after sendv: %u\n"=
,
> +                    ringp->rx_ptr);
> +        rc =3D -1;
> +    }
> +
> +    msg_hdr =3D (struct xen_argo_ring_message_header *)&(ringp->ring);
> +
> +    if ( msg_hdr->source.domain_id !=3D src_domid )
> +    {
> +        xtf_failure("Fail: source domain id incorrect: %u, expected %u\n=
",
> +                    msg_hdr->source.domain_id, src_domid);
> +        rc =3D -1;
> +    }
> +
> +    if ( msg_hdr->source.aport !=3D src_aport )
> +    {
> +        xtf_failure("Fail: source domain port incorrect: %u, expected
> %u\n",
> +                    msg_hdr->source.domain_id, src_aport);
> +        rc =3D -1;
> +    }
> +
> +    if ( msg_hdr->source.pad !=3D 0 )
> +    {
> +        xtf_failure("Fail: source padding incorrect: %u, expected zero\n=
",
> +                    msg_hdr->source.pad);
> +        rc =3D -1;
> +    }
> +
> +    if ( sent_msg_type !=3D msg_hdr->message_type )
> +    {
> +        xtf_failure("Fail: message type incorrect: %u sent, %u
> received\n",
> +                    sent_msg_type, msg_hdr->message_type);
> +        rc =3D -1;
> +    }
> +
> +    sent_length =3D sent_msg_len + sizeof(struct
> xen_argo_ring_message_header);
> +    if ( sent_length !=3D msg_hdr->len )
> +    {
> +        xtf_failure("Fail: received message length incorrect: "
> +                    "%u sent is %u with header added, %u received\n",
> +                    sent_msg_len, sent_length, msg_hdr->len);
> +        rc =3D -1;
> +    }
> +
> +    if ( strncmp((const char *)msg_hdr->data, sent_msg, sent_msg_len) )
> +    {
> +        xtf_failure("Fail: sent message got mangled\n");
> +        rc =3D -1;
> +    }
> +
> +    return rc;
> +}
> +
> +static void clear_test_ring(void)
> +{
> +    memset(ring_buffer, 0, sizeof(ring_buffer));
> +}
> +
> +void test_main(void)
> +{
> +    int own_domid;
> +    xen_argo_port_t test_aport =3D 1;
> +    const char simple_text[] =3D "a simple thing to send\n";
> +    const unsigned int msg_type =3D 0x12345678;
> +
> +    own_domid =3D xtf_get_domid();
> +    if ( own_domid < 0 )
> +        return xtf_error("Error: could not determine domid of the test
> domain\n");
> +
> +    /* First test validates for Argo availability to gate further testin=
g
> */
> +    if ( probe_for_argo(own_domid) )
> +        return;
> +
> +    if ( test_notify_for_one_ring(own_domid, test_aport, false) ||
> +         test_unregister_ring(own_domid, test_aport, false) )
> +        return;
> +
> +    clear_test_ring();
> +
> +    if ( test_register_ring(own_domid, test_aport) ||
> +         test_notify_for_one_ring(own_domid, test_aport, true) ||
> +         test_unregister_ring(own_domid, test_aport, true) ||
> +         test_notify_for_one_ring(own_domid, test_aport, false) ||
> +         test_unregister_ring(own_domid, test_aport, false) )
> +        return;
> +
> +    clear_test_ring();
> +
> +    if ( test_register_ring(own_domid, test_aport) ||
> +         test_sendv(own_domid, test_aport, own_domid, test_aport,
> +                    simple_text, strlen(simple_text), msg_type) ||
> +         inspect_ring_after_first_single_sendv(
> +             own_domid, test_aport, simple_text, strlen(simple_text),
> msg_type) ||
> +         test_notify_for_one_ring(own_domid, test_aport, true) ||
> +         test_unregister_ring(own_domid, test_aport, true) ||
> +         test_unregister_ring(own_domid, test_aport, false) )
> +        return;
> +
> +    xtf_success(NULL);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.34.1
>
>
>

--000000000000d9d4c606364d3838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 21, 2025 at 10:18=E2=80=AFPM =
&lt;<a href=3D"mailto:dmkhn@proton.me">dmkhn@proton.me</a>&gt; wrote:</div>=
<div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Christopher Clark &lt;<a href=3D"mailto:chris=
topher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</=
a>&gt;<br>
<br>
From: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.com=
" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
<br>
Simple test cases for the four Argo operations, register, unregister,<br>
sendv and notify exercised with a single test domain.<br>
Add infrastructure to access Argo: a 5-argument hypercall, number 39.<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com" target=3D"_blank">christopher.clark6@baesystems.com</a>&gt;<=
br>
Signed-off-by: Denis Mukhin &lt;<a href=3D"mailto:dmukhin@ford.com" target=
=3D"_blank">dmukhin@ford.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmai=
l.com">christopher.w.clark@gmail.com</a>&gt;<br>Tested-by: Christopher Clar=
k &lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@=
gmail.com</a>&gt;<br><br>Thanks for working to advance this - sorry for the=
 slow response.<br><br>Christopher<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
---<br>
Original XTF argo test:<br>
=C2=A0 <a href=3D"https://github.com/dozylynx/meta-argo/blob/master/recipes=
-extended/xen/xtf/0001-Add-Argo-test.patch" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/dozylynx/meta-argo/blob/master/recipes-extended/xe=
n/xtf/0001-Add-Argo-test.patch</a><br>
---<br>
=C2=A0docs/all-tests.dox=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0include/xen/argo.h=C2=A0 =C2=A0 =C2=A0 | 259 ++++++++++++++++++++++++=
+++++<br>
=C2=A0include/xtf/hypercall.h |=C2=A0 =C2=A01 +<br>
=C2=A0include/xtf/numbers.h=C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0tests/argo/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
=C2=A0tests/argo/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 353 +++++++++++++++++++=
+++++++++++++++++++++<br>
=C2=A06 files changed, 629 insertions(+)<br>
=C2=A0create mode 100644 include/xen/argo.h<br>
=C2=A0create mode 100644 tests/argo/Makefile<br>
=C2=A0create mode 100644 tests/argo/main.c<br>
<br>
diff --git a/docs/all-tests.dox b/docs/all-tests.dox<br>
index 566762c..1a7b4b7 100644<br>
--- a/docs/all-tests.dox<br>
+++ b/docs/all-tests.dox<br>
@@ -178,6 +178,8 @@ states.<br>
<br>
=C2=A0@section index-utility Utilities<br>
<br>
+@subpage test-argo - Argo functionality test<br>
+<br>
=C2=A0@subpage test-cpuid - Print CPUID information.<br>
<br>
=C2=A0@subpage test-fep - Test availability of HVM Forced Emulation Prefix.=
<br>
diff --git a/include/xen/argo.h b/include/xen/argo.h<br>
new file mode 100644<br>
index 0000000..5ae2def<br>
--- /dev/null<br>
+++ b/include/xen/argo.h<br>
@@ -0,0 +1,259 @@<br>
+/*************************************************************************=
*****<br>
+ * Argo : Hypervisor-Mediated data eXchange<br>
+ *<br>
+ * Derived from v4v, the version 2 of v2v.<br>
+ *<br>
+ * Copyright (c) 2010, Citrix Systems<br>
+ * Copyright (c) 2018-2019, BAE Systems<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to<br>
+ * deal in the Software without restriction, including without limitation =
the<br>
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, an=
d/or<br>
+ * sell copies of the Software, and to permit persons to whom the Software=
 is<br>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
 THE<br>
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER<=
br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
<br>
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br>
+ * DEALINGS IN THE SOFTWARE.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef __XEN_PUBLIC_ARGO_H__<br>
+#define __XEN_PUBLIC_ARGO_H__<br>
+<br>
+#define XEN_ARGO_DOMID_ANY=C2=A0 =C2=A0 =C2=A0 =C2=A0DOMID_INVALID<br>
+<br>
+/* The maximum size of an Argo ring is defined to be: 16MB (0x1000000 byte=
s). */<br>
+#define XEN_ARGO_MAX_RING_SIZE=C2=A0 (0x1000000ULL)<br>
+<br>
+/* Fixed-width type for &quot;argo port&quot; number. Nothing to do with e=
vtchns. */<br>
+typedef uint32_t xen_argo_port_t;<br>
+<br>
+/* gfn type: 64-bit fixed-width on all architectures */<br>
+typedef uint64_t xen_argo_gfn_t;<br>
+<br>
+/*<br>
+ * XEN_ARGO_MAXIOV : maximum number of iovs accepted in a single sendv.<br=
>
+ * Caution is required if this value is increased: this determines the siz=
e of<br>
+ * an array of xen_argo_iov_t structs on the hypervisor stack, so could ca=
use<br>
+ * stack overflow if the value is too large.<br>
+ * The Linux Argo driver never passes more than two iovs.<br>
+*/<br>
+#define XEN_ARGO_MAXIOV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8U<br>
+<br>
+typedef struct xen_argo_iov<br>
+{<br>
+=C2=A0 =C2=A0 unsigned long iov_hnd;<br>
+=C2=A0 =C2=A0 uint32_t iov_len;<br>
+=C2=A0 =C2=A0 uint32_t pad;<br>
+} xen_argo_iov_t;<br>
+<br>
+typedef struct xen_argo_addr<br>
+{<br>
+=C2=A0 =C2=A0 xen_argo_port_t aport;<br>
+=C2=A0 =C2=A0 domid_t domain_id;<br>
+=C2=A0 =C2=A0 uint16_t pad;<br>
+} xen_argo_addr_t;<br>
+<br>
+typedef struct xen_argo_send_addr<br>
+{<br>
+=C2=A0 =C2=A0 struct xen_argo_addr src;<br>
+=C2=A0 =C2=A0 struct xen_argo_addr dst;<br>
+} xen_argo_send_addr_t;<br>
+<br>
+typedef struct xen_argo_ring<br>
+{<br>
+=C2=A0 =C2=A0 /* Guests should use atomic operations to access rx_ptr */<b=
r>
+=C2=A0 =C2=A0 uint32_t rx_ptr;<br>
+=C2=A0 =C2=A0 /* Guests should use atomic operations to access tx_ptr */<b=
r>
+=C2=A0 =C2=A0 uint32_t tx_ptr;<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Header space reserved for later use. Align the start=
 of the ring to a<br>
+=C2=A0 =C2=A0 =C2=A0* multiple of the message slot size.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 uint8_t reserved[56];<br>
+=C2=A0 =C2=A0 uint8_t ring[];<br>
+} xen_argo_ring_t;<br>
+<br>
+typedef struct xen_argo_register_ring<br>
+{<br>
+=C2=A0 =C2=A0 xen_argo_port_t aport;<br>
+=C2=A0 =C2=A0 domid_t partner_id;<br>
+=C2=A0 =C2=A0 uint16_t pad;<br>
+=C2=A0 =C2=A0 uint32_t len;<br>
+} xen_argo_register_ring_t;<br>
+<br>
+typedef struct xen_argo_unregister_ring<br>
+{<br>
+=C2=A0 =C2=A0 xen_argo_port_t aport;<br>
+=C2=A0 =C2=A0 domid_t partner_id;<br>
+=C2=A0 =C2=A0 uint16_t pad;<br>
+} xen_argo_unregister_ring_t;<br>
+<br>
+/* Messages on the ring are padded to a multiple of this size. */<br>
+#define XEN_ARGO_MSG_SLOT_SIZE 0x10<br>
+<br>
+/*<br>
+ * Notify flags<br>
+ */<br>
+/* Ring exists */<br>
+#define XEN_ARGO_RING_EXISTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U =
&lt;&lt; 0)<br>
+/* Ring is shared, not unicast */<br>
+#define XEN_ARGO_RING_SHARED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U =
&lt;&lt; 1)<br>
+/* Ring is empty */<br>
+#define XEN_ARGO_RING_EMPTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1U &lt;&lt; 2)<br>
+/* Sufficient space to queue space_required bytes might exist */<br>
+#define XEN_ARGO_RING_SUFFICIENT=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&lt; 3=
)<br>
+/* Insufficient ring size for space_required bytes */<br>
+#define XEN_ARGO_RING_EMSGSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&=
lt; 4)<br>
+/* Too many domains waiting for available space signals for this ring */<b=
r>
+#define XEN_ARGO_RING_EBUSY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1U &lt;&lt; 5)<br>
+<br>
+typedef struct xen_argo_ring_data_ent<br>
+{<br>
+=C2=A0 =C2=A0 struct xen_argo_addr ring;<br>
+=C2=A0 =C2=A0 uint16_t flags;<br>
+=C2=A0 =C2=A0 uint16_t pad;<br>
+=C2=A0 =C2=A0 uint32_t space_required;<br>
+=C2=A0 =C2=A0 uint32_t max_message_size;<br>
+} xen_argo_ring_data_ent_t;<br>
+<br>
+typedef struct xen_argo_ring_data<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t nent;<br>
+=C2=A0 =C2=A0 uint32_t pad;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* The Xen headers have:<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0struct xen_argo_ring_data_ent data[];<br=
>
+=C2=A0 =C2=A0 =C2=A0* here.=C2=A0 It&#39;s useful for the hypervisor side =
of the interface, but really<br>
+=C2=A0 =C2=A0 =C2=A0* not for the client side.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+} xen_argo_ring_data_t;<br>
+<br>
+struct xen_argo_ring_message_header<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t len;<br>
+=C2=A0 =C2=A0 struct xen_argo_addr source;<br>
+=C2=A0 =C2=A0 uint32_t message_type;<br>
+=C2=A0 =C2=A0 uint8_t data[];<br>
+};<br>
+<br>
+/*<br>
+ * Hypercall operations<br>
+ */<br>
+<br>
+/*<br>
+ * XEN_ARGO_OP_register_ring<br>
+ *<br>
+ * Register a ring using the guest-supplied memory pages.<br>
+ * Also used to reregister an existing ring (eg. after resume from hiberna=
te).<br>
+ *<br>
+ * The first argument struct indicates the port number for the ring to reg=
ister<br>
+ * and the partner domain, if any, that is to be allowed to send to the ri=
ng.<br>
+ * A wildcard (XEN_ARGO_DOMID_ANY) may be supplied instead of a partner do=
mid,<br>
+ * and if the hypervisor has wildcard sender rings enabled, this will allo=
w<br>
+ * any domain (XSM notwithstanding) to send to the ring.<br>
+ *<br>
+ * The second argument is an array of guest frame numbers and the third ar=
gument<br>
+ * indicates the size of the array. This operation only supports 4K-sized =
pages.<br>
+ *<br>
+ * arg1: XEN_GUEST_HANDLE(xen_argo_register_ring_t)<br>
+ * arg2: XEN_GUEST_HANDLE(xen_argo_gfn_t)<br>
+ * arg3: unsigned long npages<br>
+ * arg4: unsigned long flags (32-bit value)<br>
+ */<br>
+#define XEN_ARGO_OP_register_ring=C2=A0 =C2=A0 =C2=A01<br>
+<br>
+/* Register op flags */<br>
+/*<br>
+ * Fail exist:<br>
+ * If set, reject attempts to (re)register an existing established ring.<b=
r>
+ * If clear, reregistration occurs if the ring exists, with the new ring<b=
r>
+ * taking the place of the old, preserving tx_ptr if it remains valid.<br>
+ */<br>
+#define XEN_ARGO_REGISTER_FLAG_FAIL_EXIST=C2=A0 0x1<br>
+<br>
+#ifdef __XEN__<br>
+/* Mask for all defined flags. */<br>
+#define XEN_ARGO_REGISTER_FLAG_MASK XEN_ARGO_REGISTER_FLAG_FAIL_EXIST<br>
+#endif<br>
+<br>
+/*<br>
+ * XEN_ARGO_OP_unregister_ring<br>
+ *<br>
+ * Unregister a previously-registered ring, ending communication.<br>
+ *<br>
+ * arg1: XEN_GUEST_HANDLE(xen_argo_unregister_ring_t)<br>
+ * arg2: NULL<br>
+ * arg3: 0 (ZERO)<br>
+ * arg4: 0 (ZERO)<br>
+ */<br>
+#define XEN_ARGO_OP_unregister_ring=C2=A0 =C2=A0 =C2=A02<br>
+<br>
+/*<br>
+ * XEN_ARGO_OP_sendv<br>
+ *<br>
+ * Send a list of buffers contained in iovs.<br>
+ *<br>
+ * The send address struct specifies the source and destination addresses<=
br>
+ * for the message being sent, which are used to find the destination ring=
:<br>
+ * Xen first looks for a most-specific match with a registered ring with<b=
r>
+ *=C2=A0 (id.addr =3D=3D dst) and (id.partner =3D=3D sending_domain) ;<br>
+ * if that fails, it then looks for a wildcard match (aka multicast receiv=
er)<br>
+ * where (id.addr =3D=3D dst) and (id.partner =3D=3D DOMID_ANY).<br>
+ *<br>
+ * For each iov entry, send iov_len bytes from iov_base to the destination=
 ring.<br>
+ * If insufficient space exists in the destination ring, it will return -E=
AGAIN<br>
+ * and Xen will notify the caller when sufficient space becomes available.=
<br>
+ *<br>
+ * The message type is a 32-bit data field available to communicate messag=
e<br>
+ * context data (eg. kernel-to-kernel, rather than application layer).<br>
+ *<br>
+ * arg1: XEN_GUEST_HANDLE(xen_argo_send_addr_t) source and dest addresses<=
br>
+ * arg2: XEN_GUEST_HANDLE(xen_argo_iov_t) iovs<br>
+ * arg3: unsigned long niov<br>
+ * arg4: unsigned long message type (32-bit value)<br>
+ */<br>
+#define XEN_ARGO_OP_sendv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A03<br>
+<br>
+/*<br>
+ * XEN_ARGO_OP_notify<br>
+ *<br>
+ * Asks Xen for information about other rings in the system.<br>
+ *<br>
+ * ent-&gt;ring is the xen_argo_addr_t of the ring you want information on=
.<br>
+ * Uses the same ring matching rules as XEN_ARGO_OP_sendv.<br>
+ *<br>
+ * ent-&gt;space_required : if this field is not null then Xen will check<=
br>
+ * that there is space in the destination ring for this many bytes of payl=
oad.<br>
+ * If the ring is too small for the requested space_required, it will set =
the<br>
+ * XEN_ARGO_RING_EMSGSIZE flag on return.<br>
+ * If sufficient space is available, it will set XEN_ARGO_RING_SUFFICIENT<=
br>
+ * and CANCEL any pending notification for that ent-&gt;ring; otherwise it=
<br>
+ * will schedule a notification event and the flag will not be set.<br>
+ *<br>
+ * These flags are set by Xen when notify replies:<br>
+ * XEN_ARGO_RING_EXISTS=C2=A0 =C2=A0 =C2=A0ring exists<br>
+ * XEN_ARGO_RING_SHARED=C2=A0 =C2=A0 =C2=A0ring is registered for wildcard=
 partner<br>
+ * XEN_ARGO_RING_EMPTY=C2=A0 =C2=A0 =C2=A0 ring is empty<br>
+ * XEN_ARGO_RING_SUFFICIENT sufficient space for space_required is there<b=
r>
+ * XEN_ARGO_RING_EMSGSIZE=C2=A0 =C2=A0space_required is too large for the =
ring size<br>
+ * XEN_ARGO_RING_EBUSY=C2=A0 =C2=A0 =C2=A0 too many domains waiting for av=
ailable space signals<br>
+ *<br>
+ * arg1: XEN_GUEST_HANDLE(xen_argo_ring_data_t) ring_data (may be NULL)<br=
>
+ * arg2: NULL<br>
+ * arg3: 0 (ZERO)<br>
+ * arg4: 0 (ZERO)<br>
+ */<br>
+#define XEN_ARGO_OP_notify=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 4<br>
+<br>
+#endif<br>
diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h<br>
index 0d33807..17975ba 100644<br>
--- a/include/xtf/hypercall.h<br>
+++ b/include/xtf/hypercall.h<br>
@@ -33,6 +33,7 @@<br>
=C2=A0extern uint8_t hypercall_page[PAGE_SIZE];<br>
<br>
=C2=A0/* All Xen ABI for includers convenience .*/<br>
+#include &lt;xen/argo.h&gt;<br>
=C2=A0#include &lt;xen/callback.h&gt;<br>
=C2=A0#include &lt;xen/elfnote.h&gt;<br>
=C2=A0#include &lt;xen/errno.h&gt;<br>
diff --git a/include/xtf/numbers.h b/include/xtf/numbers.h<br>
index f5c73b7..b0b2c1b 100644<br>
--- a/include/xtf/numbers.h<br>
+++ b/include/xtf/numbers.h<br>
@@ -52,6 +52,11 @@<br>
=C2=A0 */<br>
=C2=A0#define _u(v) ((unsigned long)(v))<br>
<br>
+/**<br>
+ * Round up a number to the next integer<br>
+ */<br>
+#define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))<br>
+<br>
=C2=A0#endif /* !__ASSEMBLY__ */<br>
=C2=A0#endif /* XTF_NUMBERS_H */<br>
<br>
diff --git a/tests/argo/Makefile b/tests/argo/Makefile<br>
new file mode 100644<br>
index 0000000..c6b3113<br>
--- /dev/null<br>
+++ b/tests/argo/Makefile<br>
@@ -0,0 +1,9 @@<br>
+include $(ROOT)/build/<a href=3D"http://common.mk" rel=3D"noreferrer" targ=
et=3D"_blank">common.mk</a><br>
+<br>
+NAME=C2=A0 =C2=A0 =C2=A0 :=3D argo<br>
+CATEGORY=C2=A0 :=3D in-development<br>
+TEST-ENVS :=3D $(ALL_ENVIRONMENTS)<br>
+<br>
+obj-perenv +=3D main.o<br>
+<br>
+include $(ROOT)/build/<a href=3D"http://gen.mk" rel=3D"noreferrer" target=
=3D"_blank">gen.mk</a><br>
diff --git a/tests/argo/main.c b/tests/argo/main.c<br>
new file mode 100644<br>
index 0000000..fa54aed<br>
--- /dev/null<br>
+++ b/tests/argo/main.c<br>
@@ -0,0 +1,353 @@<br>
+/**<br>
+ * @file tests/argo/main.c<br>
+ * @ref test-argo<br>
+ *<br>
+ * @page test-argo argo<br>
+ *<br>
+ * @todo Docs for test-argo<br>
+ *<br>
+ * @see tests/argo/main.c<br>
+ */<br>
+#include &lt;xtf.h&gt;<br>
+<br>
+const char test_title[] =3D &quot;Argo hypercall test&quot;;<br>
+<br>
+/*<br>
+ * The current Linux Argo driver has a default ring size of 32 4k pages,<b=
r>
+ * so follow that for the test ring size.<br>
+ */<br>
+static uint8_t ring_buffer[32 * PAGE_SIZE] __page_aligned_bss;<br>
+#define TEST_RING_NPAGES (sizeof(ring_buffer) / PAGE_SIZE)<br>
+<br>
+static int probe_for_argo(domid_t own_domid)<br>
+{<br>
+=C2=A0 =C2=A0 /* Attempt an Argo call to register a ring with invalid argu=
ments */<br>
+=C2=A0 =C2=A0 xen_argo_register_ring_t reg =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .aport=C2=A0 =C2=A0 =C2=A0 =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .partner_id =3D own_domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1, /* A 1-=
byte ring is never allowed */<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 int rc =3D hypercall_argo_op(XEN_ARGO_OP_register_ring, &amp=
;reg, NULL, 0, 0);<br>
+<br>
+=C2=A0 =C2=A0 switch ( rc )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 case -EINVAL: /* This is the response we are looking for */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All below here are test exit conditions */<=
br>
+=C2=A0 =C2=A0 case -ENOSYS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_skip(&quot;Skip: Argo support has not been=
 enabled in this hypervisor\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case -EOPNOTSUPP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_skip(&quot;Skip: Argo is not enabled at ru=
ntime for this hypervisor\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case -ENODEV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_skip(&quot;Skip: Argo is not enabled for t=
his domain\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case -EPERM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: ring registration by t=
his domain is not permitted\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: an invalid ring regist=
er op was not rejected\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: unknown error %d for i=
nvalid ring registration\n&quot;, rc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+/* notify: asks Xen for information about rings */<br>
+static int<br>
+test_notify_for_one_ring(domid_t query_domid, xen_argo_port_t query_port,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool exists)<br>
+{<br>
+=C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_argo_ring_data_t data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_argo_ring_data_ent_t ents[1];<br>
+=C2=A0 =C2=A0 } notify =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .nent =3D ARRAY_SIZE(notify.ents=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .ents =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ring =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dom=
ain_id =3D query_domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .apo=
rt=C2=A0 =C2=A0 =C2=A0=3D query_port,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 int rc =3D hypercall_argo_op(XEN_ARGO_OP_notify, &amp;notify=
, NULL, 0, 0);<br>
+<br>
+=C2=A0 =C2=A0 if ( rc )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Unexpected error code =
%d in notify test\n&quot;, rc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ( !exists )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No currently-defined flags should be set fo=
r a non-existent ring */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( notify.ents[0].flags )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Non-exis=
tent ring reported as existing\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !(notify.ents[0].flags &amp; XEN_ARGO_RIN=
G_EXISTS) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Ring not=
 reported as existing\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+/* See the Argo Linux device driver for similar use of these macros */<br>
+#define XEN_ARGO_ROUNDUP(x) roundup((x), XEN_ARGO_MSG_SLOT_SIZE)<br>
+#define ARGO_RING_OVERHEAD 80<br>
+#define TEST_RING_SIZE(npages)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 (XEN_ARGO_ROUNDUP((((PAGE_SIZE)*npages) - ARGO_RING_OVERHEAD=
)))<br>
+<br>
+static int<br>
+test_register_ring(domid_t own_domid, xen_argo_port_t aport)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int i;<br>
+=C2=A0 =C2=A0 xen_argo_register_ring_t reg =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .aport=C2=A0 =C2=A0 =C2=A0 =3D aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .partner_id =3D own_domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TEST_RING_=
SIZE(TEST_RING_NPAGES),<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 xen_argo_gfn_t gfns[TEST_RING_NPAGES];<br>
+<br>
+=C2=A0 =C2=A0 for ( i =3D 0; i &lt; TEST_RING_NPAGES; i++ )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfns[i] =3D virt_to_gfn(ring_buffer + (i * PAG=
E_SIZE));<br>
+<br>
+=C2=A0 =C2=A0 int rc =3D hypercall_argo_op(XEN_ARGO_OP_register_ring, &amp=
;reg, &amp;gfns,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST_RING_NPAGES, XEN_ARGO_REGISTER_F=
LAG_FAIL_EXIST);<br>
+=C2=A0 =C2=A0 switch ( rc )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+<br>
+=C2=A0 =C2=A0 case -ENODEV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Argo is not enabled fo=
r this domain\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case -EFAULT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Memory fault performin=
g register ring test\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Unexpected error code =
%d in register ring test\n&quot;, rc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+static int<br>
+test_unregister_ring(domid_t partner_domid, xen_argo_port_t aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bool exists)<br>
+{<br>
+=C2=A0 =C2=A0 xen_argo_register_ring_t unreg =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .aport=C2=A0 =C2=A0 =C2=A0 =3D aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .partner_id =3D partner_domid,<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 int rc =3D hypercall_argo_op(XEN_ARGO_OP_unregister_ring, &a=
mp;unreg, NULL, 0, 0);<br>
+<br>
+=C2=A0 =C2=A0 switch ( rc )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( exists )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: unexpected success unr=
egistering non-existent ring\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+<br>
+=C2=A0 =C2=A0 case -ENOENT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !exists )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: unexpected ring not fo=
und when unregistering \n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Unexpected error code =
%d in unregister ring test\n&quot;, rc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+static int<br>
+test_sendv(domid_t src_domid, xen_argo_port_t src_aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0domid_t dst_domid, xen_argo_port_=
t dst_aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *msg_text, size_t msg_=
len, unsigned int msg_type)<br>
+{<br>
+=C2=A0 =C2=A0 xen_argo_send_addr_t send_addr =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .domain_id =3D src_domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .aport=C2=A0 =C2=A0 =C2=A0=3D sr=
c_aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .dst =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .domain_id =3D dst_domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .aport=C2=A0 =C2=A0 =C2=A0=3D ds=
t_aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 xen_argo_iov_t iovs[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .iov_hnd =3D _u(msg_text),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .iov_len =3D msg_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 int rc =3D hypercall_argo_op(XEN_ARGO_OP_sendv, &amp;send_ad=
dr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iovs, ARRAY_SIZE(iovs), msg_type);<br=
>
+<br>
+=C2=A0 =C2=A0 if ( rc &lt; 0 )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Unexpected error code =
%d in sendv test\n&quot;, rc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ( (size_t)rc !=3D msg_len )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: Unexpected message siz=
e %d written in sendv test\n&quot;, rc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int<br>
+inspect_ring_after_first_single_sendv(domid_t src_domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_argo_port_t=
 src_aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *sen=
t_msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int se=
nt_msg_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int se=
nt_msg_type)<br>
+{<br>
+=C2=A0 =C2=A0 int rc =3D 0;<br>
+=C2=A0 =C2=A0 xen_argo_ring_t *ringp =3D (xen_argo_ring_t *)ring_buffer;<b=
r>
+=C2=A0 =C2=A0 struct xen_argo_ring_message_header *msg_hdr;<br>
+=C2=A0 =C2=A0 unsigned int sent_length;<br>
+<br>
+=C2=A0 =C2=A0 if ( ringp-&gt;rx_ptr !=3D 0 )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: receive pointer non-ze=
ro after sendv: %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ring=
p-&gt;rx_ptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ( ringp-&gt;tx_ptr !=3D XEN_ARGO_ROUNDUP(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct xen_argo_rin=
g_message_header) + sent_msg_len) )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: transmit pointer incor=
rect after sendv: %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ring=
p-&gt;rx_ptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 msg_hdr =3D (struct xen_argo_ring_message_header *)&amp;(rin=
gp-&gt;ring);<br>
+<br>
+=C2=A0 =C2=A0 if ( msg_hdr-&gt;source.domain_id !=3D src_domid )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: source domain id incor=
rect: %u, expected %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_=
hdr-&gt;source.domain_id, src_domid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ( msg_hdr-&gt;source.aport !=3D src_aport )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: source domain port inc=
orrect: %u, expected %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_=
hdr-&gt;source.domain_id, src_aport);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ( msg_hdr-&gt;source.pad !=3D 0 )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: source padding incorre=
ct: %u, expected zero\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_=
hdr-&gt;source.pad);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ( sent_msg_type !=3D msg_hdr-&gt;message_type )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: message type incorrect=
: %u sent, %u received\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sent=
_msg_type, msg_hdr-&gt;message_type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sent_length =3D sent_msg_len + sizeof(struct xen_argo_ring_m=
essage_header);<br>
+=C2=A0 =C2=A0 if ( sent_length !=3D msg_hdr-&gt;len )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: received message lengt=
h incorrect: &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;%u sent is %u with header added, %u received\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sent=
_msg_len, sent_length, msg_hdr-&gt;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ( strncmp((const char *)msg_hdr-&gt;data, sent_msg, sent_=
msg_len) )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xtf_failure(&quot;Fail: sent message got mangl=
ed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return rc;<br>
+}<br>
+<br>
+static void clear_test_ring(void)<br>
+{<br>
+=C2=A0 =C2=A0 memset(ring_buffer, 0, sizeof(ring_buffer));<br>
+}<br>
+<br>
+void test_main(void)<br>
+{<br>
+=C2=A0 =C2=A0 int own_domid;<br>
+=C2=A0 =C2=A0 xen_argo_port_t test_aport =3D 1;<br>
+=C2=A0 =C2=A0 const char simple_text[] =3D &quot;a simple thing to send\n&=
quot;;<br>
+=C2=A0 =C2=A0 const unsigned int msg_type =3D 0x12345678;<br>
+<br>
+=C2=A0 =C2=A0 own_domid =3D xtf_get_domid();<br>
+=C2=A0 =C2=A0 if ( own_domid &lt; 0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return xtf_error(&quot;Error: could not determ=
ine domid of the test domain\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 /* First test validates for Argo availability to gate furthe=
r testing */<br>
+=C2=A0 =C2=A0 if ( probe_for_argo(own_domid) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+<br>
+=C2=A0 =C2=A0 if ( test_notify_for_one_ring(own_domid, test_aport, false) =
||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_unregister_ring(own_domid, test_apo=
rt, false) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+<br>
+=C2=A0 =C2=A0 clear_test_ring();<br>
+<br>
+=C2=A0 =C2=A0 if ( test_register_ring(own_domid, test_aport) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_notify_for_one_ring(own_domid, test=
_aport, true) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_unregister_ring(own_domid, test_apo=
rt, true) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_notify_for_one_ring(own_domid, test=
_aport, false) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_unregister_ring(own_domid, test_apo=
rt, false) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+<br>
+=C2=A0 =C2=A0 clear_test_ring();<br>
+<br>
+=C2=A0 =C2=A0 if ( test_register_ring(own_domid, test_aport) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_sendv(own_domid, test_aport, own_do=
mid, test_aport,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 simp=
le_text, strlen(simple_text), msg_type) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inspect_ring_after_first_single_sendv(<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0own_domid, test_aport, sim=
ple_text, strlen(simple_text), msg_type) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_notify_for_one_ring(own_domid, test=
_aport, true) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_unregister_ring(own_domid, test_apo=
rt, true) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_unregister_ring(own_domid, test_apo=
rt, false) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+<br>
+=C2=A0 =C2=A0 xtf_success(NULL);<br>
+}<br>
+<br>
+/*<br>
+ * Local variables:<br>
+ * mode: C<br>
+ * c-file-style: &quot;BSD&quot;<br>
+ * c-basic-offset: 4<br>
+ * tab-width: 4<br>
+ * indent-tabs-mode: nil<br>
+ * End:<br>
+ */<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000d9d4c606364d3838--

