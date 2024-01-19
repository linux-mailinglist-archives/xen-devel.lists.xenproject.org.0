Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B118326BE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668975.1041499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlCl-00033e-8s; Fri, 19 Jan 2024 09:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668975.1041499; Fri, 19 Jan 2024 09:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlCl-00031F-4W; Fri, 19 Jan 2024 09:30:27 +0000
Received: by outflank-mailman (input) for mailman id 668975;
 Fri, 19 Jan 2024 09:30:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePSo=I5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQlCk-000319-1h
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 09:30:26 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60024adb-b6ad-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 10:30:25 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50eabfac2b7so622994e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 01:30:25 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t5-20020ac25485000000b0050e92afc7eesm915065lfk.246.2024.01.19.01.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 01:30:24 -0800 (PST)
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
X-Inumbo-ID: 60024adb-b6ad-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705656625; x=1706261425; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=whMmvVsZRjKXtBq12DpDZ3kUkRjm4TRrZ6XwRf4gtS8=;
        b=LHWTOjhkTULknXJpNdBTl8e6tKDFAYI6pnCUlw44/SnPTR9g0/ItPZNm0d657aWr8q
         Xr/kd9j+nQDMnNrA/vN7Ag9l0bddW7s8uvbU6I6Co8UUnXXRm87rYZ2GhFhtNsSAlupN
         sXlibW/D5HLSgsfl3egyBP+8+SKEVnnC1chr6G8shIpeRX1DJ2syjId0pX8ZLV/e2Act
         CaPcXOqNicgUV9J2L4XaMCUfSmPCOpB9HAHwyW2UKqP1sZHEHXPDzAPVq2G/jhgxCLjT
         HtD47GCE5mamv4xDzScSQ7zvxaLQ/AzhNKlzfP5EZ5nOmfENee1SiBtPbmHJJj8rTIR9
         /LDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705656625; x=1706261425;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whMmvVsZRjKXtBq12DpDZ3kUkRjm4TRrZ6XwRf4gtS8=;
        b=GzZxdxbbUX/9hf5ko86koxreSB6IXxGnWzxzHgA6CLTu+2Y/IeNyFuC90xyqfnzwsF
         xWdwo2xxmut3UTIaCiySAlXQPtB9iAA4SEfSEMuGcMOVC1nU78xHrcrTyjUGKk4tAkPD
         N6viR34rZf/hX/0H/m9mK+sRgc0DuyjXzT6/J4glY4awRUlU0Bp1RRdXRNjm8uS9dtNR
         m0GG7P0Vr4YTxfwL8TGxQPBYCNrDQplMESy2i8g4rfDrLQM0y3Qlp6wPIr4yfCr0ci6J
         7/s7pIH7f5HVIWp0+5UGRwgoxHHUGA8L0Vq6yp7OUq5+11pdL4iz07btfeqgBtPT8WgB
         MlDQ==
X-Gm-Message-State: AOJu0YxnBcoLkI32mHf4o6cglvJMvHeTAJ3VlwPhgAA2PV6590plbz++
	GVH+cm7fOqFUU/eaYiDjVV7B3modKmUxsSaJxUWK2r34rKuJemwA
X-Google-Smtp-Source: AGHT+IE7/dCRggUHTJEeVaqzK3NFg1UBHUkJy68WS3SvXsAvC40RAm4B1oM+HTw63ngMw1lsWgURUA==
X-Received: by 2002:a05:6512:1307:b0:50e:d3dc:2245 with SMTP id x7-20020a056512130700b0050ed3dc2245mr580954lfu.58.1705656624486;
        Fri, 19 Jan 2024 01:30:24 -0800 (PST)
Message-ID: <2f7dc0e9213736bfac6944ff0b7d75a7b66bf7e8.camel@gmail.com>
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 19 Jan 2024 11:30:23 +0200
In-Reply-To: <df4ffb88-616e-45c3-8b9d-eaea8a4fed3a@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
	 <f6e13ad0-5401-41f7-9f3b-ef8f1bf9c1df@suse.com>
	 <af71f5ce0ac6af9a2d87a31a154ba051a0841e3a.camel@gmail.com>
	 <df4ffb88-616e-45c3-8b9d-eaea8a4fed3a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-01-19 at 10:14 +0100, Jan Beulich wrote:
> On 19.01.2024 10:09, Oleksii wrote:
> > On Thu, 2024-01-18 at 12:03 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> > > > @@ -0,0 +1,10 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> > > > +#define _ASM_GENERIC_BITOPS_BITS_H_
> > > > +
> > > > +#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > > > +#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (1UL << ((nr) %
> > > > BITOP_BITS_PER_WORD))
> > > > +#define BITOP_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > > > +#define BITS_PER_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 8
> > >=20
> > > Btw, I can't spot a use of BITS_PER_BYTE. Why do you add it? And
> > > if
> > > it really needed adding, it surely wouldn't belong here.
> > It is used in common/bitmap.c and ns16550.c, and inside some arch
> > code,
> > but it is not used by RISC-V right now.
> >=20
> > Would it be better to define it in config.h?
>=20
> Yes, perhaps. Imo this shouldn't have a "generic" fallback; every
> arch
> should explicitly state this (along with e.g. BITS_PER_LONG).
Got it. Thanks.

~ Oleksii

