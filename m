Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319DF392E42
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133178.248300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFS1-0002ju-3H; Thu, 27 May 2021 12:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133178.248300; Thu, 27 May 2021 12:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFS0-0002h2-VU; Thu, 27 May 2021 12:49:24 +0000
Received: by outflank-mailman (input) for mailman id 133178;
 Thu, 27 May 2021 12:49:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFS0-0002ge-2a
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:49:24 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cb6396f-143e-4d30-9ff0-52ed772ddf1a;
 Thu, 27 May 2021 12:49:23 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id f22so537372pfn.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 05:49:23 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com.
 [209.85.210.173])
 by smtp.gmail.com with ESMTPSA id x19sm1765169pgj.66.2021.05.27.05.49.21
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 05:49:21 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id p39so490407pfw.8
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 05:49:21 -0700 (PDT)
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
X-Inumbo-ID: 2cb6396f-143e-4d30-9ff0-52ed772ddf1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9nQbEpq5kzp2vshpX/2KDY0MEdzNS47SlLJX4RAhzA=;
        b=XnDncQEfy0WK93TP5b5iaOvQy6p3tli5hK7U2lnqkRYfpimdp+9WScU0B/bVffV6lu
         KHvuv/cILlR7hwxjPwG4fSm8TLb0M0uiiQtfQGCy1lJiDeCNSlZdr9ro+4UoS7qK25VN
         Vwx6crrIG7NXb3xhmTS0AaKdDSprMjL64yAgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9nQbEpq5kzp2vshpX/2KDY0MEdzNS47SlLJX4RAhzA=;
        b=GF+M6rtH0gCPc7HlgOvao3urIcOcRuPlUmEPPdeYP77P/QuszLc71gQs6+GSJPKV4B
         35MaKvUjGMbl8yZsGu/j20F+k3soRfcavB1rdMdXe24xsooFzj+khqAcVWx69kJ5MMZg
         BR7bNvLBieTEQHMB7E2J+Y6YST0cFr2DA6z700rJ2Lw2Yox6R6u3UNxYAIAP5e6l+hFJ
         nwEM8p0ykJ7s/wnE5maoHs/kpMtBTu0Zzl7lmw1ewqbi+ntQe8pt0b7oElnLHpOdEr6k
         EU9ksdW/v8KP4/9wLzta0vnH4gQXIlc4hAEzmP81L8d/OpJ3wE5+OMlvDsvMlTOWJxhi
         CK+A==
X-Gm-Message-State: AOAM530HIiHZ+wWqU5/0zC6DXhEldfp4sMZLUOcmmVZKV2BOnAHzUPQK
	xDV2ep6n846TObO2+eOhyn68zXyeFPUE0w==
X-Google-Smtp-Source: ABdhPJwcOoooqpJVylmkhZjQnlm1irgkO2N17Sw+W5Zt9spC+SnUo20D/T5CGiKAr1ze/jetG7EZdQ==
X-Received: by 2002:a63:e015:: with SMTP id e21mr3574227pgh.442.1622119762184;
        Thu, 27 May 2021 05:49:22 -0700 (PDT)
X-Received: by 2002:a92:2907:: with SMTP id l7mr2908573ilg.64.1622119750871;
 Thu, 27 May 2021 05:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org> <20210526121322.GA19313@willie-the-truck>
 <20210526155321.GA19633@willie-the-truck> <CALiNf2_sVXnb97++yWusB5PWz8Pzfn9bCKZc6z3tY4bx6-nW8w@mail.gmail.com>
 <20210527113456.GA22019@willie-the-truck>
In-Reply-To: <20210527113456.GA22019@willie-the-truck>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 27 May 2021 20:48:59 +0800
X-Gmail-Original-Message-ID: <CALiNf2_Qk5DmZSJO+jv=m5V-VFtmL9j0v66UY6qKmM-2pr3tRQ@mail.gmail.com>
Message-ID: <CALiNf2_Qk5DmZSJO+jv=m5V-VFtmL9j0v66UY6qKmM-2pr3tRQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
To: Will Deacon <will@kernel.org>
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com, 
	peterz@infradead.org, benh@kernel.crashing.org, 
	joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org, 
	chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org, 
	Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org, sstabellini@kernel.org, 
	Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Christoph Hellwig <hch@lst.de>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com, linux-pci@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>, 
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com, 
	linux-devicetree <devicetree@vger.kernel.org>, Jianxiong Gao <jxgao@google.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	maarten.lankhorst@linux.intel.com, airlied@linux.ie, 
	Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, 
	jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com, 
	Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	xypron.glpk@gmx.de, Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 27, 2021 at 7:35 PM Will Deacon <will@kernel.org> wrote:
>
> On Thu, May 27, 2021 at 07:29:20PM +0800, Claire Chang wrote:
> > On Wed, May 26, 2021 at 11:53 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Wed, May 26, 2021 at 01:13:22PM +0100, Will Deacon wrote:
> > > > On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> > > > > @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > > > >             memory-region = <&multimedia_reserved>;
> > > > >             /* ... */
> > > > >     };
> > > > > +
> > > > > +   pcie_device: pcie_device@0,0 {
> > > > > +           memory-region = <&restricted_dma_mem_reserved>;
> > > > > +           /* ... */
> > > > > +   };
> > > >
> > > > I still don't understand how this works for individual PCIe devices -- how
> > > > is dev->of_node set to point at the node you have above?
> > > >
> > > > I tried adding the memory-region to the host controller instead, and then
> > > > I see it crop up in dmesg:
> > > >
> > > >   | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved
> > > >
> > > > but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
> > > > so the restricted DMA area is not used. In fact, swiotlb isn't used at all.
> > > >
> > > > What am I missing to make this work with PCIe devices?
> > >
> > > Aha, looks like we're just missing the logic to inherit the DMA
> > > configuration. The diff below gets things working for me.
> >
> > I guess what was missing is the reg property in the pcie_device node.
> > Will update the example dts.
>
> Thanks. I still think something like my diff makes sense, if you wouldn't mind including
> it, as it allows restricted DMA to be used for situations where the PCIe
> topology is not static.
>
> Perhaps we should prefer dev->of_node if it exists, but then use the node
> of the host bridge's parent node otherwise?

Sure. Let me add in the next version.

>
> Will

