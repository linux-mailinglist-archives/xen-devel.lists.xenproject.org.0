Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F58AACE8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708959.1108191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlY4-0005ft-8L; Fri, 19 Apr 2024 10:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708959.1108191; Fri, 19 Apr 2024 10:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlY4-0005ck-5h; Fri, 19 Apr 2024 10:32:52 +0000
Received: by outflank-mailman (input) for mailman id 708959;
 Fri, 19 Apr 2024 10:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txqa=LY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rxlY3-0005ce-5p
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:32:51 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b09f4a0-fe38-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 12:32:49 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a51beae2f13so212312866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:32:49 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a17090657d400b00a51b403e30esm2034478ejr.90.2024.04.19.03.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:32:47 -0700 (PDT)
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
X-Inumbo-ID: 2b09f4a0-fe38-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713522768; x=1714127568; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n+bd6wmP0nxVLG+5RVw2NdEvLYrvGRmkuejR+CIvqG0=;
        b=JZEqobz3xVnUihmFxKPrkAfzzthaui/JsIsKz8MLtXAyDwrj8BnxPVDwYeMQdGgE3I
         W1iRX+pzifqTo6kriKth2O8BoCLWg51iDI0gT27g0RJo1AJHRMGqPzUx8nCanftcqoxk
         8GB8ijgLIXdZUXVsqcwXF6Y59VuMHo9vddRIkrZVL7ZQ+DK+AR5+cCtebVM7Ww4wqH45
         zbDZOExEObCHke9GGz5ylZrqVG8AYuxVeaetTDBp6YwPTv1IZ9zGTXGztDRTgcJW9wYg
         p9F15MkOuxiBrJ+r2yic+cmZ7OaWX/N2zgdF+4DSVMiohNAHvfIRSnbAnBzBQCK7J5/w
         QWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713522768; x=1714127568;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+bd6wmP0nxVLG+5RVw2NdEvLYrvGRmkuejR+CIvqG0=;
        b=VqXCjPCemOZtioRk8saQGOYbmCLfyR3fSk7PSVeaZlfQPTTAp2Q2W+7fYsHIfrD4jY
         6lj2Pm2gxfFvaXnIKuSFYkn+7Ac63Vrn7bOALZH2puYAL8F23lT4DxdxnKsUWCPJylZF
         RqlUNHmf9IVDMIBCnDLF1+7LlJ0yAUDz9a1ePt9/+KqhSlGLVhH2EgNG/LrD0W2gZVbP
         S4F3XRzjrzEpWxOBiaSsRkOdBokhGjtXdjEbkRRZWqp9nTFQ5j7wnGQvMqnuXsKiX6TK
         mmWQeNbbyI8VMsPoxDvBcvo4dJ7QSHg+Ng+IMVNWQ+7dXOc+sQRfnB0MJ492YjGiyNr7
         2Qpw==
X-Gm-Message-State: AOJu0Yy2ApY8NitkuuV3fuqwAHkR8zMzK8INJRx+URAOX193bG19TxDx
	Gl//QcAisKXPSuuiVEWAnYZ+AcJr/fzCzsg7ybBbJa72rOGj/VGVC4xrZw==
X-Google-Smtp-Source: AGHT+IGDYiZ8mi1wHfJMRmtN1d271e3n1y7W+lAMNH2ajgSgm8pcRak3HcMZ6JFCkfMA6KmaILmBhg==
X-Received: by 2002:a17:906:7f9a:b0:a52:14b3:480c with SMTP id f26-20020a1709067f9a00b00a5214b3480cmr1089908ejr.76.1713522767898;
        Fri, 19 Apr 2024 03:32:47 -0700 (PDT)
Message-ID: <fd67a1803eb5b358f18b3f986a7fa193aa707122.camel@gmail.com>
Subject: Re: [PATCH v2] xen/riscv: check whether the assembler has Zbb
 extension support
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Fri, 19 Apr 2024 12:32:46 +0200
In-Reply-To: <750fa79aecfae43031cbcda2b2f91248199d0794.1713522163.git.oleksii.kurochko@gmail.com>
References: 
	<750fa79aecfae43031cbcda2b2f91248199d0794.1713522163.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-04-19 at 12:26 +0200, Oleksii Kurochko wrote:
> Update the argument of the as-insn for the Zbb case to verify that
> Zbb is supported not only by a compiler, but also by an assembler.
>=20
> Also, check_extenstion(ext_name, "insn") helper macro is introduced
> to check whether extension is supported by a compiler and an
> assembler.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> =C2=A0xen/arch/riscv/arch.mk | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index 53f3575e7d..a3d7d97ab6 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -11,9 +11,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 :=3D
> $(riscv-march-y)c
> =C2=A0
> =C2=A0riscv-generic-flags :=3D $(riscv-abi-y) -march=3D$(riscv-march-y)
> =C2=A0
> -zbb :=3D $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
> -zihintpause :=3D $(call as-insn, \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(riscv-generi=
c-
> flags)_zihintpause,"pause",_zihintpause)
> +# check_extension: Check whether extenstion is supported by a
> compiler and
> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an assembler.
> +# Usage: $(call check_extension,extension_name,"instr")
> +check_extension =3D $(call as-insn,$(CC)
I missed to use correct naming. should be 'check-extension'.
I will sent a new patch version. Sorry for flooding.

~ Oleksii

> $(riscv-generic-flags)_$(1),$(2),_$(1))
> +
> +zbb_insn :=3D "andn t0, t0, t0"
> +zbb :=3D $(call check_extension,zbb,$(zbb_insn))
> +zihintpause :=3D $(call check_extension,zihintpause,"pause")
> =C2=A0
> =C2=A0extensions :=3D $(zbb) $(zihintpause)
> =C2=A0


