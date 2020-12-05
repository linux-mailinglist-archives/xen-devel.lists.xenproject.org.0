Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702532CF8A5
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 02:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45163.80670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klMSu-0002AM-L5; Sat, 05 Dec 2020 01:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45163.80670; Sat, 05 Dec 2020 01:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klMSu-0002A0-GG; Sat, 05 Dec 2020 01:34:24 +0000
Received: by outflank-mailman (input) for mailman id 45163;
 Sat, 05 Dec 2020 01:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klMSt-00029v-2k
 for xen-devel@lists.xenproject.org; Sat, 05 Dec 2020 01:34:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa21118-354d-4e9d-ae85-f980706a30f7;
 Sat, 05 Dec 2020 01:34:22 +0000 (UTC)
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
X-Inumbo-ID: efa21118-354d-4e9d-ae85-f980706a30f7
Date: Fri, 4 Dec 2020 17:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607132061;
	bh=Lt/C4lcQ7J2En/RDWQMghfeo3pvnUFnGoPzH5ApaEXI=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=gEE7kXyG7cEHOPuYT1SjhsAUaIEIjLCuhSbFBxAS3rW4lJXO0BVAZGw0xbQPqwcuN
	 urPsFnCKIZILkdb+G3cqtVcCmLPr/I8beaUOT6yNqPP/AC4tNWWNEqZEBwfWeU2XFg
	 DBerUZRFQouIxUpfMtv5Yac7xILwRVOKsSHCfs5daK2lMhUXAzMBPbMU6TwbX3rnMX
	 pYwEdXyXhF6yinw1SeUZGfaftmVWwvLOT12cUlWuzHsIbhN7yzIKsUypftCZu6ggJI
	 YWR7HXau8nlaq3NrIMj9HdhuODYLkRlm9SDIC1ZMhI1nWafGpIK0kqhkzzSyoKHKHm
	 uvgW9ujX/3Ozw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>, 
    "Elnikety, Eslam" <elnikety@amazon.com>, 
    'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>, 
    'Anthony PERARD' <anthony.perard@citrix.com>, 
    'George Dunlap' <george.dunlap@citrix.com>, 
    'Christian Lindig' <christian.lindig@citrix.com>, 
    'David Scott' <dave@recoil.org>, 
    'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
In-Reply-To: <19beb5b5a651415c83dfbdaa533e7bed@EX13D32EUC003.ant.amazon.com>
Message-ID: <alpine.DEB.2.21.2012041731540.32240@sstabellini-ThinkPad-T480s>
References: <20201203124159.3688-1-paul@xen.org> <20201203124159.3688-2-paul@xen.org> <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com> <00ee01d6c98b$507af1c0$f170d540$@xen.org> <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com> <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com> <011201d6ca16$ae14ac50$0a3e04f0$@xen.org> <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com> <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org> <5de9f051-4071-4e09-528c-c1fb8345dc25@citrix.com>
 <alpine.DEB.2.21.2012040940160.32240@sstabellini-ThinkPad-T480s> <7184a2de-f711-9683-3db6-7b880def022d@citrix.com> <19beb5b5a651415c83dfbdaa533e7bed@EX13D32EUC003.ant.amazon.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1399719437-1607132013=:32240"
Content-ID: <alpine.DEB.2.21.2012041733430.32240@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1399719437-1607132013=:32240
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2012041733431.32240@sstabellini-ThinkPad-T480s>

On Fri, 4 Dec 2020, Durrant, Paul wrote:
> > -----Original Message-----
> > From: Andrew Cooper <andrew.cooper3@citrix.com>
> > Sent: 04 December 2020 17:45
> > To: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Julien Grall <julien@xen.org>; Jan Beulich <jbeulich@suse.com>; paul@xen.org; Durrant, Paul
> > <pdurrant@amazon.co.uk>; Elnikety, Eslam <elnikety@amazon.com>; 'Ian Jackson' <iwj@xenproject.org>;
> > 'Wei Liu' <wl@xen.org>; 'Anthony PERARD' <anthony.perard@citrix.com>; 'George Dunlap'
> > <george.dunlap@citrix.com>; 'Christian Lindig' <christian.lindig@citrix.com>; 'David Scott'
> > <dave@recoil.org>; 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>; 'Roger Pau Monné'
> > <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> > Subject: RE: [EXTERNAL] [PATCH v5 1/4] domctl: introduce a new domain create flag,
> > XEN_DOMCTL_CDF_evtchn_fifo, ...
> > 
> > CAUTION: This email originated from outside of the organization. Do not click links or open
> > attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On 04/12/2020 17:41, Stefano Stabellini wrote:
> > >>> FAOD, I am sure there might be other features that need to be
> > >>> disabled. But we have to start somewhere :).
> > >> Absolutely top of the list, importance wise, is so we can test different
> > >> configurations, without needing to rebuild the hypervisor (and to a
> > >> lesser extent, without having to reboot).
> > >>
> > >> It is a mistake that events/grants/etc were ever available unilaterally
> > >> in HVM guests.  This is definitely a step in the right direction (but I
> > >> thought it would be too rude to ask Paul to make all of those CDF flags
> > >> at once).
> > > +1
> > >
> > > For FuSa we'll need to be able to disable them at some point soon.
> > 
> > FWIW, I have a proper plan for this stuff, which start alongside the
> > fixed toolstack ABI, and will cover all aspects of optional
> > functionality in a domain.
> > 
> 
> OK. Can we live with this series as it stands until that point? There is some urgency to get at least these two things fixed.

I am happy to take things one step at a time, and this is a good step
forward.
--8323329-1399719437-1607132013=:32240--

