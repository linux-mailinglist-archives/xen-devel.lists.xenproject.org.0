Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754618457C8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 13:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674405.1049271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVWDM-0005P1-Ba; Thu, 01 Feb 2024 12:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674405.1049271; Thu, 01 Feb 2024 12:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVWDM-0005Lm-8u; Thu, 01 Feb 2024 12:30:44 +0000
Received: by outflank-mailman (input) for mailman id 674405;
 Thu, 01 Feb 2024 12:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=biZV=JK=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rVWDL-0005Lg-3A
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 12:30:43 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b534da19-c0fd-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 13:30:40 +0100 (CET)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6ddc1b30458so720756b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 04:30:40 -0800 (PST)
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
X-Inumbo-ID: b534da19-c0fd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706790639; x=1707395439; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MNNe40aDhpyf7c0R61dDLN1CMdR/83Z6jEtpSATxBS4=;
        b=jSXm+5Dq4ym8TPRAfVDS3fbVV7NYeCBkrEAxim0C6shcE7pnL3xJ3SuLmnnSBmoN//
         y/MVdyF3IBbCek4OD90mZZixbeRh2ev0hg7hydsVYq43aAMHcf6/JfU9nuNJLaFCp2nY
         6GMEI1kjRXNZuA0OPvW0EhY6l+dB2j4mq8PXNuGKwXXLHezNY31+HoTgWLjLcJO7gPPy
         1uvRCWbTyKNfOTIbxmAV2HmSSSgM7cmogiEGBg95CIJi3EPz+UUGUAp/vsf4iZJuaVGB
         t35hgp3uO+9d8CSV/0jrtt/Q2if+TtZu9RtIPRJTeUQD1OJ5BNBVWx6TBAE0u+pDa/r8
         HnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706790639; x=1707395439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNNe40aDhpyf7c0R61dDLN1CMdR/83Z6jEtpSATxBS4=;
        b=R/5/UwfH6SLO5nsXycSNzoeBfhQa28Qbd754a0ecPbhzNcfTTZ/LEtkOnJJyvbBLUp
         g4ib+7cVGjy8aD/OUWCVBs3lE2wKBDptHKhqODzKWH3vd9258G4p4niCk57lle7rhZhv
         M+CNO7D+61pPQ1rZOEnaKKlZpDhuOkjAgw2Onr3WpkXzpOuOodaXlg2wYbSyQ50ytsam
         1Is9BznbuZ4cLLs1nZlDmKJamSitHzk5SArI4q28xxmgViCRv8t4TnKHpcbohRT4izI8
         34DtoUnzLZs0GPz3FEu9B7git3NFHF8d3nwRKgST8Bz1eW8TcjbIEtV008MLyB/jf+2B
         Q0QA==
X-Gm-Message-State: AOJu0Yybt4yvrrYReGI92XfZK1Ee5ASWhqq0TG2BUrNvpJFOZ5jrF1fs
	cfrq7Wr9w3qN2g70fgF4bNujYo/SQXwL88BJsiFyi7hSqZsn441Eg4hpvxQ40NunzYnobKKal9+
	2L98Lq4GQqevfSQITxRFT4g41pcSvlQVpOQkZNw==
X-Google-Smtp-Source: AGHT+IGGofdZQxqikVe1bre/Xj1M34eesDnF1lZASV+6c77b+PD/3kvWcUxdr2RYddnUex8ieuor7XAswonzV0qmI4o=
X-Received: by 2002:a05:6a00:2ea7:b0:6db:dc74:d6e with SMTP id
 fd39-20020a056a002ea700b006dbdc740d6emr5098643pfb.17.1706790638574; Thu, 01
 Feb 2024 04:30:38 -0800 (PST)
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
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com> <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
In-Reply-To: <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Thu, 1 Feb 2024 13:30:26 +0100
Message-ID: <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="000000000000b7e0af061051296f"

--000000000000b7e0af061051296f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I spotted the following warning for IRQ7 (along with IRQ6 and 10)

[    0.686073] fedora kernel: __irq_set_trigger: genirq: No set_type
function for IRQ 7 (IR-IO-APIC)

This comes from kernel/irq/manage.c


int __irq_set_trigger(struct irq_desc *desc, unsigned long flags)
{
struct irq_chip *chip =3D desc->irq_data.chip;
int ret, unmask =3D 0;

if (!chip || !chip->irq_set_type) {
/*
* IRQF_TRIGGER_* but the PIC does not support multiple
* flow-types?
*/
pr_debug("No set_type function for IRQ %d (%s)\n",
irq_desc_get_irq(desc),
chip ? (chip->name ? : "unknown") : "unknown");
return 0;
}

Could this have a role in the IRQ misconfiguration by xen ?




Le lun. 22 janv. 2024 =C3=A0 21:59, Mario Limonciello <mario.limonciello@am=
d.com>
a =C3=A9crit :

> On 1/22/2024 11:06, S=C3=A9bastien Chaumat wrote:
> >
> >
> > Le mer. 17 janv. 2024 =C3=A0 03:20, Mario Limonciello
> > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a =C3=A9=
crit :
> >
> >     On 1/16/2024 10:18, Jan Beulich wrote:
> >      > On 16.01.2024 16:52, S=C3=A9bastien Chaumat wrote:
> >      >> Le mar. 2 janv. 2024 =C3=A0 21:23, S=C3=A9bastien Chaumat
> >     <euidzero@gmail.com <mailto:euidzero@gmail.com>> a
> >      >> =C3=A9crit :
> >      >>
> >      >>>
> >      >>>   output of gpioinfo
> >      >>>>
> >      >>>> kernel alone :
> >      >>>>
> >      >>>>          line   5: unnamed         input active-low
> >     consumer=3Dinterrupt
> >      >>>>          line  84: unnamed         input active-low
> >     consumer=3Dinterrupt
> >      >>>>
> >      >>>> xen:
> >      >>>>
> >      >>>>          line   5: unnamed         input active-low
> >      >>>>          line  84: unnamed         input active-low
> >      >>>>
> >      >>>> xen with skipping IRQ7 double init :
> >      >>>>
> >      >>>>          line   5: unnamed         input active-low
> >     consumer=3Dinterrupt
> >      >>>>          line  84: unnamed         input active-low
> >      >>>>
> >      >>>>
> >      >>>> So definitely progressing.
> >      >>>>
> >      >>>
> >      >>> Checking /sys/kernel/irq/7
> >      >>>
> >      >>> kernel alone :
> >      >>>   actions: pinctrl_amd
> >      >>>   chip_name: IR-IO-APIC
> >      >>>   hwirq: 7
> >      >>>   name: fasteoi
> >      >>>   per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0
> >      >>>   type: level
> >      >>>   wakeup: enabled
> >      >>>
> >      >>> xen skipping IRQ7 double init :
> >      >>>
> >      >>> actions: pinctrl_amd
> >      >>>   chip_name: xen-pirq
> >      >>>   hwirq:
> >      >>>   name: ioapic-level
> >      >>>   per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
> >      >>>   type: edge
> >      >>>   wakeup: disabled
> >      >>>
> >      >>> So the skip of IRQ7 in pci_xen_initial_domain() sets the
> >     correct handler
> >      >>>   (IIUC xen uses the ioapic-level and handles the eoi
> >     separately), but not
> >      >>> the correct type (still edge).
> >      >>> I guess this may explains the results above.
> >      >>>
> >      >>>
> >      >>   Mario (in CC) patched the pinctrl_amd to flush pending
> >     interrupt before
> >      >> starting the driver for the GPIO.
> >      >>
> >      >> This helped in  the sense of there's no more pending interrupt
> >     on IRQ7
> >      >> (whatever the handler is, level or edge) but then the touchpad
> >     is not
> >      >> detected by i2c-hid.
> >      >>
> >      >> Is there any work in progress related to the incorrect IRQ
> >     configuration ?
> >      >
> >      > I'm not aware of any. As per my recollection it's still not
> entirely
> >      > clear where in the kernel things go astray. And to be honest I
> don't
> >      > feel comfortable trying to half-blindly address this, e.g. by
> trying
> >      > to circumvent / defer the early setting up of the low 16 IRQs.
> >      >
> >      > Jan
> >
> >     Shot in the dark - but could this be a problem where PCAT_COMPAT fr=
om
> >     the MADT is being ignored causing PIC not to be setup properly in t=
he
> >     Xen case?
> >
> >     See https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/
> >     <https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/> for some context=
.
> >
> > At least we know that no MADT override is found by xen for INT7 as no
> > INT_SRC_OVR message is printed.
> >
> > Do we expect one @Mario Limonciello <mailto:mario.limonciello@amd.com>
> ?
>
> No; the INT_SRV_OVR you'll see on Framework 13 AMD is on IRQ 2 and IRQ 9.
>
>

--000000000000b7e0af061051296f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I spotted the following warning for IRQ7 (along with =
IRQ6 and 10)<br></div><div><br></div><div><div>[ =C2=A0 =C2=A00.686073] fed=
ora kernel: __irq_set_trigger: genirq: No set_type function for IRQ 7 (IR-I=
O-APIC)</div></div><div><br></div><div>This comes from kernel/irq/manage.c<=
/div><div><br></div><div><br></div><div><div style=3D"color:rgb(0,0,0);back=
ground-color:rgb(255,255,255);font-family:&quot;Droid Sans Mono&quot;,&quot=
;monospace&quot;,monospace;font-weight:normal;font-size:14px;line-height:19=
px;white-space:pre"><div><span style=3D"color:rgb(0,0,255)">int</span><span=
 style=3D"color:rgb(0,0,0)"> </span><span style=3D"color:rgb(116,83,31)">__=
irq_set_trigger</span><span style=3D"color:rgb(0,0,0)">(</span><span style=
=3D"color:rgb(0,0,255)">struct</span><span style=3D"color:rgb(0,0,0)"> </sp=
an><span style=3D"color:rgb(43,145,175)">irq_desc</span><span style=3D"colo=
r:rgb(0,0,0)"> *</span><span style=3D"color:rgb(128,128,128)">desc</span><s=
pan style=3D"color:rgb(0,0,0)">, </span><span style=3D"color:rgb(0,0,255)">=
unsigned</span><span style=3D"color:rgb(0,0,0)"> </span><span style=3D"colo=
r:rgb(0,0,255)">long</span><span style=3D"color:rgb(0,0,0)"> </span><span s=
tyle=3D"color:rgb(128,128,128)">flags</span><span style=3D"color:rgb(0,0,0)=
">)</span></div><div><span style=3D"color:rgb(0,0,0)">{</span></div><div><s=
pan style=3D"color:rgb(0,0,0)">    </span><span style=3D"color:rgb(0,0,255)=
">struct</span><span style=3D"color:rgb(0,0,0)"> </span><span style=3D"colo=
r:rgb(43,145,175)">irq_chip</span><span style=3D"color:rgb(0,0,0)"> *</span=
><span style=3D"color:rgb(31,55,127)">chip</span><span style=3D"color:rgb(0=
,0,0)"> =3D </span><span style=3D"color:rgb(128,128,128)">desc</span><span =
style=3D"color:rgb(0,0,0)">-&gt;</span><span style=3D"color:rgb(0,0,0)">irq=
_data</span><span style=3D"color:rgb(0,0,0)">.</span><span style=3D"color:r=
gb(0,0,0)">chip</span><span style=3D"color:rgb(0,0,0)">;</span></div><div><=
span style=3D"color:rgb(0,0,0)">    </span><span style=3D"color:rgb(0,0,255=
)">int</span><span style=3D"color:rgb(0,0,0)"> </span><span style=3D"color:=
rgb(31,55,127)">ret</span><span style=3D"color:rgb(0,0,0)">, </span><span s=
tyle=3D"color:rgb(31,55,127)">unmask</span><span style=3D"color:rgb(0,0,0)"=
> =3D </span><span style=3D"color:rgb(9,134,88)">0</span><span style=3D"col=
or:rgb(0,0,0)">;</span></div><br><div><span style=3D"color:rgb(0,0,0)">    =
</span><span style=3D"color:rgb(143,8,196)">if</span><span style=3D"color:r=
gb(0,0,0)"> (!</span><span style=3D"color:rgb(31,55,127)">chip</span><span =
style=3D"color:rgb(0,0,0)"> || !</span><span style=3D"color:rgb(31,55,127)"=
>chip</span><span style=3D"color:rgb(0,0,0)">-&gt;</span><span style=3D"col=
or:rgb(0,0,0)">irq_set_type</span><span style=3D"color:rgb(0,0,0)">) {</spa=
n></div><div><span style=3D"color:rgb(0,128,0)">        /*</span></div><div=
><span style=3D"color:rgb(0,128,0)">         * IRQF_TRIGGER_* but the PIC d=
oes not support multiple</span></div><div><span style=3D"color:rgb(0,128,0)=
">         * flow-types?</span></div><div><span style=3D"color:rgb(0,128,0)=
">         */</span></div><div><span style=3D"color:rgb(0,0,0)">        </s=
pan><span style=3D"color:rgb(138,27,255)">pr_debug</span><span style=3D"col=
or:rgb(0,0,0)">(</span><span style=3D"color:rgb(226,31,31)">&quot;</span><s=
pan style=3D"color:rgb(163,21,21)">No set_type function for IRQ </span><spa=
n style=3D"color:rgb(31,55,127)">%d</span><span style=3D"color:rgb(163,21,2=
1)"> (</span><span style=3D"color:rgb(31,55,127)">%s</span><span style=3D"c=
olor:rgb(163,21,21)">)</span><span style=3D"color:rgb(183,118,251)">\n</spa=
n><span style=3D"color:rgb(226,31,31)">&quot;</span><span style=3D"color:rg=
b(0,0,0)">,</span></div><div><span style=3D"color:rgb(0,0,0)">             =
</span><span style=3D"color:rgb(116,83,31)">irq_desc_get_irq</span><span st=
yle=3D"color:rgb(0,0,0)">(</span><span style=3D"color:rgb(128,128,128)">des=
c</span><span style=3D"color:rgb(0,0,0)">),</span></div><div><span style=3D=
"color:rgb(0,0,0)">             </span><span style=3D"color:rgb(31,55,127)"=
>chip</span><span style=3D"color:rgb(0,0,0)"> ? (</span><span style=3D"colo=
r:rgb(31,55,127)">chip</span><span style=3D"color:rgb(0,0,0)">-&gt;</span><=
span style=3D"color:rgb(0,0,0)">name</span><span style=3D"color:rgb(0,0,0)"=
> ? : </span><span style=3D"color:rgb(226,31,31)">&quot;</span><span style=
=3D"color:rgb(163,21,21)">unknown</span><span style=3D"color:rgb(226,31,31)=
">&quot;</span><span style=3D"color:rgb(0,0,0)">) : </span><span style=3D"c=
olor:rgb(226,31,31)">&quot;</span><span style=3D"color:rgb(163,21,21)">unkn=
own</span><span style=3D"color:rgb(226,31,31)">&quot;</span><span style=3D"=
color:rgb(0,0,0)">);</span></div><div><span style=3D"color:rgb(0,0,0)">    =
    </span><span style=3D"color:rgb(143,8,196)">return</span><span style=3D=
"color:rgb(0,0,0)"> </span><span style=3D"color:rgb(9,134,88)">0</span><spa=
n style=3D"color:rgb(0,0,0)">;</span></div><div><span style=3D"color:rgb(0,=
0,0)">    }</span></div></div></div><div><br></div><div>Could this have a r=
ole in the IRQ misconfiguration by xen ?</div><div><br></div><div><br></div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0lun. 22 janv. 2024 =C3=A0=C2=A021:59, Mario Limonci=
ello &lt;<a href=3D"mailto:mario.limonciello@amd.com">mario.limonciello@amd=
.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 1/22/2024 11:06, S=C3=A9bastien Chaumat wrote:<br>
&gt; <br>
&gt; <br>
&gt; Le=C2=A0mer. 17 janv. 2024 =C3=A0=C2=A003:20, Mario Limonciello <br>
&gt; &lt;<a href=3D"mailto:mario.limonciello@amd.com" target=3D"_blank">mar=
io.limonciello@amd.com</a> &lt;mailto:<a href=3D"mailto:mario.limonciello@a=
md.com" target=3D"_blank">mario.limonciello@amd.com</a>&gt;&gt; a =C3=A9cri=
t=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 1/16/2024 10:18, Jan Beulich wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 16.01.2024 16:52, S=C3=A9bastien Chaumat w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Le mar. 2 janv. 2024 =C3=A0 21:23, S=C3=
=A9bastien Chaumat<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:euidzero@gmail.com" target=3D=
"_blank">euidzero@gmail.com</a> &lt;mailto:<a href=3D"mailto:euidzero@gmail=
.com" target=3D"_blank">euidzero@gmail.com</a>&gt;&gt; a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C3=A9crit :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0output of gpioinfo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; kernel alone :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 line=C2=A0 =C2=A05: unnamed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-=
low<br>
&gt;=C2=A0 =C2=A0 =C2=A0consumer=3Dinterrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 line=C2=A0 84: unnamed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0consumer=3Dinterrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; xen:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 line=C2=A0 =C2=A05: unnamed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-=
low<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 line=C2=A0 84: unnamed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; xen with skipping IRQ7 double ini=
t :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 line=C2=A0 =C2=A05: unnamed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-=
low<br>
&gt;=C2=A0 =C2=A0 =C2=A0consumer=3Dinterrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 line=C2=A0 84: unnamed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input active-low<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; So definitely progressing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Checking /sys/kernel/irq/7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; kernel alone :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0actions: pinctrl_amd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0chip_name: IR-IO-APIC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0hwirq: 7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0name: fasteoi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0per_cpu_count: 0,0,0,0,0,=
20,0,0,0,0,0,0,0,0,0,0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0type: level<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0wakeup: enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; xen skipping IRQ7 double init :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; actions: pinctrl_amd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0chip_name: xen-pirq<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0hwirq:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0name: ioapic-level<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0per_cpu_count: 0,0,0,0,0,=
0,1,0,0,0,0,0,0,0,0,0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0type: edge<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0wakeup: disabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; So the skip of IRQ7 in pci_xen_initia=
l_domain() sets the<br>
&gt;=C2=A0 =C2=A0 =C2=A0correct handler<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0(IIUC xen uses the ioapic=
-level and handles the eoi<br>
&gt;=C2=A0 =C2=A0 =C2=A0separately), but not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; the correct type (still edge).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; I guess this may explains the results=
 above.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Mario (in CC) patched the pin=
ctrl_amd to flush pending<br>
&gt;=C2=A0 =C2=A0 =C2=A0interrupt before<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; starting the driver for the GPIO.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; This helped in=C2=A0 the sense of there&#=
39;s no more pending interrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0on IRQ7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; (whatever the handler is, level or edge) =
but then the touchpad<br>
&gt;=C2=A0 =C2=A0 =C2=A0is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; detected by i2c-hid.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Is there any work in progress related to =
the incorrect IRQ<br>
&gt;=C2=A0 =C2=A0 =C2=A0configuration ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m not aware of any. As per my recollect=
ion it&#39;s still not entirely<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; clear where in the kernel things go astray. A=
nd to be honest I don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; feel comfortable trying to half-blindly addre=
ss this, e.g. by trying<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to circumvent / defer the early setting up of=
 the low 16 IRQs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Jan<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Shot in the dark - but could this be a problem wher=
e PCAT_COMPAT from<br>
&gt;=C2=A0 =C2=A0 =C2=A0the MADT is being ignored causing PIC not to be set=
up properly in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Xen case?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0See <a href=3D"https://lore.kernel.org/all/875y2u5s=
8g.ffs@tglx/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
all/875y2u5s8g.ffs@tglx/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lore.kernel.org/all/875y2u5s=
8g.ffs@tglx/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
all/875y2u5s8g.ffs@tglx/</a>&gt; for some context.<br>
&gt; <br>
&gt; At least we know that no MADT override is found by xen for INT7 as no =
<br>
&gt; INT_SRC_OVR message is printed.<br>
&gt; <br>
&gt; Do we expect one @Mario Limonciello &lt;mailto:<a href=3D"mailto:mario=
.limonciello@amd.com" target=3D"_blank">mario.limonciello@amd.com</a>&gt;=
=C2=A0 ?<br>
<br>
No; the INT_SRV_OVR you&#39;ll see on Framework 13 AMD is on IRQ 2 and IRQ =
9.<br>
<br>
</blockquote></div>

--000000000000b7e0af061051296f--

