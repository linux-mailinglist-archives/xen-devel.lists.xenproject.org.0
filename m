Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB37A12AD3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 19:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873022.1284010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY85p-0004NQ-G8; Wed, 15 Jan 2025 18:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873022.1284010; Wed, 15 Jan 2025 18:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY85p-0004Lx-DP; Wed, 15 Jan 2025 18:26:17 +0000
Received: by outflank-mailman (input) for mailman id 873022;
 Wed, 15 Jan 2025 18:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=guqY=UH=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1tY85n-0004Lp-Qb
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 18:26:15 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33d4f5a2-d36e-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 19:26:14 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6e17d3e92d9so1149796d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 10:26:14 -0800 (PST)
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
X-Inumbo-ID: 33d4f5a2-d36e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736965573; x=1737570373; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56NS9QFu3nqyt2X92cCfR3Efbv5GWPlnT7v7XAEeafM=;
        b=Gt4Ew70L2dkkCW64S5yjgBsF9o9mZ4Dj2dpysi+U4j3GUHW8XyHsbBrlgm0n95uCSf
         0jdP8OZFgFRgDLkv/HxQzVZ4t1/xMrNsS+M5hFFrOkEUBT6uGNWURv9PgZ4LDeJw2Z3/
         m8V2iCq3KiDndE5et8287PUkMqNbj6j1+QybertmvYUH6ZooG9Ts4Xi5IRXMfsuFeBVe
         OqEmwfgMyCc6h1Ex5Eda9KTSuilEieWw/3AW2BXrZg1apJa0s6uiZW60jfXnov4QHX43
         onwB40BJ8fsX1gBb7uNvFfBL/5y2qo7ItaW3CwoJ9fxgY8OqKo4k8M+gG3jGNYYBkf9g
         xnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965573; x=1737570373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56NS9QFu3nqyt2X92cCfR3Efbv5GWPlnT7v7XAEeafM=;
        b=YAMInJ4URGPw7jYuB00fnVr8hpUixpNJexRztim7dF7FAIBvEqqVVlhyvso7bgWI/R
         uTHMj2wRKMBLAhTDH8feuofOTH1SoyxDbUGtQonB7zdzuCNGSVxcPT/29b7M9Zwu8s2w
         lGgdHiIE43CbgoiMuRrgDi7qfN2/vQC4dzINuJnXqEc6pjXuSlszc4CCxJHzoi/xn2P9
         9PO/gsLC6Aw/kpW+hitZ9uA32eXKPy+c2lYhsMdrZ7QknR81r42RyejKp7jaOWcYNVCp
         sZfhBxQ7iu9tX3EJYeQNxNk4pV8qfPw0gJtoL4DvG6WR9EeUsJmZ/AvyFlpNbnQtTeDO
         nxRA==
X-Forwarded-Encrypted: i=1; AJvYcCWiPlAh8I8CW5SwjLKYPoz6zD0t4ded0YPL45N3cxCwIdpVw1aoVV5sD0JBafv+szWbhHafAJRxk0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGqk78F02ioJcveNqUcmoSvjEjEiR6GgWP2J7zRiNOi+SxueJF
	ATW3feV6Eyfb4cyGCwgaiqUTwlEFE99+v6y72chOZ6yshQ6budfPVehYd7AIG8tNpkZ7SwMsgR4
	CTXgbuUYUJGGSkbK4e4GpVhmILtM=
X-Gm-Gg: ASbGncvaNqx1njxeI20b9DeqRNaKNEBShBwKT3wFbL51roYCk3FYYSsWrDI4dv4C2SS
	YKwC/mfIig8f1bj8mIP8zfqABk0m+B7ROyj7Mwg==
X-Google-Smtp-Source: AGHT+IFZ7LDpCgk+/ixdVgpNuaVhVLnP72hjhsHZcggTnKpcAZNiZOdxIC0i/Y0rcAWUWwUH/WEMoeQpL02BdxVsSe4=
X-Received: by 2002:a05:6214:5bc2:b0:6d8:a730:110d with SMTP id
 6a1803df08f44-6df9b0eea41mr464717506d6.0.1736965573650; Wed, 15 Jan 2025
 10:26:13 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <0cac0b13-128c-4d8b-b235-09d7b440ad8e@vates.tech>
In-Reply-To: <0cac0b13-128c-4d8b-b235-09d7b440ad8e@vates.tech>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Wed, 15 Jan 2025 19:26:03 +0100
X-Gm-Features: AbW1kvamvNb2xBNlt0NnBIzllhDKyUtK5Hh8vPP6WZ7rdE4FF79WjPfZk5asYMA
Message-ID: <CAKp59VHBLtpxk7MD3StO8v8M5vdqbWU7AZaoxukzYPFCmSF91w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: Teddy Astie <teddy.astie@vates.tech>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	Slavisa.Petrovic@rt-rk.com, Milan.Djokic@rt-rk.com, 
	rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, takakura@valinux.co.jp, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Teddy,

On Tue, Jan 14, 2025 at 6:51=E2=80=AFPM Teddy Astie <teddy.astie@vates.tech=
> wrote:
>
> Le 14/01/2025 =C3=A0 17:13, Milan Djokic a =C3=A9crit :
> > diff --git a/test.txt b/test.txt
> > new file mode 100644
> > index 000000000000..e54267998982
> > --- /dev/null
> > +++ b/test.txt
> > @@ -0,0 +1,21 @@
> > +WARNING: added, moved or deleted file(s), does MAINTAINERS need updati=
ng?
> > +#120:
> > +new file mode 100644
> > +
> > +WARNING: do not add new typedefs
> > +#808: FILE: include/xen/riscv/interface.h:15:
> > ++    typedef struct { union { type * p; uint64_aligned_t q; }; }  \
> > +
> > +WARNING: please, no spaces at the start of a line
> > +#1006: FILE: include/xen/riscv/swiotlb-xen.h:10:
> > ++    return 0;$
> > +
> > +total: 0 errors, 3 warnings, 810 lines checked
> > +
> > +NOTE: For some of the reported defects, checkpatch may be able to
> > +      mechanically convert to the typical style using --fix or --fix-i=
nplace.
> > +
> > +0001-riscv-Add-initial-Xen-guest-support-for-RISC-V.patch has style pr=
oblems, please review.
> > +
> > +NOTE: If any of the errors are false positives, please report
> > +      them to the maintainer, see CHECKPATCH in MAINTAINERS.
>
> I am not sure you want this here.
>
Sorry, this one is added by accident. Will be removed.

>  > diff --git a/arch/riscv/include/asm/hypervisor.h
> b/arch/riscv/include/> asm/hypervisor.h
>  > new file mode 100644
>  > index 000000000000..3a117afe57f0
>  > --- /dev/null
>  > +++ b/arch/riscv/include/asm/hypervisor.h
>  > @@ -0,0 +1,9 @@
>  > +/* SPDX-License-Identifier: GPL-2.0 */
>  > +#ifndef _ASM_RISCV_HYPERVISOR_H
>  > +#define _ASM_RISCV_HYPERVISOR_H
>  > +
>  > +#include <asm/xen/hypervisor.h>
>  > +
>  > +void kvm_init_hyp_services(void);
>  > +
>  > +#endif
>
> kvm_init_hyp_services seems KVM-specific and doesn't seem to exist (yet)
> for RISC-V.
>
Yes, we'll remove it in the next revision.

BR,
Milan

