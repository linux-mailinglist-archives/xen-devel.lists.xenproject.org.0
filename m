Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E42ED75B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 20:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63086.111987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxank-0002zD-O1; Thu, 07 Jan 2021 19:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63086.111987; Thu, 07 Jan 2021 19:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxank-0002yq-Kg; Thu, 07 Jan 2021 19:18:28 +0000
Received: by outflank-mailman (input) for mailman id 63086;
 Thu, 07 Jan 2021 19:18:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhK8=GK=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kxani-0002yl-9B
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 19:18:26 +0000
Received: from mail-oi1-x231.google.com (unknown [2607:f8b0:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbcc0801-fe94-45a1-94bf-63d56b76a5b8;
 Thu, 07 Jan 2021 19:18:25 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id 9so8586712oiq.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 11:18:25 -0800 (PST)
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
X-Inumbo-ID: dbcc0801-fe94-45a1-94bf-63d56b76a5b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TF5UAuLdRqXZLMz81ZMm2H8bAmVD/zQTbZ7N2FwzZ9E=;
        b=j3ZsHRZFkrqFFzjs9GGJQKJz7p3tTMHQ9YcO5A41amaAgJ2B9b2OF041klVhNN/cCm
         5PoDw3pxuB3ie57k9XOcC8PgRmrzJrw+/qToyNU+xan3kcx8vtn+dXmXekK/C+g0kX78
         +JXeETz5owJ37D1JOhLAijw3jdmUdxWOCgLey1cf8J7L45eHhbzQf9DNZei1NhMeYIXq
         85+IeKNHYYnlUkhUxFM7xKMQRolZdlqTo5+URHm1GOE1KhDK3KNY2j7mO6TxYgHdxOgD
         T0Ou2idehEYds0nSU9Cxjd5SsNJGbBhYzkND4sSU6MdJ4tF9CqUXLqQOcU/51CSiyI6y
         GX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TF5UAuLdRqXZLMz81ZMm2H8bAmVD/zQTbZ7N2FwzZ9E=;
        b=bQWSkHG6gQL/M0uD77AipTSyogb/hvMjQVg1Wa668Q9/mcUD2Ao3ziTMYWSJjErU+l
         Ih5fYdHdN/Qu1zQ94gwXRYwSfspwSBGg1yQsqsne/0PWey38uGPVAW6vlKOvZ/WZ3rtx
         p/JswVMY6Byg71itJ14yLEodzqRf93/40e3vVYDNSl8NCFD4W1kXkrUDny9OrWxGJAB8
         UuC6z+PO53u8i4+4o0czmCM3gMKJkmDAGENHKnHhcQeyPG1rcm+4UQoxyMyI08pECSg9
         5wGihc3pf0hTEFJBujExlypbrxm/EFDaZLbRj3JRyAKFYd0SPGs8R9u9Mu977Bb+8iAW
         nbEw==
X-Gm-Message-State: AOAM531CQOmsOGL6oNxBIJc7wCdz30Ly8v+3mnZIx7sWCYhYZM69VT4a
	qoYC+zx9+okjK1o/xyLxe5IdZH+zSPnBI8KlSlo=
X-Google-Smtp-Source: ABdhPJxifGyQhmWZGvcRIa6+TsZqGXHo6YPqq2LVGLIEBzTTmMj2XYusYZClLvVibvRCfyct8OomdjSE9ARKyTnRzsQ=
X-Received: by 2002:aca:4307:: with SMTP id q7mr94146oia.122.1610047104583;
 Thu, 07 Jan 2021 11:18:24 -0800 (PST)
MIME-Version: 1.0
References: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
 <20201229091730.owgpdeekb7pcex7t@Air-de-Roger> <eac811f4-51fd-9198-446a-230dc6915f62@xen.org>
 <20201231084556.ogvltixgd6ovlja2@Air-de-Roger> <CAJ=z9a2xJ2g_UL2oMzyQBGB1cA3nqdOrDYMPg2urHesHs0Dk5A@mail.gmail.com>
 <20201231113852.f7rgmqrpfdayfzfj@Air-de-Roger>
In-Reply-To: <20201231113852.f7rgmqrpfdayfzfj@Air-de-Roger>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 7 Jan 2021 11:18:13 -0800
Message-ID: <CACMJ4GYYKWoOTzLtEb_7g6jnVAxojMLByDpPpyCP5S2hgpPy_A@mail.gmail.com>
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall.oss@gmail.com>
Cc: Rich Persaud <persaur@gmail.com>, openxt <openxt@googlegroups.com>, 
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Julien Grall <jgrall@amazon.com>, 
	James McKenzie <james@bromium.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	Paul Durrant <pdurrant@amazon.co.uk>, Jean-Philippe Ouellet <jpo@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 3:39 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Dec 31, 2020 at 11:02:40AM +0000, Julien Grall wrote:
> > On Thu, 31 Dec 2020 at 08:46, Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m> wrote:
> > >
> > > On Wed, Dec 30, 2020 at 11:30:03AM +0000, Julien Grall wrote:
> > > > Hi Roger,
> > > >
> > > > On 29/12/2020 09:17, Roger Pau Monn=C3=A9 wrote:
> > > > > On Wed, Dec 23, 2020 at 04:32:01PM -0500, Rich Persaud wrote:
> > > > > > =EF=BB=BFOn Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@=
vt.edu> wrote:
> > > > > > > =EF=BB=BFOn Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> > > > > > > <christopher.w.clark@gmail.com> wrote:
> > > > > > > > Hi all,
> > > > > > > >
> > > > > > > > I have written a page for the OpenXT wiki describing a prop=
osal for
> > > > > > > > initial development towards the VirtIO-Argo transport drive=
r, and the
> > > > > > > > related system components to support it, destined for OpenX=
T and
> > > > > > > > upstream projects:
> > > > > > > >
> > > > > > > > https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696=
169985/VirtIO-Argo+Development+Phase+1
> > > > >
> > > > > Thanks for the detailed document, I've taken a look and there's i=
ndeed
> > > > > a lot of work to do listed there :). I have some suggestion and
> > > > > questions.
> > > > >
> > > > > Overall I think it would be easier for VirtIO to take a new trans=
port
> > > > > if it's not tied to a specific hypervisor. The way Argo is implem=
ented
> > > > > right now is using hypercalls, which is a mechanism specific to X=
en.
> > > > The concept of hypervisor call is not Xen specific. Any other hyper=
visor can
> > > > easily implement them. At least this is the case on Arm because we =
have an
> > > > instruction 'hvc' that acts the same way as a syscall but for the
> > > > hypervisor.
> > > >
> > > > What we would need to do is reserving a range for Argos. It should =
be
> > > > possible to do it on Arm thanks to the SMCCC (see [1]).
> > > >
> > > > I am not sure whether you have something similar on x86.
> > >
> > > On x86 Intel has vmcall and AMD vmmcall, but those are only available
> > > to HVM guests.
> >
> > Right, as it would for other architecture if one decided to implement
> > PV (or binary translated) guests.
> > While it may be possible to use a different way to communicate on x86
> > (see more below), I am not sure this would be the case for other
> > architectures.
> > The closest thing to MSR on Arm would be the System Registers. But I
> > am not aware of a range of IDs that could be used by the software.
>
> I don't really know that much about Arm to make any helpful statement
> here. My point was to keep in mind that it might be interesting to try
> to define an hypervisor agnostic mediated data exchange interface, so
> that whatever is implemented in the VirtIO transport layer could also
> be used by other hypervisors without having to modify the transport
> layer itself. If that's better done using a vmcall interface that's
> fine, as long as we provide a sane interface that other hypervisors
> can (easily) implement.
>
> > >
> > > > > IMO it might be easier to start by having an Argo interface using
> > > > > MSRs, that all hypervisors can implement, and then base the VirtI=
O
> > > > > implementation on top of that interface.
> > > > My concern is the interface would need to be arch-specific. Would y=
ou mind
> > > > to explain what's the problem to implement something based on vmcal=
l?
> > >
> > > More of a recommendation than a concern, but I think it would be more
> > > attractive for upstream if we could provide an interface to Argo (or
> > > hypervisor mediated data exchange) that's no too tied into Xen
> > > specifics.
> >
> > I agree with this statement. We also need an interface that is ideally
> > not to arch-specific otherwise it will be more complicated to get
> > adopted on other arch.
> > For instance, at the moment, I don't really see what else can be used
> > on Arm (other that MMIO and PCI) if you want to care about PV (or
> > binary translated) guests.
>
> My recommendation was mostly to make Argo easier to propose as an
> hypervisor agnostic mediated data exchange, which in turn could make
> adding a VirtIO transport layer based on it easier. If that's not the
> case let's just forget about this.
>
> > > My suggestion for using MSRs was because I think every x86 hypervisor
> > > must have the logic to trap and handle some of those, and also every
> > > OS has the helpers to read/write MSRs, and those instructions are not
> > > vendor specific.
> >
> > In order to use MSRs, you would need to reserve a range of IDs. Do x86
> > have a range of ID that can be used for software purposes (i.e. the
> > current and future processors will not use it)?
>
> There's a range of MSRs (0x40000000-0x400000FF) that are guaranteed to
> always be invalid on bare metal by Intel, so VMware, HyperV and
> others have started using this range to add virtualization specific
> MSRs. You can grep for HV_X64_MSR_* defines on Xen for some of the
> HyperV ones.

I've written a summary of the points from this thread in a project
description at this wiki page:

https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+De=
velopment+Phase+1#Project:-Hypervisor-agnostic-Hypervisor-Interface

-- please let me know if anything is captured incorrectly or any
amendments that you would like to be made.

As a reminder, we have an upcoming VirtIO-Argo call on Thursday next
week, 14th of January at 16:00 UTC.

thanks,

Christopher

