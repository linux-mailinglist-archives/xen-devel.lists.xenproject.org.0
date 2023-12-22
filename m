Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C988681CB6C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 15:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659391.1028973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGgeO-0008EB-96; Fri, 22 Dec 2023 14:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659391.1028973; Fri, 22 Dec 2023 14:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGgeO-0008BM-5s; Fri, 22 Dec 2023 14:37:20 +0000
Received: by outflank-mailman (input) for mailman id 659391;
 Fri, 22 Dec 2023 14:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuIk=IB=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rGgeM-0008BG-BZ
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 14:37:18 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99df0378-a0d7-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 15:37:16 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6d3165ac96bso1409568b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 06:37:16 -0800 (PST)
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
X-Inumbo-ID: 99df0378-a0d7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703255834; x=1703860634; darn=lists.xenproject.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojMWNpl55+oUfhnb0vwa6XU66mbrsa65iUm2U8MQ70k=;
        b=Rnm+q8dQ52q/kDfLXPQpbJvnQnr2dZPi/igwiBEdiwoNFveCBJnRLBkyWn4LI/Mu4k
         EToc0guYT6g6ON6WP09re3+M18A0syStRxlEGJhVzB/hzcB4T37B86vqHLN/ow4TiGzN
         KvH/D88OyqdjIfcuIfyq/nSJrOfBnOH/05xhf2lXDMO0a3q+o98CVFkNYxvSdspoENxV
         h3nd2D3WFPVlUJF35jLCckk7l4FBnkRYIkEXxGw2x5uTPwUluKNm+WEamLOA2khWYP/F
         TH7fb4aXhBDT6k3xqi8nPy/aVzeqizTbrqBgTw1qutfEXyosATrUte4OObzPWVFkXTJS
         //4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703255834; x=1703860634;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojMWNpl55+oUfhnb0vwa6XU66mbrsa65iUm2U8MQ70k=;
        b=U3Mv3aEehiTsKFV3UYW29S0pQHn//gIAVoVAW03bb+7GsHnm52TfdxfY8fR7vEfGbl
         UhGUFZd5aQfUsu7+x0Sxz6WAT4rGGaaaUsKvUjU1MtpKs7xTV2LOTyTZvp+3w7l24CUD
         /zgNNUQ2OxMqjP5JEdpjHH6n95mr8GZEJ9moCwX88tQ3Sa7dKRM7uS9YgdXyQmaKpMue
         0Jee42GlsGC8e0m6FG5rrMuz3ayYFpeEzCGqK46pVvWxiYSl5/2CHMA50bw3h5fiRH+5
         ErcWwMb4LqVZsJnZPj/JlIeEx68EbUq1X/CHL34c3rOCrHa5KO+gexNqTPX8HTlZCn6f
         h+tA==
X-Gm-Message-State: AOJu0Ywf/BAVzFeXVUNcilwEWWbFnCZRxp/6oy+Lmh5IMrQ7iEyj5/i2
	KJhOUPUXVAxAMgXHkdTJdAI2GXwduFxOEJjJXJh+jgogrUsnSQ==
X-Received: by 2002:a05:6a00:1b44:b0:6d9:6577:904 with SMTP id
 o4-20020a056a001b4400b006d965770904mt1011142pfv.41.1703255834424; Fri, 22 Dec
 2023 06:37:14 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com> <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com> <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com> <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com> <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com> <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
In-Reply-To: <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Fri, 22 Dec 2023 15:37:02 +0100
Message-ID: <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000fa0dad060d1a266d"

--000000000000fa0dad060d1a266d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

By request of the laptop vendor (Framework) I'm going to open the bug
@fedora for them to jump in.


> > I noticed that on baremetal :
> >
> >   53:          0          0          0          0          0       1268
> >      0          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    5  FRMW0005:00
> >   54:          0          0          0          0          0          1
> >      0          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio   84  FRMW0004:00
> >   55:          0          0          0          0          0       1403
> >      0          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    8  PIXA3854:00
> >
> > with xen with IRQ7 setup only once there's only (the touchpad is
> > PIXA3854:00)
> >
> >  176:          0          0          0          0          0          0
> >      1          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    8
> >
>
> Interestingly when IRQ7 is setup twice (normal xen)
> >  176:          0          0          0          0          0          0
> >      1          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    8  PIXA3854:00
>
> That's odd, as with IRQ7 (wrongly) setup as edge, it should also be marke=
d
> as non-sharable. Otoh with the "i2c-PIXA3854:00:" error above it's no
> surprise no interrupt is set up there.
>

forget this one, I made a mistake when skipping IRQ7.

The "amd_gpio    8  PIXA3854:00"for  IRQ176 is identical with or without
IRQ7 double initialization.


>> Furthermore it might be interesting to know whether ELCR would give us
> >>> any hint in this case. Sadly depending on where you look,
> >>> applicability of this pair of registers (I/O ports 0x4d0 and 0x4d1)
> >>> to other than EISA systems is claimed true or false. Could you perhap=
s
> >>> make Xen simply log the values read from those two ports, by e.g.
> >>> inserting
> >>>
> >>>      printk("ELCR: %02x, %02x\n", inb(0x4d0), inb(0x4d1));
> >>>
> >>> in, say, setup_dump_irqs()?
> >>>
> >>
> > did that but I don't know how to trigger the dump.
>
> There's no need to trigger the dump. The message will be logged during
> boot, and hence ought to be visible in "xl dmesg" output.


Got :

(XEN) ELCR: 00, 00

Le ven. 22 d=C3=A9c. 2023 =C3=A0 09:46, Jan Beulich <jbeulich@suse.com> a =
=C3=A9crit :

> On 21.12.2023 21:41, S=C3=A9bastien Chaumat wrote:
> > Le jeu. 21 d=C3=A9c. 2023 =C3=A0 14:29, Juergen Gross <jgross@suse.com>=
 a =C3=A9crit :
> >
> >> On 21.12.23 13:40, Jan Beulich wrote:
> >>> On 20.12.2023 17:34, S=C3=A9bastien Chaumat wrote:
> >>>> Here are the patches I made to xen and linux kernel
> >>>> Plus dmesg (bare metal,xen) and "xl dmesg"
> >>>
> >>> So the problem looks to be that pci_xen_initial_domain() results in
> >>> permanent setup of IRQ7, when there only "static" ACPI tables (in
> >>> particular source overrides in MADT) are consulted. The necessary
> >>> settings, however, are known only after _CRS for the device was
> >>> evaluated (and possibly _PRS followed by invocation of _SRS). All of
> >>> this happens before xen_register_gsi() is called. But that function's
> >>> call to xen_register_pirq() is short-circuited by the very first if()
> >>> in xen_register_pirq() when there was an earlier invocation. Hence
> >>> the (wrong) "edge" binding remains in place, as was established by
> >>> the earlier call here.
> >>>
> >>> J=C3=BCrgen, there's an interesting comment in xen_bind_pirq_gsi_to_i=
rq(),
> >>> right before invoking irq_set_chip_and_handler_name(). Despite what
> >>> the comment says (according to my reading), the fasteoi one is _not_
> >>> used in all cases. Assuming there's a reason for this, it's not clear
> >>> to me whether updating the handler later on is a valid thing to do.
> >>> __irq_set_handler() being even an exported symbol suggests that might
> >>> be an option to use here. Then again merely updating the handler may
> >>> not be sufficient, seeing there are also e.g. IRQD_TRIGGER_MASK and
> >>> IRQD_LEVEL.
> >>
> >> I understand the last paragraph of that comment to reason, that in cas=
e
> >> pirq_needs_eoi() return true even in case of an edge triggered
> interrupt,
> >> the outcome is still okay.
> >>
> >> I don't think updating the handler later is valid.
> >>
> >>> S=C3=A9bastien, to prove the (still pretty weak) theory that the chan=
ge in
> >>> handler is all that's needed to make things work in your case, could
> >>> you fiddle with pci_xen_initial_domain() to have it skip IRQ7? (That
> >>> of course won't be a proper solution, but ought to be okay for your
> >>> system.) The main weakness of the theory is that IRQ7 really isn't
> >>> very special in this regard - other PCI IRQs routed to the low 16
> >>> IO-APIC pins ought to have similar issues (from the log, on your
> >>> system this would be at least IRQ6 and IRQ10, except that they happen
> >>> to be edge/low, so fitting the ISA defaults); only IRQ16 and up would
> >>> work okay.
> >>>
> >>
> >
> > Doing just that : IQR7 is now  of type level
> >   xen-pirq     -ioapic-level  pinctrl_amd
> >
> >
> > (but is ioapic-level there totally equivalent to the fasteoi of
> baremetal)
> > Still the touchpad does not work.
> >
> > And we have now :
> > Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-PIXA3854:00: failed to
> > reset device: -61
> > Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-PIXA3854:00
> > failed with error -61
> >
> > in addition to
> > Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0004:00: failed to
> > reset device: -61
> > Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0005:00: failed to
> > reset device: -61
> > Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0004:00
> > failed with error -61
> > Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0005:00
> > failed with error -61
>
> So there's more to this, which I'm afraid will (first) need looking into
> by a person familiar with the involved drivers.
>
> > I noticed that on baremetal :
> >
> >   53:          0          0          0          0          0       1268
> >      0          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    5  FRMW0005:00
> >   54:          0          0          0          0          0          1
> >      0          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio   84  FRMW0004:00
> >   55:          0          0          0          0          0       1403
> >      0          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    8  PIXA3854:00
> >
> > with xen with IRQ7 setup only once there's only (the touchpad is
> > PIXA3854:00)
> >
> >  176:          0          0          0          0          0          0
> >      1          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    8
> >
> > Interestingly when IRQ7 is setup twice (normal xen)
> >  176:          0          0          0          0          0          0
> >      1          0          0          0          0          0          =
0
> >        0          0          0  amd_gpio    8  PIXA3854:00
>
> That's odd, as with IRQ7 (wrongly) setup as edge, it should also be marke=
d
> as non-sharable. Otoh with the "i2c-PIXA3854:00:" error above it's no
> surprise no interrupt is set up there.
>
> >> Furthermore it might be interesting to know whether ELCR would give us
> >>> any hint in this case. Sadly depending on where you look,
> >>> applicability of this pair of registers (I/O ports 0x4d0 and 0x4d1)
> >>> to other than EISA systems is claimed true or false. Could you perhap=
s
> >>> make Xen simply log the values read from those two ports, by e.g.
> >>> inserting
> >>>
> >>>      printk("ELCR: %02x, %02x\n", inb(0x4d0), inb(0x4d1));
> >>>
> >>> in, say, setup_dump_irqs()?
> >>>
> >>
> > did that but I don't know how to trigger the dump.
>
> There's no need to trigger the dump. The message will be logged during
> boot, and hence ought to be visible in "xl dmesg" output.
>
> Jan
>

--000000000000fa0dad060d1a266d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>By request of the laptop vendor (Framework) I&#39;m g=
oing to open the bug @fedora for them to jump in.</div><span class=3D"gmail=
-im"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt=
; I noticed that on baremetal :<br>
&gt; <br>
&gt;=C2=A0 =C2=A053:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A01268<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 5=C2=A0 FRMW0005=
:00<br>
&gt;=C2=A0 =C2=A054:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A084=C2=A0 FRMW0004=
:00<br>
&gt;=C2=A0 =C2=A055:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A01403<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 8=C2=A0 PIXA3854=
:00<br>
&gt; <br>
&gt; with xen with IRQ7 setup only once there&#39;s only (the touchpad is<b=
r>
&gt; PIXA3854:00)<br>
&gt; <br>
&gt;=C2=A0 176:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 8<br>
&gt;=C2=A0 <br></blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; Interestingly when IRQ7 is setup twice (normal xen)<br>
&gt;=C2=A0 176:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 8=C2=A0 PIXA3854=
:00<br>
<br>
That&#39;s odd, as with IRQ7 (wrongly) setup as edge, it should also be mar=
ked<br>
as non-sharable. Otoh with the &quot;i2c-PIXA3854:00:&quot; error above it&=
#39;s no<br>
surprise no interrupt is set up there.<br></blockquote><div><br></div></spa=
n><div>forget this one, I made a mistake when skipping IRQ7.</div><div><br>=
</div><div>The &quot;amd_gpio=C2=A0 =C2=A0 8=C2=A0 PIXA3854:00&quot;for=C2=
=A0 IRQ176 is identical with or without IRQ7 double initialization.</div><s=
pan class=3D"gmail-im"><div><br></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt;&gt; Furthermore it might be interesting to know whether ELCR would giv=
e us<br>
&gt;&gt;&gt; any hint in this case. Sadly depending on where you look,<br>
&gt;&gt;&gt; applicability of this pair of registers (I/O ports 0x4d0 and 0=
x4d1)<br>
&gt;&gt;&gt; to other than EISA systems is claimed true or false. Could you=
 perhaps<br>
&gt;&gt;&gt; make Xen simply log the values read from those two ports, by e=
.g.<br>
&gt;&gt;&gt; inserting<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 printk(&quot;ELCR: %02x, %02x\n&quot;, inb=
(0x4d0), inb(0x4d1));<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; in, say, setup_dump_irqs()?<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; did that but I don&#39;t know how to trigger the dump.<br>
<br>
There&#39;s no need to trigger the dump. The message will be logged during<=
br>
boot, and hence ought to be visible in &quot;xl dmesg&quot; output.</blockq=
uote><div><br></div></span><div>Got :</div><div><br></div><div>(XEN) ELCR: =
00, 00</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Le=C2=A0ven. 22 d=C3=A9c. 2023 =C3=A0=C2=A009:46, Jan Beulich &=
lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 21=
.12.2023 21:41, S=C3=A9bastien Chaumat wrote:<br>
&gt; Le jeu. 21 d=C3=A9c. 2023 =C3=A0 14:29, Juergen Gross &lt;<a href=3D"m=
ailto:jgross@suse.com" target=3D"_blank">jgross@suse.com</a>&gt; a =C3=A9cr=
it :<br>
&gt; <br>
&gt;&gt; On 21.12.23 13:40, Jan Beulich wrote:<br>
&gt;&gt;&gt; On 20.12.2023 17:34, S=C3=A9bastien Chaumat wrote:<br>
&gt;&gt;&gt;&gt; Here are the patches I made to xen and linux kernel<br>
&gt;&gt;&gt;&gt; Plus dmesg (bare metal,xen) and &quot;xl dmesg&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So the problem looks to be that pci_xen_initial_domain() resul=
ts in<br>
&gt;&gt;&gt; permanent setup of IRQ7, when there only &quot;static&quot; AC=
PI tables (in<br>
&gt;&gt;&gt; particular source overrides in MADT) are consulted. The necess=
ary<br>
&gt;&gt;&gt; settings, however, are known only after _CRS for the device wa=
s<br>
&gt;&gt;&gt; evaluated (and possibly _PRS followed by invocation of _SRS). =
All of<br>
&gt;&gt;&gt; this happens before xen_register_gsi() is called. But that fun=
ction&#39;s<br>
&gt;&gt;&gt; call to xen_register_pirq() is short-circuited by the very fir=
st if()<br>
&gt;&gt;&gt; in xen_register_pirq() when there was an earlier invocation. H=
ence<br>
&gt;&gt;&gt; the (wrong) &quot;edge&quot; binding remains in place, as was =
established by<br>
&gt;&gt;&gt; the earlier call here.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; J=C3=BCrgen, there&#39;s an interesting comment in xen_bind_pi=
rq_gsi_to_irq(),<br>
&gt;&gt;&gt; right before invoking irq_set_chip_and_handler_name(). Despite=
 what<br>
&gt;&gt;&gt; the comment says (according to my reading), the fasteoi one is=
 _not_<br>
&gt;&gt;&gt; used in all cases. Assuming there&#39;s a reason for this, it&=
#39;s not clear<br>
&gt;&gt;&gt; to me whether updating the handler later on is a valid thing t=
o do.<br>
&gt;&gt;&gt; __irq_set_handler() being even an exported symbol suggests tha=
t might<br>
&gt;&gt;&gt; be an option to use here. Then again merely updating the handl=
er may<br>
&gt;&gt;&gt; not be sufficient, seeing there are also e.g. IRQD_TRIGGER_MAS=
K and<br>
&gt;&gt;&gt; IRQD_LEVEL.<br>
&gt;&gt;<br>
&gt;&gt; I understand the last paragraph of that comment to reason, that in=
 case<br>
&gt;&gt; pirq_needs_eoi() return true even in case of an edge triggered int=
errupt,<br>
&gt;&gt; the outcome is still okay.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think updating the handler later is valid.<br>
&gt;&gt;<br>
&gt;&gt;&gt; S=C3=A9bastien, to prove the (still pretty weak) theory that t=
he change in<br>
&gt;&gt;&gt; handler is all that&#39;s needed to make things work in your c=
ase, could<br>
&gt;&gt;&gt; you fiddle with pci_xen_initial_domain() to have it skip IRQ7?=
 (That<br>
&gt;&gt;&gt; of course won&#39;t be a proper solution, but ought to be okay=
 for your<br>
&gt;&gt;&gt; system.) The main weakness of the theory is that IRQ7 really i=
sn&#39;t<br>
&gt;&gt;&gt; very special in this regard - other PCI IRQs routed to the low=
 16<br>
&gt;&gt;&gt; IO-APIC pins ought to have similar issues (from the log, on yo=
ur<br>
&gt;&gt;&gt; system this would be at least IRQ6 and IRQ10, except that they=
 happen<br>
&gt;&gt;&gt; to be edge/low, so fitting the ISA defaults); only IRQ16 and u=
p would<br>
&gt;&gt;&gt; work okay.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; Doing just that : IQR7 is now=C2=A0 of type level<br>
&gt;=C2=A0 =C2=A0xen-pirq=C2=A0 =C2=A0 =C2=A0-ioapic-level=C2=A0 pinctrl_am=
d<br>
&gt; <br>
&gt; <br>
&gt; (but is ioapic-level there totally equivalent to the fasteoi of bareme=
tal)<br>
&gt; Still the touchpad does not work.<br>
&gt; <br>
&gt; And we have now :<br>
&gt; Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-PIXA3854:00: failed to=
<br>
&gt; reset device: -61<br>
&gt; Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-PIXA3854:00<=
br>
&gt; failed with error -61<br>
&gt; <br>
&gt; in addition to<br>
&gt; Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0004:00: failed to=
<br>
&gt; reset device: -61<br>
&gt; Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0005:00: failed to=
<br>
&gt; reset device: -61<br>
&gt; Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0004:00<=
br>
&gt; failed with error -61<br>
&gt; Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0005:00<=
br>
&gt; failed with error -61<br>
<br>
So there&#39;s more to this, which I&#39;m afraid will (first) need looking=
 into<br>
by a person familiar with the involved drivers.<br>
<br>
&gt; I noticed that on baremetal :<br>
&gt; <br>
&gt;=C2=A0 =C2=A053:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A01268<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 5=C2=A0 FRMW0005=
:00<br>
&gt;=C2=A0 =C2=A054:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A084=C2=A0 FRMW0004=
:00<br>
&gt;=C2=A0 =C2=A055:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A01403<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 8=C2=A0 PIXA3854=
:00<br>
&gt; <br>
&gt; with xen with IRQ7 setup only once there&#39;s only (the touchpad is<b=
r>
&gt; PIXA3854:00)<br>
&gt; <br>
&gt;=C2=A0 176:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 8<br>
&gt; <br>
&gt; Interestingly when IRQ7 is setup twice (normal xen)<br>
&gt;=C2=A0 176:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 amd_gpio=C2=A0 =C2=A0 8=C2=A0 PIXA3854=
:00<br>
<br>
That&#39;s odd, as with IRQ7 (wrongly) setup as edge, it should also be mar=
ked<br>
as non-sharable. Otoh with the &quot;i2c-PIXA3854:00:&quot; error above it&=
#39;s no<br>
surprise no interrupt is set up there.<br>
<br>
&gt;&gt; Furthermore it might be interesting to know whether ELCR would giv=
e us<br>
&gt;&gt;&gt; any hint in this case. Sadly depending on where you look,<br>
&gt;&gt;&gt; applicability of this pair of registers (I/O ports 0x4d0 and 0=
x4d1)<br>
&gt;&gt;&gt; to other than EISA systems is claimed true or false. Could you=
 perhaps<br>
&gt;&gt;&gt; make Xen simply log the values read from those two ports, by e=
.g.<br>
&gt;&gt;&gt; inserting<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 printk(&quot;ELCR: %02x, %02x\n&quot;, inb=
(0x4d0), inb(0x4d1));<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; in, say, setup_dump_irqs()?<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; did that but I don&#39;t know how to trigger the dump.<br>
<br>
There&#39;s no need to trigger the dump. The message will be logged during<=
br>
boot, and hence ought to be visible in &quot;xl dmesg&quot; output.<br>
<br>
Jan<br>
</blockquote></div>

--000000000000fa0dad060d1a266d--

