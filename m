Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A41F47C3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 22:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jikXG-00069T-HO; Tue, 09 Jun 2020 20:07:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTuU=7W=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jikXF-00069O-0q
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 20:07:49 +0000
X-Inumbo-ID: e3801d56-aa8c-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3801d56-aa8c-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 20:07:48 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id o15so23776404ejm.12
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pVS7CJZdrzKQpjKHvnhdrW3lpWKuWLbs7rJKMQLQFRQ=;
 b=OUdtlwDyE0cfNAIl0rDUkNvytJg/OQrKdLLD7Z2jWymOUSk0i4qsBtlBhnZ71NGirF
 giH3plDhqPChm7JCoW8oSrwm5ED9WmOtmztjyztwwxYveXPyvOoDfhmvKvs4zI8NdsDQ
 +4qBtA3ZRtUp/qCl9LVj2mDk/lwEuZZhAOMREMWreQT0112b7XMMnWFcT+tXF75SF9SN
 KGOJmSFNT1PyqhGonBlQiaLkP+qqZVXe1TMY/3/fiqm+FYHhhalF8fLGW/8eNNzGz1y9
 mnBs7OwbkLLWo1zpYuyYFqSEA+AXTGeQWU/j++U1fsTYc1S0WUUxMXux22PbXcqqQsHF
 xc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pVS7CJZdrzKQpjKHvnhdrW3lpWKuWLbs7rJKMQLQFRQ=;
 b=ii6rkKSXGn2SZ2Le96ARkJE39BCv8HPM9I7bp4rUM0iV85bMtaMOpb540AVtloFUrE
 HE5O0CV+yvTzUB+8M652H29thwCTMZx/CuTcdDdo56pjHnztQm+g3igrgeGKmx06pk6/
 jYrO0uEczt4mKUQFiCQ3pxBBOPA9lY5BDjXxHKuNyHIsFsEep0sSKuHopR7caQpgO2jJ
 Z9h3mX62A0FCaS+ttWEr6sGMTdnZLLde5HF0bWeceTz4msaFxIBkQHQG4U3p3bFaqV2w
 K4V/aAN7R7KXNS2ODxWRuzL7CLOqcnaar7lEjYUp8k6BimfrRmvSn7+PVZsJZJ6BE78e
 E/gg==
X-Gm-Message-State: AOAM531sRreyYGFAonz6a7YzSPtch07DUc+bJg2Aa9obij073cQpDOaR
 YTRUzF9z32Kihxjo9rr7q4MaTRZXhGjO8gDL2f4=
X-Google-Smtp-Source: ABdhPJwH9uZq6vL6HezbBh1qqaSTqsqpAL7lVzwPfgHt7nHynJ5DNE70GoEi9w/t31df1C0PlKtpaLHnawrWnDDc548=
X-Received: by 2002:a17:906:5f93:: with SMTP id
 a19mr111426eju.10.1591733267244; 
 Tue, 09 Jun 2020 13:07:47 -0700 (PDT)
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
In-Reply-To: <6033f9cecbf10f50f4a713ce52105426@kernel.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Tue, 9 Jun 2020 16:07:33 -0400
Message-ID: <CALYbLDgw8puOr+G8MOn+QVaj9kGX848gj5p=V6k8nR8wA-0_UA@mail.gmail.com>
Subject: Re: Keystone Issue
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 9, 2020 at 1:45 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Julien,
>
> On 2020-06-09 18:32, Julien Grall wrote:
> > (+ Marc)
> >
> > On 09/06/2020 18:03, Bertrand Marquis wrote:
> >> Hi
> >>
> >>> On 9 Jun 2020, at 16:47, Julien Grall <julien@xen.org> wrote:
> >>>
> >>>
> >>>
> >>> On 09/06/2020 16:28, Bertrand Marquis wrote:
> >>>> Hi,
> >>>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> >>>>>
> >>>>> There does appear to be a secondary (CIC) controller that can
> >>>>> forward
> >>>>> events to the GIC-400 and EDMA controllers for the keystone 2
> >>>>> family.
> >>>>> Admittedly, i'm not sure how it is being used with regards to the
> >>>>> peripherals.  I only see mention of the GIC-400 parent for the
> >>>>> devices
> >>>>> in the device tree.  Maybe Bertrand has a better idea on whether
> >>>>> any
> >>>>> peripherals go through the CIC first?  I see that gic_interrupt ()
> >>>>> fires once in Xen, which calls doIRQ to push out the virtual
> >>>>> interrupt
> >>>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
> >>>>> returns, but gic_interrupt() never fires again in Xen.
> >>>> I do not remember of any CIC but the behaviour definitely look like
> >>>> an interrupt acknowledge problem.
> >>>> Could you try the following:
> >>>> --- a/xen/arch/arm/gic-v2.c
> >>>> +++ b/xen/arch/arm/gic-v2.c
> >>>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc
> >>>> *desc)
> >>>>       /* Lower the priority of the IRQ */
> >>>>       gicv2_eoi_irq(desc);
> >>>>       /* Deactivation happens in maintenance interrupt / via GICV */
> >>>> +
> >>>> +    /* Test for Keystone2 */
> >>>> +    gicv2_dir_irq(desc);
> >>>>   }
> >>>> I think the problem I had was related to the vgic not deactivating
> >>>> properly the interrupt.
> >>>
> >>> Are you suggesting the guest EOI is not properly forwarded to the
> >>> hardware when LR.HW is set? If so, this could possibly be workaround
> >>> in Xen by raising a maintenance interrupt every time a guest EOI an
> >>> interrupt.
> >>
> >> Agree the maintenance interrupt would definitely be the right solution
> > I would like to make sure we aren't missing anything in Xen first.
> > From what you said, you have encountered this issue in the past with a
> > different hypervisor. So it doesn't look like to be Xen related.
> >
> > Was there any official statement from TI? If not, can we try to get
> > some input from them first?
Thank you all for your support so far, its really appreciated.  Is
there a quick patch that I can try with this maintenance interrupt to
get the level interrupts working as well? I can pose the question to
TI but would like to close the loop and make sure there are no other
issues that pop out first.
> >
> > @Marc, I know you dropped 32-bit support in KVM recently :). Although,
>
> Yes! Victory is mine! Freedom from the shackles of 32bit, at last! :D
>
> > I was wondering if you heard about any potential issue with guest EOI
> > not forwarded to the host. This is on TI Keystone (Cortex A-15).
>
> Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midway
> all run just fine with guest EOI), and GIC-400 is a pretty solid piece
> of kit (it is just sloooooow...).
>
> Thinking of it, you would see something like that if the GIC was seeing
> the writes coming from the guest as secure instead of NS (cue the early
> firmware on XGene that exposed the wrong side of GIC-400).
>
> Is there some kind of funky bridge between the CPU and the GIC?
>
>          M.
> --
> Jazz is not dead. It just smells funny...

