Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07E38F886
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 05:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132034.246448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llNRD-0000a9-Px; Tue, 25 May 2021 03:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132034.246448; Tue, 25 May 2021 03:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llNRD-0000Xm-MJ; Tue, 25 May 2021 03:08:59 +0000
Received: by outflank-mailman (input) for mailman id 132034;
 Tue, 25 May 2021 03:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wpal=KU=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1llNRB-0000XI-Qm
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 03:08:57 +0000
Received: from mail-il1-x12b.google.com (unknown [2607:f8b0:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4f89e21-2058-4b48-8b0c-866b7b8e71b4;
 Tue, 25 May 2021 03:08:57 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id o9so26884709ilh.6
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 20:08:57 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id z8sm4598705ilq.30.2021.05.24.20.08.55
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:08:55 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id b5so6922288ilc.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 20:08:55 -0700 (PDT)
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
X-Inumbo-ID: f4f89e21-2058-4b48-8b0c-866b7b8e71b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ibLnJElvlxlVpclpJPUNJ2cC/oiUOQSOujwiFR/Tp+s=;
        b=UieisilkjhqvCv5TM4Uhta7TWRN2Fo+qizEnyHuJxA4va8bXfSD+rLVykfuHhWprMs
         LshPVy4dFsoXIkmd56qov4ggYtlL759ArIJ4nJdiIlOu+d8oU3Tdh/1w/BJ1fDxfpbcA
         V3s9TTUmNV6cOGqUjcXpB0nmY9PGjsUH8vbqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ibLnJElvlxlVpclpJPUNJ2cC/oiUOQSOujwiFR/Tp+s=;
        b=PWJbCHlauLA4u4girKWOySdVYZYv/qu1qpaTJp4nRuFFSIg3sMGrgT6K+aCJGuhgUP
         K0t+cvSZL69uYwKs/jYDGs9xChMn3VbpDLwRY5I1o5Gt91dpD8nMVKo8OmEfaZhBobdC
         L60L1qyyhhqpYYWx+5BnWVyRsk0MoRYpblwnDgMbQ/VNFBl9rErcqyyy06EvFpwKfmia
         kEfy9WbrhEEKNupEXE+5GD6fRgesYV7BOIP9ljK0phBFgm5Z/XkNUGF6V1onFzHQjP+w
         a6QDfqahhtgFTPJ3gOeHmVou+gsyPw/jJ7GN6PmtgH4zh/uU3ULGJ0Og37lZNY6cxRIG
         TAsw==
X-Gm-Message-State: AOAM532qSkzHxHYGeMqrHRNopnvoW0UsyBiSa7IFAGBFnm4xEcJD4seE
	/N/pysog613TUr6m+omALiTSjiF0Zg5BuQ==
X-Google-Smtp-Source: ABdhPJzs3vEWPqSOmGkQ+nFPQJ2FRCf6CxOSIF/NlT+PdgOAA8gGt3a20xinNb3EPEIw9ouI1DQ83g==
X-Received: by 2002:a05:6e02:1a67:: with SMTP id w7mr16335619ilv.137.1621912136278;
        Mon, 24 May 2021 20:08:56 -0700 (PDT)
X-Received: by 2002:a05:6e02:b:: with SMTP id h11mr18955732ilr.18.1621912124990;
 Mon, 24 May 2021 20:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-6-tientzu@chromium.org> <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
 <YKvLc9onyqdsINP7@0xbeefdead.lan>
In-Reply-To: <YKvLc9onyqdsINP7@0xbeefdead.lan>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 25 May 2021 11:08:34 +0800
X-Gmail-Original-Message-ID: <CALiNf28=fn5r_O8ET0TNM6cS7WO0mwXiMzR5z=eJXmNKFWKdzA@mail.gmail.com>
Message-ID: <CALiNf28=fn5r_O8ET0TNM6cS7WO0mwXiMzR5z=eJXmNKFWKdzA@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
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

On Mon, May 24, 2021 at 11:51 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Tue, May 18, 2021 at 02:51:52PM +0800, Claire Chang wrote:
> > Still keep this function because directly using dev->dma_io_tlb_mem
> > will cause issues for memory allocation for existing devices. The pool
> > can't support atomic coherent allocation so we need to distinguish the
> > per device pool and the default pool in swiotlb_alloc.
>
> This above should really be rolled in the commit. You can prefix it by
> "The reason it was done this way was because directly using .."
>

Will add it.

