Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A557040D666
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 11:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188293.337414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQnsp-0007EC-0t; Thu, 16 Sep 2021 09:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188293.337414; Thu, 16 Sep 2021 09:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQnso-0007Bd-Sa; Thu, 16 Sep 2021 09:40:42 +0000
Received: by outflank-mailman (input) for mailman id 188293;
 Thu, 16 Sep 2021 09:40:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7pY=OG=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1mQnsn-0007BX-MT
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 09:40:41 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4ddc122-e7c0-4946-9967-26855549a5ed;
 Thu, 16 Sep 2021 09:40:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x27so16114123lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 02:40:40 -0700 (PDT)
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
X-Inumbo-ID: e4ddc122-e7c0-4946-9967-26855549a5ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f4r5L82T8lVgmjDxktA/sisuupFmx7x30+6IlhMnYag=;
        b=jPcF0P+cHfyIuFllT9s+XQDbpTKL/DP/WZ12xBmDnC0LZJsbJeGpydQ+nj1jG3vyhQ
         MXkF+s9f9DZe82C3OUmuCqssXSW6Xy1D8PFT7XMOVkyU74aEXJL7HBQJL//WLAcHnHlT
         6JAWY0XBjZ7XwV9xpdiHpNmVxyHHj5cWcQPRN6QHBZx1dqJ5C5ttXeA+io6IcnyWEI1q
         dTKH6A8fDq2gQ2GNoUTTZGZkVAhST9ZUJ+pdKy05GPpnzXG3EkGwi93ZGAuCS4fkFkql
         PEeqVQZUULvnCU7rK1P4+9aDwbpW2w/MkOtNecCIBYtcqqkOy4RB/4LhCrlLfobSeeON
         wc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f4r5L82T8lVgmjDxktA/sisuupFmx7x30+6IlhMnYag=;
        b=XKBJwoUbQgctMShUBU/8BCVmJNcpQWq5kMQj2VItmGyJv/3SAhV5ZXEXWLtGfcVf6p
         Xf15CldBuZrmBhHQIVUA+FlleMF6pVbEmt2LYsmHZB8uNmES2tAexMYsxxFcsSycNShU
         V3W7PNz4Lo7PY7YVH74NGLhhanht2POUUqRCqcGIjTGUmsDv+eAAwTU9gFmABOTc/waA
         WnV3G5gP3X53YNArxWGvtIBidKSqsQKnzN+qEa2Hfu7tM755pYCxUftjnf6z9Pzvb41u
         7nSMGZwNTKsTFCzC2oFfWJFXf2+Id6RUgEDS10lAcDjDidiIVEBfQefyNJvx5cZBl+q+
         SjoQ==
X-Gm-Message-State: AOAM5334m7RIYrh4qFNzQb05mk235jSzeVwAHhy+5e+k58ef3Il1SgO3
	+cHa0lPQdAeyTvYIBlArPsVG1e87NUSm8KgpYu8=
X-Google-Smtp-Source: ABdhPJyIIyf4A7fhfDx7l6dTfpk1Ec/zzEqy4u9mdnznrZCiaqfyA9V5XQj08EEuePeq9U7P318zvMYzkOuwjxToNGM=
X-Received: by 2002:a2e:1508:: with SMTP id s8mr3587923ljd.240.1631785239506;
 Thu, 16 Sep 2021 02:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com> <20210914153046.GB815@lst.de> <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Thu, 16 Sep 2021 12:40:28 +0300
Message-ID: <CADu_u-OjpYB0-B=tLKYsZH=auvQF-o7PJb-11W=1emY8jaA-mg@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrii Anisov <andrii_anisov@epam.com>, 
	Roman Skakun <roman_skakun@epam.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Muchun Song <songmuchun@bytedance.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>, xen-devel@lists.xenproject.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-doc@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, iommu <iommu@lists.linux-foundation.org>, 
	Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

> Also, Option 1 listed in the webpage seems to be a lot better. Any
> reason you can't do that? Because that option both solves the problem
> and increases performance.

Yes, Option 1 is probably more efficient.
But I use another platform under Xen without DMA adjustment functionality.
I pinned this webpage only for example to describe the similar problem I ha=
d.

Cheers,
Roman

=D1=81=D1=80, 15 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 04:51, Stefa=
no Stabellini <sstabellini@kernel.org>:

>
> On Tue, 14 Sep 2021, Christoph Hellwig wrote:
> > On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> > > I'm not convinced the swiotlb use describe there falls under "intende=
d
> > > use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside=
,
> > > the bottom of this page is also confusing, as following "Then we can
> > > confirm the modified swiotlb size in the boot log:" there is a log
> > > fragment showing the same original size of 64Mb.
> >
> > It doesn't.  We also do not add hacks to the kernel for whacky out
> > of tree modules.
>
> Also, Option 1 listed in the webpage seems to be a lot better. Any
> reason you can't do that? Because that option both solves the problem
> and increases performance.



--
Best Regards, Roman.

