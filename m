Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8341181EE21
	for <lists+xen-devel@lfdr.de>; Wed, 27 Dec 2023 11:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660102.1029681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIR1s-0003BC-Oh; Wed, 27 Dec 2023 10:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660102.1029681; Wed, 27 Dec 2023 10:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIR1s-00038I-LH; Wed, 27 Dec 2023 10:20:48 +0000
Received: by outflank-mailman (input) for mailman id 660102;
 Wed, 27 Dec 2023 10:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lso=IG=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rIR1r-00038C-EH
 for xen-devel@lists.xenproject.org; Wed, 27 Dec 2023 10:20:47 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97392214-a4a1-11ee-9b0f-b553b5be7939;
 Wed, 27 Dec 2023 11:20:45 +0100 (CET)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso3679729a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Dec 2023 02:20:43 -0800 (PST)
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
X-Inumbo-ID: 97392214-a4a1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703672442; x=1704277242; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sKRkEdFeNIAs0Mu5/kzgu59lTthX1DoNRDWKejjl08E=;
        b=esbJF2SgCqEjCx4DLkLTdmhGpajmOJmO8Ia2lUQr90WPR69Ka3irNRA16jF/bWClgH
         VJX6Pu6oJNCYJQrJvGpG/Ce015fJ4/2twsGnFLT+l6zCjtXgRyaK52t/HcthHZfGIq4n
         npKo5COUTkIvhalUE3Pk1FIHO8mKlgmYRV4mFjUmvn7GN4XfPn0bZ+/HRfymhkjVk4E3
         NGuczj19NaX9aPtg2fB8xGo5ov+hrwUNrrDWMbOh1eip5hhYV2oPWZVZME4dtct/m5f+
         Wd0exSmPVoXHee2e51EPVv9AlkIumpiG1vpS0QnynVsmsu1jHflof0d1RHkIS/yBo3JH
         b8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703672442; x=1704277242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKRkEdFeNIAs0Mu5/kzgu59lTthX1DoNRDWKejjl08E=;
        b=EDCo19rm4FsNYJXeFST531dl6uz6ezPNK80UjHkDpVeuMC2D6BN8SAFplII5P/dV2G
         lO3q6B+deqXwWVa6F8ElNTE7+XmvRURTqgkAuyB9WAkUIH7Ur9Gm5SLGGP4bRuE7pkit
         62dhxdIFf76CKbmiddIb4AyBZK9ukMQumK8nWNyedxbe+gcJeuO5EQqUdp0T6O+53Jj9
         jkH3g3PsF4eKqOVcyKScvOvs2vrpA6Jdn1szh80/o1d7TQ4BFXodjq2Kl6fa4iJCg2D6
         FUS5Evd+qZVJVb8i4kAOzNAB4zIAip++dDu/Is14kZcJwk/yRb8MNXKlGjf5w4gxot/6
         3MXg==
X-Gm-Message-State: AOJu0YxZh0WWxdH6rp8ka63IN0Zwfe1pTzidgvLnNBBJtfDU8zLtcFXu
	7PtfczDi3r/j01MVrFp/o5bWCCOywii5p5h4Qc/1N0ul2ssHEA==
X-Google-Smtp-Source: AGHT+IFjK1RMnX5MxC+cve+ey4b3wpXoFNJVO0wEPIGg42LzMD/3OvW6GEavchF2GURim2POPU7mO1QRUNqANVRjr+w=
X-Received: by 2002:a17:90a:9109:b0:28c:2871:95fd with SMTP id
 k9-20020a17090a910900b0028c287195fdmr2641225pjo.14.1703672441962; Wed, 27 Dec
 2023 02:20:41 -0800 (PST)
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
 <CAKm-UmZ-td2Ow+Gg=dC+ksLvOtTFjEoKo+_9ueozELuoK5zXrg@mail.gmail.com>
In-Reply-To: <CAKm-UmZ-td2Ow+Gg=dC+ksLvOtTFjEoKo+_9ueozELuoK5zXrg@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 27 Dec 2023 11:20:30 +0100
Message-ID: <CAKm-UmZTHLx3g+8tYhwP0f_YfGP5JUC69OdnmqhiUAV64bxOvw@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/alternative; boundary="000000000000b79194060d7b26cc"

--000000000000b79194060d7b26cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

found the following issue with this similar HW setup :

https://marc.info/?l=3Dlinux-gpio&m=3D150605230614677&w=3D2

while in bare metal, I wonder if being in dom0 does not lead to the same
configuration :

Quoting :
---
"Under the I2C-HID spec, the device interrupt is level-triggered. When
the touchpad has data to report, it will bring the GPIO level low
(this is active-low), which should signal the host to read input
report data. The device will hold the GPIO low until there is no more
data that needs to be delivered.

The user-visible problem is that the touchpad appears to stop
responding after a short period of usage. At the i2c-hid driver level,
no more interrupts are arriving. We have checked with a scope that the
interrupt line is being held low at this point, which should mean that
the interrupt handler should be executed again since there is more
data to be read, but that is not happening here.

An easy way to reproduce this issue is to press multiple fingers on
the touchpad, which will result in a large amount of input data to be
queued up on the device side; however the interrupt handler will soon
stop firing so not all the data will be read, and everything stops
there...
"
^
 in my case the interrupt handler stop after one trigger.

"We observed that at the point where no more interrupts arrive, no
EOI_MASK write was sent at the point when i2c_irq_hid returned for the
last time (and is never called again). We found a potential solution
to this problem: by adding the IRQCHIP_EOI_THREADED flag, an EOI will
be sent at this point, and we are now unable to get the touchpad to
hang."
---


S=C3=A9bastien
>

--000000000000b79194060d7b26cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span class=3D"gmail-im">found the follow=
ing issue with this similar HW setup :</span></div><div dir=3D"ltr"><span c=
lass=3D"gmail-im"><br></span></div><div dir=3D"ltr"><a href=3D"https://marc=
.info/?l=3Dlinux-gpio&amp;m=3D150605230614677&amp;w=3D2">https://marc.info/=
?l=3Dlinux-gpio&amp;m=3D150605230614677&amp;w=3D2</a></div><div><br></div><=
div>while in bare metal, I wonder if being in dom0 does not lead to the sam=
e configuration :<br></div><br>Quoting :<br>---<br>&quot;Under the I2C-HID =
spec, the device interrupt is level-triggered. When<br>the touchpad has dat=
a to report, it will bring the GPIO level low<br>(this is active-low), whic=
h should signal the host to read input<br>report data. The device will hold=
 the GPIO low until there is no more<br>data that needs to be delivered.<br=
><br>The user-visible problem is that the touchpad appears to stop<br>respo=
nding after a short period of usage. At the i2c-hid driver level,<br>no mor=
e interrupts are arriving. We have checked with a scope that the<br>interru=
pt line is being held low at this point, which should mean that<br>the inte=
rrupt handler should be executed again since there is more<br>data to be re=
ad, but that is not happening here.<br><br>An easy way to reproduce this is=
sue is to press multiple fingers on<br>the touchpad, which will result in a=
 large amount of input data to be<br>queued up on the device side; however =
the interrupt handler will soon<br>stop firing so not all the data will be =
read, and everything stops<br>there...<br><div>&quot;<br></div><div>^</div>=
<div>=C2=A0in my case the interrupt handler stop after one trigger.<br></di=
v><div><br></div>&quot;We observed that at the point where no more interrup=
ts arrive, no<br>EOI_MASK write was sent at the point when i2c_irq_hid retu=
rned for the<br>last time (and is never called again). We found a potential=
 solution<br>to this problem: by adding the IRQCHIP_EOI_THREADED flag, an E=
OI will<br>be sent at this point, and we are now unable to get the touchpad=
 to<br><div>hang.&quot;</div><div>---</div><div><br></div><div><br></div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_quote"><div>S=C3=A9bastien<br></div></=
div></div>
</blockquote></div></div>

--000000000000b79194060d7b26cc--

