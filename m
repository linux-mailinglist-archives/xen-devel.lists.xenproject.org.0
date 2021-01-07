Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3457C2ED5F4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 18:47:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63017.111850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZNV-0001Ku-U9; Thu, 07 Jan 2021 17:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63017.111850; Thu, 07 Jan 2021 17:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZNV-0001KV-Qd; Thu, 07 Jan 2021 17:47:17 +0000
Received: by outflank-mailman (input) for mailman id 63017;
 Thu, 07 Jan 2021 17:47:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lGT/=GK=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kxZNU-0001KP-S4
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 17:47:16 +0000
Received: from mail-il1-x134.google.com (unknown [2607:f8b0:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8c729a5-bec3-4e41-88b7-81dee25e8734;
 Thu, 07 Jan 2021 17:47:16 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id w12so7501438ilm.12
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 09:47:16 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id n11sm3447076ioh.37.2021.01.07.09.47.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 09:47:15 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id u12so7542849ilv.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 09:47:15 -0800 (PST)
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
X-Inumbo-ID: c8c729a5-bec3-4e41-88b7-81dee25e8734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BpWY74vWVa1L8Raewx13V4/TopbXG6j16e2kYWK8TMo=;
        b=RjsCv0SB3G2nr2VhqjbT5oDz8W7DNBKHdnzTnNqkj1iJof0+bV7fP3DrwRkndy/u4k
         Ygt4ObgL6c6fDwINAZBbrt6q9Nyu03KM8Jtf+6CaIHJDQhHurg1bvBaIn5xYb5DYi3P3
         O7pPyZUh0Fpetb+g793rmuwtHVk+BC0HuhiVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BpWY74vWVa1L8Raewx13V4/TopbXG6j16e2kYWK8TMo=;
        b=NYu7z0xazzdI8tF8wn4Cci+o/PQvGAJMLl4CKM29jBdLEZqnfodhVrE1PwjOn2Iuqd
         c28SXdYynyEVxPyPr7RgwP+1JW93jtBeoz0MExPR5vtpR+4dMvHGUY1n92Wp+2eEWIx1
         fQ0RDS1q2ceLXUh/RemMqZFU4m4MEii0HfK7TayAXica0V2l3FAwnkiX5gjYRz/jWdV/
         dHGO7IXOAUbeyGPtPbSPm/NwIj8CYpbC4AoQIlJnWJRtCLD/SMpFnd9KugVeCL6n8E4D
         MqOtnN5sc3Y5jYZHLUCZeKEGjaS+aqmPZS7pGbnmUf08a8fSiwC8nAgJ4MO88WJtlcc2
         FpoQ==
X-Gm-Message-State: AOAM533gCB4bX/6z5v8kNcjd+icSwxZ69tMxvYQ+Q7NltGeymYnvnsH0
	YcpjAfCwas2UubMFFCW8Idldf7Cy14xKvi9X
X-Google-Smtp-Source: ABdhPJycR0SW8FVghX1XnCqC0Ulpk1QmjjFTPHr9AR54vJi5/PNSCCRihDwNgpDfZM78m4ec2DVHRw==
X-Received: by 2002:a05:6e02:e45:: with SMTP id l5mr2698ilk.294.1610041635627;
        Thu, 07 Jan 2021 09:47:15 -0800 (PST)
X-Received: by 2002:a92:c206:: with SMTP id j6mr9799328ilo.189.1610041168940;
 Thu, 07 Jan 2021 09:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-3-tientzu@chromium.org>
 <20210106185241.GA109735@localhost.localdomain>
In-Reply-To: <20210106185241.GA109735@localhost.localdomain>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 8 Jan 2021 01:39:18 +0800
X-Gmail-Original-Message-ID: <CALiNf2-HDf6tFcvVgCttr-ta=88ZMH=OvB5XoryTPc6MNvwV+Q@mail.gmail.com>
Message-ID: <CALiNf2-HDf6tFcvVgCttr-ta=88ZMH=OvB5XoryTPc6MNvwV+Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, benh@kernel.crashing.org, 
	paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <joro@8bytes.org>, will@kernel.org, Frank Rowand <frowand.list@gmail.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, rafael.j.wysocki@intel.com, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rdunlap@infradead.org, 
	dan.j.williams@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, 
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, xen-devel@lists.xenproject.org, 
	Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg and Konrad,

This change is intended to be non-arch specific. Any arch that lacks DMA access
control and has devices not behind an IOMMU can make use of it. Could you share
why you think this should be arch specific?

Thanks!

