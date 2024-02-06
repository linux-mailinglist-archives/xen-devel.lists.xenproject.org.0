Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71084BA95
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 17:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677027.1053420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNwU-0004xU-B6; Tue, 06 Feb 2024 16:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677027.1053420; Tue, 06 Feb 2024 16:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNwU-0004uh-82; Tue, 06 Feb 2024 16:05:02 +0000
Received: by outflank-mailman (input) for mailman id 677027;
 Tue, 06 Feb 2024 16:05:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HR0g=JP=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rXNwS-0004ub-Qj
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 16:05:00 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79567307-c509-11ee-8a48-1f161083a0e0;
 Tue, 06 Feb 2024 17:04:58 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-296a02b7104so1780613a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 08:04:59 -0800 (PST)
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
X-Inumbo-ID: 79567307-c509-11ee-8a48-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707235497; x=1707840297; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BDD4xO+tU5cqx3drot12zKF0OHarPvqjDEeUhqYVy3k=;
        b=DQEmJM0hOaWqEIocYsZMHym5ImVOAZWr8/J2iPa23F3IZyIs9F6gOYKI0+8KyUrYVx
         VR8Yjwzp7b0TFchkERF/QFmFRJmk8+l66wwLaDZ1R6FbZ03coejmrttnRdn8n8aKzkwA
         CMRl332uIGI4kXUODSBSzAZkJxjzGZiSUJkJEqUGQgK6MJiiC4OuxZW+xQhszP6kybDe
         ONDp/T1MqODL2hJ2JXizbCDLPyYRzk4sXf9A5ewoJksSryou7FyV+RRhe22mQt75xWHH
         UjVjDNeTUReFExLAKhHD/0/k4XuItHRcCpwyYw15soArKcsgforxhNgOYtyGRHHSue68
         aong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707235497; x=1707840297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDD4xO+tU5cqx3drot12zKF0OHarPvqjDEeUhqYVy3k=;
        b=eT6edCAmXH8Awq0plh5Dr6oYPnqV/vEFUtXQTP+jQ0n8VntbiWUwuTkY0BC2AHsCgA
         SamEMBK9yZnYwP8WFgT9jwGmtDD+yx4Wyzdzk//+HjS5Cqx+QVZp4VkDd652JedG3zpp
         Fp6jspHY9F/XkenY/dpHXgeEaLTeiHwWDUlwQ4kAWov08sexvTYj8TcV3SBEwuN6QLPl
         zMh7hLRdNxn38AJzs2SVZFSuiKOJNbmwA12WM5tKFgRvh2Y2iw9/tGFzYxK0aJ9wnAQu
         WTYixasnUdF5hl7DEknEDq8DNEKXyQIzQ4qYqwFnKIDAsBqYDhDzfmbrJwx0CGEj7veI
         jg/w==
X-Gm-Message-State: AOJu0YyBeVh1h2i4Nujms7s+ZzZWf2fph/qqmUnacCfJGyCAbNUg1oZ7
	0cJjGfVA2Dzso7+L2hDbETTCcpniPEwqzwohkCnFzjyJYO9aBe1QNcrVz57AkMrhIPDIspQG98p
	qmNA4ob2aK+rfG2fCf98q4RrQfSMpaRAAwBFTwg==
X-Google-Smtp-Source: AGHT+IFZAAk48D1jEvUq5gFRdS9N76/AJ2mA/VAKw7vxAkd1JX9MoN1D6ko+oOa60+ThMyKujom2BqS1wp81F+G4sZE=
X-Received: by 2002:a17:90a:e643:b0:296:344d:5a0b with SMTP id
 ep3-20020a17090ae64300b00296344d5a0bmr2759314pjb.15.1707235497020; Tue, 06
 Feb 2024 08:04:57 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com> <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com> <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com> <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com> <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com> <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
In-Reply-To: <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 6 Feb 2024 17:04:45 +0100
Message-ID: <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000005921250610b8bdd3"

--0000000000005921250610b8bdd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 1 f=C3=A9vr. 2024 =C3=A0 13:30, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a
=C3=A9crit :

> I spotted the following warning for IRQ7 (along with IRQ6 and 10)
>>
>> [    0.686073] fedora kernel: __irq_set_trigger: genirq: No set_type
>> function for IRQ 7 (IR-IO-APIC)
>>
>> This comes from kernel/irq/manage.c
>>
>>
>> int __irq_set_trigger(struct irq_desc *desc, unsigned long flags)
>> {
>> struct irq_chip *chip =3D desc->irq_data.chip;
>> int ret, unmask =3D 0;
>>
>> if (!chip || !chip->irq_set_type) {
>> /*
>> * IRQF_TRIGGER_* but the PIC does not support multiple
>> * flow-types?
>> */
>> pr_debug("No set_type function for IRQ %d (%s)\n",
>> irq_desc_get_irq(desc),
>> chip ? (chip->name ? : "unknown") : "unknown");
>> return 0;
>> }
>> Could this have a role in the IRQ misconfiguration by xen ?
>>
>
>  Things are getting even weirder :
>
> xen 4.18.1-pre (vanilla, no patching of pci_xen_initial_domain()), kernel
> 6.8.0-rc2) :
>
> checking /sys/kernel/irq/7 :
>
> actions: pinctrl_amd
> chip_name: xen-pirq
> hwirq:
> name: ioapic-edge
> per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
> type: edge
> wakeup: disabled
>
> now checking  xen with xl debug-key i
>
> (XEN)    IRQ:   7 vec:51 IO-APIC-level   status=3D030 aff:{13}/{13}
> in-flight=3D0 d0:  7(---)
> (XEN)     IRQ  7 Vec 81:
> (XEN)       Apic 0x00, Pin  7: vec=3D51 delivery=3DFixed dest=3DP status=
=3D1
> polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:0000510d
>
> So even after dom0 is set up, the kernel considers  IRQ7 is of type edge
> while xen has it registered as IO-APIC-level.
>
> Reasoning backward  (using a  kernel without the pinctrl_amd driver to
ensure xen only is at stake) :
 checking the diff in IOAPIC  between bare metal and xen  (IRQ7 is on pin07
on APIC )

using kernel argument : apic=3Ddebug

bare metal :
[    0.715330] fedora kernel: ... APIC VERSION: 81050010
...
[    0.715433] fedora kernel:  pin07, disabled, edge , high, V(00), IRR(0),
S(0), physical, D(0000), M(0)

xen :
[    2.249582] fedora kernel: ... APIC VERSION: 00000014
...
[    2.249730] fedora kernel:  pin07, disabled, level, low , V(60), IRR(0),
S(0), physical, D(0000), M(0)

So the APIC table is not the same.

As strange as it looks the  (IOAPIC 0) pin07 is correctly described by the
APIC in xen but yet differently than in baremetal.
But the APIC message comes long after the
[    1.833145] fedora kernel: xen: registering gsi 7 triggering 0 polarity =
1

so I wonder if the APIC pin07 info had any influence.

--0000000000005921250610b8bdd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Le=C2=A0jeu. 1 f=C3=A9vr. 2024 =
=C3=A0=C2=A013:30, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidzero@gm=
ail.com" target=3D"_blank">euidzero@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>I spotted the following warning fo=
r IRQ7 (along with IRQ6 and 10)<br></div><div><br></div><div><div>[ =C2=A0 =
=C2=A00.686073] fedora kernel: __irq_set_trigger: genirq: No set_type funct=
ion for IRQ 7 (IR-IO-APIC)</div></div><div><br></div><div>This comes from k=
ernel/irq/manage.c</div><div><br></div><div><br></div>int __irq_set_trigger=
(struct irq_desc *desc, unsigned long flags)<br>{<br>struct irq_chip *chip =
=3D desc-&gt;irq_data.chip;<br>int ret, unmask =3D 0;<br><br>if (!chip || !=
chip-&gt;irq_set_type) {<br>/*<br>* IRQF_TRIGGER_* but the PIC does not sup=
port multiple<br>* flow-types?<br>*/<br>pr_debug(&quot;No set_type function=
 for IRQ %d (%s)\n&quot;,<br>irq_desc_get_irq(desc),<br>chip ? (chip-&gt;na=
me ? : &quot;unknown&quot;) : &quot;unknown&quot;);<br>return 0;<br>}<div>C=
ould this have a role in the IRQ misconfiguration by xen ?</div><div><div><=
/div></div></div></blockquote><div><br></div><div>=C2=A0Things are getting =
even weirder : <br></div><div><br></div><div>xen 4.18.1-pre (vanilla, no pa=
tching of  pci_xen_initial_domain()), kernel 6.8.0-rc2) :<br><div><br></div=
><div>checking /sys/kernel/irq/7 :</div><div><br></div><div>actions: pinctr=
l_amd<br>chip_name: xen-pirq<br>hwirq: <br>name: ioapic-edge<br>per_cpu_cou=
nt: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0<br>type: edge<br>wakeup: disabled</div>=
<div><br></div><div>now checking=C2=A0 xen with xl debug-key i</div><div><b=
r></div><div>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 7 vec:51 IO-APIC-level =C2=A0 s=
tatus=3D030 aff:{13}/{13} in-flight=3D0 d0: =C2=A07(---)</div><div><div>(XE=
N) =C2=A0 =C2=A0 IRQ =C2=A07 Vec 81:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x0=
0, Pin =C2=A07: vec=3D51 delivery=3DFixed dest=3DP status=3D1 polarity=3D1 =
irr=3D1 trig=3DL mask=3D0 dest_id:0000510d</div><div><br></div><div>So even=
 after dom0 is set up, the kernel considers=C2=A0 IRQ7 is of type edge whil=
e xen has it registered as IO-APIC-level.</div><div><br></div></div></div><=
/div></div></blockquote><div>Reasoning backward=C2=A0 (using a=C2=A0 kernel=
 without the pinctrl_amd driver to ensure xen only is at stake) :</div><div=
>=C2=A0checking the diff in IOAPIC=C2=A0 between bare metal and xen=C2=A0 (=
IRQ7 is on pin07 on APIC ) <br></div><div><br></div><div>using kernel argum=
ent : apic=3Ddebug</div><div><br></div><div>bare metal :</div><div>[ =C2=A0=
 =C2=A00.715330] fedora kernel: ... APIC VERSION: 81050010</div><div>...</d=
iv><div>[ =C2=A0 =C2=A00.715433] fedora kernel: =C2=A0pin07, disabled, edge=
 , high, V(00), IRR(0), S(0), physical, D(0000), M(0)</div><div><br></div><=
div>xen :<br></div><div>[ =C2=A0 =C2=A02.249582] fedora kernel: ... APIC VE=
RSION: 00000014</div><div>...</div><div>[ =C2=A0 =C2=A02.249730] fedora ker=
nel: =C2=A0pin07, disabled, level, low , V(60), IRR(0), S(0), physical, D(0=
000), M(0)</div><div><br></div><div>So the APIC table is not the same.</div=
><div><br></div><div>As strange as it looks the=C2=A0 (IOAPIC 0) pin07 is c=
orrectly described by the APIC in xen but yet differently than in baremetal=
.</div><div>But the APIC message comes long after the <br></div><div>[ =C2=
=A0 =C2=A01.833145] fedora kernel: xen: registering gsi 7 triggering 0 pola=
rity 1</div><div><br></div><div>so I wonder if the APIC pin07 info had any =
influence.</div><div><br></div><div><br></div><div><br></div><div><br></div=
><div><br></div></div></div>

--0000000000005921250610b8bdd3--

