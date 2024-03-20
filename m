Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239BA881797
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 19:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696124.1086767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn18b-0001bc-Po; Wed, 20 Mar 2024 18:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696124.1086767; Wed, 20 Mar 2024 18:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn18b-0001Yx-NF; Wed, 20 Mar 2024 18:58:09 +0000
Received: by outflank-mailman (input) for mailman id 696124;
 Wed, 20 Mar 2024 18:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5CW=K2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rn18a-0001Xm-BG
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 18:58:08 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9f43a47-e6eb-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 19:58:07 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso20141666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 11:58:07 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 sa19-20020a1709076d1300b00a46bec6da9fsm3795696ejc.203.2024.03.20.11.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 11:58:06 -0700 (PDT)
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
X-Inumbo-ID: c9f43a47-e6eb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710961087; x=1711565887; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g7ezO4P6hTdJzD/Hdbfbir3L0UkUOPXiBwJVmB6lDSk=;
        b=j112ijamYT2pm4/qI5gJEyEXxZpzZFE3G9N3eny7VezdMjUrAyRCd96wmen5UxGMOa
         O9RoaHBRX5vb171UpGVwBz73kWRFKjSgFnsjwVZ0YIR+el4JIe3TWXuYwQVF+pEqagWj
         xHO+WZ2Inp/6t/1cchkOZEHjAF7VySS92H0pK630GwJBMs+MlNI0N4Eakts3zMv3VJXQ
         ndkkCodg58yqOV079j9Kh0T/QvQ3kOIaINanVMGw4L5ZTFZDNQHoxm0i+KM436brSS1s
         a79ihT7/jxzthe7CR10SnYyFEE9BInaX/W3KBP24KrpizQgw496SI/y6YcTqa/OSwfrM
         gYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710961087; x=1711565887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7ezO4P6hTdJzD/Hdbfbir3L0UkUOPXiBwJVmB6lDSk=;
        b=Kc/HscnRjOW7pdvcEDiDUOh3P+zXdwxkmk/V7BQd3ule6e89Fygpr6+ovzg2RM+zyL
         GABLqWAK22YV+VCsNIY7kj9G2A4NU/BT1GuoUIElkxksoxCxPqy4knQpl+Ja0nArldNe
         zGYrYjgocD6hP5eOtY9oosxz9fhLPHztZWREnRFnqRJ2neFHMcv5q1r7MV19o6tOYWxi
         ZM6DjvHVTYe+gqku84PK61liptCX+oppkq568wQmjs08kVrjv7PhLf+ry49HJJc+zzov
         +IeyPxt2D8li0RRi2VVaVSeXzkxjIEf2SDm7BLnJ872IIK9SizDCxSChRVqkqEAiEs0m
         dGMA==
X-Forwarded-Encrypted: i=1; AJvYcCUisen5qkDdDEWYYaRbXpdZPPWEar6G0zY4aJmHyUgUZA+6yIiw1n/QScdsUSkPv3EF/wuOc0l5hUh0F1qBVvIbnK4d1KZaDDRAGLUYXAo=
X-Gm-Message-State: AOJu0YxmgqBSjaual5mWfUaE4BLwFz56uZWwb29qT/0N4/pL/BLczlkt
	e7tz5G6wfyn87DcP9asSxTGqjevZG4JsmoksEE1nlyBRPsLMFA2d
X-Google-Smtp-Source: AGHT+IHX/Eg3Bn7BtdCnoOWyhJgpwvP9erMV2+sfvPFgR+wafaU1btI/L2zoGYisDvq/qR7RoePY7g==
X-Received: by 2002:a17:906:3090:b0:a46:1817:6b35 with SMTP id 16-20020a170906309000b00a4618176b35mr10236357ejv.55.1710961086853;
        Wed, 20 Mar 2024 11:58:06 -0700 (PDT)
Message-ID: <04c1424cec1342dcfb849d361f5eb9f3e7f34734.camel@gmail.com>
Subject: Re: [PATCH v6 03/20] xen/riscv: introduce extenstion support check
 by compiler
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 20 Mar 2024 19:58:05 +0100
In-Reply-To: <6ddc9d8a-20e7-4e4d-ae1a-d2ea01479b38@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
	 <6ddc9d8a-20e7-4e4d-ae1a-d2ea01479b38@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-03-18 at 17:58 +0100, Jan Beulich wrote:
> On 15.03.2024 19:05, Oleksii Kurochko wrote:
> > Currently, RISC-V requires two extensions: _zbb and _zihintpause.
>=20
> Do we really require Zbb already?
After an introduction of Andrew C. patches [1] it is requited for
__builtin_ffs{l}

[1]
https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@c=
itrix.com/T/#t
>=20
> > This patch introduces a compiler check to check if these extensions
> > are supported.
> > Additionally, it introduces the riscv/booting.txt file, which
> > contains
> > information about the extensions that should be supported by the
> > platform.
> >=20
> > In the future, a feature will be introduced to check whether an
> > extension
> > is supported at runtime.
> > However, this feature requires functionality for parsing device
> > tree
> > source (DTS), which is not yet available.
>=20
> Can't you query the CPU for its features?
I couldn't find such reg ( or SBI call ) in the spec.

SBI call sbi_probe_extension() exists, but it doesn't check for every
possible extension. As far as I understand it checks only for that one
which are present in SBI spec.

The most closest thing I see how to check that without dts is how it is
done in OpenSBI:
#define csr_read_allowed(csr_num, trap)				\
	({							\
	register ulong tinfo asm("a3") =3D (ulong)trap;		\
	register ulong ttmp asm("a4");				\
	register ulong mtvec =3D sbi_hart_expected_trap_addr();	\
	register ulong ret =3D
0;					\
	((struct sbi_trap_info *)(trap))->cause =3D 0;		\
	asm volatile(						\
		"add %[ttmp], %[tinfo],
zero\n"			\
		"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"\
		"csrr %[ret],
%[csr]\n"				\
		"csrw " STR(CSR_MTVEC) ", %[mtvec]"		\
	    : [mtvec] "+&r"(mtvec), [tinfo] "+&r"(tinfo),	\
	      [ttmp] "+&r"(ttmp), [ret] "=3D&r" (ret)		\
	    : [csr] "i" (csr_num)				\
	    : "memory");					\
	ret;							\
	})							\
...
	/* Detect if hart supports stimecmp CSR(Sstc extension) */
	if (hfeatures->priv_version >=3D SBI_HART_PRIV_VER_1_12) {
		csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
		if (!trap.cause)
			__sbi_hart_update_extension(hfeatures,
					SBI_HART_EXT_SSTC, true);
	}

~ Oleksii

>=20
> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -3,16 +3,22 @@
> > =C2=A0
> > =C2=A0$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > =C2=A0
> > -CFLAGS-$(CONFIG_RISCV_64) +=3D -mabi=3Dlp64
> > +riscv-abi-$(CONFIG_RISCV_32) :=3D -mabi=3Dilp32
> > +riscv-abi-$(CONFIG_RISCV_64) :=3D -mabi=3Dlp64
> > =C2=A0
> > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_RV64G) :=3D rv64g
> > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :=3D $(riscv-march-y)c
> > =C2=A0
> > +extensions :=3D $(call as-insn,$(CC) $(riscv-abi-y) -march=3D$(riscv-
> > march-y)_zbb,"",_zbb) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 $(call as-insn,$(CC) $(riscv-abi-y) -march=3D$(riscv-
> > march-y)_zihintpause,"pause",_zihintpause)
>=20
> Imo you want another helper macro here, where all one needs to pass
> in is
> the extension name (i.e. zbb and zihintpause as per above). That'll
> also
> help with line length, I hope.
>=20
> Jan


