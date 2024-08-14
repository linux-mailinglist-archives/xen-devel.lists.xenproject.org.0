Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EAB951ECD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777456.1187603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seG8I-0005QE-Ea; Wed, 14 Aug 2024 15:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777456.1187603; Wed, 14 Aug 2024 15:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seG8I-0005NP-Bl; Wed, 14 Aug 2024 15:41:54 +0000
Received: by outflank-mailman (input) for mailman id 777456;
 Wed, 14 Aug 2024 15:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0xrl=PN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seG8H-0005NJ-M8
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:41:53 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba284c56-5a53-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 17:41:52 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52f025ab3a7so3959251e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:41:52 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f12044sm1337044e87.159.2024.08.14.08.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 08:41:51 -0700 (PDT)
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
X-Inumbo-ID: ba284c56-5a53-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723650112; x=1724254912; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dGEExJE+a9Kh7KeMLmLpQLfOl2+BmWRAle4bkT1qqt0=;
        b=ko1rxoo58nBDZQssqMkkip9OKIeJgVsoSEEdA8FbxhHv39IFOlRQkeio/jjRqWNQR2
         jVRLO8BQWH/Zcmhj00CJrBTS4lliQxeEyOE8Qpj69MJ7+Zr70TLhdjrVD/LXJeq0B0Nl
         CtD5GwYwY08rfO3NIQi05m8Z92e/A8KHhwOL+233dLqesfLiBMUuZjBvb0Iyxa9lEDIS
         /EN5bVsWmUs+KtCh9gJi6hET//pn2txOqtBtyicVxbiHYbK96AT4ex2sYwxjORzlZJft
         q1Xbi99BEG77Z8AbDM4lj+E+A+2n93XXxFnbNeZ7gxXnAdxTCCgg2BJNG0sJKCgeJlhw
         5HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723650112; x=1724254912;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGEExJE+a9Kh7KeMLmLpQLfOl2+BmWRAle4bkT1qqt0=;
        b=BvH72/dqG/X4ns20K1FMhY9LCZeCkU4CblAA1cMm67j0ygVlV+w09yUqyHRHeS/32C
         fOWtnqZFUdlNKYB/m4x27C3z/x16sDPZX8R9Uq3DtR2sfUY/02pPBVPcvPB7DCSIF4yk
         M3CAPyk8AgQKm2bmv04Oy959qFo/boWsOAlMPpG853qA+kGX2RYii4d+tyCtF8y2NeE5
         8g2Ar1IkBXn2lWTHNUJUNfBTaH/deiErfcckPix28v9kvBZpLlQkuaIFRc861zKSdhdj
         MaY/ZpmskLRGxbcVQYd3iwjXf/cVln+6jQ3+NtTwi9LygfGCozsr/pzrJ+oOVCgZmc2R
         rKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU0kVKTyBuAiOnndgwWZbA4+94D8AQT1jXBFbgseCaF/EeT3hNerknsCakE42kENnd0mwp91NOD4pRxfGnW/oESi+NNfbf8GvUDvqYScQ=
X-Gm-Message-State: AOJu0Ywc6Q6/Fp5oNbGHckzXzZOD8VzoZV7XvwMrb+zJsZlOtfcKqsNE
	wV8NUO3nQLmPfsGc/Owyb8MPr2G7/FkehdGulQeXy3KSmS2Z478/
X-Google-Smtp-Source: AGHT+IFMTnmt86hiTPWfs5hO5m2ak3dY7KYLVoc0nP+cfPQHWNnFHXn1hDM3QxY+lFFtpqJGatYb4A==
X-Received: by 2002:a05:6512:3196:b0:52f:c833:861a with SMTP id 2adb3069b0e04-532edbbe9eemr2347804e87.51.1723650111492;
        Wed, 14 Aug 2024 08:41:51 -0700 (PDT)
Message-ID: <34cbaff323d9619f8d4cb1d2b8ed12584037ee0d.camel@gmail.com>
Subject: Re: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 14 Aug 2024 17:41:50 +0200
In-Reply-To: <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
	 <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-13 at 11:34 +0200, Jan Beulich wrote:
> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>=20
> > --- a/xen/arch/riscv/sbi.c
> > +++ b/xen/arch/riscv/sbi.c
> > @@ -7,11 +7,23 @@
> > =C2=A0 * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> > =C2=A0 *
> > =C2=A0 * Copyright (c) 2019 Western Digital Corporation or its
> > affiliates.
> > - * Copyright (c) 2021-2023 Vates SAS.
> > + * Copyright (c) 2021-2024 Vates SAS.
> > =C2=A0 */
> > =C2=A0
> > +#include <xen/compiler.h>
> > +#include <xen/const.h>
> > +#include <xen/cpumask.h>
> > +#include <xen/errno.h>
> > +#include <xen/init.h>
> > +#include <xen/lib.h>
> > +#include <xen/smp.h>
> > +
> > +#include <asm/processor.h>
> > =C2=A0#include <asm/sbi.h>
> > =C2=A0
> > +static unsigned long sbi_spec_version =3D SBI_SPEC_VERSION_DEFAULT;
> > +static unsigned long sbi_fw_id, sbi_fw_version;
>=20
> __ro_after_init for perhaps all three of them?
>=20
> Considering SBI_SPEC_VERSION_{MAJOR,MINOR}_MASK, at least the first
> of them also doesn't need to be unsigned long, but could be unsigned
> int?
It could be unsigned int, this part is declared as unsigned long in
Linux kernel so was taken as is. But based on the possible values for
these variables we can go with unsigned long.

>=20
> > @@ -38,7 +50,245 @@ struct sbiret sbi_ecall(unsigned long ext,
> > unsigned long fid,
> > =C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > =C2=A0}
> > =C2=A0
> > +static int sbi_err_map_xen_errno(int err)
> > +{
> > +=C2=A0=C2=A0=C2=A0 switch ( err )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case SBI_SUCCESS:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +=C2=A0=C2=A0=C2=A0 case SBI_ERR_DENIED:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EACCES;
> > +=C2=A0=C2=A0=C2=A0 case SBI_ERR_INVALID_PARAM:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 case SBI_ERR_INVALID_ADDRESS:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EFAULT;
> > +=C2=A0=C2=A0=C2=A0 case SBI_ERR_NOT_SUPPORTED:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > +=C2=A0=C2=A0=C2=A0 case SBI_ERR_FAILURE:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fallthrough;
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOSYS;
> > +=C2=A0=C2=A0=C2=A0 };
> > +}
> > +
> > =C2=A0void sbi_console_putchar(int ch)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, =
0, 0, 0, 0, 0);
> > =C2=A0}
> > +
> > +static unsigned long sbi_major_version(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_=
SHIFT) &
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SBI_SPEC_VERSION_MAJOR_MASK=
;
> > +}
>=20
> Can you use MASK_EXTR() here, allowing to even drop the separate
> SBI_SPEC_VERSION_MAJOR_SHIFT?
I am not sure that:
(sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) &=20
SBI_SPEC_VERSION_MAJOR_MASK =3D=3D MASK_EXTR(sbi_spec_version,
SBI_SPEC_VERSION_MAJOR_MASK)

>=20
> > +static unsigned long sbi_minor_version(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return sbi_spec_version & SBI_SPEC_VERSION_MINOR_MA=
SK;
> > +}
>=20
> For consistency here then, too.
Here we can use MASK_EXTR.

>=20
> > +static long sbi_ext_base_func(long fid)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct sbiret ret;
> > +
> > +=C2=A0=C2=A0=C2=A0 ret =3D sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0,=
 0);
> > +=C2=A0=C2=A0=C2=A0 if ( !ret.error )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret.value;
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret.error;
>=20
> With the folding of two distinct values, how is the caller going to
> tell failure from success?
By checking if the return value is < 0.
According to the SBI spec [
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/binary-encod=
ing.adoc?plain=3D1#L32
] ret.error can be or 0 ( which means success ) or something < 0 if it
was a failure.

>=20
> > +}
> > +
> > +static int __sbi_rfence_v02_real(unsigned long fid,
>=20
> Are the double leading underscores really necessary here? (Same again
> further down.)
No at all, I'll drop it.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long hmask, unsig=
ned
> > long hbase,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long start, unsig=
ned
> > long size,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long arg4)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct sbiret ret =3D {0};
> > +=C2=A0=C2=A0=C2=A0 int result =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( fid )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case SBI_EXT_RFENCE_REMOTE_FENCE_I:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D sbi_ecall(SBI_EXT_R=
FENCE, fid, hmask, hbase,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0, 0, 0, 0);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D sbi_ecall(SBI_EXT_R=
FENCE, fid, hmask, hbase,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 start, size, 0, 0);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D sbi_ecall(SBI_EXT_R=
FENCE, fid, hmask, hbase,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 start, size, arg4, 0);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D sbi_ecall(SBI_EXT_R=
FENCE, fid, hmask, hbase,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 start, size, 0, 0);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>=20
> How is e.g. this different from SBI_EXT_RFENCE_REMOTE_SFENCE_VMA
> handling? To ease recognition, I think you want to fold cases with
> identical handling.
Agree, it could be folded for some cases.

>=20
> > +int sbi_remote_sfence_vma(cpumask_t *cpu_mask,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long start_addr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long size)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VM=
A,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_m=
ask, start_addr, size, 0, 0);
>=20
> No check (not even an assertion) here for __sbi_rfence still being
> NULL?
I thought that it would be enough to have BUG_ON() in sbi_init() but
then probably would be better to update the message inside BUG_ON():
   int __init sbi_init(void)
   {
   ....
  =20
       if ( !sbi_has_rfence() )
       {
           BUG_ON("At the moment flush_xen_tlb_range_va() uses SBI rfence
   to "
                  "flush TLB for all CPUS!");
       }
  =20
       return 0;
   }
>=20
> > +int __init sbi_init(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0 ret =3D sbi_get_spec_version();
> > +=C2=A0=C2=A0=C2=A0 if ( ret > 0 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi_spec_version =3D ret;
>=20
> Truncation from long to int is not an issue here?
No, spec_version doesn't have such big numbers, the latest version is
v2.0.

>=20
> > +=C2=A0=C2=A0=C2=A0 printk("SBI specification v%lu.%lu detected\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi=
_major_version(), sbi_minor_version());
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !sbi_spec_is_0_1() )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi_fw_id =3D sbi_get_firmw=
are_id();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi_fw_version =3D sbi_get_=
firmware_version();
>=20
> These cannot return errors?
At least, SBI specs don't tell that directly:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-base.ado=
c?plain=3D1#L31

~ Oleksii


