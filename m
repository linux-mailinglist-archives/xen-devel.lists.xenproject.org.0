Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E5873E18
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689449.1074425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhvef-0004gR-EM; Wed, 06 Mar 2024 18:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689449.1074425; Wed, 06 Mar 2024 18:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhvef-0004eK-BM; Wed, 06 Mar 2024 18:06:13 +0000
Received: by outflank-mailman (input) for mailman id 689449;
 Wed, 06 Mar 2024 18:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjQC=KM=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rhvee-0004d0-2H
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:06:12 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35ea86dc-dbe4-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 19:06:10 +0100 (CET)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6e55731af5cso9941b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 10:06:10 -0800 (PST)
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
X-Inumbo-ID: 35ea86dc-dbe4-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709748369; x=1710353169; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jCnpVeyFfXdTbIhuKBuIIoc4SALrNUWp/6mK4dSKgS4=;
        b=C0YHk/NpuzZSzHGPSkVIhgyLnddK5Bk00o5OKUam12c0lmRdHmcDWDx2UXJnNDFKUg
         1Q/KgTgPp7n5sOyQ6WYH6ELmFc6zPS6NRQk9IOfbMoqaRAvqsPaHpF8CwuNaib35zrnV
         QWp1fboWyxWHjZf/dJgeFa8oAPrjhvy3PeyDHUxs+HOMGf/PPIPD8boDRqO58klvl1gk
         lQ1JG/6XmGnXZWHCTKaozBLwaRDyshFKI78kMIKgbP2Lzz4D3jUwpeXIkBrg2dBtqnx1
         sgBT6mTs+udaOYZ3nRmHZKwzg6Af3+2n+dpnTH6nmYKRJgQ1vNivmOwWyOs080fOX90d
         8AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709748369; x=1710353169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCnpVeyFfXdTbIhuKBuIIoc4SALrNUWp/6mK4dSKgS4=;
        b=xSBgK26p3IJrQppeV4kiPqXgUass036Y466a2MVmI6mWxBaXz3dpk1yeJw/w4c6n/C
         dR/OjITeY2EosVBI8ybTtkX+ItZjwCpgtW7wOJEoGJuzxFdxArCvSjg51umdvjA2tIri
         e4+EU86/XEOeszQs4dlym3ErXI7Br1X7+LVXphd+zeM3qZEtFG+3TqSGLefZOptkHl+S
         9/eUilQVbHb1fQmoS2BiCNpuCrlQA5KSKEFVsA2SpphUYbIovkw/JyE2a3A2SNtezah3
         Lmb/wDPC56J0WBimKGjOpc3YStcYq8an7+czgx9+/rf9to+9S/3kP9PwnZImkkS8N6f9
         de/A==
X-Gm-Message-State: AOJu0YwgYgSwD0UB3EpJyn3ngFcT82P+d2jyzUy07Lo0FnW8uNX549Dv
	5oI3FMQPhrCJHRNotDC7rDxyNhzbA/vo0OCzoShzOAwfHDwDy9vLq1lJVH7IBcYbvETQS3mAz8n
	i8pJAmUia4LJo2KvusoTWmz2pKhxQo2XHYtM=
X-Google-Smtp-Source: AGHT+IFsYS1REiupAenMfHwmVW9z7DBMbu0UdKMDMQtaE3Ot9QhciWomSnzudXJZ3d1/rlgML83QTXKCS84f4LZgI6U=
X-Received: by 2002:a05:6a20:d809:b0:1a1:4840:7614 with SMTP id
 iv9-20020a056a20d80900b001a148407614mr7291711pzb.35.1709748368987; Wed, 06
 Mar 2024 10:06:08 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com> <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com> <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com> <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com> <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
In-Reply-To: <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 6 Mar 2024 19:05:57 +0100
Message-ID: <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="000000000000305e24061301d0d6"

--000000000000305e24061301d0d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 6 mars 2024 =C3=A0 18:33, Mario Limonciello <mario.limonciello@amd.=
com>
a =C3=A9crit :

> On 3/6/2024 11:28, S=C3=A9bastien Chaumat wrote:
> >
> >
> >
> >
> >     Reasoning backward  (using a  kernel without the pinctrl_amd driver
> >     to ensure xen only is at stake) :
> >       checking the diff in IOAPIC  between bare metal and xen  (IRQ7 is
> >     on pin07 on APIC )
> >
> >     using kernel argument : apic=3Ddebug
> >
> >     bare metal :
> >     [    0.715330] fedora kernel: ... APIC VERSION: 81050010
> >     ...
> >     [    0.715433] fedora kernel:  pin07, disabled, edge , high, V(00),
> >     IRR(0), S(0), physical, D(0000), M(0)
> >
> >     xen :
> >     [    2.249582] fedora kernel: ... APIC VERSION: 00000014
> >     ...
> >     [    2.249730] fedora kernel:  pin07, disabled, level, low , V(60),
> >     IRR(0), S(0), physical, D(0000), M(0)
> >
> >     So the APIC table is not the same.
> >
> >     As strange as it looks the  (IOAPIC 0) pin07 is correctly described
> >     by the APIC in xen but yet differently than in baremetal.
> >     But the APIC message comes long after the
> >     [    1.833145] fedora kernel: xen: registering gsi 7 triggering 0
> >     polarity 1
> >
> >     so I wonder if the APIC pin07 info had any influence.
> >
> > Finally found the fix : adding ioapic_ack=3Dnew to xen boot parameters.
> > Not only the trackpad is now working but also the ACPI Embedded
> > Controller which is completely disabled.
> >
> > S=C3=A9bastien
> >
> That's great news!  I'm personally totally unfamiliar with
> ioapic_ack=3Dnew, so I did a quick search and found out it's a Xen
> parameter (I came across
> https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html).
>
> This mentions that "new" should be the default, so why isn't it the case?
>

 "This is the the default unless directed-EOI is supported"
xl dmesg without forcing the parameters shows :

(XEN) Enabled directed EOI with ioapic_ack_old on!


> Also; I'd be really interested to hear what happens with s2idle with Xen
> now (if it works).
>

suspend to RAM now works :)

--000000000000305e24061301d0d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A018:33, Mario Limonciel=
lo &lt;<a href=3D"mailto:mario.limonciello@amd.com">mario.limonciello@amd.c=
om</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 3=
/6/2024 11:28, S=C3=A9bastien Chaumat wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Reasoning backward=C2=A0 (using a=C2=A0 kernel with=
out the pinctrl_amd driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0to ensure xen only is at stake) :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0checking the diff in IOAPIC=C2=A0 between ba=
re metal and xen=C2=A0 (IRQ7 is<br>
&gt;=C2=A0 =C2=A0 =C2=A0on pin07 on APIC )<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0using kernel argument : apic=3Ddebug<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0bare metal :<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.715330] fedora kernel: ... APIC VE=
RSION: 81050010<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.715433] fedora kernel: =C2=A0pin07=
, disabled, edge , high, V(00),<br>
&gt;=C2=A0 =C2=A0 =C2=A0IRR(0), S(0), physical, D(0000), M(0)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0xen :<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A02.249582] fedora kernel: ... APIC VE=
RSION: 00000014<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A02.249730] fedora kernel: =C2=A0pin07=
, disabled, level, low , V(60),<br>
&gt;=C2=A0 =C2=A0 =C2=A0IRR(0), S(0), physical, D(0000), M(0)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So the APIC table is not the same.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As strange as it looks the=C2=A0 (IOAPIC 0) pin07 i=
s correctly described<br>
&gt;=C2=A0 =C2=A0 =C2=A0by the APIC in xen but yet differently than in bare=
metal.<br>
&gt;=C2=A0 =C2=A0 =C2=A0But the APIC message comes long after the<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A01.833145] fedora kernel: xen: regist=
ering gsi 7 triggering 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0polarity 1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0so I wonder if the APIC pin07 info had any influenc=
e.<br>
&gt; <br>
&gt; Finally found the fix : adding ioapic_ack=3Dnew to xen boot parameters=
.<br>
&gt; Not only the trackpad is now working but also the ACPI Embedded <br>
&gt; Controller which is completely disabled.<br>
&gt; <br>
&gt; S=C3=A9bastien<br>
&gt; <br>
That&#39;s great news!=C2=A0 I&#39;m personally totally unfamiliar with <br=
>
ioapic_ack=3Dnew, so I did a quick search and found out it&#39;s a Xen <br>
parameter (I came across<br>
<a href=3D"https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/4.5-=
testing/misc/xen-command-line.html</a>).<br>
<br>
This mentions that &quot;new&quot; should be the default, so why isn&#39;t =
it the case?<br></blockquote><div><br></div><div>=C2=A0&quot;This is the th=
e default unless directed-EOI is supported&quot;</div><div>xl dmesg without=
 forcing the parameters shows :</div><div><br></div><div>(XEN) Enabled dire=
cted EOI with ioapic_ack_old on!<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
Also; I&#39;d be really interested to hear what happens with s2idle with Xe=
n <br>
now (if it works).<br></blockquote><div><br></div><div>suspend to RAM now w=
orks :) <br></div></div></div>

--000000000000305e24061301d0d6--

