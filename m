Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20A427382
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 00:15:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204909.360103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYy8t-0005Sm-4L; Fri, 08 Oct 2021 22:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204909.360103; Fri, 08 Oct 2021 22:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYy8t-0005QR-1F; Fri, 08 Oct 2021 22:15:03 +0000
Received: by outflank-mailman (input) for mailman id 204909;
 Fri, 08 Oct 2021 22:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79mX=O4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYy8r-0005QL-EG
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 22:15:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f75e5403-6a11-4ba4-b2a3-706855645a70;
 Fri, 08 Oct 2021 22:15:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34A5261027;
 Fri,  8 Oct 2021 22:14:59 +0000 (UTC)
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
X-Inumbo-ID: f75e5403-6a11-4ba4-b2a3-706855645a70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633731299;
	bh=/sLiL2d0PiSIFZQ+nBDeXSn4pPoVNJHB7od1VoM6hn0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ajVoae3L6wVwtMZPl+PjAiRE2IwrgKHZ1+WZnv/oEjzHOcsNN9OtdV5nhXD1FOW4i
	 jQGXLuPwiwy8PyH2yojjIzgo3OoTLQNkQldlCuDGfJ+njy89d9kn4Ar3pS5PMnLOgI
	 uc1Du06bHbjKE37Y5rmHBrvdQAEUwm6YY+QWBxxftiQK/xpEN2uY3+IPfXhR8IT8zm
	 I8bVX505POjsL2sfjsv0OCIzH/FEb71y83RB/yoW/ctaaybBSk2SmCuYt0ZZlOY5a6
	 ffLX31WbQr0+m1qGYqbRSAuGGwyBq2LJ2z+fzWDcuA3+HcZLP+EfxsR6RHvEW9gncd
	 JZ8VDqwrGkWbw==
Date: Fri, 8 Oct 2021 15:14:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
In-Reply-To: <2fcb101c-28b0-67c5-0f4d-e3d75b9f4d33@gmail.com>
Message-ID: <alpine.DEB.2.21.2110081458120.25528@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-2-git-send-email-olekstysh@gmail.com> <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com> <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com> <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
 <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com> <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com> <alpine.DEB.2.21.2110071311450.414@sstabellini-ThinkPad-T480s> <b8e868a2-9af3-de6c-0683-4bb2ff7821f3@suse.com> <b36e5fb7-6ed0-dc7d-5ed3-c3c9c9ae70b5@gmail.com>
 <ff760c65-1041-aac6-40ed-981f0b900678@suse.com> <2fcb101c-28b0-67c5-0f4d-e3d75b9f4d33@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Oct 2021, Oleksandr wrote:
> On 08.10.21 15:36, Jan Beulich wrote:
> > On 08.10.2021 12:25, Oleksandr wrote:
> > > Just a quick question. What do you think can XEN_DOMCTL_getdomaininfo be
> > > reused to retrieve gpaddr_bits? I don't see why not at the moment, but
> > > maybe there are some implications/concerns which are invisible to me.
> > > 
> > > I see that arch_get_domain_info() is present, so the field will be
> > > common, and each arch will write a value it considers
> > > appropriate. This could be a good compromise to not add an extra domctl
> > > and to not alter domain_create.
> > Technically I think it could be reused. What I'm less certain of is
> > whether the specific piece of information is a good fit there.
> 
> ok, thank you for your answer.
> 
> I am also not 100% sure whether it is a *good* fit there, but I cannot say it
> is not fit at all for being there. I might mistake, but it is almost the same
> piece of information describing the whole domain as other existing fields in
> that structure.

From a domctl point of view, it looks like XEN_DOMCTL_getdomaininfo
could be a decent fit. Looking at the data structure, the arch specific
member of struct xen_domctl_getdomaininfo is:

  struct xen_arch_domainconfig arch_config;

which is actually the very same struct used in struct
xen_domctl_createdomain for XEN_DOMCTL_createdomain, but somehow it
doesn't get populated by neither the x86 nor the ARM version of
arch_get_domain_info?


In any case, I think we could make use of XEN_DOMCTL_getdomaininfo for
this. In that case, I would add a new common field to struct
xen_domctl_getdomaininfo after cpupool and above arch_config.

Then we can set the field from arch_get_domain_info.

