Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E73A66EC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141418.261227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsm0B-0006Vr-FU; Mon, 14 Jun 2021 12:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141418.261227; Mon, 14 Jun 2021 12:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsm0B-0006Tu-CA; Mon, 14 Jun 2021 12:47:39 +0000
Received: by outflank-mailman (input) for mailman id 141418;
 Mon, 14 Jun 2021 12:47:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ADML=LI=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1lsm09-0006Tg-SX
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:47:37 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b99f9e50-6e2b-486e-8853-e88b39b66002;
 Mon, 14 Jun 2021 12:47:37 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k8so3090363lja.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 05:47:37 -0700 (PDT)
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
X-Inumbo-ID: b99f9e50-6e2b-486e-8853-e88b39b66002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QUObwUNWvgk8Ic1w7m2h32Aq1YfuXrxksajQxqaMrIs=;
        b=rj6ZqtY0hWRNdi47dSpXnG5VlOgr15kVbYhmu6VWU8u6FjoktZ8tvzKvzlkPnDP+pV
         XO3nhrT0y6qyTJZjPH5sSQnLiK2So2RyVxzuj8bZTSrohk/KJTgF8P077y+Fvbm3p3MS
         adrMOeNBlgRIAQ8M4JksRyHAk91ctiTVHRxKE+Ysd4cv7fxq0GrTjF2zot+++owhWgOZ
         akrE4+2kZBZEEm5a4N3TOZdjIGXh/Ipfb6XTfSeGKR/mE8wojx+WFi//AUD6f13s38T+
         dh0ynmjkc4C4o/Er1BLAEQaXeS2zTdDzm++TKc2dXCS2gvmp9hROmv+KiK5rYRK9W/Lu
         mMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QUObwUNWvgk8Ic1w7m2h32Aq1YfuXrxksajQxqaMrIs=;
        b=ovN12n/ebWAg5TXy4rEVmSpTWZCB/HJF1pIBKOrJ6q1eJLBvTMjcA/gG5+UyTKJCxn
         jnsOkQ8YIVQi0vFQyMSeLu4TwoTDadGAPoAv+MbgVBote+YHM8YUqyaEzhMLbf3NCrjg
         fFJGCjJclFRUyqOtqxVnpfSjcgnJ5HWtL1eAhN24j+mLIHzhJTcsqgFKAJfQ3ld2lwAv
         RaxOFn7e1tCR78BMRa7o15/T6vAfxOqjBgeQ40H08QfbIyguo+fZFznMZ6XljomfAo6B
         FAjSmKhji6nwHhkgYhTcZ4ix0TWkGEcBpWUEbUZa5b0zQv3I04fuGZr7CnWAQbNIxmyd
         jipg==
X-Gm-Message-State: AOAM532qHJeq1J2LiTCYOMaKsTaU/J3MemotVDDweGSVUJqgB1EqCf15
	n/HB4TAfGe43dly9B05cfZBe3feN1wQC3t2SrMs=
X-Google-Smtp-Source: ABdhPJxC86d8VXC4py9RRymEPfI5ESRE2fKe8HepltlfpWhz75a3A3JMLKsQJcx2NkZi9XGq2Uggz8yzDs460UQlrTk=
X-Received: by 2002:a2e:b8cc:: with SMTP id s12mr13710166ljp.66.1623674855928;
 Mon, 14 Jun 2021 05:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210611095528.9230-1-roman_skakun@epam.com> <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
In-Reply-To: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Mon, 14 Jun 2021 15:47:25 +0300
Message-ID: <CADu_u-MqALJkG8RJHrr65vC_sHu-UyvCGwwUfaBong0eir5+hQ@mail.gmail.com>
Subject: Re: [PATCH] swiotlb-xen: override common mmap and get_sgtable dma ops
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roman Skakun <roman_skakun@epam.com>, 
	Andrii Anisov <andrii_anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey, Boris!
Thanks for the review.

I have an additional question about current implementation that disturbed m=
e.
I think, that we can have cases when mapped memory can not be
physically contiguous.
In order to proceed this correctly need to apply some additional steps
to current implementation as well.

In mmap() :
1. Is the memory region physically contiguous?
2. Remap multiple ranges if it is not.

In get_sgtable() :
1. Is the memory region physically contiguous?
2. Create sgt that will be included multiple contiguous ranges if it is not=
.

What do you think about it?

Cheers!
Roman


=D0=BF=D1=82, 11 =D0=B8=D1=8E=D0=BD. 2021 =D0=B3. =D0=B2 18:20, Boris Ostro=
vsky <boris.ostrovsky@oracle.com>:
>
>
> On 6/11/21 5:55 AM, Roman Skakun wrote:
> >
> > +static int
> > +xen_swiotlb_dma_mmap(struct device *dev, struct vm_area_struct *vma,
> > +             void *cpu_addr, dma_addr_t dma_addr, size_t size,
> > +             unsigned long attrs)
> > +{
> > +     unsigned long user_count =3D vma_pages(vma);
> > +     unsigned long count =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
> > +     unsigned long off =3D vma->vm_pgoff;
> > +     struct page *page;
> > +
> > +     if (is_vmalloc_addr(cpu_addr))
> > +             page =3D vmalloc_to_page(cpu_addr);
> > +     else
> > +             page =3D virt_to_page(cpu_addr);
> > +
> > +     vma->vm_page_prot =3D dma_pgprot(dev, vma->vm_page_prot, attrs);
> > +
> > +     if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
> > +             return -ENXIO;
> > +
> > +     if (off >=3D count || user_count > count - off)
> > +             return -ENXIO;
> > +
> > +     return remap_pfn_range(vma, vma->vm_start,
> > +                     page_to_pfn(page) + vma->vm_pgoff,
> > +                     user_count << PAGE_SHIFT, vma->vm_page_prot);
> > +}
>
>
> I suggest you create a helper for computing page value and then revert 92=
2659ea771b3fd728149262c5ea15608fab9719 and pass result of the helper instea=
d of cpu_addr. Here and in xen_swiotlb_dma_get_sgtable().
>
>
> And use this new helper in xen_swiotlb_free_coherent() too. I am curious =
though why this was not a problem when Stefano was looking at the problem t=
hat introduced this vmalloc check (i.e. 8b1e868f66076490189a36d984fcce286cd=
d6295). Stefano?
>
>
> -boris



--=20
Best Regards, Roman.

