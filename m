Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2024B80C450
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651545.1017245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcRF-0004Vb-KT; Mon, 11 Dec 2023 09:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651545.1017245; Mon, 11 Dec 2023 09:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcRF-0004SI-Hg; Mon, 11 Dec 2023 09:18:57 +0000
Received: by outflank-mailman (input) for mailman id 651545;
 Mon, 11 Dec 2023 09:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+mB3=HW=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rCcRE-0004SC-I1
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:18:56 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e4016df-9806-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 10:18:55 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-286f8ee27aeso4400963a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 01:18:55 -0800 (PST)
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
X-Inumbo-ID: 4e4016df-9806-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702286334; x=1702891134; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSwYBvTkR9kGVJprv+MwYGk8eY5xH5gJ1GcpwOFMMo8=;
        b=ETgcS6RnhsnFWEt3c0GYi+IAmoNSOwrJ0o8FunrIJ8vbuUJnRRrB98nnkbIRiLru40
         tl4Lxy5mlqDwDszMhulmiShjZnguIa0b6lG6rke4f8Vu+QbhZxIRxfOhaOTzgATCSfSE
         vdIWpKvHbgBy8BdsL8+xW5pC70nZ9IQUae86Noyw/g3gAEcVzrxG2EyrUYoFpzJfPdB7
         PLn+w4kZqavmsaQ7kSdX/YszPdmQrDuuySnyQHsGK2BpSiG0dELM95e8bYfuPHQZve18
         vZ6eltdfPWzwamdd7CdqrvUarZvTj717SeM8w4YGqSi9M1z4KIpmBiOUQ74JAvdwGoO4
         PAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286334; x=1702891134;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSwYBvTkR9kGVJprv+MwYGk8eY5xH5gJ1GcpwOFMMo8=;
        b=e2tRb6p7cNpf1JvRFViulC4KrU2ddmzyEx8uqEFlQ4dWJWfsM8FE/Mg24D1nqNd9s6
         MofWP7YLgdtiWLAeAzY2KGM//3RLMZxFcr0UoAcFZ1NjsrihTzpMajhqBqYNeQ0zV8um
         wwr+68+IaZBXtOH1F3zf7qVlJ08224Dx1H+Y10Ot4gfSlYSYGB0SuVD9t8HF5jJI2orv
         zlD+acsS0kdRpwVePkafaiMw9+9CzEvcojDHCQO8cQJYDYtMo9OjZvKA8Wewpu6uuK8R
         UsIqBbdFvlzI5kn4eg/FXPejJ+U2P/rNzCop/KKRU400JLw5SKS9I0IJyaOPSqiX9lTw
         8vBQ==
X-Gm-Message-State: AOJu0YxQ2RdbuloVzoX+7uJB0yIK/DdF3mubIJKiM9wgXL8hiShgnOYg
	zH++a55KkOKwehRPXjPcHy9tgXPY0JXztmlhJRv4POeK4bs=
X-Google-Smtp-Source: AGHT+IHEJlU5O/famTcLcLkZ0PQk7PbPCOMB6SGN7O01WKMS5bk+NCm/89ni0wG2GF6vDF6cbjCqyAADuuMKlsOJI4o=
X-Received: by 2002:a17:90a:5904:b0:286:bd98:398f with SMTP id
 k4-20020a17090a590400b00286bd98398fmr3085732pji.1.1702286333580; Mon, 11 Dec
 2023 01:18:53 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com> <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com> <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
In-Reply-To: <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 11 Dec 2023 10:18:42 +0100
Message-ID: <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
> >> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrup=
t
> >
> > Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
> > ioapic-edge and IRQ9 to ioapic-level ?
> >
> > IR-IO-APIC    7-fasteoi   pinctrl_amd
> > IR-IO-APIC    9-fasteoi   acpi
> >
> > to (xen 4.18.0)
> >
> > xen-pirq     -ioapic-edge  pinctrl_amd
> > xen-pirq     -ioapic-level  acpi
> >
> > ?

On the i2c side I managed to isolate the following error with
xen-4.19-unstable and Linux 6.7.0-rc4 :

i2c_designware AMDI0010:00: i2c_dw_handle_tx_abort: slave address not
acknowledged (7bit mode)

Any ideas  ? What kernel debug messages would be useful next ?

Thanks
S=C3=A9bastien

