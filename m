Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B62CFA3F9
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 19:43:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196400.1514223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdC0V-0003iw-6s; Tue, 06 Jan 2026 18:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196400.1514223; Tue, 06 Jan 2026 18:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdC0V-0003go-3U; Tue, 06 Jan 2026 18:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1196400;
 Tue, 06 Jan 2026 18:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=feBW=7L=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vdC0T-0003gi-KB
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 18:42:13 +0000
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [2607:f8b0:4864:20::a35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 692fda02-eb2f-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 19:42:11 +0100 (CET)
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-55b26461e78so378177e0c.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 10:42:11 -0800 (PST)
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
X-Inumbo-ID: 692fda02-eb2f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724930; x=1768329730; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIXoBgSYkP/sd1BWOcNCLESjfDQLcEW6GaW2Kbu8M0A=;
        b=hMZnsy9DVqeMNmruFPZPrxXb2LakZ7LLMiI8vAw1wckJNqciu9MjIqzJhhr5uJxJK7
         aui2rIJ6jsi0xiuNWTVPiT2NCxckQvIab0VIBnRO1x2ew5KM627xW3KTge8x83WTCztk
         xi9USpZ6yWoI44w2CcxC6xVhNxR682yXGwdBJNJ0AWxKVMDGK05weGv5iPmXm1soKrlf
         Pp0GWth6ljjKL9z6zex3CNhee9a5DGxU3OSHXLmZgu+RR3mtmqbQzgKUfCZ0W5ucTrSa
         lhCcSwCGYTNci5KXbOMCU+3AbYqeVhjqh5MSUfpwMEuTEUVpZX7qXFt8GBHHzwdMfZwI
         3mLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724930; x=1768329730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIXoBgSYkP/sd1BWOcNCLESjfDQLcEW6GaW2Kbu8M0A=;
        b=ZHvIkMl36Jaxl5RqABsRTNuEMqLtMHmfoau0cDykFtEDSbbJyJMusVFknDz5a05v4X
         p8Z5Uv78zuZ5eJnDv638ndV2avKLwjTPy5l85Vsl3vZ9twqGXXJt2HGbqFsYnDK4PVSm
         8UYBik3fo8HClRQ8K5+iG/yfAf1Kh90lcKbzQMgDTPvW0XMpk0G6GdCq6q2kXB00Jwe7
         kTufbMHNgcDywV5A9UASghit4/Cl0+0hAUr5PHpueAbfdC3/iKbVbwQKPviMXizI5Ixn
         M5cO/FfZfSXHOh9U5ZHFM9l/xHJtJEAzf9R6n5fmzjLEPvuJiVOdrpuPP36IeZBMMC8g
         /Buw==
X-Forwarded-Encrypted: i=1; AJvYcCVkknHWuLVH4CJCQi3ZN2NxqcSZzfGrUZY/s1QjMdLHgxpAA3/7Ni4TsF4EIpc2+ilBh7PeRPQr3Pk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEgrk3kwxjHFeT7nGgzwY9jB9MAj3VLTuNVTqTcrOZ/B0vZMwa
	U9f50tm4QUNw52mK1IzG2m9V85hg8WbRqy5392x2HD49cRd7Z/up/+OJBuJwBbCrVPp4mAEWndD
	MQbW+PzWtNWCcZXRLk/3dndyOtvm5Td8=
X-Gm-Gg: AY/fxX5NbIuQVULmnkJYAN3CJkoPYwyZWz/zV2wmTHWZEp7wBvj5KsUiwh7hsYb1J5p
	kd8lO1vYiBQVQfuA29kYQFFLHzChCjXW4fladb+JbQ3AhEKq2kbMOQZOuvtRSeNZrIQIqg5h8oK
	8z/1UiynfvfNoOOocCviz6XObyVUZIP3aWh/vJQ8zWaXqnL7cjFadypiLPBg/+lqJI7l/afSnLp
	/7K6scdzi8KOVL6W7BKi0gc2tpYHminRwtpISt609KD/Y+8U1rrHyDl5TDfl2O8EJGD8A==
X-Google-Smtp-Source: AGHT+IGzdDZdJH61h073/MhkLoyFPUTEGFa4biMd35SsepoUxfnatinjaLQUW4RiSiTNL7sRRTPCzkdKJMTlCl0LUrk=
X-Received: by 2002:a05:6102:560f:b0:5df:aff3:c41c with SMTP id
 ada2fe7eead31-5ec744a174bmr1358450137.30.1767724928829; Tue, 06 Jan 2026
 10:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal> <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal>
In-Reply-To: <20251228145041.GS11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 Jan 2026 07:41:57 +1300
X-Gm-Features: AQt7F2qVpIXArh0HsV3sq1RKrv0OCVapLrZHo6-0eziWiogqpS6BzLG8_AyfAb8
Message-ID: <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
To: Leon Romanovsky <leon@kernel.org>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	will@kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 3:50=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
> > On Sun, Dec 28, 2025 at 9:09=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> > > > From: Barry Song <baohua@kernel.org>
> > > >
> > > > Instead of performing a flush per SG entry, issue all cache
> > > > operations first and then flush once. This ultimately benefits
> > > > __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> > > >
> > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > Cc: Will Deacon <will@kernel.org>
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > > ---
> > > >  kernel/dma/direct.c | 14 +++++++-------
> > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >
> > > <...>
> > >
> > > > -             if (!dev_is_dma_coherent(dev)) {
> > > > +             if (!dev_is_dma_coherent(dev))
> > > >                       arch_sync_dma_for_device(paddr, sg->length,
> > > >                                       dir);
> > > > -                     arch_sync_dma_flush();
> > > > -             }
> > > >       }
> > > > +     if (!dev_is_dma_coherent(dev))
> > > > +             arch_sync_dma_flush();
> > >
> > > This patch should be squashed into the previous one. You introduced
> > > arch_sync_dma_flush() there, and now you are placing it elsewhere.
> >
> > Hi Leon,
> >
> > The previous patch replaces all arch_sync_dma_for_* calls with
> > arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
> > functional change. The subsequent patches then implement the
> > actual batching. I feel this is a better approach for reviewing
> > each change independently. Otherwise, the previous patch would
> > be too large.
>
> Don't worry about it. Your patches are small enough.

My hardware does not require a bounce buffer, but I am concerned that
this patch may be incorrect for systems that do require one.

Now it is:

void dma_direct_sync_sg_for_cpu(struct device *dev,
                struct scatterlist *sgl, int nents, enum dma_data_direction=
 dir)
{
        struct scatterlist *sg;
        int i;

        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

                if (!dev_is_dma_coherent(dev))
                        arch_sync_dma_for_cpu(paddr, sg->length, dir);

                swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);

                if (dir =3D=3D DMA_FROM_DEVICE)
                        arch_dma_mark_clean(paddr, sg->length);
        }

        if (!dev_is_dma_coherent(dev)) {
                arch_sync_dma_flush();
                arch_sync_dma_for_cpu_all();
        }
}

Should we call swiotlb_sync_single_for_cpu() and
arch_dma_mark_clean() after the flush to ensure the CPU sees the
latest data and that the memcpy is correct? I mean:

void dma_direct_sync_sg_for_cpu(struct device *dev,
                struct scatterlist *sgl, int nents, enum dma_data_direction=
 dir)
{
        struct scatterlist *sg;
        int i;

        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

                if (!dev_is_dma_coherent(dev))
                        arch_sync_dma_for_cpu(paddr, sg->length, dir);
        }

        if (!dev_is_dma_coherent(dev)) {
                arch_sync_dma_flush();
                arch_sync_dma_for_cpu_all();
        }

        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

                swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);

                if (dir =3D=3D DMA_FROM_DEVICE)
                        arch_dma_mark_clean(paddr, sg->length);
        }
}

Could this be the same issue for dma_direct_unmap_sg()?

Another option is to not support batched synchronization for the bounce
buffer case, since it is rare. In that case, it could be:

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 550a1a13148d..a4840f7e8722 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -423,8 +423,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

-               if (!dev_is_dma_coherent(dev))
+               if (!dev_is_dma_coherent(dev)) {
                        arch_sync_dma_for_cpu(paddr, sg->length, dir);
+                       if (unlikely(dev->dma_io_tlb_mem))
+                               arch_sync_dma_flush();
+               }

                swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);

What=E2=80=99s your view on this, Leon?

Thanks
Barry

