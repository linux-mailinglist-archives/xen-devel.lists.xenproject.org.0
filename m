Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DDF68C31A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 17:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490613.759395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4Gm-00062L-9N; Mon, 06 Feb 2023 16:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490613.759395; Mon, 06 Feb 2023 16:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4Gm-0005zi-6Q; Mon, 06 Feb 2023 16:23:04 +0000
Received: by outflank-mailman (input) for mailman id 490613;
 Mon, 06 Feb 2023 16:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K59t=6C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pP4Gl-0005zc-H6
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 16:23:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a13fee-a63a-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 17:23:00 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso11195049wms.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 08:23:00 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 h3-20020a056000000300b002c3e5652744sm3560203wrx.46.2023.02.06.08.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 08:22:59 -0800 (PST)
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
X-Inumbo-ID: 85a13fee-a63a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8rfQVn4uRlB7fZSqyxTk1LcsrKMyU63zgYLlBESl7j8=;
        b=TFtAjVZqXhXpBDHQ3qO6ZM1fe/hzgZd2Z35yUJ+c4q5ac2srn/sQHy5EEUUk2l0g6y
         5l16EycSUZN24AnATN4x0dHFPsZtWTbAATnjOlg4J3w4Hj1Jmu1hGBjRcmyrEQAyCSxJ
         xDAcMR8K0ZjuTOGxs00n7YWmGre/XvdlOgq1Sv4rqY+5sUgKsoJy+VgUyxfv/Bsvq2pS
         6NRNR6sbf4e9hAy9xnvkqYU/G6Cv0u9gQ7HWmZCzfXVkch9X/iZ0c3aDKeH1rTO9VpMa
         lOOGaocGUdA76aSldIr8DRanyH0e8Qy7wWQ0//W8OqsAxnGjDDD/r+hfXYD3bbI2lPeg
         cSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rfQVn4uRlB7fZSqyxTk1LcsrKMyU63zgYLlBESl7j8=;
        b=FSYDr/FdK+8avZ6V9aUqTicBLZrhjV0mdm8awLHumDTTGe02aEl+3tu6taiHYHEar0
         08vXnWrC9J/ZvclLgpl5FC+qpHbctKsU/3s+wOfaHLmJu2H6vCQveRoFZ2RbfcegIlvE
         bOnuYY5UHHYoQpvpwpI5nXBkcyrtZ+ye27QmpAQ0hZRBOosdoTgjYcr+MFVpUNhpuaKW
         bROR3anKrRFmUDz0ATnYU2vTcj0QzDGfq3ehZjy05fWyteWIRqcX0rCqIlHTXD/bzR2W
         0tg9u40ZxcMJUjB1Egl+6fwcBaBaAnBCUwXF3A6Y32vz3lUKwyKSO6/NY2S2KvsaYlUG
         26Zg==
X-Gm-Message-State: AO0yUKWlLo6Y9CZWrI8Ma4mtHID5y3/uxU4+nPwUBFq9Q+FPgmMQqUID
	JsDjmIp5zeDYiTrI4k0Au0E=
X-Google-Smtp-Source: AK7set+YHK++9tVXbUl/UKRKDcrko5zY/aUPDwtSR6JzkBYmFs/AKS8Jwm2vdJn5cpL26z5FBj4bOg==
X-Received: by 2002:a05:600c:170a:b0:3d0:6a57:66a5 with SMTP id c10-20020a05600c170a00b003d06a5766a5mr343904wmn.0.1675700579524;
        Mon, 06 Feb 2023 08:22:59 -0800 (PST)
Message-ID: <f50f6028ee9055e84bb9e795a7a4218958bb3981.camel@gmail.com>
Subject: Re: [PATCH v2 02/14] xen/riscv: add <asm/asm.h> header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Mon, 06 Feb 2023 18:22:57 +0200
In-Reply-To: <9a098db8e3fef97df987b2a7330333b51a21cb8c.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <9a098db8e3fef97df987b2a7330333b51a21cb8c.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Andrew,

In the previous version of the patch series you mentioned that it is
possible to re-use some parts from the existing code base.

Could you please provide me with an example?

I assume that __ASM_STR should be present somewhere but other parts of
the header looks like it is arch-specific.

~ Oleksii

On Fri, 2023-01-27 at 15:59 +0200, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> =C2=A0 - Nothing changed
> ---
> =C2=A0xen/arch/riscv/include/asm/asm.h | 54
> ++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 54 insertions(+)
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/asm.h
>=20
> diff --git a/xen/arch/riscv/include/asm/asm.h
> b/xen/arch/riscv/include/asm/asm.h
> new file mode 100644
> index 0000000000..6d426ecea7
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/asm.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only) */
> +/*
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_ASM_H
> +#define _ASM_RISCV_ASM_H
> +
> +#ifdef __ASSEMBLY__
> +#define __ASM_STR(x)=C2=A0=C2=A0=C2=A0x
> +#else
> +#define __ASM_STR(x)=C2=A0=C2=A0=C2=A0#x
> +#endif
> +
> +#if __riscv_xlen =3D=3D 64
> +#define __REG_SEL(a, b)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0_=
_ASM_STR(a)
> +#elif __riscv_xlen =3D=3D 32
> +#define __REG_SEL(a, b)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0_=
_ASM_STR(b)
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +
> +#define REG_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0__REG_SEL(ld, lw)
> +#define REG_S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0__REG_SEL(sd, sw)
> +
> +#if __SIZEOF_POINTER__ =3D=3D 8
> +#ifdef __ASSEMBLY__
> +#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dword
> +#else
> +#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0".dword"
> +#endif
> +#elif __SIZEOF_POINTER__ =3D=3D 4
> +#ifdef __ASSEMBLY__
> +#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.word
> +#else
> +#define RISCV_PTR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0".word"
> +#endif
> +#else
> +#error "Unexpected __SIZEOF_POINTER__"
> +#endif
> +
> +#if (__SIZEOF_INT__ =3D=3D 4)
> +#define RISCV_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__ASM_STR(.word)
> +#else
> +#error "Unexpected __SIZEOF_INT__"
> +#endif
> +
> +#if (__SIZEOF_SHORT__ =3D=3D 2)
> +#define RISCV_SHORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__ASM_STR(.half)
> +#else
> +#error "Unexpected __SIZEOF_SHORT__"
> +#endif
> +
> +#endif /* _ASM_RISCV_ASM_H */


