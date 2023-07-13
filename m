Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E41751BEE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 10:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563019.879896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJruv-0006Hu-RF; Thu, 13 Jul 2023 08:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563019.879896; Thu, 13 Jul 2023 08:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJruv-0006FS-OU; Thu, 13 Jul 2023 08:43:17 +0000
Received: by outflank-mailman (input) for mailman id 563019;
 Thu, 13 Jul 2023 08:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZvnF=C7=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1qJrut-0006FM-J4
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 08:43:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e05aa37-2159-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 10:43:14 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-993a37b79e2so77951266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 01:43:14 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cd26-20020a170906b35a00b009929c39d5c4sm3682659ejb.36.2023.07.13.01.43.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jul 2023 01:43:13 -0700 (PDT)
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
X-Inumbo-ID: 4e05aa37-2159-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689237793; x=1691829793;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd4So+ud0W3G2H0jXSJDsrDV60FvjWe7/Kq5sWGCO44=;
        b=AvKvhjrdDcPOagBfUHANws+zB3BDy7ObiUWv5S8EJML2iP85bW/TOWZl8SGa8a3LfZ
         b82KbpYdrRTHOiVXkigutBJQUUx1yM7uann9J/BSRV7GiW9CEtP7C/KdlsiSDVrsU7iz
         iCQAmyvEG3Aid1b+Wi4XpD0UljthfbAH4PpcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689237793; x=1691829793;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dd4So+ud0W3G2H0jXSJDsrDV60FvjWe7/Kq5sWGCO44=;
        b=XzvD5m0PJq3N9Xi90o/62ZKYVs3Nq/tDZhhP/Qq1F7B49y8z2xSJ9JFgZ5PavlW3Ki
         uJVHaiG90hg/1VyCmb1AZWcpimbxRk3qsiYvaHarE2zOtdwLmiD/Phff7NivDzw9CBD7
         Q1AATeiFjHPg19y3qs5DTES3JqsHPUnCAyjdQ5TdIIGLDLal6CprmJjYNPnKajb7UNah
         mM23sSDTIsqj42Xiw8hMM4XazWPSbFW2i4ypYPXfHlM/aUbnRPVPntaXcqWuHyCHmVan
         Ghj4TB7o3+UegV9lgtmoGk9KT0PTaKgIzONZlCwtoNi0RYUy20ikqdA+65qjUoECDp03
         N6OQ==
X-Gm-Message-State: ABy/qLYKRpPrHLNxuyPIqB0vgEPsoSmcCu9lEUWBAWf+IGrpm8fRIig5
	FeyWuRwZt7Vi3o7/VlGFd6ngvw==
X-Google-Smtp-Source: APBJJlGu5GsdVUCQZ22Fu9xArfZ9UNN5ewwVWFMDZLdIXxHer+riKWKb9HChJjqO2OHnErKNAS1l+w==
X-Received: by 2002:a17:907:2093:b0:991:b2a2:e424 with SMTP id pv19-20020a170907209300b00991b2a2e424mr890047ejb.76.1689237793525;
        Thu, 13 Jul 2023 01:43:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] xenctrl_stubs.c: fix NULL dereference
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <3b6374c44ae7e4afce427a9ea852d8d1ebbb42b3.1689236671.git.edwin.torok@cloud.com>
Date: Thu, 13 Jul 2023 09:43:12 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7692393-A65B-4CDB-803B-4F8C135E0341@cloud.com>
References: <3b6374c44ae7e4afce427a9ea852d8d1ebbb42b3.1689236671.git.edwin.torok@cloud.com>
To: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)



> On 13 Jul 2023, at 09:30, Edwin T=C3=B6r=C3=B6k =
<edvin.torok@citrix.com> wrote:
>=20
> From: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>=20
> `Tag_cons` is `0` and is meant to be used as the tag argument for =
`caml_alloc`/`caml_alloc_small`
> when constructing a non-empty list.
> The empty list is `Val_emptylist` instead (which is really just =
`Val_int(0)`).
>=20
> Assigning `0` to a list value like this is equivalent to assigning the =
naked pointer `NULL` to the field.
> Naked pointers are not valid in OCaml 5, however even in OCaml <5.x =
any attempt to iterate on the list will lead to a segfault.
>=20
> The list currently only has an opaque type, so no code would have =
reason to iterate on it currently,
> but we shouldn't construct invalid OCaml values that might lead to a =
crash when exploring the type.
>=20
> `Val_emptylist` is available since OCaml 3.01 as a constant.
>=20
> Fixes: e5ac68a011 ("x86/hvm: Revert per-domain APIC acceleration =
support")
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> ---
> tools/ocaml/libs/xc/xenctrl_stubs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c =
b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index e4d9070f2d..3703f48c74 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -832,7 +832,7 @@ CAMLprim value physinfo_arch_caps(const =
xc_physinfo_t *info)
>=20
> 	tag =3D 1; /* tag x86 */
>=20
> -	arch_obj =3D Tag_cons;
> +	arch_obj =3D Val_emptylist;
>=20
> #endif
>=20
> --=20
> 2.41.0
>=20

Acked-by: Christian Lindig <christian.lindig@cloud.com>


