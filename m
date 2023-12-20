Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B9819522
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 01:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657275.1026049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkMq-00038b-8x; Wed, 20 Dec 2023 00:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657275.1026049; Wed, 20 Dec 2023 00:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkMq-00036Q-5t; Wed, 20 Dec 2023 00:23:20 +0000
Received: by outflank-mailman (input) for mailman id 657275;
 Wed, 20 Dec 2023 00:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nu9I=H7=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rFkMp-0002a8-42
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 00:23:19 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f89f306f-9ecd-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 01:23:18 +0100 (CET)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5cdaa16ada8so1284453a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 16:23:18 -0800 (PST)
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
X-Inumbo-ID: f89f306f-9ecd-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703031796; x=1703636596; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5EscYcSLan+NyAv+9xT/5eLp8n58UYFhWStvGcmI0Y0=;
        b=N2f82NkwbDc8sZoh+HnWZETAm57wxlc2t6pza8SC+7gLNY6x8mm4rHp+q8uulY49tL
         hhtcNCbYCm3PE8GEl/GFilPCNU2VQYJzTHKS68vnvoe4fXX/TzJ7anWyOXhIvCr4PmIO
         EAXlsB6dATNMF4USiROqObFhVmDs1QNYF+YwitewdYoDwTF/48jPMoOgwn7dbDR3w9Hp
         ySf4YhYr5PEpWvSqnsIuY++yWFpvvEeI6dg9TDmWW9fWfHDFdcKfZHOMu2TMzBrhG5BX
         tDOmmxHVYFsRC2N5p2QXHRbPO+p3gK7T6KvekIXFc5+kz9Fn/rhMOAfkvHMxzcV9m1Fu
         xUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703031796; x=1703636596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EscYcSLan+NyAv+9xT/5eLp8n58UYFhWStvGcmI0Y0=;
        b=LY5Xn2J1k+75arLUI890odMCWPZYroPQ4vJtrkp7rHk+75zBP9pdUQh6E4nA05O0IC
         YnWlGpJGymp90ovB3bSdOs8efEgLJDAxDu5RsvorrEvxQ1bO0nCDCu2efSExAHAVqkFV
         f7HSJmV6m2eIW+t1dOQWJwB2sfNGqh4GtXO5Wgx+zja7YNPF9XKYZ327B+2eW+u2+xl8
         EjqDAQhyZzhRvhn0ZQbyLC7mpeEOTL8rCO+wfHeOVsNHE2k47Ok9u5nIRIx2d1kbvzBH
         sSrNyt06eh68Me6Bfaf+/ah1MhA+1XyiZo8pVVAduWWbfYuvMiCb1A1gEzybDXAtkAFu
         hxWw==
X-Gm-Message-State: AOJu0YxhyD52N0HWB94NYclNj3FTQcvnc8mxFXjB8xUnVbKIZaGFwfJD
	VJFsuOVdf44C2KZHwibMMfxaMthBrg93OVy1FwI=
X-Google-Smtp-Source: AGHT+IGM3a/T1cpFox9GXPdFQrEdjDqR38S5fc6i4pooaf8M6gBkVqzXxSRt/lBG5yGXDQ3RY0rDtHOFO0P0dmy/x/8=
X-Received: by 2002:a17:90a:f190:b0:28b:6a8a:188 with SMTP id
 bv16-20020a17090af19000b0028b6a8a0188mr2346797pjb.95.1703031796377; Tue, 19
 Dec 2023 16:23:16 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com> <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com> <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com> <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com> <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com> <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
In-Reply-To: <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 20 Dec 2023 01:23:04 +0100
Message-ID: <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000043b092060ce5fd8e"

--00000000000043b092060ce5fd8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 20 d=C3=A9c. 2023 =C3=A0 00:50, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a
=C3=A9crit :

>
>
> Le mer. 20 d=C3=A9c. 2023 =C3=A0 00:11, S=C3=A9bastien Chaumat <euidzero@=
gmail.com> a
> =C3=A9crit :
>
>>
>>
>> Le mer. 20 d=C3=A9c. 2023 =C3=A0 00:06, S=C3=A9bastien Chaumat <euidzero=
@gmail.com> a
>> =C3=A9crit :
>>
>>>
>>>
>>> Le mar. 19 d=C3=A9c. 2023 =C3=A0 20:03, S=C3=A9bastien Chaumat <euidzer=
o@gmail.com> a
>>> =C3=A9crit :
>>>
>>>> Le mar. 19 d=C3=A9c. 2023 =C3=A0 16:15, S=C3=A9bastien Chaumat <euidze=
ro@gmail.com> a
>>>> =C3=A9crit :
>>>> >
>>>> > I did add an extra printk in PHYSDEVOP_setup_gsi
>>>> > so the "first one" is my printk (available in xl dmesg)
>>>> > the second message is from xen_register_gsi (from linux kernel)
>>>> >
>>>> > Le mar. 19 d=C3=A9c. 2023 =C3=A0 14:15, Jan Beulich <jbeulich@suse.c=
om> a
>>>> =C3=A9crit :
>>>> > >
>>>> > > On 18.12.2023 17:21, S=C3=A9bastien Chaumat wrote:
>>>> > > >>>>> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
>>>> > > >>>>>>> [    2.464598] amd_gpio AMDI0030:00: failed to enable
>>>> wake-up interrupt
>>>> > > >>>>>>
>>>> > > >>>>>> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) =
to
>>>> > > >>>>>> ioapic-edge and IRQ9 to ioapic-level ?
>>>> > > >>>>>>
>>>> > > >>>>>> IR-IO-APIC    7-fasteoi   pinctrl_amd
>>>> > > >>>>>> IR-IO-APIC    9-fasteoi   acpi
>>>> > > >>>>>>
>>>> > > >>>>>> to (xen 4.18.0)
>>>> > > >>>>>>
>>>> > > >>>>>> xen-pirq     -ioapic-edge  pinctrl_amd
>>>> > > >>>>>> xen-pirq     -ioapic-level  acpi
>>>> > > >>>>>>
>>>> > > >>>>>> ?
>>>> > > >>>
>>>> > > >
>>>> > > >>> This look similar to
>>>> > > >>> https://yhbt.net/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t=
/
>>>> > > >>>
>>>> > > >>> This issue seems that IRQ 7 (the GPIO controller) is natively
>>>> fasteoi
>>>> > > >>> (so level type) while in xen it  is mapped to oapic-edge
>>>> instead of
>>>> > > >>> oapic-level
>>>> > > >>> as the SSDT indicates :
>>>> > > >>>
>>>> > > >>>  Device (GPIO)
>>>> > > >>>
>>>> > > >>>      {
>>>> > > >>>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
>>>> > > >>>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
>>>> > > >>>          Name (_UID, Zero)  // _UID: Unique ID
>>>> > > >>>          Method (_CRS, 0, NotSerialized)  // _CRS: Current
>>>> Resource Settings
>>>> > > >>>          {
>>>> > > >>>              Name (RBUF, ResourceTemplate ()
>>>> > > >>>              {
>>>> > > >>>                  Interrupt (ResourceConsumer, Level, ActiveLow=
,
>>>> Shared, ,, )
>>>> > > >>>                  {
>>>> > > >>>                      0x00000007,
>>>> > > >>>            }
>>>> > > >>> Any idea why ?
>>>> > > >>
>>>> > > >> Information coming from AML is required to be handed down by
>>>> Dom0 to Xen.
>>>> > > >> May want checking that (a) Dom0 properly does so and (b) Xen
>>>> doesn't screw
>>>> > > >> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if
>>>> this is
>>>> > > >> specific to it being IRQ7 which GPIO uses, as at the (master)
>>>> PIC IRQ7 is
>>>> > > >> also the spurious vector. You may want to retry with the tip of
>>>> the 4.17
>>>> > > >> branch (soon to become 4.17.3) - while it doesn't look very
>>>> likely to me
>>>> > > >> that recent backports there were related, it may still be that
>>>> they make
>>>> > > >> a difference.
>>>> > > >>
>>>> > > >
>>>> > > > testing with 4.17.3:
>>>> > > >
>>>> > > > Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)
>>>> that
>>>> > > > (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1
>>>> polarity: 1
>>>> > > >
>>>> > > > but later on in dmesg I see :
>>>> > > > [    1.747958] xen: registering gsi 7 triggering 0 polarity 1
>>>> > >
>>>> > > Linux has exactly one place where this message is logged from, and
>>>> that's
>>>> > > ahead of it calling PHYSDEVOP_setup_gsi. Since you said "later",
>>>> can you
>>>> > > confirm that actually you see two instances of the Xen message and
>>>> two
>>>> > > instances of the Linux one (each of them with respectively matchin=
g
>>>> > > trigger and polarity values)? Or are we indeed observing what woul=
d
>>>> look
>>>> > > to be corruption of a hypercall argument?
>>>> > >
>>>> > > If there were two calls, it would be important to realize that Xen
>>>> will
>>>> > > respect only the first one.
>>>> > >
>>>> > > Jan
>>>>
>>>> Adding a printk to catch the gsi immediately before the hypercall in
>>>> linux/arch/x86/pci/xen.c
>>>>
>>>> #ifdef CONFIG_XEN_PV_DOM0
>>>> static int xen_register_gsi(u32 gsi, int triggering, int polarity)
>>>> {
>>>> int rc, irq;
>>>> struct physdev_setup_gsi setup_gsi;
>>>>
>>>> if (!xen_pv_domain())
>>>> return -1;
>>>>
>>>> printk(KERN_DEBUG "xen: registering gsi %u triggering %d polarity %d\n=
",
>>>> gsi, triggering, polarity);
>>>>
>>>
>>> there we have :
>>>   [    1.848051] xen: registering gsi 7 triggering 0 polarity 1
>>>
>>> then in the next call :
>>>
>>> irq =3D xen_register_pirq(gsi, triggering, true);
>>>
>>>
>>>  I added a printk at the very beginning  :
>>>
>>>   static int xen_register_pirq(u32 gsi, int triggering, bool set_pirq)
>>>   {
>>>     int rc, pirq =3D -1, irq;
>>>     struct physdev_map_pirq map_irq;
>>>     int shareable =3D 0;
>>>     char *name;
>>>
>>>     printk(KERN_DEBUG "xen_register_pirq start gsi %u triggering %d
>>> set_pirq %d\n", gsi, triggering, set_pirq)
>>>
>>> And I get  in this printk result for IRQ7 : triggering=3D1 while it was
>>> passed with value 0 in the call !?
>>>
>>
>> Sorry bad format %d instead of %i for triggering ...
>>
>
> So I replaced the format with %i and suprise :
>
> There are 2 calls to  xen_register_pirq as I  can see 2 messages per IRQ
>
>  the first call is  right after the message "NR_IRQS: ..."from
> early_irq_init()   ( kernel/irq/irqdec.c )
>
>  I see :
> xen_register_pirq start gsi 7 triggering 1 set_pirq 1   ... so in
> xen_register_pirq()
> Then I get the message "Before PHYSDEVOPS_setup_gsi) proving we are calle=
d
> by xen_register_gsi()
>
> Then right after the message "ACPI: 26 ACPI AML tables successfully
> acquired and loaded"
>
> I get again, but with reversed triggering :
> xen: registering gsi 7 triggering 0 polarity 1
> xen_register_pirq start gsi 7 triggering 0 set_pirq 1
> Before PHYSDEVOPS_setup_gsi ...
>
> So once again a call to  xen_register_gsi()
>

I had to triple check:

The first call is from xen_register_pirq()  and seem to originate from
early_irq_init()  : triggering is 1
in this first call the HYPERVISOR_physdev_ops is called with triggering 1
shareable 0

The second call is from xen_register_pirq() called from xen_register_gsi() =
:
  trigger=3D0 polarity 1 at the start of  xen_register_pirq()
but then trigger=3D1 polarity=3D1 just before the call to PHYSDEVOPS_setup_=
gsi

--00000000000043b092060ce5fd8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 20 d=C3=A9c. 2023 =C3=A0=
=C2=A000:50, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidzero@gmail.co=
m">euidzero@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0mer. 20 d=C3=A9c. 2023 =C3=A0=C2=A000:11, S=C3=A9bastien Chaumat &lt;=
<a href=3D"mailto:euidzero@gmail.com" target=3D"_blank">euidzero@gmail.com<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 20 d=C3=A9c.=
 2023 =C3=A0=C2=A000:06, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidz=
ero@gmail.com" target=3D"_blank">euidzero@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le=C2=A0mar. 19 d=C3=A9c. 2023 =C3=A0=C2=A020:03=
, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidzero@gmail.com" target=
=3D"_blank">euidzero@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Le mar. 19 d=C3=A9c. 2023 =C3=A0=
 16:15, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidzero@gmail.com" ta=
rget=3D"_blank">euidzero@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;<br>
&gt; I did add an extra printk in PHYSDEVOP_setup_gsi<br>
&gt; so the &quot;first one&quot; is my printk (available in xl dmesg)<br>
&gt; the second message is from xen_register_gsi (from linux kernel)<br>
&gt;<br>
&gt; Le mar. 19 d=C3=A9c. 2023 =C3=A0 14:15, Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; a =C3=A9=
crit :<br>
&gt; &gt;<br>
&gt; &gt; On 18.12.2023 17:21, S=C3=A9bastien Chaumat wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; On 05.12.2023 21:31, S=C3=A9bastien Chaumat =
wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; [=C2=A0 =C2=A0 2.464598] amd_gpio AM=
DI0030:00: failed to enable wake-up interrupt<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; Is it expected that IRQ7 goes from faste=
oi (kernel 6.6.4 ) to<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; ioapic-edge and IRQ9 to ioapic-level ?<b=
r>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; IR-IO-APIC=C2=A0 =C2=A0 7-fasteoi=C2=A0 =
=C2=A0pinctrl_amd<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; IR-IO-APIC=C2=A0 =C2=A0 9-fasteoi=C2=A0 =
=C2=A0acpi<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; to (xen 4.18.0)<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; xen-pirq=C2=A0 =C2=A0 =C2=A0-ioapic-edge=
=C2=A0 pinctrl_amd<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; xen-pirq=C2=A0 =C2=A0 =C2=A0-ioapic-leve=
l=C2=A0 acpi<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; ?<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt;&gt; This look similar to<br>
&gt; &gt; &gt;&gt;&gt; <a href=3D"https://yhbt.net/lore/all/20201006044941.=
fdjsp346kc5thyzy@Rk/t/" rel=3D"noreferrer" target=3D"_blank">https://yhbt.n=
et/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t/</a><br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; This issue seems that IRQ 7 (the GPIO controller) is=
 natively fasteoi<br>
&gt; &gt; &gt;&gt;&gt; (so level type) while in xen it=C2=A0 is mapped to o=
apic-edge=C2=A0 instead of<br>
&gt; &gt; &gt;&gt;&gt; oapic-level<br>
&gt; &gt; &gt;&gt;&gt; as the SSDT indicates :<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 Device (GPIO)<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name (_HID, &quot;=
AMDI0030&quot;)=C2=A0 // _HID: Hardware ID<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name (_CID, &quot;=
AMDI0030&quot;)=C2=A0 // _CID: Compatible ID<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name (_UID, Zero)=
=C2=A0 // _UID: Unique ID<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Method (_CRS, 0, N=
otSerialized)=C2=A0 // _CRS: Current Resource Settings<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name=
 (RBUF, ResourceTemplate ()<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br=
>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x00000007,<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt;&gt; Any idea why ?<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Information coming from AML is required to be handed dow=
n by Dom0 to Xen.<br>
&gt; &gt; &gt;&gt; May want checking that (a) Dom0 properly does so and (b)=
 Xen doesn&#39;t screw<br>
&gt; &gt; &gt;&gt; up in consuming that data. See PHYSDEVOP_setup_gsi. I wo=
nder if this is<br>
&gt; &gt; &gt;&gt; specific to it being IRQ7 which GPIO uses, as at the (ma=
ster) PIC IRQ7 is<br>
&gt; &gt; &gt;&gt; also the spurious vector. You may want to retry with the=
 tip of the 4.17<br>
&gt; &gt; &gt;&gt; branch (soon to become 4.17.3) - while it doesn&#39;t lo=
ok very likely to me<br>
&gt; &gt; &gt;&gt; that recent backports there were related, it may still b=
e that they make<br>
&gt; &gt; &gt;&gt; a difference.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; testing with 4.17.3:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Adding some printk in PHYSDEVOP_setup_gsi, I=C2=A0 see (in x=
l dmesg)=C2=A0 that<br>
&gt; &gt; &gt; (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 p=
olarity: 1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; but later on in dmesg I see :<br>
&gt; &gt; &gt; [=C2=A0 =C2=A0 1.747958] xen: registering gsi 7 triggering 0=
 polarity 1<br>
&gt; &gt;<br>
&gt; &gt; Linux has exactly one place where this message is logged from, an=
d that&#39;s<br>
&gt; &gt; ahead of it calling PHYSDEVOP_setup_gsi. Since you said &quot;lat=
er&quot;, can you<br>
&gt; &gt; confirm that actually you see two instances of the Xen message an=
d two<br>
&gt; &gt; instances of the Linux one (each of them with respectively matchi=
ng<br>
&gt; &gt; trigger and polarity values)? Or are we indeed observing what wou=
ld look<br>
&gt; &gt; to be corruption of a hypercall argument?<br>
&gt; &gt;<br>
&gt; &gt; If there were two calls, it would be important to realize that Xe=
n will<br>
&gt; &gt; respect only the first one.<br>
&gt; &gt;<br>
&gt; &gt; Jan<br>
<br>
Adding a printk to catch the gsi immediately before the hypercall in<br>
linux/arch/x86/pci/xen.c<br>
<br>
#ifdef CONFIG_XEN_PV_DOM0<br>
static int xen_register_gsi(u32 gsi, int triggering, int polarity)<br>
{<br>
int rc, irq;<br>
struct physdev_setup_gsi setup_gsi;<br>
<br>
if (!xen_pv_domain())<br>
return -1;<br>
<br>
printk(KERN_DEBUG &quot;xen: registering gsi %u triggering %d polarity %d\n=
&quot;,<br>
gsi, triggering, polarity);<br></blockquote><div><br></div><div>there we ha=
ve :<br></div><div>=C2=A0
[=C2=A0 =C2=A0 1.848051] xen: registering gsi 7 triggering 0 polarity 1</di=
v><div><br></div><div>then in the next call :</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
irq =3D xen_register_pirq(gsi, triggering, true);</blockquote><div><br></di=
v><div>=C2=A0I added a printk at the very beginning=C2=A0 :</div><div><br><=
/div><div>=C2=A0 static int xen_register_pirq(u32 gsi, int triggering, bool=
 set_pirq)<br>=C2=A0 {<br>=C2=A0=C2=A0=C2=A0 int rc, pirq =3D -1, irq;<br>=
=C2=A0=C2=A0=C2=A0 struct physdev_map_pirq map_irq;<br>=C2=A0=C2=A0=C2=A0 i=
nt shareable =3D 0;<br>=C2=A0=C2=A0=C2=A0 char *name;</div><div><br>=C2=A0=
=C2=A0=C2=A0 printk(KERN_DEBUG &quot;xen_register_pirq start gsi %u trigger=
ing %d set_pirq %d\n&quot;, gsi, triggering, set_pirq)<br></div><div><br></=
div><div>And I get=C2=A0 in this printk result for IRQ7 : triggering=3D1 wh=
ile it was passed with value 0 in the call !?</div></div></div></blockquote=
><div><br></div><div>Sorry bad format %d instead of %i for triggering ...<b=
r></div></div></div></blockquote><div>=C2=A0</div><div>So I replaced the fo=
rmat with %i and suprise :</div><div><br></div><div>There are 2 calls to=C2=
=A0 xen_register_pirq as I=C2=A0 can see 2 messages per IRQ=C2=A0</div><div=
><br></div><div>=C2=A0the first call is=C2=A0 right after the message &quot=
;NR_IRQS: ...&quot;from=C2=A0 early_irq_init()=C2=A0=C2=A0 ( kernel/irq/irq=
dec.c )</div><div><br></div><div>=C2=A0I see : <br></div><div>xen_register_=
pirq start gsi 7 triggering 1 set_pirq 1=C2=A0=C2=A0 ... so in xen_register=
_pirq()</div><div>Then I get the message &quot;Before PHYSDEVOPS_setup_gsi)=
 proving we are called by xen_register_gsi()</div><div><br></div><div>Then =
right after the message &quot;ACPI: 26 ACPI AML tables successfully acquire=
d and loaded&quot; <br></div><div><br></div><div>I get again, but with reve=
rsed triggering :</div><div> xen: registering gsi 7 triggering 0 polarity 1=
</div><div><div>xen_register_pirq start gsi 7 triggering 0 set_pirq 1</div>=
<div>Before PHYSDEVOPS_setup_gsi ...<br></div><div><br></div><div>So once a=
gain a call to=C2=A0 xen_register_gsi()</div></div></div></div></blockquote=
><div><br></div><div>I had to triple check:</div><div><br></div><div>The fi=
rst call is from xen_register_pirq()=C2=A0 and seem to originate from early=
_irq_init()=C2=A0 : triggering is 1</div><div>in this first call the HYPERV=
ISOR_physdev_ops is called with triggering 1 shareable 0<br></div><div><br>=
</div><div>The second call is from xen_register_pirq() called from xen_regi=
ster_gsi() :</div><div>=C2=A0 trigger=3D0 polarity 1 at the start of=C2=A0 =
xen_register_pirq()</div><div>but then  trigger=3D1 polarity=3D1 just befor=
e the call to PHYSDEVOPS_setup_gsi <br></div><div><br></div><br></div></div=
>

--00000000000043b092060ce5fd8e--

