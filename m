Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E03872A8
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128829.241815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litaV-0004Tb-6c; Tue, 18 May 2021 06:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128829.241815; Tue, 18 May 2021 06:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litaV-0004Qj-3Z; Tue, 18 May 2021 06:52:19 +0000
Received: by outflank-mailman (input) for mailman id 128829;
 Tue, 18 May 2021 06:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ/V=KN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1litaT-0004Qd-UT
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:52:17 +0000
Received: from mail-pg1-x529.google.com (unknown [2607:f8b0:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 393078a2-017e-4e09-a9e6-96eb30d28542;
 Tue, 18 May 2021 06:52:17 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id y32so6311420pga.11
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 23:52:17 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com.
 [209.85.215.170])
 by smtp.gmail.com with ESMTPSA id w127sm11382900pfw.4.2021.05.17.23.52.14
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:52:15 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id l70so6341648pga.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 23:52:14 -0700 (PDT)
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
X-Inumbo-ID: 393078a2-017e-4e09-a9e6-96eb30d28542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=okFGSzwxy3Xl1EDwrbsZ6bJWGdPaUEKxSezi4/SE71A=;
        b=KvboTWH6SCfdQ7LLxm6vH9xhTNNbPkylAhr3iqPQWH1QNODKOLIbMt/OYjboWMwVvr
         +KD/UQeQoUETk6OK7TCWS0Utmt5EvBfWbA4IzzRRuwJkDy5Qi3ICeWOTChp1Py6zaNQt
         fa1WHS9ymuIo1ivMcIga1N5vVpkmfX46UnGI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=okFGSzwxy3Xl1EDwrbsZ6bJWGdPaUEKxSezi4/SE71A=;
        b=tEFE/OdqgR+nGsev2IChzSNHDgW3/hM5aFm5QueXwVndSwSKsWY6NsEfImjYKoGt/p
         3y+z+OkG4cLnGoV3eaa/Mj3VT6ejQaJmYYAGe1lmet5IlFOBSZ2mWipqN0bxG5Zksv4Z
         Q/nEHA8zhXxp9hO6+Rd1+9qEPfKWEjtaZxf0pEykP4P2N8525gcaEfwTXs8c52o+Rqe5
         UYdmrhA7c0zCgis6jaRc20vTEg0fJm6vvhpDg65uERgQsfmEMg8d0ZD1zqanXI4btt/d
         bekCyXswWjHEEdG77mRw0Dufpo9Ohj1O/zRHxkpesr6i2Ob8JwMaBr2oSU6dHlqdhud5
         wzzw==
X-Gm-Message-State: AOAM530wtXi+/1Wfl/Z/KKT6C168D3Xg3XoGoCMDsBSYfE/KhZilJqrU
	+vPgGwSDYImVogIDtxB7u+TYPgNzziutcQ==
X-Google-Smtp-Source: ABdhPJybF9TFd7lA+MuSYK+zBgx2S+SGjMxTUOapTnfl+2UGju/4PVYr3NXyV1OZDZk5YxDsUd4lAQ==
X-Received: by 2002:a62:6101:0:b029:215:3a48:4e6e with SMTP id v1-20020a6261010000b02902153a484e6emr3717961pfb.2.1621320736314;
        Mon, 17 May 2021 23:52:16 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a4d:: with SMTP id u13mr3011800ilv.64.1621320723564;
 Mon, 17 May 2021 23:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org> <20210518064215.2856977-6-tientzu@chromium.org>
In-Reply-To: <20210518064215.2856977-6-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 18 May 2021 14:51:52 +0800
X-Gmail-Original-Message-ID: <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
Message-ID: <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
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

Still keep this function because directly using dev->dma_io_tlb_mem
will cause issues for memory allocation for existing devices. The pool
can't support atomic coherent allocation so we need to distinguish the
per device pool and the default pool in swiotlb_alloc.

