Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD0804CF3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 09:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647466.1010622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAR8h-0002t1-K7; Tue, 05 Dec 2023 08:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647466.1010622; Tue, 05 Dec 2023 08:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAR8h-0002qd-HN; Tue, 05 Dec 2023 08:50:47 +0000
Received: by outflank-mailman (input) for mailman id 647466;
 Tue, 05 Dec 2023 08:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WXV=HQ=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rAR8g-0002qX-UM
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 08:50:47 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fcce299-934b-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 09:50:44 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cfc9c4acb6so23546585ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 00:50:44 -0800 (PST)
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
X-Inumbo-ID: 5fcce299-934b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701766243; x=1702371043; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KxsmGtDRn1Wo9Fz8BQwrLB7AzZJnt699cGgqD5Tx4tA=;
        b=YldaX+KgIkUZS4udJ0P4K/PcMHWIrWjimW6Qlb7U3GdXsyM2HC1obiOU55803J6Wu4
         aGun/fUlnXAZrpBG5EJtwl48SNE/0ptHNnXA2nXjBZcWaWCsrjoiZhxqfnSa5ZYBNTjs
         47o8PQmgGjyFeZ7qc7JUY3PMO/cRv/puOA6rIHU79b4LS6d0hI4k3x77vHPjq7xGcg6U
         7vWHntUY+CfwxBabJd5837Ay5sV+kMZxHK2C1jAZifP2eJlfxGXewx4c4ekWBcVRpgRG
         x7TaxmCeW+3R3ZBP+VoJs+IQnU9aJiLCmHLvzUswmyJ/2sx8m+ztR6da47wnwCJeNBj5
         1h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701766243; x=1702371043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxsmGtDRn1Wo9Fz8BQwrLB7AzZJnt699cGgqD5Tx4tA=;
        b=vbj7xM0+Qzs6seBoRTsTxdqdcet76KzmuG3d7sqpjcuOjqtNTnkpzgTZITy/Hdur5N
         A8LpDTz5UwQCSrjhSNxBxsFk+/qNTm3IiCU/kIxlOB53Asgx1fEsjnreKS+7WKlqwlve
         4l4RYAewPxxS2jy/AXtiLnIyW6eEkpwgubTblKHsfpQ8MIOUV4x5rmOcmdG6dWWgSuEd
         kPHVu1F55Q+8EheiGY8cBxeOpSVXJn/TgmdFjzn0fD3AkmRe37A49+7fmvoQxxxvovwx
         GR7N6P5n4Qfb89CEvLR7lGGtcWdrJs3NpDJzsbB/b2tOx1CbRnr+Lr6dYOCPHs6NM8DD
         FZ8g==
X-Gm-Message-State: AOJu0Ywmzy90boHvv5N5UYcPXGOX/hZwFfNKHk9b6lPMJTRnn6d1SEyD
	zHbn1KFD7/AcIE/fwzD64gmQ+aNgebHsG4ideWo=
X-Google-Smtp-Source: AGHT+IHHSKMXsneBOM96qZfAEML/IVvHEQopHpJ980yMSrEsuJy2GoQigxvPbynVtnekTWzA2e5YxiKa168qB4jamwY=
X-Received: by 2002:a17:90a:e2ce:b0:286:6cc0:886e with SMTP id
 fr14-20020a17090ae2ce00b002866cc0886emr617165pjb.91.1701766242581; Tue, 05
 Dec 2023 00:50:42 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
In-Reply-To: <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 5 Dec 2023 09:50:31 +0100
Message-ID: <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000614288060bbf54c2"

--000000000000614288060bbf54c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any direction on how I can enhance the debugging at the kernel level ?

There was an old issue with amd_gpio there :
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1971597
Coud the kernel be confused by IRQ/GSI mapping ? Any way to test this
hypothesis?

Thanks




Le mar. 5 d=C3=A9c. 2023 =C3=A0 09:17, Jan Beulich <jbeulich@suse.com> a =
=C3=A9crit :

> On 04.12.2023 20:17, S=C3=A9bastien Chaumat wrote:
> > Le lun. 4 d=C3=A9c. 2023 =C3=A0 10:06, Jan Beulich <jbeulich@suse.com> =
a =C3=A9crit :
> >
> >> On 03.12.2023 10:56, S=C3=A9bastien Chaumat wrote:
> >>> Hello,
> >>>
> >>>  Trying to get the Framework Laptop 13 AMD to work with QubesOS I hit
> the
> >>> following Xen issue :
> >>>
> >>> Xen version : 4.17.2
> >>
> > + tested with 4.18.0
> >
> >
> >>> Kernel : 6.5.12-300.fc39.x86_64
> >>> CPU  model name : AMD Ryzen 7 7840U w/ Radeon  780M Graphics
> >>
> >
> >
> >>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interru=
pt
> >>
> >> Possibly releated to this. You'll want to obtain a full-verbosity
> >> hypervisor
> >> log with a debug hypervisor, as there may be hypervisor debug messages
> >> telling us what Xen may not like.
> >>
> >
> > xl dmesg with some traces attached.
>
> Nothing that looks relevant here. The anomalies are related to you also
> having enabled lock debugging and ubsan.
>
> I'm afraid this needs looking into from the kernel side first, to
> understand
> what's going wrong there. Once that's known, it'll hopefully be more clea=
r
> whether this is a Xen or a kernel issue.
>
> Jan
>

--000000000000614288060bbf54c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Any direction on how I can enhance the debugging at t=
he kernel level ?</div><div><br></div><div>There was an old issue with amd_=
gpio there : <a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+bu=
g/1971597">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1971597</a>=
</div><div>Coud the kernel be confused by IRQ/GSI mapping ? Any way to test=
 this hypothesis?</div><div><br></div><div>Thanks<br></div><div><br></div><=
div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 5 d=C3=A9c. 2023 =C3=A0=C2=A009:=
17, Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 04.12.2023 20:17, S=C3=A9bastien Chaumat wrote:<br>
&gt; Le lun. 4 d=C3=A9c. 2023 =C3=A0 10:06, Jan Beulich &lt;<a href=3D"mail=
to:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; a =C3=A9c=
rit :<br>
&gt; <br>
&gt;&gt; On 03.12.2023 10:56, S=C3=A9bastien Chaumat wrote:<br>
&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 Trying to get the Framework Laptop 13 AMD to work with Q=
ubesOS I hit the<br>
&gt;&gt;&gt; following Xen issue :<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Xen version : 4.17.2<br>
&gt;&gt;<br>
&gt; + tested with 4.18.0<br>
&gt; <br>
&gt; <br>
&gt;&gt;&gt; Kernel : 6.5.12-300.fc39.x86_64<br>
&gt;&gt;&gt; CPU=C2=A0 model name : AMD Ryzen 7 7840U w/ Radeon=C2=A0 780M =
Graphics<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt;&gt;&gt; [=C2=A0 =C2=A0 2.464598] amd_gpio AMDI0030:00: failed to enabl=
e wake-up interrupt<br>
&gt;&gt;<br>
&gt;&gt; Possibly releated to this. You&#39;ll want to obtain a full-verbos=
ity<br>
&gt;&gt; hypervisor<br>
&gt;&gt; log with a debug hypervisor, as there may be hypervisor debug mess=
ages<br>
&gt;&gt; telling us what Xen may not like.<br>
&gt;&gt;<br>
&gt; <br>
&gt; xl dmesg with some traces attached.<br>
<br>
Nothing that looks relevant here. The anomalies are related to you also<br>
having enabled lock debugging and ubsan.<br>
<br>
I&#39;m afraid this needs looking into from the kernel side first, to under=
stand<br>
what&#39;s going wrong there. Once that&#39;s known, it&#39;ll hopefully be=
 more clear<br>
whether this is a Xen or a kernel issue.<br>
<br>
Jan<br>
</blockquote></div>

--000000000000614288060bbf54c2--

