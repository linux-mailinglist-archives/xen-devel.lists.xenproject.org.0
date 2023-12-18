Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DE8817750
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 17:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656231.1024322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGNN-0000Gb-Vk; Mon, 18 Dec 2023 16:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656231.1024322; Mon, 18 Dec 2023 16:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGNN-0000Du-TB; Mon, 18 Dec 2023 16:21:53 +0000
Received: by outflank-mailman (input) for mailman id 656231;
 Mon, 18 Dec 2023 16:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=av2Q=H5=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rFGNM-0000Cc-P9
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 16:21:52 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c7c54a9-9dc1-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 17:21:51 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3ab37d0d1so6365935ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:21:51 -0800 (PST)
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
X-Inumbo-ID: 8c7c54a9-9dc1-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702916510; x=1703521310; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO5BJ8Rl7yHjsHYoc6CitSVboRJSCi7v7qrAuhJAox4=;
        b=BM8uBR2pd0ywOLHb2VcJY2YsJD5K0I3u3oXuZkr+nf6lzqkOYfO5pynH0MyxJaUUtC
         VUB1U+ojyJvGi2iXzIy/Aqp/PhkVy3nL1QnpigbxiPEzYwn+Ztz8bSw2b96bePFj2NQG
         MJF497igK+eSB95XIZguRX6CEa9omhAS4dA7keDM+/upB/0fVbrfdOGi5kdvYPFdszTE
         ytyAh7VaGynwoAB+lpGyATHOMNEBrMURWDv/T6DfVeseyd7cMaZYjtqVTUVkN25yAKkW
         IyTPRm1waHFLkNsD5p54gBRvuffNkCwCFezFudWbfs/EBNTW35dKAioD2JclDklT9lm6
         rYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916510; x=1703521310;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pO5BJ8Rl7yHjsHYoc6CitSVboRJSCi7v7qrAuhJAox4=;
        b=I5leSP3x+TD56BYWPIqwEWSa0tWDWpRCH0MEnbjjQKAJeP4b5f5lWNRo+K5A+Xn5e2
         AmI7vMNBt13ftu95d/YS+/nXOarKwXkwCp6VuHJrNsjU7arLfBiDhvNDFMj3jsAO8i5n
         PiJiewjSbRuvrDSGQyISmT1atDpbs4uuuc7IhzxvfWRQy1FiI9rpgyuH/bmhw0lpbKYb
         vRbCSwF6b1zigC9em5ZnB0pdciGPpKidxsKsLpRJpLNsveGvhXCKexDby+Vqeczw/kwX
         D2hzgigjn7I5ZRMfvTKIuPSbaP1W19xGG+F2NRTX8S1DY5UuOqQiiuSti1ZNe6+x+kMB
         vMlw==
X-Gm-Message-State: AOJu0Yy6NllSJz1z61GbOxeAqH8lCdlowSOBYa4LaIW15VlBgkxAnNB7
	q8gSVvJ+NzH10qsaYv1sJ10dlJ/ksqtvfErkLyF64Dh9kbqBCw==
X-Google-Smtp-Source: AGHT+IGHLLbJnYxaB3A9BVnhi39RbU3lyGeFn7r2KmJxrh12gUI0TEeuvN0ASp0Wo7oNNth3Iw/XYQzBatvetpTbmNo=
X-Received: by 2002:a17:902:704c:b0:1d0:6ffd:f222 with SMTP id
 h12-20020a170902704c00b001d06ffdf222mr8032883plt.120.1702916509627; Mon, 18
 Dec 2023 08:21:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com> <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com> <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com> <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
In-Reply-To: <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 18 Dec 2023 17:21:38 +0100
Message-ID: <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> >>> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
> >>>>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up inter=
rupt
> >>>>
> >>>> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
> >>>> ioapic-edge and IRQ9 to ioapic-level ?
> >>>>
> >>>> IR-IO-APIC    7-fasteoi   pinctrl_amd
> >>>> IR-IO-APIC    9-fasteoi   acpi
> >>>>
> >>>> to (xen 4.18.0)
> >>>>
> >>>> xen-pirq     -ioapic-edge  pinctrl_amd
> >>>> xen-pirq     -ioapic-level  acpi
> >>>>
> >>>> ?
> >

> > This look similar to
> > https://yhbt.net/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t/
> >
> > This issue seems that IRQ 7 (the GPIO controller) is natively fasteoi
> > (so level type) while in xen it  is mapped to oapic-edge  instead of
> > oapic-level
> > as the SSDT indicates :
> >
> >  Device (GPIO)
> >
> >      {
> >          Name (_HID, "AMDI0030")  // _HID: Hardware ID
> >          Name (_CID, "AMDI0030")  // _CID: Compatible ID
> >          Name (_UID, Zero)  // _UID: Unique ID
> >          Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Set=
tings
> >          {
> >              Name (RBUF, ResourceTemplate ()
> >              {
> >                  Interrupt (ResourceConsumer, Level, ActiveLow, Shared,=
 ,, )
> >                  {
> >                      0x00000007,
> >            }
> > Any idea why ?
>
> Information coming from AML is required to be handed down by Dom0 to Xen.
> May want checking that (a) Dom0 properly does so and (b) Xen doesn't scre=
w
> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this is
> specific to it being IRQ7 which GPIO uses, as at the (master) PIC IRQ7 is
> also the spurious vector. You may want to retry with the tip of the 4.17
> branch (soon to become 4.17.3) - while it doesn't look very likely to me
> that recent backports there were related, it may still be that they make
> a difference.
>

testing with 4.17.3:

Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)  that
(XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 polarity: 1

but later on in dmesg I see :
[    1.747958] xen: registering gsi 7 triggering 0 polarity 1

So triggering is flipped from 1 to 0 (cannot find the definition for
those values).
Could this be the culprit ?

