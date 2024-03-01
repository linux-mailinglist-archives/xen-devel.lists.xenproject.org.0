Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951BA86DDF4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 10:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687587.1071236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfyz1-0003CU-Br; Fri, 01 Mar 2024 09:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687587.1071236; Fri, 01 Mar 2024 09:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfyz1-0003A3-8O; Fri, 01 Mar 2024 09:15:11 +0000
Received: by outflank-mailman (input) for mailman id 687587;
 Fri, 01 Mar 2024 09:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfCR=KH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rfyz0-00039x-2b
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 09:15:10 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32e253fc-d7ac-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 10:15:09 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3f3d0d2787so276308266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 01:15:08 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a17090652cb00b00a44879da0f3sm468161ejn.143.2024.03.01.01.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 01:15:07 -0800 (PST)
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
X-Inumbo-ID: 32e253fc-d7ac-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709284508; x=1709889308; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LQ7c+pMWAjkhAfGsmL8GcAuh/D5rJKD28a9NdMhn97c=;
        b=noRS2UjVm2Z55AX/pKQPUwzgjRjngpLYJc7GN+fff9VIYFWCXfu3NA0jWFJFureHbq
         dlw2HunTQAGaZKZ7AUfwgWIdPj3RzTihA555BgGNu/pnr9+3ZfhdMXOgIOpUkR3kgW0A
         2u+fnagLlHRE0cwtx66B+1jCR8Gh2YE306lYxjFur3MeRgS3vjQFgsCf+ms+2tLIiS9h
         N8gF/VtRm2eh8Qswjn5XQ2XXq9hV9UgPcL4Y/+rltoGT3N1UPu7MV5fgqBr71gJq9isL
         ROpIuC0u9XVeLkWZxadfnLVGWSikKcCH6nprb5Gb4ANvDl+yv7QLOPdb326FSGnv1d8P
         /4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709284508; x=1709889308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQ7c+pMWAjkhAfGsmL8GcAuh/D5rJKD28a9NdMhn97c=;
        b=hO/eRhgjHJnWmMkniZy56oWUpPUUoRBP+A5JGy5MQCrOfoDx1E6zFHNKp5fzUmmED1
         L8X0g2ELVL9J8sSS433emDlKG5Xfg8Rnl+4w/Wxt60Q99FvKrXiBc7nWXoFfwlHNRlkc
         SV8pxnJPEgXKKzA454sI1XXRbXnd+tVkOX+Zf9Ju3y7azK13WCZMnjUrLeqx1nS40dNj
         8qzu8HzdbO0hYMPoiwYnkZHbBOO8a2bd8FIor3+qZvWu1iPOctPmhoVIQdUURuC3jprI
         DGMkoHot7NzhkrTFTdqVj5nBe7CajIxRhJMNTRWmU7HkWxKW4JA3PEVy3i18/SnsEp00
         gCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjaqwQOup5uIV74kV3+cEnsqYNpYHQm9yi6NP8MLgKaTcm9yH8JcyPmSNYhiGjkyGAwTviHxOkv4VqtiL2eNvGstyZmeltAqLBihCuHtg=
X-Gm-Message-State: AOJu0YyZJDTDnD2BVBtm5QbVekXr5w7o7cXOxpYgrd1zLir4+pn39BNB
	bi8r8ZawdwbqniFRTZJ9u/E/8mKmeoaajnN4b+LWnenpGvailAup
X-Google-Smtp-Source: AGHT+IHQWLtXJG6nRUrvyR4wNEBXUq27yXOicC2LxMMpe6hRaOOxXDcAnyFSsCrHHmC2QpqAMF8SRA==
X-Received: by 2002:a17:906:470a:b0:a44:1f24:d982 with SMTP id y10-20020a170906470a00b00a441f24d982mr883921ejq.50.1709284507555;
        Fri, 01 Mar 2024 01:15:07 -0800 (PST)
Message-ID: <1d9b7966eb94ab424cfb8db3f913cc5e50e7707a.camel@gmail.com>
Subject: Re: [PATCH v5 04/23] xen/asm-generic: introduce generic fls() and
 flsl() functions
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Fri, 01 Mar 2024 10:15:06 +0100
In-Reply-To: <c4332e38-9977-4ad0-9a07-eadac7045802@citrix.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
	 <c4332e38-9977-4ad0-9a07-eadac7045802@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-02-29 at 16:25 +0000, Andrew Cooper wrote:
> On 26/02/2024 5:38 pm, Oleksii Kurochko wrote:
> > These functions can be useful for architectures that don't
> > have corresponding arch-specific instructions.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0Changes in V5:
> > =C2=A0=C2=A0 - new patch
> > ---
> > =C2=A0xen/include/asm-generic/bitops/fls.h=C2=A0 | 18 +++++++++++++++++=
+
> > =C2=A0xen/include/asm-generic/bitops/flsl.h | 10 ++++++++++
> > =C2=A02 files changed, 28 insertions(+)
> > =C2=A0create mode 100644 xen/include/asm-generic/bitops/fls.h
> > =C2=A0create mode 100644 xen/include/asm-generic/bitops/flsl.h
> >=20
> > diff --git a/xen/include/asm-generic/bitops/fls.h
> > b/xen/include/asm-generic/bitops/fls.h
> > new file mode 100644
> > index 0000000000..369a4c790c
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/fls.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_FLS_H_
> > +#define _ASM_GENERIC_BITOPS_FLS_H_
> > +
> > +/**
> > + * fls - find last (most-significant) bit set
> > + * @x: the word to search
> > + *
> > + * This is defined the same way as ffs.
> > + * Note fls(0) =3D 0, fls(1) =3D 1, fls(0x80000000) =3D 32.
> > + */
> > +
> > +static inline int fls(unsigned int x)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return generic_fls(x);
> > +}
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_FLS_H_ */
> > diff --git a/xen/include/asm-generic/bitops/flsl.h
> > b/xen/include/asm-generic/bitops/flsl.h
> > new file mode 100644
> > index 0000000000..d0a2e9c729
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/flsl.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_FLSL_H_
> > +#define _ASM_GENERIC_BITOPS_FLSL_H_
> > +
> > +static inline int flsl(unsigned long x)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return generic_flsl(x);
> > +}
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_FLSL_H_ */
>=20
> Please don't do this.=C2=A0 It's compounding existing problems we have
> with
> bitops, and there's a way to simplify things instead.
>=20
> If you can wait a couple of days, I'll see about finishing and
> posting
> my prototype demonstrating a simplification across all architectures,
> and a reduction of code overall.
Please add me in CC.

~ Oleksii

