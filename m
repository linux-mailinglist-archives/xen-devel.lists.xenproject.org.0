Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7A10C14B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 02:10:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia8HR-0001At-V0; Thu, 28 Nov 2019 01:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia8HP-0001Ac-Kt
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 01:07:35 +0000
X-Inumbo-ID: 7623747e-117b-11ea-a3c4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7623747e-117b-11ea-a3c4-12813bfff9fa;
 Thu, 28 Nov 2019 01:07:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58F8E2158A;
 Thu, 28 Nov 2019 01:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574903254;
 bh=dR4C16zZOfpTzKynX+KoP2Ho9J5zj6z/QpvSTtrHGo0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PhQ/t8dE5rG9LzaSP9/XvQWPunGExaUiwkEcL/gSHAO8JyhLKQG2xx07XXPG7yKIz
 TzHmMggazwxo8wL2dkCSb8TElSFPArZiluTiXBJb4Cmv9n7U3QGkgSuzAi8u0TBs3N
 GaMRZUoOZBKwCYR5NNFTk/feCCBRDiUmoPaXclX0=
Date: Wed, 27 Nov 2019 17:07:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@gmail.com>
In-Reply-To: <CAF3u54B5GHVFkmghDPYhO+W4Z3L6bMqg2MnPvvpr7J+FDNq5Xg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1911271039110.27669@sstabellini-ThinkPad-T480s>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <alpine.DEB.2.21.1911261418240.8205@sstabellini-ThinkPad-T480s>
 <CAF3u54B5GHVFkmghDPYhO+W4Z3L6bMqg2MnPvvpr7J+FDNq5Xg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-649525834-1574880147=:27669"
Content-ID: <alpine.DEB.2.21.1911271044170.27669@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-649525834-1574880147=:27669
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1911271044171.27669@sstabellini-ThinkPad-T480s>

On Wed, 27 Nov 2019, Julien Grall wrote:
> On Tue, 26 Nov 2019, 23:18 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Fri, 15 Nov 2019, Stewart Hildebrand wrote:
>       > Allow vgic_get_hw_irq_desc to be called with a vcpu argument.
>       >
>       > Use vcpu argument in vgic_connect_hw_irq.
>       >
>       > vgic_connect_hw_irq is called for PPIs and SPIs, not SGIs. Enforce with
>       > ASSERTs.
>       >
>       > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
>       >
>       > ---
>       > v3: new patch
>       >
>       > ---
>       > Note: I have only modified the old vgic to allow delivery of PPIs.
>       > ---
>       >  xen/arch/arm/gic-vgic.c | 24 ++++++++++++++++--------
>       >  xen/arch/arm/vgic.c     |  6 +++---
>       >  2 files changed, 19 insertions(+), 11 deletions(-)
>       >
>       > diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
>       > index 98c021f1a8..2c66a8fa92 100644
>       > --- a/xen/arch/arm/gic-vgic.c
>       > +++ b/xen/arch/arm/gic-vgic.c
>       > @@ -418,7 +418,7 @@ struct irq_desc *vgic_get_hw_irq_desc(struct domain *d, struct vcpu *v,
>       >  {
>       >      struct pending_irq *p;
>       > 
>       > -    ASSERT(!v && virq >= 32);
>       > +    ASSERT((!v && (virq >= 32)) || (!d && v && (virq >= 16) && (virq < 32)));
> 
>       I don't think !d is necessary for this to work as intended so I would
>       limit the ASSERT to
> 
>         ASSERT((!v && (virq >= 32)) || (v && (virq >= 16) && (virq < 32)));
> 
>       the caller can always pass v->domain
> 
> But then you have the risk to run into d != v->domain. So at least with the ASSERT you document the expectation.

Yes, that was not my intention.

It makes sense in certain scenarios for v to be NULL. What I was trying
to say is that when v is not-NULL, then also d should be not-NULL for
consistency. I don't think it makes sense to pass v corresponding to
vcpu1 of domain2 and d == NULL, right?

I don't know if you want to add a (d == v->domain) check to the ASSERT
as it is pretty busy already. I am OK either way.
--8323329-649525834-1574880147=:27669
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-649525834-1574880147=:27669--

