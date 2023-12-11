Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A9B80C7B1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 12:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651660.1017446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeA0-0002Ug-9B; Mon, 11 Dec 2023 11:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651660.1017446; Mon, 11 Dec 2023 11:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCeA0-0002RL-5s; Mon, 11 Dec 2023 11:09:16 +0000
Received: by outflank-mailman (input) for mailman id 651660;
 Mon, 11 Dec 2023 11:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+mB3=HW=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rCe9y-0002RF-T6
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 11:09:14 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6f7d425-9815-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 12:09:13 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6cebcf8a48aso3229950b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 03:09:14 -0800 (PST)
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
X-Inumbo-ID: b6f7d425-9815-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702292952; x=1702897752; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqWUTbVxqnt2EnFAgR6jQeIbbhdWdHdB8JaK9SyMKW8=;
        b=KQloFy/jivSFerl5aHHzhyZ0tteNznamnP9I13xeaJAjNk4rXDIK9LVWrC+HbT4CSS
         FuZKq7ObFT5TADegRzu8lVnq3KzvAEjJpD5FKFT5vHSWApb3bn5cRIKV9oKxpI2FJbFv
         af1lbUa0zX8HW1pM9jGsXMc0XZ0vVfDhLlPyNir1apzsIdkaqWKe0qWzOOmAmWwvT+i3
         egShIMg5sGpgr2uZH/mjRjnxCzC541mGvsthOchLxdlwtU76HQttsOxXsJpcjtfJSkt1
         lyWHX3SxcZeEC1Z2XJd5fPKS1zPAgSvl4JAhNqd4vWZGFlI8cFOvwb/bDXxAKd0P6ZrB
         oNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702292952; x=1702897752;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqWUTbVxqnt2EnFAgR6jQeIbbhdWdHdB8JaK9SyMKW8=;
        b=JmFVcS+HGEbVHvEVsUt5P6uzR3MZiocWnCKxHCcyqeGq3regK3VOFKUonNbOuDZ3nX
         umgon4Ah9adPrcglFL6jM/vJpdxJ42PyT0F2BHH7e5cF1mXl1j6Iax6HKIk5QMiheYhC
         sDu5JlI+EikMdTkW3jgidTyUTbdaS0yRgb0vZvh+7cA8sEwaD8Gjgv/iGbgpSDmz7rUh
         4/GcITyhTfUm91G7pn1/wt0A7BWAE6zAdk42vfjOilVSVfYkrcI2CGDabX1R7X3vgzsO
         FAMbnWO8y5q5Ek0Vr4QQkBXk7juhKt3pUTXnHDMKj1RROFvXXWzbwVDJfgbpqNPoW80u
         FtOg==
X-Gm-Message-State: AOJu0YxZpObKwaFvUCSGqNSKlZFgtui3FDBYlrXqvFsTd9AUCfDcowIL
	Y50Y8x+sv9zaPHTE4I5rrWdPqnewXITOzXnjXmu13zymWSo=
X-Google-Smtp-Source: AGHT+IHD6vwINitRzAVPUQ8shMq+5qXsJxiu0GGwUpYyUUb03OLWPkmnll3jpPBjwn5wVogdYIAIL2RImBH6xpqwTkc=
X-Received: by 2002:a05:6a00:aca:b0:6ce:55d1:8b70 with SMTP id
 c10-20020a056a000aca00b006ce55d18b70mr4167132pfl.44.1702292952031; Mon, 11
 Dec 2023 03:09:12 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com> <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com> <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
In-Reply-To: <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 11 Dec 2023 12:09:00 +0100
Message-ID: <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 11 d=C3=A9c. 2023 =C3=A0 10:18, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a =C3=A9crit :
>
> > On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
> > >> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interr=
upt
> > >
> > > Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
> > > ioapic-edge and IRQ9 to ioapic-level ?
> > >
> > > IR-IO-APIC    7-fasteoi   pinctrl_amd
> > > IR-IO-APIC    9-fasteoi   acpi
> > >
> > > to (xen 4.18.0)
> > >
> > > xen-pirq     -ioapic-edge  pinctrl_amd
> > > xen-pirq     -ioapic-level  acpi
> > >
> > > ?

This look similar to
https://yhbt.net/lore/all/20201006044941.fdjsp346kc5thyzy@Rk/t/

This issue seems that IRQ 7 (the GPIO controller) is natively fasteoi
(so level type) while in xen it  is mapped to oapic-edge  instead of
oapic-level
as the SSDT indicates :

 Device (GPIO)

     {
         Name (_HID, "AMDI0030")  // _HID: Hardware ID
         Name (_CID, "AMDI0030")  // _CID: Compatible ID
         Name (_UID, Zero)  // _UID: Unique ID
         Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Setting=
s
         {
             Name (RBUF, ResourceTemplate ()
             {
                 Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, =
)
                 {
                     0x00000007,
           }
Any idea why ?

S=C3=A9bastien

