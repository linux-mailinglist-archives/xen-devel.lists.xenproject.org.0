Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8792004B9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:12:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmD4R-0001tE-Bg; Fri, 19 Jun 2020 09:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMb=AA=gmail.com=vlad.babchuk@srs-us1.protection.inumbo.net>)
 id 1jmD4P-0001t9-D5
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:12:21 +0000
X-Inumbo-ID: fab31bcc-b20c-11ea-b7bb-bc764e2007e4
Received: from mail-vk1-xa32.google.com (unknown [2607:f8b0:4864:20::a32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fab31bcc-b20c-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 09:12:20 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id e1so2127949vkd.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EDENB6gkDBT5GIDa/YNo8xEfnnxfxJftsLe+hfT1MSw=;
 b=YRyuS+n4RlMOy2cbDXiSTKp4o3y8LUsRdWmwFj6/e+v1XdP/vYwz+nocPQ/728YiCt
 UBM7+1V1cDgUfcRDw+8LWfppmrsE963EMKM3Hg5SY+6WhjcTcYz9xByiqhxRUDqn3b2I
 BKsG7ihGde7iaQ4a5K6zgsL6Fz4ayGFB9ClXr6JvKi7q2EBgWlxmmiTfJsTRV3K/6E5/
 Y34IxMeyVP88SjAdLwpkH6pZ5BQIRwtYjSnCPvSNz+s7SwHC/0/FWTKKCRpr8DYDGNmy
 BCXlOlpo5kW17hMelkaThqbQ0zWyqFcaSpfx3z6BRGnEYp5ry1JY7C+9ahgfhegbArA2
 bSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EDENB6gkDBT5GIDa/YNo8xEfnnxfxJftsLe+hfT1MSw=;
 b=BaOuq/5/cg1BpOnusCP11sT0/TRYBbtBM8FTYykgIS0y+mO7xznN1hyy+m+qXdJdcN
 kvPdT6EZCkqY0x52NSz2UytJiIQHcX+QWD0+/puuPAVfRqHXBITHHx7Dc098YPi1XDHe
 ebTwGg1nsEJOOUkgh9KTZSmfAD0jTSEh42A2QEHmCjPL7HS75JTHiBl+4lrksdffdoHW
 mL9tA/BUYybNf/PVmpk/3m9mXrV2rdx0Xv76Kx9zaj1419HwICRRsUkLVfrfAMayskWH
 IzzASIXE+/OeFoGASL4+SltUxWJBZI3ltsxIWzdNl/wH7rDOfogDIty3HEJS181hmLWe
 bCjA==
X-Gm-Message-State: AOAM533JuPKwE+JxbBr9ij7+QbsCGyMdJCi1r+mpbxUIYU+KxgTJW09z
 YiYRK7/TnB41Sg40bAbvbk35BpFQiEAnsbk6YFc=
X-Google-Smtp-Source: ABdhPJx4WF9S/bhsMQYcCcMCYEGPbvrlOf44UEED05Jv+R72pRvp4ATcvuk+zSzqiQwkqK3uyt7Hs7nJzo8rFxSSnIk=
X-Received: by 2002:a05:6122:2d6:: with SMTP id
 k22mr6632301vki.89.1592557939967; 
 Fri, 19 Jun 2020 02:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
 <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
 <DB6PR0402MB27606AA43E7A95B3CB2D228588980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CE6D09B1-18C4-46FA-BC1A-F45E28B2FA36@arm.com>
 <DB6PR0402MB2760C3BF7140E02A6ECA572488980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760C3BF7140E02A6ECA572488980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Date: Fri, 19 Jun 2020 12:12:08 +0300
Message-ID: <CAOcqxo0Y4fgQjigQj2nDkiQETN7EEhjvOujkTxmiQtG3OBGieA@mail.gmail.com>
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

Hi Peng,

On Fri, 19 Jun 2020 at 12:06, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [Tee-dev] TEE with XEN
> >
> >
> >
> > > On 19 Jun 2020, at 09:52, Peng Fan <peng.fan@nxp.com> wrote:
> > >
> > > Hi Bertrand,
> > >
> > >> Subject: Re: [Tee-dev] TEE with XEN
> > >>
> > >> Hi,
> > >>
> > >>> On 18 Jun 2020, at 19:05, Julien Grall <julien@xen.org> wrote:
> > >>>
> > >>> +Bertrand and Stefano
> > >>>
> > >>> On 16/06/2020 02:24, Volodymyr Babchuk wrote:
> > >>>> Hi Peng,
> > >>>> On Mon, 15 Jun 2020 at 05:07, Peng Fan <peng.fan@nxp.com> wrote:
> > >>>>>
> > >>>>> Hi All,
> > >>>>>
> > >>>>> While enabling trusty os with xen, I took same approach as OP-TEE=
,
> > >>>>> with OP-TEE running in secure world. But I am also thinking this
> > >>>>> might introduce potential issue is that secure world OS
> > >>>>> communicate with
> > >> DomU.
> > >>>>> If there are some misbehavior in secure world OS, it might let XE=
N
> > >>>>> hypervisor not work proper.
> > >>>>>
> > >>>>> In my setup, trusty os sometimes panic in secure world, xen will
> > >>>>> not able to control the panic core anymore.
> > >>>
> > >>> May I ask in which case Trusty is panicking?
> > >>
> > >> In any case, optee should protect itself against this and it should
> > >> be considered that optee is more priviledged then Xen.
> > >> So if optee is crashing we cannot expect that Xen can recover or fix=
 it.
> > >>
> > >> I would more consider this as a bug that optee needs to be robust ag=
ainst.
> > >
> > > ok. I am not using OP-TEE, currently I use google trusty OS.
> >
> > Sorry i should have been more generic.
> > Please read this as =E2=80=9CAnything running in secure world=E2=80=9D,=
 being optee or trusty.
> >
> > >
> > > I have two OS, Dom0 linux + DomU android auto.
> > >
> > > DomU android auto needs trusty OS, Dom0 Linux not need that.
> >
> > But i would guess your Dom0 is more =E2=80=9Ccritical=E2=80=9D then you=
r DomU.
> > In this case you must make sure that any resource given to your DomU ca=
nnot
> > affect your Dom0.
> > For example: if the DomU is starting a very heavy operation in blocked =
in
> > trusty, any interrupt for non-secure could be blocked, thus affecting t=
he ability
> > of your Dom0.
> >
> > >
> > > I not wanna trusty OS for DomU could bring any detect to Dom0 or xen.
> > >
> > > One more case is if dom0 linux needs OP-TEE, DomU needs google trusty=
,
> > > how we handle this in one SoC?
> >
> > You have a shared resource in this case, someone more or as trusted as =
the
> > clients needs to decide how the resource can be shared.
> > In this case could be Dom0 or Xen or Trusty or op-Tee (if i should make=
 an
> > order).
> >
> > >
> > >>
> > >>>
> > >>>>>
> > >>>>> So I am thinking whether we need to emulating secure world in a
> > >>>>> XEN VM which is the VM running DomU. Just like what ACRN did to
> > >>>>> run trusty os.
> > >>>> Well, it depends on whom you are trusting more. Both XEN and TEE
> > >>>> are minimal OS implementations with aim at security. I'm speaking
> > >>>> about generic TEE OS, not about particular OS like OP-TEE or Trust=
y.
> > >>>> Problem is that, if TEE is running inside VM, it will be
> > >>>> susceptible to a hypervisor misbehaviour. You need to understand
> > >>>> that Xen and privileged domain (dom0, mostly) can access memory of
> > any guest.
> > >>>> At least, in default configuration. There are means to harden this
> > >>>> setup. But anyways, Xen can't be stopped from reading TEE's secret=
s.
> > >>>
> > >>> IIRC, we discussed this approach for OP-TEE in the past. There was
> > >>> other
> > >> potential pitfalls with it. For instance, you wouldn't be able to
> > >> directly access any secure device from that guest (it is running in
> > non-secure world).
> > >>>
> > >>> There are also issues in term of latency as you may have the
> > >>> following
> > >> model:
> > >>>
> > >>> domU -> Xen -> domU TEE -> (Xen -> host TEE -> Xen -> domU TEE) ->
> > >>> Xen ->
> > >> domU.
> > >>>
> > >>> The bit in () is if you require to call the host TEE.
> > >>>
> > >>> One possibility would be to use Secure-EL2 for your Trusty OS. But =
I
> > >>> don't
> > >> know whether your platform supports it.
> > >>>
> > >>> Depending on whether you can modify Trusty OS, alternative would be
> > >>> to
> > >> make itvirtualization aware as OP-TEE did. The core would need to be
> > >> resilient and the panic only affect a given client.
> > >>
> > >> I do not have right a clear idea of what is the status of optee and
> > >> xen but in theory I would see 2 possible ways to handle this:
> > >> - without optee modification, something in a guest (Dom0 or an other
> > >> priviledged one) needs to have access to optee and emulate optee
> > >> access for others.
> > >> - with optee modifications, optee needs to have a concept of client
> > >> and Xen would need to passthrough optee requests but being
> > >> responsible of adding a =E2=80=9Cclient=E2=80=9D identifier. Maybe a=
lso informing
> > >> Optee when a new client is created/removed.
> > >>
> > >> The second scenario could then be somehow splitted in the previous
> > >> one from Julien if some parts would need to be emulated somewhere in
> > >> some kind of combination of the 2 models.
> > >>
> > >> In any case i would always consider that anything running on optee
> > >> (or in general in the secure world) is more trusted then Xen.
> > >
> > > Ok, this means optee runs on all cores in secure world, but this woul=
d
> > > not work when we need to support multiple OSes with their own TEE.
> >
> > I would think you have one TEE running on all cores (or runnable in thi=
s case).
> > So the Tee needs to handle several contexts or someone needs to virtual=
ize it.
>
> This back to my original question, should I virtualize TEE in a XEN dedic=
ated VM?
> or I need to emulate secure world to let one VM could have secure and non=
-secure
> world?
>

Well, I think that the best approach is that we did in the OP-TEE: make Tru=
sty
virtualization-aware, so it can handle multiple VMs.

Things are more funny if you want to use multiple different TEEs (like
OP-TEE and Trusty)
at the same time. If this is your case, then the best approach is to implem=
ent
something like para-virtualization in the Secure World. But this would requ=
ire
quite big efforts, of course.

--=20
WBR Volodymyr Babchuk aka lorc [+380976646013]
mailto: vlad.babchuk@gmail.com

