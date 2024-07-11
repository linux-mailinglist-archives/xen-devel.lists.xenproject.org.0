Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAAD92EF90
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 21:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757675.1166782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRzLh-0007A2-CR; Thu, 11 Jul 2024 19:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757675.1166782; Thu, 11 Jul 2024 19:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRzLh-000772-89; Thu, 11 Jul 2024 19:21:01 +0000
Received: by outflank-mailman (input) for mailman id 757675;
 Thu, 11 Jul 2024 19:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hOEV=OL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRzLg-00076c-92
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 19:21:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b245b080-3fba-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 21:20:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77e85cb9b4so171772166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 12:20:56 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a872e0dsm278320166b.215.2024.07.11.12.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 12:20:54 -0700 (PDT)
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
X-Inumbo-ID: b245b080-3fba-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720725655; x=1721330455; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt+9J24bLbrNFdi7uERiynvKx90ubDvShMDwuacdRpQ=;
        b=OHp871hVHXHjqePI3IC+YUJStF9JVcGrkn8DZk60sfA/x/vv267B/HXk9cIWgKa+LX
         Qb/mb9Hs7w7upw7v/r+92gGu2TnFCc8SZba8l8yJbubNQl4bXp91m3WNWqRQRsKSIvZ6
         I5/I59Rph3YTjngOYUTW1qmnoMCXlLpocRuWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720725655; x=1721330455;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yt+9J24bLbrNFdi7uERiynvKx90ubDvShMDwuacdRpQ=;
        b=Cr4nJ1jBJ15pfx/9YlnrI8eJkRGd18GLAPxwl1QuNL6wDJ8D5V9mAO/CYyzecbeN/c
         lvLF5ehei0Sqj+FOmGKALNjznqO5nUBdFDHEFoxDeiQixawIy3mLoU/emnhzTKbOcL5Z
         ySOT6eYFMiMxkYn9GHYg34pGfPcgOcIn5Kpy3Ox2a9YuKZgkjdVMOf7RSigv+HJzvxip
         KX9VaNEMapiqF3XzHZ1u4LzV2h3PjHbbqfyl0XAWfSlChblWSAZT6nJBiuYlX7NMAwsq
         7LHB2Xgf0EPivQukuM3rcBa/k5G835Eotcl4c0Ssb6jj+1EMmi1IjRaDnLIGdfyvsf8H
         DA6w==
X-Forwarded-Encrypted: i=1; AJvYcCVhr47frmzj409w+bnYJ63SpLp30cwING8CiPHX8WCpvz3DsRmTb83ozd4FIALGH/4qo0e++EcSapXvMdsRNffu658oi5DbOIjHBUaUPfg=
X-Gm-Message-State: AOJu0Yy3xWRKKSUE7sgN9kS1GVE0FcLRfEDc36F94YyV55AyRs5+H0jp
	4vtjCWwnahqYb/aDFdlgPHL6Kg/hYzsv83Yi6df4eeC7HoUlh+WLgSIgqVwnbOA=
X-Google-Smtp-Source: AGHT+IGhcJfDzfbY9BTF7RWaTIae9tZpZ1Iutn7UiF6fe7lgHK/Jm8M3HTf5T5Kbgq7p4q09ieIzdw==
X-Received: by 2002:a17:906:e56:b0:a77:e7b9:fda0 with SMTP id a640c23a62f3a-a780b68a231mr561851166b.14.1720725655277;
        Thu, 11 Jul 2024 12:20:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jul 2024 20:20:53 +0100
Message-Id: <D2MYC4AEBUQZ.3DNOIV8LEE7F9@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC XEN PATCH v3 5/5] xen/public: Introduce PV-IOMMU hypercall
 interface
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <cover.1720703078.git.teddy.astie@vates.tech>
 <f9ae663df38acc0d330b7582dfaa7ac199746aca.1720703078.git.teddy.astie@vates.tech>
In-Reply-To: <f9ae663df38acc0d330b7582dfaa7ac199746aca.1720703078.git.teddy.astie@vates.tech>

On Thu Jul 11, 2024 at 3:04 PM BST, Teddy Astie wrote:
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
> ---
>  xen/common/Makefile           |   1 +
>  xen/common/pv-iommu.c         | 328 ++++++++++++++++++++++++++++++++++
>  xen/include/hypercall-defs.c  |   6 +
>  xen/include/public/pv-iommu.h | 114 ++++++++++++
>  xen/include/public/xen.h      |   1 +
>  5 files changed, 450 insertions(+)
>  create mode 100644 xen/common/pv-iommu.c
>  create mode 100644 xen/include/public/pv-iommu.h
>
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index f12a474d40..52ada89888 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -58,6 +58,7 @@ obj-y +=3D wait.o
>  obj-bin-y +=3D warning.init.o
>  obj-$(CONFIG_XENOPROF) +=3D xenoprof.o
>  obj-y +=3D xmalloc_tlsf.o
> +obj-y +=3D pv-iommu.o
> =20
>  obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma lz=
o unlzo unlz4 unzstd earlycpio,$(n).init.o)
> =20
> diff --git a/xen/common/pv-iommu.c b/xen/common/pv-iommu.c
> new file mode 100644
> index 0000000000..a94c0f1e1a
> --- /dev/null
> +++ b/xen/common/pv-iommu.c
> @@ -0,0 +1,328 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xen/common/pv_iommu.c
> + *
> + * PV-IOMMU hypercall interface.
> + */
> +
> +#include <xen/mm.h>
> +#include <xen/lib.h>
> +#include <xen/iommu.h>
> +#include <xen/sched.h>
> +#include <xen/pci.h>
> +#include <xen/guest_access.h>
> +#include <asm/p2m.h>
> +#include <asm/event.h>
> +#include <public/pv-iommu.h>
> +
> +#define PVIOMMU_PREFIX "[PV-IOMMU] "
> +
> +#define PVIOMMU_MAX_PAGES 256 /* Move to Kconfig ? */

It probably wants to be a cmdline argument, I think.

> +
> +/* Allowed masks for each sub-operation */
> +#define ALLOC_OP_FLAGS_MASK (0)
> +#define FREE_OP_FLAGS_MASK (IOMMU_TEARDOWN_REATTACH_DEFAULT)
> +
> +static int get_paged_frame(struct domain *d, gfn_t gfn, mfn_t *mfn,
> +                           struct page_info **page, int readonly)
> +{
> +    p2m_type_t p2mt;
> +
> +    *page =3D get_page_from_gfn(d, gfn_x(gfn), &p2mt,
> +                             (readonly) ? P2M_ALLOC : P2M_UNSHARE);
> +
> +    if ( !(*page) )
> +    {
> +        *mfn =3D INVALID_MFN;
> +        if ( p2m_is_shared(p2mt) )
> +            return -EINVAL;
> +        if ( p2m_is_paging(p2mt) )
> +        {
> +            p2m_mem_paging_populate(d, gfn);
> +            return -EIO;
> +        }
> +
> +        return -EPERM;

This is ambiguous with the other usage of EPERM.

> +    }
> +
> +    *mfn =3D page_to_mfn(*page);
> +
> +    return 0;
> +}
> +
> +static int can_use_iommu_check(struct domain *d)
> +{
> +    if ( !iommu_enabled )
> +    {
> +        printk(PVIOMMU_PREFIX "IOMMU is not enabled\n");
> +        return 0;
> +    }
> +
> +    if ( !is_hardware_domain(d) )
> +    {
> +        printk(PVIOMMU_PREFIX "Non-hardware domain\n");
> +        return 0;
> +    }
> +
> +    if ( !is_iommu_enabled(d) )
> +    {
> +        printk(PVIOMMU_PREFIX "IOMMU disabled for this domain\n");
> +        return 0;
> +    }
> +
> +    return 1;
> +}
> +
> +static long query_cap_op(struct pv_iommu_op *op, struct domain *d)
> +{
> +    op->cap.max_ctx_no =3D d->iommu.other_contexts.count;
> +    op->cap.max_nr_pages =3D PVIOMMU_MAX_PAGES;
> +    op->cap.max_iova_addr =3D (1LLU << 39) - 1; /* TODO: hardcoded 39-bi=
ts */
> +
> +    return 0;
> +}
> +
> +static long alloc_context_op(struct pv_iommu_op *op, struct domain *d)
> +{
> +    u16 ctx_no =3D 0;
> +    int status =3D 0;
> +
> +    status =3D iommu_context_alloc(d, &ctx_no, op->flags & ALLOC_OP_FLAG=
S_MASK);
> +
> +    if (status < 0)
> +        return status;
> +
> +    printk("Created context %hu\n", ctx_no);
> +
> +    op->ctx_no =3D ctx_no;
> +    return 0;
> +}
> +
> +static long free_context_op(struct pv_iommu_op *op, struct domain *d)
> +{
> +    return iommu_context_free(d, op->ctx_no,
> +                              IOMMU_TEARDOWN_PREEMPT | (op->flags & FREE=
_OP_FLAGS_MASK));
> +}
> +
> +static long reattach_device_op(struct pv_iommu_op *op, struct domain *d)
> +{
> +    struct physdev_pci_device dev =3D op->reattach_device.dev;
> +    device_t *pdev;
> +
> +    pdev =3D pci_get_pdev(d, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
> +
> +    if ( !pdev )
> +        return -ENOENT;
> +
> +    return iommu_reattach_context(d, d, pdev, op->ctx_no);
> +}
> +
> +static long map_pages_op(struct pv_iommu_op *op, struct domain *d)
> +{
> +    int ret =3D 0, flush_ret;
> +    struct page_info *page =3D NULL;
> +    mfn_t mfn;
> +    unsigned int flags;
> +    unsigned int flush_flags =3D 0;
> +    size_t i =3D 0;
> +
> +    if ( op->map_pages.nr_pages > PVIOMMU_MAX_PAGES )
> +        return -E2BIG;
> +
> +    if ( !iommu_check_context(d, op->ctx_no) )
> +        return -EINVAL;
> +
> +    //printk("Mapping gfn:%lx-%lx to dfn:%lx-%lx on %hu\n",
> +    //       op->map_pages.gfn, op->map_pages.gfn + op->map_pages.nr_pag=
es - 1,
> +    //       op->map_pages.dfn, op->map_pages.dfn + op->map_pages.nr_pag=
es - 1,
> +    //       op->ctx_no);
> +
> +    flags =3D 0;
> +
> +    if ( op->flags & IOMMU_OP_readable )
> +        flags |=3D IOMMUF_readable;
> +
> +    if ( op->flags & IOMMU_OP_writeable )
> +        flags |=3D IOMMUF_writable;
> +
> +    spin_lock(&dom_iommu(d)->lock);
> +
> +    for (i =3D 0; i < op->map_pages.nr_pages; i++)

This loop (and the unmap one) want to be bound by MIN(nr_pages, FOO), where=
  FOO
is some upper bound to the number of hypercalls we're willing to do in a si=
ngle
continuation. If case of reaching that high number, we should create a new
continuation and allow something else to run.

> +    {
> +        gfn_t gfn =3D _gfn(op->map_pages.gfn + i);
> +        dfn_t dfn =3D _dfn(op->map_pages.dfn + i);
> +
> +        /* Lookup pages struct backing gfn */
> +        ret =3D get_paged_frame(d, gfn, &mfn, &page, 0);
> +
> +        if ( ret )
> +            break;
> +
> +        /* Check for conflict with existing mappings */
> +        if ( !_iommu_lookup_page(d, dfn, &mfn, &flags, op->ctx_no) )
> +        {
> +            put_page(page);
> +            ret =3D -EADDRINUSE;
> +            break;
> +        }
> +
> +        ret =3D _iommu_map(d, dfn, mfn, 1, flags, &flush_flags, op->ctx_=
no);
> +
> +        if ( ret )
> +            break;
> +    }
> +
> +    flush_ret =3D _iommu_iotlb_flush(d, _dfn(op->map_pages.dfn),
> +                                   op->map_pages.nr_pages, flush_flags,
> +                                   op->ctx_no);
> +
> +    spin_unlock(&dom_iommu(d)->lock);
> +
> +    op->map_pages.mapped =3D i;
> +
> +    if ( flush_ret )
> +        printk("Flush operation failed (%d)\n", flush_ret);

I haven't looked at _iommu_iotlb_flush(), but a printk isn't good enough he=
re.
We want to set up a continuation to retry later, I think.

What might cause the error?

> +
> +    return ret;
> +}
> +
> +static long unmap_pages_op(struct pv_iommu_op *op, struct domain *d)
> +{
> +    mfn_t mfn;
> +    int ret =3D 0, flush_ret;
> +    unsigned int flags;
> +    unsigned int flush_flags =3D 0;
> +    size_t i =3D 0;
> +
> +    if ( op->unmap_pages.nr_pages > PVIOMMU_MAX_PAGES )
> +        return -E2BIG;
> +
> +    if ( !iommu_check_context(d, op->ctx_no) )
> +        return -EINVAL;
> +
> +    //printk("Unmapping dfn:%lx-%lx on %hu\n",
> +    //       op->unmap_pages.dfn, op->unmap_pages.dfn + op->unmap_pages.=
nr_pages - 1,
> +    //       op->ctx_no);
> +
> +    spin_lock(&dom_iommu(d)->lock);
> +
> +    for (i =3D 0; i < op->unmap_pages.nr_pages; i++)
> +    {
> +        dfn_t dfn =3D _dfn(op->unmap_pages.dfn + i);
> +
> +        /* Check if there is a valid mapping for this domain */
> +        if ( _iommu_lookup_page(d, dfn, &mfn, &flags, op->ctx_no) ) {
> +            ret =3D -ENOENT;
> +            break;
> +        }
> +
> +        ret =3D _iommu_unmap(d, dfn, 1, 0, &flush_flags, op->ctx_no);
> +
> +        if (ret)
> +            break;
> +
> +        /* Decrement reference counter */
> +        put_page(mfn_to_page(mfn));
> +    }
> +
> +    flush_ret =3D _iommu_iotlb_flush(d, _dfn(op->unmap_pages.dfn),
> +                                   op->unmap_pages.nr_pages, flush_flags=
,
> +                                   op->ctx_no);
> +
> +    spin_unlock(&dom_iommu(d)->lock);
> +
> +    op->unmap_pages.unmapped =3D i;
> +
> +    if ( flush_ret )
> +        printk("Flush operation failed (%d)\n", flush_ret);

Same as above.

> +
> +    return ret;
> +}
> +
> +static long lookup_page_op(struct pv_iommu_op *op, struct domain *d)
> +{
> +    mfn_t mfn;
> +    gfn_t gfn;
> +    unsigned int flags =3D 0;
> +
> +    if ( !iommu_check_context(d, op->ctx_no) )
> +        return -EINVAL;
> +
> +    /* Check if there is a valid BFN mapping for this domain */
> +    if ( iommu_lookup_page(d, _dfn(op->lookup_page.dfn), &mfn, &flags, o=
p->ctx_no) )
> +        return -ENOENT;
> +
> +    gfn =3D mfn_to_gfn(d, mfn);
> +    BUG_ON(gfn_eq(gfn, INVALID_GFN));
> +
> +    op->lookup_page.gfn =3D gfn_x(gfn);
> +
> +    return 0;
> +}
> +
> +long do_iommu_sub_op(struct pv_iommu_op *op)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( !can_use_iommu_check(d) )
> +        return -EPERM;

This checks should be split, imo.

```
    if ( !iommu_enabled || !is_iommu_enabled(d) )
        return -ENOTSUP;
    if ( !is_hardware_domain(d) )
        return -EPERM;
```

For the second, we probably want an XSM hook as well (or instead of, not su=
re).

> +
> +    switch ( op->subop_id )
> +    {
> +        case 0:
> +            return 0;

IOMMUOP_noop?

> +
> +        case IOMMUOP_query_capabilities:
> +            return query_cap_op(op, d);
> +
> +        case IOMMUOP_alloc_context:
> +            return alloc_context_op(op, d);
> +
> +        case IOMMUOP_free_context:
> +            return free_context_op(op, d);
> +
> +        case IOMMUOP_reattach_device:
> +            return reattach_device_op(op, d);
> +
> +        case IOMMUOP_map_pages:
> +            return map_pages_op(op, d);
> +
> +        case IOMMUOP_unmap_pages:
> +            return unmap_pages_op(op, d);
> +
> +        case IOMMUOP_lookup_page:
> +            return lookup_page_op(op, d);
> +
> +        default:
> +            return -EINVAL;
> +    }
> +}
> +
> +long do_iommu_op(XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    long ret =3D 0;
> +    struct pv_iommu_op op;
> +
> +    if ( unlikely(copy_from_guest(&op, arg, 1)) )
> +        return -EFAULT;
> +
> +    ret =3D do_iommu_sub_op(&op);
> +
> +    if ( ret =3D=3D -ERESTART )
> +        return hypercall_create_continuation(__HYPERVISOR_iommu_op, "h",=
 arg);
> +
> +    if ( unlikely(copy_to_guest(arg, &op, 1)) )
> +        return -EFAULT;
> +
> +    return ret;
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
> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> index 47c093acc8..4ba4480867 100644
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -209,6 +209,9 @@ hypfs_op(unsigned int cmd, const char *arg1, unsigned=
 long arg2, void *arg3, uns
>  #ifdef CONFIG_X86
>  xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
>  #endif
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +iommu_op(void *arg)
> +#endif
> =20
>  #ifdef CONFIG_PV
>  caller: pv64
> @@ -295,5 +298,8 @@ mca                                do       do       =
-        -        -
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>  paging_domctl_cont                 do       do       do       do       -
>  #endif
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +iommu_op                           do       do       do       do       -
> +#endif
> =20
>  #endif /* !CPPCHECK */
> diff --git a/xen/include/public/pv-iommu.h b/xen/include/public/pv-iommu.=
h
> new file mode 100644
> index 0000000000..45f9c44eb1
> --- /dev/null
> +++ b/xen/include/public/pv-iommu.h
> @@ -0,0 +1,114 @@
> +/* SPDX-License-Identifier: MIT */
> +/***********************************************************************=
*******
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
> +#define IOMMU_DEFAULT_CONTEXT (0)
> +

From the code, seems like "#define IOMMUOP_noop 0" is missing

> +/**
> + * Query PV-IOMMU capabilities for this domain.
> + */
> +#define IOMMUOP_query_capabilities    1
> +
> +/**
> + * Allocate an IOMMU context, the new context handle will be written to =
ctx_no.
> + */
> +#define IOMMUOP_alloc_context         2

Please, don't write to the header. It's an absolute pain to Rust-ify and hi=
ghly
unexpected when absolutely everything else will take that as an input param=
eter.

Provide the output as a dedicated OUT field in the alloc_context struct
instead.

> +
> +/**
> + * Destroy a IOMMU context.
> + * All devices attached to this context are reattached to default contex=
t.
> + *
> + * The default context can't be destroyed (0).
> + */
> +#define IOMMUOP_free_context          3
> +
> +/**
> + * Reattach the device to IOMMU context.
> + */
> +#define IOMMUOP_reattach_device       4
> +
> +#define IOMMUOP_map_pages             5
> +#define IOMMUOP_unmap_pages           6
> +
> +/**
> + * Get the GFN associated to a specific DFN.
> + */
> +#define IOMMUOP_lookup_page           7
> +
> +struct pv_iommu_op {
> +    uint16_t subop_id;
> +    uint16_t ctx_no;

Seeing how there's no polymorphism going on, why not put these on each stru=
ct?
Then each handler can take a pointer to each substruct and everything is a =
lot
safer.

> +
> +/**
> + * Create a context that is cloned from default.
> + * The new context will be populated with 1:1 mappings covering the enti=
re guest memory.
> + */
> +#define IOMMU_CREATE_clone (1 << 0)
> +
> +#define IOMMU_OP_readable (1 << 0)
> +#define IOMMU_OP_writeable (1 << 1)
> +    uint32_t flags;

This bitmap is used for different things in different subops, which highly
suggests it should be per-struct instead.

> +
> +    union {
> +        struct {

Can you move these out to be first-class structs rather than anon? In prett=
y
much the same way of the other major hypercall groups. I'd like to be able =
to
generate them from IDL like I intend to do with all others.

> +            uint64_t gfn;
> +            uint64_t dfn;

(a) I'd rather see descriptions in the missing gfn/dfn in various fields, a=
nd
more specifically IN/OUT tags everywhere (i.e: as in /* IN: Number of pages=
 to
map */).

(b) Any 64bit numbers in the external ABI must be uint64_aligned_t so the
alignment is 8 on 32bit architectures. I know this instance (and the others=
)
happen to be aligned in both cases, but still.

That said, either these are 32bit frame numbers or otherwise we're better o=
ff
using addresses instead.  It'd also be less confusing on systems with sever=
al
page sizes, and it'd be specially less confusing if an additional parameter=
 of
"order" or "page size" was added here.

> +            /* Number of pages to map */
> +            uint32_t nr_pages;
> +            /* Number of pages actually mapped after sub-op */
> +            uint32_t mapped;

A more helpful output might some kind of err_addr with the offending page. =
Then
the caller doesn't have to do arithmetic to print the error somewhere.

Furthermore, seeing how this is something that should not happen I'd be tem=
pted
to amend the spec to somehow roll back whatever we just did, but that could=
 be
tricky with big numbers in `nr_pages`.

> +        } map_pages;
> +
> +        struct {
> +            uint64_t dfn;
> +            /* Number of pages to unmap */
> +            uint32_t nr_pages;
> +            /* Number of pages actually unmapped after sub-op */
> +            uint32_t unmapped;
> +        } unmap_pages;
> +
> +        struct {
> +            struct physdev_pci_device dev;
> +        } reattach_device;
> +
> +        struct {
> +            uint64_t gfn;
> +            uint64_t dfn;
> +        } lookup_page;
> +
> +        struct {
> +            /* Maximum number of IOMMU context this domain can use. */
> +            uint16_t max_ctx_no;
> +            /* Maximum number of pages that can be modified in a single =
map/unmap operation. */
> +            uint32_t max_nr_pages;
> +            /* Maximum device address (iova) that the guest can use for =
mappings. */
> +            uint64_t max_iova_addr;
> +        } cap;
> +    };
> +};
> +
> +typedef struct pv_iommu_op pv_iommu_op_t;
> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_op_t);
> +
> +#endif
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


