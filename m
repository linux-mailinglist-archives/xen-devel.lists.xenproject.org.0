Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE9B2FC9D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088759.1446484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6JP-00046R-Ag; Thu, 21 Aug 2025 14:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088759.1446484; Thu, 21 Aug 2025 14:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6JP-00044N-7G; Thu, 21 Aug 2025 14:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1088759;
 Thu, 21 Aug 2025 14:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7HC=3B=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1up6JN-00044H-TJ
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:30:42 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69e04475-7e9b-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 16:30:41 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55ce510e769so1041954e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 07:30:41 -0700 (PDT)
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
X-Inumbo-ID: 69e04475-7e9b-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755786640; x=1756391440; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKnYYYipaHX8ryBdYTdXFgmXtmZuwnneqTz283SDtzs=;
        b=gfAiERDaKumfFTFJo2yhc0CkLm3dVZYJYJX+jKIsYGepj+VE/g3dbXzUU/hJPj8TW7
         qTHPoDG6nXYS8TixuMoz21A5YisiBOGjgGuQFWt5yR/9px+mAUfPbmzTRClmpvMiPWFM
         eHU854lWOoo7hBTddHU/hpF9+BMZI2M6yOJe20D31pD3Mosib2IGqumf+8UAxaF9r+jG
         vCjEIYyY2eA+8bW9c+WJzDlT2qAHKTqOcjBS7bYAs3Sm1Bc8Yif3jrY3gRkgqLVjuZni
         ML8bGuc/rn5/XHOaQtI2xCiZEsqKTjIBPxjCoH9dqPEb1ho/P5cvPr+3W8rRIE/vXcHs
         peAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755786640; x=1756391440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKnYYYipaHX8ryBdYTdXFgmXtmZuwnneqTz283SDtzs=;
        b=YO+LEh+nCpZsb84q/QIfc7vo+c2z+FxTUYOFEgoEPi1tfsDGCwcddp7RXyI9l0sI9V
         9V7eZnEIvIrH/SdMf7aed5A/80bB3gssrt+bxhrOicsuoEHrNTmHnmDY/oEE7/Dcb4M7
         eawI72HXva8dDelXmzZny/amUXGNDxlD1Ur6z1I6ufWKt0h5qCOU6ECgeLcU+QYLTO6M
         8XgAnkmorOfiO34UIOpXizaGRhRFolldjoQnOPOinzI+rjv1EeoDJadsGDgPfElMTayz
         GGuOayd2T8St+3FnO9Rf/fCdrPYK+oz6six6ShDWU4f/SI/9EQs+biH7Lnn9xHfiW9+f
         3Veg==
X-Gm-Message-State: AOJu0YyuBOAh0DKIgVW9a6rLYsulpdfXF8Bf+KxE43v+T6FoAffA3G1v
	50xzjJL5HDzMRtdBl9h56bjUz5xuV5t9vpcGGjO2p7OGlvSGdTKsYg6MjXxtSpIX3vOz7t4FheC
	qJP2KiWWI4vj3Q7U8B32K+K6Z/XwBda4=
X-Gm-Gg: ASbGncvskIPnnrQaGtoOCPR1n8lderD2K4qAgSvl/9ImMWF6NUDZCeGHlTPQexKesqP
	hWyH6ai4vo6mTyXtvWWC86xDzDBVt/VfdoeMwp2fYwbAnfLw1psnFvZJSCnA7puBS5nFKTK4q+b
	tarOwie0sXlj5YlM0kA6o78wWrrC6snGfYoL9GjOgXnFB3d63GGGWh1tKkA3RTr2perpGQEXhrd
	R4EFm4t0j0DpLW0
X-Google-Smtp-Source: AGHT+IHVUIZSeyt9VddjbtqAdzEGoqG9KAMnId/Ylz697zE2SCCT0pE5EXAN7VuywgvsJxeBf2qliQwS7lydUiGCZlU=
X-Received: by 2002:a05:6512:4603:b0:55b:959e:e3c4 with SMTP id
 2adb3069b0e04-55e0d565868mr664362e87.25.1755786640035; Thu, 21 Aug 2025
 07:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
 <CAGeoDV8UBv9g3x_AunwoyZg5eQDWNkCHoXNz2_tJKrJYWeYAWg@mail.gmail.com> <4e658c8d-3cac-481b-a153-2a8189550a13@epam.com>
In-Reply-To: <4e658c8d-3cac-481b-a153-2a8189550a13@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 21 Aug 2025 17:30:28 +0300
X-Gm-Features: Ac12FXwjXJWlkFOispz7CUG5jG8bkbqp6s6gKo2tD3PibDGfbS3ju_XqxZdAjG0
Message-ID: <CAGeoDV-MJxw48P0M9QbFWcAXgRgdOpyXv9g3vT_GK572J3OE-A@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 4:09=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam=
.com> wrote:
>
> On 21.08.25 15:03, Mykola Kvach wrote:
> > Hi Mykyta,
> >
> > On Thu, Aug 21, 2025 at 1:51=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@=
epam.com> wrote:
> >>
> >> With PCI disabled the build fails due to undefined struct
> >> pci_host_bridge.
> >>
> >> Add ifdef guard around pci-host-rcar4.h to not include it when PCI
> >> support is disabled.
> >>
> >> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> >> ---
> >> This patch can be squashed with iommu/ipmmu-vmsa: Implement basic PCIE=
-IPMMU OSID support
> >> ---
> >>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/pa=
ssthrough/arm/ipmmu-vmsa.c
> >> index ea9fa9ddf3..49f149e222 100644
> >> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> >> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> >> @@ -51,7 +51,9 @@
> >>   #include <asm/device.h>
> >>   #include <asm/io.h>
> >>   #include <asm/iommu_fwspec.h>
> >> +#ifdef CONFIG_HAS_PCI
> >>   #include "../arch/arm/pci/pci-host-rcar4.h"
> >> +#endif
> >
> > As far as I know, the IPMMU VMSA driver can also be used on other
> > R-Car platforms. Is there a chance we could have HAS_PCI enabled
> > together with IPMMU VMSA, but not be on an R-Car Gen4 platform,
> > for example, on R-Car3 or possibly some future R-Car variants?
> >
> > Wouldn't it be better to use:
> > #ifdef CONFIG_RCAR4
> > ?
>
> Gen5 boards will use SMMU, so this will not be applicable to them. In
> any case, checking for RCAR4 will not help here, as PCI can be disabled
> regardless of the platform revision.

I see your point that CONFIG_RCAR4 alone isn=E2=80=99t enough, since PCI ca=
n be disabled
even on Gen4. My concern is that we=E2=80=99re adding Gen4-specific code in=
to a generic
IPMMU VMSA driver, which is used on multiple R-Car generations.

>
> >
> > Best regards,
> > Mykola
>
> --
> Mykyta

