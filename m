Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD92F522F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66693.118556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkyU-0001oq-Ig; Wed, 13 Jan 2021 18:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66693.118556; Wed, 13 Jan 2021 18:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkyU-0001oR-FC; Wed, 13 Jan 2021 18:34:30 +0000
Received: by outflank-mailman (input) for mailman id 66693;
 Wed, 13 Jan 2021 18:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kzkyS-0001o4-Nl
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:34:28 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c68a0839-ce0d-490a-8f02-530f4b7dd706;
 Wed, 13 Jan 2021 18:34:27 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id p13so3696811ljg.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 10:34:27 -0800 (PST)
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
X-Inumbo-ID: c68a0839-ce0d-490a-8f02-530f4b7dd706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DctkMqlmAhFAbbLb0HSoY9BrIEf5lQI19sUHZt52zpU=;
        b=l1QoQhxlDhVnhmGPsslI/grqBEUnnoIJ+7g3x5cyFSZAeAwi+VwP0tTUd5RBoVazqa
         7lRgoWvvgUKyhH7JqNNg89XP/RV+GDWTeJD1KvmjII5wtjnvuYRnfikbNru0UNrZ1eCp
         EQMJuBLX7uJ6bYWAxqgSRgH5ouaZPvxyZUy50xfoeCXKlt5ppM1MDGV7QyDsiWsfk1Cd
         vE6iD2yCd4cboYgRJfH3opQ/GOvqq/yk5DmMELHD7U08Qz0/wFROZufeEZJ8sUBkYtzY
         Mf923Rx+gRilJdSdll5/XCb/P0zUDGtIHaBC+aipbxks+27eakvuLVx2pF8s4I4IPhKX
         m9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DctkMqlmAhFAbbLb0HSoY9BrIEf5lQI19sUHZt52zpU=;
        b=ufgeJd56QCaSjWFAsaLjIV4M06BcrXXH8CLx1fIZ+sBMQKcwt5wOCVMDSWZODw8k0V
         jE7ujmh5Is/U798GolHuUOEuswTPCAnk0fa6e7/2sDjZKK/XPxOaWLn14FrKEO41ZRTK
         bZN0IJfaSCUfKOen7gT3j6wXI+302EJChkR/xU4u+Ya09ljUeT0FYN7iRU+fHZIvYTQ9
         FPcx3OVy0ESagV7nN/M+3rVOUedbSH57crCA3Tyr84rhGCruER5vAv968YjJFIYyC1xQ
         io5PY0cikDzP4G4FP/wr0skyXsFGCNfYiTE84ymCpAiog135tn0g/P54cLqJDUGbhtIS
         LkfA==
X-Gm-Message-State: AOAM533FHLinIPCMVpCcM8bAeUejj2YfCqFtdd9QsrzD/ONhaHDRJ0mV
	FHtOlYT/nqlkZ5BKrEecITO5uAZVjYx8DkE6+e0=
X-Google-Smtp-Source: ABdhPJw80ue8JGJHE1IzksHrUTgTVLPnXFpWdKx0MHWPsE9zjirMVUWuwkhBJ1zFYdqF972sQHbooRyWyVsTVoBv7vs=
X-Received: by 2002:a2e:3619:: with SMTP id d25mr1476290lja.378.1610562866362;
 Wed, 13 Jan 2021 10:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20210112173248.28646-1-roger.pau@citrix.com> <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger> <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
In-Reply-To: <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 13 Jan 2021 13:34:14 -0500
Message-ID: <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 1:06 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Jan 13, 2021 at 10:48:52AM -0500, Jason Andryuk wrote:
> > On Wed, Jan 13, 2021 at 8:11 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
> > > > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > > > Sent: Wednesday, January 13, 2021 1:33 AM
> > > > >
> > > > > Current interrupt pass though code will setup a timer for each
> > > > > interrupt injected to the guest that requires an EOI from the gue=
st.
> > > > > Such timer would perform two actions if the guest doesn't EOI the
> > > > > interrupt before a given period of time. The first one is deasser=
ting
> > > > > the virtual line, the second is perform an EOI of the physical
> > > > > interrupt source if it requires such.
> > > > >
> > > > > The deasserting of the guest virtual line is wrong, since it mess=
es
> > > > > with the interrupt status of the guest. It's not clear why this w=
as
> > > > > odne in the first place, it should be the guest the one to EOI th=
e
> > > > > interrupt and thus deassert the line.
> > > > >
> > > > > Performing an EOI of the physical interrupt source is redundant, =
since
> > > > > there's already a timer that takes care of this for all interrupt=
s,
> > > > > not just the HVM dpci ones, see irq_guest_action_t struct eoi_tim=
er
> > > > > field.
> > > > >
> > > > > Since both of the actions performed by the dpci timer are not
> > > > > required, remove it altogether.
> > > > >
> > > > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > > > ---
> > > > > As with previous patches, I'm having a hard time figuring out why=
 this
> > > > > was required in the first place. I see no reason for Xen to be
> > > > > deasserting the guest virtual line. There's a comment:
> > > > >
> > > > > /*
> > > > >  * Set a timer to see if the guest can finish the interrupt or no=
t. For
> > > > >  * example, the guest OS may unmask the PIC during boot, before t=
he
> > > > >  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but=
 the
> > > > >  * guest will never deal with the irq, then the physical interrup=
t line
> > > > >  * will never be deasserted.
> > > > >  */
> > > > >
> > > > > Did this happen because the device was passed through in a bogus =
state
> > > > > where it would generate interrupts without the guest requesting
> > > >
> > > > It could be a case where two devices share the same interrupt line =
and
> > > > are assigned to different domains. In this case, the interrupt acti=
vity of
> > > > two devices interfere with each other.
> > >
> > > This would also seem to be problematic if the device decides to use
> > > MSI instead of INTx, but due to the shared nature of the INTx line we
> > > would continue to inject INTx (generated from another device not
> > > passed through to the guest) to the guest even if the device has
> > > switched to MSI.
> > >
> > > > >
> > > > > Won't the guest face the same issues when booted on bare metal, a=
nd
> > > > > thus would already have the means to deal with such issues?
> > > >
> > > > The original commit was added by me in ~13yrs ago (0f843ba00c95)
> > > > when enabling Xen in a client virtualization environment where inte=
rrupt
> > > > sharing is popular.
> > >
> > > Thanks, the reference to the above commit is helpful, I wasn't able t=
o
> > > find it and it contains a comment that I think has been lost, which
> > > provides the background on why this was added.
> > >
> > > > I believe above comment was recorded for a real
> > > > problem at the moment (deassert resets the intx line to unblock fur=
ther
> > > > interrupts). But I'm not sure whether it is still the case after bo=
th Xen and
> > > > guest OS have changed a lot. At least some test from people who
> > > > still use Xen in shared interrupt scenario would be helpful. Or, if=
 such
> > > > usage is already niche, maybe we can consider disallow passing thro=
ugh
> > > > devices which share the same interrupt line to different domains an=
d
> > > > then safely remove this dpci EOI trick.
> > >
> > > So the deassert done by timeout only deasserts the virtual line, but
> > > doesn't for example clear the IRR bit from the vIO-APIC pin, which
> > > will cause further interrupts to not be delivered anyway until a
> > > proper EOI (or a switch to trigger mode) is done to the pin.
> > >
> > > I think it's going to be complicated for me to find a system that has
> > > two devices I can passthrough sharing the same GSI.
> >
> > I have some laptops running OpenXT where the USB controller and NIC
> > share an interrupt, and I assign them to different domains.  Qubes
> > would hit this as well.
>
> Is there any chance you could try the patch and see if you can hit the
> issue it was trying to fix?

Would testing a backport to 4.12 be useful?  There were some file
renames, but it looks to apply.  The only difference is the 4.12
hvm_pirq_eoi hunk still has `(ent && ent->fields.mask) || `.  Maybe
backport commit eb298f32fac5ac "x86/dpci: EOI interrupt regardless of
its masking status" as well?

Testing staging would take a little longer to make a machine available.

I guess I'd also need to disable MSI for the two devices to ensure
they are both using the GSI?

Regards,
Jason

