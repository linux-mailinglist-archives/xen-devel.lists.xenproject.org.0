Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CD82D629
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667264.1038353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJPu-0005PA-5b; Mon, 15 Jan 2024 09:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667264.1038353; Mon, 15 Jan 2024 09:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJPu-0005Nb-2p; Mon, 15 Jan 2024 09:38:02 +0000
Received: by outflank-mailman (input) for mailman id 667264;
 Mon, 15 Jan 2024 09:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGva=IZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPJPs-0005NT-Fx
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 09:38:00 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5442180-b389-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 10:37:59 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50eabfac2b7so9825609e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 01:37:59 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a198c0b000000b0050e7b6ee12bsm1440446lfd.296.2024.01.15.01.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 01:37:58 -0800 (PST)
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
X-Inumbo-ID: c5442180-b389-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705311479; x=1705916279; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vlRTL88w8z+BqsXDPeQfiAuCSdodVvVf+jInYcxjbbc=;
        b=Ng+dysYgmbVs8vnZ6Ub1VKd6VAbmZVRHicPxENkcCBysqj2shAoqROlWXIs/zbNzuw
         D9A6V9MyllbpD5FTRiH7LqHzjzGNifGceQeZR33qinnxfgOWuNbB9bj8Gvpv2w54Rsef
         Nru0HoWEGdmOCarOvDB+qVrPNHBpf2T5mVifLLEotCl9IwTwvO8X9j2lca65pu0l7MsE
         LmPKddhdM+JP0/83De6oDCC5Vzmp4+neRIZHk0qPOryyiF7p9juIRHMCAiJslZQI49ck
         3AB2zeS0DkJdHRMWkjJf+VjtQjd/vWjb7JNkzvI/PMy9RU8FNGg/kzPJWS3AwIMSqnrt
         Rhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705311479; x=1705916279;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlRTL88w8z+BqsXDPeQfiAuCSdodVvVf+jInYcxjbbc=;
        b=H5AedqsYqbwkEmlMSFXbZQFAHL0rSGOBvpkFBaE4TAVmP+xv5AW8cdVJX2XEGx2oD0
         Ej4l1jFXvOOaHxyRd3pj+rZ2zEMk1AO624zHNlb4DzQpnuoZDNWqM5rH7Br6qfv6JO3c
         R+7LRF/lf0e3STj4koi7XkRMIkjxePvqVXs02oimsEaeHFTvBeeAwzmcTX6QgcMLNcQL
         1OLeUUJe78arS9mkySn4KT2JJZy43eVpQSGYvcfXQY9rtWqnS9elSntqMty9QXWs3m5o
         frnaXQav/OyqDQ5i0lLDhDQutQvB3Wusw8mdE7xwC2huiy9MrwPaM0q35KgejUoc7STK
         nDSw==
X-Gm-Message-State: AOJu0YwUhpsY09b9eGHjbSn73XGh9UmewnA+zXrOnnyPykqWP4+apTI0
	b8tHd6Q3LcK2BulIC/RYA8g=
X-Google-Smtp-Source: AGHT+IHEZySFt3QRwEzI9PSk6F8XgiLSJ5eO0z4AFbzcwBAyABl0sFVRDYqHsciRUNsM8vm+7KfNyA==
X-Received: by 2002:a05:6512:3ca4:b0:50e:73a1:f514 with SMTP id h36-20020a0565123ca400b0050e73a1f514mr2878702lfv.9.1705311478976;
        Mon, 15 Jan 2024 01:37:58 -0800 (PST)
Message-ID: <e73673678efcd9402e4548829797dcbc36b654af.camel@gmail.com>
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
Date: Mon, 15 Jan 2024 11:37:58 +0200
In-Reply-To: <f0de2480-3846-45f9-9573-27da24ff076c@raptorengineering.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
	 <f0de2480-3846-45f9-9573-27da24ff076c@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-11 at 17:11 -0600, Shawn Anastasio wrote:
> Hi Oleksii,
>=20
> On 12/22/23 9:13 AM, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- add SPDX
> > =C2=A0- drop unneeded for now p2m types.
> > =C2=A0- return false in all functions implemented with BUG() inside.
> > =C2=A0- update the commit message
> > ---
> > Changes in V2:
> > =C2=A0- Nothing changed. Only rebase.
> > ---
> > =C2=A0xen/arch/ppc/include/asm/p2m.h=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0xen/arch/riscv/include/asm/p2m.h | 102
> > +++++++++++++++++++++++++++++++
> > =C2=A02 files changed, 103 insertions(+), 2 deletions(-)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/p2m.h
> >=20
> > diff --git a/xen/arch/ppc/include/asm/p2m.h
> > b/xen/arch/ppc/include/asm/p2m.h
> > index 25ba054668..3bc05b7c05 100644
> > --- a/xen/arch/ppc/include/asm/p2m.h
> > +++ b/xen/arch/ppc/include/asm/p2m.h
> > @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct
> > domain *d)
> > =C2=A0static inline int guest_physmap_mark_populate_on_demand(struct
> > domain *d, unsigned long gfn,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned
> > int order)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -=C2=A0=C2=A0=C2=A0 return 1;
> > +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > =C2=A0}
> >=20
>=20
> Was this change included by mistake? I'm not sure why this patch
> should
> touch PPC's p2m.h.
I think you are right. It's mistake. RISC-V has the similar p2m.h so I
faulty changed PPC version too.

Thanks.

~ Oleksii

