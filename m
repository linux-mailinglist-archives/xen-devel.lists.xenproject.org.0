Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98E2F4F21
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 16:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66598.118352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziOS-0000Sf-3a; Wed, 13 Jan 2021 15:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66598.118352; Wed, 13 Jan 2021 15:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziOR-0000SC-Vo; Wed, 13 Jan 2021 15:49:07 +0000
Received: by outflank-mailman (input) for mailman id 66598;
 Wed, 13 Jan 2021 15:49:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kziOQ-0000S4-En
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 15:49:06 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d0c1b65-c53d-4669-9c7d-3078eeb81fd5;
 Wed, 13 Jan 2021 15:49:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o19so3475266lfo.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 07:49:05 -0800 (PST)
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
X-Inumbo-ID: 7d0c1b65-c53d-4669-9c7d-3078eeb81fd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aZsDGiPz/0ZD6Yazt8q8LEzm5ctH0kCfx0TLQyWpAoo=;
        b=eO6oYHZNG9kp1niPXAD2SoYgftOWKYO6R9NWmilw+Y3RKmthDGlt6IBTbl3TbS0tkk
         i1S9yru3Ycub3ga1QmwuapyNk9HoE1sPzG5QnSh0z/9xwPHkImShQqzG9X+UsKYxM8qz
         hy+zjbZZG/ikGS6bwkY7idzp92euLOk8gdaVufztMhzcYRxRn0Ao6cEWV9BuWcaxla5e
         S46aCZuvbebJu0ILRRTYmg+OhPXaB5ox3c4Vr8uGc4/ebnY1Bcwuf5xQOLDD4/IugBZO
         nY89WtypuXZtNpbzL3z2sIsyRDmCC5insoX+wg6I1KRzYq1ks/2M/2MOFWu/kQe5VCCE
         pkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aZsDGiPz/0ZD6Yazt8q8LEzm5ctH0kCfx0TLQyWpAoo=;
        b=koJLUaO4Ash+ZvpPLfepd8kPcMjCzmN4CX1OCjtK+OSKmmMKd9CGSD+h2Lk0DjZCjF
         QLez5pGEd1MTF8epjsMWa7l3py8TVWVozXXIAF6VRM8PJIQkL6/YPo5DLpdMrJBFMoMy
         tKBPejt5vDcqYrMsRX9QPHl5NZcQ4oY1ZPkkikSkoT0P01d+/JJ1tSeUz+y4y4DFr681
         yXNQV2vDhJZVn0gcTATRoYVZgGJyFjVJzpZu1ksZxzLXuBOhfCRwhY5nCF0AehyZJzLm
         V4+5jVo86jx/YNMZuzaQH63r2+/O88oOPd6qLUC0+1Jg8y51Nc+W0KF9zwBTjvv+Q7U4
         92fQ==
X-Gm-Message-State: AOAM530Fa99lPO+dO/kz/Y/QCdwFqrjyTvJlTLDSe3d6SYC8hxaYbPWV
	mppWt6/U46AJ4jlsFa55woC8trU7bNpR41jerGc=
X-Google-Smtp-Source: ABdhPJyyXberRO21nkAVoAtkA0LPvG0FC1HsyRnMgCdOPHvWgqZlgA0YMR4uHmeTk3LPmzNUx06jf6BlZBij36/ytms=
X-Received: by 2002:a19:e004:: with SMTP id x4mr1060663lfg.419.1610552944270;
 Wed, 13 Jan 2021 07:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20210112173248.28646-1-roger.pau@citrix.com> <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
In-Reply-To: <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 13 Jan 2021 10:48:52 -0500
Message-ID: <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 8:11 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
> > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > Sent: Wednesday, January 13, 2021 1:33 AM
> > >
> > > Current interrupt pass though code will setup a timer for each
> > > interrupt injected to the guest that requires an EOI from the guest.
> > > Such timer would perform two actions if the guest doesn't EOI the
> > > interrupt before a given period of time. The first one is deasserting
> > > the virtual line, the second is perform an EOI of the physical
> > > interrupt source if it requires such.
> > >
> > > The deasserting of the guest virtual line is wrong, since it messes
> > > with the interrupt status of the guest. It's not clear why this was
> > > odne in the first place, it should be the guest the one to EOI the
> > > interrupt and thus deassert the line.
> > >
> > > Performing an EOI of the physical interrupt source is redundant, sinc=
e
> > > there's already a timer that takes care of this for all interrupts,
> > > not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
> > > field.
> > >
> > > Since both of the actions performed by the dpci timer are not
> > > required, remove it altogether.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > > As with previous patches, I'm having a hard time figuring out why thi=
s
> > > was required in the first place. I see no reason for Xen to be
> > > deasserting the guest virtual line. There's a comment:
> > >
> > > /*
> > >  * Set a timer to see if the guest can finish the interrupt or not. F=
or
> > >  * example, the guest OS may unmask the PIC during boot, before the
> > >  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
> > >  * guest will never deal with the irq, then the physical interrupt li=
ne
> > >  * will never be deasserted.
> > >  */
> > >
> > > Did this happen because the device was passed through in a bogus stat=
e
> > > where it would generate interrupts without the guest requesting
> >
> > It could be a case where two devices share the same interrupt line and
> > are assigned to different domains. In this case, the interrupt activity=
 of
> > two devices interfere with each other.
>
> This would also seem to be problematic if the device decides to use
> MSI instead of INTx, but due to the shared nature of the INTx line we
> would continue to inject INTx (generated from another device not
> passed through to the guest) to the guest even if the device has
> switched to MSI.
>
> > >
> > > Won't the guest face the same issues when booted on bare metal, and
> > > thus would already have the means to deal with such issues?
> >
> > The original commit was added by me in ~13yrs ago (0f843ba00c95)
> > when enabling Xen in a client virtualization environment where interrup=
t
> > sharing is popular.
>
> Thanks, the reference to the above commit is helpful, I wasn't able to
> find it and it contains a comment that I think has been lost, which
> provides the background on why this was added.
>
> > I believe above comment was recorded for a real
> > problem at the moment (deassert resets the intx line to unblock further
> > interrupts). But I'm not sure whether it is still the case after both X=
en and
> > guest OS have changed a lot. At least some test from people who
> > still use Xen in shared interrupt scenario would be helpful. Or, if suc=
h
> > usage is already niche, maybe we can consider disallow passing through
> > devices which share the same interrupt line to different domains and
> > then safely remove this dpci EOI trick.
>
> So the deassert done by timeout only deasserts the virtual line, but
> doesn't for example clear the IRR bit from the vIO-APIC pin, which
> will cause further interrupts to not be delivered anyway until a
> proper EOI (or a switch to trigger mode) is done to the pin.
>
> I think it's going to be complicated for me to find a system that has
> two devices I can passthrough sharing the same GSI.

I have some laptops running OpenXT where the USB controller and NIC
share an interrupt, and I assign them to different domains.  Qubes
would hit this as well.

(I hoped MSI translate would help me sidestep the need to XSM label
the shared PIRQ, but as the other thread mentions, qemu-upstream
doesn't support that.  I started using this instead:
https://lore.kernel.org/xen-devel/20201019200318.103781-1-jandryuk@gmail.co=
m/)

Regards,
Jason

