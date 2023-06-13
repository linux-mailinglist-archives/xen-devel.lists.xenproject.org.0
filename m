Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132F72EA38
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548373.856308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q988S-0003oF-PC; Tue, 13 Jun 2023 17:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548373.856308; Tue, 13 Jun 2023 17:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q988S-0003lZ-MK; Tue, 13 Jun 2023 17:48:52 +0000
Received: by outflank-mailman (input) for mailman id 548373;
 Tue, 13 Jun 2023 17:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szI4=CB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q988Q-0003lN-Mm
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:48:50 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d99750b-0a12-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 19:48:49 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f74cda5f1dso2805671e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 10:48:49 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n5-20020ac24905000000b004eed68a68efsm1865662lfi.280.2023.06.13.10.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 10:48:48 -0700 (PDT)
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
X-Inumbo-ID: 8d99750b-0a12-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686678529; x=1689270529;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZqoiwzBTzT05Ws02wGTYNy1k4OjyTdoJW4iWXXA0yYo=;
        b=SUAHOf57lP5TNNMUghZ3PM9XO9fYz3kA/zpzw2ecT9Gl5IA7MuSan+ptN91Rpcybft
         eW/Rw+wgyroHHwMi5xRN6s138D7Eq4J5dbxFIrY7bX1pxwLptu2K3KwANRdHUDEiw6Ck
         sdI3kFFJN2q3OGvPqiHP+MEoD76SBauqx91/n1ymVL1WSq6ZsbI6TNkBmACkJvTfBBhV
         Ltr8qArxBJOEpFhhHs8Ip6Cl356fPfSHoYbLUj2/I++2GM5ueNFuDf2UF33VFY1wEz7P
         gKl7pX3bbYuLiFXUF3qhuqRvRarwTGJy+UYHQJrRm830kmXKpBmw7PKCa8qitSQvNJJg
         MdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678529; x=1689270529;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqoiwzBTzT05Ws02wGTYNy1k4OjyTdoJW4iWXXA0yYo=;
        b=P3HsQ8iIu01mH3YpK7KKAZ5lOZO6NJSuSKE0atPYmH+YmhFjxb0eGSz9toncp1mDS3
         VNgJPv2SIxpF0vQn/+T/B/l/Rc8CfC0TgwJ4ISDqePndNFnSCphhopM3gzdmYdv0gwwF
         XEANb1uxeLa+8sggScvMLU4tRhD4hLM9fwuB7fyLJnnigU0Tfgijni/7OGu3adk1PXsg
         B0VhkW/XcVNR/scI9S4C0XmHqCh4FHrLfstZEJrT44WOG1N/YHOy4YON/DhiyjpGHfv2
         1foqeiUpzJJ+YxNyd2CmXj98eUWHFQoQV3AJHuKrl5aSr7MveBb4QoxqaUVxPshDAoRH
         DqwQ==
X-Gm-Message-State: AC+VfDwuyE2a7vTKPFLDY3OOnVWG3EQP7DxJsrJvlLfioAYHgQsFktL/
	ffiADywekWB8+Ya51Erpry4=
X-Google-Smtp-Source: ACHHUZ5ISHlDzRMzH7HVKanXJ7IEZge1M/8KaY43zZFPl2DsnImuSrrG3qv4Zh/ta9FEnfEgZIhCaA==
X-Received: by 2002:a05:6512:604:b0:4f4:b0d0:63fb with SMTP id b4-20020a056512060400b004f4b0d063fbmr6096332lfe.35.1686678529095;
        Tue, 13 Jun 2023 10:48:49 -0700 (PDT)
Message-ID: <324b30c3b9e3e2049f20278c3b68ddc53b63b1e0.camel@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce function for physical
 offset calculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 13 Jun 2023 20:48:47 +0300
In-Reply-To: <726a9d97-aab1-f6d7-ab97-d75cf47b4c2d@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <d5971bce174c7bbae61c7e16337ef95c7f3d1f62.1686080337.git.oleksii.kurochko@gmail.com>
	 <726a9d97-aab1-f6d7-ab97-d75cf47b4c2d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-06-12 at 09:15 +0200, Jan Beulich wrote:
> On 06.06.2023 21:55, Oleksii Kurochko wrote:
> > The function was introduced to not calculate and save physical
> > offset before MMU is enabled because access to start() is
> > PC-relative and in case of linker_addr !=3D load_addr it will result
> > in incorrect value in phys_offset.
>=20
> "... to _not_ calculate ..."?
_not_ should be dropped. Thanks.

>=20
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -19,9 +19,11 @@ struct mmu_desc {
> > =C2=A0
> > =C2=A0extern unsigned char cpu0_boot_stack[STACK_SIZE];
> > =C2=A0
> > -#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> > -#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> > -#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> > +static unsigned long phys_offset;
>=20
> __ro_after_init?
It makes sense to mark variable as __ro_after_init. I'll take into
account in new version of patch.

>=20
> > +#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
> > +#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
> > +
> > =C2=A0
>=20
> Nit: No double blank lines please.
Sorry. Missed that.

>=20
> > @@ -273,3 +275,13 @@ void __init noreturn noinline enable_mmu()
> > =C2=A0=C2=A0=C2=A0=C2=A0 switch_stack_and_jump((unsigned long)cpu0_boot=
_stack +
> > STACK_SIZE,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 cont_after_mmu_is_enabled);
> > =C2=A0}
> > +
> > +/*
> > + * calc_phys_offset() should be used before MMU is enabled because
> > access to
> > + * start() is PC-relative and in case when load_addr !=3D
> > linker_addr phys_offset
> > + * will have an incorrect value
> > + */
> > +void=C2=A0 calc_phys_offset(void)
>=20
> __init? And nit: No double blanks please.
Thanks. It should be __init. I'll remove double blanks in new patch
version.

~ Oleksii


