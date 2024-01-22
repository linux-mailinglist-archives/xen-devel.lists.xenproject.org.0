Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D6836C7B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 18:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670028.1042599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRxl2-0004xQ-6M; Mon, 22 Jan 2024 17:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670028.1042599; Mon, 22 Jan 2024 17:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRxl2-0004vP-22; Mon, 22 Jan 2024 17:06:48 +0000
Received: by outflank-mailman (input) for mailman id 670028;
 Mon, 22 Jan 2024 17:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1fX=JA=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rRxl0-0004vJ-My
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 17:06:46 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ecdbb59-b948-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 18:06:45 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-290a55f3feaso795968a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 09:06:45 -0800 (PST)
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
X-Inumbo-ID: 9ecdbb59-b948-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705943204; x=1706548004; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/PolFGSx8X5PcHNhFYQmMDWcmM6L0GZrTiL9HH5fX0A=;
        b=SePPVqAeaHlQLIkUR+jClNFb1jXa+bm3P2Bp1xnojrv98E1Jt555rlN+wrPKduQuG8
         n0ZZd623XnF8Pjri+SJcNFf6UpdbR22Eva/r3pJZTob6joirOjRwGTUS4562MAXKqWWv
         cSFA+CYvzIMPKLvIpllGvfMpWFCrYsXq3xd2SXbZdCSC5+Nc8s1lIRWoCdAC4njiuRcK
         abYHJvGUofJug4Mm7Zfj9i5sAunRWaSqFjGUVkdKSJwn5ynBMuffUZ+k3BgKVVwnp4pA
         8xa8ODinyUgboG5WWfaWTYxcksqkLjOludk7MLgQJLMROcP3QE286xTXYLtm2ofik28O
         mMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705943204; x=1706548004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PolFGSx8X5PcHNhFYQmMDWcmM6L0GZrTiL9HH5fX0A=;
        b=YCZ3SjZXzvOo2kIpdUgYSZwVBy7m6tvbRJRLoiYz9x2l8DAA0HvKobPdmOofcjSl+G
         LXRYt8K2uq+rCkpltOXMD8O3OxV2Emkqm/T7+fmQhcr+9M5V8Spz6qbIzxvCjPLhonDs
         SRaXi6G2Yk4N+53bkeU3FNbXqorGuZpD2G7nkvn+uT5zYshjeCCKx0WQRDr3SQLDxkYC
         mk7/oD9WgHTLLyJYaM9Z0Cuk1MAyRYB2EftZdhKQHMLKTQVuJkVY+yvrIP85Mkysss7M
         T0EoB4o7DlJn8EWxnzXJ4Bc5SjguG8eBmAJ1tKlMe4gvXFpdwTT4fetJfKmpqwfTX0GQ
         LpMQ==
X-Gm-Message-State: AOJu0Yy50rQMQk9wmP2I+sEADo4JSb+ChOv6lYFQDqUIHrWwhFkwPdvF
	qv2SPdDN3IIAwAevelj2dHtxNlHL2K8yhT80vblylH6h/6vuZcxfNjl63ONOX3zIYYARnDTpcch
	VEzr/TEyKyRLfozjtQ4p1tJlMlJM=
X-Google-Smtp-Source: AGHT+IF8WzDo38Z0yUxrkTkvNNnZZDRCO73ktXWM3JmiQoLFQHUMpPt+OxmeR0ZnOZTQj76kjFLdEAJlOl0YjmUeTrg=
X-Received: by 2002:a17:90a:de89:b0:290:6e27:4e4b with SMTP id
 n9-20020a17090ade8900b002906e274e4bmr1535302pjv.15.1705943204010; Mon, 22 Jan
 2024 09:06:44 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
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
In-Reply-To: <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 22 Jan 2024 18:06:32 +0100
Message-ID: <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000ae9d52060f8bdac7"

--000000000000ae9d52060f8bdac7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 17 janv. 2024 =C3=A0 03:20, Mario Limonciello <mario.limonciello@am=
d.com>
a =C3=A9crit :

> On 1/16/2024 10:18, Jan Beulich wrote:
> > On 16.01.2024 16:52, S=C3=A9bastien Chaumat wrote:
> >> Le mar. 2 janv. 2024 =C3=A0 21:23, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a
> >> =C3=A9crit :
> >>
> >>>
> >>>   output of gpioinfo
> >>>>
> >>>> kernel alone :
> >>>>
> >>>>          line   5: unnamed         input active-low consumer=3Dinter=
rupt
> >>>>          line  84: unnamed         input active-low consumer=3Dinter=
rupt
> >>>>
> >>>> xen:
> >>>>
> >>>>          line   5: unnamed         input active-low
> >>>>          line  84: unnamed         input active-low
> >>>>
> >>>> xen with skipping IRQ7 double init :
> >>>>
> >>>>          line   5: unnamed         input active-low consumer=3Dinter=
rupt
> >>>>          line  84: unnamed         input active-low
> >>>>
> >>>>
> >>>> So definitely progressing.
> >>>>
> >>>
> >>> Checking /sys/kernel/irq/7
> >>>
> >>> kernel alone :
> >>>   actions: pinctrl_amd
> >>>   chip_name: IR-IO-APIC
> >>>   hwirq: 7
> >>>   name: fasteoi
> >>>   per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0
> >>>   type: level
> >>>   wakeup: enabled
> >>>
> >>> xen skipping IRQ7 double init :
> >>>
> >>> actions: pinctrl_amd
> >>>   chip_name: xen-pirq
> >>>   hwirq:
> >>>   name: ioapic-level
> >>>   per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
> >>>   type: edge
> >>>   wakeup: disabled
> >>>
> >>> So the skip of IRQ7 in pci_xen_initial_domain() sets the correct
> handler
> >>>   (IIUC xen uses the ioapic-level and handles the eoi separately), bu=
t
> not
> >>> the correct type (still edge).
> >>> I guess this may explains the results above.
> >>>
> >>>
> >>   Mario (in CC) patched the pinctrl_amd to flush pending interrupt
> before
> >> starting the driver for the GPIO.
> >>
> >> This helped in  the sense of there's no more pending interrupt on IRQ7
> >> (whatever the handler is, level or edge) but then the touchpad is not
> >> detected by i2c-hid.
> >>
> >> Is there any work in progress related to the incorrect IRQ
> configuration ?
> >
> > I'm not aware of any. As per my recollection it's still not entirely
> > clear where in the kernel things go astray. And to be honest I don't
> > feel comfortable trying to half-blindly address this, e.g. by trying
> > to circumvent / defer the early setting up of the low 16 IRQs.
> >
> > Jan
>
> Shot in the dark - but could this be a problem where PCAT_COMPAT from
> the MADT is being ignored causing PIC not to be setup properly in the
> Xen case?
>
> See https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/ for some context.
>
> At least we know that no MADT override is found by xen for INT7 as no
INT_SRC_OVR message is printed.

Do we expect one @Mario Limonciello <mario.limonciello@amd.com>  ?

--000000000000ae9d52060f8bdac7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 17 janv. 2024 =C3=A0=C2=
=A003:20, Mario Limonciello &lt;<a href=3D"mailto:mario.limonciello@amd.com=
">mario.limonciello@amd.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 1/16/2024 10:18, Jan Beulich wro=
te:<br>
&gt; On 16.01.2024 16:52, S=C3=A9bastien Chaumat wrote:<br>
&gt;&gt; Le mar. 2 janv. 2024 =C3=A0 21:23, S=C3=A9bastien Chaumat &lt;<a h=
ref=3D"mailto:euidzero@gmail.com" target=3D"_blank">euidzero@gmail.com</a>&=
gt; a<br>
&gt;&gt; =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0output of gpioinfo<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; kernel alone :<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05: unna=
med=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low consumer=3Dinterrupt<=
br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 84: unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low consumer=3Dinterrupt<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; xen:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05: unna=
med=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 84: unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; xen with skipping IRQ7 double init :<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A05: unna=
med=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low consumer=3Dinterrupt<=
br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=C2=A0 84: unnamed=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; So definitely progressing.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Checking /sys/kernel/irq/7<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; kernel alone :<br>
&gt;&gt;&gt;=C2=A0 =C2=A0actions: pinctrl_amd<br>
&gt;&gt;&gt;=C2=A0 =C2=A0chip_name: IR-IO-APIC<br>
&gt;&gt;&gt;=C2=A0 =C2=A0hwirq: 7<br>
&gt;&gt;&gt;=C2=A0 =C2=A0name: fasteoi<br>
&gt;&gt;&gt;=C2=A0 =C2=A0per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0type: level<br>
&gt;&gt;&gt;=C2=A0 =C2=A0wakeup: enabled<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; xen skipping IRQ7 double init :<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; actions: pinctrl_amd<br>
&gt;&gt;&gt;=C2=A0 =C2=A0chip_name: xen-pirq<br>
&gt;&gt;&gt;=C2=A0 =C2=A0hwirq:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0name: ioapic-level<br>
&gt;&gt;&gt;=C2=A0 =C2=A0per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0<br>
&gt;&gt;&gt;=C2=A0 =C2=A0type: edge<br>
&gt;&gt;&gt;=C2=A0 =C2=A0wakeup: disabled<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So the skip of IRQ7 in pci_xen_initial_domain() sets the corre=
ct handler<br>
&gt;&gt;&gt;=C2=A0 =C2=A0(IIUC xen uses the ioapic-level and handles the eo=
i separately), but not<br>
&gt;&gt;&gt; the correct type (still edge).<br>
&gt;&gt;&gt; I guess this may explains the results above.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Mario (in CC) patched the pinctrl_amd to flush pending=
 interrupt before<br>
&gt;&gt; starting the driver for the GPIO.<br>
&gt;&gt;<br>
&gt;&gt; This helped in=C2=A0 the sense of there&#39;s no more pending inte=
rrupt on IRQ7<br>
&gt;&gt; (whatever the handler is, level or edge) but then the touchpad is =
not<br>
&gt;&gt; detected by i2c-hid.<br>
&gt;&gt;<br>
&gt;&gt; Is there any work in progress related to the incorrect IRQ configu=
ration ?<br>
&gt; <br>
&gt; I&#39;m not aware of any. As per my recollection it&#39;s still not en=
tirely<br>
&gt; clear where in the kernel things go astray. And to be honest I don&#39=
;t<br>
&gt; feel comfortable trying to half-blindly address this, e.g. by trying<b=
r>
&gt; to circumvent / defer the early setting up of the low 16 IRQs.<br>
&gt; <br>
&gt; Jan<br>
<br>
Shot in the dark - but could this be a problem where PCAT_COMPAT from <br>
the MADT is being ignored causing PIC not to be setup properly in the <br>
Xen case?<br>
<br>
See <a href=3D"https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/" rel=3D"nor=
eferrer" target=3D"_blank">https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/=
</a> for some context.<br>
<br></blockquote><div>At least we know that no MADT override is found by xe=
n for INT7 as no INT_SRC_OVR message is printed.<br></div><div><br></div><d=
iv>Do we expect one <a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" hre=
f=3D"mailto:mario.limonciello@amd.com" tabindex=3D"-1">@Mario Limonciello</=
a>=C2=A0 ?<br></div></div></div>

--000000000000ae9d52060f8bdac7--

