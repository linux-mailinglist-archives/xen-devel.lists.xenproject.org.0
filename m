Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74684570D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 13:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674383.1049230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVv6-0007mj-V8; Thu, 01 Feb 2024 12:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674383.1049230; Thu, 01 Feb 2024 12:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVv6-0007jw-Ro; Thu, 01 Feb 2024 12:11:52 +0000
Received: by outflank-mailman (input) for mailman id 674383;
 Thu, 01 Feb 2024 12:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TmiS=JK=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rVVv5-0007fE-3U
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 12:11:51 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1432c2dd-c0fb-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 13:11:50 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fb63c40c0so7625455e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 04:11:50 -0800 (PST)
Received: from smtpclient.apple ([90.251.137.254])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b0040fbc9a3405sm1492197wmq.0.2024.02.01.04.11.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Feb 2024 04:11:49 -0800 (PST)
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
X-Inumbo-ID: 1432c2dd-c0fb-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706789510; x=1707394310; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzTNVroynWj1SFNgSOveOmhFes8MZYVA132LR0GQJKg=;
        b=fZ8DN/y3BJBshqeJaP+AqrudKL+ih7InvvvjXizdyFQiQGNlZVbMjjtkXIXqCF6yhy
         +o+4PxCuPcSz5XW+4xKoFz8EJxTwJk3DNAwCPArxMH6ILFPy/tZ5byYEFUyueavOT+Mf
         DSu3IP33V645O9BWqJBTch8EOAP4bt0O6aOWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706789510; x=1707394310;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzTNVroynWj1SFNgSOveOmhFes8MZYVA132LR0GQJKg=;
        b=WD7xIUB2DN1IBcOFhlb+dz5rrNcAlrVlFCSi6Y4oj2P1gxnG4NzmhxPU72eyUiCVyz
         JSG/1AYrMXfgIjyNQWTKgcoA3yeyt8Zu20HS+J6Yw7NeRxsbMZTpbyaXiIpFaldfvBtm
         atU90+gjRKaIKItvHJe4YOGibnQ+DTTFoYycpXgkcXAQQ6mY9MmVc0t2o5fyzFnuxnSc
         sP5V18vHMAX/2gzqbJyipdA8Jm2BCzTSgAtPK4GGAet1o8W0mg3GPKH9mEyYHNSpnmDU
         rLgARcVkW8fgLiaGqM3K2MR9K4NNAWySNqRqv7020fuTQEOgSGJ/QR1g6NXl5Gxgzu0x
         bP2w==
X-Gm-Message-State: AOJu0Yxm4QPakgcfxC4KkmzlSWg8dQTlSIk1bK8TufjQP28PzGpq68VN
	2oUjSaqC+6ImULtx4pekPAe9bkGUQTwkA/e83Vp7c24y2cC694YoRX3S2OkN84E=
X-Google-Smtp-Source: AGHT+IEDKHUB7aduZzxaOJOYrYpySaXvUVlGyfCD8NywdNJcBBIeYNEQYFUNE4nZPcqtNUnz+oDPlw==
X-Received: by 2002:a05:600c:35d3:b0:40e:fc29:f52f with SMTP id r19-20020a05600c35d300b0040efc29f52fmr3808286wmq.21.1706789509759;
        Thu, 01 Feb 2024 04:11:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX8YTFu08UiZIBLLBhhKjDwQAhtWPsu5OdluSrJLI7AjTMvyi/4QJ9LErhP1grHuxDh3O5uwKnN/BvKmPSkf1nTm+NmuWYJiXDwT2LMlZonLpLzXXQw8uPeQ6jKRmyLi1rT2gCG+i40SzzCmmykOvfQUj0qNBvhcaduwj7wKRc4zyUsGZwjBqE99ms86awQztqCe4jhSOun2aKjCwN1bYy5WSBx
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v1 0/2] tools/ocaml: support OCaml 5.x, drop support for
 <=4.05
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <b88df473-9a3e-4c83-8629-3b65c6a6190b@citrix.com>
Date: Thu, 1 Feb 2024 12:11:38 +0000
Cc: Christian Lindig <christian.lindig@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2297C847-DE25-4D25-B1B0-57EFB8AA51DE@cloud.com>
References: <cover.1706697216.git.edwin.torok@cloud.com>
 <4E9A23AB-5745-4A71-9013-156B6648025A@cloud.com>
 <b88df473-9a3e-4c83-8629-3b65c6a6190b@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.400.31)



> On 31 Jan 2024, at 10:55, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 31/01/2024 10:44 am, Christian Lindig wrote:
>>> On 31 Jan 2024, at 10:42, Edwin T=C3=B6r=C3=B6k =
<edwin.torok@cloud.com> wrote:
>>>=20
>>> Fix building oxenstored with OCaml 5.x.
>>> OCaml 5.x has removed some functions that have been deprecated for =
many years,
>>> in order to support OCaml 5.x we need to drop support for OCaml =
4.02.
>>>=20
>>> Tested in gitlab CI (together with my other series):
>>> =
https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/115830282=
7
>>>=20
>>> Edwin T=C3=B6r=C3=B6k (2):
>>> oxenstored: fix build on OCaml 5.x
>>> tools/ocaml: bump minimum version to OCaml 4.05
>>>=20
>>> tools/configure               | 2 +-
>>> tools/configure.ac            | 2 +-
>>> tools/ocaml/xenstored/disk.ml | 2 +-
>>> 3 files changed, 3 insertions(+), 3 deletions(-)
>>>=20
>>> --=20
>>> 2.43.0
>>>=20
>> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>=20
> It occurs to me that this is the kind of thing which should get a
> CHANGELOG.md entry these days.  Something like:
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1f55c9c72d10..fd7c8f5c6b82 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,7 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Changed
>   - Changed flexible array definitions in public I/O interface headers
> to not
>     use "1" as the number of array elements.
> + - The minimum supported Ocaml toolchain version is now 4.05
>   - On x86:
>     - HVM PIRQs are disabled by default.
>     - Reduce IOMMU setup time for hardware domain.

Sounds good.

Should this be mentioned in =
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a_=
Patch_Series?

Best regards,
=E2=80=94Edwin

>=20
>=20
> ought to do.
>=20
> Have we checked to see whether this drops Ocaml from any of the build
> containers ?


I can look into this later, haven=E2=80=99t tried rebuilding the =
containers (the gitlab CI passed though)

Best regards,
=E2=80=94Edwin

>=20
> ~Andrew


