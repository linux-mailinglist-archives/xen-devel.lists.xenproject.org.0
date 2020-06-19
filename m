Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90101200614
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 12:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmE0H-0007O9-P6; Fri, 19 Jun 2020 10:12:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMb=AA=gmail.com=vlad.babchuk@srs-us1.protection.inumbo.net>)
 id 1jmE0G-0007O4-C5
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 10:12:08 +0000
X-Inumbo-ID: 54b87ce0-b215-11ea-b7bb-bc764e2007e4
Received: from mail-vs1-xe44.google.com (unknown [2607:f8b0:4864:20::e44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54b87ce0-b215-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 10:12:07 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id r11so5284039vsj.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 03:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yvaN1qxUPGSdWMwKU0Ou8hlse2UJHRAHTqFMZkg1nwg=;
 b=qiOUUnINsjdjcCih4F5FnZCvgRihsgtEpkhbroFd/X1YhkiAIogQTZhTpYH0XQXaA3
 PicJDmNtcCJ5oeHPZZ9uPak0Lt7mwCPrkUdoBYbsMeuVLKuVRlAv8UQnpt5rhjjIMd/U
 0u4BkjN4LVWkQDHqbSWhgqb3c0iS6SNQOYzRqB4e2uJKFQ6Wau5xbXcSfDvmMKSUpRtq
 YEQmHDy665Yq0JECRiC2kzsBCqPGoa6ErQZRIhHC8PXL/aTB7zUr+PG49qP56FgawPD7
 Mb6kXKdDAuV/YNEDfnxknfT3v1pa+yCaVB59s91AwRIyjrC5P7FCchTRkMyPvY0Xx80I
 iPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yvaN1qxUPGSdWMwKU0Ou8hlse2UJHRAHTqFMZkg1nwg=;
 b=ceQrbk4wvCdlRH21ISFETX2p1PvEZNzmu/zmRhHuMOnPrWblmol4AAXeWGjKkZpDI6
 AZTvfZLci4Dt8CzjhANo07cjyO6upFW4HrP7R4l3A5TM/Cj0buvBZgcbQYOBKa/jqOQQ
 6S5cUqKsIqjzrAitBWahIghe0RvybfIUMVnbLedfJgWEsBenrBvKHQofQAGUjOxfhCwM
 dbYNgwIQ3zQHWkOOigI/vRQNJf3a8QOHuLg1O7hguymou7vYOPkJxkXVzgZwrgxWN8XK
 ZJ0SJOQA/06R9qUyUGup2DgAYteX8FjxrQT9nbidTxs3dUGCyrg+kMyQSMJ3Ptg77keY
 k4OA==
X-Gm-Message-State: AOAM533wwRucbw252Y5NmKh6apzjM2ldwUDExy0DtTGjprVexkHJQT4W
 +Wf0Z0aOpOBCIDd4Zc1TRJz7rckP5DT7HRjCwjA=
X-Google-Smtp-Source: ABdhPJw6u9WruL/fd3NvdDc62ui/4aydu3pFohNcipHa+lsJF9RtXXXB6qYqrqe07npNuspcoqTea0xGgck3ETxODRA=
X-Received: by 2002:a67:e451:: with SMTP id n17mr6942925vsm.238.1592561526885; 
 Fri, 19 Jun 2020 03:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
 <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
 <DB6PR0402MB27606AA43E7A95B3CB2D228588980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CE6D09B1-18C4-46FA-BC1A-F45E28B2FA36@arm.com>
 <DB6PR0402MB2760C3BF7140E02A6ECA572488980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo0Y4fgQjigQj2nDkiQETN7EEhjvOujkTxmiQtG3OBGieA@mail.gmail.com>
 <DB6PR0402MB2760F159669AC29034EEABDA88980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760F159669AC29034EEABDA88980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Date: Fri, 19 Jun 2020 13:11:55 +0300
Message-ID: <CAOcqxo3Pp0VQqYsrSwGLmgPS1AHm8uN6wkccEosBhvGLyACaBw@mail.gmail.com>
Subject: Re: [Tee-dev] TEE with XEN
To: Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 19 Jun 2020 at 12:50, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [Tee-dev] TEE with XEN
> >
> > Hi Peng,
> >
> > On Fri, 19 Jun 2020 at 12:06, Peng Fan <peng.fan@nxp.com> wrote:
> > >
> > > > Subject: Re: [Tee-dev] TEE with XEN
> > > >
> > > >
> > > >
> > > > > On 19 Jun 2020, at 09:52, Peng Fan <peng.fan@nxp.com> wrote:
> > > > >
> > > > > Hi Bertrand,
> > > > >
> > > > >> Subject: Re: [Tee-dev] TEE with XEN
> > > > >>
> > > > >> Hi,
> > > > >>
> > > > >>> On 18 Jun 2020, at 19:05, Julien Grall <julien@xen.org> wrote:
> > > > >>>
> > > > >>> +Bertrand and Stefano
> > > > >>>
> > > > >>> On 16/06/2020 02:24, Volodymyr Babchuk wrote:
> > > > >>>> Hi Peng,
> > > > >>>> On Mon, 15 Jun 2020 at 05:07, Peng Fan <peng.fan@nxp.com>
> > wrote:
> > > > >>>>>
> > > > >>>>> Hi All,
> > > > >>>>>
> > > > >>>>> While enabling trusty os with xen, I took same approach as
> > > > >>>>> OP-TEE, with OP-TEE running in secure world. But I am also
> > > > >>>>> thinking this might introduce potential issue is that secure
> > > > >>>>> world OS communicate with
> > > > >> DomU.
> > > > >>>>> If there are some misbehavior in secure world OS, it might le=
t
> > > > >>>>> XEN hypervisor not work proper.
> > > > >>>>>
> > > > >>>>> In my setup, trusty os sometimes panic in secure world, xen
> > > > >>>>> will not able to control the panic core anymore.
> > > > >>>
> > > > >>> May I ask in which case Trusty is panicking?
> > > > >>
> > > > >> In any case, optee should protect itself against this and it
> > > > >> should be considered that optee is more priviledged then Xen.
> > > > >> So if optee is crashing we cannot expect that Xen can recover or=
 fix it.
> > > > >>
> > > > >> I would more consider this as a bug that optee needs to be robus=
t
> > against.
> > > > >
> > > > > ok. I am not using OP-TEE, currently I use google trusty OS.
> > > >
> > > > Sorry i should have been more generic.
> > > > Please read this as =E2=80=9CAnything running in secure world=E2=80=
=9D, being optee or
> > trusty.
> > > >
> > > > >
> > > > > I have two OS, Dom0 linux + DomU android auto.
> > > > >
> > > > > DomU android auto needs trusty OS, Dom0 Linux not need that.
> > > >
> > > > But i would guess your Dom0 is more =E2=80=9Ccritical=E2=80=9D then=
 your DomU.
> > > > In this case you must make sure that any resource given to your Dom=
U
> > > > cannot affect your Dom0.
> > > > For example: if the DomU is starting a very heavy operation in
> > > > blocked in trusty, any interrupt for non-secure could be blocked,
> > > > thus affecting the ability of your Dom0.
> > > >
> > > > >
> > > > > I not wanna trusty OS for DomU could bring any detect to Dom0 or =
xen.
> > > > >
> > > > > One more case is if dom0 linux needs OP-TEE, DomU needs google
> > > > > trusty, how we handle this in one SoC?
> > > >
> > > > You have a shared resource in this case, someone more or as trusted
> > > > as the clients needs to decide how the resource can be shared.
> > > > In this case could be Dom0 or Xen or Trusty or op-Tee (if i should
> > > > make an order).
> > > >
> > > > >
> > > > >>
> > > > >>>
> > > > >>>>>
> > > > >>>>> So I am thinking whether we need to emulating secure world in
> > > > >>>>> a XEN VM which is the VM running DomU. Just like what ACRN di=
d
> > > > >>>>> to run trusty os.
> > > > >>>> Well, it depends on whom you are trusting more. Both XEN and
> > > > >>>> TEE are minimal OS implementations with aim at security. I'm
> > > > >>>> speaking about generic TEE OS, not about particular OS like OP=
-TEE
> > or Trusty.
> > > > >>>> Problem is that, if TEE is running inside VM, it will be
> > > > >>>> susceptible to a hypervisor misbehaviour. You need to
> > > > >>>> understand that Xen and privileged domain (dom0, mostly) can
> > > > >>>> access memory of
> > > > any guest.
> > > > >>>> At least, in default configuration. There are means to harden
> > > > >>>> this setup. But anyways, Xen can't be stopped from reading TEE=
's
> > secrets.
> > > > >>>
> > > > >>> IIRC, we discussed this approach for OP-TEE in the past. There
> > > > >>> was other
> > > > >> potential pitfalls with it. For instance, you wouldn't be able t=
o
> > > > >> directly access any secure device from that guest (it is running
> > > > >> in
> > > > non-secure world).
> > > > >>>
> > > > >>> There are also issues in term of latency as you may have the
> > > > >>> following
> > > > >> model:
> > > > >>>
> > > > >>> domU -> Xen -> domU TEE -> (Xen -> host TEE -> Xen -> domU TEE)
> > > > >>> -> Xen ->
> > > > >> domU.
> > > > >>>
> > > > >>> The bit in () is if you require to call the host TEE.
> > > > >>>
> > > > >>> One possibility would be to use Secure-EL2 for your Trusty OS.
> > > > >>> But I don't
> > > > >> know whether your platform supports it.
> > > > >>>
> > > > >>> Depending on whether you can modify Trusty OS, alternative woul=
d
> > > > >>> be to
> > > > >> make itvirtualization aware as OP-TEE did. The core would need t=
o
> > > > >> be resilient and the panic only affect a given client.
> > > > >>
> > > > >> I do not have right a clear idea of what is the status of optee
> > > > >> and xen but in theory I would see 2 possible ways to handle this=
:
> > > > >> - without optee modification, something in a guest (Dom0 or an
> > > > >> other priviledged one) needs to have access to optee and emulate
> > > > >> optee access for others.
> > > > >> - with optee modifications, optee needs to have a concept of
> > > > >> client and Xen would need to passthrough optee requests but bein=
g
> > > > >> responsible of adding a =E2=80=9Cclient=E2=80=9D identifier. May=
be also informing
> > > > >> Optee when a new client is created/removed.
> > > > >>
> > > > >> The second scenario could then be somehow splitted in the
> > > > >> previous one from Julien if some parts would need to be emulated
> > > > >> somewhere in some kind of combination of the 2 models.
> > > > >>
> > > > >> In any case i would always consider that anything running on
> > > > >> optee (or in general in the secure world) is more trusted then X=
en.
> > > > >
> > > > > Ok, this means optee runs on all cores in secure world, but this
> > > > > would not work when we need to support multiple OSes with their o=
wn
> > TEE.
> > > >
> > > > I would think you have one TEE running on all cores (or runnable in=
 this
> > case).
> > > > So the Tee needs to handle several contexts or someone needs to
> > virtualize it.
> > >
> > > This back to my original question, should I virtualize TEE in a XEN d=
edicated
> > VM?
> > > or I need to emulate secure world to let one VM could have secure and
> > > non-secure world?
> > >
> >
> > Well, I think that the best approach is that we did in the OP-TEE: make=
 Trusty
> > virtualization-aware, so it can handle multiple VMs.
>
> Trusty virtualization-aware, you mean android Linux trusty driver communi=
cate
> with OP-TEE or else?

Okay, OP-TEE is implemented right as Bertran has suggested: OP-TEE can work
with multiple VMs at the same time. It has special calls to create and
destroy VM
contextes.

So, when a new VM/guest is spawned, Xen says "Hey, OP-TEE, there is a new
VM with ID NNN". OP-TEE then initializes internal state for the new VM.
At any moment Xen can say "Oops, that VM with ID NNN is dead". OP-TEE will
immediately destroy the internal state for that VM.

Also, Xen needs to perform certain actions every time VM calls OP-TEE: tran=
slate
addresses, tell OP-TEE id of that VM, lock guest pages...
And no changes to the OP-TEE client in Linux are needed. It thinks
that it communicates
directly with the OP-TEE. OP-TEE is running in the Secure World as usual.

The same can be done for any other TEE. Trusty, for example. Downside is th=
at
you can't run two different TEEs in the Secure world.

Actually, ARM added virtualization support in Secure mode, but AFAIK, i.MX8=
 does
not support it.

To sum it up:
1. If you want to run only Trusty on your system, and you want to run
it in Secure World,
 you need to make Trusty virtualization-aware, and write mediator in
Xen. This is what
I did for OP-TEE.

2. If you want to run Trusty AND OP-TEE in the Secure World, then you
need to do p1.
and then implement some paravirtualization support in Secure Monitor,
Trusty and OP-TEE

3. If your use case does not require high security, you can try to run
Trusty as a VM.
But, I am almost certain that this will not pass Google's
requirements. So no Google Pay,
no E-SIM, no DRM for this setup. But, you should clarify this with
Google. I'm not a Google
representative :)

