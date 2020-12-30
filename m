Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44A92E758E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Dec 2020 02:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60065.105326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuQPB-000237-R8; Wed, 30 Dec 2020 01:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60065.105326; Wed, 30 Dec 2020 01:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuQPB-00022p-Lg; Wed, 30 Dec 2020 01:36:01 +0000
Received: by outflank-mailman (input) for mailman id 60065;
 Wed, 30 Dec 2020 01:35:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+AK=GC=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kuQP9-00022k-9l
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 01:35:59 +0000
Received: from mail-ot1-x32d.google.com (unknown [2607:f8b0:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57f04fda-d968-4db1-9c17-d7997681e421;
 Wed, 30 Dec 2020 01:35:58 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id x13so14124890oto.8
 for <xen-devel@lists.xenproject.org>; Tue, 29 Dec 2020 17:35:58 -0800 (PST)
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
X-Inumbo-ID: 57f04fda-d968-4db1-9c17-d7997681e421
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=amZAfth7N9MHObaEskJ2oVMxQjustQxHhRiheZhvHLA=;
        b=Vir7fZetbSUYu4IoHFg7/ScmhYg81ChVEz4mjz0nIDkOqpDwZwxsBT5YduSbMRlD1x
         1GHrWBmXM/EpFoL/C3JKvaGMRdi679aOXLiYAHCQtisubDyp9+DohpGE6+X6uHVUuoE1
         vFnEdavop72iHz66/NcDpBLtya52pXKRXX6p7AZYmPnormMW488BNGiQm+Tiigz2WNyZ
         98sUnU+1kK8Sb6lM4Me29lnx2ZBZ3iDccrkGhB5BwSDAlttfH7lcxQ6VduvqYAtvzRvA
         jwpuyYVmgbJ3vwB4MK4YRge/cSHTl/UHuWOS92/cxtF0V1V7/kXg8R9kGp3RSLMYs13p
         CZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=amZAfth7N9MHObaEskJ2oVMxQjustQxHhRiheZhvHLA=;
        b=dtntHo4UbggoBABv/cmOR21RoQHaJ+954nMBtURixiFMt+5lkh7qqnHe/0+Mxv8thn
         IisejUQ0Mb9+Tkh7haHAYBTI5aShiSa4VB7Q2P5Lx4LL0kGnOR/lEzgWYQcKa3MlOJN5
         euVC3Fd7ZUj7N85MRQZzGz06gKklhgjA1SoFwIEFDsIlYkY5Blvyk8VWnEVfY4DI9+Na
         3qGJl4oy67V1RDEitEj2gUyK6qhAswHG66BY/7NJ0jYg24IuJkJemPMM10VLuet7m577
         MGsBMxs9L0cVVKRyQ5ns1dL+zDVDf2zw9LM4er8FZJxbboEti0sGWjZGrSsNGLI6XMMC
         C+yg==
X-Gm-Message-State: AOAM532NoZRpV2SYQYBmQLjbVx4P5J1TkzicW0chxIYl0RK2H6NkxyZ4
	WEZwHjDTTwvKzRWc4GPNmsX0Dc+G9ADNwElKfTY=
X-Google-Smtp-Source: ABdhPJyS9oo7nhjhS0DwOdV/OPSUIf6YjS9H9E9RIrbI0yBVtE6AbgTnH4rLv5XK2Y9q9hTCVDnOUSgb2gp+vcKIiPw=
X-Received: by 2002:a9d:6048:: with SMTP id v8mr38017652otj.183.1609292157801;
 Tue, 29 Dec 2020 17:35:57 -0800 (PST)
MIME-Version: 1.0
References: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com> <20201229091730.owgpdeekb7pcex7t@Air-de-Roger>
In-Reply-To: <20201229091730.owgpdeekb7pcex7t@Air-de-Roger>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 29 Dec 2020 17:35:46 -0800
Message-ID: <CACMJ4GbT8w_ndH4ULhD9Eq3y+s1vB5n2u=Wk4pRPQLBO-TwS+A@mail.gmail.com>
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Rich Persaud <persaur@gmail.com>, Jean-Philippe Ouellet <jpo@vt.edu>, openxt <openxt@googlegroups.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Julien Grall <jgrall@amazon.com>, James McKenzie <james@bromium.com>, 
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 1:17 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Dec 23, 2020 at 04:32:01PM -0500, Rich Persaud wrote:
> > =EF=BB=BFOn Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@vt.edu> =
wrote:
> > > =EF=BB=BFOn Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> > > <christopher.w.clark@gmail.com> wrote:
> > >> Hi all,
> > >>
> > >> I have written a page for the OpenXT wiki describing a proposal for
> > >> initial development towards the VirtIO-Argo transport driver, and th=
e
> > >> related system components to support it, destined for OpenXT and
> > >> upstream projects:
> > >>
> > >> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/Vi=
rtIO-Argo+Development+Phase+1
>
> Thanks for the detailed document, I've taken a look and there's indeed
> a lot of work to do listed there :). I have some suggestion and
> questions.
>
> Overall I think it would be easier for VirtIO to take a new transport
> if it's not tied to a specific hypervisor. The way Argo is implemented
> right now is using hypercalls, which is a mechanism specific to Xen.
> IMO it might be easier to start by having an Argo interface using
> MSRs, that all hypervisors can implement, and then base the VirtIO
> implementation on top of that interface. It could be presented as a
> hypervisor agnostic mediated interface for inter-domain communication
> or some such.

Thanks - that is an interesting option for a new interface and it
would definitely be advantageous to be able to extend the benefits of
this approach beyond the Xen hypervisor. I have added it to our
planning document to investigate.

> That kind of links to a question, has any of this been discussed with
> the VirtIO folks, either at OASIS or the Linux kernel?

We identified a need within the Automotive Grade Linux community for
the ability to enforce access control, and they want to use VirtIO for
the usual reasons of standardization and to use the existing pool of
available drivers, but there is currently but no good answer for
having both, so we put Argo forward in a presentation the AGL
Virtualization Experts group in August, and they are discussing it.

The slides are available here:
https://lists.automotivelinux.org/g/agl-dev-community/attachment/8595/0/Arg=
o%20and%20VirtIO.pdf

If you think there's anyone we should invite to the upcoming call on
the 14th of January, please let me know off-list.

> The document mentions: "Destination: mainline Linux kernel, via the
> Xen community" regarding the upstreamability of the VirtIO-Argo
> transport driver, but I think this would have to go through the VirtIO
> maintainers and not the Xen ones, hence you might want their feedback
> quite early to make sure they are OK with the approach taken, and in
> turn this might also require OASIS to agree to have a new transport
> documented.

We're aiming to get requirements within the Xen community first, since
there are multiple approaches to VirtIO with Xen ongoing at the
moment, but you are right that a design review by the VirtIO community
in the near term is important. I think it would be helpful to that
process if the Xen community has tried to reach a consensus on the
design beforehand.

> > > thoughts on how to handle device enumeration? hotplug notifications?
> > > - can't rely on xenstore
> > > - need some internal argo messaging for this?
> > > - name service w/ well-known names? starts to look like xenstore
> > > pretty quickly...
> > > - granular disaggregation of backend device-model providers desirable
>
> I'm also curious about this part and I was assuming this would be
> done using some kind of Argo messages, but there's no mention in the
> document. Would be nice to elaborate a little more about this in the
> document.

Ack, noted: some further design work is needed on this.

> > > how does resource accounting work? each side pays for their own deliv=
ery ring?
> > > - init in already-guest-mapped mem & simply register?
> > > - how does it compare to grant tables?
> > >  - do you need to go through linux driver to alloc (e.g. xengntalloc)
> > > or has way to share arbitrary otherwise not-special userspace pages
> > > (e.g. u2mfn, with all its issues (pinning, reloc, etc.))?
> > >
> > > ioreq is tangled with grant refs, evt chans, generic vmexit
> > > dispatcher, instruction decoder, etc. none of which seems desirable i=
f
> > > trying to move towards world with strictly safer guest interfaces
> > > exposed (e.g. HMX-only)
>
> I think this needs Christopher's clarification, but it's my
> understanding that the Argo transport wouldn't need IOREQs at all,
> since all data exchange would be done using the Argo interfaces, there
> would be no MMIO emulation or anything similar. The mention about
> IOREQs is because the Arm folks are working on using IOREQs in Arm to
> enable virtio-mmio on Xen.

Yes, that is correct.

> Fro my reading of the document, it seem Argo VirtIO would still rely
> on event channels, it would IMO be better if instead interrupts are
> delivered using a native mechanism, something like MSI delivery by
> using a destination APIC ID, vector, delivery mode and trigger mode.

Yes, Argo could deliver interrupts via another mechanism rather than
event channels; have added this to our planning doc for investigation.
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+De=
velopment+Phase+1

thanks,

Christopher

