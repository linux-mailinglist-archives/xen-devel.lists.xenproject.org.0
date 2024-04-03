Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB236896C80
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700445.1093638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxuV-0002Pz-Oj; Wed, 03 Apr 2024 10:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700445.1093638; Wed, 03 Apr 2024 10:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxuV-0002My-LO; Wed, 03 Apr 2024 10:32:03 +0000
Received: by outflank-mailman (input) for mailman id 700445;
 Wed, 03 Apr 2024 10:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxuU-0002ML-Nr
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:32:02 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679c1c5c-f1a5-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:32:00 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51381021af1so8628242e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:32:00 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a192d43000000b00515b5cd2361sm2012048lft.164.2024.04.03.03.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:31:59 -0700 (PDT)
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
X-Inumbo-ID: 679c1c5c-f1a5-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712140320; x=1712745120; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nzlgtb580luOjYNUllOGwmtHYFxNtC+MZM4d/MnUQKw=;
        b=OLUILpinro7DpkrwhFDpendBFsia+n8k6WNTgxMg6FAhstfyt7me9l/ih+MSNCm7JP
         POszmV0wEfxG5YMNrESYWy/ckyiRFV8ICvpMOkD+oJX34osaFchqLeOsDPmDrGKcXU3l
         8kOSYapQN2b9hY+h23r5e7Yp0YMoVOMnHHImRwHmXrcuCf858u6BwYAfTep7TowptAOw
         2PgdkJfl5S7f8FV3H3LnSAujLuCQlFJxEda1EolhbC47wA+4/BSgifCa/KsNi4NDeLvf
         DFI3WZpBgFhKIB0m8YGcaFnF99ae7lmPKqw99h0bZKH1mSuWIBeQYq36yRiecjlesTix
         Tcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712140320; x=1712745120;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nzlgtb580luOjYNUllOGwmtHYFxNtC+MZM4d/MnUQKw=;
        b=cibi2w+Zn1Yp4qxRc4h03yN0bYlxiUqJs7uDaP1yPq4dw9Rc7cyNw9pickUHeIKxFY
         6VPw6XNpYwV8v0ZZpwgMoaRhAQTt/l/b9FXBJKapLRSb5o9/OTqEpuw7l8qJGx8zV7ZX
         NcpiFP54+ACOy7ODY/Qf3MgyNYokHvLgXsHUT7it7x3q02QaRLeUkdeys+b8kDKOIn5/
         L2WiAmdp8SMASmtV7oT5G5qJfKzn5O31IywwnM0fnnU6uR/g4PG7my7BGU2HjJClMoVI
         WxVt6R5IQYf0EvYRKT4va0Bt17r3DcVsBNq7l+VPpOBMwLyuBYyIEiggkvNn5sf0WQky
         IYyw==
X-Forwarded-Encrypted: i=1; AJvYcCWJSScSQSrfm7BdQDm6d3Ac1qdEtpu7Zh14TFWCYeqI7xmCpt4LGsvVrMAMSP8sIrrcFPySpXqOcpDbt/Mx62/zAuAi3RoYvn7jtSQqViE=
X-Gm-Message-State: AOJu0Yxz1eyfh3ogOIJhAH61XmfXhAzf6ygDDCh8WAkRSN87xgQQsdAK
	Xxug51nHZ3FpHg1IDLAUeteXlOTqP84+/mEIxuTSWTPDbZmX3YZ0
X-Google-Smtp-Source: AGHT+IF1XQCYvZCZN7iDe3k75stAfGwli+GSSwgMHS6ezLj2VS9ZKwZUWpcJCRbIem5aF3nvAFucfA==
X-Received: by 2002:a19:3802:0:b0:513:cc18:d4c6 with SMTP id f2-20020a193802000000b00513cc18d4c6mr3955988lfa.41.1712140319969;
        Wed, 03 Apr 2024 03:31:59 -0700 (PDT)
Message-ID: <f9c57e31ed3caa6f8caec3300b88031963cdaf4a.camel@gmail.com>
Subject: Re: [PATCH 4/4] xen/virtual-region: Drop setup_virtual_regions()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 03 Apr 2024 12:31:58 +0200
In-Reply-To: <14accd85-d549-4551-a95c-6c8bcee92db5@citrix.com>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
	 <20240318110442.3653997-5-andrew.cooper3@citrix.com>
	 <047ecaf2-66c6-4d07-ab14-9c50acfc1f9a@suse.com>
	 <14accd85-d549-4551-a95c-6c8bcee92db5@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-03-18 at 13:49 +0000, Andrew Cooper wrote:
> On 18/03/2024 1:29 pm, Jan Beulich wrote:
> > On 18.03.2024 12:04, Andrew Cooper wrote:
> > > --- a/xen/common/virtual_region.c
> > > +++ b/xen/common/virtual_region.c
> > > @@ -39,6 +39,11 @@ static struct virtual_region core =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { __start_bug_frames=
_2, __stop_bug_frames_2 },
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { __start_bug_frames=
_3, __stop_bug_frames_3 },
> > > =C2=A0=C2=A0=C2=A0=C2=A0 },
> > > +
> > > +#ifdef CONFIG_X86
> > > +=C2=A0=C2=A0=C2=A0 .ex =3D __start___ex_table,
> > > +=C2=A0=C2=A0=C2=A0 .ex_end =3D __stop___ex_table,
> > > +#endif
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/* Becomes irrelevant when __init sections are cleared. */
> > > @@ -57,6 +62,11 @@ static struct virtual_region core_init
> > > __initdata =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { __start_bug_frames=
_2, __stop_bug_frames_2 },
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { __start_bug_frames=
_3, __stop_bug_frames_3 },
> > > =C2=A0=C2=A0=C2=A0=C2=A0 },
> > > +
> > > +#ifdef CONFIG_X86
> > > +=C2=A0=C2=A0=C2=A0 .ex =3D __start___ex_table,
> > > +=C2=A0=C2=A0=C2=A0 .ex_end =3D __stop___ex_table,
> > > +#endif
> > > =C2=A0};
> > My main reservation here is this x86-specific code in a common
> > file.
> > Are we certain both RISC-V and PPC will get away without needing to
> > touch this? If so, I might consider ack-ing. But really I'd prefer
> > if
> > this could be minimally abstracted, via e.g. CONFIG_HAS_EXTABLE
> > (selected by x86 only for now).
>=20
> This isn't the first bit of CONFIG_X86 in this file.=C2=A0 However, I'd
> not
> spotted that we have CONFIG_HAS_EX_TABLE already.=C2=A0 I can swap.
>=20
> As to extable on other architectures, that's not something I can
> answer,
> although it's not something I can see in Oleksii's or Shawn's series
> so far.
That's correct for RISC-V. Currently, I'm not utilizing
__start___ex_table/__stop___ex_table, and setup_virtual_regions() is
called with setup_virtual_regions(NULL, NULL).

~ Oleksii

