Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C7B826D64
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 13:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663450.1033387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMoNs-0004eQ-KV; Mon, 08 Jan 2024 12:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663450.1033387; Mon, 08 Jan 2024 12:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMoNs-0004cF-Hq; Mon, 08 Jan 2024 12:05:36 +0000
Received: by outflank-mailman (input) for mailman id 663450;
 Mon, 08 Jan 2024 12:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6sC=IS=ffwll.ch=daniel.vetter@srs-se1.protection.inumbo.net>)
 id 1rMoNr-0004c9-2o
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 12:05:35 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b9c6a2-ae1e-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 13:05:32 +0100 (CET)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-204b216e4easo403926fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 04:05:32 -0800 (PST)
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
X-Inumbo-ID: 38b9c6a2-ae1e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1704715531; x=1705320331; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0ycSkS6Zak2ui1rQPyyxjJDorzRP8x1XQbB3KxyGEg=;
        b=Pc/EZ925R9wnFgmKbD+kUI7EjKBma8Ph3Lug0eTnlHU6eDKnrODLRZrm7nHZg1UNy3
         WS3OZCAjOpll6umHpg81ovV74h7PAOfOAQ/Ur7355lV9q0GVsoJR9ZdbowIL2lvSriBM
         b6YU1n10PNcSaWYL2EXhEE4dMwnqyKS0WT5r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704715531; x=1705320331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0ycSkS6Zak2ui1rQPyyxjJDorzRP8x1XQbB3KxyGEg=;
        b=V7Tfhb3COagLrjO6fWeaYOOXD2/iHNe7tU6aqWTJ0GfWLnHnFNqTeR69IWZfPfF/HX
         cw5zwFFzl+KEnr93ey7F9+y35qoixciYB1qLJT8o0hYfDGbdTj5KhezyPZxVBGefdawh
         05l5ARjmxBBBKPQ4LE/we6W39EXtLrJxBbxHbdIxXlwJO5LtBa7gZ+cvUtOLykDt5NBF
         IYMZE8kc1txLGkC4o8ciPBhzaeXK24E4ULqiL/z9cYhoJWwExAjsbVXnQFvLfv2+eQIF
         SLeDLtF+oLyGK17tFRo5me9bbdfXQbKjLc9XE9I9v/LQgefaKsyoLac230sL75nDFWba
         zkSw==
X-Gm-Message-State: AOJu0YxF1IC6aZWRgiMo8xC4oYJbvlpQ7g+TVuGFWE7TF4GffVXMI7x6
	2w7tx+8dhLk3BZYVdILkDQbo1K8gQvc4eVcijmGlc9Vcez77EQ==
X-Google-Smtp-Source: AGHT+IFzg0ncgiosaItJcS6EqUbmXIhJfdKj13esd/8B0OHht7SYAYuam+XXDGCU1LyVattVFje1kzEfWm/X5Nm9YOM=
X-Received: by 2002:a05:6870:c115:b0:204:9066:c34f with SMTP id
 f21-20020a056870c11500b002049066c34fmr6593653oad.5.1704715531309; Mon, 08 Jan
 2024 04:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20240107103426.2038075-1-olekstysh@gmail.com>
In-Reply-To: <20240107103426.2038075-1-olekstysh@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 8 Jan 2024 13:05:20 +0100
Message-ID: <CAKMK7uE07Uz-3yxH3+TNUEroKCobZ5xG+_HBPNWLOO0-cKAS+g@mail.gmail.com>
Subject: Re: [PATCH v2] xen/gntdev: Fix the abuse of underlying struct page in
 DMA-buf import
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 7 Jan 2024 at 11:35, Oleksandr Tyshchenko <olekstysh@gmail.com> wro=
te:
>
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> DO NOT access the underlying struct page of an sg table exported
> by DMA-buf in dmabuf_imp_to_refs(), this is not allowed.
> Please see drivers/dma-buf/dma-buf.c:mangle_sg_table() for details.
>
> Fortunately, here (for special Xen device) we can avoid using
> pages and calculate gfns directly from dma addresses provided by
> the sg table.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Please note, I didn't manage to test the patch against the latest master =
branch
> on real HW (patch was only build tested there). Patch was tested on Arm64
> guests using Linux v5.10.41 from vendor's BSP, this is the environment wh=
ere
> running this use-case is possible and to which I have an access (Xen PV d=
isplay
> with zero-copy and backend domain as a buffer provider - be-alloc=3D1, so=
 dma-buf
> import part was involved). A little bit old, but the dma-buf import code
> in gntdev-dmabuf.c hasn't been changed much since that time, all context
> remains allmost the same according to my code inspection.
>
>   v2:
>    - add R-b and A-b
>    - fix build warning noticed by kernel test robot by initializing
>      "ret" in case of error
>      https://lore.kernel.org/oe-kbuild-all/202401062122.it6zvLG0-lkp@inte=
l.com/
> ---
> ---
>  drivers/xen/gntdev-dmabuf.c | 44 ++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
> index 4440e626b797..272c0ab01ef5 100644
> --- a/drivers/xen/gntdev-dmabuf.c
> +++ b/drivers/xen/gntdev-dmabuf.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-direct.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> @@ -50,7 +51,7 @@ struct gntdev_dmabuf {
>
>         /* Number of pages this buffer has. */
>         int nr_pages;
> -       /* Pages of this buffer. */
> +       /* Pages of this buffer (only for dma-buf export). */
>         struct page **pages;
>  };
>
> @@ -484,7 +485,7 @@ static int dmabuf_exp_from_refs(struct gntdev_priv *p=
riv, int flags,
>  /* DMA buffer import support. */
>
>  static int
> -dmabuf_imp_grant_foreign_access(struct page **pages, u32 *refs,
> +dmabuf_imp_grant_foreign_access(unsigned long *gfns, u32 *refs,
>                                 int count, int domid)
>  {
>         grant_ref_t priv_gref_head;
> @@ -507,7 +508,7 @@ dmabuf_imp_grant_foreign_access(struct page **pages, =
u32 *refs,
>                 }
>
>                 gnttab_grant_foreign_access_ref(cur_ref, domid,
> -                                               xen_page_to_gfn(pages[i])=
, 0);
> +                                               gfns[i], 0);
>                 refs[i] =3D cur_ref;
>         }
>
> @@ -529,7 +530,6 @@ static void dmabuf_imp_end_foreign_access(u32 *refs, =
int count)
>
>  static void dmabuf_imp_free_storage(struct gntdev_dmabuf *gntdev_dmabuf)
>  {
> -       kfree(gntdev_dmabuf->pages);
>         kfree(gntdev_dmabuf->u.imp.refs);
>         kfree(gntdev_dmabuf);
>  }
> @@ -549,12 +549,6 @@ static struct gntdev_dmabuf *dmabuf_imp_alloc_storag=
e(int count)
>         if (!gntdev_dmabuf->u.imp.refs)
>                 goto fail;
>
> -       gntdev_dmabuf->pages =3D kcalloc(count,
> -                                      sizeof(gntdev_dmabuf->pages[0]),
> -                                      GFP_KERNEL);
> -       if (!gntdev_dmabuf->pages)
> -               goto fail;
> -
>         gntdev_dmabuf->nr_pages =3D count;
>
>         for (i =3D 0; i < count; i++)
> @@ -576,7 +570,8 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, s=
truct device *dev,
>         struct dma_buf *dma_buf;
>         struct dma_buf_attachment *attach;
>         struct sg_table *sgt;
> -       struct sg_page_iter sg_iter;
> +       struct sg_dma_page_iter sg_iter;
> +       unsigned long *gfns;
>         int i;
>
>         dma_buf =3D dma_buf_get(fd);
> @@ -624,26 +619,25 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv,=
 struct device *dev,
>
>         gntdev_dmabuf->u.imp.sgt =3D sgt;
>
> -       /* Now convert sgt to array of pages and check for page validity.=
 */
> +       gfns =3D kcalloc(count, sizeof(*gfns), GFP_KERNEL);
> +       if (!gfns) {
> +               ret =3D ERR_PTR(-ENOMEM);
> +               goto fail_unmap;
> +       }
> +
> +       /* Now convert sgt to array of gfns without accessing underlying =
pages. */
>         i =3D 0;
> -       for_each_sgtable_page(sgt, &sg_iter, 0) {
> -               struct page *page =3D sg_page_iter_page(&sg_iter);
> -               /*
> -                * Check if page is valid: this can happen if we are give=
n
> -                * a page from VRAM or other resources which are not back=
ed
> -                * by a struct page.
> -                */
> -               if (!pfn_valid(page_to_pfn(page))) {
> -                       ret =3D ERR_PTR(-EINVAL);
> -                       goto fail_unmap;
> -               }
> +       for_each_sgtable_dma_page(sgt, &sg_iter, 0) {

Maybe add a comment here to explain why this is done and why it's ok?
Either way:

Acked-by: Daniel Vetter <daniel@ffwll.ch>


> +               dma_addr_t addr =3D sg_page_iter_dma_address(&sg_iter);
> +               unsigned long pfn =3D bfn_to_pfn(XEN_PFN_DOWN(dma_to_phys=
(dev, addr)));
>
> -               gntdev_dmabuf->pages[i++] =3D page;
> +               gfns[i++] =3D pfn_to_gfn(pfn);
>         }
>
> -       ret =3D ERR_PTR(dmabuf_imp_grant_foreign_access(gntdev_dmabuf->pa=
ges,
> +       ret =3D ERR_PTR(dmabuf_imp_grant_foreign_access(gfns,
>                                                       gntdev_dmabuf->u.im=
p.refs,
>                                                       count, domid));
> +       kfree(gfns);
>         if (IS_ERR(ret))
>                 goto fail_end_access;
>
> --
> 2.34.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

