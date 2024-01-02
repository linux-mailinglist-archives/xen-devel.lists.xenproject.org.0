Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309E822280
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 21:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660835.1030476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKlIv-0004al-Od; Tue, 02 Jan 2024 20:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660835.1030476; Tue, 02 Jan 2024 20:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKlIv-0004YY-L5; Tue, 02 Jan 2024 20:24:01 +0000
Received: by outflank-mailman (input) for mailman id 660835;
 Tue, 02 Jan 2024 20:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0cx=IM=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rKlIu-0004YQ-2i
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 20:24:00 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db5e2b84-a9ac-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 21:23:58 +0100 (CET)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5cddfe0cb64so2730263a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 12:23:58 -0800 (PST)
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
X-Inumbo-ID: db5e2b84-a9ac-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704227037; x=1704831837; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaRHl4sQmsFBiWds27wFOjzMHHzIv48kVTaFV0130P8=;
        b=h6uWHdSYPdo1mIJ5RO7LoH+0/WGlTvG3nKsXeQnCU34AlL0nqKCULIGYewf4sq8Pr7
         qLoNFtm672/UFDL1cHDyqikkXyuj62v7tEfU5VMajq4co/zxr+AubYq/lrIf/Qke5lzG
         ep1+CFvkfCXxaCwIwOSCl89ByCyJatzZrRA81jhmn1ITj0Ko8E9k4YhAvfyXv8lRdu+W
         VYi+uhXyxG21VkYUxak1LqPGWeDXqYancZuXkXOF1bxqWIFSFbWzDa/BxSqxnWxsilKW
         ms/M4507ALViorvTEaahItzOBS/wV78hjZhokL2TQKVGb7wCxmlqqHEuGnf/kCpyovlp
         HxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704227037; x=1704831837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaRHl4sQmsFBiWds27wFOjzMHHzIv48kVTaFV0130P8=;
        b=eNoaobhPva0vM6G5oR1lZHpr8TVPBRBhtLWhzqZmLErGwGe90WgR+L9YWETueI5W0V
         DmNSwSh59dRysFLKxH1nfK27fJaqTdWjfuZ7AWBy27JP0fF1GN/QEjZZAKB+UR7/2P0W
         VoyXZxz/TRF+PpkZme6XYjmR5yrMyyYpkYMni1MGO8nLHckfsNVjfHeRhpMfMEe4n9FW
         zJc5Hycus8ghtaXfE1Sbe8poRqe/94BQ+3Tfp1zVSfpw8L0K9lu6Pe6oOiww82uY+sgm
         hCPF63OCC5hJ0ItsVRjripoWMuqgarzMKjF1CwdWARM1rwZjO/0K8mlxFohnojOrCaBP
         dgNQ==
X-Gm-Message-State: AOJu0YzMYH51tmmr/StlvbxpXtgh/CrZbES1cJ4mDutAvgZRXdEAigXj
	Lryg6SzfX75ou/9eESAG+YeUTUY+WKPHF9FGHt8DzrjgGOJ+Eg==
X-Google-Smtp-Source: AGHT+IHwdFPC8ZlOyhLKPnwc2hjy1il8mRAAXJbQizM142Suctj2RAhVcKvt1O9XOlRrB9MF83ABMbww7inc5HdWrNw=
X-Received: by 2002:a05:6a20:9756:b0:18b:e692:8f01 with SMTP id
 hs22-20020a056a20975600b0018be6928f01mr7298370pzc.5.1704227036749; Tue, 02
 Jan 2024 12:23:56 -0800 (PST)
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
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
In-Reply-To: <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 2 Jan 2024 21:23:45 +0100
Message-ID: <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000246572060dfc47d0"

--000000000000246572060dfc47d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>  output of gpioinfo
>
> kernel alone :
>
>         line   5: unnamed         input active-low consumer=3Dinterrupt
>         line  84: unnamed         input active-low consumer=3Dinterrupt
>
> xen:
>
>         line   5: unnamed         input active-low
>         line  84: unnamed         input active-low
>
> xen with skipping IRQ7 double init :
>
>         line   5: unnamed         input active-low consumer=3Dinterrupt
>         line  84: unnamed         input active-low
>
>
> So definitely progressing.
>

Checking /sys/kernel/irq/7

kernel alone :
 actions: pinctrl_amd
 chip_name: IR-IO-APIC
 hwirq: 7
 name: fasteoi
 per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0
 type: level
 wakeup: enabled

xen skipping IRQ7 double init :

actions: pinctrl_amd
 chip_name: xen-pirq
 hwirq:
 name: ioapic-level
 per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
 type: edge
 wakeup: disabled

So the skip of IRQ7 in pci_xen_initial_domain() sets the correct handler
 (IIUC xen uses the ioapic-level and handles the eoi separately), but not
the correct type (still edge).
I guess this may explains the results above.

S=C3=A9bastien

--000000000000246572060dfc47d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=
=A0output of gpioinfo<br><br>kernel alone :<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 line =C2=A0 5:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	input active-low co=
nsumer=3Dinterrupt<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =C2=
=A084:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	input active-low consumer=3Dint=
errupt<br><br>xen:<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =
=C2=A0 5:	unnamed =C2=A0 =C2=A0 =C2=A0 =C2=A0 	input active-low<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =C2=A084:	unnamed =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 	input active-low<br><br>xen with skipping IRQ7 double init :=
</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =C2=A0 5:	unname=
d =C2=A0 =C2=A0 =C2=A0 =C2=A0 	input active-low consumer=3Dinterrupt<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =C2=A084:	unnamed =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 	input active-low<br><br><br>So definitely progressing.</=
div></div></div></blockquote><div><br></div><div><div>Checking /sys/kernel/=
irq/7</div><div><br></div><div>kernel alone :<br>=C2=A0actions: pinctrl_amd=
<br>=C2=A0chip_name: IR-IO-APIC<br>=C2=A0hwirq: 7<br>=C2=A0name: fasteoi<br=
>=C2=A0per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0<br>=C2=A0type: level=
<br>=C2=A0wakeup: enabled</div><div><br></div><div>xen skipping IRQ7 double=
 init :</div><div><br></div><div>actions: pinctrl_amd<br>=C2=A0chip_name: x=
en-pirq<br>=C2=A0hwirq:</div><div>=C2=A0name: ioapic-level<br>=C2=A0per_cpu=
_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0<br>=C2=A0type: edge<br>=C2=A0wakeup=
: disabled</div><div><br></div><div>So the skip of IRQ7 in pci_xen_initial_=
domain() sets the correct handler</div><div>=C2=A0(IIUC xen uses the ioapic=
-level and handles the eoi separately), but not the correct type (still edg=
e).</div><div>I guess this may explains the results above.</div><div><br></=
div><div>S=C3=A9bastien<br></div>=C2=A0</div></div></div>

--000000000000246572060dfc47d0--

