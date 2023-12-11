Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5BF80CE25
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652227.1017983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCh6j-00010y-8F; Mon, 11 Dec 2023 14:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652227.1017983; Mon, 11 Dec 2023 14:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCh6j-0000yh-5h; Mon, 11 Dec 2023 14:18:05 +0000
Received: by outflank-mailman (input) for mailman id 652227;
 Mon, 11 Dec 2023 14:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+mB3=HW=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rCh6h-0000yb-Sg
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:18:03 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17d0c797-9830-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 15:18:02 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-286867cac72so2744132a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 06:18:02 -0800 (PST)
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
X-Inumbo-ID: 17d0c797-9830-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702304281; x=1702909081; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDC1EKuqWIHaXEp62zYsedlm2GsxzaijNEZ9jSbvxNM=;
        b=WFGIft+DBTdlE9WksKbVe7fBLvBNm2oFQxOK0ikZTuq5iqLMxvD5AxkGZe7afzKtM/
         FBLOIeV2gKMsMW0eZnNLNH9avWJCT23y/qkrmXAsYt0EFuhq2zOSYwZIRe1ASH5Mu2To
         c/KxObpyFnZy+F6+Mhne6auHRYL11GkMMuAn39QUKMoVHOLMW+FPxztPAXmyA1etHJvD
         ySSoWuEKoMpVxiEF9e79pPK8FelPmLDCT1riAoDPD9pzuqneB1zIvwVpKJ4x03x4J8tO
         sz9S9edNfiVpq3q1Asp9wnzRJrmNkiz/LCYgs971DAZGvfulYP9pRl5+AeiYJwSE9pff
         wYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702304281; x=1702909081;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDC1EKuqWIHaXEp62zYsedlm2GsxzaijNEZ9jSbvxNM=;
        b=lExDpbIgC9T+qno3vuwqlCFTmgMPLeF+kLA1DsEeBfHFbjlCcw7fc0H9gEOWaFf04N
         bZ7Wle9iQo9IQAVCD6LjEJTdSegF0W4LrdqmUwj3gCkrDPVgVCvKWvXymPePVWdQeLBS
         DMwxlrn9+lA39UK3bS6DLbUO/LHRqi/Ds/l9Lx5KnkyqnVhuekhdAHENTDOu6iQErNc3
         y2w1/uEAMJpG8iYosl3kVa8RmWoMrTxHOG95sZqVs8KiyubNblAWqinri5cS2Q0e6s95
         OtwItfaiHWkhwQeio+6gGTjPRBPjHsT1A1HrmHx4D8+Xx+nkJx6tq5NGQlMwGNNOsRCo
         wIKA==
X-Gm-Message-State: AOJu0Yyspu5RQTSnCjIKJaTHB1K5vD6gqIwBY08Ga/q7WNkNkDDXWn1g
	6RQf9q99wMmpwIGKviFx64vtYa3U2bMoNpDOYCzFXcUuOiE=
X-Google-Smtp-Source: AGHT+IF+MzBDhxWy+6HJuoblyLIDdDzQtBrMvEuwI7GVBsmoPyeKRfBb29rETEy7zoLrOXCliQbjEYC0lEPF/UCy57I=
X-Received: by 2002:a17:90a:d3d0:b0:28a:3526:a3ff with SMTP id
 d16-20020a17090ad3d000b0028a3526a3ffmr1623313pjw.53.1702304281060; Mon, 11
 Dec 2023 06:18:01 -0800 (PST)
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
Date: Mon, 11 Dec 2023 15:17:50 +0100
Message-ID: <CAKm-UmaNnFFrdDp+dknjnxsFSgPdn+BhmkZ-S3bZAEE8-FccLQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 11 d=C3=A9c. 2023 =C3=A0 12:27, Jan Beulich <jbeulich@suse.com> a =
=C3=A9crit :
>
> On 11.12.2023 12:09, S=C3=A9bastien Chaumat wrote:
> > Le lun. 11 d=C3=A9c. 2023 =C3=A0 10:18, S=C3=A9bastien Chaumat <euidzer=
o@gmail.com> a =C3=A9crit :
> >>
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

Tried 4.17.3-pre : no change
How would you check (a) and (b) exactly (I need technical directions here)?

Any way to force IRQ7 to ioapic-level to test the hypothesis ?

Thanks
S=C3=A9bastien

