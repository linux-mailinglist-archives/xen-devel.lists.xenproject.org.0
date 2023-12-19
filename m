Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D208E8194C6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 00:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657260.1026017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFjri-0004f2-KV; Tue, 19 Dec 2023 23:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657260.1026017; Tue, 19 Dec 2023 23:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFjri-0004dE-Gq; Tue, 19 Dec 2023 23:51:10 +0000
Received: by outflank-mailman (input) for mailman id 657260;
 Tue, 19 Dec 2023 23:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gux=H6=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rFjrh-0004d6-0P
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 23:51:09 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78b0bce3-9ec9-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 00:51:05 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d9389583edso912563b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 15:51:05 -0800 (PST)
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
X-Inumbo-ID: 78b0bce3-9ec9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703029864; x=1703634664; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOlV3lmtsyvKskwvu5YDdc6Es9aNmbU8373E0Pmw0Cc=;
        b=Ch1DCSPAO+LkcxuwTYwUKgU/J6Nxc4KmmZx+EMSpJTEyzjVh5FboL7eoUAnZLtIf43
         1EJju76UlSKiEcSCueX31bdzmv+3gurGZvBdiUfEwtz4NmTsncyChRlvTZv66d0OH5qc
         dh3kn6vzAhyWmYfIJkBKddH2qiSgczVpihZn7iLM9KeIPNFMhuQ+/8dsb5QNdJunhpxG
         DUcrXZ0GRhW/01T+c5IHaANYKXvsWq/R++koOmn9WuhJ2qgLVTq0NAw7rTTYC844T406
         w564INY1JsZgolo3PDYZfGZQgzwDhgcNLkKYknVlm0yYB30gKCJCXBOs40gxWKooekLK
         E73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703029864; x=1703634664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOlV3lmtsyvKskwvu5YDdc6Es9aNmbU8373E0Pmw0Cc=;
        b=C5WQAsxjMzPJTPjCcLv62cd99+Z+euQ44ZYfUIMkaEfOUpHLSSHc4ZhUWUqeySKDY1
         lYlp6joaLOsHiVNcz2cFAsrP4TQSBJY4Af5lNbwLzU1Ze5tToNyn231T2yvu5jtOf5wH
         ej3xu9fqjZG6bjPKVZXxh7/ap7/fSjpqDKBhbqqEySt+AfKmnkmvC0uZdmmx8/xUQNUE
         ogqBQ4Cik4mwesJacHZqu9vcbh0CcCtM8aXLcUReYre1dPUETXD0M4Lbn5JExezi/tsj
         RKDQ2lW2i0BS9Ve4xxjNpbberld0b9F87sFzLPJO5GUH7Be3GJAXFEUpXfNGOorWXTeE
         fa/w==
X-Gm-Message-State: AOJu0YwTJ8hjusnWGKs0YkZDj0t0S/Cop5mgLkFtrcxexoW/aHAfL3mo
	dnQRAfJzPwDSUly950lGd+z1s/SfErGffGh0uqBS4sufccZYHw==
X-Google-Smtp-Source: AGHT+IEPUXXEIOtKz2UcerOjHXKcyRT6hMXhSLM6KkwyBRGKwQ/udEfkoKpf6vXHaWjzmKRY3ydlrG7BlLQULGvtIKM=
X-Received: by 2002:aa7:870f:0:b0:6d7:631d:df16 with SMTP id
 b15-20020aa7870f000000b006d7631ddf16mr5113437pfo.17.1703029863836; Tue, 19
 Dec 2023 15:51:03 -0800 (PST)
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
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com> <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
In-Reply-To: <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Wed, 20 Dec 2023 00:50:52 +0100
Message-ID: <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000136f92060ce58a47"

--000000000000136f92060ce58a47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 20 d=C3=A9c. 2023 =C3=A0 00:11, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a
=C3=A9crit :

>
>
> Le mer. 20 d=C3=A9c. 2023 =C3=A0 00:06, S=C3=A9bastien Chaumat <euidzero@=
gmail.com> a
> =C3=A9crit :
>
>>
>>
>> Le mar. 19 d=C3=A9c. 2023 =C3=A0 20:03, S=C3=A9bastien Chaumat <euidzero=
@gmail.com> a
>> =C3=A9crit :
>>
>>> Le mar. 19 d=C3=A9c. 2023 =C3=A0 16:15, S=C3=A9bastien Chaumat <euidzer=
o@gmail.com> a
>>> =C3=A9crit :
>>> >
>>> > I did add an extra printk in PHYSDEVOP_setup_gsi
>>> > so the "first one" is my printk (available in xl dmesg)
>>> > the second message is from xen_register_gsi (from linux kernel)
>>> >
>>> > Le mar. 19 d=C3=A9c. 2023 =C3=A0 14:15, Jan Beulich <jbeulich@suse.co=
m> a =C3=A9crit
>>> :
>>> > >
>>> > > On 18.12.2023 17:21, S=C3=A9bastien Chaumat wrote:
>>> > > >>>>> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
>>> > > >>>>>>> [    2.464598] amd_gpio AMDI0030:00: failed to enable
>>> wake-up interrupt
>>> > > >>>>>>
>>> > > >>>>>> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) t=
o
>>> > > >>>>>> ioapic-edge and IRQ9 to ioapic-level ?
>>> > > >>>>>>
>>> > > >>>>>> IR-IO-APIC    7-fasteoi   pinctrl_amd
>>> > > >>>>>> IR-IO-APIC    9-fasteoi   acpi
>>> > > >>>>>>
>>> > > >>>>>> to (xen 4.18.0)
>>> > > >>>>>>
>>> > > >>>>>> xen-pirq     -ioapic-edge  pinctrl_amd
>>> > > >>>>>> xen-pirq     -ioapic-level  acpi
>>> > > >>>>>>
>>> > > >>>>>> ?
>>> > > >>>
>>> > > >
>>> > > >>> This look similar to
>>> > > >>> https://yhbt.net/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t/
>>> > > >>>
>>> > > >>> This issue seems that IRQ 7 (the GPIO controller) is natively
>>> fasteoi
>>> > > >>> (so level type) while in xen it  is mapped to oapic-edge
>>> instead of
>>> > > >>> oapic-level
>>> > > >>> as the SSDT indicates :
>>> > > >>>
>>> > > >>>  Device (GPIO)
>>> > > >>>
>>> > > >>>      {
>>> > > >>>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
>>> > > >>>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
>>> > > >>>          Name (_UID, Zero)  // _UID: Unique ID
>>> > > >>>          Method (_CRS, 0, NotSerialized)  // _CRS: Current
>>> Resource Settings
>>> > > >>>          {
>>> > > >>>              Name (RBUF, ResourceTemplate ()
>>> > > >>>              {
>>> > > >>>                  Interrupt (ResourceConsumer, Level, ActiveLow,
>>> Shared, ,, )
>>> > > >>>                  {
>>> > > >>>                      0x00000007,
>>> > > >>>            }
>>> > > >>> Any idea why ?
>>> > > >>
>>> > > >> Information coming from AML is required to be handed down by Dom=
0
>>> to Xen.
>>> > > >> May want checking that (a) Dom0 properly does so and (b) Xen
>>> doesn't screw
>>> > > >> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if
>>> this is
>>> > > >> specific to it being IRQ7 which GPIO uses, as at the (master) PI=
C
>>> IRQ7 is
>>> > > >> also the spurious vector. You may want to retry with the tip of
>>> the 4.17
>>> > > >> branch (soon to become 4.17.3) - while it doesn't look very
>>> likely to me
>>> > > >> that recent backports there were related, it may still be that
>>> they make
>>> > > >> a difference.
>>> > > >>
>>> > > >
>>> > > > testing with 4.17.3:
>>> > > >
>>> > > > Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)
>>> that
>>> > > > (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1
>>> polarity: 1
>>> > > >
>>> > > > but later on in dmesg I see :
>>> > > > [    1.747958] xen: registering gsi 7 triggering 0 polarity 1
>>> > >
>>> > > Linux has exactly one place where this message is logged from, and
>>> that's
>>> > > ahead of it calling PHYSDEVOP_setup_gsi. Since you said "later", ca=
n
>>> you
>>> > > confirm that actually you see two instances of the Xen message and
>>> two
>>> > > instances of the Linux one (each of them with respectively matching
>>> > > trigger and polarity values)? Or are we indeed observing what would
>>> look
>>> > > to be corruption of a hypercall argument?
>>> > >
>>> > > If there were two calls, it would be important to realize that Xen
>>> will
>>> > > respect only the first one.
>>> > >
>>> > > Jan
>>>
>>> Adding a printk to catch the gsi immediately before the hypercall in
>>> linux/arch/x86/pci/xen.c
>>>
>>> #ifdef CONFIG_XEN_PV_DOM0
>>> static int xen_register_gsi(u32 gsi, int triggering, int polarity)
>>> {
>>> int rc, irq;
>>> struct physdev_setup_gsi setup_gsi;
>>>
>>> if (!xen_pv_domain())
>>> return -1;
>>>
>>> printk(KERN_DEBUG "xen: registering gsi %u triggering %d polarity %d\n"=
,
>>> gsi, triggering, polarity);
>>>
>>
>> there we have :
>>   [    1.848051] xen: registering gsi 7 triggering 0 polarity 1
>>
>> then in the next call :
>>
>> irq =3D xen_register_pirq(gsi, triggering, true);
>>
>>
>>  I added a printk at the very beginning  :
>>
>>   static int xen_register_pirq(u32 gsi, int triggering, bool set_pirq)
>>   {
>>     int rc, pirq =3D -1, irq;
>>     struct physdev_map_pirq map_irq;
>>     int shareable =3D 0;
>>     char *name;
>>
>>     printk(KERN_DEBUG "xen_register_pirq start gsi %u triggering %d
>> set_pirq %d\n", gsi, triggering, set_pirq)
>>
>> And I get  in this printk result for IRQ7 : triggering=3D1 while it was
>> passed with value 0 in the call !?
>>
>
> Sorry bad format %d instead of %i for triggering ...
>

So I replaced the format with %i and suprise :

There are 2 calls to  xen_register_pirq as I  can see 2 messages per IRQ

 the first call is  right after the message "NR_IRQS: ..."from
early_irq_init()   ( kernel/irq/irqdec.c )

 I see :
xen_register_pirq start gsi 7 triggering 1 set_pirq 1   ... so in
xen_register_pirq()
Then I get the message "Before PHYSDEVOPS_setup_gsi) proving we are called
by xen_register_gsi()

Then right after the message "ACPI: 26 ACPI AML tables successfully
acquired and loaded"

I get again, but with reversed triggering :
xen: registering gsi 7 triggering 0 polarity 1
xen_register_pirq start gsi 7 triggering 0 set_pirq 1
Before PHYSDEVOPS_setup_gsi ...

So once again a call to  xen_register_gsi()

--000000000000136f92060ce58a47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 20 d=C3=A9c. 2023 =C3=A0=
=C2=A000:11, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidzero@gmail.co=
m">euidzero@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0mer. 20 d=C3=A9c. 2023 =C3=A0=C2=A000:06, S=C3=A9bastien Chaumat &lt;=
<a href=3D"mailto:euidzero@gmail.com" target=3D"_blank">euidzero@gmail.com<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 19 d=C3=A9c.=
 2023 =C3=A0=C2=A020:03, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidz=
ero@gmail.com" target=3D"_blank">euidzero@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le mar. 19 =
d=C3=A9c. 2023 =C3=A0 16:15, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:e=
uidzero@gmail.com" target=3D"_blank">euidzero@gmail.com</a>&gt; a =C3=A9cri=
t :<br>
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
gain a call to=C2=A0 xen_register_gsi()<div><br></div><div><br></div></div>=
</div><div>=C2=A0<br></div><div><br></div></div></div>

--000000000000136f92060ce58a47--

