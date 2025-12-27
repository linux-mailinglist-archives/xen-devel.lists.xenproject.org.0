Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00537CE0274
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 22:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193750.1512359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZc6M-0002E5-4u; Sat, 27 Dec 2025 21:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193750.1512359; Sat, 27 Dec 2025 21:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZc6M-0002BT-1f; Sat, 27 Dec 2025 21:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1193750;
 Sat, 27 Dec 2025 21:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4j1x=7B=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZc6K-0002Az-5O
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 21:45:28 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a366456-e36d-11f0-b15c-2bf370ae4941;
 Sat, 27 Dec 2025 22:45:26 +0100 (CET)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-88ffcb14e11so34683096d6.0
 for <xen-devel@lists.xenproject.org>; Sat, 27 Dec 2025 13:45:26 -0800 (PST)
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
X-Inumbo-ID: 5a366456-e36d-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766871925; x=1767476725; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt41blxsMyjhc3LV6WnC+/wCpChm6SDa9UhbOfqHfRs=;
        b=IclloBh96jd4HwYnKOq5XQoOSR8CpKlEqitOFbnTZwhX9JXh6yjq3/tpn/Ie55w8TP
         2DE8m0eOlxegIucmdBB9fDQ3SN6gtIQqaodNZFJ2LCrEwZeAn10ClMhrOyk4LCHGTs2c
         8EWlUjijUmF4ANmvLex7c+DK2BymJKmYSqh7yNBg2fASyfnsQi4t1Cm7q1j7Jm15TYnA
         etSJJ9yikI8nS8IL+Ivc975XVHf/ofpGwp8dRXEskJCLzNat2AZmtnWXz5UTsMg7Yql/
         Kifl/CDAzf3uEN33QWcbf/rCbXUkfh1O5hmncUGYUx40bE61+XMFKdI/pr0TIM+g6b0w
         hIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766871925; x=1767476725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lt41blxsMyjhc3LV6WnC+/wCpChm6SDa9UhbOfqHfRs=;
        b=YYA8fYsc5B7BKAbaGlCOfxLeRU4xhX+SfniwL/LjHSsJNiscVy6G+iMXioswCT4uYy
         cJnUiOAHg3T404BwPXYiWtsO4LdGpsehf1V5Dc7sy9GrnFrqiffORJcpOXwpDVzhOwsu
         u45IoTL5n9Zvp1j+0me4mONdNeeAcoVkaNid5RKlDNYzBE2mOIlUfTZh3oZ+OLW8xAjQ
         NtrVqKZ6kPGwVFQKHdGH/ycNDPceCUmYo6E0gJeoefouIM9Q9XSB+Og0VcNUjBXtntWO
         eAzvchZCEW456KFXtA2XXzA31lGUyNy/i8b7GUHCh4EOwSmWAbIlCFEY4tOtzWfDabS/
         bpcw==
X-Forwarded-Encrypted: i=1; AJvYcCWT3YP5A20Y5pMk0EUpf5XEfBcP/c0evjQbsOk0tylDQe25Jtqtj3Lz4Q9nejDpexTiDqE6qCai5b0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9w8rDuclboTI2X0i9rRsK1UOLw/qLmjoUvc2b58gVQM8EC1cY
	Lk39cQS3SH9ZiO74/VSWtf10khg/HqSvh6hc0Y/I5OoQWaMCFUaCaYIE60S9zhBBWFv/akDj+7y
	MHoPg8lojs8nLnQ9gjmyBgYAqqOI8w+mHNBPR
X-Gm-Gg: AY/fxX7zhFc7nilKnIKhqEwfgAAJmk7Bteraytk24TSiduNLyINx6Qidr3FXl6Bevag
	QWNA3MQ1g8ajvZMpjiFrfhqdVJC9lPT6iA7BWBwLT4ySpEnDNm3zkqX+RC7z/Xza7TCIvhgHqzb
	3lHA97NLAMg7KDthgdT1JZOXX0Bbr6Xsf4r45KNNXQZNQvzvcV8Hkyqo/yLbGC4Zvm0Hk8SxV1i
	mkIfVh9v2S0/BCHi2K9p5k+Qf+te808ROZGlhH9JhBNEi3QnD/VaQ69QtnZqByY5O1cpQ==
X-Google-Smtp-Source: AGHT+IHmBi29677t2O37ea1flM7K/Y0dIjXGGt2yXIRM7uMA6APSnauCpQ+0jFlHKgITt5UGFK02RSmCY0Fj091CN4k=
X-Received: by 2002:a05:6214:5092:b0:888:6ea5:a90b with SMTP id
 6a1803df08f44-88d7f5b331fmr425798726d6.0.1766871924468; Sat, 27 Dec 2025
 13:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-5-21cnbao@gmail.com>
 <20251227200706.GN11869@unreal>
In-Reply-To: <20251227200706.GN11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 28 Dec 2025 10:45:13 +1300
X-Gm-Features: AQt7F2r-YxjjSYpd8cllnEqpFXg5kopB86XJsQIZsxDdh04rwEIBpc-UuQSQ9GE
Message-ID: <CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
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

On Sun, Dec 28, 2025 at 9:07=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
> > From: Barry Song <baohua@kernel.org>
> >
> > Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> > always wait for the completion of each DMA buffer. That is,
> > issuing the DMA sync and waiting for completion is done in a
> > single API call.
> >
> > For scatter-gather lists with multiple entries, this means
> > issuing and waiting is repeated for each entry, which can hurt
> > performance. Architectures like ARM64 may be able to issue all
> > DMA sync operations for all entries first and then wait for
> > completion together.
> >
> > To address this, arch_sync_dma_for_* now issues DMA operations in
> > batch, followed by a flush. On ARM64, the flush is implemented
> > using a dsb instruction within arch_sync_dma_flush().
> >
> > For now, add arch_sync_dma_flush() after each
> > arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> > no-op on all architectures except arm64, so this patch does not
> > change existing behavior. Subsequent patches will introduce true
> > batching for SG DMA buffers.
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
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <baohua@kernel.org>
> > ---
> >  arch/arm64/include/asm/cache.h |  6 ++++++
> >  arch/arm64/mm/dma-mapping.c    |  4 ++--
> >  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
> >  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
> >  include/linux/dma-map-ops.h    |  6 ++++++
> >  kernel/dma/direct.c            |  8 ++++++--
> >  kernel/dma/direct.h            |  9 +++++++--
> >  kernel/dma/swiotlb.c           |  4 +++-
> >  8 files changed, 73 insertions(+), 25 deletions(-)
>
> <...>
>
> > +#ifndef arch_sync_dma_flush
> > +static inline void arch_sync_dma_flush(void)
> > +{
> > +}
> > +#endif
>
> Over the weekend I realized a useful advantage of the ARCH_HAVE_* config
> options: they make it straightforward to inspect the entire DMA path simp=
ly
> by looking at the .config.

I am not quite sure how much this benefits users, as the same
information could also be obtained by grepping for
#define arch_sync_dma_flush in the source code.

>
> Thanks,
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

Thanks very much, Leon, for reviewing this over the weekend. One thing
you might have missed is that I place arch_sync_dma_flush() after all
arch_sync_dma_for_*() calls, for both single and sg cases. I also
used a Python script to scan the code and verify that every
arch_sync_dma_for_*() is followed by arch_sync_dma_flush(), to ensure
that no call is left out.

In the subsequent patches, for sg cases, the per-entry flush is
replaced by a single flush of the entire sg. Each sg case has
different characteristics: some are straightforward, while others
can be tricky and involve additional contexts.

Thanks
Barry

