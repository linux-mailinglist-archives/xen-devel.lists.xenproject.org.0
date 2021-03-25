Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9C349759
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 17:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101482.194184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTGr-0008VK-70; Thu, 25 Mar 2021 16:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101482.194184; Thu, 25 Mar 2021 16:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTGr-0008Uy-3b; Thu, 25 Mar 2021 16:55:45 +0000
Received: by outflank-mailman (input) for mailman id 101482;
 Thu, 25 Mar 2021 16:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8W+0=IX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lPTGp-0008Ut-EH
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 16:55:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80bb549c-78dc-4c5b-b077-53f83f90fcfb;
 Thu, 25 Mar 2021 16:55:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85915619F3;
 Thu, 25 Mar 2021 16:55:41 +0000 (UTC)
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
X-Inumbo-ID: 80bb549c-78dc-4c5b-b077-53f83f90fcfb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616691342;
	bh=gwgutn6RV26VRaTvT5mn5WIaiIxKt72qh3ujkcd4ClY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FU/5oUV0VuFXG4cg2MexEOBRY8MWGow04hyiSa75CykI0YGzvcadrs7sxREqR3KgM
	 /TSs495U9c8yK8V1e3PO/6ThGveRklu0ArwtmtJNIpHDGpwOd4bWRINWCkpqb/zRGJ
	 PMC8McKZD2rPSEf73X6+LtDNm0GxFP/Xr/x9dpCNbQ7XqAXUk8d4XyUp8OTSAtMFUk
	 9J0zM6DcLszwJvC/Z2deKsvqBT0t8jsZRgByCwxg5swz6xIuKMvd3sKKzNLaSgmOvw
	 BiOffSyXmmu37qeMuiMlkrKpStk738HDkPQBtuLVKADfcuBwaaBSHlJwNVNAFYOo84
	 hjkVbpyEahl2w==
Date: Thu, 25 Mar 2021 09:55:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: George Dunlap <George.Dunlap@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Julien Grall <jgrall@amazon.com>, 
    Julien Grall <Julien.grall.oss@gmail.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, Rich Persaud <persaur@gmail.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "luca.fancellu@arm.com" <luca.fancellu@arm.com>, 
    "paul@xen.org" <paul@xen.org>, Adam Schwalm <adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
In-Reply-To: <YFxcqCtnLe0UUVdy@Air-de-Roger>
Message-ID: <alpine.DEB.2.21.2103250945390.439@sstabellini-ThinkPad-T480s>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com> <20210316031814.10311-2-dpsmith@apertussolutions.com> <YFODOnQRAntdETY7@Air-de-Roger> <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com> <YFrxznV1kXeXsRCa@Air-de-Roger>
 <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com> <YFxKjeGGTG5naH/I@Air-de-Roger> <FA42F3EC-AD7B-485A-9B50-8D8F8210C9F6@citrix.com> <YFxcqCtnLe0UUVdy@Air-de-Roger>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-486361768-1616690998=:439"
Content-ID: <alpine.DEB.2.21.2103250950020.439@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-486361768-1616690998=:439
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2103250950021.439@sstabellini-ThinkPad-T480s>

On Thu, 25 Mar 2021, Roger Pau Monné wrote:
> On Thu, Mar 25, 2021 at 10:14:31AM +0100, George Dunlap wrote:
> > 
> > 
> > > On Mar 25, 2021, at 8:32 AM, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > > 
> > > On Wed, Mar 24, 2021 at 05:53:26AM -0700, Christopher Clark wrote:
> > >> On Wed, Mar 24, 2021 at 1:01 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > >>> 
> > >>> On Tue, Mar 23, 2021 at 10:39:53AM -0700, Christopher Clark wrote:
> > >>>> On Thu, Mar 18, 2021 at 9:43 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > >>> If you offload domain creation of guests with
> > >>> pci-passthrough devices to a control domain and/or hardware domain,
> > >>> I'm not sure I see the difference from normal domain creation, ie:
> > >>> it's no longer something specific to hyperlaunch, as I could achieve
> > >>> the same by using the existing xendomains init script.
> > >> 
> > >> So that's not what we've proposed, and hopefully not what we'll need to do.
> > >> 
> > >> Do you know if there is a need to perform work to support the
> > >> assignment of PCI devices at the point of domain creation (ie. in
> > >> domain_create), rather than handling it in a later step of domain
> > >> configuration, prior to the domain being started?
> > > 
> > > So while I think you could indeed create a domain from the hypervisor
> > > in a paused state and attach the pci devices later from a
> > > control/hardware domain, I don't see much benefit in doing it. If you
> > > need to end up waiting for a control/hardware domain to attach the
> > > devices and unpause you might as well do the whole domain creation
> > > from such control/hardware domain.
> > 
> > My understanding was that one of the primary advantages of domB was
> > that you could compile and run arbitrary code in whatever language
> > you wanted to, using already known tools.  If *all* we want to do is
> > to assign some pre-defined specific BDFs to specific domains, then
> > sure, we could add that capability to Xen.
> 
> Well, it's not so easy because we require QEMU or pciback ATM on x86
> in order to do pci passthrough to guests, so assigning BDFs to
> specific domains from the hypervisor would need to be done using vPCI
> (which is not yet ready for unprivileged guest usage) and only support
> HVM kind of guests strictly.
> 
> Doing passthrough to PV guests directly from the hypervisor is
> impossible AFAICT without putting pciback inside of the hypervisor.
> 
> > But suppose you wanted
> > to have the flexibility to handle changes in hardware at boot time?
> > “Scan through the PCI bus and assign anything that looks like a
> > network card to domNet, and anything that looks like a USB
> > controller to domUSB” is something you could easily do in domB, but
> > would be way too complicated to add to Xen.
> 
> Right, but then you might as well create the domain from domB instead
> of doing it in the hypervisor?
> 
> I'm not arguing about not using domB, I just don't see the benefit of
> creating a paused domain from the hypervisor that then requires the
> intervention of a further domain (domB) in order to finish creation.
> Won't it be simpler to just create the domain and attach the pci
> devices from domB?

I think that the ability of creating multiple VMs from Xen is actually a
very good one to have for a few reasons. It would align x86 with ARM, it
would be useful in cases where PCI passthrough is not involved, and it
is a powerful tool to have in our toolbox.

I see that handling PCI passthrough at domain creation time can be
difficult, so I think Christopher's solution is a good compromise.

FYI for dom0less/ARM we have been discussing doing device assignment at
creation time, but the idea was to provide the PCI topology in device
tree to Xen to help with discovery.
--8323329-486361768-1616690998=:439--

