Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEAA9F3372
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858203.1270460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCLR-0001Dj-2n; Mon, 16 Dec 2024 14:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858203.1270460; Mon, 16 Dec 2024 14:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCLR-0001By-06; Mon, 16 Dec 2024 14:45:13 +0000
Received: by outflank-mailman (input) for mailman id 858203;
 Mon, 16 Dec 2024 14:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuNa=TJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNCLP-0001Bs-EV
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:45:11 +0000
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [2607:f8b0:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58939b11-bbbc-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:45:09 +0100 (CET)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a813899384so13878315ab.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:45:09 -0800 (PST)
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
X-Inumbo-ID: 58939b11-bbbc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734360308; x=1734965108; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jBIzL4o4vATaS2qlDmBK4XzP69JlBsw4cmvwtoNe6k=;
        b=XAZgJpRjVVMV7mUkwQqNcgXbvYQ5QtHNlTe1H8fwMajTDEV6AxmcXCaqsr2QBfvMkB
         TxgSB6SunzB7gQD/AyUilem9JurraCFkVJ2zXLUpdkyM/iEw0tVeMdMzqeY882byvQKb
         /b2s16uon29YQbS9dnGiRD57uGGu8iRPOUsNANiQTVmu1nkHxrq99Ytrh+943zg4ez1m
         skGkDkY700BLZZSBP6tSE0KnREGSvZH9mVP7hyNYOQK7ercSBDdQOAC7lRdmn4Cb6OUz
         p5rYmFFdc9BFXrij+MJY2sGN9npYJVlRR8H5yWZxiXicnBuvA0dvD2YCdqef9m3kvlNT
         6wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360308; x=1734965108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jBIzL4o4vATaS2qlDmBK4XzP69JlBsw4cmvwtoNe6k=;
        b=jYpUiKDtrAegvbblZUFzGkNnI6czqfx7snlXXnzeJNWUn7DjiXDb4w5axxrDxORV8w
         fUgju1/1v9BvTVYdXncZf+8fR+ps3fTOS5ZuXRKMPGnlKwCuIcMZ0HLp8hhngoh0Zzok
         nR2C0b6VnWBeq8hILxiQOnlLomjshOnUQPWEzFlNnGFhxlt3T1pwtb9sQGPFxNwSNCsq
         59vlVnJnVf9H2I1lq72QslVa2+WACIttdkFi2fV5TelIeINcstjZu4XeuOLiDr0aRRCu
         YesSS25SHVi5SpWp6Kppt8xNNvXUCKw1Ybtlc8yLUrY1L3M1qhMPmFsqKalzsIDoZB5p
         GrHA==
X-Gm-Message-State: AOJu0YxVF56fLOtQIjEGsO/Rg8H/WhqrpdfZpIPHaSo5tLUUM+txiyHt
	QTSxV+n3nt2t7d0rnK1ph2r5akrH7tI9b0HR+lKw7LQtBZFMdyqQtUMy7z8SXOjeMOd5J6+7MyK
	5gPYE4vVEaJJkGvYRdBSbXMl07ljglCAuKL/88A==
X-Gm-Gg: ASbGncsoyss5fWlLe+fp14KfI6O9CvcZFVVldiUe6Lle7lePcfoQfDIPTJsB2GqycAA
	hdcMYmSAZiKXa2wcuzMv/FAlkd4NKhocrEKRyltk=
X-Google-Smtp-Source: AGHT+IFcpwvAsb6pnsOmZLiVt9eTtDgs0GogGZX7Iht2+vkX0pkRvtK831x35uvDvC8kS37b0bhm0q6Wbx2dJzQrgpw=
X-Received: by 2002:a05:6e02:1a49:b0:3a7:8d8e:e760 with SMTP id
 e9e14a558f8ab-3aff6212e59mr111056125ab.4.1734360308073; Mon, 16 Dec 2024
 06:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech> <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com> <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
In-Reply-To: <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 16 Dec 2024 15:44:57 +0100
Message-ID: <CAG+AhRUCNjkZL-zSzPD8M=itp0kBA6bvn=mubO9uqr7LP8uOcw@mail.gmail.com>
Subject: Re: [PATCH v12 12/12] xen/arm: add cache coloring support for Xen image
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Dec 16, 2024 at 3:36=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.12.2024 15:28, Carlo Nonato wrote:
> > On Mon, Dec 16, 2024 at 2:56=E2=80=AFPM Michal Orzel <michal.orzel@amd.=
com> wrote:
> >> On 13/12/2024 17:28, Carlo Nonato wrote:
> >>> --- a/xen/arch/arm/arm64/mmu/mm.c
> >>> +++ b/xen/arch/arm/arm64/mmu/mm.c
> >>> @@ -1,6 +1,7 @@
> >>>  /* SPDX-License-Identifier: GPL-2.0-only */
> >>>
> >>>  #include <xen/init.h>
> >>> +#include <xen/llc-coloring.h>
> >>>  #include <xen/mm.h>
> >>>  #include <xen/pfn.h>
> >>>
> >>> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
> >>>  }
> >>>
> >>>  extern void switch_ttbr_id(uint64_t ttbr);
> >>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t=
 len);
> >>>
> >>>  typedef void (switch_ttbr_fn)(uint64_t ttbr);
> >>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, =
size_t len);
> >>> +
> >>> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
> >> CODING_STYLE: { needs to be on its own line
> >>
> >> Also, this function is only executed in case of LLC coloring, so shoul=
dn't it
> >> be #ifdef protected.
> >
> > Here and in other places (patch #8) I'm relying on DCE to remove functi=
ons
> > that are not called. This was a suggestion from Jan in that patch. Can =
we
> > adopt the same here?
>
> Yet how would the compiler spot that the function is unused? That would o=
nly
> work with LTO / WPO. DCE (as I did suggest elsewhere) requires the functi=
ons
> in question to be static (allowing the compiler to see enough of the whol=
e
> picture).

Sorry, didn't know that. So I will protect with an #ifdef
relocate_and_switch_ttbr() only.

> Jan

Thanks.

- Carlo

