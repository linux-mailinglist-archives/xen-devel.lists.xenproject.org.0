Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51F87615C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 10:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690177.1075967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riWwz-0006jW-MC; Fri, 08 Mar 2024 09:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690177.1075967; Fri, 08 Mar 2024 09:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riWwz-0006h7-JC; Fri, 08 Mar 2024 09:55:37 +0000
Received: by outflank-mailman (input) for mailman id 690177;
 Fri, 08 Mar 2024 09:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ylqt=KO=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1riWwy-0006gi-91
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 09:55:36 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01a71165-dd32-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 10:55:35 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2997a92e23bso469347a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 01:55:34 -0800 (PST)
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
X-Inumbo-ID: 01a71165-dd32-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709891733; x=1710496533; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ifjvHbDAhZQc5abUXoVUI3Kazd4Dp+NXqN6HCkRFBg=;
        b=MZ48ZQxenxyxxmTvr557aAMj9Yq11XtbuCvew7grsXkwE7egRf6UpVvA7w7o3omTMu
         od3VWM7zY8HB+3udcWR3ajN3WDkCZ2ZWUy62BPX0D9TYb8lFj5rOXda+FiD1Ifxegmpe
         XFzCd9kCjh0BkKE8LHS+mZK3hhSVGPF+pvpHx1hu5d3grCwv6q2GAEzM7oPO/IoFc7mi
         Fz5b6Yoh54VaDNnqQdBsW7rpJNUvEptj4Ba/NLo+R3Lju+FMKaWxBn8mWFBmz59W+sUu
         hWUp77+113R18kaMgsaw4WRdTddCUQuur8WYM0gJ1FHY3UspJJoZURCyUZe7TrF6jOIP
         P1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891733; x=1710496533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ifjvHbDAhZQc5abUXoVUI3Kazd4Dp+NXqN6HCkRFBg=;
        b=DYjsr44mwv95J93E7u/csyAKhtSrxxaevhIvwlKRdFblXGzuKEiti0xhSbY7QDHpz7
         F2UpeTYn1SWOycxZCWvLYbl8R1KuJCIBHghN6cGD5ycyIR0d7vW7dhwTkzUGcwMxLyVr
         M7pM5lTKgDXBrae+kDIPm+ZshYdfl6NN/o4hvJcPe9dkjNxwgyYFVrU8XDdASPnsz+si
         /TiBAJm3UoK4us+uC8HINHqAW8XGrh/bjy9wF+W2khHUliUr3xw3GhvT7bOMkRUJ35bN
         lznlnlopqpHWXBGVNF977AzPn9g0J0PKgYRdlabaQRHRVBS6ObCX0/unKEr7fkz0V/AQ
         9FtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjBkrQe67TDX/7I7TEd0rTGx8Ei34DjvPXNp6v92J0BJ5g1Xlq05wmUsIl5kd5c6G2MJXIaBS2ZDANchzT009LvOyWEWyaC2t6ri8wevg=
X-Gm-Message-State: AOJu0YwuT8tk3FE6hLlvlu4cikpaPCZ+5M2IBap+ypSaJeKnwa/SfQKZ
	rrdPc+RObn4tJgOKrfWLzb6RVyLL1XsrXYQiqTcklxLRzewtIzZbhH0i+ctyZ3OZdWLJ6gudYPi
	AReNQRVtpgFA8gdiCvo+GO/4Q+ug=
X-Google-Smtp-Source: AGHT+IEQ9I1y9eOV9bma6ShJRxtMu+ulvK7X4CA25n/zSetrCcsS9aLRn6/7Tr/XSX8LCz1yoawVg0Vg367FRyjgjZk=
X-Received: by 2002:a17:90a:7782:b0:29b:bbef:9134 with SMTP id
 v2-20020a17090a778200b0029bbbef9134mr224905pjk.8.1709891733208; Fri, 08 Mar
 2024 01:55:33 -0800 (PST)
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
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com> <962cad57-21a8-4882-a23a-95add04cac9b@suse.com>
In-Reply-To: <962cad57-21a8-4882-a23a-95add04cac9b@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Fri, 8 Mar 2024 10:55:21 +0100
Message-ID: <CAKm-Umbs-dmWDvR4rmij30PD2CiqUEF3neB+g5j3Q9oU_ek2rA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000005ce88c06132331f4"

--0000000000005ce88c06132331f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 7 mars 2024, 09:39, Jan Beulich <jbeulich@suse.com> a =C3=A9crit :

> On 06.03.2024 18:28, S=C3=A9bastien Chaumat wrote:
> > Reasoning backward  (using a  kernel without the pinctrl_amd driver to
> >> ensure xen only is at stake) :
> >>  checking the diff in IOAPIC  between bare metal and xen  (IRQ7 is on
> >> pin07 on APIC )
> >>
> >> using kernel argument : apic=3Ddebug
> >>
> >> bare metal :
> >> [    0.715330] fedora kernel: ... APIC VERSION: 81050010
> >> ...
> >> [    0.715433] fedora kernel:  pin07, disabled, edge , high, V(00),
> >> IRR(0), S(0), physical, D(0000), M(0)
> >>
> >> xen :
> >> [    2.249582] fedora kernel: ... APIC VERSION: 00000014
> >> ...
> >> [    2.249730] fedora kernel:  pin07, disabled, level, low , V(60),
> >> IRR(0), S(0), physical, D(0000), M(0)
> >>
> >> So the APIC table is not the same.
> >>
> >> As strange as it looks the  (IOAPIC 0) pin07 is correctly described by
> the
> >> APIC in xen but yet differently than in baremetal.
> >> But the APIC message comes long after the
> >> [    1.833145] fedora kernel: xen: registering gsi 7 triggering 0
> polarity
> >> 1
> >>
> >> so I wonder if the APIC pin07 info had any influence.
> >>
> >> Finally found the fix : adding ioapic_ack=3Dnew to xen boot parameters=
.
> > Not only the trackpad is now working but also the ACPI Embedded
> Controller
> > which is completely disabled.
>
> Hmm, interesting. From someone else's laptop many years ago I had actuall=
y
> an indication in the opposite direction: That didn't work because of our
> defaulting to new (no directed EOI in sight yet back at that time). I
> wonder if overriding the ack method isn't actually just papering over the
> underlying actual issue here, whatever that is. IOW with the edge vs leve=
l
> mismatch addressed I'd hope the override could then be dropped again.
>

I suppose you refert to  :
https://xen-devel.narkive.com/1Lbaex65/irq-issues-with-directed-eoi-and-io-=
apic-ack-methods


 - I did override the IRQ configuration all allong my debugs (the handler
was correctly set to level, yet not all flags were identical between dom0
and bare metal). In the end, with the ioapic_ack=3Dnew, I could even leave
the wrong edge binding for IRQ7.

 - besides the touchpad, the ACPI EC was also non functional without
forcing ioapic_ack. And in bare metal the EC does a lot of work of during
early kernel setup.

 S=C3=A9bastien

--0000000000005ce88c06132331f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 7 mars 2024, 09:39, Jan Beulich &lt;<a href=3D=
"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On 06.03.2024 18:28, S=C3=A9bastien C=
haumat wrote:<br>
&gt; Reasoning backward=C2=A0 (using a=C2=A0 kernel without the pinctrl_amd=
 driver to<br>
&gt;&gt; ensure xen only is at stake) :<br>
&gt;&gt;=C2=A0 checking the diff in IOAPIC=C2=A0 between bare metal and xen=
=C2=A0 (IRQ7 is on<br>
&gt;&gt; pin07 on APIC )<br>
&gt;&gt;<br>
&gt;&gt; using kernel argument : apic=3Ddebug<br>
&gt;&gt;<br>
&gt;&gt; bare metal :<br>
&gt;&gt; [=C2=A0 =C2=A0 0.715330] fedora kernel: ... APIC VERSION: 81050010=
<br>
&gt;&gt; ...<br>
&gt;&gt; [=C2=A0 =C2=A0 0.715433] fedora kernel:=C2=A0 pin07, disabled, edg=
e , high, V(00),<br>
&gt;&gt; IRR(0), S(0), physical, D(0000), M(0)<br>
&gt;&gt;<br>
&gt;&gt; xen :<br>
&gt;&gt; [=C2=A0 =C2=A0 2.249582] fedora kernel: ... APIC VERSION: 00000014=
<br>
&gt;&gt; ...<br>
&gt;&gt; [=C2=A0 =C2=A0 2.249730] fedora kernel:=C2=A0 pin07, disabled, lev=
el, low , V(60),<br>
&gt;&gt; IRR(0), S(0), physical, D(0000), M(0)<br>
&gt;&gt;<br>
&gt;&gt; So the APIC table is not the same.<br>
&gt;&gt;<br>
&gt;&gt; As strange as it looks the=C2=A0 (IOAPIC 0) pin07 is correctly des=
cribed by the<br>
&gt;&gt; APIC in xen but yet differently than in baremetal.<br>
&gt;&gt; But the APIC message comes long after the<br>
&gt;&gt; [=C2=A0 =C2=A0 1.833145] fedora kernel: xen: registering gsi 7 tri=
ggering 0 polarity<br>
&gt;&gt; 1<br>
&gt;&gt;<br>
&gt;&gt; so I wonder if the APIC pin07 info had any influence.<br>
&gt;&gt;<br>
&gt;&gt; Finally found the fix : adding ioapic_ack=3Dnew to xen boot parame=
ters.<br>
&gt; Not only the trackpad is now working but also the ACPI Embedded Contro=
ller<br>
&gt; which is completely disabled.<br>
<br>
Hmm, interesting. From someone else&#39;s laptop many years ago I had actua=
lly<br>
an indication in the opposite direction: That didn&#39;t work because of ou=
r<br>
defaulting to new (no directed EOI in sight yet back at that time). I<br>
wonder if overriding the ack method isn&#39;t actually just papering over t=
he<br>
underlying actual issue here, whatever that is. IOW with the edge vs level<=
br>
mismatch addressed I&#39;d hope the override could then be dropped again.<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I =
suppose you refert to=C2=A0 :=C2=A0<a href=3D"https://xen-devel.narkive.com=
/1Lbaex65/irq-issues-with-directed-eoi-and-io-apic-ack-methods">https://xen=
-devel.narkive.com/1Lbaex65/irq-issues-with-directed-eoi-and-io-apic-ack-me=
thods</a>=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0- =
I did override the IRQ configuration all allong my debugs (the handler was =
correctly set to level, yet not all flags were identical between dom0 and b=
are metal). In the end, with the ioapic_ack=3Dnew, I could even leave the w=
rong edge binding for IRQ7.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">=C2=A0- besides the touchpad, the ACPI EC was also non functional witho=
ut forcing ioapic_ack. And in bare metal the EC does a lot of work of durin=
g early kernel setup.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
=C2=A0S=C3=A9bastien</div></div>

--0000000000005ce88c06132331f4--

