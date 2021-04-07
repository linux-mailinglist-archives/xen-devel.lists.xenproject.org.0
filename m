Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C483575B9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 22:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106916.204404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUEZq-0008BO-3X; Wed, 07 Apr 2021 20:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106916.204404; Wed, 07 Apr 2021 20:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUEZq-0008Az-0F; Wed, 07 Apr 2021 20:15:02 +0000
Received: by outflank-mailman (input) for mailman id 106916;
 Wed, 07 Apr 2021 20:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qzdh=JE=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lUEZp-0008Au-5J
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 20:15:01 +0000
Received: from mail-ot1-x335.google.com (unknown [2607:f8b0:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b802661-70ee-45f4-8610-72a3455779bb;
 Wed, 07 Apr 2021 20:15:00 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so24963otq.10
 for <xen-devel@lists.xenproject.org>; Wed, 07 Apr 2021 13:15:00 -0700 (PDT)
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
X-Inumbo-ID: 1b802661-70ee-45f4-8610-72a3455779bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5uG9lxYhHgyiHF740meal13Prr1RWoX7mzKdVlWs8qA=;
        b=V38X0u7hBiNQS6V98F3Advke2RVTgNjoGEEWkd6AtfmjbMPIxmloAjtEWilJrdfY3M
         6HrcDrWFaarELKd767OPpIs9F/wO2tac6dFT3wKS8s2KPYOK7LKhGMo7HvPd8fSD1ymN
         g06j8NxSVxay7Dcxa/ypwTe2eRSEEBV6vv8nLbSzQetDwRA8nvyp7xdn3OQbQ9BAURyA
         87zriKwb7IKSts0aQJO4IMSH8zR04DXJK3na5lTMu22tk0OwAPDNOkXLqW1cwH94+J/L
         X0FbRzhIF/2DAghRUxMRCSI29kv8ZVG6a+80bGQOc4l7fPOHjFl72pGghKdYmuuf2VtV
         t5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5uG9lxYhHgyiHF740meal13Prr1RWoX7mzKdVlWs8qA=;
        b=mohKKmm60HlBiSnR3vlghOX1Hr7oHPPh3qx+82uhXjbxSkwabVr/2n6gndYVOXgeS+
         eUeLfrzpMukHohmi+8dEW2bYnt9lAx2Z0U/i9K1wAGpT9PNX1RTgJcvY4Gxa/2HmCRFZ
         84wvNlMe/UJt5Y9hbNFuL9lu4QEoSrwThxk0mWo8ZLYdyBRKZ+VbA+eS37Fihv2CrCkM
         rqiOV6SOx8VFCuLlfSwgZyKKSMxRWf3s60ch7rUU/BlFDBvBOJj+MmWJliBprbUr9o17
         9RavenVPZHS0T6V+bRs5oWLnuucXTn7Io7ZPneSyfBxHa5Mb31HEBY9UHEWQlfIQdZqW
         1xZg==
X-Gm-Message-State: AOAM531wEmVxaVy/mEAg49L7XNbr8Yu4m/KLfhMlnOEnyeUs1/ZvlWhE
	ic7uGGBxQUT3YG7tl0QrIQt/whvrBMhTdT6FjoM=
X-Google-Smtp-Source: ABdhPJxZ0yYhLwO8KB+jIQ4QIRdiASWJe4pCAauWM4fRWBVdPkAhPu2OZ6M6xs7S3pmdwNck8bhLNEW6y3BVhDklaEw=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr4355501otj.183.1617826499658;
 Wed, 07 Apr 2021 13:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com> <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
 <YFrxznV1kXeXsRCa@Air-de-Roger> <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
 <YFxKjeGGTG5naH/I@Air-de-Roger> <FA42F3EC-AD7B-485A-9B50-8D8F8210C9F6@citrix.com>
 <YFxcqCtnLe0UUVdy@Air-de-Roger> <alpine.DEB.2.21.2103250945390.439@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2103250945390.439@sstabellini-ThinkPad-T480s>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 7 Apr 2021 13:14:48 -0700
Message-ID: <CACMJ4GarYwAOpyeJhh2Udm-e0QXm_mrqsv=rpBDwyJAKSjZzrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <George.Dunlap@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Rich Persaud <persaur@gmail.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "luca.fancellu@arm.com" <luca.fancellu@arm.com>, 
	"paul@xen.org" <paul@xen.org>, Adam Schwalm <adam.schwalm@starlab.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 9:55 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
> On Thu, 25 Mar 2021, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Mar 25, 2021 at 10:14:31AM +0100, George Dunlap wrote:
> > >
> > > > On Mar 25, 2021, at 8:32 AM, Roger Pau Monne <roger.pau@citrix.com>=
 wrote:
> > > > On Wed, Mar 24, 2021 at 05:53:26AM -0700, Christopher Clark wrote:
> > > >> On Wed, Mar 24, 2021 at 1:01 AM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
> > > >>> On Tue, Mar 23, 2021 at 10:39:53AM -0700, Christopher Clark wrote=
:
> > > >>>> On Thu, Mar 18, 2021 at 9:43 AM Roger Pau Monn=C3=A9 <roger.pau@=
citrix.com> wrote:
> > > >>> If you offload domain creation of guests with
> > > >>> pci-passthrough devices to a control domain and/or hardware domai=
n,
> > > >>> I'm not sure I see the difference from normal domain creation, ie=
:
> > > >>> it's no longer something specific to hyperlaunch, as I could achi=
eve
> > > >>> the same by using the existing xendomains init script.
> > > >>
> > > >> So that's not what we've proposed, and hopefully not what we'll ne=
ed to do.
> > > >>
> > > >> Do you know if there is a need to perform work to support the
> > > >> assignment of PCI devices at the point of domain creation (ie. in
> > > >> domain_create), rather than handling it in a later step of domain
> > > >> configuration, prior to the domain being started?
> > > >
> > > > So while I think you could indeed create a domain from the hypervis=
or
> > > > in a paused state and attach the pci devices later from a
> > > > control/hardware domain, I don't see much benefit in doing it. If y=
ou
> > > > need to end up waiting for a control/hardware domain to attach the
> > > > devices and unpause you might as well do the whole domain creation
> > > > from such control/hardware domain.
> > >
> > > My understanding was that one of the primary advantages of domB was
> > > that you could compile and run arbitrary code in whatever language
> > > you wanted to, using already known tools.  If *all* we want to do is
> > > to assign some pre-defined specific BDFs to specific domains, then
> > > sure, we could add that capability to Xen.
> >
> > Well, it's not so easy because we require QEMU or pciback ATM on x86
> > in order to do pci passthrough to guests, so assigning BDFs to
> > specific domains from the hypervisor would need to be done using vPCI
> > (which is not yet ready for unprivileged guest usage) and only support
> > HVM kind of guests strictly.
> >
> > Doing passthrough to PV guests directly from the hypervisor is
> > impossible AFAICT without putting pciback inside of the hypervisor.
> >
> > > But suppose you wanted
> > > to have the flexibility to handle changes in hardware at boot time?
> > > =E2=80=9CScan through the PCI bus and assign anything that looks like=
 a
> > > network card to domNet, and anything that looks like a USB
> > > controller to domUSB=E2=80=9D is something you could easily do in dom=
B, but
> > > would be way too complicated to add to Xen.
> >
> > Right, but then you might as well create the domain from domB instead
> > of doing it in the hypervisor?
> >
> > I'm not arguing about not using domB, I just don't see the benefit of
> > creating a paused domain from the hypervisor that then requires the
> > intervention of a further domain (domB) in order to finish creation.
> > Won't it be simpler to just create the domain and attach the pci
> > devices from domB?
>
> I think that the ability of creating multiple VMs from Xen is actually a
> very good one to have for a few reasons. It would align x86 with ARM, it
> would be useful in cases where PCI passthrough is not involved, and it
> is a powerful tool to have in our toolbox.
>
> I see that handling PCI passthrough at domain creation time can be
> difficult, so I think Christopher's solution is a good compromise.
>
> FYI for dom0less/ARM we have been discussing doing device assignment at
> creation time, but the idea was to provide the PCI topology in device
> tree to Xen to help with discovery.

a quick note:

- thanks for all the feedback and questions in this thread, which we
will cover in the next version of the design document

- we have made available the code developed for our prototype, first
development milestone:
https://github.com/apertussolutions/xen-hyperlaunch/tree/hyperlaunch-protot=
ype-lcm

- we look forward to discussion on the Community Call tomorrow

Christopher

