Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDB3C7A6E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 02:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155814.287580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3SQD-0004Yk-85; Wed, 14 Jul 2021 00:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155814.287580; Wed, 14 Jul 2021 00:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3SQD-0004Wr-4D; Wed, 14 Jul 2021 00:06:41 +0000
Received: by outflank-mailman (input) for mailman id 155814;
 Wed, 14 Jul 2021 00:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKO9=MG=gmail.com=konrad.r.wilk@srs-us1.protection.inumbo.net>)
 id 1m3SQB-0004Wl-3P
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 00:06:39 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 420999cd-8692-466f-ab65-8da1f374e858;
 Wed, 14 Jul 2021 00:06:38 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id s6so20709299qkc.8
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jul 2021 17:06:38 -0700 (PDT)
Received: from fedora ([130.44.160.152])
 by smtp.gmail.com with ESMTPSA id o1sm128098qta.87.2021.07.13.17.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 17:06:37 -0700 (PDT)
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
X-Inumbo-ID: 420999cd-8692-466f-ab65-8da1f374e858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BRzBORQqhYkIvSSgRD10J8EaiYQ9ItZJaai9Sym40Us=;
        b=teI5WRKub2F/rwFPxCg0ZINCjBfRJc54nJqUFdAMXpGIMiTspU9RrcrUvARcHwoeMd
         CQXv1wJ/Fog/rhWZSvumcNrgcq+BxotT51h+tTiRDV8aZpevQuwsLDR4vyQtZSmmoC6h
         F9IEcsAuWnvI+dAhgG0Eo2jqsi01XmkKdYdzhKwGl4vTdbqsh5/P7DXsca+16o6s1nU2
         2kLICjJFyej3TGeGHMleEoqCSW2m15wa6CXhxq4NskVTucQzPb/x7tap01fpFeI4k0/I
         0oDywPh08J0yunT5JHEEyAcZVTBsHz7FszjRqikpByO6wq8hJu89C/WxnMp4EIv1s5qc
         +urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=BRzBORQqhYkIvSSgRD10J8EaiYQ9ItZJaai9Sym40Us=;
        b=e+pf5FBuZ+zx/jYfaWXM7r5PX1FAh1UOV4M5GiRD1mUREqtWzPHD0uUqVmlfsLgHoD
         EnFksW6jvHyMus6NeImjVUOlqaKg9sZDBCxon3NK1eD1P0wOI+/p7w19B0fSy7uvqMBP
         49XfS4A75UpG9p0EF32ckYQHCh7cnhg2nLGzFg6O5A/H9JMKpyeFeEVx28kPTairmtA1
         50wLIb68Zj1T2GfHXZ/0bJmgH2pLCfAVVSgU/F/VQMCUDECGsRPygk/XLwGghtoazI9U
         V6VvINlDH+2iTefyoJASZ5Q2QEsuxOnUOzV1YGbbJWQJmCwEWJBxufySJX4xficCnjBW
         4Keg==
X-Gm-Message-State: AOAM530IkQw3+AYBs48h72T/5qe/SrWuVcDaIhjye16xkbT0xhNsdoCL
	ZE+BmbvcBx+BFgMCSOXYK98=
X-Google-Smtp-Source: ABdhPJwNdfUqk7dW6v+BkJSkD78e6Hf5RHfzRN9m+TvOapNBOx9APu0hdr4kc7VyqpHBok4bqL0fFQ==
X-Received: by 2002:a05:620a:b85:: with SMTP id k5mr282577qkh.219.1626221197830;
        Tue, 13 Jul 2021 17:06:37 -0700 (PDT)
Sender: Konrad Rzeszutek Wilk <konrad.r.wilk@gmail.com>
Date: Tue, 13 Jul 2021 20:06:33 -0400
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
To: Will Deacon <will@kernel.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
	heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
	peterz@infradead.org, benh@kernel.crashing.org,
	joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
	chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
	Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
	linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
	Thierry Reding <treding@nvidia.com>,
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
	linux-devicetree <devicetree@vger.kernel.org>,
	Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
	maarten.lankhorst@linux.intel.com, airlied@linux.ie,
	Dan Williams <dan.j.williams@intel.com>,
	linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
	Nathan Chancellor <nathan@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	jgross@suse.com, Nicolas Boichat <drinkcat@chromium.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qian Cai <quic_qiancai@quicinc.com>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
	Tom Lendacky <thomas.lendacky@amd.com>, bauerman@linux.ibm.com
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YO4qifiYjL4BTMv4@fedora>
References: <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
 <20210706165720.GC20750@willie-the-truck>
 <YOSMDZmtfXEKerpf@char.us.oracle.com>
 <20210712135645.GA28881@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712135645.GA28881@willie-the-truck>

..snip..
> > > I think the main question I have is how would you like to see patches for
> > > 5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?
> > 
> > Yes that would be perfect. If there are any dependencies on the rc1, I
> > can rebase it on top of that.
> 
> Yes, please, rebasing would be very helpful. The broader rework of
> 'io_tlb_default_mem' is going to conflict quite badly otherwise.

There is a devel/for-linus-5.15 (based on v5.14-rc1) now.

Thank you!
> 
> Cheers,
> 
> Will

