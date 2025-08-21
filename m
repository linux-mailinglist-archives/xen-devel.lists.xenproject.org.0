Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AEDB2F771
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 14:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088579.1446319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up412-0000bP-Qq; Thu, 21 Aug 2025 12:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088579.1446319; Thu, 21 Aug 2025 12:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up412-0000ZA-O4; Thu, 21 Aug 2025 12:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1088579;
 Thu, 21 Aug 2025 12:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7HC=3B=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1up411-0000Xs-53
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 12:03:35 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcc149b1-7e86-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 14:03:34 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55cf526f6b5so640918e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 05:03:34 -0700 (PDT)
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
X-Inumbo-ID: dcc149b1-7e86-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755777814; x=1756382614; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpcPNaZFfG+GWbMmu9ekUiC9dR7j3JT6d/C7aJcxbPY=;
        b=OCn861Qxyt76Fk4qTCwUkEP44nczPtYDUDTt86znNg240EYbVjDsBymRonpeegKWqm
         OPkV+SEzIcdIQEWeLT4LdG1tTEYo8Iwr33797JKxsrAbUi1ex05/g59xdZ2zRN142YCH
         rqdzB8qs5+K8h0ScXCywBCroScdWLPN0MK+qXsno985sjYle4JdQeiLHMv7Elw1sFmmF
         g3pzpLGGaZ0mIX6kinMj2eiC2lv0isbzNWQKAUvpd4E9lgiSxbTSyUXPg0/ZjuPiDDku
         6kk5o/9hjcQKQDQa3nKOVhVfjMPPgJsZZDl3yeKIkGFT37hj/j2aizLAxIJnqkA2QyVX
         QmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777814; x=1756382614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpcPNaZFfG+GWbMmu9ekUiC9dR7j3JT6d/C7aJcxbPY=;
        b=J23U9lazQRjcHKGr3ly3dhpcSJdBN78l2eEZ+VwB6iZ2LyvpEIiAd/mJzmlPwDTSJ4
         zXyUV5TkFJlQXIH3vUJ8/+r3p0PQ8D/eKYPP4zKNBAGzZyIiI2KgMqyjBYpIrGJsArBR
         wK0RtFwZCDERK8ZD7MAGut3j99lHxofVWqOUMSEEz6y5GxkuzM0dcJ4WQVZnEZ4RFb4F
         XVe3Y6QGySWl7vbkTss1Pzh9y/zDp9yS6HK0w4A4mtOcPPyXv1CjeKoAmefhGLkrHlvX
         nLZs3kGxUUhWuffHAyd5IWRgZppu/8TVDBeR35SYHElgScCrOlyM1wMN5+i4eTBpvlyb
         Km7g==
X-Gm-Message-State: AOJu0YyisPb1I3P5gZOLFLib2cKuY/6DwnWi9kDrrjTqlysECLJZR9/7
	uR2EewEhtEdzNgS98Ssvw2jEGf5UPGBu1SIFYZ0K8KkqHdcGhBVPQGlMbsgzF0nwLIpnBUjbK0J
	krxfkgD3jkLVWfvHQIWVTh+TVw6UIE1I=
X-Gm-Gg: ASbGncsWt7glmY60uHVEcLPbCUoAyUkfzmtIa+2/BgvjKSScL/+rZzpH8KpXJSo+KuH
	SL6KiL5GtbWbjA+plsc8psuJn7riEVDtTKszKb3fkpmDSoccA+YSWVXHn0fgy9Sv9fmiSphfJI3
	2POBtp6iCSe4EjB5yR6gX4TNf6SlJ401nfrymt9SE+v238aL62I+isVoV8+M4Nh5/ggFmpANDxx
	YJh9aC2Ps9suuML
X-Google-Smtp-Source: AGHT+IFRoSQ78Mw3CqZOMBTcphmwiftjaKFnfiNP8LjzymUZnCzaImk6468iXiUe6nzua8yDPJpXAJ8jdgcZ3jypk5c=
X-Received: by 2002:a05:6512:3096:b0:55e:a69:f4a2 with SMTP id
 2adb3069b0e04-55e0d5487camr799094e87.14.1755777813340; Thu, 21 Aug 2025
 05:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
In-Reply-To: <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 21 Aug 2025 15:03:21 +0300
X-Gm-Features: Ac12FXyizrVcc8K7g3kS8auo0OzE09kEo0TMmvyL7IYzBQDSJwvmCgfiA0El_f4
Message-ID: <CAGeoDV8UBv9g3x_AunwoyZg5eQDWNkCHoXNz2_tJKrJYWeYAWg@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykyta,

On Thu, Aug 21, 2025 at 1:51=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam=
.com> wrote:
>
> With PCI disabled the build fails due to undefined struct
> pci_host_bridge.
>
> Add ifdef guard around pci-host-rcar4.h to not include it when PCI
> support is disabled.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> This patch can be squashed with iommu/ipmmu-vmsa: Implement basic PCIE-IP=
MMU OSID support
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index ea9fa9ddf3..49f149e222 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -51,7 +51,9 @@
>  #include <asm/device.h>
>  #include <asm/io.h>
>  #include <asm/iommu_fwspec.h>
> +#ifdef CONFIG_HAS_PCI
>  #include "../arch/arm/pci/pci-host-rcar4.h"
> +#endif

As far as I know, the IPMMU VMSA driver can also be used on other
R-Car platforms. Is there a chance we could have HAS_PCI enabled
together with IPMMU VMSA, but not be on an R-Car Gen4 platform,
for example, on R-Car3 or possibly some future R-Car variants?

Wouldn't it be better to use:
#ifdef CONFIG_RCAR4
?

>
>  #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
>
> --
> 2.34.1
>

Best regards,
Mykola

