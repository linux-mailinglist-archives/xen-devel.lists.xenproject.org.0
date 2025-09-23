Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBCB975D5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 21:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128693.1468965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v18mn-0007dH-K1; Tue, 23 Sep 2025 19:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128693.1468965; Tue, 23 Sep 2025 19:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v18mn-0007ai-HR; Tue, 23 Sep 2025 19:34:49 +0000
Received: by outflank-mailman (input) for mailman id 1128693;
 Tue, 23 Sep 2025 19:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4oKJ=4C=gmail.com=linmag7@srs-se1.protection.inumbo.net>)
 id 1v18mm-0007ac-2w
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 19:34:48 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b597a7a-98b4-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 21:34:44 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-62fbc90e6f6so8101349a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 12:34:44 -0700 (PDT)
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
X-Inumbo-ID: 5b597a7a-98b4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758656084; x=1759260884; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=++d3dqdiBWxrOtz0QgpiS/0g7+oJyTqlQjLbyxgEnJo=;
        b=KxaO1att+YSOo9JmuvAo4yqzfYX4vr5qIAuJoYcQwSa5gA3CvvrsNgYpSS2xJLz5yc
         pizt9ClrPQr1n6c+lSitmdXksIYx0AwWP8AHV01Am2yHz/9ufFnCwf2TvNik6BNiAQRR
         9WnqtXrQJccwsa6D7v+kbh+ulE3ZzJWah3Qr4Us92be9LhS85lNsjPifQ7oyBmVxrEO8
         nFWT/e9AXTxQUHQAPUmwVY0mjGq/uicDGnPU4GHV/PA5WiEvA650IQ8hsUfIoroqCvJo
         uW19IKde0uPWaBNpAWD1cm7x/LfDCFGBet4K90bzHlK3WiV7MGpnbT6cJ4eyRvE+93nB
         /GKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656084; x=1759260884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++d3dqdiBWxrOtz0QgpiS/0g7+oJyTqlQjLbyxgEnJo=;
        b=DWhEFRHn4/tIcAJ+5FHE1n56RRVBGq4lcMANIu32uPSU9KMxVQgPAFl0w5IibiTdPI
         Y8h3oRHGD4bYFuGGKmrdg4jwSDguHyUcu7jUDybZEh76nVwG1kbIVJ+rkQ+FN6LiCj/e
         HGC0u48X3xmt9ZoYZMcbe7jhi5jpF4kGcRSnuVO4JTBODaO2EjllxZzz2St5c+t7Zuev
         Un3v0DQpX6MV5XPeMKjOCR1755XrPQMYek6hDQ7lAQJXv733qPlByYi4YnseMVmz5Um8
         grtCQiqSVJh+mVmVOmhpsEp2eNctryHjHy8NFqcuA2MeM99Lmlk4I6ffo4aVhxE5IZri
         OhqA==
X-Forwarded-Encrypted: i=1; AJvYcCXiccJAd4M46BR6qo5OlHN6KYzb3qmYZAdGVf9eHf1v1MyuT4nHT1zTjpOzXvSv6WRUqAH0tcP8bAo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywo8ihugyuhC0pO/4gjrTw/pEDcWLUYiAHvf+k8HyS0ZmJMOdY+
	80XZtmqXhW6JBGf08Lo/melJmpSSy3hEsGpyhOFEh5gJsT4fXl+4uxFYLAd6w4vqt/b8IlLWwP3
	QJLOQPS3szYoH/qW0r8tev9kR6TJ1Jp8=
X-Gm-Gg: ASbGnct9NaWBwofxfPAn2gcUpsPBHO8EUODgN55Y1U+djpr80zfGt9wH18c7jQjlYYk
	gQQ4Dt4e0OE+lON3siv+G9ILzET3iCso0f7jfYWgXg7B22Hai62RMlj3b8tyK4L+E3bE+5ZO/TX
	N/xuF567uzCw9AeBJ6iqAx7Vs9emLhsveAo+GqVa3YTNB692ZdWfQitdtXsbPGPgBVOh//XNLVJ
	xRxGRy8
X-Google-Smtp-Source: AGHT+IG+y6U2HPtJWiJ06zINgKFsCV3h5cNmzOdYimKubd6x0uYI1nvJ7cf5K8syyZNEK08ri4tKiPSTOpp4XlvA7nY=
X-Received: by 2002:a05:6402:520a:b0:633:8c43:eff8 with SMTP id
 4fb4d7f45d1cf-63467a15e4cmr3129540a12.36.1758656083579; Tue, 23 Sep 2025
 12:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com> <20250923171819.GM10800@unreal>
In-Reply-To: <20250923171819.GM10800@unreal>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 23 Sep 2025 21:34:31 +0200
X-Gm-Features: AS18NWB41C3D5JsYFHuNFW-M81tws8xiK0mHlB-cBnQqvONalyjABahoz4jqIPg
Message-ID: <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jason Gunthorpe <jgg@nvidia.com>, 
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

>
> I will try to setup Alpha architecture in QEMU in following days, but
> would like to ask first. Did you test alpha on clean v6.17-rc5 (without
> my patches) as a reference?
>
I'm running now on a fresh git pull from today so it's more like a
6.17-rc7. So no problems running the latest git at least.  I can
dig deeper into this to see if we can figure this one out. First
of all, is this alpha specific?

Regards

Magnus

