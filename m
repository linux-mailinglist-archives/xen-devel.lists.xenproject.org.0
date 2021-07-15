Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FC3C99C1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 09:40:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156442.288698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3vyK-000150-Hw; Thu, 15 Jul 2021 07:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156442.288698; Thu, 15 Jul 2021 07:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3vyK-00012v-Eg; Thu, 15 Jul 2021 07:39:52 +0000
Received: by outflank-mailman (input) for mailman id 156442;
 Thu, 15 Jul 2021 07:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ppgx=MH=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1m3vyI-00012p-W9
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 07:39:51 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b626ffb6-afd2-4847-9d46-bc2f7d0359c9;
 Thu, 15 Jul 2021 07:39:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t17so8299868lfq.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jul 2021 00:39:50 -0700 (PDT)
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
X-Inumbo-ID: b626ffb6-afd2-4847-9d46-bc2f7d0359c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RbV1qy6tsLWfKrDuSsvc9bUACKfeR7Oc9sX7ozt1Vx0=;
        b=DLguvjWEMocTkdw1rblF0HMFSj1ky99nS7jKdXxcdsmfL5WNLppbK2a5L62XX7xpsU
         KEAP2P0+N6TYxa8X5G2v/a6subexhIk6QcKhffawY5rVpEeJ/JFyAFDDI/qo7pK6tVoV
         1pzXW3DX6bVdPzr6qJWa1AOHBSgfnGJKsis9mISoD7CMkttMkkBVJNdIYq+fn3JvACyK
         APZY+c579zDSUj7wTOA7ccCGu6iTZ6wi+hRorumUhXfY4IAMGie4l7IPFSyxOhyota72
         +RyQcWGfyszpsRdPe8UksD/iwFTivOa6I8587sKl68G8gmfoBlR3sQQ/bDG1DqBrps2N
         ZCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RbV1qy6tsLWfKrDuSsvc9bUACKfeR7Oc9sX7ozt1Vx0=;
        b=calj+eo5KBJpCvvNwD/uALs5yc+l0ujk9Gasn2TEfQ6OX0gVRIG3N6SCouyJpFTKUu
         KjQak4Gm7TMw4VbN6wnmza6238dbQltFOdbq7+TvpKFNbUaySVT8VMLSNkRN2RNUcpD7
         C85oL65BM8BMxsOXTnG4AJO6j9e7gil5IGBPaF7zRmlHR6k9DnEW91viMCwsnzZlDOo/
         jdmBMx5KyleAirHZ/GlPRZjhnCCYZHypnQX39+OCFver4mnQyhwarFOGdzj0230eOjrL
         mwQc15bw0Q3oex6QGuBSuhiYGyg0x3NCRvPjKmmm8Yaj6T2G8yPaj4vXT4Zwe/ZAX/lK
         XhJA==
X-Gm-Message-State: AOAM53319tlRyCw4IGvcGeIJIk8tPevEJeqBY+AozDlrzHsUI/0HnGK7
	vjjn/C1S7wdiB6TtCvMyVHpVkYqDcG2DqNhdAPg=
X-Google-Smtp-Source: ABdhPJzctcCKvkmJCdAvVZwAE6A94bEK5hPH90lNgU/YTADVTWx+ppiFHflOJl1Ygu8geOZO+p5upB7wdV/pJibMWgA=
X-Received: by 2002:a19:c1d5:: with SMTP id r204mr2381718lff.594.1626334788911;
 Thu, 15 Jul 2021 00:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210616154436.GA7619@lst.de> <20210622133414.132754-1-rm.skakun@gmail.com>
 <YO4si0to/XYximwM@fedora>
In-Reply-To: <YO4si0to/XYximwM@fedora>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Thu, 15 Jul 2021 10:39:38 +0300
Message-ID: <CADu_u-OMx6Pj4DQDoOsdh6aNAzYys-+R=o+OzHYtLm=nECgkyQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roman Skakun <roman_skakun@epam.com>, 
	Andrii Anisov <andrii_anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This looks like it wasn't picked up? Should it go in rc1?

Hi, Konrad!

This looks like an unambiguous bug, and should be in rc1.

Cheers!

=D1=81=D1=80, 14 =D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 03:15, Konrad Rzes=
zutek Wilk <konrad.wilk@oracle.com>:
>
> On Tue, Jun 22, 2021 at 04:34:14PM +0300, Roman Skakun wrote:
> > This commit is dedicated to fix incorrect conversion from
> > cpu_addr to page address in cases when we get virtual
> > address which allocated in the vmalloc range.
> > As the result, virt_to_page() cannot convert this address
> > properly and return incorrect page address.
> >
> > Need to detect such cases and obtains the page address using
> > vmalloc_to_page() instead.
> >
> > Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> > Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
> > ---
> > Hey!
> > Thanks for suggestions, Christoph!
> > I updated the patch according to your advice.
> > But, I'm so surprised because nobody catches this problem
> > in the common code before. It looks a bit strange as for me.
>
> This looks like it wasn't picked up? Should it go in rc1?
> >
> >
> >  kernel/dma/ops_helpers.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
> > index 910ae69cae77..782728d8a393 100644
> > --- a/kernel/dma/ops_helpers.c
> > +++ b/kernel/dma/ops_helpers.c
> > @@ -5,6 +5,14 @@
> >   */
> >  #include <linux/dma-map-ops.h>
> >
> > +static struct page *cpu_addr_to_page(void *cpu_addr)
> > +{
> > +     if (is_vmalloc_addr(cpu_addr))
> > +             return vmalloc_to_page(cpu_addr);
> > +     else
> > +             return virt_to_page(cpu_addr);
> > +}
> > +
> >  /*
> >   * Create scatter-list for the already allocated DMA buffer.
> >   */
> > @@ -12,7 +20,7 @@ int dma_common_get_sgtable(struct device *dev, struct=
 sg_table *sgt,
> >                void *cpu_addr, dma_addr_t dma_addr, size_t size,
> >                unsigned long attrs)
> >  {
> > -     struct page *page =3D virt_to_page(cpu_addr);
> > +     struct page *page =3D cpu_addr_to_page(cpu_addr);
> >       int ret;
> >
> >       ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > @@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_are=
a_struct *vma,
> >               return -ENXIO;
> >
> >       return remap_pfn_range(vma, vma->vm_start,
> > -                     page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgo=
ff,
> > +                     page_to_pfn(cpu_addr_to_page(cpu_addr)) + vma->vm=
_pgoff,
> >                       user_count << PAGE_SHIFT, vma->vm_page_prot);
> >  #else
> >       return -ENXIO;
> > --
> > 2.25.1
> >



--=20
Best Regards, Roman.

