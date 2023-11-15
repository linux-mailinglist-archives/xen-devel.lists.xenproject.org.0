Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB66F7EBF32
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 10:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633523.988375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Bvc-00079j-I8; Wed, 15 Nov 2023 09:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633523.988375; Wed, 15 Nov 2023 09:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Bvc-00077k-FW; Wed, 15 Nov 2023 09:11:20 +0000
Received: by outflank-mailman (input) for mailman id 633523;
 Wed, 15 Nov 2023 09:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CM7O=G4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3Bva-00077e-AO
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 09:11:18 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edcae9c9-8396-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 10:11:15 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso958149166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 01:11:15 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 gy18-20020a170906f25200b009b95787eb6dsm6756487ejb.48.2023.11.15.01.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 01:11:14 -0800 (PST)
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
X-Inumbo-ID: edcae9c9-8396-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700039475; x=1700644275; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZyoyzJ3TG71RLMcSn7Yt3Uv3VvHi975XYyaZgL9PFq8=;
        b=ICW/2dFLyR0BWzEISH6VygRtoJj2RUtdXzkKkPVepCu/GA6OZCrYjg1j8MF3ciZ9Wu
         7F8oFDxkP89xsNoLdyBGqojaeBlSVxdEtXoxMF+R1tzt+1xMXCTz5j0gq01fBk8/5k1j
         mBy1xIaJxTg8vQrVyalHgqwKt9ZD2ScP5YLpxUptkNSOs4W4Ui0E+/7timjn90s347Xr
         Xlv84GcwNIl7JSZi42yWtofKt/gZZ2yLKgM08dkTMeiiksnWtNUEUBxZoYk1HmyJm0Ng
         vc9XHiBABeO9NVx7IePzzUNtriV4flGKRk4uOJWAFNLNDUB59vokmnO7yKi1uYm4sYNe
         lPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700039475; x=1700644275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyoyzJ3TG71RLMcSn7Yt3Uv3VvHi975XYyaZgL9PFq8=;
        b=aKzHOVIQI/pN+jGaglg0dx8A7Fl7gfQn0XwzkJd1pq3UT4odM1NX6EoN62RNMyIhSC
         Q8PhzEYjqOq1M0pzPVyIvKZ1n+43dghNaJ9FysRccSmAHht6uz5G/JUfxWz1FvhVvjRC
         y/FO7KbzsO4ftlCeFQQujIMmvVuWxirD/UFt2N68iP97rqEiJcCpPEg7S+6qU3IgIOAl
         UFhml/1zXXsfLEGA6OCOvAxv+VBNC5zToIUhQA6Zh9J2Cf5oVL2RiOkbILo2WMVdC2qq
         0geykLqPNvzVQSjK3oadloM9jqWkoF/HeK/fq2+F+QSj0U8QGewYfUodaO4W77HJMuAg
         PcTQ==
X-Gm-Message-State: AOJu0YwWqMrUpyEuV3UKk2mbC6AyPz/0mCZDst60u8izBmLqgxX7KJmJ
	eNVROr7z7WH8DzZmSOnTmII=
X-Google-Smtp-Source: AGHT+IGr2AnuKFCQyn5T30oiTbmjiaO30R0sYa01TxhSnnbwHDsJOUPWZ2ia346V01tukWFTwUcAzA==
X-Received: by 2002:a17:906:cd27:b0:9f2:6f6f:7a17 with SMTP id oz39-20020a170906cd2700b009f26f6f7a17mr1252162ejb.65.1700039474680;
        Wed, 15 Nov 2023 01:11:14 -0800 (PST)
Message-ID: <37b66c5b997587b9f524e353f4b09a638b7e6451.camel@gmail.com>
Subject: Re: [PATCH v3] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
 Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
 <ppircalabu@bitdefender.com>,  xen-devel@lists.xenproject.org
Date: Wed, 15 Nov 2023 11:11:13 +0200
In-Reply-To: <39592ff8-4694-4427-b1f8-614150ca9ad0@suse.com>
References: 
	<371c5dd29fa974ca27db1f720f17fb0ffdd667a0.1699974488.git.oleksii.kurochko@gmail.com>
	 <39592ff8-4694-4427-b1f8-614150ca9ad0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-11-14 at 18:19 +0100, Jan Beulich wrote:
> On 14.11.2023 16:13, Oleksii Kurochko wrote:
> > ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
> > allows to avoid generation of empty <asm/mem_access.h> header
> > for the case when !CONFIG_MEM_ACCESS.
> >=20
> > For Arm it was explicitly added inclusion of <asm/mem_access.h> for
> > p2m.c
> > and traps.c because they require some functions from
> > <asm/mem_access.h> which
> > aren't available in case of !CONFIG_MEM_ACCESS.
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >=20
> > ---
> > This patch was part of patch series:
> > https://lore.kernel.org/xen-devel/cover.1699633310.git.oleksii.kurochko=
@gmail.com/
> >=20
> > The patch series hasn't been reviewed all yet so send this path
> > separately.
> > ---
> > =C2=A0xen/arch/arm/p2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 6 ++++++
> > =C2=A0xen/arch/arm/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 6 ++++++
> > =C2=A0xen/include/xen/mem_access.h | 2 ++
> > =C2=A03 files changed, 14 insertions(+)
>=20
> Also drop PPC's then dead header, please.
Sure. Missed that. I'll do that.
>=20
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -11,6 +11,12 @@
> > =C2=A0#include <asm/event.h>
> > =C2=A0#include <asm/flushtlb.h>
> > =C2=A0#include <asm/guest_walk.h>
> > +/*
> > + * Inclusion of <asm/mem_acces.h> in <xen/mem_access.h> is #ifdef-
> > ed with
> > + * CONFIG_MEM_ACCESS so in case of !CONFIG_MEM_ACCESS will cause a
> > compilation
> > + * issue "implicit declaration of functions 'p2m_mem_access*'.
> > + */
> > +#include <asm/mem_access.h>
>=20
> Personally I'm against such comments (they simply don't scale), but
> this
> is Arm code, so Arm folks will need to judge.
The comment can be removed. Probably it is enough to have an
explanation in the commit message.


Thanks.

~ Oleksii

