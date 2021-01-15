Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A12F7138
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 04:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67624.120824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0GAL-0004tg-Re; Fri, 15 Jan 2021 03:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67624.120824; Fri, 15 Jan 2021 03:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0GAL-0004tH-OU; Fri, 15 Jan 2021 03:52:49 +0000
Received: by outflank-mailman (input) for mailman id 67624;
 Fri, 15 Jan 2021 03:52:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xiha=GS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l0GAK-0004tC-3a
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 03:52:48 +0000
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b517101-ae94-4c1c-bc72-bde5be87d78a;
 Fri, 15 Jan 2021 03:52:46 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id d13so12500354ioy.4
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 19:52:46 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id o8sm4477295ilc.20.2021.01.14.19.52.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 19:52:45 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id d9so15713491iob.6
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 19:52:45 -0800 (PST)
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
X-Inumbo-ID: 3b517101-ae94-4c1c-bc72-bde5be87d78a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zn/E5DSPd3qJg+DTv9IwC7Z6z2pECZsgPkasFqGe2mo=;
        b=SlbAB2R28TVOPw4dT3y4+YKxnBvZIXRjddrKEDVYjmW3vvG3MDP0dEXICbitCBjDsh
         shg/YaDMPSBJC8TmtKZMEExrMsM7sLlrF7dj4kE9P1DHob7nRhpZZQNoE756taUh2vVw
         OwHAOHom27x10XansCH8DvCa2BNXVtylJjjRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zn/E5DSPd3qJg+DTv9IwC7Z6z2pECZsgPkasFqGe2mo=;
        b=c+r/OCZMMqgnoNDKe9p+ZCWIC1v+5WoxrI83xMJjx/5uHL6PUeOQNTompairJysfJJ
         ir8x7trOP+HSEFjQu3a+KUnb6z+hKWFW1B5Ghvr9eUcSs/3VyAWivVFIeHkLVIFPVT2Q
         lMpqtX4Q39lmlIpVuhQKnpALAkyjLcx9cHCJlVCIjjuVcodUjcCEPZmfj3Vc8YJbK8e0
         brNF9J0GcOUpmTFTW9xVS6MFjq1YjbTZcTqlT12l2WMRnnF1JNCJfnboUFmOgJvXkyZd
         BSmZZf5Ja+sZ1/awTy7BA+SLH07DLbUlwZBBz9tsLPsWSUoFOd1Iqzc/xnP03fLKrFO2
         P00g==
X-Gm-Message-State: AOAM533DhnztGkfd0SN5k2gpIm6iDQzc+W+eSSQ+TcEHINF2CiJa4mZj
	YEBQJlRLHBRRwCyHewWPPRITiSAqHlwJ2Q==
X-Google-Smtp-Source: ABdhPJwWYIWmRf6WC4RqKA5JgAz+yzJpT/Tb7xeRM3DIGJe+hmq22uexEPYpr+tnmXYQ5+n6yWlDjA==
X-Received: by 2002:a6b:dc17:: with SMTP id s23mr2759067ioc.170.1610682765893;
        Thu, 14 Jan 2021 19:52:45 -0800 (PST)
X-Received: by 2002:a5d:9588:: with SMTP id a8mr2906589ioo.34.1610682391276;
 Thu, 14 Jan 2021 19:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-7-tientzu@chromium.org>
 <95e6dd76-5e18-e445-c351-19fba18f36de@gmail.com> <CALiNf29+8Yi93RacsZHr=qYBhQRwqujW6KZVVD=9xPMhpLH5pA@mail.gmail.com>
 <5f276678-3ab2-ddc8-640c-6dbbe173463c@gmail.com>
In-Reply-To: <5f276678-3ab2-ddc8-640c-6dbbe173463c@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 15 Jan 2021 11:46:20 +0800
X-Gmail-Original-Message-ID: <CALiNf28nW0CKsBRw-HQmz=jBJ3vK6cjoQZPu8Zx=Yn=RWPdVWQ@mail.gmail.com>
Message-ID: <CALiNf28nW0CKsBRw-HQmz=jBJ3vK6cjoQZPu8Zx=Yn=RWPdVWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/6] of: Add plumbing for restricted DMA pool
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, benh@kernel.crashing.org, 
	paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, will@kernel.org, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
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
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 15, 2021 at 2:52 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 1/14/21 1:08 AM, Claire Chang wrote:
> > On Wed, Jan 13, 2021 at 7:48 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 1/5/21 7:41 PM, Claire Chang wrote:
> >>> If a device is not behind an IOMMU, we look up the device node and set
> >>> up the restricted DMA when the restricted-dma-pool is presented.
> >>>
> >>> Signed-off-by: Claire Chang <tientzu@chromium.org>
> >>> ---
> >>
> >> [snip]
> >>
> >>> +int of_dma_set_restricted_buffer(struct device *dev)
> >>> +{
> >>> +     struct device_node *node;
> >>> +     int count, i;
> >>> +
> >>> +     if (!dev->of_node)
> >>> +             return 0;
> >>> +
> >>> +     count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> >>> +                                             sizeof(phandle));
> >>
> >> You could have an early check for count < 0, along with an error
> >> message, if that is deemed useful.
> >>
> >>> +     for (i = 0; i < count; i++) {
> >>> +             node = of_parse_phandle(dev->of_node, "memory-region", i);
> >>> +             if (of_device_is_compatible(node, "restricted-dma-pool"))
> >>
> >> And you may want to add here an of_device_is_available(node). A platform
> >> that provides the Device Tree firmware and try to support multiple
> >> different SoCs may try to determine if an IOMMU is present, and if it
> >> is, it could be marking the restriced-dma-pool region with a 'status =
> >> "disabled"' property, or any variant of that scheme.
> >
> > This function is called only when there is no IOMMU present (check in
> > drivers/of/device.c). I can still add of_device_is_available(node)
> > here if you think it's helpful.
>
> I believe it is, since boot loader can have a shared Device Tree blob
> skeleton and do various adaptations based on the chip (that's what we
> do) and adding a status property is much simpler than insertion new
> nodes are run time.
>
> >
> >>
> >>> +                     return of_reserved_mem_device_init_by_idx(
> >>> +                             dev, dev->of_node, i);
> >>
> >> This does not seem to be supporting more than one memory region, did not
> >> you want something like instead:
> >>
> >>                 ret = of_reserved_mem_device_init_by_idx(...);
> >>                 if (ret)
> >>                         return ret;
> >>
> >
> > Yes. This implement only supports one restriced-dma-pool memory region
> > with the assumption that there is only one memory region with the
> > compatible string, restricted-dma-pool, in the dts. IIUC, it's similar
> > to shared-dma-pool.
>
> Then if here is such a known limitation it should be both documented and
> enforced here, you shouldn ot be iterating over all of the phandles that
> you find, stop at the first one and issue a warning if count > 1?

What I have in mind is there might be multiple memory regions, but
only one is for restriced-dma-pool.
Say, if you want a separated region for coherent DMA and only do
streaming DMA in this restriced-dma-pool region, you can add another
reserved-memory node with shared-dma-pool in dts and the current
implementation will try to allocate the memory via
dma_alloc_from_dev_coherent() first (see dma_alloc_attrs() in
/kernel/dma/mapping.c).
Or if you have vendor specific memory region, you can still set up
restriced-dma-pool by adding another reserved-memory node in dts.
Dose this make sense to you? I'll document this for sure.

> --
> Florian

