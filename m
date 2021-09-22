Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FBA414F97
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 20:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193002.343779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6e5-0002OA-8I; Wed, 22 Sep 2021 18:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193002.343779; Wed, 22 Sep 2021 18:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6e5-0002L3-55; Wed, 22 Sep 2021 18:07:01 +0000
Received: by outflank-mailman (input) for mailman id 193002;
 Wed, 22 Sep 2021 18:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mT6e3-0002Kt-Lq
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 18:06:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e077f100-1bcf-11ec-b9c8-12813bfff9fa;
 Wed, 22 Sep 2021 18:06:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3002F6103C;
 Wed, 22 Sep 2021 18:06:57 +0000 (UTC)
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
X-Inumbo-ID: e077f100-1bcf-11ec-b9c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632334017;
	bh=kj4DT4Ve2Tgqljtt6pKuRqGj9inEbX9Imtax6vVXr8I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fmmGp3KAY2OfzHtizPuVVEvI4DHz2UvGjkOq5Mw7IilOpnFIJYlb9Njfx23cghsdv
	 GdhaUy6/E/VpOCWHatWkgv8XspEyuSQW5Fqcs9I5/vcNjPfCwqpYn/kSHXC6h8pHev
	 fEhf/FBzklrOqikHUhp79WFaVlUK9700WlSgw30qcotpsNbcjGofcu0BqW21+ZLd04
	 6Hr24h7fhRoAa5jtkOWD26iCcWR/EsTX6NAVAJSGEAL6039+P8bxprwbses5TIf9+A
	 3muanXuclN3kst/2oD2PMLE68EGaK+OI5fjZBsLYfpS6NmT9DtMVNM7UjakUNGJScX
	 CLRGnDPiYNkGQ==
Date: Wed, 22 Sep 2021 11:06:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
In-Reply-To: <ad798aae-0f8e-219f-59d4-7ff5fe52c984@suse.com>
Message-ID: <alpine.DEB.2.21.2109221105080.17979@sstabellini-ThinkPad-T480s>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com> <YUmj3P3j6f5Gl/xh@MacBook-Air-de-Roger.local> <58e2e6e2-c154-f09f-193e-6bef2b42995f@suse.com> <YUm3yLOfAfqrwgmH@MacBook-Air-de-Roger.local> <24905.47298.105494.711706@mariner.uk.xensource.com>
 <ad798aae-0f8e-219f-59d4-7ff5fe52c984@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-667531506-1632334017=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-667531506-1632334017=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Sep 2021, Jan Beulich wrote:
> On 21.09.2021 12:49, Ian Jackson wrote:
> > Roger Pau Monné writes ("Re: [PATCH] common: guest_physmap_add_page()'s return value needs checking"):
> >> On Tue, Sep 21, 2021 at 12:28:12PM +0200, Jan Beulich wrote:
> >>> On 21.09.2021 11:20, Roger Pau Monné wrote:
> >>>> On Wed, Sep 01, 2021 at 06:06:37PM +0200, Jan Beulich wrote:
> >>>>> The function may fail; it is not correct to indicate "success" in this
> >>>>> case up the call stack. Mark the function must-check to prove all
> >>>>> cases have been caught (and no new ones will get introduced).
> >>>>>
> >>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>
> >>> Thanks. Albeit strictly speaking an ack here isn't enough for the change
> >>> to go in, it would need to be R-b or come from a REST maintainer.
> >>
> >> Oh, FE:
> >>
> >> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> With these, any chance of getting an Arm side ack here as well?

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-667531506-1632334017=:17979--

