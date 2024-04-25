Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8438B1D25
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 10:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711923.1112279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzurq-00053u-6s; Thu, 25 Apr 2024 08:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711923.1112279; Thu, 25 Apr 2024 08:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzurq-00051a-3Z; Thu, 25 Apr 2024 08:54:10 +0000
Received: by outflank-mailman (input) for mailman id 711923;
 Thu, 25 Apr 2024 08:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZZq=L6=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1rzuro-00050I-7l
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 08:54:08 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f3fc46b-02e1-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 10:54:06 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso75552366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 01:54:06 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 lb12-20020a170906adcc00b00a588d04f28asm2084019ejb.217.2024.04.25.01.54.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2024 01:54:05 -0700 (PDT)
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
X-Inumbo-ID: 5f3fc46b-02e1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714035246; x=1714640046; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/ej5UwkLoNwz8EZ52H89kaBHK0JP/hPFQSa2qQKM1Q=;
        b=ExZrAsYkJxvTgXxgarFOyP8ajnpXKWoa1h4wErj1eyQ9HEEAo1i6ib+U9RRv6nLRJ7
         oV2VEBz16pev/MNZ4FFoZHpWxYwS1vcCCqKIZsvP/bVo8yjCZIivJT8wJqZg89DxvkLf
         sIwvqgeNChavEDkT5qlZHnFavGzMVlM5pS+OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714035246; x=1714640046;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/ej5UwkLoNwz8EZ52H89kaBHK0JP/hPFQSa2qQKM1Q=;
        b=KqxbfLCy49Ep6RK3T7ALCuENccpTJriRxERpkh1Xo9s9tcR930ocpz91QVYO8Ra4Hd
         JrgPZuKyLit1jMfbOihRYSWKZ0c4RYgHzgT67qhwddo97D1cX1cTBy6hLayKy9WX3PQs
         /qCoyFlhgZymLoKYkcR6KY/Qlc9b5L3C8MSDFFCSMsYt1lCq2OunJQaAoAXYurt5q6y6
         2g5p7ILCwEBvGKRm2aBPiolz/PdSVHz7CgNeoqCxSSFQz8xoAPKnkb3audJwDgwAQiCE
         FR78ZwTOSy2XvC9Os0n47vRLic8fl/y/d+Fww7OSp24Eg/UGyntvyVGXjaZAkeW0O4Jc
         LIOQ==
X-Gm-Message-State: AOJu0Ywp8xuFXufr6owLbV2EUzOKGsOkXPWowiEIk2PLDW9ADRF1VmvI
	fHjQd/AAgjIdl3BtScNP7EODSsXXqIZNuAcDOpi5PTbiZeHbXA+Q93hr/Ofy0RE=
X-Google-Smtp-Source: AGHT+IFsi+1l3OjWnGngcb/Go58DJ+KB/RiU6bdQnQmaPGUA7JkDcOBRHz+OvMt9EMqmPkewpA9Yaw==
X-Received: by 2002:a17:906:1d04:b0:a52:3975:6e47 with SMTP id n4-20020a1709061d0400b00a5239756e47mr3164730ejh.34.1714035245648;
        Thu, 25 Apr 2024 01:54:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 4/7] tools/ocaml: Add max_altp2m parameter
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <9e9be821c2fe0ac4a7b66d652c10b2edbf5e42be.1713990376.git.w1benny@gmail.com>
Date: Thu, 25 Apr 2024 09:53:54 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <82FFE0C6-E6CF-4D5D-AF09-3CB61E9034FB@cloud.com>
References: <cover.1713990376.git.w1benny@gmail.com>
 <9e9be821c2fe0ac4a7b66d652c10b2edbf5e42be.1713990376.git.w1benny@gmail.com>
To: =?utf-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 24 Apr 2024, at 21:42, Petr Bene=C5=A1 <w1benny@gmail.com> wrote:
>=20
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>=20
> Allow developers using the OCaml bindings to set the max_altp2m =
parameter.
>=20
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> ---
> tools/ocaml/libs/xc/xenctrl.ml      |  1 +
> tools/ocaml/libs/xc/xenctrl.mli     |  1 +
> tools/ocaml/libs/xc/xenctrl_stubs.c | 17 ++++++++++-------
> 3 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml =
b/tools/ocaml/libs/xc/xenctrl.ml
> index 55923857ec..ed851bb071 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -82,6 +82,7 @@ type domctl_create_config =3D
>     iommu_opts: domain_create_iommu_opts list;
>     max_vcpus: int;
>     max_evtchn_port: int;
> +    max_altp2m: int;
>     max_grant_frames: int;
>     max_maptrack_frames: int;
>     max_grant_version: int;
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli =
b/tools/ocaml/libs/xc/xenctrl.mli
> index 9b4b45db3a..971b269d85 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -74,6 +74,7 @@ type domctl_create_config =3D {
>   iommu_opts: domain_create_iommu_opts list;
>   max_vcpus: int;
>   max_evtchn_port: int;
> +  max_altp2m: int;
>   max_grant_frames: int;
>   max_maptrack_frames: int;
>   max_grant_version: int;
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c =
b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 2b6d3c09df..0b70cc9b08 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -207,12 +207,13 @@ CAMLprim value stub_xc_domain_create(value =
xch_val, value wanted_domid, value co
> #define VAL_IOMMU_OPTS          Field(config, 3)
> #define VAL_MAX_VCPUS           Field(config, 4)
> #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
> -#define VAL_MAX_GRANT_FRAMES    Field(config, 6)
> -#define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
> -#define VAL_MAX_GRANT_VERSION   Field(config, 8)
> -#define VAL_VMTRACE_BUF_KB      Field(config, 9)
> -#define VAL_CPUPOOL_ID          Field(config, 10)
> -#define VAL_ARCH                Field(config, 11)
> +#define VAL_MAX_ALTP2M          Field(config, 6)
> +#define VAL_MAX_GRANT_FRAMES    Field(config, 7)
> +#define VAL_MAX_MAPTRACK_FRAMES Field(config, 8)
> +#define VAL_MAX_GRANT_VERSION   Field(config, 9)
> +#define VAL_VMTRACE_BUF_KB      Field(config, 10)
> +#define VAL_CPUPOOL_ID          Field(config, 11)
> +#define VAL_ARCH                Field(config, 12)
>=20
> uint32_t domid =3D Int_val(wanted_domid);
> uint64_t vmtrace_size =3D Int32_val(VAL_VMTRACE_BUF_KB);
> @@ -226,6 +227,7 @@ CAMLprim value stub_xc_domain_create(value =
xch_val, value wanted_domid, value co
> .ssidref =3D Int32_val(VAL_SSIDREF),
> .max_vcpus =3D Int_val(VAL_MAX_VCPUS),
> .max_evtchn_port =3D Int_val(VAL_MAX_EVTCHN_PORT),
> + .max_altp2m =3D Int_val(VAL_MAX_ALTP2M),
> .max_grant_frames =3D Int_val(VAL_MAX_GRANT_FRAMES),
> .max_maptrack_frames =3D Int_val(VAL_MAX_MAPTRACK_FRAMES),
> .grant_opts =3D
> @@ -257,7 +259,7 @@ CAMLprim value stub_xc_domain_create(value =
xch_val, value wanted_domid, value co
> #if defined(__i386__) || defined(__x86_64__)
>=20
> /* Quick & dirty check for ABI changes. */
> - BUILD_BUG_ON(sizeof(cfg) !=3D 64);
> + BUILD_BUG_ON(sizeof(cfg) !=3D 68);
>=20
>         /* Mnemonics for the named fields inside =
xen_x86_arch_domainconfig */
> #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
> @@ -291,6 +293,7 @@ CAMLprim value stub_xc_domain_create(value =
xch_val, value wanted_domid, value co
> #undef VAL_MAX_GRANT_VERSION
> #undef VAL_MAX_MAPTRACK_FRAMES
> #undef VAL_MAX_GRANT_FRAMES
> +#undef VAL_MAX_ALTP2M
> #undef VAL_MAX_EVTCHN_PORT
> #undef VAL_MAX_VCPUS
> #undef VAL_IOMMU_OPTS
> --=20
> 2.34.1
>=20

This looks correct from an OCaml perspective.

Acked-by: Christian Lindig <christian.lindig@cloud.com>


