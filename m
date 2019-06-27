Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95B75861B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 17:40:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgWTm-0005mk-Nj; Thu, 27 Jun 2019 15:38:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgWTl-0005mf-Ll
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 15:38:29 +0000
X-Inumbo-ID: 9c3f1166-98f1-11e9-be4f-735414ef5475
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c3f1166-98f1-11e9-be4f-735414ef5475;
 Thu, 27 Jun 2019 15:38:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15F7220656;
 Thu, 27 Jun 2019 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561649908;
 bh=y/gAZTbbnke/lqh7QdUGuOmflgUksCdsNFUi5p1cn+Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=le+R9R8oHbhupeZ84H9WlAWk1VY5u3vTXAuYChJqK8ibHz2nIfFizf0NV2mVl4Gl8
 nm4Se7Tx/6oFtvdVm+4oPdMlc6AtKvMbLe+qOUr/0Ap1nHwiQ5tl3AvbSBJ9bxbGDz
 QsFxvxZb1/tvFFO9wCHUmC3YR6P0YNZcwGcmn0YI=
Date: Thu, 27 Jun 2019 08:38:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <4d2fc214-4e8c-6c40-68ec-c35b6f9e5dab@arm.com>
Message-ID: <alpine.DEB.2.21.1906270838170.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-16-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261153580.5851@sstabellini-ThinkPad-T480s>
 <218cf497-cbb5-7213-7678-6294ac3e0882@arm.com>
 <4d2fc214-4e8c-6c40-68ec-c35b6f9e5dab@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1252697341-1561649908=:5851"
Subject: Re: [Xen-devel] [PATCH 15/17] xen/arm64: head: Rework and document
 setup_fixmap()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1252697341-1561649908=:5851
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 27 Jun 2019, Julien Grall wrote:
> Hi Stefano,
> 
> On 26/06/2019 20:30, Julien Grall wrote:
> > On 6/26/19 8:01 PM, Stefano Stabellini wrote:
> > > On Mon, 10 Jun 2019, Julien Grall wrote:
> > > > At the moment, the fixmap table is only hooked when earlyprintk is used.
> > > > This is fine today because in C land, the fixmap is not used by anyone
> > > > until the the boot CPU is switching to the runtime page-tables.
> > > > 
> > > > In the future, the boot CPU will not switch between page-tables to avoid
> > > > TLB conflict. This means the fixmap table will need to be hooked before
> > > > any use. For simplicity, setup_fixmap() will now do that job.
> > > 
> > > Can I ask you to reword this slightly, especially the last sentence? It
> > > took me a while to understand what you meant. I suggest:
> > > 
> > >   In the future, the boot CPU will not switch between page-tables to
> > >   avoid any TLB conflicts. Thus, the fixmap table will need to be always
> > >   hooked before any use. Let's start doing it now in setup_fixmap().
> > > 
> > 
> > I will update the commit message.
> 
> I realized the commit message I wrote is inaccurate and reflected to your
> rewording.
> 
> Not all the platforms will generate a TLB conflict abort. Some of them may
> just decide to use an amalgamation of two entries (see "TLB matching" page
> D5-2500 in ARM DDI 0487D.b).
> 
> I will replace "any TLB conflicts" by "TLB incoherency".
> 
> > 
> > > Acked-by: Stefano Stabellini <sstabellini@kernel.org> >
> 
> Let me know if you are happy with the change suggested.

Yes, that's fine
--8323329-1252697341-1561649908=:5851
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1252697341-1561649908=:5851--

