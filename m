Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD7C779357
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 17:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582596.912442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUUE5-0001xR-HT; Fri, 11 Aug 2023 15:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582596.912442; Fri, 11 Aug 2023 15:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUUE5-0001v9-EU; Fri, 11 Aug 2023 15:38:57 +0000
Received: by outflank-mailman (input) for mailman id 582596;
 Fri, 11 Aug 2023 15:38:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWpM=D4=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qUUE4-0001RI-5b
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 15:38:56 +0000
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [2607:f8b0:4864:20::a34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2de73de7-385d-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 17:38:55 +0200 (CEST)
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4871beff078so585356e0c.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 08:38:55 -0700 (PDT)
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
X-Inumbo-ID: 2de73de7-385d-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691768334; x=1692373134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U06yb8bbDfJnHFyCcqi0409iChPA7rpP5sU8ZyAkNJU=;
        b=N/OusIvR+uEywfkArbOqLyaDUKOaeL8m0E5uzClNbR9lbdwLtDeNhiBPKOIhab2QKb
         HJw0Tf9yQd1oZa5s1R8CIAD8s8Bab8wFZvzr7SonB9KB81l5xgwjSpAaVNvOAWpzSZ+9
         17ZssMgmMPQ7qfYYeHgR9IoV7aAUaos4wLOeuqLCSUqNGlY2QWU+EEV/miZOAijyzHLG
         4grZfZRQ8a02AObE0QgM6eauuPZVBQrg6Vmv6ejaGxEO+AKaGXbVf2T03B6R3EGaDHJD
         +e8H/r3K5SIvq/HUjaSml/48OulEaopy2r9evRq2bS2oWBGKEeNBrb6W/oTpOPax1GPm
         Mexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691768334; x=1692373134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U06yb8bbDfJnHFyCcqi0409iChPA7rpP5sU8ZyAkNJU=;
        b=AiAqVmdDSDAMIyG/ERauFemXUv1pbyoSjUqOr5GsD0h1ps5JdeifBIV6tIxDcfKRJq
         c7NKqlP4nH2D8SbBxTWhfxPRl6DVwb0D6yI3OEAzQOE2dqFtTYnNZI4VuYmv5z8T6tFQ
         J8M55Pp3hhk8X5SpJXBvKCBKxdDFJcEhXKEkP8gr6jeT6VRlwFqje+ok5ZfV4xn4lQry
         gG1in7nSmqvYpmljfmOFh7plSCsHAst4kFZ6rsJP+8Ej2AoRSmhGCxSLkgdJXI4gOSvy
         AauPLTvKHg1W31xgXsodHIFspB6xvXK+8qGRtaI+4vA5SWHw0KegG7+tSVrKwiAWncoa
         jdBg==
X-Gm-Message-State: AOJu0YwSZNKplCjhbG408MT0GK81cSH5weKbTzwiyEypDpOdk6NhtnnE
	Xx+oLll4cDvNuiBk8O9OHfbtM/UQtK8SnL2W3Y9DGZAQtnlXtQ==
X-Google-Smtp-Source: AGHT+IF2Czg4esN8kKyikv56s7kW35fvRxcLewWId73dG32DHAla4wFwaBX9XO4X1F07B3vZ2xQ2CFCJmOOLpQL+gMI=
X-Received: by 2002:a67:e2ce:0:b0:443:7eba:e22c with SMTP id
 i14-20020a67e2ce000000b004437ebae22cmr928485vsm.8.1691768334467; Fri, 11 Aug
 2023 08:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691763757.git.oleksii.kurochko@gmail.com> <ae77b6ad3542d2c2ff2700f82212ec35662d7d15.1691763757.git.oleksii.kurochko@gmail.com>
In-Reply-To: <ae77b6ad3542d2c2ff2700f82212ec35662d7d15.1691763757.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 11:38:28 -0400
Message-ID: <CAKmqyKMGYEs_ZnBzCte9PHZ=H_FG5qeds3NwfxMJZ+k0Y_nSbA@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] xen/riscv: introduce <asm/bug.h>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 10:33=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V8:
>  - new patch. It was introduced instead of dummy asm/bug.h introduction.
> ---
>  xen/arch/riscv/include/asm/bug.h | 37 ++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/bug.h
>
> diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/as=
m/bug.h
> new file mode 100644
> index 0000000000..f5ff96140f
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2021-2023 Vates
> + *
> + */
> +#ifndef _ASM_RISCV_BUG_H
> +#define _ASM_RISCV_BUG_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#define BUG_INSTR "ebreak"
> +
> +/*
> + * The base instruction set has a fixed length of 32-bit naturally align=
ed
> + * instructions.
> + *
> + * There are extensions of variable length ( where each instruction can =
be
> + * any number of 16-bit parcels in length ).
> + *
> + * Compressed ISA is used now where the instruction length is 16 bit  an=
d
> + * 'ebreak' instruction, in this case, can be either 16 or 32 bit (
> + * depending on if compressed ISA is used or not )
> + */
> +#define INSN_LENGTH_MASK        _UL(0x3)
> +#define INSN_LENGTH_32          _UL(0x3)
> +
> +#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
> +#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
> +#define COMPRESSED_INSN_MASK    _UL(0xffff)
> +
> +#define GET_INSN_LENGTH(insn)                               \
> +    (((insn) & INSN_LENGTH_MASK) =3D=3D INSN_LENGTH_32 ? 4 : 2) \
> +
> +#endif /* !__ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_BUG_H */
> --
> 2.41.0
>
>

