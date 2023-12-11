Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2080CE3F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652247.1018003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChAg-000692-Vf; Mon, 11 Dec 2023 14:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652247.1018003; Mon, 11 Dec 2023 14:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChAg-00066X-T3; Mon, 11 Dec 2023 14:22:10 +0000
Received: by outflank-mailman (input) for mailman id 652247;
 Mon, 11 Dec 2023 14:22:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+mB3=HW=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rChAf-0005ew-R0
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:22:09 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa0697a0-9830-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 15:22:08 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-28670a7ba84so3319931a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 06:22:08 -0800 (PST)
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
X-Inumbo-ID: aa0697a0-9830-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702304526; x=1702909326; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSTM71cV3A4pGChTBBtrDjdXu84SzGvFlC3R5jF221s=;
        b=QM3Pt9YjcckgPAphybzoABkVEvQrVq+X1V++n/GRtk8ZdEFQ8GbI3tHqJ52ohGHXlu
         O5CSTOCNCRm0SqXKtP9g4Lew8Ia9su/bogWr319IPVM4ntKn4I0iFCH7lRQX+GpmPVWQ
         enWNnr5Fsjb8EDYTF+KdhiCvOsqMbejQjJa+OXKd+5AblS1ANAs7STBAhtn5mpeR1vVm
         O1cpzgnLORapKjjgyRJ5KdRmueHUzSpgJCKUr7DVFYYl4+HpzEALJhe0AXcGMzt7+ld4
         dB9JBaczB5Q6W69fKSv15w75gP0zSpiQj3mqdd0jfHHWnGg3yF5oWi1ti17OYdtHMchm
         KmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702304526; x=1702909326;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSTM71cV3A4pGChTBBtrDjdXu84SzGvFlC3R5jF221s=;
        b=nC7X3uZLm5w/HAL+KiImJUnxJXF9JBJNL6S0ZX2q4aYaKeiI83b7wh7xLI7EoUt2xh
         2CBI95QSSD5M/37gPa4I/K+y5ofYMhAh1ElJjXNjSaxegTAWICqXrFGYeGLCtaw3dYMk
         q3zoZrl67xk5f8V2ZsaHR+iHDuZr5p4AIViq0Be6eXucCT8/ziZI8YzFF3AQRtxcSeJC
         bFZVwYFNfTm+TAq8iLT8oPsYyF00KQEsg0RGniV7K/sPiJyVHn0VVxm7XmyVU8cjoiz5
         OOcE8vNXDerKwFfoI2mnnXsERRf63Hh/RhtmH2x3G1p2PxW34bN6z7PHRaECbwuI+kPm
         B7wA==
X-Gm-Message-State: AOJu0Yz/V4cmvLYJOkwpLI2UW6UdN+gMf8sknVx3+XV0C8CxrE0+fUK4
	3No86QAjyb0vk5eIn93tdgvtE7Sg4CmIB8igdIV9W/df
X-Google-Smtp-Source: AGHT+IEVHzam6pPKxwoyWYKOEBjZMncVi94PGcA+PuWiP+7v0fcMF+RFwIlW6/0dElMp5kOD+6Y2RJX/QnZSfsu+ylo=
X-Received: by 2002:a17:90b:1649:b0:286:6cc0:b916 with SMTP id
 il9-20020a17090b164900b002866cc0b916mr1512086pjb.77.1702304526085; Mon, 11
 Dec 2023 06:22:06 -0800 (PST)
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
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com> <CAKm-UmaNnFFrdDp+dknjnxsFSgPdn+BhmkZ-S3bZAEE8-FccLQ@mail.gmail.com>
In-Reply-To: <CAKm-UmaNnFFrdDp+dknjnxsFSgPdn+BhmkZ-S3bZAEE8-FccLQ@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 11 Dec 2023 15:21:55 +0100
Message-ID: <CAKm-UmbC1eG=cQV28+9x9JwBw-s9veaCDFczuH=NC9YvCY6SgQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> > Information coming from AML is required to be handed down by Dom0 to Xen.
> > May want checking that (a) Dom0 properly does so and (b) Xen doesn't screw
> > up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this is
> > specific to it being IRQ7 which GPIO uses, as at the (master) PIC IRQ7 is
> > also the spurious vector. You may want to retry with the tip of the 4.17
> > branch (soon to become 4.17.3) - while it doesn't look very likely to me
> > that recent backports there were related, it may still be that they make
> > a difference.
>
> Tried 4.17.3-pre : no change
> How would you check (a) and (b) exactly (I need technical directions here)?
>
b) hvm_level=512 ?

