Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9254663C3A9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 16:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449493.706283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02TC-0008CQ-N3; Tue, 29 Nov 2022 15:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449493.706283; Tue, 29 Nov 2022 15:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p02TC-0008Ab-Jd; Tue, 29 Nov 2022 15:24:26 +0000
Received: by outflank-mailman (input) for mailman id 449493;
 Tue, 29 Nov 2022 15:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNdU=35=gmail.com=alexdeucher@srs-se1.protection.inumbo.net>)
 id 1p02TB-0008AO-67
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 15:24:25 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6ff0f5b-6ff9-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 16:24:24 +0100 (CET)
Received: by mail-ot1-x330.google.com with SMTP id
 g51-20020a9d12b6000000b0066dbea0d203so9288419otg.6
 for <xen-devel@lists.xenproject.org>; Tue, 29 Nov 2022 07:24:24 -0800 (PST)
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
X-Inumbo-ID: e6ff0f5b-6ff9-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heqDo1SemRKJ38s2oaglUe868ZlxEolBPvviw9Bv8Jo=;
        b=ByQIRxoI3He+gK+MZv8IFgDJWmR5Vy19GBauIg6ZAFFTn2k58vHLYITHKDCP/V6V48
         iNEzCxZsMFfeG7rVLCtY372wZs4jcMPu9IbFnx+Vw8CAdWA6b9Xq+OU5hzDszEoXamwG
         QHDgG6RhTU/Rl+kkwZ2KtaWPWZ5gAQGpv4QWvoG9ojp5tPEE+M1Z/BvuaCRTWJRWkCHT
         DtxODIxJ+GGQVTNAAOy6pE7KA3dSpsgoMaKvf6D5g6STOvc640L2G3nJuRZKtbKqFJWM
         RagRGTmBUUaxjm8twJOgZnoufya8CGo5chb9Sft4+8C9OOxi+WtmyHjBQ+7mv5O4FTRX
         hVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heqDo1SemRKJ38s2oaglUe868ZlxEolBPvviw9Bv8Jo=;
        b=tCkbkHiC+2t395MsD+Y7cu8OasqEg4u1ynyx5aP4iiqffBZv+YWnNrqsab0TkHA7My
         ceKhtg7GdgCnTj5Hr42HWjELhCADkq6hg4MAHINpbh68agw4v47jGHity6YzVx58e4Q7
         EC+73V+QMtRQSlXZOKH5D7jWBu4R2gbUE3WSbx3cWvDxdN2iGaBVcj7BIiaG4Qnlrd9C
         yNfpZvlTaUMbyYH0LHn8Nf5Si7rF1tuSr1HhgI9auVJpbwlGFrsDUeNKVjPI9zAUU4ET
         cFn6UG2DuUmhhcUmswuaS938iMLPv4VobcOBGZW+7I/oYtiW5ze0m05gTRRcZJUSIzGU
         nXNg==
X-Gm-Message-State: ANoB5pmkLPP0yxXMa+R48aIe7A0wp9edk4tydvvQTgRd7U/u2tFJyVNt
	L18O9Yd/1jZPwPLQmvtnGaRuRcg5uyt2yA2gJ9Q=
X-Google-Smtp-Source: AA0mqf501V19/0cKPFiEfx+BFWiPWHLnpu61P98cAI4LEC+oEECnLTWdJ6qFeaJ1dtEeEtZIW3JlNl+8OtHDs2NicQA=
X-Received: by 2002:a9d:628b:0:b0:66c:6afa:5006 with SMTP id
 x11-20020a9d628b000000b0066c6afa5006mr22125669otk.233.1669735462613; Tue, 29
 Nov 2022 07:24:22 -0800 (PST)
MIME-Version: 1.0
References: <Y4Mz0glMNwDPaFPO@itl-email> <CADnq5_NfupG-DzNDJfntg+uSWH2m_8mLfj=ddkMdnNYNRhXWUw@mail.gmail.com>
 <Y4Vngz5tTA74Qr8L@itl-email> <CADnq5_P8kuSsSFatMq4g0r2yE3TW0Rqzm07+Kpv9wKTi0GGS-Q@mail.gmail.com>
 <Y4Yh/gyt48zoIOyL@mail-itl>
In-Reply-To: <Y4Yh/gyt48zoIOyL@mail-itl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Nov 2022 10:24:10 -0500
Message-ID: <CADnq5_PD9vn8pc15_kO=8JvfVU6sWidmi+Ku5poi7WsUTMpKFQ@mail.gmail.com>
Subject: Re: AMD GPU problems under Xen
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, christian.koenig@amd.com, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 10:15 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Nov 29, 2022 at 09:32:54AM -0500, Alex Deucher wrote:
> > On Mon, Nov 28, 2022 at 8:59 PM Demi Marie Obenour
> > <demi@invisiblethingslab.com> wrote:
> > >
> > > On Mon, Nov 28, 2022 at 11:18:00AM -0500, Alex Deucher wrote:
> > > > On Mon, Nov 28, 2022 at 2:18 AM Demi Marie Obenour
> > > > <demi@invisiblethingslab.com> wrote:
> > > > >
> > > > > Dear Christian:
> > > > >
> > > > > What is the status of the AMDGPU work for Xen dom0?  That was men=
tioned in
> > > > > https://lore.kernel.org/dri-devel/b2dec9b3-03a7-e7ac-306e-1da024a=
f8982@amd.com/
> > > > > and there have been bug reports to Qubes OS about problems with A=
MDGPU
> > > > > under Xen (such as https://github.com/QubesOS/qubes-issues/issues=
/7648).
> > > >
> > > > I would say it's a work in progress.  It depends what GPU  you have
> > > > and what type of xen setup you are using (PV vs PVH, etc.).
> > >
> > > The current situation is:
> > >
> > > - dom0 is PV.
> > > - VMs with assigned PCI devices are HVM and use a Linux-based stubdom=
ain
> > >   QEMU does not run in dom0.
> > > - Everything else is PVH.
> > >
> > > In the future, I believe the goal is to move away from PV and HVM in
> > > favor of PVH, though HVM support will remain for compatibility with
> > > guests (such as Windows) that need emulated devices.
> > >
> > > > In general, your best bet currently is dGPU add in boards because t=
hey
> > > > are largely self contained.
> > >
> > > The main problem is that for the trusted GUI to work, there needs to
> > > be at least one GPU attached to a trusted VM, such as the host or a
> > > dedicated GUI VM.  That VM will typically not be running graphics-
> > > intensive workloads, so the compute power of a dGPU is largely wasted=
.
> > > SR-IOV support would help with that, but the only GPU vendor with ope=
n
> > > source SR-IOV support is Intel and it is still not upstream.  I am al=
so
> > > not certain if the support extends to Arc dGPUs.
> >
> > Can you elaborate on this?  Why wouldn't you just want to pass-through
> > a dGPU to a domU to use directly in the guest?
>
> You can do that, but if that's your only GPU in the system, you'll lose
> graphical interface for other guests.
> But yes, simply pass-through of a dGPU is enough in some setups.
>
> > Are you sure?  I didn't think intel's GVT solution was actually
> > SR-IOV.  I think GVT is just a paravirtualized solution.
>
> Yes, it's a paravirtualized solution, with device emulation done in dom0
> kernel. This, besides being rather unusual approach in Xen world
> (emulators, aka IOREQ servers usually live in userspace) puts rather
> complex piece of code that interacts with untrusted data (instructions
> from guests) in almost the most privileged system component, without
> ability to sandbox it in any way. We consider it too risky for Qubes OS,
> especially since the kernel patches were never accepted upstream and the
> Xen support is not maintained anymore.
>
> The SR-IOV approach Demi is talking about is newer development,
> supported since Adler Lake (technically, IGD in Tiger Lake presents
> SR-IOV capability too, but officially it's supported since ADL). The driv=
er
> for managing it is in the process of upstreaming. Some links here:
> https://github.com/intel/linux-intel-lts/issues/33
> (I have not tried it, yet)
>
> >  That aside,
> > we are working on enabling virtio gpu with our GPUs on xen in addition
> > to domU passthrough.
>
> That's interesting development. Please note, Linux recently (part of
> 6.1) gained support to use grant tables with virtio. This allows having
> backends without full access to guest's memory. The work is done in
> generic way, so a driver using proper APIs (including DMA) should work
> out in such setup out of the box. Please try to not break it :)
>
> > >
> > > > APUs and platforms with integrated dGPUs
> > > > are a bit more complicated as they tend to have more platform
> > > > dependencies like ACPI tables and methods in order for the driver t=
o
> > > > be able to initialize the hardware properly.
> > >
> > > Is Xen dom0/domU support for such GPUs being worked on?  Is there an
> > > estimate as to when the needed support will be available upstream?  T=
his
> > > is mostly directed at Christian and other people who work for hardwar=
e
> > > vendors.
> >
> > Yes, there are some minor fixes in the driver required which we'll be
> > sending out soon and we had to add some ACPI tables to the whitelist
> > in xen, but unfortunately the ACPI tables are AMD platform specific so
> > there has been pushback from the xen maintainers on accepting them
> > because they are not an official part of the ACPI spec.
>
> Can the driver work without them? Such dependency, as you noted above,
> make things rather complicated for pass-through (specific ACPI tables
> can probably be made available to the guest, but usually guest wouldn't
> see all the resources they talk about anyway).

Not really for APUs and dGPUs that are integrated into a platform.
For some of them the ACPI tables are just data tables which contain a
copy of the vbios image which the driver needs for enumerating board
and platform specific data like the display connector topology, i2c
buses, clocks and voltages, etc.  However there are ACPI methods
required for other things related to the platform like power budgets,
GPU power, etc.  If you don't set them up correctly the system may not
operate correctly or you may not be able to put the device into its
lowest power state.

Alex

