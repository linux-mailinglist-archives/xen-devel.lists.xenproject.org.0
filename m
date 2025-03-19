Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C0A68E60
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920725.1324809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutz6-0003qC-FU; Wed, 19 Mar 2025 14:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920725.1324809; Wed, 19 Mar 2025 14:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tutz6-0003ok-Bi; Wed, 19 Mar 2025 14:01:28 +0000
Received: by outflank-mailman (input) for mailman id 920725;
 Wed, 19 Mar 2025 14:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUeB=WG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tutz4-0003oe-Gy
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:01:26 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a43b60c2-04ca-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 15:01:23 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so1082152966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:01:23 -0700 (PDT)
Received: from localhost ([46.149.103.11]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149d0b71sm1032673566b.96.2025.03.19.07.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 07:01:16 -0700 (PDT)
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
X-Inumbo-ID: a43b60c2-04ca-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742392883; x=1742997683; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHjHdvWSeNVLU35cX1tzMGQTGNFJS6FxpFOjxKFXJts=;
        b=OJnyMXiZE4cdQxjAvLrvm/Ab1b5CY1XkZr5b8VlzSxJY1eiZn01P701dNwXAubJDoW
         eciu28TDkgY5jhdyacdJDAy2tTNBiY0cctrgtPZajGDY9+R/Qis5PpkQIGMXoUAOvbO2
         WJnv9sKwXEMtBRkVssaals5mxHFhylrjet8x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742392883; x=1742997683;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHjHdvWSeNVLU35cX1tzMGQTGNFJS6FxpFOjxKFXJts=;
        b=MrN/yoN6lAxdDY3NiQZvUW3QNJ8HSnMbo/OWc0Z00HppT1mCCbkRKSL71dJkTDBKII
         F9QgSG7qm5yHW+rnnJ1IDqCt21d+2Z08qAyseqaqChJdVxcoGDjZKWAVyF6cbPbC1Nwe
         kQ71mImk8I/KOb9psWJd8PkuRZxfH75rL42nG9NrBJsr5G8pRf9e/ZKU7puiSrT81tpd
         0Q72qTwaKno9OHGfSNwlN5nTYTmMKp6Z6b5UqPXJprCW8oCFJFugsec7sLDGorQKFJE7
         JYByNqS26dOClLG5tA+QKu8dgxcwzb1g9jwy8txWSapSD0A9MVgi/hVaFy/AnrLPLpda
         l/dg==
X-Forwarded-Encrypted: i=1; AJvYcCVuLTc85DEyZ2saBN8DlaNH308mfhEZo8eHCv4P3peOW2KAVCP5Fy0VTuiBFYmEAkga/lXxqR8Fm54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMyUmSmtSU6lWRkvAiLXGyLZenW8N2XzvievvPZ41ZyHRjb9Ev
	2S5jjtUGe+AtunmvLI+gpxih8tb3J+wfLDvFCzLtJ2m7+OK2xpG2Ehu9YcEmHXs=
X-Gm-Gg: ASbGnctmId2sJYS4fPoFaE7WHek7ZupUt0bE29eNqPobhWDhWsD9H62mPN0Q71UWx69
	wit3AzGAFvvwdM7xwemBBISdg5TzKwwW3vnVTvSFwFxlNJKgQOET6P7sORgGDiYDW7Zkn+F5nkk
	EYutTBCggzHztjBw8YXLabTMVdt07APNy+yEvFnwzKIJY31IjenSoQIJQKIjcOBoR4Zqcfby7Pz
	stmwnZqVkJ4DAJBCuFIbeH3DXW3pJPbjDek9I9PIAiYI/8VXavhIP1ocQrfRsBrxupqhkAXxoah
	5IbWSm110HbNIU3yQWqTD1YDiPsxoxd5pjWxYKL1X8ltyr19TEbcyJeat67O6Q==
X-Google-Smtp-Source: AGHT+IFSUTUf1HR96/Frau5cC+xrCI+xz7fMiPIUOqYbM8ALuEBSTp4LwEl7Zdekvw4AgCG1PTxgNA==
X-Received: by 2002:a17:907:9345:b0:abf:6d24:10bb with SMTP id a640c23a62f3a-ac3b7f4c5bbmr262187166b.44.1742392877067;
        Wed, 19 Mar 2025 07:01:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 14:01:13 +0000
Message-Id: <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Michal Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross"
 <jgross@suse.com>, "Luca Fancellu" <luca.fancellu@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>,
 "Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
X-Mailer: aerc 0.18.2
References: <20250318090013.100823-1-michal.orzel@amd.com>
In-Reply-To: <20250318090013.100823-1-michal.orzel@amd.com>

On Tue Mar 18, 2025 at 9:00 AM GMT, Michal Orzel wrote:
> We are missing a way to detect whether a user provided a value for
> nr_spis equal to 0 or did not provide any value (default is also 0) which
> can cause issues when calculated nr_spis is > 0 and the value from domain
> config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
> (max supported nr of SPIs is 960 anyway).
>
> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_s=
pis value")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  tools/libs/light/libxl_arm.c     | 7 ++++---
>  tools/libs/light/libxl_types.idl | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 2d895408cac3..5bb5bac61def 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>                                        libxl_domain_config *d_config,
>                                        struct xen_domctl_createdomain *co=
nfig)
>  {
> -    uint32_t nr_spis =3D 0;
> +    uint32_t nr_spis =3D 0, cfg_nr_spis =3D d_config->b_info.arch_arm.nr=
_spis;
>      unsigned int i;
>      uint32_t vuart_irq, virtio_irq =3D 0;
>      bool vuart_enabled =3D false, virtio_enabled =3D false;
> @@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
> =20
>      LOG(DEBUG, "Configure the domain");
> =20
> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
> +    /* We use UINT32_MAX to denote if a user provided a value or not */
> +    if ((cfg_nr_spis !=3D UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
>          LOG(ERROR, "Provided nr_spis value is too small (minimum require=
d %u)\n",
>              nr_spis);
>          return ERROR_FAIL;
>      }
> =20
> -    config->arch.nr_spis =3D max(nr_spis, d_config->b_info.arch_arm.nr_s=
pis);
> +    config->arch.nr_spis =3D (cfg_nr_spis !=3D UINT32_MAX) ? cfg_nr_spis=
 : nr_spis;
>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
> =20
>      switch (d_config->b_info.arch_arm.gic_version) {
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index bd4b8721ff19..129c00ce929c 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -723,7 +723,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                 ("vuart", libxl_vuart_type),
>                                 ("sve_vl", libxl_sve_type),
> -                               ("nr_spis", uint32),
> +                               ("nr_spis", uint32, {'init_val': 'UINT32_=
MAX'}),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                                ])),

Doesn't this regenerate the golang bindings?

Cheers,
Alejandro


