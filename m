Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E048179C8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 19:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656372.1024462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFISp-0006V8-LG; Mon, 18 Dec 2023 18:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656372.1024462; Mon, 18 Dec 2023 18:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFISp-0006TC-IY; Mon, 18 Dec 2023 18:35:39 +0000
Received: by outflank-mailman (input) for mailman id 656372;
 Mon, 18 Dec 2023 18:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=av2Q=H5=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rFISo-0006T6-9Q
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 18:35:38 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b9203ad-9dd4-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 19:35:36 +0100 (CET)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5c701bd9a3cso1568047a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 10:35:36 -0800 (PST)
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
X-Inumbo-ID: 3b9203ad-9dd4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702924534; x=1703529334; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn6B6hMOXJf+0B/gD33Bz73cB5lRhA4B3QCjiMT5Ksk=;
        b=JBvrLSpAVFFpCMhVSPFFHGRT8LsmKd6lvClPd4VFBOlSMdgGmxBxN7N3nu5+lnHlKn
         sru2WedJURvge7yNoNrSg4N/y5FF62pxWjFM4Kv7B3NX060BkTT5KDObCB9tdzQD73KW
         /MylhdQvDsPErUgNKRHzJS9m65TjP440mUzCCNLHScOsUJ7nYjfjLvSDBSZ7lg/wrVWG
         RjI2KyZgX3aGOYWIUEI9qeXAkfbFoI93dphRtGo9Wi7q1inklW4PfUj1XAMfF7QSFDk8
         /lvioQfWW9Uk0S0bOWTxzk+8E9jD0b+h/tmC1Z32gK3A89hmUfyzMc6njLoFm1loHWdS
         o5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702924534; x=1703529334;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn6B6hMOXJf+0B/gD33Bz73cB5lRhA4B3QCjiMT5Ksk=;
        b=Oitf2xrdy63p0IEhhFWRvurKridU0410YjasVYHwU54kFb/j/3NDcZl8Jf3evoRFOr
         7PPvqdI+7/rKz73+KEVs2tCNjmy8cLZZnOnqXAYtNCNgEjkU0boZPMb9qEz8lEzZreDS
         1dSplRDbnb1HGyH5x64bvS0ajPICKd5PtzZbLGeNH/C/N+M/Y9Du3aQYun8zhmXzXqsh
         gyryAgp3Ddd/UpRxeeU5AzG0qG3wfdJF+9dANZk9t0skulIz/Hp/4/qKyDZIYKvTAOEU
         +FR3WMMskiqjZQwLZdpGu+0gCCUC8Jbeb98ezfQ6CB3fbrzXeTBXJmDOhJU+misLF6E5
         B9tw==
X-Gm-Message-State: AOJu0YyKR0wHa33uH9WxJbVH53WSkdvJephX+i/fB7hDe72UjyzYmYgi
	LwcmMmU/MyKm451i1CHhYuuUCIYJZ61VmjVdDSQTk6zLinI=
X-Google-Smtp-Source: AGHT+IG2agZIAKSaKyK4W/Fg9Xpw2lWO2t5Ewjx6sMpmNvryVrdReEQqJ6AXty4AL4bzpSqzwPQy2cgxRFIO7WxJ74g=
X-Received: by 2002:a05:6a20:144d:b0:194:9121:7b9b with SMTP id
 a13-20020a056a20144d00b0019491217b9bmr426637pzi.75.1702924534355; Mon, 18 Dec
 2023 10:35:34 -0800 (PST)
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
 <3aeb708d-a4fa-45b5-9d74-260ef2035b4a@suse.com> <CAKm-UmbFkO5RCDMTEgWBtEYtfO_LH=TKTh5TP=FyFFpdnbto4w@mail.gmail.com>
In-Reply-To: <CAKm-UmbFkO5RCDMTEgWBtEYtfO_LH=TKTh5TP=FyFFpdnbto4w@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 18 Dec 2023 19:35:23 +0100
Message-ID: <CAKm-Uma2concr2qJZNz4fbcRmHviC9dMGT0GpE+vuC+AiuTpdA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 18 d=C3=A9c. 2023 =C3=A0 18:04, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a =C3=A9crit :
>
>
>
> Le lun. 18 d=C3=A9c. 2023, 17:44, Jan Beulich <jbeulich@suse.com> a =C3=
=A9crit :
>>
>> On 18.12.2023 17:21, S=C3=A9bastien Chaumat wrote:
>> >>>>> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
>> >>> This issue seems that IRQ 7 (the GPIO controller) is natively fasteo=
i
>> >>> (so level type) while in xen it  is mapped to oapic-edge  instead of
>> >>> oapic-level
>> >>> as the SSDT indicates :
>> >>>
>> >>>  Device (GPIO)
>> >>>
>> >>>      {
>> >>>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
>> >>>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
>> >>>          Name (_UID, Zero)  // _UID: Unique ID
>> >>>          Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource =
Settings
>> >>>          {
>> >>>              Name (RBUF, ResourceTemplate ()
>> >>>              {
>> >>>                  Interrupt (ResourceConsumer, Level, ActiveLow, Shar=
ed, ,, )
>> >>>                  {
>> >>>                      0x00000007,
>> >>>            }
>> >>> Any idea why ?
>> >>
>> >> Information coming from AML is required to be handed down by Dom0 to =
Xen.
>> >> May want checking that (a) Dom0 properly does so and (b) Xen doesn't =
screw
>> >> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this =
is
>> >> specific to it being IRQ7 which GPIO uses, as at the (master) PIC IRQ=
7 is
>> >> also the spurious vector. You may want to retry with the tip of the 4=
.17
>> >> branch (soon to become 4.17.3) - while it doesn't look very likely to=
 me
>> >> that recent backports there were related, it may still be that they m=
ake
>> >> a difference.
>> >>
>> >
>> > testing with 4.17.3:
>> >
>> > Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)  that
>> > (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 polarity: 1
>> >
>> > but later on in dmesg I see :
>> > [    1.747958] xen: registering gsi 7 triggering 0 polarity 1
>> >
>> > So triggering is flipped from 1 to 0 (cannot find the definition for
>> > those values).
>> > Could this be the culprit ?
>>
>> Possibly. Since it would be the kernel to invoke PHYSDEVOP_setup_gsi, it
>> looks as if the kernel was confused about which trigger mode to use. Hav=
e
>> you figured from where the kernel takes the two different values?
>>
side note : dom0 is PV.

