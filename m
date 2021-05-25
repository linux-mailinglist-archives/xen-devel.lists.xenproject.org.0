Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0FF38F899
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 05:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132047.246460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llNWy-0002JK-Fc; Tue, 25 May 2021 03:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132047.246460; Tue, 25 May 2021 03:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llNWy-0002Ge-C4; Tue, 25 May 2021 03:14:56 +0000
Received: by outflank-mailman (input) for mailman id 132047;
 Tue, 25 May 2021 03:14:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wpal=KU=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1llNWw-0002GY-K1
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 03:14:54 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c824c4e-0b7c-43d2-83ad-dc7a48f52b35;
 Tue, 25 May 2021 03:14:53 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id v12so15632176plo.10
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 20:14:53 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com.
 [209.85.215.180])
 by smtp.gmail.com with ESMTPSA id s48sm11769117pfw.205.2021.05.24.20.14.52
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:14:52 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id f22so20665987pgb.9
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 20:14:52 -0700 (PDT)
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
X-Inumbo-ID: 8c824c4e-0b7c-43d2-83ad-dc7a48f52b35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VHDFyefEfXv2T1h/kXDPOn5vVw8tSm/6FW05x+E2j40=;
        b=merHIeKNi5Uu6C9TAUujDNIN9FxrI34YUx7aW4WyFELIyYppIt99C4UwGvzWaArcmu
         9EaYZFbnrmtDjrMZ7c8349ke6DKJjWiZDCUD5epOu2PqMIr5kYM1CoXZ0XNE1vQ3QFiu
         bvf2bDyHaIMES3MNNrHcengJbyjgwpDl3VY20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VHDFyefEfXv2T1h/kXDPOn5vVw8tSm/6FW05x+E2j40=;
        b=Js231dBlhRiGjOhCB0xtNDckY6CR4/sSb50FwrGm+vD/Zalcm67TcSZ2mfr7AWpV3I
         UnmN2DwMIqcc/R6XYlnaLBBKZZmkIj0uJoHAu3zWjM00ao3/nG5k8OkhG8TWUC591ISM
         px2Q/vfk35yx+tshIBD1talopiyBigAP1GInUrkdCEPKqAE81+5eu+kNrG6wwWsamZi2
         hYLdTLl+eatoGILhJSqRN2DsKPvDcOXrTaOD67IcfNYvLFhINwtp9LfYpKWjZ4deTUag
         JLtFxJ+0BEEplQohcG1/lwr4rpYuXLF0OmlxZrghDX/3//xN/RbFmCm7DlVqtJaSx/qI
         kVAA==
X-Gm-Message-State: AOAM531B7+nQ4M66lWuG7CJl+DtGVPQrZLr8aJVNMtc70cPI8dCNvgOj
	WnrGymOuEOraLkVnsksZYLPKbVyt+5AMpw==
X-Google-Smtp-Source: ABdhPJyVB6HbPdbfwPGUg++s80co/GUFVU14nQLwF+soWxwWrwoFgdh3VEcI/qlLhdNXNxT3jRZ5Yw==
X-Received: by 2002:a17:90a:6f06:: with SMTP id d6mr28281937pjk.216.1621912492879;
        Mon, 24 May 2021 20:14:52 -0700 (PDT)
X-Received: by 2002:a6b:7b08:: with SMTP id l8mr16990516iop.50.1621912094090;
 Mon, 24 May 2021 20:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org> <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
 <CALiNf2-9fRbH3Xs=fA+N1iRztFxeC0iTsyOSZFe=F42uwXS0Sg@mail.gmail.com> <YKvL865kutnHqkVc@0xbeefdead.lan>
In-Reply-To: <YKvL865kutnHqkVc@0xbeefdead.lan>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 25 May 2021 11:08:03 +0800
X-Gmail-Original-Message-ID: <CALiNf2_iq3OS+95as4fj+AOMDVYgGL71A1811QLaZ=5T7TRjww@mail.gmail.com>
Message-ID: <CALiNf2_iq3OS+95as4fj+AOMDVYgGL71A1811QLaZ=5T7TRjww@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
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

On Mon, May 24, 2021 at 11:53 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> > > do the set_memory_decrypted()+memset(). Is this okay or should
> > > swiotlb_init_io_tlb_mem() add an additional argument to do this
> > > conditionally?
> >
> > I'm actually not sure if this it okay. If not, will add an additional
> > argument for it.
>
> Any observations discovered? (Want to make sure my memory-cache has the
> correct semantics for set_memory_decrypted in mind).

It works fine on my arm64 device.

> >
> > > --
> > > Florian

