Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464FACE0212
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 21:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193725.1512340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZbGv-0003Wz-VP; Sat, 27 Dec 2025 20:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193725.1512340; Sat, 27 Dec 2025 20:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZbGv-0003Ts-S2; Sat, 27 Dec 2025 20:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1193725;
 Sat, 27 Dec 2025 20:52:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4j1x=7B=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZbGu-0003Tm-LM
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 20:52:20 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee59b419-e365-11f0-9ccf-f158ae23cfc8;
 Sat, 27 Dec 2025 21:52:18 +0100 (CET)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-88a288811a4so91880106d6.3
 for <xen-devel@lists.xenproject.org>; Sat, 27 Dec 2025 12:52:18 -0800 (PST)
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
X-Inumbo-ID: ee59b419-e365-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766868737; x=1767473537; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COlE5Xveygh67jucjDOeVZnfTHNWpMeqgQJOQuwR0lI=;
        b=AS4fZxETxIfbfh6N0DDMwUF3A12SXf6QBp717dphgckyGWNyFgslEsfexuVAY+o7v9
         q3Hy/khm2+vRJyB7MpOCh1qu8RsgVyo5LAyoWJfVcqy0jFSdQy2F0sobH0eauWvOR39W
         E0kqvBEFc3gnv3h2aBaWdGa5VhJCanKNNHdQeByGEBhkAS9MDS79J2STYgSiu2sPdn3A
         m8WLFcxFlHNd6OYtfjX1XvrV6qtfp5iklcymk16piOy/7W9zZFM80bZ8dG4l2UC3UC7g
         uKiLn+T5dARDkZ0gDGJnCnt78tZmMvD1jSvH6Xdiebc4l3aAAy3qEuv0QZ52+MW+lXTr
         cbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766868737; x=1767473537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COlE5Xveygh67jucjDOeVZnfTHNWpMeqgQJOQuwR0lI=;
        b=M+kgkzulIxlRfPbrEqB4iGv5taEXwp/+bsXk1MyIoR34HYjXcZd9zsyHXsfmJiAlAl
         sNEEJVHyVvsC/5AMH1jqT/+DZlvDOWzwWN9sWOmpvHJIn48i9X/IY4mLSvZHg1zO+06G
         v42V5d7x+Jqjn+ZSuZxog3evVDL8WymNS+BjLhFw3N5quc4jmMiTa/bcQEyvo30epDHZ
         mMI1lrl6xdkyIz32HjLUU54/7UZOw//g20hdX+iYpBQJDGTpoSols0J97MAqip3AfCc0
         pPe1C0/I1SAQTjPXntE65XFY8j0TxX80S8zQrDa2fb7XeRE0ZabQ/bl2mhKBKBIporwS
         SL6g==
X-Forwarded-Encrypted: i=1; AJvYcCWGlOzjC8FU5P6q4hHix/bvPrnW/9O2cxxazs7myuTNkiFdeVvyfer4XDvj1busknmNObd0o0bHk6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziuhDqNDEoaZCLsmBGINJZHTk1HcEvZjWQalSHYQvKibP580i/
	/5lvEpnVYifLS6NjGNu4ezEU6cuFXQ16sCbDCWH6aonCrdPJzvckQ+irpLMGYdcaCV6miDCdUYx
	yliuD6o2r2GrlQX1322tk3Nt6nv3q1Bg=
X-Gm-Gg: AY/fxX6wZBmv2PtyxWhxOxc2IT1qNzyx5NFd/B4PuijmuXU+6yJwJ+d7TfPXINFvHO5
	Vggc5Mdx2uFXJtmu4moBFSpWqZ4GnJgWD1HhQGEf71xINvjrwVk1gT/4v8k8Nq7CCiDRJGit3GR
	kSWgUG6/Yph1UGCIxzqAngvL/6zlLrobOEtnKmsNxxmGIhP26KYoEZMiu+gY8OQ3VOm7Ej/7Cag
	NSNXRfyAVlXcYt2DppC2fUIYfsHrAgM+l6OsWjGiiwvCmqPpcOKFsJJzaADzNtjHyWcww==
X-Google-Smtp-Source: AGHT+IFWlfYgq6fvhPnudIMznElnMp57SUfWPdf1Abz4VW1qQ4SuUkwafpWDnswUCDqMkbSt41dCGCuIrkeU0fQZTZ4=
X-Received: by 2002:a05:6214:3a8a:b0:88f:cd09:9431 with SMTP id
 6a1803df08f44-88fcd0995d8mr271616716d6.41.1766868737130; Sat, 27 Dec 2025
 12:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal>
In-Reply-To: <20251227200933.GO11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 28 Dec 2025 09:52:05 +1300
X-Gm-Features: AQt7F2q5TMmxm7Qs_CjJBcT-WAtF0589kk4jJXu2nxeg2qZ04GIbkJZVDuQBxso
Message-ID: <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
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

On Sun, Dec 28, 2025 at 9:09=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> > From: Barry Song <baohua@kernel.org>
> >
> > Instead of performing a flush per SG entry, issue all cache
> > operations first and then flush once. This ultimately benefits
> > __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> >
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <baohua@kernel.org>
> > ---
> >  kernel/dma/direct.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
>
> <...>
>
> > -             if (!dev_is_dma_coherent(dev)) {
> > +             if (!dev_is_dma_coherent(dev))
> >                       arch_sync_dma_for_device(paddr, sg->length,
> >                                       dir);
> > -                     arch_sync_dma_flush();
> > -             }
> >       }
> > +     if (!dev_is_dma_coherent(dev))
> > +             arch_sync_dma_flush();
>
> This patch should be squashed into the previous one. You introduced
> arch_sync_dma_flush() there, and now you are placing it elsewhere.

Hi Leon,

The previous patch replaces all arch_sync_dma_for_* calls with
arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
functional change. The subsequent patches then implement the
actual batching. I feel this is a better approach for reviewing
each change independently. Otherwise, the previous patch would
be too large.

Thanks
Barry

