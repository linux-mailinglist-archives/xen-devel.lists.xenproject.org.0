Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AB873FF7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689466.1074465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwKM-0005tX-Bg; Wed, 06 Mar 2024 18:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689466.1074465; Wed, 06 Mar 2024 18:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwKM-0005rC-7b; Wed, 06 Mar 2024 18:49:18 +0000
Received: by outflank-mailman (input) for mailman id 689466;
 Wed, 06 Mar 2024 18:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjQC=KM=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rhwKL-0005r6-7r
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:49:17 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ab816e7-dbea-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 19:49:16 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-299d3b09342so966794a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 10:49:16 -0800 (PST)
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
X-Inumbo-ID: 3ab816e7-dbea-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709750954; x=1710355754; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QoO1LrsJxu96wCkUsoQYGKYUdq+e6Vh+9T/S+oZ4Tsc=;
        b=MgnRXC92OLARkwE/nOLbF8XueR8TFX2k1MHsIzF8ZdAZjYcICdJ5tepv/9JyuUY5JE
         YULKjFSI2C+L1kntykudR4DVmOJJ4shcsg4JQjzTtWJGtQHblUTNaTZlM4FR3uAKND/B
         utWf0kH5eqjDegMfZZJLLIHr9772C1C8hxVUPpZbMggR4ZRzIOzRva/QGFnBj/OTVs9d
         jlDWZ2Xs65xx7rAm26zb1Oh9/d3LQ0w0hMpj9QojMKlF/JwZ+YODWlPDAZAh2N+iA1iF
         QMCCLxy4i+qkZOm1v6JtM/2nG2aUblsvY8AvAlloh6Vi9B0CGM83vvOuJNmRu5tzMgvc
         zFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709750954; x=1710355754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoO1LrsJxu96wCkUsoQYGKYUdq+e6Vh+9T/S+oZ4Tsc=;
        b=Q8TEVKIIfJTS6Jj10ZfR+ME7QuWQHMDrX29VO8A+OwzbCLhipVisgY/FIReTRCymb8
         8ph+xVf2N33qToltEBVAPAMZsVkLWdQn2RatpqMZtg4RzbzYB7sfKKwYEStfAXm2Su8N
         WiFu874WJ4XlOySdjnhF/ASoYKMbPOgdYTq3L1VZeXjO5WVWeVe2F/+myXg7l5I7UYg4
         JdxHC9PE83mhN1+/SYckhGbP1ajgJBzju8Rk1eESxFNLr48ekT4iBLIU2VlIzZU+JmGu
         yUPNnVGu45ORujKMs4xzmvdJH4+qx6e3PYwEpkyCZiJlcE2D9T1DeIydsO1RL4Qi2Uwj
         yByw==
X-Gm-Message-State: AOJu0Yx9++EszI8wVYsztkwFmWhC3fjodgLup3N0X73TkYIxSpaDIc/5
	qy3xMHnJvKggE1COkI0Qy359lPy2FYsRfrafOg2OmAmscsAU/8gQbhlhUIDiWd2rKx6EdrSgCGg
	k9sYpIFI33ceggES5+ZArx/qnTnA=
X-Google-Smtp-Source: AGHT+IHaJJW52dofk64COniQUe+c5hg7HGK2tCGF3WOx8xTKWraUIKgNOPsr+82GGMvG4uOy1x2xfFV2UhZABlQkpFk=
X-Received: by 2002:a17:90a:b382:b0:29a:da46:8d27 with SMTP id
 e2-20020a17090ab38200b0029ada468d27mr15324341pjr.0.1709750954203; Wed, 06 Mar
 2024 10:49:14 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com> <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com> <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
 <a3472888-7bfb-4889-8ccb-58384afff324@amd.com> <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
 <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com>
In-Reply-To: <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 6 Mar 2024 19:49:02 +0100
Message-ID: <CAKm-UmZm1d8Ehusoh5HNOST+0Dek7+vLQSKbVduz40BdHueiDA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="00000000000047a5f50613026ac0"

--00000000000047a5f50613026ac0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 6 mars 2024 =C3=A0 19:08, Mario Limonciello <mario.limonciello@amd.=
com>
a =C3=A9crit :

> On 3/6/2024 12:05, S=C3=A9bastien Chaumat wrote:
> >
> >
> > Le mer. 6 mars 2024 =C3=A0 18:33, Mario Limonciello
> > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a =C3=A9=
crit :
> >
> >     On 3/6/2024 11:28, S=C3=A9bastien Chaumat wrote:
> >      >
> >      >
> >      >
> >      >
> >      >     Reasoning backward  (using a  kernel without the pinctrl_amd
> >     driver
> >      >     to ensure xen only is at stake) :
> >      >       checking the diff in IOAPIC  between bare metal and xen
> >     (IRQ7 is
> >      >     on pin07 on APIC )
> >      >
> >      >     using kernel argument : apic=3Ddebug
> >      >
> >      >     bare metal :
> >      >     [    0.715330] fedora kernel: ... APIC VERSION: 81050010
> >      >     ...
> >      >     [    0.715433] fedora kernel:  pin07, disabled, edge , high,
> >     V(00),
> >      >     IRR(0), S(0), physical, D(0000), M(0)
> >      >
> >      >     xen :
> >      >     [    2.249582] fedora kernel: ... APIC VERSION: 00000014
> >      >     ...
> >      >     [    2.249730] fedora kernel:  pin07, disabled, level, low ,
> >     V(60),
> >      >     IRR(0), S(0), physical, D(0000), M(0)
> >      >
> >      >     So the APIC table is not the same.
> >      >
> >      >     As strange as it looks the  (IOAPIC 0) pin07 is correctly
> >     described
> >      >     by the APIC in xen but yet differently than in baremetal.
> >      >     But the APIC message comes long after the
> >      >     [    1.833145] fedora kernel: xen: registering gsi 7
> triggering 0
> >      >     polarity 1
> >      >
> >      >     so I wonder if the APIC pin07 info had any influence.
> >      >
> >      > Finally found the fix : adding ioapic_ack=3Dnew to xen boot
> parameters.
> >      > Not only the trackpad is now working but also the ACPI Embedded
> >      > Controller which is completely disabled.
> >      >
> >      > S=C3=A9bastien
> >      >
> >     That's great news!  I'm personally totally unfamiliar with
> >     ioapic_ack=3Dnew, so I did a quick search and found out it's a Xen
> >     parameter (I came across
> >     https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html
> >     <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.htm=
l
> >).
> >
> >     This mentions that "new" should be the default, so why isn't it the
> >     case?
> >
> >
> >   "This is the the default unless directed-EOI is supported"
> > xl dmesg without forcing the parameters shows :
> >
> > (XEN) Enabled directed EOI with ioapic_ack_old on!
>
> Got it; it sounds to me like a logic mismatch in Xen then.
>
> >
> >     Also; I'd be really interested to hear what happens with s2idle wit=
h
> >     Xen
> >     now (if it works).
> >
> >
> > suspend to RAM now works :)
>
> Do you see /sys/power/suspend_stats/last_hw_sleep increasing with your
> suspend cycle?
>

No,  it does not increase (0).

--00000000000047a5f50613026ac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A0=
19:08, Mario Limonciello &lt;<a href=3D"mailto:mario.limonciello@amd.com">m=
ario.limonciello@amd.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 3/6/2024 12:05, S=C3=A9bastien Chau=
mat wrote:<br>
&gt; <br>
&gt; <br>
&gt; Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A018:33, Mario Limonciello <br>
&gt; &lt;<a href=3D"mailto:mario.limonciello@amd.com" target=3D"_blank">mar=
io.limonciello@amd.com</a> &lt;mailto:<a href=3D"mailto:mario.limonciello@a=
md.com" target=3D"_blank">mario.limonciello@amd.com</a>&gt;&gt; a =C3=A9cri=
t=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 3/6/2024 11:28, S=C3=A9bastien Chaumat wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Reasoning backward=C2=A0 (=
using a=C2=A0 kernel without the pinctrl_amd<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0to ensure xen only is at s=
take) :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0checking the diff i=
n IOAPIC=C2=A0 between bare metal and xen <br>
&gt;=C2=A0 =C2=A0 =C2=A0(IRQ7 is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on pin07 on APIC )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0using kernel argument : ap=
ic=3Ddebug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0bare metal :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.715330] f=
edora kernel: ... APIC VERSION: 81050010<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.715433] f=
edora kernel: =C2=A0pin07, disabled, edge , high,<br>
&gt;=C2=A0 =C2=A0 =C2=A0V(00),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0IRR(0), S(0), physical, D(=
0000), M(0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0xen :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A02.249582] f=
edora kernel: ... APIC VERSION: 00000014<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A02.249730] f=
edora kernel: =C2=A0pin07, disabled, level, low ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0V(60),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0IRR(0), S(0), physical, D(=
0000), M(0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0So the APIC table is not t=
he same.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0As strange as it looks the=
=C2=A0 (IOAPIC 0) pin07 is correctly<br>
&gt;=C2=A0 =C2=A0 =C2=A0described<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0by the APIC in xen but yet=
 differently than in baremetal.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0But the APIC message comes=
 long after the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A01.833145] f=
edora kernel: xen: registering gsi 7 triggering 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0polarity 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0so I wonder if the APIC pi=
n07 info had any influence.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Finally found the fix : adding ioapic_ack=3Dn=
ew to xen boot parameters.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Not only the trackpad is now working but also=
 the ACPI Embedded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Controller which is completely disabled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; S=C3=A9bastien<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0That&#39;s great news!=C2=A0 I&#39;m personally tot=
ally unfamiliar with<br>
&gt;=C2=A0 =C2=A0 =C2=A0ioapic_ack=3Dnew, so I did a quick search and found=
 out it&#39;s a Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0parameter (I came across<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://xenbits.xen.org/docs/4.5-testing=
/misc/xen-command-line.html" rel=3D"noreferrer" target=3D"_blank">https://x=
enbits.xen.org/docs/4.5-testing/misc/xen-command-line.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org/docs/4.5-tes=
ting/misc/xen-command-line.html" rel=3D"noreferrer" target=3D"_blank">https=
://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html</a>&gt;).<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This mentions that &quot;new&quot; should be the de=
fault, so why isn&#39;t it the<br>
&gt;=C2=A0 =C2=A0 =C2=A0case?<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0&quot;This is the the default unless directed-EOI is suppo=
rted&quot;<br>
&gt; xl dmesg without forcing the parameters shows :<br>
&gt; <br>
&gt; (XEN) Enabled directed EOI with ioapic_ack_old on!<br>
<br>
Got it; it sounds to me like a logic mismatch in Xen then.<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also; I&#39;d be really interested to hear what hap=
pens with s2idle with<br>
&gt;=C2=A0 =C2=A0 =C2=A0Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0now (if it works).<br>
&gt; <br>
&gt; <br>
&gt; suspend to RAM now works :)<br>
<br>
Do you see /sys/power/suspend_stats/last_hw_sleep increasing with your <br>
suspend cycle?<br></blockquote><div><br></div><div>No,=C2=A0 it does not in=
crease (0).<br></div><div>=C2=A0<br></div></div></div>

--00000000000047a5f50613026ac0--

