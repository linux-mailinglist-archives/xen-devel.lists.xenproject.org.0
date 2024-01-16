Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E582F1E6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 16:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667841.1039509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPlk7-0004Rr-Au; Tue, 16 Jan 2024 15:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667841.1039509; Tue, 16 Jan 2024 15:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPlk7-0004PP-7D; Tue, 16 Jan 2024 15:52:47 +0000
Received: by outflank-mailman (input) for mailman id 667841;
 Tue, 16 Jan 2024 15:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62Nt=I2=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rPlk6-0004PJ-MY
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 15:52:46 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 499f4039-b487-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 16:52:45 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d5f252411aso3221575ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 07:52:45 -0800 (PST)
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
X-Inumbo-ID: 499f4039-b487-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705420364; x=1706025164; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WqVKUl/Uau5HI4EsqRv0/GCn4gvPIpX9BgBngDg7SJg=;
        b=CvpihxkqiSCOwqDaLlkQIy7kp8oUXjDprT2rk4LeXj+/gvkJwBGoTe1fbce9rIGJcL
         sUDvyJTKkU35sljJXMEPYa3zlzHg2W3xdFSindnlaUJmndK9pnr/u99eDJ1P4IOofhGA
         o+NpZB7+mIfIZ1+FmjN3942nrJfU1O7x6nWD2z7C5QcchpScgKDDKummNLJApg2jRJq6
         tT/hbm2uhYzXmOOAp23ThwJg+EXEkTdMS/zOItIOGHx0y1jWuN+TC31EsBLhp3wbGQIa
         KcYCci8DCj9HDTLYWw0UU5AvmAKlJabRENi5fOweSyhhQk2mz3LNVmNbRbjXFHTersXE
         xvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705420364; x=1706025164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqVKUl/Uau5HI4EsqRv0/GCn4gvPIpX9BgBngDg7SJg=;
        b=LOsy7ZnuG823gNVbxu1Z4C+QdLUmD4Ae5JojwIWQpnns+9VcaDouJ7JOJEBcfvnvre
         CyKUD0vcveRHbBx7jjFUNE+kfEAErEVVntivkM4X/uyu7B6OFRepeIqD4uRVz/K3eqNl
         QznFnbT9O4VwO/QS22Y2xK80UzbI87YS3Yngh/7HdNEYpl/TeZo8SWXcBpxdv7JaNLco
         +uZm6tiCZEF3lnt0y6u5UQgS4LcbQ1uTRocfxvEGZSXorteEZp6JzsJv0Rrs/rSoPwec
         Yx9vfa7QsnI10q7u/EOiVYZPiAGAge2L3VsBMv80OL3NTqGF+To1vZfL7FfRexozJCYt
         jEig==
X-Gm-Message-State: AOJu0Yw81GQtrLVtHD1wIQRaq5KkI6217JIpVFjY/QRnCdMNc7q3tjPI
	b3Jd33vGT8KtjpKchIG7m0smv4Xgj3PdNdfXITU=
X-Google-Smtp-Source: AGHT+IESo5iPXC1u/d6j1gcP/8vGrvwtsAt1PQvWBrFaHLg3YhnVhwZ7Yh7Of5OnPQYN5pMETTdylLGjNxB0v+LOjFw=
X-Received: by 2002:a17:902:aa97:b0:1d5:74df:be61 with SMTP id
 d23-20020a170902aa9700b001d574dfbe61mr3452641plr.78.1705420363679; Tue, 16
 Jan 2024 07:52:43 -0800 (PST)
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
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com> <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com> <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
In-Reply-To: <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 16 Jan 2024 16:52:31 +0100
Message-ID: <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: multipart/alternative; boundary="000000000000f84bc7060f121eeb"

--000000000000f84bc7060f121eeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 2 janv. 2024 =C3=A0 21:23, S=C3=A9bastien Chaumat <euidzero@gmail.c=
om> a
=C3=A9crit :

>
>  output of gpioinfo
>>
>> kernel alone :
>>
>>         line   5: unnamed         input active-low consumer=3Dinterrupt
>>         line  84: unnamed         input active-low consumer=3Dinterrupt
>>
>> xen:
>>
>>         line   5: unnamed         input active-low
>>         line  84: unnamed         input active-low
>>
>> xen with skipping IRQ7 double init :
>>
>>         line   5: unnamed         input active-low consumer=3Dinterrupt
>>         line  84: unnamed         input active-low
>>
>>
>> So definitely progressing.
>>
>
> Checking /sys/kernel/irq/7
>
> kernel alone :
>  actions: pinctrl_amd
>  chip_name: IR-IO-APIC
>  hwirq: 7
>  name: fasteoi
>  per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0
>  type: level
>  wakeup: enabled
>
> xen skipping IRQ7 double init :
>
> actions: pinctrl_amd
>  chip_name: xen-pirq
>  hwirq:
>  name: ioapic-level
>  per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
>  type: edge
>  wakeup: disabled
>
> So the skip of IRQ7 in pci_xen_initial_domain() sets the correct handler
>  (IIUC xen uses the ioapic-level and handles the eoi separately), but not
> the correct type (still edge).
> I guess this may explains the results above.
>
>
 Mario (in CC) patched the pinctrl_amd to flush pending interrupt before
starting the driver for the GPIO.

This helped in  the sense of there's no more pending interrupt on IRQ7
(whatever the handler is, level or edge) but then the touchpad is not
detected by i2c-hid.

Is there any work in progress related to the incorrect IRQ configuration ?

Thanks,
S=C3=A9bastien

--000000000000f84bc7060f121eeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=A0mar. 2 janv. 2024 =C3=A0=C2=A021:23, S=C3=A9bastien Chaumat &lt;<a href=
=3D"mailto:euidzero@gmail.com" rel=3D"noreferrer" target=3D"_blank">euidzer=
o@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div>=C2=A0output of gpioinfo<br><br>kernel alone :<br><br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =C2=A0 5:	unnamed =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 	input active-low consumer=3Dinterrupt<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 line =C2=A084:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	inpu=
t active-low consumer=3Dinterrupt<br><br>xen:<br><br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 line =C2=A0 5:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	i=
nput active-low<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =C2=A084=
:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	input active-low<br><br>xen with ski=
pping IRQ7 double init :</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 line =C2=A0 5:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	input active-low co=
nsumer=3Dinterrupt<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =C2=
=A084:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	input active-low<br><br><br>So =
definitely progressing.</div></div></div></blockquote><div><br></div><div><=
div>Checking /sys/kernel/irq/7</div><div><br></div><div>kernel alone :<br>=
=C2=A0actions: pinctrl_amd<br>=C2=A0chip_name: IR-IO-APIC<br>=C2=A0hwirq: 7=
<br>=C2=A0name: fasteoi<br>=C2=A0per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,=
0,0,0<br>=C2=A0type: level<br>=C2=A0wakeup: enabled</div><div><br></div><di=
v>xen skipping IRQ7 double init :</div><div><br></div><div>actions: pinctrl=
_amd<br>=C2=A0chip_name: xen-pirq<br>=C2=A0hwirq:</div><div>=C2=A0name: ioa=
pic-level<br>=C2=A0per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0<br>=C2=A0=
type: edge<br>=C2=A0wakeup: disabled</div><div><br></div><div>So the skip o=
f IRQ7 in pci_xen_initial_domain() sets the correct handler</div><div>=C2=
=A0(IIUC xen uses the ioapic-level and handles the eoi separately), but not=
 the correct type (still edge).</div><div>I guess this may explains the res=
ults above.</div><div><br></div></div></div></div></blockquote><div><br></d=
iv><div>=C2=A0Mario (in CC) patched the pinctrl_amd to flush pending interr=
upt before starting the driver for the GPIO.</div><div dir=3D"auto"><br></d=
iv><div>This helped in=C2=A0 the sense of there&#39;s no more pending inter=
rupt on IRQ7 (whatever the handler is, level or edge) but then the touchpad=
 is not detected by i2c-hid.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Is there any work in progress related to the incorrect IRQ configurati=
on ?</div><div dir=3D"auto"><br></div><div>Thanks,</div><div>S=C3=A9bastien=
<br></div></div></div></div>
</div>

--000000000000f84bc7060f121eeb--

