Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E6DB988DC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 09:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129018.1469146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1JzC-0004m1-8m; Wed, 24 Sep 2025 07:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129018.1469146; Wed, 24 Sep 2025 07:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1JzC-0004kW-4n; Wed, 24 Sep 2025 07:32:22 +0000
Received: by outflank-mailman (input) for mailman id 1129018;
 Wed, 24 Sep 2025 07:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GjuH=4D=gmail.com=linmag7@srs-se1.protection.inumbo.net>)
 id 1v1JzA-0004kQ-Uh
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:32:21 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99d90ffe-9918-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 09:32:18 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-62fbfeb0870so7057418a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 00:32:18 -0700 (PDT)
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
X-Inumbo-ID: 99d90ffe-9918-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758699138; x=1759303938; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=Vj1V7LkEIweSdGCUmr8JpbCXEMN/br8VfnB7Cxl3kgGHYamUjaor6o4rjcI9tcIVzA
         sDBmhPCLwVh5PraVQQ8tyxI/x/CvZ+gNqy1vP2/gmRAxUln9tNIDOajPgc4iBJ1MwvCu
         dON9AF3Z2eIAmRzNDcXlP70t7iF9WZbGBfxgT2I0ANLN2vt/Myi7yxBf+D3796+9TPal
         zteP+Jcx0FQoZV+qPb0r4QqrOf1uU6eTKbb/bnlt6lc6/q17HV7iqV3bBvZvyMDOg8OP
         gQUwmYgAMrSUkpAVGZMBXKeKryP2L5Y6Nga2F6bHqX9Kcu8IkwyS9b49PH0+kTg8J2cM
         XBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699138; x=1759303938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=NYxDyHtPXt8waVKX4gh4YOsANhJKE9Y3M6Y58RgEYfxz07dskMPZ/qSrVoxBqfioVk
         1PBAV//cQzd8hD3PwgpxljLstkU46G4AevUEbFZI2XUKFUr1Sic4tcZVop6oHX9dW0OA
         eNNol/RL9Btt9gvU3M+KMJ0/KMkQ1miYOnbLVSVR7Ks60K3So5ytdKswTx8xSin80RDK
         2lRKB5Y4VS+icZgvWVWqEQ0DFi5vBPrz20+JoHgrUql/jdN1Hbfe7M3mBTZbQgpMhbfe
         MRLrDuD9Bl0tj/1GgW9B/7iF9UM5R+ab0BMO29wBO4+yPcRwZg+mF5I/5/hvqeEtEoE4
         Aweg==
X-Forwarded-Encrypted: i=1; AJvYcCU4DG+QhGuGH7N1X2n6JnKxEgWBxDuHS05KmKcgo+sFWtD1bhJiYc4OKaNgpsTLHG/crqK7Jzgn5zM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztRL5X6SBlmkfyPJNoFGU7EVLKprmVrz8N2PntL6InzAGpgeKL
	RMOCJosrbsFMBnGskfC6K9nIffYTdPUNa+/rQ0YJ+AY/3LjAgKPEl5af2apytVRZd6JIfLv7heM
	HmtUsVO0dyX6slZ4a9k2ELHasFRglz7A=
X-Gm-Gg: ASbGnct0rJuILWZP8TVLgcF7YoOsg440I+OSofRo6aLhQaSJvOoJv6MzN51E4W12U/v
	07ryecDS4OsygeC1/P41P7r1QodSZbIFVRpT2aUExvWsgauY+07buPB582WbuAiE5nDn12l6qyV
	u4juGG2s/8KYxwwYrkzJVSN3keu2RwNzc5SNq+9I5iVe6S0A7TPY8TjEt/og7J7F9W5KKRoKxB/
	9ultk1b
X-Google-Smtp-Source: AGHT+IEsD22J4a5V9bbdMWtQv1Ep8AmuRuA2KpP+ndq9VMyD7XFtjS94kSm5rlJirOSxMvazqqoNAsq4GX/ON5RyqyA=
X-Received: by 2002:a05:6402:44dc:b0:633:4726:a077 with SMTP id
 4fb4d7f45d1cf-63467796df4mr4258422a12.15.1758699137992; Wed, 24 Sep 2025
 00:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
In-Reply-To: <20250923235318.GD2617119@nvidia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 24 Sep 2025 09:32:06 +0200
X-Gm-Features: AS18NWBrVH-9-wBlZ7ZFV3RxYYp-7iSL9DfIPq4jDzU8rxFLx7xmKKzveUA49as
Message-ID: <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
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

> Suggest testing the same branch with the alpha patch reverted just to
> rule out any issue in the core code. If it reproduces suggest to
> bisect Leon's branch.
>
I can try to revert just the patch containing the alpha-specific stuff and
see what happens and then, as  you say, maybe do a bisect from there.
First I'll just try the same kernel again a few times more just to make sure
that this is really reproducible.

/Magnus

