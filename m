Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8733B2723
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 08:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146404.269378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwIV5-0006ld-MU; Thu, 24 Jun 2021 06:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146404.269378; Thu, 24 Jun 2021 06:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwIV5-0006j0-I4; Thu, 24 Jun 2021 06:06:07 +0000
Received: by outflank-mailman (input) for mailman id 146404;
 Thu, 24 Jun 2021 06:06:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwIV3-0006iu-B0
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 06:06:05 +0000
Received: from mail-pj1-x102b.google.com (unknown [2607:f8b0:4864:20::102b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1370eef6-39c5-45f3-ab48-7649b53915f5;
 Thu, 24 Jun 2021 06:06:02 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id g24so2828737pji.4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jun 2021 23:06:02 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com.
 [209.85.215.178])
 by smtp.gmail.com with ESMTPSA id y20sm1783902pfb.207.2021.06.23.23.06.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 23:06:01 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id y14so3823531pgs.12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jun 2021 23:06:00 -0700 (PDT)
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
X-Inumbo-ID: 1370eef6-39c5-45f3-ab48-7649b53915f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=osJqntoZHJL8VeQbE2d8Gx1TrOiajWQXazXH9w70kIY=;
        b=f09JHaTt6yY9HlwcujpzmyCJbvbUoIE0cZNa0aICkCK68T/rODYze/6/aKRkuFqgtc
         aQSgGc4CEL1bXaOSKVo+xlBop7hH5m1EqqxXbZi8VyWUJmFL6g6BM4X4ZMkMlYffhkXb
         itPPZk67YIl+8XjGG/C0lboNwjIIr80wXQ+NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osJqntoZHJL8VeQbE2d8Gx1TrOiajWQXazXH9w70kIY=;
        b=JA9l4y1CQlGzGHurVI/YIDS/dvEfcOL9QrUn5BNIopAh5x7z95mEr7LThxhzzlduvu
         YUsLG3wiWf66fgNNf3y/qSBBjmohnsOQCzVb1sBPedfyuqM5xc1UC519thyBi/ZRMQ30
         niHPW/m/NlxQKuk/ZmeCaowWSWqjYjVsui3xjq4MQX9AtO17yWEAAuvBUxjUAvzz9P7q
         WuzT/KMUmEUdDnUfSGmM6NeuAx+qDN96oTdW+zdGtnTOaC0GnU/6WknbAWuGfV2Wcgr2
         sk5LGY7V5LI+GB8+g6iDjON6swE5Id/iK0a3vl0sTEGKi6eM0ooSDUdvyMditY7/1Xqo
         kPEQ==
X-Gm-Message-State: AOAM531SWFG6nO2zsYXjX123PHvrSoTv58fJosSIysJF5WHmGjqknTWJ
	XIPZkSw7PNjllBnvVHwSp6iT2YwYy+q4Jw==
X-Google-Smtp-Source: ABdhPJyYGnGF3hSUN83IvCiIWaDz07IZqEnNlJ+NUuqs7DAGSS0jvxUYounIHck5nwoMhD+4su/b1A==
X-Received: by 2002:a17:902:bd96:b029:f3:f285:7d8 with SMTP id q22-20020a170902bd96b02900f3f28507d8mr3065723pls.57.1624514761362;
        Wed, 23 Jun 2021 23:06:01 -0700 (PDT)
X-Received: by 2002:a92:750c:: with SMTP id q12mr2332407ilc.303.1624514749926;
 Wed, 23 Jun 2021 23:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210619034043.199220-1-tientzu@chromium.org> <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com> <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com> <20210624054315.GA25381@lst.de>
In-Reply-To: <20210624054315.GA25381@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 24 Jun 2021 14:05:39 +0800
X-Gmail-Original-Message-ID: <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
Message-ID: <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Christoph Hellwig <hch@lst.de>
Cc: Qian Cai <quic_qiancai@quicinc.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, 
	Marek Szyprowski <m.szyprowski@samsung.com>, heikki.krogerus@linux.intel.com, 
	thomas.hellstrom@linux.intel.com, peterz@infradead.org, 
	benh@kernel.crashing.org, joonas.lahtinen@linux.intel.com, 
	dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, 
	grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, 
	Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com, linux-pci@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>, 
	intel-gfx@lists.freedesktop.org, matthew.auld@intel.com, 
	linux-devicetree <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, 
	maarten.lankhorst@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	jani.nikula@linux.intel.com, Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 1:43 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Jun 23, 2021 at 02:44:34PM -0400, Qian Cai wrote:
> > is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
> >
> > is_swiotlb_force_bounce() was the new function introduced in this patch here.
> >
> > +static inline bool is_swiotlb_force_bounce(struct device *dev)
> > +{
> > +     return dev->dma_io_tlb_mem->force_bounce;
> > +}
>
> To me the crash looks like dev->dma_io_tlb_mem is NULL.  Can you
> turn this into :
>
>         return dev->dma_io_tlb_mem && dev->dma_io_tlb_mem->force_bounce;
>
> for a quick debug check?

I just realized that dma_io_tlb_mem might be NULL like Christoph
pointed out since swiotlb might not get initialized.
However,  `Unable to handle kernel paging request at virtual address
dfff80000000000e` looks more like the address is garbage rather than
NULL?
I wonder if that's because dev->dma_io_tlb_mem is not assigned
properly (which means device_initialize is not called?).

