Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1636FF551
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533453.830143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7l3-0000M6-5O; Thu, 11 May 2023 14:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533453.830143; Thu, 11 May 2023 14:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7l3-0000JO-2N; Thu, 11 May 2023 14:59:05 +0000
Received: by outflank-mailman (input) for mailman id 533453;
 Thu, 11 May 2023 14:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1K6=BA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1px7l1-0000JI-FN
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:59:03 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d407e9d-f00c-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 16:59:01 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96652cb7673so885294766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 07:59:01 -0700 (PDT)
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
X-Inumbo-ID: 5d407e9d-f00c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683817141; x=1686409141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDMPMJLrsM9dVLuvF/W0GQkxoJ6OcetP9YejMWwb9DM=;
        b=SahRhICcgTdz2iH+MvUCpagW9qlLlK5MQYaK7tvh0/qSt/wMBbPDaoEFD4DZasGhEq
         JmC52cmT1I97tpuEjEvMq8GRlRigmo5ElGizm9NWPqeyDJPPeHmnl9PoafJYNHOm7tmN
         nqQTB+A0tZ3+nnwGt0aYMdUWI3IZsfBA+LBr6/7Zs9DJyeoX/WiaHOoRiAEeqogEYNJl
         ayhuRtXfdb/iSbm07gY17v91xMjDAMOQRD3zkialvuugHfH92HhXpEWz0wxpIN7FyJjr
         w49x6rR+afGMM21Bp9WMTIV8sZDC8X/rQxjn9m0HCaSRuuVF2Cn6b6H4BEjkYEnDsOAl
         i+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683817141; x=1686409141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDMPMJLrsM9dVLuvF/W0GQkxoJ6OcetP9YejMWwb9DM=;
        b=XZVcMtbbYUf3Rv04G19iLQm5fPxq/LoRNsd6xcpTaGfXOqjPGcmriIiRq4N7SoCzET
         j5aO0aUJ4QIhh3qH2ZWXhw9bJmivEyssdQCqheI/VAK1qzSqmbTvne5P5IltaiA3KWEU
         gSYrWDqNMGREmO4emFwBY3bK0DuKIvRYSev0aUEl2LA0HJoM6QDbS0vm8t2ANdPq1wmF
         KOok1x7MiCN87pWjwbAA8M444zPFNh7fOjzRCE8GNR4x+Sz9YNEhLe05lsIZliJHx/Rg
         gvqwpSyMX3RYxm6hkVTCXnyN7abMX1tSp0MFKOJbhKyW3vw/5fQehYRqM8r1v3olNlwv
         7Xpw==
X-Gm-Message-State: AC+VfDyeSlMvvR5nDWgEzU6Ag4E/2JGDpxjaw0vlIdEV3w+Eqt7VpnGX
	tQ5NdaPuVD6fnjDqETgFUp/74elyf71KBDlDBcz4BONC
X-Google-Smtp-Source: ACHHUZ6MEXYm1d/rqgGP714Op3jMHhrLC2mdRPND2zjqt20YVjgq3sESHSGBXfn/pcpkV0BytDZ4EQAHq9OyqwKM31o=
X-Received: by 2002:a17:906:db0e:b0:96a:8412:a444 with SMTP id
 xj14-20020a170906db0e00b0096a8412a444mr822479ejb.73.1683817140791; Thu, 11
 May 2023 07:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 May 2023 10:58:48 -0400
Message-ID: <CAKf6xpspPdt6mM4MuL2-vwXHu23ahm874e4kZqROqCwC4cd=fA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 5:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On older systems, XHCI xcap had a layout that no other (interesting) regi=
sters
> were placed on the same page as the debug capability, so Linux was fine w=
ith
> making the whole page R/O. But at least on Tiger Lake and Alder Lake, Lin=
ux
> needs to write to some other registers on the same page too.
>
> Add a generic API for making just parts of an MMIO page R/O and use it to=
 fix
> USB3 console with share=3Dyes or share=3Dhwdom options. More details in c=
ommit
> messages.
>
> Marek Marczykowski-G=C3=B3recki (2):
>   x86/mm: add API for marking only part of a MMIO page read only
>   drivers/char: Use sub-page ro API to make just xhci dbc cap RO

Series:
Tested-by: Jason Andryuk <jandryuk@gmail.com>

I had the issue with a 10th Gen, Comet Lake, laptop.  With an HVM
usbvm with dbgp=3Dxhci,share=3D1, Xen crashed the domain because of:
(XEN) d1v0 EPT violation 0xdaa (-w-/r-x) gpa 0x000000f1008470 mfn 0xcc328 t=
ype 5

The BAR is mfn 0xcc320-0xcc32f

Booting PV, it faulted at drivers/usb/host/pci-quirks.c:1170 which looks to=
 be:
```
/* Disable any BIOS SMIs and clear all SMI events*/
writel(val, base + ext_cap_offset + XHCI_LEGACY_CONTROL_OFFSET);
```

Thanks for integrating XUE, Marek!

Regards,
Jason

