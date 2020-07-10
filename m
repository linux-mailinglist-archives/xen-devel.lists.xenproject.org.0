Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A621B656
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 15:28:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtt3x-0000OX-MA; Fri, 10 Jul 2020 13:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Va4v=AV=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1jtt3w-0000OS-A6
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 13:27:36 +0000
X-Inumbo-ID: 1ddb7158-c2b1-11ea-8496-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ddb7158-c2b1-11ea-8496-bc764e2007e4;
 Fri, 10 Jul 2020 13:27:35 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E59A20836
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2020 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594387655;
 bh=mNW++VsEqP3S7PL2ngGMIOCMSfxmahBdnZ67NyJxUvU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y29NVJdkXAxsgk2xI3t1jiVzttBFvTNx8HCPIKiN8ZM7ftE9wB6zTnP1BMb0MkiHU
 QendZh5SWBTBNOnp2LBOwt7y9i89bCxloiL/H5BpHgUTMz/HsVGIVwSr+QGFlWIjcr
 y7jk4l2N4ARxgyR+SRTlUkcRkdfqRggSEE0L6X1I=
Received: by mail-oi1-f169.google.com with SMTP id l63so4739158oih.13
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2020 06:27:35 -0700 (PDT)
X-Gm-Message-State: AOAM533WdHvvYdKDgRtmdrxPskkqJ1zkSp7Hzq76kYWkxDI3uhzBkBCj
 oBT7j1Chlv7l1U5liEyISN51RFahMdH1g6Yd+aE=
X-Google-Smtp-Source: ABdhPJx27k85cRD5Br4iASr1hfkX2ZBE1Hh91r9eyyCurmoSEz5t5x80h7mauiVvJR80iRujQZjgdIQ5i6DKyNJJWKM=
X-Received: by 2002:aca:d643:: with SMTP id n64mr4195802oig.33.1594387654399; 
 Fri, 10 Jul 2020 06:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
 <CGME20200709091750eucas1p18003b0c8127600369485c62c1e587c22@eucas1p1.samsung.com>
 <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
 <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
In-Reply-To: <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jul 2020 16:27:23 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
Message-ID: <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 10 Jul 2020 at 13:17, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
>
> [ added EFI Maintainer & ML to Cc: ]
>
> Hi,
>
> On 7/9/20 11:17 AM, J=C3=BCrgen Gro=C3=9F wrote:
> > On 28.06.20 10:50, J=C3=BCrgen Gro=C3=9F wrote:
> >> Ping?
> >>
> >> On 10.06.20 16:10, Juergen Gross wrote:
> >>> efifb_probe() will issue an error message in case the kernel is boote=
d
> >>> as Xen dom0 from UEFI as EFI_MEMMAP won't be set in this case. Avoid
> >>> that message by calling efi_mem_desc_lookup() only if EFI_PARAVIRT
> >>> isn't set.
> >>>

Why not test for EFI_MEMMAP instead of EFI_BOOT?


> >>> Fixes: 38ac0287b7f4 ("fbdev/efifb: Honour UEFI memory map attributes =
when mapping the FB")
> >>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>> ---
> >>>   drivers/video/fbdev/efifb.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.=
c
> >>> index 65491ae74808..f5eccd1373e9 100644
> >>> --- a/drivers/video/fbdev/efifb.c
> >>> +++ b/drivers/video/fbdev/efifb.c
> >>> @@ -453,7 +453,7 @@ static int efifb_probe(struct platform_device *de=
v)
> >>>       info->apertures->ranges[0].base =3D efifb_fix.smem_start;
> >>>       info->apertures->ranges[0].size =3D size_remap;
> >>> -    if (efi_enabled(EFI_BOOT) &&
> >>> +    if (efi_enabled(EFI_BOOT) && !efi_enabled(EFI_PARAVIRT) &&
> >>>           !efi_mem_desc_lookup(efifb_fix.smem_start, &md)) {
> >>>           if ((efifb_fix.smem_start + efifb_fix.smem_len) >
> >>>               (md.phys_addr + (md.num_pages << EFI_PAGE_SHIFT))) {
> >>>
> >>
> >
> > In case I see no reaction from the maintainer for another week I'll tak=
e
> > this patch through the Xen tree.
>
> From fbdev POV this change looks fine to me and I'm OK with merging it
> through Xen or EFI tree:
>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics

