Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5FA6B804
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923784.1327211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ0C-0005Ni-El; Fri, 21 Mar 2025 09:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923784.1327211; Fri, 21 Mar 2025 09:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ0C-0005LX-Bf; Fri, 21 Mar 2025 09:49:20 +0000
Received: by outflank-mailman (input) for mailman id 923784;
 Fri, 21 Mar 2025 09:49:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9U11=WI=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvZ0B-0004IO-NA
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:49:19 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c243c315-0639-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:49:19 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so2077114e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 02:49:19 -0700 (PDT)
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
X-Inumbo-ID: c243c315-0639-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550559; x=1743155359; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ACupALywUseBsHeF2Hq+Ivua14XRGKMAwqZyX42JX8=;
        b=Z3VaurWzkXul3Dx/UCLZE2Yr9aSNx/ETpsNAkVcDqBhqehlw73qox4tjXD0oaMnUPR
         kPTi9Fyecv/CtU8GkskuvvzH/cOylLbJ3jgcsWHX8F6a5P0q8BZdw6ag1Wo7ge+wMyuV
         dFyQFXRqFR5syNCv8wcSiZepFIDXhF8dyR/OQEzrQU8mQdiUVHVi1FlkqtfTQiniq1yz
         Sv6ifmqO0VnCyUmU9zuK6G5111JIkmSaMU98k4puE9+OWkue8MgO2B3rrDbkH9Dl0N3Q
         Pfmb+S63rLXY1wsdbjy3vJwtHVA6J/dRtL4bAzc/L/de7fnnwww0spzZOvmnUjGakpRv
         DLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550559; x=1743155359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ACupALywUseBsHeF2Hq+Ivua14XRGKMAwqZyX42JX8=;
        b=lj/POK3V+b48YUw+8eJNO2gyrqA84MP3qUAU7vjzwHDuN8YXfd2Ke2CtwKNQhK0g6u
         jSAfeaDUZ3koD47cXH4a0KMe0PI+2UcHR41QoNP3SimC8p71993z+Gi4BthDtO2FaOWA
         0oZwFsijO9aGmmyEcNXIZDxP7fU14Iv1eY/Ah/HqMTRgkXn1lYVJU/WVnHYFbgqE7U5f
         oUMkv/HDz+qq8fYzt/oeLRgm2nAsgMsi5mEnsNg9jY0G2pPt9WlsXjJOtcX0JyV+p3MB
         KWi4qmlttmj3m0YmUnHC2xj8GJuEy2GFFxZAt1dH2HqBULTYuJoQDmlL9pZI6Fzb2Sar
         yylg==
X-Forwarded-Encrypted: i=1; AJvYcCUd2OpK24MxZd4Ji/bId7pA8FpmnkRY9aD390A6JmAV3VWtsLypzDv2j/SEZgytAoQi61VaOteh4fE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzImceZSpZRAcj0XcdgZ62JIWVUGqU7FWDifpmEHvplnnpW163J
	sLNCKEWlFcJnjptpYYvG5VcTknJcLFRJdKRu97YO4e7JqbVXEetPjcB9Mjmnx9WOvS10soBlnIo
	ss5y2OsGMcpv/pg+3HwpX36cH7EU=
X-Gm-Gg: ASbGncu4ngS31Pd/IP1zqSGm296J438HS2yTZP16M/1qtCQrPwM6549L3pDTNkinzT/
	/lKZBrXm//+3f8lYyWorf26TvcxQx+rdJs/4nesKD0sgssW3xRwHp04F6/E1srLYusZyYYHzEpn
	TEjJJdAV2RHTRXe5ovonTkrKwteVeOP0TpHSg=
X-Google-Smtp-Source: AGHT+IFdhkKssNLXt3E846jLG95AlXw/K3rdPVfhDdgQPYRkzjWh/1rHBK2VJUzFRNgUUgJMm/scWC55fP6d2lsrjwI=
X-Received: by 2002:a05:6512:158e:b0:545:2a69:b1f4 with SMTP id
 2adb3069b0e04-54ad64a6d55mr789930e87.29.1742550558264; Fri, 21 Mar 2025
 02:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
 <6eddbd26-88ca-4d0c-b56a-4e7abcc3933b@suse.com>
In-Reply-To: <6eddbd26-88ca-4d0c-b56a-4e7abcc3933b@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Mar 2025 11:49:06 +0200
X-Gm-Features: AQ5f1JpzE7ahBrWsSPWAPfw_QfVgyUgIdxLnIMpXbUFmQcrslcT_foJOmfL3vwY
Message-ID: <CAGeoDV_AU+UhkH6Pb4UhM-j+Z-VSbaoGDAg6gZqVjSAUSGURUQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 13, 2025 at 5:37=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 05.03.2025 10:11, Mykola Kvach wrote:
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
> >  config ARM32_HARDEN_BRANCH_PREDICTOR
> >      def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
> >
> > +config SYSTEM_SUSPEND
> > +     bool "System suspend support"
> > +     default y
> > +     depends on ARM_64
> > +     help
> > +       This option enables the system suspend support. This is the
> > +       mechanism that allows the system to be suspended to RAM and
> > +       later resumed.
> > +
> > +       If unsure, say Y.
>
> I wonder if something like this makes sense to place in an arch-specific

Maybe it makes sense, but only if we are not planning to cover
suspend/resume related code for x86 as well.

> Kconfig. It's also not becoming clear here why only Arm64 would permit it=
.

If I understand your comment correctly, you=E2=80=99re suggesting that we
could use this for x86 as well. However, in that case, we would need
to make a lot of changes in other places that are not related to this
patch series, which is specifically focused on adding suspend/resume
support for Arm64. I believe that is outside the scope of this patch
series. However, this config was requested in one of the previous
patch series. The primary reason for adding this config was to reduce
the binary size for platforms where it isn=E2=80=99t used. I also think it =
can
be useful for debugging purposes, such as for identifying regressions.

As for Arm32, it=E2=80=99s not supported at the moment, but I hope support
will be added in the future.

>
> Jan

Best regards,
Mykola

