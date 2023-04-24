Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5546ECFA6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 15:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525389.816558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwbp-0002X1-BW; Mon, 24 Apr 2023 13:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525389.816558; Mon, 24 Apr 2023 13:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwbp-0002UF-7h; Mon, 24 Apr 2023 13:52:01 +0000
Received: by outflank-mailman (input) for mailman id 525389;
 Mon, 24 Apr 2023 13:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pqwbo-0002Lp-2U
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 13:52:00 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e59c885-e2a7-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 15:51:58 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8c28158e2so42421461fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 06:51:58 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a2e9403000000b002a8b5310642sm1771789ljh.5.2023.04.24.06.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 06:51:57 -0700 (PDT)
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
X-Inumbo-ID: 2e59c885-e2a7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682344318; x=1684936318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQFa9N1jXNE2/64W6rjBZl8mIxnUNrxCJGv5L5hBKss=;
        b=iXSeFyG/y8990eRZMM/URcuLAm2GJz9lc2+GqTTDEh/BuJ97lAkFBKm9T+KYe0Ex5p
         Iy5uoNxokYERlmgLCYc0EMeEbu+Fztjfwj3Qz00j2C9gkHisryRerBh7KfKZhPvPyaO2
         AYZYi/YBm6xeWdr6klgWHvkfgnvvnCYb8hmz4SQRE4z0/gzeZd0SD0yQZthK1MHW2Irv
         HfZVAu6na5g8nRcU3EBHfRyL4FhPZGVUnZ2Cs2XHX/i+3N1E6N3uMQvPnjsgkX4BuQCG
         AAi23FefAAuAo1ydHDVFKvDZ6QpZIFVd6i9uzJD8imu2oi9tLVETF3ZrXn3hiOrM383p
         IXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682344318; x=1684936318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bQFa9N1jXNE2/64W6rjBZl8mIxnUNrxCJGv5L5hBKss=;
        b=bD4C5AJ6k55Hre7CzifB7az6JqJBCH4++5yc7k7e0GmE7NsPotWZvXSIgq/B6ZsZ6C
         VNxcVPccC2CvjX4b6vaBYd/uAf+QO4ItxNxEpw/nVUp1zri6FLGxPmp90hJ0oMr6DcFc
         9OZYyP6FeCalrgGMnRElZ67UIxIR3zKNCLylMnaLNpWMpPwHlWaQqt4C7fE9hG7pD6Hm
         TeRBNhhHKdwkwiFaehI/oJlVPMeNmhPPe6jbr68yrD7X+EvMtKjGzlMyrWF0JSJF9kKP
         1gDE8zdKew2dJ8wEvn+LoTdVNqcsh7QHZZPqzvN5Ysr7GheoVEV/NVh9mku8fhPFHf8H
         hKug==
X-Gm-Message-State: AAQBX9ddWTgJY9Lv1aFHeZ14gbF8cFubFwDddM6c1XvsODbK7nUXomiU
	2hJSRzn1HmGpIR1DdVu3DsE=
X-Google-Smtp-Source: AKy350bSOY/4+uNYqEyfltJG6KSHInzA3mqqVVkx6M6YIVBccCWf+ilt98axCkHwHMiO9RP8I+hzCg==
X-Received: by 2002:a2e:855a:0:b0:2a8:bafe:900c with SMTP id u26-20020a2e855a000000b002a8bafe900cmr2584063ljj.25.1682344317798;
        Mon, 24 Apr 2023 06:51:57 -0700 (PDT)
Message-ID: <822ea3e8595c21a3528849a68dac35f5cb534934.camel@gmail.com>
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Mon, 24 Apr 2023 16:51:56 +0300
In-Reply-To: <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
	 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
	 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
	 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
	 <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-04-24 at 11:33 +0200, Jan Beulich wrote:
> On 21.04.2023 16:41, Oleksii wrote:
> > On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
> > > On 19.04.2023 17:42, Oleksii Kurochko wrote:
> > > > + *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > + *=C2=A0=C2=A0=C2=A0 Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 En=
d addr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | VM ar=
ea
> > > > description
> > > > + *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > + * FFFFFFFFC0000000 |=C2=A0 FFFFFFFFC0200000 |=C2=A0 2 MB=C2=A0 | =
Xen
> > > > + * FFFFFFFFC0200000 |=C2=A0 FFFFFFFFC0600000 |=C2=A0 4 MB=C2=A0 | =
FDT
> > > > + * FFFFFFFFC0600000 |=C2=A0 FFFFFFFFC0800000 |=C2=A0 2 MB=C2=A0 | =
Fixmap
> > >=20
> > > These are all L2 slot 511 aiui, which may be worth mentioning
> > > especially since
> > > the top bits don't match the top bits further down in the table
> > > (because of the
> > > aliasing).
> >=20
> > Than I'll add one more column where I'll put slot number
> >=20
> > >=20
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 .................. unused .............=
.....
> > >=20
> > > This is covering slot 510, which again may be worth mentioning.
> > >=20
> > > > + * 0000003200000000 |=C2=A0 0000007f40000000 | 331 GB | Direct
> > > > map(L2
> > > > slot: 200-509)
> > > > + * 0000003100000000 |=C2=A0 0000003140000000 |=C2=A0 1 GB=C2=A0 |
> > > > Frametable(L2
> > > > slot: 196-197)
> > >=20
> > > 1Gb is, if I'm not mistaken, a single L2 slot.
> > Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
> > included. I'll update the table.
> >=20
> > >=20
> > > Also assuming a 32-byte struct page_info (I don't think you'll
> > > get
> > > away with
> > > less than that, when even Arm32 requires this much), there's a
> > > mismatch
> > > between direct map and frame table size: With 4k pages, the
> > > scaling
> > > factor
> > > would be 128 if I'm not mistaken. So perhaps you really mean 3Gb
> > > here
> > > to
> > > cover for (slightly more than) the 331Gb of memory you mean to be
> > > able to
> > > map?
> > For RV64 page_info size will be 56-byte and 32-byte for RV32 but
> > you
> > are right it should 3 Gb in that case what will be enough ( taking
> > into
> > account both available sizes of page_info structure ).
>=20
> As to the plan to it being 56 bytes (i.e. like on Arm): Arm forever
> has
> had a 64-bit padding field at the end. My best guess is that the
> field
> was introduced to have a 32-byte struct on Arm32. But then why
> artificially increase the struct from 48 to 56 bytes on Arm64? And
> hence
> why have the same oddity on RV64?
I didn't think about that. I just re-used page_info structure from ARM.
I'll think about your comment. Thanks.

~ Oleksii

