Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6EA819043
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657100.1025793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfNs-0002aM-Qd; Tue, 19 Dec 2023 19:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657100.1025793; Tue, 19 Dec 2023 19:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfNs-0002Xz-Ng; Tue, 19 Dec 2023 19:04:04 +0000
Received: by outflank-mailman (input) for mailman id 657100;
 Tue, 19 Dec 2023 19:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gux=H6=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rFfNr-0002Xr-GU
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:04:03 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ee94286-9ea1-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 20:04:02 +0100 (CET)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5cd51c0e8ebso1986212a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 11:04:02 -0800 (PST)
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
X-Inumbo-ID: 5ee94286-9ea1-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703012641; x=1703617441; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGKpQXs3Zn/mF3/sQ3VghiSbjAohQpUpjF7KF5QizK4=;
        b=VWbOIFMM2U7zLkg/ZzyAqI36EKefJX21B8TnJmNKrYNZGPIEoLo14dfAih38R2mSY4
         cBuuh0wtnlCdR94bdxjMe9Cyq84iF1IvSTEnKedtq0lqaNbWFZVRCDvr8k1Lfz44aJeB
         G/4cMTKjCvj48+/rpd2oU8C7tB0j4haqUS1zzFpddJs0xos9vCKeLXCOEa8FtQSkd1vz
         foTumQ/qHjLm4WT7ndWzvTjDuAyTYRMAPrKDXUVXToNCxyfs8QLJLdM5gw0aSpMsIZGh
         z83xmvip7ggGiYzsWtIu3GfLyJBzTmY2sI6aZ5p+ELnPajHhIfG7EBSSpPlMf8eKRods
         OwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703012641; x=1703617441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGKpQXs3Zn/mF3/sQ3VghiSbjAohQpUpjF7KF5QizK4=;
        b=rHh5wDlqq4vh8+3SFpDUkfx0V6jZuI8OfC0iPSDn11wyeG1Bc7WdoqtW0TwAPDZaC2
         dXdLMqKCiR3mfUEFF8E9o9Igdrrrd2km5vq+rQfm70VhtvK4p/1TIty8m1K9X6ZKhM4T
         u7awyGrrGfiLSew4gM+3RZ5exGS13iNxVHyMXDCWNvXCGRYccH8YYWj3ZiJaqx48AMVc
         /ykf2YDtXNK3/u9JWwzuh4r6MwjhK36utphAJ2eo7NDTM8IVGciY5cI9G+smePKZi5pz
         MQOggpjuLhfTCsTYOyxelq60Mfgk//6EhFgJB3m7x2SI7vhlzcuN35sMVSd3x/TefGSs
         l1Ag==
X-Gm-Message-State: AOJu0YxzAH5ZCOk6bNEQlto6LlzP8Iaiufr4eKDwtWW+PJ0NmuBOED/x
	GxQpxzsB0GVXv3nI2eqlXuBOJpoYhodZ/F6BSFk=
X-Google-Smtp-Source: AGHT+IEXjkXQFodB99YoeGyjivJlGqqzgZichx1o3iosNpcS+MzIoTy6YOd64ZAcJNOhrjhEw8QnwneWdTzIEJGJ/DA=
X-Received: by 2002:a17:90a:ab0a:b0:28a:9748:d7e6 with SMTP id
 m10-20020a17090aab0a00b0028a9748d7e6mr7481826pjq.23.1703012640714; Tue, 19
 Dec 2023 11:04:00 -0800 (PST)
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
In-Reply-To: <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 19 Dec 2023 20:03:49 +0100
Message-ID: <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 19 d=C3=A9c. 2023 =C3=A0 16:15, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a =C3=A9crit :
>
> I did add an extra printk in PHYSDEVOP_setup_gsi
> so the "first one" is my printk (available in xl dmesg)
> the second message is from xen_register_gsi (from linux kernel)
>
> Le mar. 19 d=C3=A9c. 2023 =C3=A0 14:15, Jan Beulich <jbeulich@suse.com> a=
 =C3=A9crit :
> >
> > On 18.12.2023 17:21, S=C3=A9bastien Chaumat wrote:
> > >>>>> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
> > >>>>>>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up i=
nterrupt
> > >>>>>>
> > >>>>>> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
> > >>>>>> ioapic-edge and IRQ9 to ioapic-level ?
> > >>>>>>
> > >>>>>> IR-IO-APIC    7-fasteoi   pinctrl_amd
> > >>>>>> IR-IO-APIC    9-fasteoi   acpi
> > >>>>>>
> > >>>>>> to (xen 4.18.0)
> > >>>>>>
> > >>>>>> xen-pirq     -ioapic-edge  pinctrl_amd
> > >>>>>> xen-pirq     -ioapic-level  acpi
> > >>>>>>
> > >>>>>> ?
> > >>>
> > >
> > >>> This look similar to
> > >>> https://yhbt.net/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t/
> > >>>
> > >>> This issue seems that IRQ 7 (the GPIO controller) is natively faste=
oi
> > >>> (so level type) while in xen it  is mapped to oapic-edge  instead o=
f
> > >>> oapic-level
> > >>> as the SSDT indicates :
> > >>>
> > >>>  Device (GPIO)
> > >>>
> > >>>      {
> > >>>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
> > >>>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
> > >>>          Name (_UID, Zero)  // _UID: Unique ID
> > >>>          Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource=
 Settings
> > >>>          {
> > >>>              Name (RBUF, ResourceTemplate ()
> > >>>              {
> > >>>                  Interrupt (ResourceConsumer, Level, ActiveLow, Sha=
red, ,, )
> > >>>                  {
> > >>>                      0x00000007,
> > >>>            }
> > >>> Any idea why ?
> > >>
> > >> Information coming from AML is required to be handed down by Dom0 to=
 Xen.
> > >> May want checking that (a) Dom0 properly does so and (b) Xen doesn't=
 screw
> > >> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this=
 is
> > >> specific to it being IRQ7 which GPIO uses, as at the (master) PIC IR=
Q7 is
> > >> also the spurious vector. You may want to retry with the tip of the =
4.17
> > >> branch (soon to become 4.17.3) - while it doesn't look very likely t=
o me
> > >> that recent backports there were related, it may still be that they =
make
> > >> a difference.
> > >>
> > >
> > > testing with 4.17.3:
> > >
> > > Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)  that
> > > (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 polarity: =
1
> > >
> > > but later on in dmesg I see :
> > > [    1.747958] xen: registering gsi 7 triggering 0 polarity 1
> >
> > Linux has exactly one place where this message is logged from, and that=
's
> > ahead of it calling PHYSDEVOP_setup_gsi. Since you said "later", can yo=
u
> > confirm that actually you see two instances of the Xen message and two
> > instances of the Linux one (each of them with respectively matching
> > trigger and polarity values)? Or are we indeed observing what would loo=
k
> > to be corruption of a hypercall argument?
> >
> > If there were two calls, it would be important to realize that Xen will
> > respect only the first one.
> >
> > Jan

Adding a printk to catch the gsi immediately before the hypercall in
linux/arch/x86/pci/xen.c

#ifdef CONFIG_XEN_PV_DOM0
static int xen_register_gsi(u32 gsi, int triggering, int polarity)
{
int rc, irq;
struct physdev_setup_gsi setup_gsi;

if (!xen_pv_domain())
return -1;

printk(KERN_DEBUG "xen: registering gsi %u triggering %d polarity %d\n",
gsi, triggering, polarity);

irq =3D xen_register_pirq(gsi, triggering, true);

setup_gsi.gsi =3D gsi;
setup_gsi.triggering =3D (triggering =3D=3D ACPI_EDGE_SENSITIVE ? 0 : 1);
setup_gsi.polarity =3D (polarity =3D=3D ACPI_ACTIVE_HIGH ? 0 : 1);

printk(KERN_INFO "Before PHYSDEVOP_setup_gsi gsi: %d,triggering: %u,
polarity: %u\n", setup_gsi.gsi, setup_gsi.triggering,
setup_gsi.polarity);
rc =3D HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
if (rc =3D=3D -EEXIST)
  printk(KERN_INFO "Already setup the GSI :%d\n", gsi);
else if (rc) {
   printk(KERN_ERR "Failed to setup GSI :%d, err_code:%d\n",
gsi, rc);
}

return irq;
}

I got the following :
[    1.848051] xen: registering gsi 7 triggering 0 polarity 1
[    1.848056] Before PHYSDEVOP_setup_gsi  gsi: 7,triggering: 1, polarity: =
1

So the reversal occurs
there

irq =3D xen_register_pirq(gsi, triggering, true);

Or there :

setup_gsi.gsi =3D gsi;
setup_gsi.triggering =3D (triggering =3D=3D ACPI_EDGE_SENSITIVE ? 0 : 1);
setup_gsi.polarity =3D (polarity =3D=3D ACPI_ACTIVE_HIGH ? 0 : 1);

