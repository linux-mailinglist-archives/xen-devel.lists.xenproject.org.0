Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA7845DC3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 17:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674553.1049573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaHx-0002it-GW; Thu, 01 Feb 2024 16:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674553.1049573; Thu, 01 Feb 2024 16:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaHx-0002gm-DU; Thu, 01 Feb 2024 16:51:45 +0000
Received: by outflank-mailman (input) for mailman id 674553;
 Thu, 01 Feb 2024 16:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=biZV=JK=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rVaHw-0002fT-DY
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 16:51:44 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c4ffda2-c122-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 17:51:42 +0100 (CET)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6da6b0eb2d4so886546b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 08:51:42 -0800 (PST)
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
X-Inumbo-ID: 2c4ffda2-c122-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706806300; x=1707411100; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHgO2N+l6o7ljfKXbnAdMBmgfTYXAOxMzwYRNwJOjdc=;
        b=Y+1uv5kVKuqautBdz9r0hgNodRR5rLugkj7q2Wpiio4EbLwxvLHVmTNp/Q4ZJ/zWkY
         y58Cz3mjc+fX9tpeQXM+7RjhCl2q+fk+Jjm2p6ibDDOHWcx76v3ymtQmcr8Loc8Tr9eP
         K81l9EcsSfDoz1kllEsCTkuc60dKO5eggVJWOFzr7d1ZEJ4WkQEvW2x7I3DzrUU1ASOt
         6lhNenZbjcOLVrbcVbbsY5AQ+Ol53FLe0GIoo2XCajukKInM+RcI1dpcFgxPZBE95NQz
         MMeQwulMo3JYy1VsqwuM5Y8gCeBdqaJ8whlIninJX7Z0VxLyPYDfPgrIkonPWxjsKfwl
         cSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806300; x=1707411100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHgO2N+l6o7ljfKXbnAdMBmgfTYXAOxMzwYRNwJOjdc=;
        b=qd0q5UY4GUH2gMBH/MIDfRKX4J5aDKNh1o7J4x8xnIyi4GI7vVl4dyqVCdr4LFXkZm
         nukRwE3eXoELLus6u6Y0ueZzcY9u1xFXFxiOy8iMlTcFrSQfuSuw+kv/+jQX/7k+w01G
         +fnVV9DmBURTeyBl5+HEnKmC1DAwwPtSI5Cik8cUbbWtm4zYaORaJqw78wI0hluWB6wz
         JRVLITT/IfMMzIQOvbwYya3S6VepdaRQX9GDpbJErpn0ZMzdPxEKyVa/IdPDQGp70xGQ
         /Snx2UMw+L8q+f00T7Y8SdYWcfHyXvXZIB7bJgktJNhlfnh+cl1HsHKRXVsWBFZwP1zn
         aAIQ==
X-Gm-Message-State: AOJu0YxqfgztfK+O1x+C2oTRtzlm9Pk8+i27DlY9LklzjaCoQjJGogbf
	U4g9sjOLGQl5d5yaNkiEfw8mrhOK5CgAimqu5dGJBek1/cBJubLLwYfAlQQLShLmNY6HtowaQfq
	biNTJiXkuLAhFaL03JHO+Fp56zF8=
X-Google-Smtp-Source: AGHT+IHaHkuZaTIehF3ZXnPaTmy4AEtFZTyIYcHEjMM+enOgb7CO+yg+2maj9afol4UoDChrKOKvieU9a+/6Yw/rdbU=
X-Received: by 2002:a05:6a00:181c:b0:6dd:c870:3f82 with SMTP id
 y28-20020a056a00181c00b006ddc8703f82mr7032844pfa.4.1706806300407; Thu, 01 Feb
 2024 08:51:40 -0800 (PST)
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
In-Reply-To: <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Thu, 1 Feb 2024 17:51:28 +0100
Message-ID: <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000003c7d2d061054cf25"

--0000000000003c7d2d061054cf25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 1 f=C3=A9vr. 2024 =C3=A0 13:30, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a
=C3=A9crit :

> I spotted the following warning for IRQ7 (along with IRQ6 and 10)
>
> [    0.686073] fedora kernel: __irq_set_trigger: genirq: No set_type
> function for IRQ 7 (IR-IO-APIC)
>
> This comes from kernel/irq/manage.c
>
>
> int __irq_set_trigger(struct irq_desc *desc, unsigned long flags)
> {
> struct irq_chip *chip =3D desc->irq_data.chip;
> int ret, unmask =3D 0;
>
> if (!chip || !chip->irq_set_type) {
> /*
> * IRQF_TRIGGER_* but the PIC does not support multiple
> * flow-types?
> */
> pr_debug("No set_type function for IRQ %d (%s)\n",
> irq_desc_get_irq(desc),
> chip ? (chip->name ? : "unknown") : "unknown");
> return 0;
> }
> Could this have a role in the IRQ misconfiguration by xen ?
>

 Things are getting even weirder :

xen 4.18.1-pre (vanilla, no patching of pci_xen_initial_domain()), kernel
6.8.0-rc2) :

checking /sys/kernel/irq/7 :

actions: pinctrl_amd
chip_name: xen-pirq
hwirq:
name: ioapic-edge
per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
type: edge
wakeup: disabled

now checking  xen with xl debug-key i

(XEN)    IRQ:   7 vec:51 IO-APIC-level   status=3D030 aff:{13}/{13}
in-flight=3D0 d0:  7(---)
(XEN)     IRQ  7 Vec 81:
(XEN)       Apic 0x00, Pin  7: vec=3D51 delivery=3DFixed dest=3DP status=3D=
1
polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:0000510d

So even after dom0 is set up, the kernel considers  IRQ7 is of type edge
while xen has it registered as IO-APIC-level.

--0000000000003c7d2d061054cf25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><div><div><br></div><div><br></div><d=
iv><br></div><div><br><br></div></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 1 f=C3=
=A9vr. 2024 =C3=A0=C2=A013:30, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto=
:euidzero@gmail.com" target=3D"_blank">euidzero@gmail.com</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div>I spotted the following warning for IRQ7 (along with IRQ6 =
and 10)<br></div><div><br></div><div><div>[ =C2=A0 =C2=A00.686073] fedora k=
ernel: __irq_set_trigger: genirq: No set_type function for IRQ 7 (IR-IO-API=
C)</div></div><div><br></div><div>This comes from kernel/irq/manage.c</div>=
<div><br></div><div><br></div>int __irq_set_trigger(struct irq_desc *desc, =
unsigned long flags)<br>{<br>struct irq_chip *chip =3D desc-&gt;irq_data.ch=
ip;<br>int ret, unmask =3D 0;<br><br>if (!chip || !chip-&gt;irq_set_type) {=
<br>/*<br>* IRQF_TRIGGER_* but the PIC does not support multiple<br>* flow-=
types?<br>*/<br>pr_debug(&quot;No set_type function for IRQ %d (%s)\n&quot;=
,<br>irq_desc_get_irq(desc),<br>chip ? (chip-&gt;name ? : &quot;unknown&quo=
t;) : &quot;unknown&quot;);<br>return 0;<br>}<div>Could this have a role in=
 the IRQ misconfiguration by xen ?</div><div><div></div></div></div></block=
quote><div><br></div><div>=C2=A0Things are getting even weirder : <br></div=
><div><br></div><div>xen 4.18.1-pre (vanilla, no patching of  pci_xen_initi=
al_domain()), kernel 6.8.0-rc2) :<br><div><br></div><div>checking /sys/kern=
el/irq/7 :</div><div><br></div><div>actions: pinctrl_amd<br>chip_name: xen-=
pirq<br>hwirq: <br>name: ioapic-edge<br>per_cpu_count: 0,0,0,0,0,0,1,0,0,0,=
0,0,0,0,0,0<br>type: edge<br>wakeup: disabled</div><div><br></div><div>now =
checking=C2=A0 xen with xl debug-key i</div><div><br></div><div>(XEN) =C2=
=A0 =C2=A0IRQ: =C2=A0 7 vec:51 IO-APIC-level =C2=A0 status=3D030 aff:{13}/{=
13} in-flight=3D0 d0: =C2=A07(---)</div><div><div>(XEN) =C2=A0 =C2=A0 IRQ =
=C2=A07 Vec 81:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A07: vec=
=3D51 delivery=3DFixed dest=3DP status=3D1 polarity=3D1 irr=3D1 trig=3DL ma=
sk=3D0 dest_id:0000510d</div><div><br></div><div>So even after dom0 is set =
up, the kernel considers=C2=A0 IRQ7 is of type edge while xen has it regist=
ered as IO-APIC-level.</div><div><br></div><div><br></div></div></div></div=
>
</div>

--0000000000003c7d2d061054cf25--

