Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1352873D86
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689434.1074395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhv4k-0003Nz-9B; Wed, 06 Mar 2024 17:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689434.1074395; Wed, 06 Mar 2024 17:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhv4k-0003M6-61; Wed, 06 Mar 2024 17:29:06 +0000
Received: by outflank-mailman (input) for mailman id 689434;
 Wed, 06 Mar 2024 17:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjQC=KM=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rhv4i-0003Ly-MQ
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:29:04 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05d76583-dbdf-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 18:29:02 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-29b31254820so3034699a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:29:02 -0800 (PST)
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
X-Inumbo-ID: 05d76583-dbdf-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709746141; x=1710350941; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wo+d/Xr9lGCvYIjueal3SEaIryY8gDEHwf05Z8ZS13s=;
        b=goNwYS9wQ9wjSBKDpDnyXMKDzyq+n+fmWyGn5v6HiJ2Bi5dfWFNTDhke1AIszv6FO4
         qrwVHL5++0VlG8+F0U3MdkNmLiKQl1RvGb2hEbI8QjPqcYvzoXTs6pXZbJvYQYTKeeWh
         Fli1os4FSMLimMTSHMkYSrLJfH9QzHg/JUFp5xOaNg0Tc4ZBOHbM+29c6zKGDiBpNmAH
         spAt2M3VtVq+mrMiWhhObTJLWntct3NtrNhP8l2A05kpMxX3NDEhhmVGNQV7TLVwyFuC
         ZTMrXgMnXyEG0q3qJUG4dfkp4w5iJ3DxPmTm55vzmGZfQvG/2KVSSYlLTPvqoiAki7b2
         JMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709746141; x=1710350941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wo+d/Xr9lGCvYIjueal3SEaIryY8gDEHwf05Z8ZS13s=;
        b=ELdEe4Ao/errSL04PqRcPawQp0DIdu+UUYyhStIn9aY6Fidrh4wH2NsO8WG/8/YKhz
         D2PYnIYtB7KAG2it0hkf4/cMlNZCP8Q+B6dBWfWmuDh6dMnwQ/Bb4utIl1u3s5ap6I1e
         zmQwmk0GZs5iYpzDP5NpcAnfJVvTG5MR0k/f8lfy6o4/egkUmwvxDxk61+jZ8ejvj8s7
         MLIwXGya6hS+Gx4qyUAsjkoALDUqXLsABryXW9x7XTcua7OmArTimC1HmmbBvpG3oMiJ
         wkKAf0Qj88mQ1ITWxKJYyjVdGrl6WnrT5gbJbnaAniYSOTncERxbxIrQaviZDcH3ThDZ
         21Yw==
X-Gm-Message-State: AOJu0YwhX5YvYF+pp8JoMs0he/L8X/P3QT6RxcFy2aaOHhVf8gm/RaqC
	+338lVnBVocsqdz6bGgpaLNWWNsjkb1i0QfbThNYiXbkaLr7CYTDhPGdco44JymobHSyvMdTgA2
	jG/14ERQi7yiZ0dR7OjD7YSuw7FAXb4L5gss=
X-Google-Smtp-Source: AGHT+IHrFIb/6HH+eC1Cs2jKzwjkYPvAxyHsiGKlRjr2jbzcyMU/7KHLHmT8HduN9pt1aKRGdREp6ewAIBBxgd5s7j4=
X-Received: by 2002:a17:90a:70f:b0:29b:7921:6b93 with SMTP id
 l15-20020a17090a070f00b0029b79216b93mr1612376pjl.47.1709746140781; Wed, 06
 Mar 2024 09:29:00 -0800 (PST)
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
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com> <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
In-Reply-To: <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 6 Mar 2024 18:28:49 +0100
Message-ID: <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="00000000000060a6300613014b0b"

--00000000000060a6300613014b0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reasoning backward  (using a  kernel without the pinctrl_amd driver to
> ensure xen only is at stake) :
>  checking the diff in IOAPIC  between bare metal and xen  (IRQ7 is on
> pin07 on APIC )
>
> using kernel argument : apic=3Ddebug
>
> bare metal :
> [    0.715330] fedora kernel: ... APIC VERSION: 81050010
> ...
> [    0.715433] fedora kernel:  pin07, disabled, edge , high, V(00),
> IRR(0), S(0), physical, D(0000), M(0)
>
> xen :
> [    2.249582] fedora kernel: ... APIC VERSION: 00000014
> ...
> [    2.249730] fedora kernel:  pin07, disabled, level, low , V(60),
> IRR(0), S(0), physical, D(0000), M(0)
>
> So the APIC table is not the same.
>
> As strange as it looks the  (IOAPIC 0) pin07 is correctly described by th=
e
> APIC in xen but yet differently than in baremetal.
> But the APIC message comes long after the
> [    1.833145] fedora kernel: xen: registering gsi 7 triggering 0 polarit=
y
> 1
>
> so I wonder if the APIC pin07 info had any influence.
>
> Finally found the fix : adding ioapic_ack=3Dnew to xen boot parameters.
Not only the trackpad is now working but also the ACPI Embedded Controller
which is completely disabled.

S=C3=A9bastien

--00000000000060a6300613014b0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><br><div class=3D"gm=
ail_quote"><br><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div><div><=
br></div></div></div></div></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Reasoning backward=
=C2=A0 (using a=C2=A0 kernel without the pinctrl_amd driver to ensure xen o=
nly is at stake) :</div><div>=C2=A0checking the diff in IOAPIC=C2=A0 betwee=
n bare metal and xen=C2=A0 (IRQ7 is on pin07 on APIC ) <br></div><div><br><=
/div><div>using kernel argument : apic=3Ddebug</div><div><br></div><div>bar=
e metal :</div><div>[ =C2=A0 =C2=A00.715330] fedora kernel: ... APIC VERSIO=
N: 81050010</div><div>...</div><div>[ =C2=A0 =C2=A00.715433] fedora kernel:=
 =C2=A0pin07, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000)=
, M(0)</div><div><br></div><div>xen :<br></div><div>[ =C2=A0 =C2=A02.249582=
] fedora kernel: ... APIC VERSION: 00000014</div><div>...</div><div>[ =C2=
=A0 =C2=A02.249730] fedora kernel: =C2=A0pin07, disabled, level, low , V(60=
), IRR(0), S(0), physical, D(0000), M(0)</div><div><br></div><div>So the AP=
IC table is not the same.</div><div><br></div><div>As strange as it looks t=
he=C2=A0 (IOAPIC 0) pin07 is correctly described by the APIC in xen but yet=
 differently than in baremetal.</div><div>But the APIC message comes long a=
fter the <br></div><div>[ =C2=A0 =C2=A01.833145] fedora kernel: xen: regist=
ering gsi 7 triggering 0 polarity 1</div><div><br></div><div>so I wonder if=
 the APIC pin07 info had any influence.</div><div><br></div></div></div></b=
lockquote><div>Finally found the fix : adding <span style=3D"font-weight:no=
rmal">ioapic_ack=3Dnew</span> to xen boot parameters.</div><div>Not only th=
e trackpad is now working but also the ACPI Embedded Controller which is co=
mpletely disabled.</div><div><br></div><div>S=C3=A9bastien<br></div><div><b=
r></div><div><br></div><div><br></div></div></div>

--00000000000060a6300613014b0b--

