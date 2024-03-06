Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00787416E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 21:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689499.1074535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhxyc-000451-Ff; Wed, 06 Mar 2024 20:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689499.1074535; Wed, 06 Mar 2024 20:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhxyc-00041v-CS; Wed, 06 Mar 2024 20:34:58 +0000
Received: by outflank-mailman (input) for mailman id 689499;
 Wed, 06 Mar 2024 20:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjQC=KM=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rhxyb-00041p-43
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 20:34:57 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc38a249-dbf8-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 21:34:53 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-29b54503280so36346a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 12:34:53 -0800 (PST)
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
X-Inumbo-ID: fc38a249-dbf8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709757292; x=1710362092; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2iCcJDiXsrXLE5cm6A+U9C8Mjw8UURfFAF9EyamTU9c=;
        b=Pa1FN3QbMNh1HZFINv40+lChTSrNaJXwk3poaKZYI93LELGiowDx8utHqhAX9YFGOu
         HRcT4KKnsrt6zwnZuy/3J2urpBgj5+b+hTgFWaBzp36JBdkttm/DMtWkf1ZIX7r81cT0
         P3sSFCa2mEEiM/EeU5q6M6lKdPAc3G3ZuvphjxvUeJXY8AinLcA/VMuacciWt+pDkRqi
         J+v94325TyDeQr1RrnmETLeVywJ1RZ4UEz7fLMqB1bQ+CAQ/5W7A406sIGVlO+jOMofj
         X3UqyEqMoimZh4Lit8YskYWW1BwXTLNHxmQeiaEvc59vJfscOFrg8+rURNuvELyeBIo6
         xkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709757292; x=1710362092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iCcJDiXsrXLE5cm6A+U9C8Mjw8UURfFAF9EyamTU9c=;
        b=D0lCvTPSIcrpguAGPp/21zND4PvJVEOvwcQrcoFJG5HUIRim+hFmrzSgdWueZRsYLG
         P0qJVdeOk6vwFKvwQVZBXEQLAJk0C5hYat4orNnA2aSBK+DBVRipIM2sW6eeK6PR7U7G
         e05bwmcG08dYyWkHpP1j4YsynrosrCSH/Kmrgn6weHJQHzt7UOSYrmhZt9SnuxJIFfTH
         XPZMIQwhLWidjoiH9A5cg+rJ37OiH5XSCLrXHtdIn6yg0nedOzqKZiP0sJU3Qk4f/w6F
         Vo+GqnzdvHoDW1eI4Dn2fOeQaYDewVjtfaMGNJeKj6nI/OOkBSbqIUqdXJaWJsiFDwwx
         b+cg==
X-Gm-Message-State: AOJu0YwdndUFwgCfzrDGpzLCnLEClj1J8Bg9cLuF88Vwsxsow4uo69kg
	lx8E0P6OnTZq15jDMgEZ1c+ZxB7VNltFSGMW/qb4eu799Mhqq+ZhizF8T1JMCNgpncf434A/gBD
	4gLJMQRn/i8dJZi/bOlG6ad5yRrM=
X-Google-Smtp-Source: AGHT+IHjwLPsBA0scIZW1/LBL/Cif2agDptM5ki6+rfUdN5ydTW1OohSiPS4JBDRBhM+B5vAiHeqCg5Dkk0MFcHorHg=
X-Received: by 2002:a17:90a:1c02:b0:29b:277d:2590 with SMTP id
 s2-20020a17090a1c0200b0029b277d2590mr16639198pjs.34.1709757291648; Wed, 06
 Mar 2024 12:34:51 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com> <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com> <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
 <a3472888-7bfb-4889-8ccb-58384afff324@amd.com> <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
 <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com> <CAKm-UmZm1d8Ehusoh5HNOST+0Dek7+vLQSKbVduz40BdHueiDA@mail.gmail.com>
 <7c2f9983-a0b5-41f7-81cb-f196787f3dfb@amd.com>
In-Reply-To: <7c2f9983-a0b5-41f7-81cb-f196787f3dfb@amd.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 6 Mar 2024 21:34:39 +0100
Message-ID: <CAKm-UmaHA5Xgmneqv9zgEUN1eejqB_1aZ4Kd5MxWttoyVLThwA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="000000000000055d1e061303e448"

--000000000000055d1e061303e448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 6 mars 2024 =C3=A0 19:51, Mario Limonciello <mario.limonciello@amd.=
com>
a =C3=A9crit :

> On 3/6/2024 12:49, S=C3=A9bastien Chaumat wrote:
> >
> >
> > Le mer. 6 mars 2024 =C3=A0 19:08, Mario Limonciello
> > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a =C3=A9=
crit :
> >
> >     On 3/6/2024 12:05, S=C3=A9bastien Chaumat wrote:
> >      >
> >      >
> >      > Le mer. 6 mars 2024 =C3=A0 18:33, Mario Limonciello
> >      > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>
> >     <mailto:mario.limonciello@amd.com
> >     <mailto:mario.limonciello@amd.com>>> a =C3=A9crit :
> >      >
> >      >     On 3/6/2024 11:28, S=C3=A9bastien Chaumat wrote:
> >      >      >
> >      >      >
> >      >      >
> >      >      >
> >      >      >     Reasoning backward  (using a  kernel without the
> >     pinctrl_amd
> >      >     driver
> >      >      >     to ensure xen only is at stake) :
> >      >      >       checking the diff in IOAPIC  between bare metal and
> xen
> >      >     (IRQ7 is
> >      >      >     on pin07 on APIC )
> >      >      >
> >      >      >     using kernel argument : apic=3Ddebug
> >      >      >
> >      >      >     bare metal :
> >      >      >     [    0.715330] fedora kernel: ... APIC VERSION:
> 81050010
> >      >      >     ...
> >      >      >     [    0.715433] fedora kernel:  pin07, disabled, edge =
,
> >     high,
> >      >     V(00),
> >      >      >     IRR(0), S(0), physical, D(0000), M(0)
> >      >      >
> >      >      >     xen :
> >      >      >     [    2.249582] fedora kernel: ... APIC VERSION:
> 00000014
> >      >      >     ...
> >      >      >     [    2.249730] fedora kernel:  pin07, disabled, level=
,
> >     low ,
> >      >     V(60),
> >      >      >     IRR(0), S(0), physical, D(0000), M(0)
> >      >      >
> >      >      >     So the APIC table is not the same.
> >      >      >
> >      >      >     As strange as it looks the  (IOAPIC 0) pin07 is
> correctly
> >      >     described
> >      >      >     by the APIC in xen but yet differently than in
> baremetal.
> >      >      >     But the APIC message comes long after the
> >      >      >     [    1.833145] fedora kernel: xen: registering gsi 7
> >     triggering 0
> >      >      >     polarity 1
> >      >      >
> >      >      >     so I wonder if the APIC pin07 info had any influence.
> >      >      >
> >      >      > Finally found the fix : adding ioapic_ack=3Dnew to xen bo=
ot
> >     parameters.
> >      >      > Not only the trackpad is now working but also the ACPI
> >     Embedded
> >      >      > Controller which is completely disabled.
> >      >      >
> >      >      > S=C3=A9bastien
> >      >      >
> >      >     That's great news!  I'm personally totally unfamiliar with
> >      >     ioapic_ack=3Dnew, so I did a quick search and found out it's=
 a
> Xen
> >      >     parameter (I came across
> >      >
> >     https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html
> >     <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.htm=
l
> >
> >      >
> >       <
> https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html <
> https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html>>).
> >      >
> >      >     This mentions that "new" should be the default, so why isn't
> >     it the
> >      >     case?
> >      >
> >      >
> >      >   "This is the the default unless directed-EOI is supported"
> >      > xl dmesg without forcing the parameters shows :
> >      >
> >      > (XEN) Enabled directed EOI with ioapic_ack_old on!
> >
> >     Got it; it sounds to me like a logic mismatch in Xen then.
> >
> >      >
> >      >     Also; I'd be really interested to hear what happens with
> >     s2idle with
> >      >     Xen
> >      >     now (if it works).
> >      >
> >      >
> >      > suspend to RAM now works :)
> >
> >     Do you see /sys/power/suspend_stats/last_hw_sleep increasing with
> your
> >     suspend cycle?
> >
> >
> > No,  it does not increase (0).
> >
>
> OK, then in that case I suggest you run
> https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.p=
y
> in the hypervisor to find out what's wrong.
>
>
It fails with xen (not bare metal) during the prerequisite tests :

=E2=9C=85 GPIO driver `pinctrl_amd` available
Traceback (most recent call last):
  File "/home/sch/Downloads/amd_s2idle.py", line 2447, in <module>
    test =3D app.prerequisites()
           ^^^^^^^^^^^^^^^^^^^
  File "/home/sch/Downloads/amd_s2idle.py", line 1938, in prerequisites
    if not check():
           ^^^^^^^
  File "/home/sch/Downloads/amd_s2idle.py", line 826, in check_msr
    val =3D read_msr(reg, 0)
          ^^^^^^^^^^^^^^^^
  File "/home/sch/Downloads/amd_s2idle.py", line 813, in read_msr
    val =3D struct.unpack("Q", os.read(f, 8))[0]
                             ^^^^^^^^^^^^^
OSError: [Errno 5] Input/output error

Last line in the log is :
2024-03-06 21:29:33,146 DEBUG: Lockdown: [none] integrity confidentiality

--000000000000055d1e061303e448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A0=
19:51, Mario Limonciello &lt;<a href=3D"mailto:mario.limonciello@amd.com">m=
ario.limonciello@amd.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 3/6/2024 12:49, S=C3=A9bastien Chau=
mat wrote:<br>
&gt; <br>
&gt; <br>
&gt; Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A019:08, Mario Limonciello <br>
&gt; &lt;<a href=3D"mailto:mario.limonciello@amd.com" target=3D"_blank">mar=
io.limonciello@amd.com</a> &lt;mailto:<a href=3D"mailto:mario.limonciello@a=
md.com" target=3D"_blank">mario.limonciello@amd.com</a>&gt;&gt; a =C3=A9cri=
t=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 3/6/2024 12:05, S=C3=A9bastien Chaumat wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Le=C2=A0mer. 6 mars 2024 =C3=A0=C2=A018:33, M=
ario Limonciello<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;<a href=3D"mailto:mario.limonciello@amd.c=
om" target=3D"_blank">mario.limonciello@amd.com</a> &lt;mailto:<a href=3D"m=
ailto:mario.limonciello@amd.com" target=3D"_blank">mario.limonciello@amd.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mario.limonciello@amd.=
com" target=3D"_blank">mario.limonciello@amd.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mario.limonciello@amd.=
com" target=3D"_blank">mario.limonciello@amd.com</a>&gt;&gt;&gt; a =C3=A9cr=
it=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 3/6/2024 11:28, S=C3=A9=
bastien Chaumat wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0R=
easoning backward=C2=A0 (using a=C2=A0 kernel without the<br>
&gt;=C2=A0 =C2=A0 =C2=A0pinctrl_amd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0t=
o ensure xen only is at stake) :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0checking the diff in IOAPIC=C2=A0 between bare metal and xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0(IRQ7 is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0o=
n pin07 on APIC )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0u=
sing kernel argument : apic=3Ddebug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0b=
are metal :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[=
 =C2=A0 =C2=A00.715330] fedora kernel: ... APIC VERSION: 81050010<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0.=
..<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[=
 =C2=A0 =C2=A00.715433] fedora kernel: =C2=A0pin07, disabled, edge ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0high,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0V(00),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I=
RR(0), S(0), physical, D(0000), M(0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0x=
en :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[=
 =C2=A0 =C2=A02.249582] fedora kernel: ... APIC VERSION: 00000014<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0.=
..<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[=
 =C2=A0 =C2=A02.249730] fedora kernel: =C2=A0pin07, disabled, level,<br>
&gt;=C2=A0 =C2=A0 =C2=A0low ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0V(60),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I=
RR(0), S(0), physical, D(0000), M(0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0S=
o the APIC table is not the same.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0A=
s strange as it looks the=C2=A0 (IOAPIC 0) pin07 is correctly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0described<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0b=
y the APIC in xen but yet differently than in baremetal.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0B=
ut the APIC message comes long after the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[=
 =C2=A0 =C2=A01.833145] fedora kernel: xen: registering gsi 7<br>
&gt;=C2=A0 =C2=A0 =C2=A0triggering 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0p=
olarity 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0s=
o I wonder if the APIC pin07 info had any influence.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Finally found the fi=
x : adding ioapic_ack=3Dnew to xen boot<br>
&gt;=C2=A0 =C2=A0 =C2=A0parameters.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Not only the trackpa=
d is now working but also the ACPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0Embedded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Controller which is =
completely disabled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; S=C3=A9bastien<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0That&#39;s great news!=C2=
=A0 I&#39;m personally totally unfamiliar with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0ioapic_ack=3Dnew, so I did=
 a quick search and found out it&#39;s a Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0parameter (I came across<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://xenbits.xen.org/docs/4.5-testing=
/misc/xen-command-line.html" rel=3D"noreferrer" target=3D"_blank">https://x=
enbits.xen.org/docs/4.5-testing/misc/xen-command-line.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org/docs/4.5-tes=
ting/misc/xen-command-line.html" rel=3D"noreferrer" target=3D"_blank">https=
://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org/docs/=
4.5-testing/misc/xen-command-line.html" rel=3D"noreferrer" target=3D"_blank=
">https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html</a> &=
lt;<a href=3D"https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-lin=
e.html" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/4=
.5-testing/misc/xen-command-line.html</a>&gt;&gt;).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0This mentions that &quot;n=
ew&quot; should be the default, so why isn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0it the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0case?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0&quot;This is the the default unl=
ess directed-EOI is supported&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; xl dmesg without forcing the parameters shows=
 :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (XEN) Enabled directed EOI with ioapic_ack_ol=
d on!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Got it; it sounds to me like a logic mismatch in Xe=
n then.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Also; I&#39;d be really in=
terested to hear what happens with<br>
&gt;=C2=A0 =C2=A0 =C2=A0s2idle with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0now (if it works).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; suspend to RAM now works :)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Do you see /sys/power/suspend_stats/last_hw_sleep i=
ncreasing with your<br>
&gt;=C2=A0 =C2=A0 =C2=A0suspend cycle?<br>
&gt; <br>
&gt; <br>
&gt; No,=C2=A0 it does not increase (0).<br>
&gt; <br>
<br>
OK, then in that case I suggest you run <br>
<a href=3D"https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd=
_s2idle.py" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop=
.org/drm/amd/-/blob/master/scripts/amd_s2idle.py</a> <br>
in the hypervisor to find out what&#39;s wrong.<br>
<br></blockquote><div><br></div><div>It fails with xen (not bare metal) dur=
ing the prerequisite tests :</div><div><br></div><div>=E2=9C=85 GPIO driver=
 `pinctrl_amd` available<br>Traceback (most recent call last):<br>=C2=A0 Fi=
le &quot;/home/sch/Downloads/amd_s2idle.py&quot;, line 2447, in &lt;module&=
gt;<br>=C2=A0 =C2=A0 test =3D app.prerequisites()<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^<br>=C2=A0 File &quot;/home/sch/Down=
loads/amd_s2idle.py&quot;, line 1938, in prerequisites<br>=C2=A0 =C2=A0 if =
not check():<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^<br>=C2=A0 =
File &quot;/home/sch/Downloads/amd_s2idle.py&quot;, line 826, in check_msr<=
br>=C2=A0 =C2=A0 val =3D read_msr(reg, 0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^^^^^^^^^^^^^^^^<br>=C2=A0 File &quot;/home/sch/Downloads/amd_s2idle=
.py&quot;, line 813, in read_msr<br>=C2=A0 =C2=A0 val =3D struct.unpack(&qu=
ot;Q&quot;, os.read(f, 8))[0]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^=
<br>OSError: [Errno 5] Input/output error</div><div><br></div><div>Last lin=
e in the log is :</div><div>2024-03-06 21:29:33,146 DEBUG:	Lockdown: [none]=
 integrity confidentiality</div><div><br></div></div></div>

--000000000000055d1e061303e448--

