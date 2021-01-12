Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3912F2924
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 08:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65495.116053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzEPE-0000RV-UU; Tue, 12 Jan 2021 07:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65495.116053; Tue, 12 Jan 2021 07:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzEPE-0000R6-RE; Tue, 12 Jan 2021 07:47:56 +0000
Received: by outflank-mailman (input) for mailman id 65495;
 Tue, 12 Jan 2021 07:47:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNLj=GP=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kzEPD-0000R1-Ba
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 07:47:55 +0000
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a494c3c-b5dd-4948-8f12-72d22f174c01;
 Tue, 12 Jan 2021 07:47:54 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 143so1110682qke.10
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 23:47:54 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181])
 by smtp.gmail.com with ESMTPSA id f5sm807312qto.67.2021.01.11.23.47.51
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 23:47:52 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id j26so1013711qtq.8
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 23:47:51 -0800 (PST)
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
X-Inumbo-ID: 0a494c3c-b5dd-4948-8f12-72d22f174c01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j7gLFMlxBCQENVWtNxS2npLHFlF1Oh0HPmJ2b4uXz4E=;
        b=Muj3J6AUcKeWXk2QVKpBxfCJmD1ZNU3ECoTrLMhnZ3l10BcmT1KWV3KJZVJiyjnmgp
         tXnYNLGybukalejR/JL4Ccq0hthA+yksiWl3Xj9n38DlJXhcHL4x7k7Hi60j74u9oC5X
         xVXg0JvakYs/Mgnk3DB5tWgDJ2Wm5qz5NT8oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j7gLFMlxBCQENVWtNxS2npLHFlF1Oh0HPmJ2b4uXz4E=;
        b=Oa3apcbV4wI0tAteR7VEip+i9Zzp0LL1r/WbgLTnSpkwsB4iaUe3IXnC2ggtWWvCL+
         juolOOVk0O3NSOI+r8n6DDyMdsFb3Ifz/BAJMDwwE6JaJJr2jSSoQn403QHN3QUMFyHk
         YYL15yL+myslJ7kMay7UmoUDRtMcmykWK2UycXS003XX1ims9QmZMTSiODz5jLTrVLhr
         7NFdJKzj4hIWQPk7bWEwKlzCjuevAy+T++eam41jVqFL1kQtBToUsxyv4Es/v+xbG6QB
         0bkkPOiKlXqf8tn64FBCquoWgyYwsOEh+Lv/gCUTBZX1x82d5HhMpf91zxOOQwzU4aRG
         urow==
X-Gm-Message-State: AOAM531v/9JHE3RZQmLucQOuAJVyVvfn+WLgMp22jt7QdZRSN+O2Eusj
	2DEMgAC/FbbSKlG+lbQ9dSN3VD+u/URqKg==
X-Google-Smtp-Source: ABdhPJzYBBUNiHzy/KAKPt3FBBXb8dzo48raxZMt12xAAHNxtCZeyLYwC4fg0m4z/eCZ8wn01L1a9w==
X-Received: by 2002:a05:620a:14a:: with SMTP id e10mr3090958qkn.103.1610437672704;
        Mon, 11 Jan 2021 23:47:52 -0800 (PST)
X-Received: by 2002:a05:6638:c52:: with SMTP id g18mr3073726jal.84.1610437670186;
 Mon, 11 Jan 2021 23:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-6-tientzu@chromium.org>
 <20210106185757.GB109735@localhost.localdomain> <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
 <20210107180032.GB16519@char.us.oracle.com> <4cce7692-7184-9b25-70f2-b821065f3b25@gmail.com>
In-Reply-To: <4cce7692-7184-9b25-70f2-b821065f3b25@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 12 Jan 2021 15:47:39 +0800
X-Gmail-Original-Message-ID: <CALiNf29Kqr1WP3BEjX-y5Xtife7AinqiXAcRD2g4eB9isTaXfQ@mail.gmail.com>
Message-ID: <CALiNf29Kqr1WP3BEjX-y5Xtife7AinqiXAcRD2g4eB9isTaXfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, 
	benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, will@kernel.org, 
	Frank Rowand <frowand.list@gmail.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	sstabellini@kernel.org, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, 
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
	bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rdunlap@infradead.org, 
	dan.j.williams@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 2:15 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/7/21 10:00 AM, Konrad Rzeszutek Wilk wrote:
> >>>
> >>>
> >>>  - Nothing stops the physical device from bypassing the SWIOTLB buffer.
> >>>    That is if an errant device screwed up the length or DMA address, the
> >>>    SWIOTLB would gladly do what the device told it do?
> >>
> >> So the system needs to provide a way to lock down the memory access, e.g. MPU.
> >
> > OK! Would it be prudent to have this in the description above perhaps?
>
> Yes this is something that must be documented as a requirement for the
> restricted DMA pool users, otherwise attempting to do restricted DMA
> pool is no different than say, using a device private CMA region.
> Without the enforcement, this is just a best effort.

Will add in the next version.

> --
> Florian

