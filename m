Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F475FA25
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 16:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569016.889316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwqq-0005g2-53; Mon, 24 Jul 2023 14:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569016.889316; Mon, 24 Jul 2023 14:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwqq-0005dU-1Z; Mon, 24 Jul 2023 14:47:56 +0000
Received: by outflank-mailman (input) for mailman id 569016;
 Mon, 24 Jul 2023 14:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6P8=DK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qNwqo-0005dO-K1
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 14:47:54 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11eaf71b-2a31-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 16:47:53 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso6512750e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 07:47:53 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a19a402000000b004fde41a2059sm1844354lfc.305.2023.07.24.07.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 07:47:52 -0700 (PDT)
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
X-Inumbo-ID: 11eaf71b-2a31-11ee-b23b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690210073; x=1690814873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+v80aDPdHtfvFynUvxEJFCjMaubnRxDeZY7l/HynMo8=;
        b=k6pK8U2UTT686oNU+FEZMd1vAhhSOvJJ0R144h9bKQyudZEyLFYSERLskj4ExEovwr
         OSmCbTR3C7GltRbqNfPZUm+uFLxYSRIq/ICjVkm8PhggdhjtJNKAsqviyd47tT86vwVJ
         nbzMT+5E+V8lflnAzcn93RostkwBgx4LNEOHEbmBI408hXFKG4VYjEcIALOYYFz/EwDm
         upiwSUzKIWeuTn5sWWw3L7qQ7a2UYmY2auZxo4O88R0KrTZ/ZdlpXMaD/a80C18ljkbY
         QZBNAc9+zYFoX9uoPzKLObuvyz6pAkKi4w3hVF56xYBb6udFjUDKZVh4Ez3pT6iXEj2M
         NpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690210073; x=1690814873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+v80aDPdHtfvFynUvxEJFCjMaubnRxDeZY7l/HynMo8=;
        b=WxV6IQ5PX8rqGnN36NIj0eONdMeCoBEr7Xbj/q9ddGVJMSC+9HM2AbVld0OoG48AYb
         XbakW3oNRAtdsd4XVigvX87R3Fi3A4/iOPzMkiuCur4ymOJ4LGCZT66MvZwfWA9DnU5Y
         aHQzKsVlP54JfJ26IxLbyzvaP6NM4o9OCa3/Rj/Kq9GMiWyZJouQm9v7vtAhzwxwTOX8
         VfFXYVptvvt47Gxh2eI3/SBslss6Kg23vardyxtDrFp423ieFcZ3MDBEwkncIkKR4MaM
         Z3uSOr4bK5z78ePQU4VTWceYJPvhdsDoxvvIJErNDCeStUDQNf7Rg7C7T/jdG4FO9EpB
         mHew==
X-Gm-Message-State: ABy/qLbkTSSKqX4qqWVxE8pewUZWq83lV+KcldoeWyWusmvNqJnz6duT
	u1qTNePrfZBNkyGAzZtkC44=
X-Google-Smtp-Source: APBJJlED54JqkCH1IVNvz/AbNxe3t/EDLeGH/xgQ9YYK/oQFHGjCqkQRf+weo/kkXjDlNORpcJlprw==
X-Received: by 2002:a19:f802:0:b0:4f8:6e6e:4100 with SMTP id a2-20020a19f802000000b004f86e6e4100mr5151665lff.52.1690210073042;
        Mon, 24 Jul 2023 07:47:53 -0700 (PDT)
Message-ID: <a5b021b5f17f34c94729b934158f02c53ba70b7f.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] xen/riscv: introduce function for physical
 offset calculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Mon, 24 Jul 2023 17:47:52 +0300
In-Reply-To: <e728eb67-3ec6-65d2-df20-7aa34431546c@suse.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
	 <19817eca0b7d4e8dee7eb5d5e7d3812133925eb3.1690191480.git.oleksii.kurochko@gmail.com>
	 <e728eb67-3ec6-65d2-df20-7aa34431546c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-07-24 at 15:40 +0200, Jan Beulich wrote:
> On 24.07.2023 11:42, Oleksii Kurochko wrote:
> > @@ -19,9 +20,10 @@ struct mmu_desc {
> > =C2=A0=C2=A0=C2=A0=C2=A0 pte_t *pgtbl_base;
> > =C2=A0};
> > =C2=A0
> > -#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> > -#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> > -#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> > +unsigned long __ro_after_init phys_offset;
>=20
> While Misra compliance is distant future for RISC-V, there's a
> problem here with there not being any declaration for this global
> variable. Adding a declaration isn't the only solution though:
> Patch 2 also only uses the variable in assembly code. Therefore
> the variable here could be made static, with ...
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
> > +void __init calc_phys_offset(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 phys_offset =3D (unsigned long)start - XEN_VIRT_STA=
RT;
> > +}
>=20
> ... this function (being invoked by the same assembly code
> function) returning the value alongside storing it.
Thanks for explanation about MISRA compliance.

>=20
> FTAOD I wouldn't insist on this being taken care of right away,
> so if you get a maintainer ack this way, I'd be happy to commit as
> is.
If I don't get an ACK, I'll update the code with the next patch
version.

~ Oleksii

