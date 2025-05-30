Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB493AC908B
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001172.1381409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL07f-0008Nj-JC; Fri, 30 May 2025 13:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001172.1381409; Fri, 30 May 2025 13:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL07f-0008Ld-GD; Fri, 30 May 2025 13:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1001172;
 Fri, 30 May 2025 13:50:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHdx=YO=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1uL07d-0007IR-TZ
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:50:09 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fda4923a-3d5c-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:50:05 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a374f727dbso1706809f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 06:50:05 -0700 (PDT)
Received: from smtpclient.apple ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe7414fsm4942617f8f.55.2025.05.30.06.50.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 May 2025 06:50:04 -0700 (PDT)
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
X-Inumbo-ID: fda4923a-3d5c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1748613004; x=1749217804; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK2Ed9z4bG2W4/4I+bv1c1mEUgT6EAD8q9y3gJhg3uk=;
        b=HtT/+e01DkMyjWJV5Fc3AvcrFXkcgm5g5MUNCrU2EXqIUB4OtlSzN8fpYOaJck5pal
         wZDcIBpnr5GS+TTKAjbC5p5h1rltku9zomOK7helAO4cQIFcH91nk8rvhn0/xP5KPVdO
         +u0rVvU1XThara5+/g6AKDJhg9vyzvMyY7Mfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748613004; x=1749217804;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qK2Ed9z4bG2W4/4I+bv1c1mEUgT6EAD8q9y3gJhg3uk=;
        b=M4r0UtsuEETc8P3RCsA9IVWLl9H/bN0m/0zjbu2VP5ah5QpKMs0nfmBysv6OXJBITZ
         BEODCoDHdYbDk2EamrqyIFVvOH7Kh/FYDoJkybGHtopclKmC4K4ZaERMqusNJUlvSpWa
         sXGzOt/qplVuWJRSDyZszZj61RHKQQYdLXH4NSkPb6lOLLQtzHvN+3m1wAERTeb9vnMZ
         34y40pObUxdUrgOkF3LGAWwtx3r/ZatmHW3CvNbiPeQvfEPr9sBm82N6q0cMOV5srYV/
         cnI55kVGSaF+9jvuACVvLgClxpaRqeEL/4OukZT02+aqJI3Yw0iWVtNnA8Pchi6woAnr
         IZEQ==
X-Gm-Message-State: AOJu0YwZhZ67SB/mS4tooP2+WHsEkA1oMyWbWXx/fbT/WxhkMuFd2hds
	XY99p6fdqMP1qbCHSt0XdA9K/d88vqyxcC5fJDOYKR31XMO6LqH0gMee+eJRnnTw2TY=
X-Gm-Gg: ASbGncuKiKpiLe2hAgHfDb+S/J2aNJviaJJEqWAdUI12gs2Dcef35XAticUVHz9dCBW
	tzJRbnBADLMl4U/4EF+UKc3gWYpjWzk8XwFmI/XnRNBkOhx6BbjRsc5qEdLi+79kWonPnGRb1T8
	sUkYalq8D4GIpSDbE6q1bC3zJFEfKxnjpwUH85uSRlKax/VEq3Dxj5GRlgwcuRAvyb7d2gBLDQo
	zjl1Mr8CWhWAfumng+47RyEjQrVcDgSguuiroOJN3i+VL6sOL3c27X6P2VKem/ZU/7u6CqJWw29
	kGVYJpRCpxHqp1mM6tTv3Gs0JdARLHRkTjm53W3mRa0dtECSZX13fhxtS+L/okQAvBW625QfPph
	pQWCl
X-Google-Smtp-Source: AGHT+IE6xYFq0XqIerB02BuRQHWvWMJpmkmW6VZv6rhSrvuu1GkD/0S/MLnm/GJOHZc5Rf5xm2MFvw==
X-Received: by 2002:a5d:588d:0:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a4f89df3cdmr1913053f8f.52.1748613004559;
        Fri, 30 May 2025 06:50:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3 4/5] tools/ocaml: Update bindings for
 CDF_TRAP_UNMAPPED_ACCESSES
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20250530134559.1434255-5-edgar.iglesias@gmail.com>
Date: Fri, 30 May 2025 14:49:53 +0100
Cc: xen-devel@lists.xenproject.org,
 sstabellini@kernel.org,
 julien@xen.org,
 bertrand.marquis@arm.com,
 michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3D88307-DF31-42BD-8384-7805B3CF54EB@cloud.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-5-edgar.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

Acked-by: Christian Lindig <christian.lindig@cloud.com>

> On 30 May 2025, at 14:45, Edgar E. Iglesias <edgar.iglesias@gmail.com> =
wrote:
>=20
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>=20
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
> tools/ocaml/libs/xc/xenctrl.ml  | 1 +
> tools/ocaml/libs/xc/xenctrl.mli | 1 +
> 2 files changed, 2 insertions(+)
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml =
b/tools/ocaml/libs/xc/xenctrl.ml
> index 2690f9a923..7e1aabad6c 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -70,6 +70,7 @@ type domain_create_flag =3D
>   | CDF_IOMMU
>   | CDF_NESTED_VIRT
>   | CDF_VPMU
> +  | CDF_TRAP_UNMAPPED_ACCESSES
>=20
> type domain_create_iommu_opts =3D
>   | IOMMU_NO_SHAREPT
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli =
b/tools/ocaml/libs/xc/xenctrl.mli
> index febbe1f6ae..f44dba61ae 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -63,6 +63,7 @@ type domain_create_flag =3D
>   | CDF_IOMMU
>   | CDF_NESTED_VIRT
>   | CDF_VPMU
> +  | CDF_TRAP_UNMAPPED_ACCESSES
>=20
> type domain_create_iommu_opts =3D
>   | IOMMU_NO_SHAREPT
> --=20
> 2.43.0
>=20


