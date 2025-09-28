Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C97BA759F
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 19:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132574.1470891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2vJX-0004Jh-Qw; Sun, 28 Sep 2025 17:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132574.1470891; Sun, 28 Sep 2025 17:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2vJX-0004HQ-Mg; Sun, 28 Sep 2025 17:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1132574;
 Sun, 28 Sep 2025 17:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tAav=4H=gmail.com=linmag7@srs-se1.protection.inumbo.net>)
 id 1v2vJW-0004HK-3f
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 17:35:58 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9685dbbe-9c91-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 19:35:55 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63486ff378cso7507342a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Sep 2025 10:35:55 -0700 (PDT)
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
X-Inumbo-ID: 9685dbbe-9c91-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759080955; x=1759685755; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
        b=hlsddbpyNfLLmj7YNhTzNdAKO6BZXIszw5PNeP3OHtfnxwwCRNwlaY13U0KKcOlETq
         qE8/B2xCfr8YU7RmfHyCgvQXsRsxwLVDarDBTzD7qZN2LlJtSc2U2KMnIQPNhQeumR0F
         cYHqH7Plx+OnWekLvN7tVyit11DwPw0RJE6dDkBaARIrVIB5jTWTnlXKFPxFTgDYZL1/
         bVd9Dh/aa+aHZlfGIltbHZ78CGUiQDAwmi7nvl+PxpAImhBkONcT25x2E/cznRzf32Gw
         07X27D3xDCyhcW9JUECaw6dxdAke9df/QrbstW78NY5X5Tznjmf/Z3KjLUYulYa51Im4
         3SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759080955; x=1759685755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
        b=CuEmESGrq62/EC8BPeuoz2I+ZeLRjrU6iu8mFyL6gAtqqcBI/si4GqEOfoLnZnKCF2
         53cLx8tITMRYJsfABJO0Ld1UOrGcTuOWP6HQUXArJ7Db5anvQFf2QwbUICnjRL8ViwdQ
         WLAlJadnSFbY25TOrjqjgZ3F+8650mI1ujPhNGWrp1XvGCYB2oWJsnsrLNmeHpQX2UKT
         QCp1AXTa86Hl5zpgWDOxPrKrtefI0AVS0VCUL2Xo7QpvXC/onn0ux9L26mmvhKM7XF8P
         +1qxZ5iFW04OReW3oeOb/Udsi2JF/t9GNHbEATf7OLlANaAWY94SEiee9BEd9BXAjGBn
         s1XA==
X-Forwarded-Encrypted: i=1; AJvYcCW6l35BY+fHJT8VL6PvzA2hNM1w9WOssvAM5auMfqZdof99YJXnk2VzUgP1HtpgfWkJ7Pggm8FsqEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNIpGkcr5Ujd11yTMaVrEPfWs9wGD12pVZm+zVey4fxfp9YwSk
	p2IThXl6up9O67f4ng8jgaraq2wpO8bHrntpyaDWHw1Qln8Nqqsc/Ql1M+HtOURJbAuPPwTUeJP
	W5e7ppFAAzcr88kWEShijqkCNnFYdRNE=
X-Gm-Gg: ASbGncuq/xpNcFC2wWelKBr/OQIGP0mbRNNbYx/2Mf2cRPNVDC2TUUpwJTiCNsNmyus
	K010lDC8EZoiwnw/KoDmxz7yy88V9R1MG61D3u9OLl+K/gNmfOa9Jz5vt47zkBS6xAta2dt49+y
	U1aPpdlR2urWHWxZUGd6W8HN1zIrdQY4wpQ2BC3ZbrmrW0PLl4rvU5gGpcn/fVzcaKGQKsZk5om
	Bp5NQCsN8uFDKXULHA=
X-Google-Smtp-Source: AGHT+IF4LtUw7v9U/JYoQT0Wh7nzvSFhJ3UqproTerTY3SiJCa0Vl/rRvk3JMudUZqWnlv9RN4X9SRqdzNlv4OAcKN8=
X-Received: by 2002:a05:6402:352:b0:62f:453c:7235 with SMTP id
 4fb4d7f45d1cf-634ce845b9amr4127811a12.15.1759080955040; Sun, 28 Sep 2025
 10:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1759071169.git.leon@kernel.org> <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
In-Reply-To: <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 19:35:43 +0200
X-Gm-Features: AS18NWBtQV3w4fhUJT0qJjc42RZ2Y4lnsCSX8_2AFcicJQutzVlCWs2uQTVZ_oE
Message-ID: <CA+=Fv5SzdR4=NXz68gRg0iXY-6Y=GRsO24UA-DF4tuyJ8r7w7Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 28, 2025 at 5:02=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.
>
> As part of this change, remove useless BUG_ON() as DMA mapping layer
> ensures that right direction is provided.

After the changes in v1 this runs fine on Alpha. I've tested this on an
ES40 Alphaserver during load (build kernel and unpack tar files).
The v1 patch fixes the errors seen in the first revision of this patch.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

