Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64AECFAC65
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 20:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196462.1514274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdD21-0004zM-JO; Tue, 06 Jan 2026 19:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196462.1514274; Tue, 06 Jan 2026 19:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdD21-0004xJ-GT; Tue, 06 Jan 2026 19:47:53 +0000
Received: by outflank-mailman (input) for mailman id 1196462;
 Tue, 06 Jan 2026 19:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=feBW=7L=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vdD20-0004wx-6c
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 19:47:52 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944edfd0-eb38-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 20:47:49 +0100 (CET)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-8887f43b224so16144576d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 11:47:49 -0800 (PST)
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
X-Inumbo-ID: 944edfd0-eb38-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728868; x=1768333668; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pntXy9Hj0WqvRGVZav4oj27VTA9+7WcxJK6ERgbcGK8=;
        b=ZDaZ4RmPIURtIIImM+ZQZgpEfTCloZQAiGZ2yEpjOuVLT809UcuuqlMq1S/IxvoOhC
         6YKaejwZtEaTfDgBAWgtkotoVsVVhC4Lgr/V87TKcXgilWTjmNtWDGCmh7NdRuJsV2VX
         EXu+vnpAlRSKk/ZjuV3poz2i2i+LLeSgx1+A9yEGNYlgWzaHLzi9aKVj8jBt7G0BGP9x
         8Ql9Z5DQT4RNsb+vvtIqKS3PA1cUNzcxxBpkjZZQZukRTX/Rtg3t/gqLYiuLtavuHrdE
         uHygjsIfKVEKwkk5wZSTCCtG4TogHuVbyxW/Dn1RoQ4Am7azcM0/iLCwx9PRGKrT+U0o
         GdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728868; x=1768333668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pntXy9Hj0WqvRGVZav4oj27VTA9+7WcxJK6ERgbcGK8=;
        b=ThZs0mbWue2D3hXz5w7X8d4vIJ0sSx/FSgIyGDFDoDctKg1K8iupJfjIHAXz6vOGWw
         MBp3wvdmjCWKPGqkvyBlxU1sTcpvpRg8P3HBaKLRrduCmrz2NeuYddECvSZB0o+b1ICu
         1VFAKs5sFKCILFrLpuoAFkOdfzYw/yE+N337zQqj6YAcfSxojO3gpolwdhr2yieO8DZJ
         JUc9Y1kuz4E3hPZETY3L5G+VGanegFRSzRhmpXxuqnWg7J1M5brSdyhoqcIVJi1CwZPP
         vDdDsPeVdvFmuESRmkdwopJn5FPXlwRrNAFS6nOPFyk4qwFdrCw8BlXU2ab7hdbSERfa
         KFRw==
X-Forwarded-Encrypted: i=1; AJvYcCWg/2xxOKXCzMc/e4WgA67a7HfXWR2hYPfTG66LuHeKzajkZbpXfkCd03hBeQOGFntzklIV/cosGCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHPUAdlPUq+aPsllIfHqKeV2WXXBgmj/b81YRtZYxIHAJhAeZi
	+Etk/6wxgLqq4+p952WgoOBZCdzJ16jALj+BXxT2Ig0WvXEVcqmaL3ivO+abjXGqjKh4CcVZbno
	mqTCK40VVDWfY6OkQLQmHS1hcdMhD+6Q=
X-Gm-Gg: AY/fxX5bEZruvw8QT43Kel7bLZC4NsLPZKa2AhWVxTGVjVooRXhX4T0uW29WQolHXdp
	6zdCadVXNTZhHMv6YsI0gr3COvMq7jIKQk6YMMSyrbzOj4Cz9a7EIoS3/0fGBykrCcXh+ROZQyA
	wIsZGxmcwAkYoH0dbcgXYkEnpCgNxsPASACz4cDmocJ+R13IMJ1m6YGd/uhIwT5JBQA2gln+Iwh
	2VciBHGC0mDJS9KJtBQ/ob/abwzcUSpLwpcxKPy7obQcl3GwN2wSSNIA0KSfHwJYby25A==
X-Google-Smtp-Source: AGHT+IEsDozTTuOpHzQH0xjAygijM9mAO6rgCGg7RgPz/1lUD4/ZMIEqkH9QqpKy9eDQlYCqtEtPfalOfqOAQTgTldI=
X-Received: by 2002:a05:6214:622:b0:890:5973:a567 with SMTP id
 6a1803df08f44-890841e56d5mr1480896d6.12.1767728867862; Tue, 06 Jan 2026
 11:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal> <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal> <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
 <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
In-Reply-To: <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 Jan 2026 08:47:36 +1300
X-Gm-Features: AQt7F2rGhHEzeZcOruGijVOJFT9sChymTkhWX1JfhRWGcohbyfQWWuu1bqdVJW0
Message-ID: <CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
To: Robin Murphy <robin.murphy@arm.com>
Cc: Leon Romanovsky <leon@kernel.org>, catalin.marinas@arm.com, m.szyprowski@samsung.com, 
	will@kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 8:12=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2026-01-06 6:41 pm, Barry Song wrote:
> > On Mon, Dec 29, 2025 at 3:50=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
> >>
> >> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
> >>> On Sun, Dec 28, 2025 at 9:09=E2=80=AFAM Leon Romanovsky <leon@kernel.=
org> wrote:
> >>>>
> >>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> >>>>> From: Barry Song <baohua@kernel.org>
> >>>>>
> >>>>> Instead of performing a flush per SG entry, issue all cache
> >>>>> operations first and then flush once. This ultimately benefits
> >>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> >>>>>
> >>>>> Cc: Leon Romanovsky <leon@kernel.org>
> >>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >>>>> Cc: Will Deacon <will@kernel.org>
> >>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>> Cc: Robin Murphy <robin.murphy@arm.com>
> >>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> >>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
> >>>>> Cc: Marc Zyngier <maz@kernel.org>
> >>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> >>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>>>> Cc: Suren Baghdasaryan <surenb@google.com>
> >>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> >>>>> Signed-off-by: Barry Song <baohua@kernel.org>
> >>>>> ---
> >>>>>   kernel/dma/direct.c | 14 +++++++-------
> >>>>>   1 file changed, 7 insertions(+), 7 deletions(-)
> >>>>
> >>>> <...>
> >>>>
> >>>>> -             if (!dev_is_dma_coherent(dev)) {
> >>>>> +             if (!dev_is_dma_coherent(dev))
> >>>>>                        arch_sync_dma_for_device(paddr, sg->length,
> >>>>>                                        dir);
> >>>>> -                     arch_sync_dma_flush();
> >>>>> -             }
> >>>>>        }
> >>>>> +     if (!dev_is_dma_coherent(dev))
> >>>>> +             arch_sync_dma_flush();
> >>>>
> >>>> This patch should be squashed into the previous one. You introduced
> >>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
> >>>
> >>> Hi Leon,
> >>>
> >>> The previous patch replaces all arch_sync_dma_for_* calls with
> >>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
> >>> functional change. The subsequent patches then implement the
> >>> actual batching. I feel this is a better approach for reviewing
> >>> each change independently. Otherwise, the previous patch would
> >>> be too large.
> >>
> >> Don't worry about it. Your patches are small enough.
> >
> > My hardware does not require a bounce buffer, but I am concerned that
> > this patch may be incorrect for systems that do require one.
> >
> > Now it is:
> >
> > void dma_direct_sync_sg_for_cpu(struct device *dev,
> >                  struct scatterlist *sgl, int nents, enum dma_data_dire=
ction dir)
> > {
> >          struct scatterlist *sg;
> >          int i;
> >
> >          for_each_sg(sgl, sg, nents, i) {
> >                  phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(=
sg));
> >
> >                  if (!dev_is_dma_coherent(dev))
> >                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
> >
> >                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, di=
r);
> >
> >                  if (dir =3D=3D DMA_FROM_DEVICE)
> >                          arch_dma_mark_clean(paddr, sg->length);
> >          }
> >
> >          if (!dev_is_dma_coherent(dev)) {
> >                  arch_sync_dma_flush();
> >                  arch_sync_dma_for_cpu_all();
> >          }
> > }
> >
> > Should we call swiotlb_sync_single_for_cpu() and
> > arch_dma_mark_clean() after the flush to ensure the CPU sees the
> > latest data and that the memcpy is correct? I mean:
>
> Yes, this and the equivalents in the later patches are broken for all
> the sync_for_cpu and unmap paths which may end up bouncing (beware some
> of them get a bit fiddly) - any cache maintenance *must* be completed
> before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 thing,
> and appears to be entirely dead now.

Thanks, Robin. Personally, I would prefer an approach like the one below=E2=
=80=94
that is, not optimizing the bounce buffer cases, as they are already slow
due to hardware limitations with memcpy, and optimizing them would make
the code quite messy.

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

I=E2=80=99d like to check with you, Leon, and Marek on your views about thi=
s.

Thanks
Barry

