Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6B81BFB7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 21:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659158.1028639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGPr4-00027V-U4; Thu, 21 Dec 2023 20:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659158.1028639; Thu, 21 Dec 2023 20:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGPr4-00023l-RO; Thu, 21 Dec 2023 20:41:18 +0000
Received: by outflank-mailman (input) for mailman id 659158;
 Thu, 21 Dec 2023 20:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G8UO=IA=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rGPr3-00022A-DN
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 20:41:17 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47958bda-a041-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 21:41:13 +0100 (CET)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d39132d6baso781819b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 12:41:13 -0800 (PST)
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
X-Inumbo-ID: 47958bda-a041-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703191272; x=1703796072; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GKqxoi87EbH/9z63phVS4iIf2Nc0b8+gNLf5qWxH2TM=;
        b=hdywRMSdk+EuMrUpEYQTWOp8qpWee2GeXcaUrCGQ0YQLBg9hszo6qd+N+wmUb173BH
         xZkss2tBwgipD69M5X0f+AN1yWitgJPcj8rYQ+i0Ac+aiCZco2PZpHTEsvnzpBF7MYE4
         gBBPn9rsDLezSCRdcU0VSOdY3vkhhJLt1919H4odLA0YoCPh91Ea834qeEI1cOth6hJh
         Yai553JHHwjSFW4JtvWXJ9hiHX6yOlE6MTZ9oedQhJyuIYWBCOqsQA6y0tkNnjy/fD6h
         NYH35hdTaH9oGwUf2dYLcBk3xP7+5IcZJyN4AKuNnWtPKsP2+Cgof/oaU3fm2+VohB71
         BbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703191272; x=1703796072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKqxoi87EbH/9z63phVS4iIf2Nc0b8+gNLf5qWxH2TM=;
        b=nNqJE70iKO5OXa8d8bCrBvmkVcU5BIyFV2dL1X4bNy8Fhl8jhYK5oMJV10S8L5P6fX
         PpFem1AFFYcrXsJ8ieYK/6U7i4JiuyopIr++48lBXlC4oNZCJonpAOt1PKwUkeB3Rq/b
         h8E5KJ8PzFRcXKwlli5+IYUoNg++Gf0akx2RnZ6/QHdFyhyWRbnxbXO6+ioM7qGx/ONp
         DKCRfJjMIvEMp9iT8vy9GgEj737EQGbXIBNagbVVBieODxUt+x4YsxLsZZv4Hz7amvf0
         wKOyd3Xt9WNP7cY3cGL2YtG2rd2+reuMs8A0AHJwrhhZqlVhHoUqGwMsiUEY434++DbY
         UoxA==
X-Gm-Message-State: AOJu0YyOSnWYhWIvFYWAiZYeQhM/6dnAtC/AqITEDXcNSHO8b5O7aNe7
	IbPGdcMQ7bJs9BWkUiBiqztnl5nXlFEqhQQktc0=
X-Google-Smtp-Source: AGHT+IHXKGk9RfQkluoZSj07RynXBgT6pi926lW8OV+iu+ZptrzpRjlYI8sYJzcuOhG2q5zuM8Y1AZBKO23DcHMlNB4=
X-Received: by 2002:aa7:9eca:0:b0:6d5:8889:f13b with SMTP id
 r10-20020aa79eca000000b006d58889f13bmr228047pfq.63.1703191272104; Thu, 21 Dec
 2023 12:41:12 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com> <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com> <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com> <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com> <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
In-Reply-To: <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Thu, 21 Dec 2023 21:41:00 +0100
Message-ID: <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c2296e060d0b1e38"

--000000000000c2296e060d0b1e38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 21 d=C3=A9c. 2023 =C3=A0 14:29, Juergen Gross <jgross@suse.com> a =
=C3=A9crit :

> On 21.12.23 13:40, Jan Beulich wrote:
> > On 20.12.2023 17:34, S=C3=A9bastien Chaumat wrote:
> >> Here are the patches I made to xen and linux kernel
> >> Plus dmesg (bare metal,xen) and "xl dmesg"
> >
> > So the problem looks to be that pci_xen_initial_domain() results in
> > permanent setup of IRQ7, when there only "static" ACPI tables (in
> > particular source overrides in MADT) are consulted. The necessary
> > settings, however, are known only after _CRS for the device was
> > evaluated (and possibly _PRS followed by invocation of _SRS). All of
> > this happens before xen_register_gsi() is called. But that function's
> > call to xen_register_pirq() is short-circuited by the very first if()
> > in xen_register_pirq() when there was an earlier invocation. Hence
> > the (wrong) "edge" binding remains in place, as was established by
> > the earlier call here.
> >
> > J=C3=BCrgen, there's an interesting comment in xen_bind_pirq_gsi_to_irq=
(),
> > right before invoking irq_set_chip_and_handler_name(). Despite what
> > the comment says (according to my reading), the fasteoi one is _not_
> > used in all cases. Assuming there's a reason for this, it's not clear
> > to me whether updating the handler later on is a valid thing to do.
> > __irq_set_handler() being even an exported symbol suggests that might
> > be an option to use here. Then again merely updating the handler may
> > not be sufficient, seeing there are also e.g. IRQD_TRIGGER_MASK and
> > IRQD_LEVEL.
>
> I understand the last paragraph of that comment to reason, that in case
> pirq_needs_eoi() return true even in case of an edge triggered interrupt,
> the outcome is still okay.
>
> I don't think updating the handler later is valid.
>
> > S=C3=A9bastien, to prove the (still pretty weak) theory that the change=
 in
> > handler is all that's needed to make things work in your case, could
> > you fiddle with pci_xen_initial_domain() to have it skip IRQ7? (That
> > of course won't be a proper solution, but ought to be okay for your
> > system.) The main weakness of the theory is that IRQ7 really isn't
> > very special in this regard - other PCI IRQs routed to the low 16
> > IO-APIC pins ought to have similar issues (from the log, on your
> > system this would be at least IRQ6 and IRQ10, except that they happen
> > to be edge/low, so fitting the ISA defaults); only IRQ16 and up would
> > work okay.
> >
>

Doing just that : IQR7 is now  of type level
  xen-pirq     -ioapic-level  pinctrl_amd


(but is ioapic-level there totally equivalent to the fasteoi of baremetal)
Still the touchpad does not work.

And we have now :
Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-PIXA3854:00: failed to
reset device: -61
Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-PIXA3854:00
failed with error -61

in addition to
Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0004:00: failed to
reset device: -61
Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-FRMW0005:00: failed to
reset device: -61
Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0004:00
failed with error -61
Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0005:00
failed with error -61


I noticed that on baremetal :

  53:          0          0          0          0          0       1268
     0          0          0          0          0          0          0
       0          0          0  amd_gpio    5  FRMW0005:00
  54:          0          0          0          0          0          1
     0          0          0          0          0          0          0
       0          0          0  amd_gpio   84  FRMW0004:00
  55:          0          0          0          0          0       1403
     0          0          0          0          0          0          0
       0          0          0  amd_gpio    8  PIXA3854:00

with xen with IRQ7 setup only once there's only (the touchpad is
PIXA3854:00)

 176:          0          0          0          0          0          0
     1          0          0          0          0          0          0
       0          0          0  amd_gpio    8

Interestingly when IRQ7 is setup twice (normal xen)
 176:          0          0          0          0          0          0
     1          0          0          0          0          0          0
       0          0          0  amd_gpio    8  PIXA3854:00


> Furthermore it might be interesting to know whether ELCR would give us
> > any hint in this case. Sadly depending on where you look,
> > applicability of this pair of registers (I/O ports 0x4d0 and 0x4d1)
> > to other than EISA systems is claimed true or false. Could you perhaps
> > make Xen simply log the values read from those two ports, by e.g.
> > inserting
> >
> >      printk("ELCR: %02x, %02x\n", inb(0x4d0), inb(0x4d1));
> >
> > in, say, setup_dump_irqs()?
> >
>
did that but I don't know how to trigger the dump.

S=C3=A9bastien

--000000000000c2296e060d0b1e38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0jeu. 21 d=C3=A9c. 2023 =C3=A0=C2=A014:29, Juergen Gross &lt;<a href=
=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; a =C3=A9crit=C2=A0:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 21.12.23 13:40, =
Jan Beulich wrote:<br>
&gt; On 20.12.2023 17:34, S=C3=A9bastien Chaumat wrote:<br>
&gt;&gt; Here are the patches I made to xen and linux kernel<br>
&gt;&gt; Plus dmesg (bare metal,xen) and &quot;xl dmesg&quot;<br>
&gt; <br>
&gt; So the problem looks to be that pci_xen_initial_domain() results in<br=
>
&gt; permanent setup of IRQ7, when there only &quot;static&quot; ACPI table=
s (in<br>
&gt; particular source overrides in MADT) are consulted. The necessary<br>
&gt; settings, however, are known only after _CRS for the device was<br>
&gt; evaluated (and possibly _PRS followed by invocation of _SRS). All of<b=
r>
&gt; this happens before xen_register_gsi() is called. But that function&#3=
9;s<br>
&gt; call to xen_register_pirq() is short-circuited by the very first if()<=
br>
&gt; in xen_register_pirq() when there was an earlier invocation. Hence<br>
&gt; the (wrong) &quot;edge&quot; binding remains in place, as was establis=
hed by<br>
&gt; the earlier call here.<br>
&gt; <br>
&gt; J=C3=BCrgen, there&#39;s an interesting comment in xen_bind_pirq_gsi_t=
o_irq(),<br>
&gt; right before invoking irq_set_chip_and_handler_name(). Despite what<br=
>
&gt; the comment says (according to my reading), the fasteoi one is _not_<b=
r>
&gt; used in all cases. Assuming there&#39;s a reason for this, it&#39;s no=
t clear<br>
&gt; to me whether updating the handler later on is a valid thing to do.<br=
>
&gt; __irq_set_handler() being even an exported symbol suggests that might<=
br>
&gt; be an option to use here. Then again merely updating the handler may<b=
r>
&gt; not be sufficient, seeing there are also e.g. IRQD_TRIGGER_MASK and<br=
>
&gt; IRQD_LEVEL.<br>
<br>
I understand the last paragraph of that comment to reason, that in case<br>
pirq_needs_eoi() return true even in case of an edge triggered interrupt,<b=
r>
the outcome is still okay.<br>
<br>
I don&#39;t think updating the handler later is valid.<br>
<br>
&gt; S=C3=A9bastien, to prove the (still pretty weak) theory that the chang=
e in<br>
&gt; handler is all that&#39;s needed to make things work in your case, cou=
ld<br>
&gt; you fiddle with pci_xen_initial_domain() to have it skip IRQ7? (That<b=
r>
&gt; of course won&#39;t be a proper solution, but ought to be okay for you=
r<br>
&gt; system.) The main weakness of the theory is that IRQ7 really isn&#39;t=
<br>
&gt; very special in this regard - other PCI IRQs routed to the low 16<br>
&gt; IO-APIC pins ought to have similar issues (from the log, on your<br>
&gt; system this would be at least IRQ6 and IRQ10, except that they happen<=
br>
&gt; to be edge/low, so fitting the ISA defaults); only IRQ16 and up would<=
br>
&gt; work okay.<br>
&gt; <br></blockquote><div><br></div><div>Doing just that : IQR7 is now=C2=
=A0 of type level<br></div><div>=C2=A0 xen-pirq =C2=A0 =C2=A0 -ioapic-level=
 =C2=A0pinctrl_amd<br></div><div><br></div><div><br></div><div>(but is ioap=
ic-level there totally equivalent to the fasteoi of baremetal)<br></div><di=
v>Still the touchpad does not work.</div><div><br></div><div>And we have no=
w :</div><div>Dec 21 20:13:57 fedora kernel: i2c_hid_acpi i2c-PIXA3854:00: =
failed to reset device: -61</div><div>Dec 21 20:14:17 fedora kernel: i2c_hi=
d_acpi: probe of i2c-PIXA3854:00 failed with error -61</div><div><br></div>=
<div>in addition to <br></div><div>Dec 21 20:13:57 fedora kernel: i2c_hid_a=
cpi i2c-FRMW0004:00: failed to reset device: -61<br>Dec 21 20:13:57 fedora =
kernel: i2c_hid_acpi i2c-FRMW0005:00: failed to reset device: -61<br>Dec 21=
 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRMW0004:00 failed with=
 error -61<br>Dec 21 20:14:17 fedora kernel: i2c_hid_acpi: probe of i2c-FRM=
W0005:00 failed with error -61</div><div><br></div><div><br></div><div>I no=
ticed that on baremetal :</div><div><br>=C2=A0 53: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 =C2=A0 =C2=A0 =C2=A0 1268 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00 =C2=A0amd_gpio =C2=A0 =C2=A05 =C2=A0FRMW0005:00<br>=
=C2=A0 54: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0amd_=
gpio =C2=A0 84 =C2=A0FRMW0004:00<br>=C2=A0 55: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0 =C2=A0 =C2=A0 =C2=A0 1403 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00 =C2=A0amd_gpio =C2=A0 =C2=A08 =C2=A0PIXA3854:00</div><div><=
br></div><div>with xen with IRQ7 setup only once there&#39;s only (the touc=
hpad is PIXA3854:00) <br></div><div><br></div><div>=C2=A0176: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0amd_gpio =C2=A0 =C2=A08</=
div><div><br></div><div>Interestingly when IRQ7 is setup twice (normal xen)=
 <br></div><div>=C2=A0176: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00 =C2=A0amd_gpio =C2=A0 =C2=A08 =C2=A0PIXA3854:00</div><div><br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Furthermore it might be interesting to know whether ELCR would give us=
<br>
&gt; any hint in this case. Sadly depending on where you look,<br>
&gt; applicability of this pair of registers (I/O ports 0x4d0 and 0x4d1)<br=
>
&gt; to other than EISA systems is claimed true or false. Could you perhaps=
<br>
&gt; make Xen simply log the values read from those two ports, by e.g.<br>
&gt; inserting<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 printk(&quot;ELCR: %02x, %02x\n&quot;, inb(0x4d0),=
 inb(0x4d1));<br>
&gt; <br>
&gt; in, say, setup_dump_irqs()?<br>
&gt; <br></blockquote><div>did that but I don&#39;t know how to trigger the=
 dump.<br></div><div>=C2=A0</div><div>S=C3=A9bastien
</div></div></div></div></div>

--000000000000c2296e060d0b1e38--

