Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0C818AFB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656973.1025524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbpQ-0006zd-RA; Tue, 19 Dec 2023 15:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656973.1025524; Tue, 19 Dec 2023 15:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbpQ-0006xX-NF; Tue, 19 Dec 2023 15:16:16 +0000
Received: by outflank-mailman (input) for mailman id 656973;
 Tue, 19 Dec 2023 15:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gux=H6=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rFbpP-0006wg-J2
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 15:16:15 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a67b503-9e81-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 16:16:11 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d93278bfbeso549547b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 07:16:11 -0800 (PST)
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
X-Inumbo-ID: 8a67b503-9e81-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702998970; x=1703603770; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJbi/NwTRoo2zXs/3L/UP4VYUSrnHOMtCXpuBqmbNH4=;
        b=nENH5XAwg8HzEEVnu9sZseKiSjtXWjFvr7shjcu4ySRqjpjkFMcyeMF+mejxXwUfmd
         jD42qh33oWI7O7LFOoH1Axzu79/Z4Yi1dJCqVSBgABcE/XX1dsdv5WNa6Uysag74r1jd
         JrhUtXhGvb3nH9Ag8Ljdr/DfSOY843m9k11Df/sYgtOLiZ4jZGbrtAnvMVfPHLyDWTcw
         ZC7YTEkAyFilly7/bNqeSGlFxr+coTpOqAsCrz0xZwMiYih8jt+wG0Bfy75ugASRHqN8
         IZtjvOVXfTfpyJBT/OJIKCxbaUgYYqSV4cSgQzgrCVE96Qd1UtIEXoifEd6+SXuHUxjy
         xBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998970; x=1703603770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJbi/NwTRoo2zXs/3L/UP4VYUSrnHOMtCXpuBqmbNH4=;
        b=PIbZ6PnM/BsTKvDtzDt5jW5tOKBo21fFcpxRgzJgp1falYIJkjFvFnJ6F25uQu0PaX
         WymnKDrvpk4HC3/+8mbwQ9KTmWJ4XPpphlST+zvZifM2Zq8QcREGEYM6TKuL19VOlqx5
         bPDQUaeZCQduFwH8kcu3UjPhG9HPoz309m3ry9ZIJuTRngS8V2MkBgWL1aG0uAQtkAYm
         Jc4mjS9hDga7qavE/XgDr+rrcNcUqp6MHNZbFtz91SWM9HiaSxnORu9vx+xnSye4d7Ka
         bOxWnr9PwveTxrpR7K8I5ylyCz/4sWc14YxMtFLy7MLNI2JHdL12/scszaVtO7nEhB+v
         Z4sw==
X-Gm-Message-State: AOJu0YwIUkbg/2j5vTGZiwCpO1jJnFnqspC/gx9dbgPhY6slDI7IndMO
	AHnDJ60WwUMW2OClsZXAMTRb0rj0B0fPpxm62IqgILyUzt7MTQ==
X-Google-Smtp-Source: AGHT+IFaZdM8c6udFnHk8dySLcfBrJGmwiJRqMHxfs4tbeQCJaL4iMUcZM9buxlAiKETkn0EAsYKbRWbSMPjNUMD44Y=
X-Received: by 2002:a05:6a21:a58b:b0:194:b4e1:45c0 with SMTP id
 gd11-20020a056a21a58b00b00194b4e145c0mr552908pzc.52.1702998969669; Tue, 19
 Dec 2023 07:16:09 -0800 (PST)
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
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
In-Reply-To: <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 19 Dec 2023 16:15:58 +0100
Message-ID: <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I did add an extra printk in PHYSDEVOP_setup_gsi
so the "first one" is my printk (available in xl dmesg)
the second message is from xen_register_gsi (from linux kernel)

Le mar. 19 d=C3=A9c. 2023 =C3=A0 14:15, Jan Beulich <jbeulich@suse.com> a =
=C3=A9crit :
>
> On 18.12.2023 17:21, S=C3=A9bastien Chaumat wrote:
> >>>>> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
> >>>>>>> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up int=
errupt
> >>>>>>
> >>>>>> Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
> >>>>>> ioapic-edge and IRQ9 to ioapic-level ?
> >>>>>>
> >>>>>> IR-IO-APIC    7-fasteoi   pinctrl_amd
> >>>>>> IR-IO-APIC    9-fasteoi   acpi
> >>>>>>
> >>>>>> to (xen 4.18.0)
> >>>>>>
> >>>>>> xen-pirq     -ioapic-edge  pinctrl_amd
> >>>>>> xen-pirq     -ioapic-level  acpi
> >>>>>>
> >>>>>> ?
> >>>
> >
> >>> This look similar to
> >>> https://yhbt.net/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t/
> >>>
> >>> This issue seems that IRQ 7 (the GPIO controller) is natively fasteoi
> >>> (so level type) while in xen it  is mapped to oapic-edge  instead of
> >>> oapic-level
> >>> as the SSDT indicates :
> >>>
> >>>  Device (GPIO)
> >>>
> >>>      {
> >>>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
> >>>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
> >>>          Name (_UID, Zero)  // _UID: Unique ID
> >>>          Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource S=
ettings
> >>>          {
> >>>              Name (RBUF, ResourceTemplate ()
> >>>              {
> >>>                  Interrupt (ResourceConsumer, Level, ActiveLow, Share=
d, ,, )
> >>>                  {
> >>>                      0x00000007,
> >>>            }
> >>> Any idea why ?
> >>
> >> Information coming from AML is required to be handed down by Dom0 to X=
en.
> >> May want checking that (a) Dom0 properly does so and (b) Xen doesn't s=
crew
> >> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this i=
s
> >> specific to it being IRQ7 which GPIO uses, as at the (master) PIC IRQ7=
 is
> >> also the spurious vector. You may want to retry with the tip of the 4.=
17
> >> branch (soon to become 4.17.3) - while it doesn't look very likely to =
me
> >> that recent backports there were related, it may still be that they ma=
ke
> >> a difference.
> >>
> >
> > testing with 4.17.3:
> >
> > Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)  that
> > (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 polarity: 1
> >
> > but later on in dmesg I see :
> > [    1.747958] xen: registering gsi 7 triggering 0 polarity 1
>
> Linux has exactly one place where this message is logged from, and that's
> ahead of it calling PHYSDEVOP_setup_gsi. Since you said "later", can you
> confirm that actually you see two instances of the Xen message and two
> instances of the Linux one (each of them with respectively matching
> trigger and polarity values)? Or are we indeed observing what would look
> to be corruption of a hypercall argument?
>
> If there were two calls, it would be important to realize that Xen will
> respect only the first one.
>
> Jan

