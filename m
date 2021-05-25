Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7067138F887
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 05:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132033.246438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llNR4-0000Hl-Gy; Tue, 25 May 2021 03:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132033.246438; Tue, 25 May 2021 03:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llNR4-0000FK-DK; Tue, 25 May 2021 03:08:50 +0000
Received: by outflank-mailman (input) for mailman id 132033;
 Tue, 25 May 2021 03:08:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wpal=KU=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1llNR3-0000FE-EE
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 03:08:49 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2ce7f61-d28c-44b6-ab7b-e1e5aeb4a5c9;
 Tue, 25 May 2021 03:08:48 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 76so29069233qkn.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 20:08:48 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178])
 by smtp.gmail.com with ESMTPSA id e14sm1886525qkl.1.2021.05.24.20.08.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:08:44 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id k19so22216975qta.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 20:08:43 -0700 (PDT)
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
X-Inumbo-ID: b2ce7f61-d28c-44b6-ab7b-e1e5aeb4a5c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUICKcc/sKdAjzKNgq2l5eqYx+k5eTShYrWAkwN1nE8=;
        b=TELw0+2UEzjgBQgY3N9cHf7cvJQg4x1GF5jHbOj/Xhbu2EVYn5hJJdXJJYpk6Mpk8G
         l2k+90bOTlHqSiuws+ej9C6F14blJi9bSItZInf5oUYtu07o9RuIUrgGf8YFYR9loGpy
         S0ow3K1ouDjzn61e3PW37PZcm998eK6VcTTFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUICKcc/sKdAjzKNgq2l5eqYx+k5eTShYrWAkwN1nE8=;
        b=ktD+3gATcLmZPtPI9IpBpDzT+0DPTfLLxu06BS4M7wKxWy3IBBfdV4gTNY4v2mZAtM
         olmbo+csnx1A+ryUbwPJMZYVllCzdUvq5qHKCiI0fPNfrPcGS0Q7jo+DepzpwNHvmdJ8
         1UH5E6rLj5ImJGv3yZd3yc0IYdWxTH3Dn+HyiFO7aYLWZlOuendq+pNKWsVpOkLQt6vZ
         Zix/AAWbDePclQyTaupKsfX/XjHDgjkb0Z5jFzkPaw5fEWykk+foNlfmnI/jlfNlK/l5
         BVX8+oNMbfAT25woxRS+tGAtgQt49HkWkU7w6/T3L1rhP4anSb6cusk6ZnXdrb6/+dvc
         Jeyw==
X-Gm-Message-State: AOAM532g1kKxFWpInEYyD53LLlth2TkvWJ3w8SvFyzJNcNvORQc3A/5S
	f8Gzx7a5KQNFpCWnq6JniRQRcBfgpYkYPg==
X-Google-Smtp-Source: ABdhPJyFHwnQMLAr3c6O6Sq2SD2TuFW7ecf0oESWTbw+0FTln5lHUh7IaNFpGQy9nIBOWxl+102N9A==
X-Received: by 2002:a37:74e:: with SMTP id 75mr32399312qkh.340.1621912126256;
        Mon, 24 May 2021 20:08:46 -0700 (PDT)
X-Received: by 2002:a05:6638:22b4:: with SMTP id z20mr26846805jas.128.1621912112776;
 Mon, 24 May 2021 20:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-5-tientzu@chromium.org> <CALiNf2_AWsnGqCnh02ZAGt+B-Ypzs1=-iOG2owm4GZHz2JAc4A@mail.gmail.com>
 <YKvLDlnns3TWEZ5l@0xbeefdead.lan>
In-Reply-To: <YKvLDlnns3TWEZ5l@0xbeefdead.lan>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 25 May 2021 11:08:21 +0800
X-Gmail-Original-Message-ID: <CALiNf2-M-CQdQaHiFTMfOkON6PEd0Yu_TvaCXKx9vXJ-7o5ffg@mail.gmail.com>
Message-ID: <CALiNf2-M-CQdQaHiFTMfOkON6PEd0Yu_TvaCXKx9vXJ-7o5ffg@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] swiotlb: Add restricted DMA pool initialization
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, boris.ostrovsky@oracle.com, 
	jgross@suse.com, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	benh@kernel.crashing.org, paulus@samba.org, 
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
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, 
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk, 
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matthew.auld@intel.com, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 24, 2021 at 11:49 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Tue, May 18, 2021 at 02:48:35PM +0800, Claire Chang wrote:
> > I didn't move this to a separate file because I feel it might be
> > confusing for swiotlb_alloc/free (and need more functions to be
> > non-static).
> > Maybe instead of moving to a separate file, we can try to come up with
> > a better naming?
>
> I think you are referring to:
>
> rmem_swiotlb_setup
>
> ?

Yes, and the following swiotlb_alloc/free.

>
> Which is ARM specific and inside the generic code?
>
> <sigh>
>
> Christopher wants to unify it in all the code so there is one single
> source, but the "you seperate arch code out from generic" saying
> makes me want to move it out.
>
> I agree that if you move it out from generic to arch-specific we have to
> expose more of the swiotlb functions, which will undo's Christopher
> cleanup code.
>
> How about this - lets leave it as is now, and when there are more
> use-cases we can revisit it and then if need to move the code?
>
Ok! Sounds good!

