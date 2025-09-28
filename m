Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07BBA6F09
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 12:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132286.1470680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2oZZ-0007iI-Cl; Sun, 28 Sep 2025 10:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132286.1470680; Sun, 28 Sep 2025 10:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2oZZ-0007gE-76; Sun, 28 Sep 2025 10:24:05 +0000
Received: by outflank-mailman (input) for mailman id 1132286;
 Sun, 28 Sep 2025 10:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tAav=4H=gmail.com=linmag7@srs-se1.protection.inumbo.net>)
 id 1v2oZX-0007g8-7O
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 10:24:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3feaefe2-9c55-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 12:24:01 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-62fa0653cd1so5307636a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Sep 2025 03:24:00 -0700 (PDT)
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
X-Inumbo-ID: 3feaefe2-9c55-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759055040; x=1759659840; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LcChJkbyyCyxxnYoZ0h2dgScTYQu8ypUACGdGHRDEY8=;
        b=Eur+U2IMhr6rW2pPQuoBzUYI92Dz+dSfHk3J5hMs8M+LDOfyfYECgchiQ6snndyPxp
         rZX5dr0i53dlCCsK5U1tcmJj/aLvW26JIkgSOiZsJcUjQD2BMXjavcwXBrZANhwllzB3
         RnGHDgUAQNzekZrtt/GtQy5JBqwEkY6t1bZHqZ/K2KAIBXwCN1caErAYxADjM/utUd1Y
         +uyzVyltnRrx3aVhnqcSz7cxQtiw3jVssA+1y2oeAodaTDjeYOi9M3kXrgVO7V7gW5Cm
         pRKRjp1DIgDMKc6TBJPuEsLP9oZoHsUgFG/PAFVQkeilV30XUYxsn1HQP5yY2VTmykMr
         j4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759055040; x=1759659840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcChJkbyyCyxxnYoZ0h2dgScTYQu8ypUACGdGHRDEY8=;
        b=LzN6rIsEp1nFvEF67ft6D8olcteGPJU9LH7xTpTcP+Zm6dNU7xkLYQQORcqQC1gHeK
         z0H+4FtMl9CEmxa55ApeuUKBsIijVZ+1EBvpheauRhjDPsKy456T1UYzFiTAWpHzHwoa
         8gfHRsL9JBCIxu/Y7lWJDCJDLPMmh4oh6rCqMJWW5I5iOJHWoij71+FAPPB0XrlV2hb2
         Cryo+Qe7WA3kZ/Sro4Q9OlWJYTEhiVtfHc9bHL/wmpq6fdvjDkA27DRCRM/84jnWPhq5
         tVdjEtHeIWoO5xCrQxvBxdI3AWyGxbHVwc/yC2lixZ2wrNDBZY4VSl+MLmOZIMHSl+dE
         WLDw==
X-Forwarded-Encrypted: i=1; AJvYcCVtolhYzfMQI25dR+sghFhM2Iqu/91t0x6IgYjueikiravjkzTgdgS6tsSGABvstGb4bqb1LWOxXak=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9cF063DvVNmVqzCQSLhRJl/qcC0eMsx8iblqUiVF9+mhjnJzA
	LBBoU0KUIqG5g6H0pPme9yoAmiPtk0lGA/7YfDPJLbuEaT0O1oTbdVY6wm2pHcDubq5C2lbrnAP
	tH+vkB2rvAVW0GrcKBVmLqYaoBihz3fQ=
X-Gm-Gg: ASbGncuAyxpr6ZTDAaXtQoDlXtxdsAnaEgK/mNvZvZpi6e/AlcYKA64uqqMqWdqNpDN
	dqR90gzTm5/tOn8skx5mPgh0D6XqKqWQn+H9TyRRIN7kBESR19CkCfMe1vkfPI3/P2MvExIDCTw
	Grrz68aRff4HB6Ps9+kr3y0Af6Te6H5OSTHhmIBtDBrMlbI34NIW+DjzHA1Gv/LPojVBQmpLBpv
	Ux/o/RQ
X-Google-Smtp-Source: AGHT+IGAq0LbOWTh24q9bLB+mXJC5ix6EL+ilnN7HstffL1oa4ImYTxpRTBcFvmhE8oxPjiGws6tJF6LzW8U7U3nO24=
X-Received: by 2002:a05:6402:606:b0:633:8337:da95 with SMTP id
 4fb4d7f45d1cf-6349fa9f661mr8379897a12.38.1759055040002; Sun, 28 Sep 2025
 03:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 12:23:48 +0200
X-Gm-Features: AS18NWC4Nb9W4XCpYP_OV5Q9pNZrLenXw3hzv9kO6uALa6_OupoUAOrEskTs214
Message-ID: <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
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

> After reverting the above commits, I'm able to build a working kernel,
> that is, no filesystem corruption occurs. I'll take a closer look at this
> after the weekend.
>

Short update,  It is enough to revert the following commits, in order to
have a working kernel on alpha:

e78a9d72517a88faa6f16dab4d1c6f966ed378ae
(dma-mapping: remove unused map_page callback)

d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
(alpha: Convert mapping routine to rely on physical address)


/Magnus

