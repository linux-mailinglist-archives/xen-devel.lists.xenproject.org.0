Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA13A809C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 15:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142129.262403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9HQ-0002ce-7J; Tue, 15 Jun 2021 13:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142129.262403; Tue, 15 Jun 2021 13:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9HQ-0002a4-31; Tue, 15 Jun 2021 13:39:00 +0000
Received: by outflank-mailman (input) for mailman id 142129;
 Tue, 15 Jun 2021 13:38:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62sT=LJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lt9HO-0002YN-KC
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 13:38:58 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c1adcf2-88d9-43e5-b18b-ae43ba116575;
 Tue, 15 Jun 2021 13:38:57 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id 11so8468032plk.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 06:38:57 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173])
 by smtp.gmail.com with ESMTPSA id o1sm15292214pjf.56.2021.06.15.06.38.56
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:38:56 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id g22so6386632pgk.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 06:38:56 -0700 (PDT)
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
X-Inumbo-ID: 3c1adcf2-88d9-43e5-b18b-ae43ba116575
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UDZeAXhtUGNxVigPWnCAmqvhZ5xmOZkpwoxu/kotpBc=;
        b=BkGuougKdpvJFSjPDCYcuDM+EfC9+Z6Iw8t63OKFUyvGcy9WEOaTZOyzUjDtlqxxWx
         b+f6+GiSSKCn4V8zlclen8CemZkaZyLB8FJKB0g3go6na2Mkb6J76IEsPQg2PB5YFP++
         oJX8/uFYscqhRRWgaBEXbZGZq7TD88YFqCsf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UDZeAXhtUGNxVigPWnCAmqvhZ5xmOZkpwoxu/kotpBc=;
        b=JnWWfxBtLo036nf7cRtgRPT/c2uHL+WXrwClMIYjTnFuRrQgFNbLCLkihDn+2txY7E
         uMryeR5B5Mczi4xuBJuOcHPkXs5FKerTviGjbKzDicvByNWqcGH97lksDArXe8uZGA0L
         hh/T6VGtTQNP+XPyBbFtKzS0Ze8H5cWI8B9BHV8LDcMGJtJFwLmiuVP90R7DV5xrM3bx
         qsljRTG8QJKwiDP0uLN76Zf0COpqUOtsQjo/Hkdj+qpoZ+aCr/Mgqh6IVtXU0ZgjnoiF
         wXK5yTqwduvjBKZPMjedaXEqZHu6P0bu1Y2ppYp8iBiPY8ZC4SbtfPjY6iTVs+di//FU
         NbUw==
X-Gm-Message-State: AOAM532dLB+gT9vxHOve9U0HSPgd2WZVWhnhoSnZDgWxRL9JCat114XI
	UrqWRU/4f0jSd30aRKrevFz8HSY0rOHoWQ==
X-Google-Smtp-Source: ABdhPJzREdBjVFcuSEDrKD4wi73XLP8IRPuoOXW1TWztJPM2WUNXdujWw31IKaeHAzIF3hzfWEYeaw==
X-Received: by 2002:a17:90a:9488:: with SMTP id s8mr13783063pjo.236.1623764336931;
        Tue, 15 Jun 2021 06:38:56 -0700 (PDT)
X-Received: by 2002:a05:6e02:219d:: with SMTP id j29mr17936278ila.64.1623763835517;
 Tue, 15 Jun 2021 06:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152659.2142983-1-tientzu@chromium.org>
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 15 Jun 2021 21:30:24 +0800
X-Gmail-Original-Message-ID: <CALiNf28fb4rZ0Afun8wAWRYJY4gqc+-vRvDBZT3x2JgSPL_iVQ@mail.gmail.com>
Message-ID: <CALiNf28fb4rZ0Afun8wAWRYJY4gqc+-vRvDBZT3x2JgSPL_iVQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] Restricted DMA
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

v10 here: https://lore.kernel.org/patchwork/cover/1446882/

