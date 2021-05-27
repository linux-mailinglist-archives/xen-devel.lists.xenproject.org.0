Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961FB392CDD
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 13:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133051.248085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEK9-0003d9-QP; Thu, 27 May 2021 11:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133051.248085; Thu, 27 May 2021 11:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEK9-0003aa-My; Thu, 27 May 2021 11:37:13 +0000
Received: by outflank-mailman (input) for mailman id 133051;
 Thu, 27 May 2021 11:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmEK8-0003aU-0Y
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:37:12 +0000
Received: from mail-io1-xd34.google.com (unknown [2607:f8b0:4864:20::d34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f929f86-6d82-4020-9b7f-87c0fa0d12f6;
 Thu, 27 May 2021 11:37:11 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id a8so63783ioa.12
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 04:37:11 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id o2sm1045641ilt.73.2021.05.27.04.37.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 04:37:10 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id b81so113883iof.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 04:37:10 -0700 (PDT)
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
X-Inumbo-ID: 7f929f86-6d82-4020-9b7f-87c0fa0d12f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XepQkdRFyf5QwVg1KdPLbhegPooaNHd/1JiifJ+YyHM=;
        b=J39qajy3UJ3qAzWqGeZGEnwMoSI9LW5BjibS8fd+Acudu4FxBAXa2OhDGjuMcgqW0/
         wo/z5L5WO21v6biwP7ZKEgtIJf223PVujpTOF4zDsL3aPOmxJx+dxaS3A0oSwB4zv/i6
         Jb0bh8tNiRStD2FZiusMVkFxa8G1teBBpM9vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XepQkdRFyf5QwVg1KdPLbhegPooaNHd/1JiifJ+YyHM=;
        b=gQ04b9oWd428YCzvNP367p7os2ct5sn8WAASh6QPxkDtKx0dpWqEcF2yxEUF0ppSg1
         r8TM8DjXppLUTXVS9nmV6SS/TRCT1H4zyQHspHjGbK5Mjk3GMLar7+n3kTqjMqmFPqfi
         7NRlo7R6Ki70xg/OsFEL1eR35WWmnQIPLt/GbqmcXoUvaCSlceGM35dPXJJUeZ5CNQIy
         7wa7zyZaWOqzaIUNPJUZNQEOiQ98yyBdpdtX4M+xq2VprGlRN91NFsJEHrQeZtAjieWf
         pNx2ejycehkHEYNxqOmRvkuLhOQ+k+brVC4G/ur027AtW+2Ui3iAKDgYwDxxiavOVIcL
         XN0g==
X-Gm-Message-State: AOAM532FHm5JA7z+blcucSsI4AKZqWWq8mmVjoISQK/Ck7+Cz61cYQJw
	v1axTE+rnU4lD9mEaoQ5dcn1XyzSr4Ecqw==
X-Google-Smtp-Source: ABdhPJyAJNQAdlO7tYVzqg06vwfMTIMGmYBihPYTT1l9TgwbtaDkTDEk3xWqR3ZOJ48nwEmKfaM5VQ==
X-Received: by 2002:a02:a492:: with SMTP id d18mr3084006jam.28.1622115430727;
        Thu, 27 May 2021 04:37:10 -0700 (PDT)
X-Received: by 2002:a05:6e02:e42:: with SMTP id l2mr2536928ilk.189.1622114971302;
 Thu, 27 May 2021 04:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org> <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck>
In-Reply-To: <20210526155321.GA19633@willie-the-truck>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 27 May 2021 19:29:20 +0800
X-Gmail-Original-Message-ID: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
Message-ID: <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
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

On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
>
> On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > >             memory-region = <&multimedia_reserved>;
> > >             /* ... */
> > >     };
> > > +
> > > +   pcie_device: pcie_device@0,0 {
> > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > +           /* ... */
> > > +   };
> >
> > I still don't understand how this works for individual PCIe devices -- how
> > is dev->of_node set to point at the node you have above?
> >
> > I tried adding the memory-region to the host controller instead, and then
> > I see it crop up in dmesg:
> >
> >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> >
> > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> >
> > What am I missing to make this work with PCIe devices?
>
> Aha, looks like we're just missing the logic to inherit the DMA
> configuration. The diff below gets things working for me.

I guess what was missing is the reg property in the pcie_device node.
Will update the example dts.

