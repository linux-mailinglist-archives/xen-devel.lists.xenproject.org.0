Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B4718AC8
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 22:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541959.845258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4S5y-0003Cq-NX; Wed, 31 May 2023 20:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541959.845258; Wed, 31 May 2023 20:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4S5y-0003Am-Kb; Wed, 31 May 2023 20:06:58 +0000
Received: by outflank-mailman (input) for mailman id 541959;
 Wed, 31 May 2023 20:06:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X43w=BU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q4S5w-0003Ag-Bx
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 20:06:56 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b09bd5fe-ffee-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 22:06:55 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af278ca45eso1036251fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 13:06:54 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a2e968a000000b002ab2184a9basm3380329lji.109.2023.05.31.13.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 13:06:53 -0700 (PDT)
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
X-Inumbo-ID: b09bd5fe-ffee-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685563614; x=1688155614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tgsrApDL9dgyD9ANjfTSA4bxrsQ0ncubH9yaAJaq4Wo=;
        b=eR+gqR77LqziY3tVuDPKoI4KRDG0iRqQWNTkTtPKW3yKPcU4BQIinwBsqPWZGQVJGJ
         wRhyBZU5hCOl/DDv2GEpXxsrxHupEl4gURmgwa12YWLVpeppD6vGnh0xE9eHMxJngCc2
         rW8cxSANyxel2SZyr+KfwMbfQws6owznZeED35QWC3eg2KeduqOH7g9/WgEF2UqkJVXL
         SOYKWwGBVolzNxuESwBTH1caU3TM/qsn8y4OG7cZZ1+mbN3h9Cpy0Dm9/yXFHjQIFrL5
         3Qbq4tPMsAXtTrQxz2R6fqlCNEqlJA/LF1zRE32IqpxOdyrrSUK+g82XIFCZAv61ThK2
         CVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685563614; x=1688155614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tgsrApDL9dgyD9ANjfTSA4bxrsQ0ncubH9yaAJaq4Wo=;
        b=KvyCJ4oWLSYUwQG0AZzN2UGgsGlfEwz1eW4qdK9zFTduxiBofc7cQx2vWKCuNabzmL
         Jusd8lCl8s4L1d1ERH2yOcQvMPIM37/B34j4jtYU0aUgPfF5mY+HTBb8S0bpfyAwrhHT
         U2lBhVORpoT5nX5BOtolpJCto7Im0YjjZfntN0wfBJtyP8jAVL7lqcxFkSi5cnB2GlE9
         +fuZlTdaNfrxHIM00xg3U3vrN4i4OsCtcNv7N9s6fSHE4aUsMRcl8RRrshL67RN3JPvU
         hVLgzKf/Zm/erLI/3CXze8uflcSUFe1s0L0Y7heLFXP8eTc2Lwi2l5KWRLOdCc4TwL8P
         meNQ==
X-Gm-Message-State: AC+VfDwHKZYFQIsQEaFtxO3pjA47p1r9ZzOMC3sEKE4AGiikPipWqB0c
	O/TXrMlUMCZhH4E0xyZd4ItMxWfTAHA=
X-Google-Smtp-Source: ACHHUZ4f9Hf9kz/XyQh4O0me7whV2krYZ6u4igJyWdgzvZcf4Yh2iiOJcNDeUe2RoVit0C9DwWs30A==
X-Received: by 2002:a2e:8782:0:b0:2ab:e50:315a with SMTP id n2-20020a2e8782000000b002ab0e50315amr3431050lji.51.1685563614008;
        Wed, 31 May 2023 13:06:54 -0700 (PDT)
Message-ID: <4073258b3a3c6a0cb19843f02941d1e62e6f882d.camel@gmail.com>
Subject: Re: [PATCH v6 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
 xen-devel@lists.xenproject.org
Date: Wed, 31 May 2023 23:06:52 +0300
In-Reply-To: <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
	 <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
	 <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-05-30 at 18:00 +0200, Jan Beulich wrote:
> > +static uint32_t read_instr(unsigned long pc)
> > +{
> > +=C2=A0=C2=A0=C2=A0 uint16_t instr16 =3D *(uint16_t *)pc;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (uint32_t)instr16;
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return *(uint32_t *)pc;
> > +}
>=20
> As long as this function is only used on Xen code, it's kind of okay.
> There you/we control whether code can change behind our backs. But as
> soon as you might use this on guest code, the double read is going to
> be a problem
Will it be enough to add a comment that read_instr() should be used
only on Xen code? Or it is needed to introduce some lock?

> (I think; I wonder how hardware is supposed to deal with
> the situation: Maybe they indeed fetch in 16-bit quantities?).
I thought that it reads amount of bytes corresponded to i-cache size
and then the pipeline tracks whether an instruction is 16  or 32 bit.

At least something similar is done for BOOM RISC-V CPU [1].

[1]
https://github.com/riscv-boom/riscv-boom/blob/master/docs/sections/instruct=
ion-fetch-stage.rst#id64

