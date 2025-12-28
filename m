Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361ACE57A3
	for <lists+xen-devel@lfdr.de>; Sun, 28 Dec 2025 22:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193880.1512399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZyTN-0003gG-7O; Sun, 28 Dec 2025 21:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193880.1512399; Sun, 28 Dec 2025 21:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZyTN-0003dS-1U; Sun, 28 Dec 2025 21:38:45 +0000
Received: by outflank-mailman (input) for mailman id 1193880;
 Sun, 28 Dec 2025 21:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7bq=7C=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZyTL-0003dM-Fx
 for xen-devel@lists.xenproject.org; Sun, 28 Dec 2025 21:38:43 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92c36a84-e435-11f0-9ccf-f158ae23cfc8;
 Sun, 28 Dec 2025 22:38:41 +0100 (CET)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-8885b3c06caso137963826d6.1
 for <xen-devel@lists.xenproject.org>; Sun, 28 Dec 2025 13:38:40 -0800 (PST)
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
X-Inumbo-ID: 92c36a84-e435-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766957919; x=1767562719; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1g/LUZaFq6bDefX53BhgiuD5fkwRR70905nqxT15Dw=;
        b=Zs4MTrXQyMVxZwHsVERpALw67uiJyQBSoLpaJF2u2E1CAulZSDiq82rm974vlc64nE
         MliyWjW9kDheo+F8cnWCWJrsUE7psPGsX8z4bG66DQ8QBWi7RH78cs4pkKFLImIJviK6
         DWCSoKWNUvLbmfHbNo0BDBYak7a5xy7q8FhavSSyE6R434UthGVVTexJNpTYrY/N1MQN
         CTFuk+DBlHxOfiksImmgT6WLgs1mkRjww1HLS90xHDjVr2Qh/KQGzcpIoIinEHkTjJcy
         O+GThQq1wga+pIemB8YHpQ0Z7cQP5givBO902AcWc/UYZrNbhAVeuY4osZ/An9IfL9QX
         +x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766957919; x=1767562719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1g/LUZaFq6bDefX53BhgiuD5fkwRR70905nqxT15Dw=;
        b=Z6TqHMXDSTkQXB/lT9DmuAKcAEhwTHQ1R7cuPViCotoCqCzzQmDKHrMquEKXds7f8P
         AR6L2RVLzjW+2QIrgoDMV3UGqf9XTBM/bxq/KnaZJmiLwqeEbrYjebNyGZvhPpJK5JNV
         AGtPKHszhIml8PS3NSrao6m5ufANmCtJ53cnzwgXZtFW2l/bUD6p2dPAK3nB1Q0nzi9E
         RmZElaHf9TrwB5XzJ2P3FICr2kpvliiG2xCgDGcdlIz1/clrHxD99nKGXmpWpuKW4myo
         ULgvphHZ4tDZCTlbpJpOGkQ37nS9TZIHIPU7G02cHZhjBa+BzGomgHY0ZuIBpbA72GT2
         ldFg==
X-Forwarded-Encrypted: i=1; AJvYcCXaq9FEevHcMtJHZfC1bceeT0X0p5JTOwze6UzHkCn4Y3VA1X73hd4j2a6lcf8okhInauo+G6H3RHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBDTMCZ18v306WLvN2F2hxnEhbWHV2zKnX5gwOUvvetNfpRiQ7
	zvjeHKU0FhETlsa2de/U3vsHrZTCP0cJ+HFcOojvwJ8vHjGc0gmMg4HMLdATOi/gmZRzlAHi+DN
	Ipz926n2vWoyONj5OBQtLRefCRWDOTKo=
X-Gm-Gg: AY/fxX6jbkUHtQFlnDXJ6IlcW45L3CjnJC8Y/dCXBtAangcpg8Xi06Sm0mbY3Jsgk8H
	/zT86JpVhTWYpR745f31XRqJAmjKeHCMc9jv911GeLWi9h6B/9D0VepnWqmeQO0XB69tlOC0c7X
	xINZqJgC3xJ/v6qAIwS1/h8hf5PjZXPuyUyhVhzS5opHXZC1Ol0WwAUKa3snEtX1+UaXu1RsWBM
	uaL0RTRTWrQ7alzJNUZeS5PTFUFSCDVSzzIhl3lh+V/cmXDrTdT7nQE/rKTiU+WTeVmhYD+uC5B
	zxGo
X-Google-Smtp-Source: AGHT+IFgKeFJUcF4JlYrS+2alW/MpQ7kokvILpma/XvhkGlA5YEBPhAcAdbbpwwssSzZ4QYH5TR+I6xzr6+JAPDvDvM=
X-Received: by 2002:a05:6214:3106:b0:87d:cb8d:2a98 with SMTP id
 6a1803df08f44-88d851fbfafmr460409556d6.2.1766957918792; Sun, 28 Dec 2025
 13:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-5-21cnbao@gmail.com>
 <20251227200706.GN11869@unreal> <CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
 <20251228144909.GR11869@unreal>
In-Reply-To: <20251228144909.GR11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 29 Dec 2025 10:38:26 +1300
X-Gm-Features: AQt7F2qQRDPvBU46Q085z5nd3f2LlK_MxqFtI029gQlWHnLWh7NIEMxwcDVy0Zs
Message-ID: <CAGsJ_4y=yoYZn+_ztdfuOCj_dS-M0h8YWO51AXubPbeR1FH6uQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
To: Leon Romanovsky <leon@kernel.org>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	will@kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Joerg Roedel <joro@8bytes.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 3:49=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sun, Dec 28, 2025 at 10:45:13AM +1300, Barry Song wrote:
> > On Sun, Dec 28, 2025 at 9:07=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
> > > > From: Barry Song <baohua@kernel.org>
> > > >
> > > > Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> > > > always wait for the completion of each DMA buffer. That is,
> > > > issuing the DMA sync and waiting for completion is done in a
> > > > single API call.
> > > >
> > > > For scatter-gather lists with multiple entries, this means
> > > > issuing and waiting is repeated for each entry, which can hurt
> > > > performance. Architectures like ARM64 may be able to issue all
> > > > DMA sync operations for all entries first and then wait for
> > > > completion together.
> > > >
> > > > To address this, arch_sync_dma_for_* now issues DMA operations in
> > > > batch, followed by a flush. On ARM64, the flush is implemented
> > > > using a dsb instruction within arch_sync_dma_flush().
> > > >
> > > > For now, add arch_sync_dma_flush() after each
> > > > arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> > > > no-op on all architectures except arm64, so this patch does not
> > > > change existing behavior. Subsequent patches will introduce true
> > > > batching for SG DMA buffers.
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
> > > > Cc: Joerg Roedel <joro@8bytes.org>
> > > > Cc: Juergen Gross <jgross@suse.com>
> > > > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > > > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > > ---
> > > >  arch/arm64/include/asm/cache.h |  6 ++++++
> > > >  arch/arm64/mm/dma-mapping.c    |  4 ++--
> > > >  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++-----=
----
> > > >  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
> > > >  include/linux/dma-map-ops.h    |  6 ++++++
> > > >  kernel/dma/direct.c            |  8 ++++++--
> > > >  kernel/dma/direct.h            |  9 +++++++--
> > > >  kernel/dma/swiotlb.c           |  4 +++-
> > > >  8 files changed, 73 insertions(+), 25 deletions(-)
> > >
> > > <...>
> > >
> > > > +#ifndef arch_sync_dma_flush
> > > > +static inline void arch_sync_dma_flush(void)
> > > > +{
> > > > +}
> > > > +#endif
> > >
> > > Over the weekend I realized a useful advantage of the ARCH_HAVE_* con=
fig
> > > options: they make it straightforward to inspect the entire DMA path =
simply
> > > by looking at the .config.
> >
> > I am not quite sure how much this benefits users, as the same
> > information could also be obtained by grepping for
> > #define arch_sync_dma_flush in the source code.
>
> It differs slightly. Users no longer need to grep around or guess whether=
 this
> platform used the arch_sync_dma_flush path. A simple grep for ARCH_HAVE_ =
in
> /proc/config.gz provides the answer.

In any case, it is only two or three lines of code, so I am fine with
either approach. Perhaps Marek, Robin, and others have a point here?

>
> >
> > >
> > > Thanks,
> > > Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> >
> > Thanks very much, Leon, for reviewing this over the weekend. One thing
> > you might have missed is that I place arch_sync_dma_flush() after all
> > arch_sync_dma_for_*() calls, for both single and sg cases. I also
> > used a Python script to scan the code and verify that every
> > arch_sync_dma_for_*() is followed by arch_sync_dma_flush(), to ensure
> > that no call is left out.
> >
> > In the subsequent patches, for sg cases, the per-entry flush is
> > replaced by a single flush of the entire sg. Each sg case has
> > different characteristics: some are straightforward, while others
> > can be tricky and involve additional contexts.
>
> I didn't overlook it, and I understand your rationale. However, this is
> not how kernel patches should be structured. You should not introduce
> code in patch X and then move it elsewhere in patch X + Y.

I am not quite convinced by this concern. This patch only
separates DMA sync issuing from completion waiting, and it
reflects that the development is done step by step.

>
> Place the code in the correct location from the start. Your patches are
> small enough to review as is.

My point is that this patch places the code in the correct locations
from the start. It splits arch_sync_dma_for_*() into
arch_sync_dma_for_*() plus arch_sync_dma_flush() everywhere, without
introducing any functional changes from the outset.
The subsequent patches clearly show which parts are truly batched.

In the meantime, I do not have a strong preference here. If you think
it is better to move some of the straightforward batching code here,
I can follow that approach. Perhaps I could move patch 5, patch 8,
and the iommu_dma_iova_unlink_range_slow change from patch 7 here,
while keeping

  [PATCH 6] dma-mapping: Support batch mode for
  dma_direct_{map,unmap}_sg

and the IOVA link part from patch 7 as separate patches, since that
part is not straightforward. The IOVA link changes affect both
__dma_iova_link() and dma_iova_sync(), which are two separate
functions and require a deeper understanding of the contexts to
determine correctness. That part also lacks testing.

Would that be okay with you?

Thanks
Barry

