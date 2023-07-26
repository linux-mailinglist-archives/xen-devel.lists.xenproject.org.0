Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B958763D01
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 18:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570625.892574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhnK-0002mn-Ci; Wed, 26 Jul 2023 16:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570625.892574; Wed, 26 Jul 2023 16:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOhnK-0002ky-9W; Wed, 26 Jul 2023 16:55:26 +0000
Received: by outflank-mailman (input) for mailman id 570625;
 Wed, 26 Jul 2023 16:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEth=DM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOhnJ-0002kq-6A
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 16:55:25 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36934a24-2bd5-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 18:55:24 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5221e2e69bdso6285284a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 09:55:24 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o17-20020aa7c511000000b0052275deb475sm876803edq.23.2023.07.26.09.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 09:55:23 -0700 (PDT)
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
X-Inumbo-ID: 36934a24-2bd5-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690390523; x=1690995323;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Va8RyAuChcJCgwDXPThjGMYkGClfzUhKnHxi5Ri1rY0=;
        b=RrCvM9MT+3P9K8JTvNHpPIvPRIeh9LNPCif9sISfktEx6inDrceukFmR2JZapNpzOP
         6vdhywVF319EwRuCg7PA/d2tZKbI1EjRVGeWubDLcWS710W8vrvHrgpY3dJgjXqd9Xsg
         6OeiKGx1BCsvq/d0zeMd3S5MASo5pr/j7X9hDKB5V8l4kUp+xUwFw2G+JymdV8MTwTta
         B8qzrR1wtKTtqnc7j2iXEVQXtRlwWKomxm24hz3vmrMycM2fzm7Z5+PunmVqePBAREMX
         +odso/cplfx6YSqpMqY+hhy2iBuPfB4IZPvjEtSNLWkVNpApkYNZFvGgeEJGgGAjYXfx
         TJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690390523; x=1690995323;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Va8RyAuChcJCgwDXPThjGMYkGClfzUhKnHxi5Ri1rY0=;
        b=jCCVtzVfNoqduPuNsLlhVRR/fTaxLOrXhG3iYuUjklDU4BFzirp9R9BIOKa+M3+ulH
         wYLDGSApi9yjPm5YG78gOoOes8rZhC1cfS39D7oPHYVi9K9MTvSTJF1S+eZAfLdkDiHX
         sViM0i/DYOYS1wzsghh3lyte2Kx4DLeTbQMnjNAXx5IkPJf+we0/jZZ+QRDUKUd0bvvE
         RG/V3yr/TZtpnxKo8H6EqIHMmFais/AZPru/bIwIEiNSz1j7qvgSGYY5cVKPyx9N8vTw
         T5lX/wHGt0yWJP132/tpbTlzKiDYjvTlTUC5DS2HkTrlKXgtNcvQKaAn18HFik+5Litp
         r6ew==
X-Gm-Message-State: ABy/qLYmYkJX4MYOxxycghTTAZYWdTOplKnfgSKNa/iBDSw88gYqUj6U
	ArZ6e1GmtQdsxzPb8gr/hYs=
X-Google-Smtp-Source: APBJJlH+bKJo6GE/XpCWSP+QVeX/AFdXxDl1Wy/ZvXV7C+JyezaUXq1l6KxQNnJwwi5wNi6GXKte0Q==
X-Received: by 2002:aa7:d352:0:b0:51e:362d:b172 with SMTP id m18-20020aa7d352000000b0051e362db172mr1864844edr.32.1690390523295;
        Wed, 26 Jul 2023 09:55:23 -0700 (PDT)
Message-ID: <f4a0f0c2a61c0e1d1313c734fbed539d5dd6b93b.camel@gmail.com>
Subject: Re: [PATCH v3 6/8] RISC-V: annotate entry points with type and size
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jul 2023 19:55:22 +0300
In-Reply-To: <f721e9e2-b73e-71ec-c337-bc3ad2352246@suse.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
	 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
	 <959bdb6d-9b6c-cde0-9459-c83cd3f58b18@suse.com>
	 <60e57a9b-8091-0e6a-6066-2364d7d5441a@suse.com>
	 <de4204862d2912611b004a9b2067b3743c0fbfbf.camel@gmail.com>
	 <f721e9e2-b73e-71ec-c337-bc3ad2352246@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-07-26 at 17:43 +0200, Jan Beulich wrote:
> On 26.07.2023 17:28, Oleksii wrote:
> > On Mon, 2023-07-10 at 10:58 +0200, Jan Beulich wrote:
> > > On 10.07.2023 10:56, Jan Beulich wrote:
> > > > Use the generic framework in xen/linkage.h. No change in
> > > > generated
> > > > code
> > > > except of course the converted symbols change to be hidden ones
> > > > and
> > > > gain
> > > > a valid size.
> > > >=20
> > > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >=20
> > > I'm sorry, the Cc list was incomplete here. Adding back the
> > > remaining
> > > REST
> > > maintainers.
> > >=20
> > > Jan
> > >=20
> > > > ---
> > > > Probably count_args_exp() should move to macros.h, but I first
> > > > wanted to
> > > > see whether anyone can suggest any better approach for checking
> > > > whether
> > > > a defined macro expands to nothing.
> > What about introduction of conditional macros ?
> > Something similar to:
> > #include <stdio.h>
> >=20
> > #define CONDITIONAL_RETURN(arg1, arg2)
> > CONDITIONAL_RETURN_IMPL(arg1,
> > arg2, EMPTY)
> >=20
> > #define EMPTY(...) ""
> >=20
> > #define CONDITIONAL_RETURN_IMPL(arg1, arg2, empty_check) \
> > =C2=A0=C2=A0=C2=A0 CONDITIONAL_RETURN_##empty_check(arg1, arg2)
> >=20
> > #define CONDITIONAL_RETURN_EMPTY(arg1, arg2) \
> > =C2=A0=C2=A0=C2=A0 CONDITIONAL_RETURN_ARG1(arg1, arg2)
> >=20
> > #define CONDITIONAL_RETURN_ARG1(arg1, arg2) arg1, arg2
> >=20
> > #define CONDITIONAL_RETURN_ARG2(arg1, arg2) arg1
>=20
> I don't see how this would be used in your scheme. It ...
>=20
> > int main() {
> > =C2=A0=C2=A0=C2=A0 int a =3D 42;
> > =C2=A0=C2=A0=C2=A0 const char* b =3D "hello";
> >=20
> > =C2=A0=C2=A0=C2=A0 // Second argument is not empty, both arguments are =
returned
> > =C2=A0=C2=A0=C2=A0 printf("Case 1: %d, %s\n", CONDITIONAL_RETURN(a, b))=
;=C2=A0 //
> > Prints:
> > Case 1: 42, hello
> >=20
> > =C2=A0=C2=A0=C2=A0 // Second argument is empty, only the first argument=
 is
> > returned
> > =C2=A0=C2=A0=C2=A0 printf("Case 2: %d, %s\n", CONDITIONAL_RETURN(a, "")=
); //
> > Prints:
> > Case 2: 42,
>=20
> ... certainly isn't here, or this likely would cause at least a
> warning
> from the compiler (for there being too few arguments to printf()) and
> then a runtime UB for interpreting something as a pointer to a string
> which likely isn't.
>=20
> > =C2=A0=C2=A0=C2=A0 return 0;
> > }
> >=20
> > and then define DO_CODE_ALIGN using CONDITIONAL_RETURN?
>=20
> Afaict instead of getting rid of the comma, you'd actually add ""
> after it. What am I missing?
You are right. I missed that actually it returns "".

~ Oleksii

