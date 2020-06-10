Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DDF1F5506
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:40:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj01G-0003nA-45; Wed, 10 Jun 2020 12:39:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOz3=7X=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jj01E-0003n4-S8
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:39:48 +0000
X-Inumbo-ID: 78085896-ab17-11ea-bca7-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78085896-ab17-11ea-bca7-bc764e2007e4;
 Wed, 10 Jun 2020 12:39:47 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q13so1282428edi.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bxIGmdzYVGd7dALOtkxKZRmhaWRNMYNPEXZoVOpm8eA=;
 b=tKtVujid9299bW8kmqqlLGT3xAYxnApuvY147znhv03a6AN1xNmLzM4lxwwCIBYCyG
 mlNtYI1Xrmdsxo6OGEevEEHVmYqY0R4SsNQ89KQvpfSC/NV2o7rz4jOn3azY5RBseMKo
 w6DzCB1NZpGx3uQu/iSZ50cPHPkUrokmMW22TnQI/BEyHYJvaHuQPxxbiRQCz5scXyD/
 V22btFn7Xac+fLPGWGl7HSOG+vTWZUZZUN3PqEImM/3gRWYw5vOyBbIATdP9PvITE6vU
 XjjkdcX1FtTfIziaGVVSNdo3DFIgQVN/voJTYdnj2CBJspyQZu39qcTfLGskvA4JA+A1
 yRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bxIGmdzYVGd7dALOtkxKZRmhaWRNMYNPEXZoVOpm8eA=;
 b=NK8Onpm9tKvgR4Plk49E8iyN6DCNlzvQ5xqaqnjVPpDZTQg5reftEXiRRFYMUtPbpu
 d6QA5+KcFk3goRUS/It5M2NvuChwDiCrO90Ony85ZCiAVqPUf73qtL4x6QW8oG1Ue6JB
 kOQ7sGrdhC94epAm4ryLjgakBUPdTK8PbK4nHmLvytPVJcOD9FvsSeJNXw2Vz1svfyey
 i8hMoJD3g2Y7eABcLsWIZMc6MsLm/+TbYNQiYeHdAb0Ym1x5Vnt/mVaWiq9LUafmz6+N
 P8a/f2PgJ9coMlTfyABei0eN51APoW82ruBzeoQoxd80ltXohA3mCM0Lsrp8xmpF2Bw6
 kzCQ==
X-Gm-Message-State: AOAM532UqR20pjHmREm4fG416I4PWd1Ud1yNenN6ZqG6tn5X0qTUIo2m
 i6TJYdzae20TInrdBA9fwnz/MuxcPnpEYsADJQF2qmT4
X-Google-Smtp-Source: ABdhPJwSvOvWp/DpJOg4Kql1d4SF9CUGu8L/oHAY6qntzPsy6/xPArOj4lP0SL/DC2tw/SGOCGRdg2RoLMDKvKMoFlI=
X-Received: by 2002:a05:6402:1d96:: with SMTP id
 dk22mr2344148edb.258.1591792787038; 
 Wed, 10 Jun 2020 05:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <32FA85C2-7685-49D2-875B-9FA1C138C92A@arm.com>
 <d16faf89f25a6183bc6cbdc6148af4b4@kernel.org>
 <5C2DB5F7-832E-4B02-A99A-8B5C7CEC7645@arm.com>
In-Reply-To: <5C2DB5F7-832E-4B02-A99A-8B5C7CEC7645@arm.com>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Wed, 10 Jun 2020 08:39:33 -0400
Message-ID: <CALYbLDiYPmcetVh3XDf=qgo+gLHAM-VhU4xKP2jKd51H3RKgVA@mail.gmail.com>
Subject: Re: Keystone Issue
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
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
Cc: Marc Zyngier <maz@kernel.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 10, 2020 at 4:39 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 10 Jun 2020, at 09:20, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On 2020-06-10 09:06, Bertrand Marquis wrote:
> >> Hi,
> >>> On 9 Jun 2020, at 18:45, Marc Zyngier <maz@kernel.org> wrote:
> >>> Hi Julien,
> >>> On 2020-06-09 18:32, Julien Grall wrote:
> >>>> (+ Marc)
> >>>> On 09/06/2020 18:03, Bertrand Marquis wrote:
> >>>>> Hi
> >>>>>> On 9 Jun 2020, at 16:47, Julien Grall <julien@xen.org> wrote:
> >>>>>> On 09/06/2020 16:28, Bertrand Marquis wrote:
> >>>>>>> Hi,
> >>>>>>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wro=
te:
> >>>>>>>> There does appear to be a secondary (CIC) controller that can fo=
rward
> >>>>>>>> events to the GIC-400 and EDMA controllers for the keystone 2 fa=
mily.
> >>>>>>>> Admittedly, i'm not sure how it is being used with regards to th=
e
> >>>>>>>> peripherals.  I only see mention of the GIC-400 parent for the d=
evices
> >>>>>>>> in the device tree.  Maybe Bertrand has a better idea on whether=
 any
> >>>>>>>> peripherals go through the CIC first?  I see that gic_interrupt =
()
> >>>>>>>> fires once in Xen, which calls doIRQ to push out the virtual int=
errupt
> >>>>>>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt =
and
> >>>>>>>> returns, but gic_interrupt() never fires again in Xen.
> >>>>>>> I do not remember of any CIC but the behaviour definitely look li=
ke an interrupt acknowledge problem.
> >>>>>>> Could you try the following:
> >>>>>>> --- a/xen/arch/arm/gic-v2.c
> >>>>>>> +++ b/xen/arch/arm/gic-v2.c
> >>>>>>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_de=
sc *desc)
> >>>>>>>     /* Lower the priority of the IRQ */
> >>>>>>>     gicv2_eoi_irq(desc);
> >>>>>>>     /* Deactivation happens in maintenance interrupt / via GICV *=
/
> >>>>>>> +
> >>>>>>> +    /* Test for Keystone2 */
> >>>>>>> +    gicv2_dir_irq(desc);
> >>>>>>> }
> >>>>>>> I think the problem I had was related to the vgic not deactivatin=
g properly the interrupt.
> >>>>>> Are you suggesting the guest EOI is not properly forwarded to the =
hardware when LR.HW is set? If so, this could possibly be workaround in Xen=
 by raising a maintenance interrupt every time a guest EOI an interrupt.
> >>>>> Agree the maintenance interrupt would definitely be the right solut=
ion
> >>>> I would like to make sure we aren't missing anything in Xen first.
> >>>> From what you said, you have encountered this issue in the past with=
 a
> >>>> different hypervisor. So it doesn't look like to be Xen related.
> >>>> Was there any official statement from TI? If not, can we try to get
> >>>> some input from them first?
> >>>> @Marc, I know you dropped 32-bit support in KVM recently :). Althoug=
h,
> >>> Yes! Victory is mine! Freedom from the shackles of 32bit, at last! :D
> >>>> I was wondering if you heard about any potential issue with guest EO=
I
> >>>> not forwarded to the host. This is on TI Keystone (Cortex A-15).
> >>> Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Mid=
way all run just fine with guest EOI), and GIC-400 is a pretty solid piece =
of kit (it is just sloooooow...).
> >>> Thinking of it, you would see something like that if the GIC was seei=
ng the writes coming from the guest as secure instead of NS (cue the early =
firmware on XGene that exposed the wrong side of GIC-400).
> >>> Is there some kind of funky bridge between the CPU and the GIC?
> >> Yes the behaviour I had was coherent with the GIC seeing the processor
> >> in secure mode and not in non secure hence making the VGIC ack non
> >> functional.
> >
> > Can you please check this with the TI folks? It may be fixable if
> > the bridge is SW configurable.
>
> At that time they did not =E2=80=9Coffer=E2=80=9D that solution but does =
not mean it is not possible.
>
> >
> >> So the only way to solve this is actually to do the interrupt
> >> deactivate inside Xen (using a maintenance interrupt).
> >
> > That's a terrible hack, and one that would encourage badly integrated H=
W.
> > I appreciate the need to "make things work", but I'd be wary of putting
> > this in released SW. Broken HW must die. I have written more than my sh=
are
> > of these terrible hacks (see TX1 support), and I deeply regret it, as
> > it has only given Si vendors an excuse not to fix things.
>
> Fully agree and I also had to do some hacks for the TX1 ;-)
>
> >
> >> I remember that I also had to do something specific for the
> >> configuration of edge/level and priorities to have an almost proper
> >> behaviour.
> >
> > Well, the moment the GIC observes secure accesses when they should be
> > non-secure, all bets are off and you have to resort to the above hacks.
> > The fun part is that if you have secure SW running on this platform,
> > you can probably DoS it from non-secure. It's good, isn't it?
>
> Definitely is but if I remember correctly they have 2 kind of SoC: one th=
at can be only used in non-secure and an other which is meant to be use wit=
h secure and non secure.
>
> Bertrand
>
> >
> >> Sadly I have no access to the code anymore, so I would need to guess
> >> back what that was..
> >
> > I'd say this *is* a good thing.
The problem is that a hack may be my only solution to getting this
working on this platform.  If TI says that they don't support it then
i'm stuck.  Just to summarize the problem, we believe that the GIC is
seeing secure accesses from dom0 when they should be non-secure.  This
is causing the VGIC ack to be non-functional from dom0.   We would
need a firmware that supports both secure and non-secure accesses.

The Xen code gets to "gicv2_guest_irq_end()" where it executes
"gicv2_eoi_irq()", but then we had to add the deactivate
"gicv2_dir_irq" to clear the virtual interrupt manually to get things
going again.

> >
> >        M.
> > --
> > Jazz is not dead. It just smells funny...
>

