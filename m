Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88ABCE021B
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 21:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193735.1512349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZbNt-0004EY-Kl; Sat, 27 Dec 2025 20:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193735.1512349; Sat, 27 Dec 2025 20:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZbNt-0004Cn-Hm; Sat, 27 Dec 2025 20:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1193735;
 Sat, 27 Dec 2025 20:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4j1x=7B=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZbNs-0004Ch-PD
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 20:59:32 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0625dc5-e366-11f0-b15c-2bf370ae4941;
 Sat, 27 Dec 2025 21:59:31 +0100 (CET)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4eda057f3c0so90591531cf.2
 for <xen-devel@lists.xenproject.org>; Sat, 27 Dec 2025 12:59:31 -0800 (PST)
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
X-Inumbo-ID: f0625dc5-e366-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766869170; x=1767473970; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYfo4DcmoDPGkLlBpUwQdj2xZvXjZDeunEqpnCANZoQ=;
        b=CZcj86lDLEoBLoRSNyKO8lJXD3HEMMTLcFGbk/lJHR1xvTKk/MtDGPFbPP1+25WeWp
         ajTGhGqbV9k5lUjuiYZevAs6sfRfuHVlv5Eqv7vYivAkEeeABNTUPeFE1wMpIHFgH0sg
         GDoJFdac2QpElgA8aCw6ZCn+VZ/xsTiwAGZV+Y+AAMnLfwuwjntd5PUcP12vkXymwQ8q
         dc5kw4dAw2Ev023UPfORS9x0+XUsh0J0n1Ka3v6J9IsJkF4CnUxrw79wBSfItfysaax9
         0yvbTuX0VYp/1r/zv1OaqMOaGjPTj9HyypLlMEFlQXvkrnOAFFBSMmKeRBKRs49rAQel
         hx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766869170; x=1767473970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYfo4DcmoDPGkLlBpUwQdj2xZvXjZDeunEqpnCANZoQ=;
        b=KNAshGufcVd350gbpFaUblVdmRqrOJv6qxNL+zoPlb+HxkTQnCTyTjgwWjVDsVJ/VR
         ++ZNxSN+YvMOsUnfIEWr+li1trWi70HssveljG6165NPOdfdeZuva+XzHREy72hkUVRY
         LFCaOBns1+Vn/Iryb3JCaa1/AHd3QBavkPsg15tFQ2ppUH9RoFl0HvhDi03REu6ekrfy
         bwR/ool7jMZueV04gLTWXT+oXjtTuFYq5NIohpquYG+N27ctIXjV1oTLT9UxrZk5qTz1
         spUIZovDRVDlXEVSMsr7lirAVyIP1Apn2gev7PrKEPPq5hTbZeR5Fd6V2NGpmIJyknL1
         qidQ==
X-Forwarded-Encrypted: i=1; AJvYcCVstfMZKqbGQmpw6ZBcsrMllfMjvBFt0xI+aSRk4gtNCDWNxoCOEBMKZRWUrNyrX1Be6o8TKBjAjAE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykOYA1th7cA2PpyHMk8h3udrEEENsP4hfNCo/HFW8XTIdWRPpR
	gA40BXyeHE1mhNGEzDxA4RFts6Z1dAMNYbuqFQ66ljwG7KTjURhryuwtN5c+Gkg5Buo+SX86yks
	7ZD9gUVdbkLtFRWNWVEuaBKZnSDmrxzQ=
X-Gm-Gg: AY/fxX4vum6k+6v6eGhswdLvtgsrOM0shzuXAnqv+Ug33DQAkmlPO0Z0Ss2LwaZVyLq
	BWeVGQI44mUO251ktqsLksvqlylA86oLdcC91uqPp1cJPx0Wgl9WhyIQXHswC7gLdnQU8JcDmye
	PdF+bgSO0RtvwxkSEBp4d7IKr5Z9YJwTQRcSd4w/6dnyT/GFgdY29uz01XzA4eXZqX/OJgQRUiv
	uR1Z8PrvWF83uydC4/f4atFqTO4yEKZpaI+9J8L5C2ESYXC5bUl5bYjhw9GWKyaRmRK2Q==
X-Google-Smtp-Source: AGHT+IHlaEEZSdrmBhcD5E1NDs69ZAi4VCsoBGkUPdmFJ+vi7IWuMZm/ebLyp+IkRb6IMCkz4IBpkkjebsgKR6Oxf8Q=
X-Received: by 2002:ac8:7583:0:b0:4f4:c0b3:f50d with SMTP id
 d75a77b69052e-4f4c1cc43famr221104131cf.2.1766869170002; Sat, 27 Dec 2025
 12:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-9-21cnbao@gmail.com>
 <20251227201642.GQ11869@unreal>
In-Reply-To: <20251227201642.GQ11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 28 Dec 2025 09:59:18 +1300
X-Gm-Features: AQt7F2rxXlxLqJeMe-griN6e55GdsgQR49MF8zyADfJXBQnZzf4d6g65OQ5pwik
Message-ID: <CAGsJ_4xssfB7hNOWLDianQfx+9wC2e4qZKtRBUzEZ-v97Sa63Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for
 iommu_dma_sync_sg_for_{cpu, device}
To: Leon Romanovsky <leon@kernel.org>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	will@kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Joerg Roedel <joro@8bytes.org>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 9:16=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sat, Dec 27, 2025 at 11:52:48AM +1300, Barry Song wrote:
> > From: Barry Song <baohua@kernel.org>
> >
> > Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
> > iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
> > a single flush operation is needed.
> >
> > I do not have the hardware to test this, so the patch is marked as
> > RFC. I would greatly appreciate any testing feedback.
> >
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <baohua@kernel.org>
> > ---
> >  drivers/iommu/dma-iommu.c | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index ffa940bdbbaf..b68dbfcb7846 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *de=
v, struct scatterlist *sgl,
> >                       iommu_dma_sync_single_for_cpu(dev, sg_dma_address=
(sg),
> >                                                     sg->length, dir);
> >       } else if (!dev_is_dma_coherent(dev)) {
> > -             for_each_sg(sgl, sg, nelems, i) {
> > +             for_each_sg(sgl, sg, nelems, i)
> >                       arch_sync_dma_for_cpu(sg_phys(sg), sg->length, di=
r);
> > -                     arch_sync_dma_flush();
> > -             }
> > +             arch_sync_dma_flush();
>
> This and previous patches should be squashed into the one which
> introduced arch_sync_dma_flush().

Hi Leon,

The series is structured to first introduce no functional change by
replacing all arch_sync_dma_for_* calls with arch_sync_dma_for_* plus
arch_sync_dma_flush(). Subsequent patches then add batching for
different scenarios as separate changes.

Another issue is that I was unable to find a board that both runs
mainline and exercises the IOMMU paths affected by these changes.
As a result, patches 7 and 8 are marked as RFC, while the other
patches have been tested on a real board running mainline + changes.

Thanks
Barry

