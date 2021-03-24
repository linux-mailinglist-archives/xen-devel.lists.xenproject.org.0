Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75A3478E3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100987.192773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP313-00010g-HR; Wed, 24 Mar 2021 12:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100987.192773; Wed, 24 Mar 2021 12:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP313-00010H-EF; Wed, 24 Mar 2021 12:53:41 +0000
Received: by outflank-mailman (input) for mailman id 100987;
 Wed, 24 Mar 2021 12:53:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYS5=IW=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lP311-00010C-JC
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:53:39 +0000
Received: from mail-ot1-x32a.google.com (unknown [2607:f8b0:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc768f6e-a891-44dc-a8b0-8bc946f8621a;
 Wed, 24 Mar 2021 12:53:38 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso22884377otq.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 05:53:38 -0700 (PDT)
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
X-Inumbo-ID: fc768f6e-a891-44dc-a8b0-8bc946f8621a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UCAvShrQp1zWABFbmj6neS2t/wJyD0oqgDxv6VR+/ek=;
        b=rUiEClG6qW/PRRZHOsceOA4FoknTs5jQmVr9LFppHLZFEzdtwuNnBNHmFcpQjF0wr4
         vUFlOfamckRqREwSxNf80C6Nfxp4HfeLZfQD7Yp6JQEmTXhZrIhMKS7H6JTiLBzXEHPc
         CETSwS1Xoec7L6j9TuoXIdE4Pt7hIw0V6eeLkFqUVobR/FpVqWqzZ8HmcpQreD6LfRhI
         zZXLFyQ1Bsr32OpRD+1E9u/sHJqHJtlV4zlZFXX4MZsayeQWR2HYsfItBOqR/t9BQ3C1
         dYKVE8d2+UUqn0mEFtNH86UOg0UJrabVOmD3uRfx21Vf+jIdQC2ZPRgMwzyYScRGTEfE
         I4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UCAvShrQp1zWABFbmj6neS2t/wJyD0oqgDxv6VR+/ek=;
        b=FzrK+1wlss60sE3q5x45PuXRUtOhoUxKq6C36LgPsroql/jf1yz2C8rpNfx5YLqNGQ
         LU8OfOpWo5YsAiQqLGTlalr9zybS902aVSwwPax5zb+tBy+7Tadem4sz5jshJxcMnftb
         0ZmaNfF1SzIFXtgex/iNwgtD6hMnaFnZ7BeqRqrdIRPXW779GVj+Zoa3QlNP7NrO3Dwj
         Fk49XgAHYD+lm7mJlpH4AHMjrURcImhvSgXFkhZZ2BxHrC63c3G0eljHlUxrVhkGUylX
         ZTKyuy1NJJmQMnyiXZXPrHQdyxunI5zoNBX0r0gSXip5q10MzmgQ9NAr6z2kptfDDpL9
         OLMg==
X-Gm-Message-State: AOAM532QdhIEXm4QmkWjGZdcaEbZ+ZZz/x4pNKeDrM/GOfz7mho6S0xg
	RC133wwZ+X3OMOtnL4ti5CIhx8OFlqYMo7Hxt6E=
X-Google-Smtp-Source: ABdhPJzGUco7BQDaj3TFpz1Q+/g0+vP+3xJxvCqgS4PKNkifnB//FnDxTf7/OOeMKBlGFpPqSj5DDs12ZUEle6zUzCE=
X-Received: by 2002:a05:6830:4cd:: with SMTP id s13mr3166529otd.78.1616590417898;
 Wed, 24 Mar 2021 05:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com> <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com> <YFrxznV1kXeXsRCa@Air-de-Roger>
In-Reply-To: <YFrxznV1kXeXsRCa@Air-de-Roger>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 24 Mar 2021 05:53:26 -0700
Message-ID: <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, iwj@xenproject.org, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Rich Persaud <persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, luca.fancellu@arm.com, 
	paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 1:01 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Tue, Mar 23, 2021 at 10:39:53AM -0700, Christopher Clark wrote:
> > On Thu, Mar 18, 2021 at 9:43 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > Just took a quick look at it.
> > >
> > > On Mon, Mar 15, 2021 at 11:18:13PM -0400, Daniel P. Smith wrote:
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------------------+
> > > > + | **Xen Dom0**  | **Linux** | **Late**   | **Jail**  | **Xen**   =
  | **Xen Hyperlaunch** |
> > > > + | **(Classic)** | **KVM**   | **HW Dom** | **house** | **dom0less=
**+---------+-----------+
> > > > + |               |           |            |           |           =
  | Static  | Dynamic   |
> > > > + +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > > > + | Hypervisor able to launch multiple VMs during host boot        =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |     Y     |       Y   =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Hypervisor supports Static Partitioning                        =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |     Y     |       Y   =
  |    Y    |           |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Able to launch VMs dynamically after host boot                 =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |       Y       |     Y     |      Y*    |     Y     |       Y*  =
  |         |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Supports strong isolation between all VMs started at host boot =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |     Y     |       Y   =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Enables flexible sequencing of VM start during host boot       =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |           |           =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Prevent all-powerful static root domain being launched at boot =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |           |       Y*  =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Operates without a Highly-privileged management VM (eg. Dom0)  =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |      Y*    |           |       Y*  =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Operates without a privileged toolstack VM (Control Domain)    =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |           |       Y*  =
  |    Y    |           |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Extensible VM configuration applied before launch of VMs at hos=
t boot                  |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |           |           =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Flexible granular assignment of permissions and functions to VM=
s                       |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |           |           =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | Supports extensible VM measurement architecture for DRTM and at=
testation               |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |           |           =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + | PCI passthrough configured at host boot                        =
                        |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > > > + |               |           |            |           |           =
  |    Y    |     Y     |
> > > > + +---------------+-----------+------------+-----------+-----------=
--+---------+-----------+
> > >
> > > I'm curious about this, I assume this is done using vPCI so that
> > > there's no hardware domain (and user-space device model) involved for
> > > PCI passthrough?
> >
> > That would be an incorrect assumption. See below for why.
> >
> > > I'm also not sure how you are going to handle things like SR-IOV
> > > devices. Right now SR-IOV capability is setup and initialized by the
> > > hardware domain, and the new virtual devices are notified to Xen once
> > > setup is done. Do you plan to move those bits into Xen, so that it ca=
n
> > > setup and initialize the SR-IOV capability?
> >
> > While you could do it with the vPCI, as you point out this will not wor=
k
> > for SR-IOV. With hyperlaunch, these cases will require the use of a boo=
t
> > domain, which is for all intents and purposes, a lightweight/restricted
> > toolstack domain.
> >
> > The boot domain will have to do the necessary operations to ensure that
> > when startup is finished, PCI passthrough will be successfully setup.
> > Note, this may have to include the boot domain unpausing the hardware
> > domain to help complete the setup before the boot domain can exit and
> > allow the remaining domains to come online.
>
> OK, I was expecting hyperlaunch to do all domain creation in the
> hypervisor.

That is my expectation too. It is what we've been planning for in our
work so far but we can work on explaining the steps involved in
constructing the domains more clearly.

> If you offload domain creation of guests with
> pci-passthrough devices to a control domain and/or hardware domain,
> I'm not sure I see the difference from normal domain creation, ie:
> it's no longer something specific to hyperlaunch, as I could achieve
> the same by using the existing xendomains init script.

So that's not what we've proposed, and hopefully not what we'll need to do.

Do you know if there is a need to perform work to support the
assignment of PCI devices at the point of domain creation (ie. in
domain_create), rather than handling it in a later step of domain
configuration, prior to the domain being started?

> Also you need a way to pass the configuration from the hypervisor into
> a control domain that would then wait for the hardware domain to come
> up and afterwards launch a guest with a pci-passthorugh device. The
> passing of this information from the hypervisor to the control domain
> would need to be done in an OS agnostic way if possible.

Ack. We have discussed a plan for surfacing the domain configuration
data from the Launch Control Module to the boot domain via either ACPI
tables or a Device Tree -- this needs to be added to the design
documents. Communicating the domain configuration information to the
control domain too also needs consideration. Thanks for raising it.

Earlier discussion notes were posted here:
https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00729.html

> Don't get me wrong, I don't think such approach is bad, I'm just
> unsure whether such functionality is really part of hyperlaunch, or
> instead something that you can achieve outside of hyperlaunch already.

I think that it will provide a new capability; will work on the docs
on how to better communicate how it does so.

thanks,

Christopher

>
> Thanks, Roger.

