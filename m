Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387DE3148DF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:33:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83156.154134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MaH-0004hr-EG; Tue, 09 Feb 2021 06:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83156.154134; Tue, 09 Feb 2021 06:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MaH-0004hS-Ap; Tue, 09 Feb 2021 06:33:13 +0000
Received: by outflank-mailman (input) for mailman id 83156;
 Tue, 09 Feb 2021 06:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MaF-0004hN-SJ
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:33:12 +0000
Received: from mail-pg1-x535.google.com (unknown [2607:f8b0:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07582933-33a1-4e8b-9a25-436d3d8a854f;
 Tue, 09 Feb 2021 06:33:11 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id c132so11841643pga.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:33:11 -0800 (PST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com.
 [209.85.210.171])
 by smtp.gmail.com with ESMTPSA id k12sm14634527pfh.123.2021.02.08.22.33.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:33:09 -0800 (PST)
Received: by mail-pf1-f171.google.com with SMTP id u143so5046624pfc.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:33:09 -0800 (PST)
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
X-Inumbo-ID: 07582933-33a1-4e8b-9a25-436d3d8a854f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1yfWtyKyTZvhHLdRd0Os+HgXY0IXloCRl6/1X6y49yY=;
        b=I8sAs6STSD3viziWc9zjdGpRV2Ij0huuBcH4DTqpEpqza+Sa89+jcmi0lEr6QyU3Yc
         L7rP/rH0/RfRBI83gH4R47SJOVgSrDffjCf/VWsaIa4tSZ3K01/puYHwXeA+73O+NMbj
         Mayn3mIGAEUCdMMblgZt8JrLoIUQfDCTzzdMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1yfWtyKyTZvhHLdRd0Os+HgXY0IXloCRl6/1X6y49yY=;
        b=gXLW+Orgd9NH2iFJqloxkyxt73G6XTlJ9wrDmgcYWPZVkbiFlwRC/J9Rywo8hljxJc
         LB2VFKfamKH/wN6AJNKMC9xAhkbW6oo1NFQA7l7Nn47cd5AUYdGcfXgMjashobP2XG1s
         LImyyiZ9NAKPUMP4hyeB4NFKglhn5C8f16jBy1G1kUt0wz23BRtXeefj0Bf3HEMOfjfT
         CGg1zVZmP5Egaeu8wGZQMCcunUHbwtf5SgynoaDHmYrjxIfHxRr0TTQnPTNyVlDIpV2I
         /3vj4rLrcjf7OrXxeb9/famDtz9fMmt/EXGbyA0QtiDtib8KE246s4N5kFQSi1/BCUtM
         huuw==
X-Gm-Message-State: AOAM533pXXIMHNJFJe3Ukq4hQsAENmKKMWaPQTWhrRZqDQ1zMvZsrW++
	msUDYk3ebb2QPQNcwQju2yQE1qTzPhbHbQ==
X-Google-Smtp-Source: ABdhPJz4Ry/aueayWTd0I72d6dGp9pcluMTKmzOFwAZ0XUI3pp2qCPnqf11yVOZHGGgaFArbu0Tt7Q==
X-Received: by 2002:a63:d304:: with SMTP id b4mr20839159pgg.299.1612852390107;
        Mon, 08 Feb 2021 22:33:10 -0800 (PST)
X-Received: by 2002:a6b:144c:: with SMTP id 73mr18274991iou.69.1612852048986;
 Mon, 08 Feb 2021 22:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com> <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
 <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com> <CAAFQd5DX=AdaYSYQbxgnrYYojkM5q7EE_Qs-BYPOiNjcQWbN1A@mail.gmail.com>
 <c7f7941d-b8bd-f0f3-4e40-b899a77188bf@gmail.com> <CAAFQd5AGm4U8hD4jHmw10S7MRS1-ZUSq7eGgoUifMMyfZgP2NA@mail.gmail.com>
 <7fe99ad2-79a7-9c8b-65ce-ce8353e9d9bf@gmail.com>
In-Reply-To: <7fe99ad2-79a7-9c8b-65ce-ce8353e9d9bf@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 9 Feb 2021 14:27:18 +0800
X-Gmail-Original-Message-ID: <CALiNf2_rRufFoxNN=i0_LkVvw31tXetKasm3SrzYy7O8o-sfgg@mail.gmail.com>
Message-ID: <CALiNf2_rRufFoxNN=i0_LkVvw31tXetKasm3SrzYy7O8o-sfgg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, 
	benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	sstabellini@kernel.org, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, 
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
	bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

v4 here: https://lore.kernel.org/patchwork/cover/1378113/

