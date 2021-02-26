Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63E325C8A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 05:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90053.170296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFUhD-0001ML-LY; Fri, 26 Feb 2021 04:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90053.170296; Fri, 26 Feb 2021 04:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFUhD-0001Lv-Hx; Fri, 26 Feb 2021 04:25:43 +0000
Received: by outflank-mailman (input) for mailman id 90053;
 Fri, 26 Feb 2021 04:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p7+=H4=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lFUhB-0001Lq-E4
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 04:25:41 +0000
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02e20227-e1b6-4579-80af-699bbfbb792f;
 Fri, 26 Feb 2021 04:25:40 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id x124so8018809qkc.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 20:25:40 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178])
 by smtp.gmail.com with ESMTPSA id i5sm5561183qkg.32.2021.02.25.20.25.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 20:25:39 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id o34so5856436qtd.11
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 20:25:39 -0800 (PST)
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
X-Inumbo-ID: 02e20227-e1b6-4579-80af-699bbfbb792f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDTKQXWPODousjcFxfPrAdhXiScgfthwkHIVsnIoPbM=;
        b=abTtJIMMZ8KToSFWbjzFi32HOkPDN2rxZ+IfBv+eO62ap/dN702Uq0mU9oHC9j+snt
         vnVWV+5jH/p/0R+4U10lm2zTMAo+mTTld64KVC2G+prj4nocAzeugJM4VE5FsldHI9zg
         D677137O5m7d9bvVpQQ+IkqHWrA56M7YEa+Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDTKQXWPODousjcFxfPrAdhXiScgfthwkHIVsnIoPbM=;
        b=ouTlASx9uD0nZPjGKOH9cok0OkWOAdAC88eUn9alnuhg1XqX0Ldgagi4QPI9O/CsrR
         /OKKkIfm/xAqlqPGK6yzccv9euwb7s7OPSxOvfje3WoD5t8trX1B+Kmkp9YPFZ/1iJR6
         PV1PrB2q4Ike2/pB6nN+1s8XAnRhxdkHSri1xa8eSNs9S6ggxnOyotZwqxAVIiEeEDKf
         AWm2YgyaRUSqcwYZPxKZ70HziUTbMYj84ihdwC+UazJq1HgbqNYgU9J0DrnSRmzR8tyr
         jxnOAILdiRyVSQ2jSrPjhGrFuzl79MTApsk5UxolUsMo3MvE63ep3coWWnMi1SA73lXP
         60Ag==
X-Gm-Message-State: AOAM531UQG1e2UrLAkaNyXumgbbTA4M6ci8HvFy6MHfu6BX74KoCSrmI
	bM/3mTVcX1fFvT59HSSi8pTHwZFjQqhgMg==
X-Google-Smtp-Source: ABdhPJyg2D2KQIGgWNwMvhc+5sTEsHjF0RTy6O/6dAd4uNWlJ6/+DnvydUHZNO8uVNaQtQrN5XcPew==
X-Received: by 2002:a37:a7c3:: with SMTP id q186mr1022939qke.475.1614313539774;
        Thu, 25 Feb 2021 20:25:39 -0800 (PST)
X-Received: by 2002:a05:6638:5:: with SMTP id z5mr1097392jao.84.1614313081344;
 Thu, 25 Feb 2021 20:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org> <20210209062131.2300005-13-tientzu@chromium.org>
In-Reply-To: <20210209062131.2300005-13-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 26 Feb 2021 12:17:50 +0800
X-Gmail-Original-Message-ID: <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
Message-ID: <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] swiotlb: Add restricted DMA alloc/free support.
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, 
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

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index fd9c1bd183ac..8b77fd64199e 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -836,6 +836,40 @@ late_initcall(swiotlb_create_default_debugfs);
>  #endif
>
>  #ifdef CONFIG_DMA_RESTRICTED_POOL
> +struct page *dev_swiotlb_alloc(struct device *dev, size_t size, gfp_t gfp)
> +{
> +       struct swiotlb *swiotlb;
> +       phys_addr_t tlb_addr;
> +       unsigned int index;
> +
> +       /* dev_swiotlb_alloc can be used only in the context which permits sleeping. */
> +       if (!dev->dev_swiotlb || !gfpflags_allow_blocking(gfp))

Just noticed that !gfpflags_allow_blocking(gfp) shouldn't be here.

Hi Christoph,

Do you think I should fix this and rebase on the latest linux-next
now? I wonder if there are more factor and clean up coming and I
should wait after that.

Thanks,
Claire

