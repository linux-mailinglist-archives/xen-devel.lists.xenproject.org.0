Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0D91F4000
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:59:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jige5-0006OD-Q0; Tue, 09 Jun 2020 15:58:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTuU=7W=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jige4-0006O8-71
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:58:36 +0000
X-Inumbo-ID: 12fbacda-aa6a-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12fbacda-aa6a-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 15:58:35 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id n24so22972182ejd.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbJp1IWgUH+VQ3z/5e5brV6qZNHhJIyjJ89HzS4+g2c=;
 b=ljK+SUc4DoMD1Sc6xR8WXmbSK25X6EQPiWkzE1LoCnWsqaooFV7Ue/wQwvI2IisTjp
 +Mrf0amFwoCYRhyxjNwEcMVAyzXI9LsMQ3h/9Nl28uKo48ov5+PBpBEEDPpTkthw00Ql
 wihMWMClTQgGCvnkZHCQg5gZ71MtL2TlVJe77vAxh8zCCmqf7Mq/BS0mzBex9X4TIoJ9
 buRhVZhFWb9T5cSt7MC/Z+B4kb+8B4gAlDLE7QrY/kqj7uI3AfjGNlaYYatpGe+7T389
 hJItrysX0+MvYkQEVz9QtUP3yWZEs7WnZmkaPZdb6D1CJa9Yzwr9lZqqJyQE5zw/pnoI
 w4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbJp1IWgUH+VQ3z/5e5brV6qZNHhJIyjJ89HzS4+g2c=;
 b=VqBCpWkENu19id+C2C5Rb8GssW2JsmkCKPyJcCfzeA52tQ5AtLJh/GPaUCLkaKXcco
 0GlL+2fKxS/6cPWzsTOrMbP0Wzs/uw8WxRoewwuTnU8RSYFurdDShqJlZbhsfMDAvLU4
 NWcOzTjy9ZwLGFEv6F4pwYRk4YzaRY1d9Rp7S6CM7RQQnUvKkD9J2jADMon7EPlDlc3B
 b6KxQZcUz15HCVRdfANCPgeK6dBQbVNXh1Ml+vu5XlxUjxw4ANDnuj1N8BOim4DPxe6h
 /6EP6PW36cbtuOMFI/ozxO3wz+SdbPUg8shXLNztluQqQdjr9hNelS90c9WcGmYC2K2x
 dBpA==
X-Gm-Message-State: AOAM530m0s3aI1WwR21CoAMPqkC2SNTp7Gyac64fFddz2DtVlQ+CvrTs
 62ON9rzNxXTXG7bXZMsgoiMbK39b+FuS42vfXmA=
X-Google-Smtp-Source: ABdhPJzAMb5BIQMYiTuFT/I3iN4kafpFGOxbbPoBWi2FsA2/oP3wEvVKLacbG9TuC/7JkJEZexCs1GAn8HFunOsfw3A=
X-Received: by 2002:a17:906:5785:: with SMTP id
 k5mr25551813ejq.494.1591718314562; 
 Tue, 09 Jun 2020 08:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
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
In-Reply-To: <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Tue, 9 Jun 2020 11:58:21 -0400
Message-ID: <CALYbLDguWyVifXiCSGO8TdkvGO95YnYrLxXqnS5P_EBwk53O0w@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien@xen.org>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 9, 2020 at 11:47 AM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 09/06/2020 16:28, Bertrand Marquis wrote:
> > Hi,
> >
> >> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> >>
> >> There does appear to be a secondary (CIC) controller that can forward
> >> events to the GIC-400 and EDMA controllers for the keystone 2 family.
> >> Admittedly, i'm not sure how it is being used with regards to the
> >> peripherals.  I only see mention of the GIC-400 parent for the devices
> >> in the device tree.  Maybe Bertrand has a better idea on whether any
> >> peripherals go through the CIC first?  I see that gic_interrupt ()
> >> fires once in Xen, which calls doIRQ to push out the virtual interrupt
> >> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
> >> returns, but gic_interrupt() never fires again in Xen.
> >
> > I do not remember of any CIC but the behaviour definitely look like an interrupt acknowledge problem.
> >
> > Could you try the following:
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc *desc)
> >       /* Lower the priority of the IRQ */
> >       gicv2_eoi_irq(desc);
> >       /* Deactivation happens in maintenance interrupt / via GICV */
> > +
> > +    /* Test for Keystone2 */
> > +    gicv2_dir_irq(desc);
> >   }
> >
> > I think the problem I had was related to the vgic not deactivating properly the interrupt.
>
This seemed to help with the edge triggered interrupts, e.g. UART

> Are you suggesting the guest EOI is not properly forwarded to the
> hardware when LR.HW is set? If so, this could possibly be workaround in
> Xen by raising a maintenance interrupt every time a guest EOI an interrupt.
>
> > This might make the interrupt fire indefinitely !!
>
> Most likely with level interrupt ;).
>
This is what's happening with the Ethernet driver which is level
triggered.  I had to temporarily disable it
to check the patch with the UART driver, otherwise the system would
hang processing the interrupt
repeatedly.
> Cheers,
>
> --
> Julien Grall

