Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1986663ABD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474401.735556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9pe-0008Kw-S5; Tue, 10 Jan 2023 08:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474401.735556; Tue, 10 Jan 2023 08:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9pe-0008Ih-OY; Tue, 10 Jan 2023 08:18:06 +0000
Received: by outflank-mailman (input) for mailman id 474401;
 Tue, 10 Jan 2023 08:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pF9pd-0008Ib-Ol
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:18:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc47d54-90bf-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:18:03 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id j16so16328972edw.11
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 00:18:03 -0800 (PST)
Received: from 2a02.2378.1014.d6d9.ip.kyivstar.net
 ([2a02:2378:1014:d6d9:98bb:6889:a785:5d8c])
 by smtp.gmail.com with ESMTPSA id
 b15-20020aa7c90f000000b004615f7495e0sm4644581edt.8.2023.01.10.00.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 00:18:02 -0800 (PST)
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
X-Inumbo-ID: 4dc47d54-90bf-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kFUxWJzeM2COHFWq5okhVHEx6N/a8Nas9W0hsl1vXtg=;
        b=LtU5mRIo0+RkUXzDAFazQKGaYSBgyYdirWMwYf++OGsu6ktHJ5LA54G8jnQUyl0fm/
         gvqMwgFGGvlq8W+KSW8niC1TzQaNdAS9yM54cej+e1USn0Ak9u/Yl7f5mtNsx5UXWXGU
         9dMfETLWzgWvQzH03FX7Mi9tz4ZjJZO8lJvO//njHgVTyuF55Wnvrhvc4aYQ181glSdj
         BpTzkJz4O9ILntSbe0u+zD0Hb6A3ajwmyM1ous8YKseyEc4s15ISxKa6Plivjl4x96rA
         4n38vOWkd5YPwTfnlEne8jOV3Z28iylN+cbav/sjZ0ruj10jK21SzcsggRxUuxoKeCIX
         MSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFUxWJzeM2COHFWq5okhVHEx6N/a8Nas9W0hsl1vXtg=;
        b=HJ7uu8hHWrZJ1Nu6haKeYExdQqDFGJOerHtZr2B5S7Sa2X5SyrW709ZX3eAw7m80HE
         qiYhLRXvhpuYQBV5xx568Tya0ObENYqjK4iXV1stSFu77C6brOraEBeIoncd6uLb3hgr
         Kh9W1mwA1sg/2YC1MUpYaka+3Nx8oZ8IOv/LU5/HAenZhpe6IHp1R02N1iqJt1igxxE3
         g5YbBUEH/hkaL6w32s6doLorGc7Z2wH81Tr51izw/vy4jVBG1lfXGdVLU/eBFt8G31en
         vcwYZO7dW0qQH9rI39e1HM/BVWMJSmLSuxzNGZJdvByrmWK3vn9QmNhCvrsj9NZcZB20
         fYxw==
X-Gm-Message-State: AFqh2kpxxtGJmcyI+9sqE+oNAvZon2HVdSbY0BM3vQIBmlUvYCTC7YRk
	rZQMOAJ6QTtl2PeIG6HaW5o=
X-Google-Smtp-Source: AMrXdXuePFplV6NusJbeKCkigvpa4LjqkET2uRLMDyYLyHVvu9nDOYGvB0NWxdXFBh2jLiZlkd5GxQ==
X-Received: by 2002:a05:6402:e81:b0:48c:afae:9331 with SMTP id h1-20020a0564020e8100b0048cafae9331mr31101907eda.10.1673338683196;
        Tue, 10 Jan 2023 00:18:03 -0800 (PST)
Message-ID: <474c92a9b26ba8a404db997e1646f1892fa857e0.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: introduce sbi call to putchar to
 console
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 10 Jan 2023 10:18:01 +0200
In-Reply-To: <e33d028f-b6c4-d120-5aa9-36c9f2d02420@suse.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
	 <9b85a963db538e4735a9f99fc9090ad79508cb2c.1673278109.git.oleksii.kurochko@gmail.com>
	 <e33d028f-b6c4-d120-5aa9-36c9f2d02420@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-09 at 17:00 +0100, Jan Beulich wrote:
> On 09.01.2023 16:46, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/sbi.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> > +/*
> > + * Copyright (c) 2021 Vates SAS.
> > + *
> > + * Taken from xvisor, modified by Bobby Eshleman
> > (bobby.eshleman@gmail.com).
> > + *
> > + * Taken/modified from Xvisor project with the following
> > copyright:
> > + *
> > + * Copyright (c) 2019 Western Digital Corporation or its
> > affiliates.
> > + */
> > +
> > +#ifndef __CPU_SBI_H__
> > +#define __CPU_SBI_H__
>=20
> Didn't you mean to change this?
Thanks.

My fault. Missed that. I will double check that and take into account
in new patch series.
>=20
> > +#define SBI_EXT_0_1_CONSOLE_PUTCHAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1
> > +
> > +struct sbiret {
> > +=C2=A0=C2=A0=C2=A0 long error;
> > +=C2=A0=C2=A0=C2=A0 long value;
> > +};
> > +
> > +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
> > unsigned long arg0,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long arg1, unsigne=
d long arg2,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long arg3, unsigne=
d long arg4,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long arg5);
>=20
> Please get indentation right here as well as for the definition.
Thanks for clarification.
> Possible
> forms are
>=20
> struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long arg0, unsigned long arg1,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long arg2, unsigned long arg3,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long arg4, unsigned long arg5);
>=20
> or
>=20
> struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
> =C2=A0=C2=A0=C2=A0 unsigned long arg0, unsigned long arg1,
> =C2=A0=C2=A0=C2=A0 unsigned long arg2, unsigned long arg3,
> =C2=A0=C2=A0=C2=A0 unsigned long arg4, unsigned long arg5);
>=20
> Jan


