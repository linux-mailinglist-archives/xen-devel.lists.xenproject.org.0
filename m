Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED9211489
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 22:48:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqjdx-0007gK-Pt; Wed, 01 Jul 2020 20:47:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E/dH=AM=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jqjdv-0007gF-QM
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 20:47:43 +0000
X-Inumbo-ID: 1998bf1f-bbdc-11ea-877f-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1998bf1f-bbdc-11ea-877f-12813bfff9fa;
 Wed, 01 Jul 2020 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593636458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MbiyraTJ4trv3FWb4qCBJhr5R70RrnDBw9rQbrUZ784=;
 b=VfFIRYhyN7UAlCmU4ycy3YjrdUnZaix3K83yEmCJ4yw+0MKL3BwuvHujojAeGw/KHJUYyy
 Y6SsKzUGNYq4BV0q2xfZCxCjGX4LJA3yWuprFF0sVrh4rQU/MTjyXc6+cmBsvv5uUMLYRf
 309S+3va0D9/K/zDx6wiFR3gKOdZ6+w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-pzifr3PYPOaCxAU1JTkHBA-1; Wed, 01 Jul 2020 16:47:36 -0400
X-MC-Unique: pzifr3PYPOaCxAU1JTkHBA-1
Received: by mail-wm1-f72.google.com with SMTP id g6so19422509wmk.4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 13:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MbiyraTJ4trv3FWb4qCBJhr5R70RrnDBw9rQbrUZ784=;
 b=T9LXlIa4WkX/hNvS0JTUDTVhQ4Nuc5ygJvRgicYzdxV67DOIf8Ji3HodbouPDyoK7U
 8ClqaP1WvvlE16QJBDaP3RXfKhNQYDKGKmK/GmdbD3gwLPuwU2CO4RJgGfOYF674IcBx
 YT8Px/md2ChNNIiCYehDlh2meoAfkD3qtddjVbiUdscLs8dBRN9bVWRoVxCNO39borUH
 tUGqBusPnrb/gvewWec1N6+7deeW0V0sojEd0PhKzHG95K2ptPS4d7olq3PEi0a6nmGK
 +vooptsiIizrk7X4uIb85kN6rYXdIonPpztChNiIDFIekrXL4pnEQRCqoxOqr6xiz7gC
 gTlg==
X-Gm-Message-State: AOAM533wwWHQnNmAjierE0nmdqzKhKdnFdhz9NsBHPplt+XxtZlcaVn7
 NdTxvNQTGC2d2s1zhPjKg3mvG7BOD9hVzx9zHmpKL7fuCv6YNWMakUEfExigk/vrig8QThHjNIw
 EmyMVksT8/8VY76RxV9/emUKDZ84=
X-Received: by 2002:adf:ed47:: with SMTP id u7mr30433368wro.201.1593636455515; 
 Wed, 01 Jul 2020 13:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi4/QeFIvFvIhW8MFrahcm+NHf1Nr8du8L4WlMn+iG6s23576AuHveqgE2W9yZnAvkgrNyJg==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr30433344wro.201.1593636455219; 
 Wed, 01 Jul 2020 13:47:35 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 h2sm8337653wrw.62.2020.07.01.13.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 13:47:32 -0700 (PDT)
Date: Wed, 1 Jul 2020 16:47:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200701164501-mutt-send-email-mst@kernel.org>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> On Wed, 1 Jul 2020, Christoph Hellwig wrote:
> > On Mon, Jun 29, 2020 at 04:46:09PM -0700, Stefano Stabellini wrote:
> > > > I could imagine some future Xen hosts setting a flag somewhere in the
> > > > platform capability saying "no xen specific flag, rely on
> > > > "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> > > > How about that?
> > > 
> > > Yes, that would be fine and there is no problem implementing something
> > > like that when we get virtio support in Xen. Today there are still no
> > > virtio interfaces provided by Xen to ARM guests (no virtio-block/net,
> > > etc.)
> > > 
> > > In fact, in both cases we are discussing virtio is *not* provided by
> > > Xen; it is a firmware interface to something entirely different:
> > > 
> > > 1) virtio is used to talk to a remote AMP processor (RPMesg)
> > > 2) virtio is used to talk to a secure-world firmware/OS (Trusty)
> > >
> > > VIRTIO_F_ACCESS_PLATFORM is not set by Xen in these cases but by RPMesg
> > > and by Trusty respectively. I don't know if Trusty should or should not
> > > set VIRTIO_F_ACCESS_PLATFORM, but I think Linux should still work
> > > without issues.
> > > 
> > 
> > Any virtio implementation that is not in control of the memory map
> > (aka not the hypervisor) absolutely must set VIRTIO_F_ACCESS_PLATFORM,
> > else it is completely broken.
> 
> Lots of broken virtio implementations out there it would seem :-(

Not really, most of virtio implementations are in full control of
memory, being part of the hypervisor.

> 
> > > The xen_domain() check in Linux makes it so that vring_use_dma_api
> > > returns the opposite value on native Linux compared to Linux as Xen/ARM
> > > DomU by "accident". By "accident" because there is no architectural
> > > reason why Linux Xen/ARM DomU should behave differently compared to
> > > native Linux in this regard.
> > > 
> > > I hope that now it is clearer why I think the if (xen_domain()) check
> > > needs to be improved anyway, even if we fix generic dma_ops with virtio
> > > interfaces missing VIRTIO_F_ACCESS_PLATFORM.
> > 
> > IMHO that Xen quirk should never have been added in this form..
> 
> Would you be in favor of a more flexible check along the lines of the
> one proposed in the patch that started this thread:
> 
>     if (xen_vring_use_dma())
>             return true;
> 
> 
> xen_vring_use_dma would be implemented so that it returns true when
> xen_swiotlb is required and false otherwise.

I'll need to think about it. Sounds reasonable on the surface ...

-- 
MST


