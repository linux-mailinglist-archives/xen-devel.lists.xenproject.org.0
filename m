Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E6326052
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90176.170663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZdq-00049F-Ht; Fri, 26 Feb 2021 09:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90176.170663; Fri, 26 Feb 2021 09:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZdq-00048q-EY; Fri, 26 Feb 2021 09:42:34 +0000
Received: by outflank-mailman (input) for mailman id 90176;
 Fri, 26 Feb 2021 09:42:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p7+=H4=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lFZdo-00048k-Ep
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:42:32 +0000
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dde87779-66cf-4d63-8c80-b8d76fdbea30;
 Fri, 26 Feb 2021 09:42:31 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id f17so8504815qkl.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 01:42:31 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172])
 by smtp.gmail.com with ESMTPSA id e18sm2022868qtr.69.2021.02.26.01.42.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 01:42:30 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id f17so6227997qth.7
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 01:42:30 -0800 (PST)
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
X-Inumbo-ID: dde87779-66cf-4d63-8c80-b8d76fdbea30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E8MT/YBSt9+GOAVKSt/z+/x/oAmJs4mba4MVCW+FEPI=;
        b=YlJGaB2HjeORjhsgYOy8pctb9+8JkGl/ZdIRVJcfQxCMoR62lL7XtrY95NgsqhINjE
         lSgvnnp9tfO6u1oKErjW0g+HTDOG3GFiOyn5d4dJiyFIJKbzFBupmPEB/V7jXmUb4d2q
         N9u5qLxflCWFXhFfzUGrtIkZV0aKvT2pOtERk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8MT/YBSt9+GOAVKSt/z+/x/oAmJs4mba4MVCW+FEPI=;
        b=MMC2fobt7Lm6xF9B04NEfH07G+hH5o+ny3ZW9+FHet0g361WNIrfQ2NaWZnI1qrXh3
         m/ME4NJA1KGXsXwKldjwBSd0Rt6qANkaeSreSTzb5poi+i4k+aHhJAuyCCEjsy08d35w
         iE9wZdklyp1r4TZpb92i81HO3qIb6hSRAkYU8OHjwW9csxKpsk5vFrDFjREfzmrd4aeI
         uCyRHPNJwmw+yyQAP6sDr2KcFYWF2N7k1N3OkD2VZZt5TMfVy8P5JQbBhwiEnfiMOT21
         FvysLwp4eHawFKsEHc2ew8RJvcGqLFEg+jjZH8aOg8vlcAAhJXYhYae5KgaHDtrxDL6d
         cF2w==
X-Gm-Message-State: AOAM531JJOBydc6NrjekXjDuo9gf2wfUmQ4xbIkTkpSMaEb5Dpdhc078
	KsNSX11zA96NTkt4sffXecC7jSLmC9S7Iw==
X-Google-Smtp-Source: ABdhPJxSS17I3z7JFspWlipa+fPiAjwpNkli5sbyFLNN93Z+IBPiUvolmDdVhJWP+YAnudJ196tQiQ==
X-Received: by 2002:a37:8a04:: with SMTP id m4mr1752223qkd.78.1614332551112;
        Fri, 26 Feb 2021 01:42:31 -0800 (PST)
X-Received: by 2002:a02:b61a:: with SMTP id h26mr2057255jam.90.1614332168202;
 Fri, 26 Feb 2021 01:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <20210209062131.2300005-13-tientzu@chromium.org> <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
 <20210226051740.GB2072@lst.de>
In-Reply-To: <20210226051740.GB2072@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 26 Feb 2021 17:35:57 +0800
X-Gmail-Original-Message-ID: <CALiNf29tSQ1R8zh35neQWuWqDPek+Jr8QzyPQQvTsW2cZBMEUw@mail.gmail.com>
Message-ID: <CALiNf29tSQ1R8zh35neQWuWqDPek+Jr8QzyPQQvTsW2cZBMEUw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] swiotlb: Add restricted DMA alloc/free support.
To: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 26, 2021 at 1:17 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Feb 26, 2021 at 12:17:50PM +0800, Claire Chang wrote:
> > Do you think I should fix this and rebase on the latest linux-next
> > now? I wonder if there are more factor and clean up coming and I
> > should wait after that.
>
> Here is my preferred plan:
>
>  1) wait for my series to support the min alignment in swiotlb to
>     land in Linus tree
>  2) I'll resend my series with the further swiotlb cleanup and
>     refactoring, which includes a slightly rebased version of your
>     patch to add the io_tlb_mem structure
>  3) resend your series on top of that as a baseline
>
> This is my current WIP tree for 2:
>
>   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-struct

Sounds good to me. Thanks!

