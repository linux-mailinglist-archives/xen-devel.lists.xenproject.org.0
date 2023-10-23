Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52577D2E83
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621156.967310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurLe-0007oM-TE; Mon, 23 Oct 2023 09:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621156.967310; Mon, 23 Oct 2023 09:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurLe-0007lw-QX; Mon, 23 Oct 2023 09:35:46 +0000
Received: by outflank-mailman (input) for mailman id 621156;
 Mon, 23 Oct 2023 09:35:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qurLe-0007lq-32
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:35:46 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89c50a11-7187-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:35:44 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9c5b313b3ffso439140166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:35:45 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a170906105300b0099bcdfff7cbsm6268733ejj.160.2023.10.23.02.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:35:44 -0700 (PDT)
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
X-Inumbo-ID: 89c50a11-7187-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698053744; x=1698658544; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K0leErRB/gfP3qUzcOy+ZVFFE3N0kPU8PLOEaS/xGOA=;
        b=ZHcMF/XkSp5Za+o7iSvBmTOAGeyMUeOtjs851CXN9PFl0BRXlA6ADk6vvEYzsgvKYn
         J4E1FY707EVobqA25OMXS6L57G9ttlSqJsHPVALOofl1oGPPuP1OCSyC8A1bPZ6mDGzK
         gcvxBCtriDy/2N0/sVOrbcR60cZEJdNVwx+UC2ez6JEtfG0p4mp3OKivOrlsgJE68wiR
         a0KPidCTT+PK3tax1rsZxjXQj8ERrVwrMKDKpj7LV9ub48FbGDgYJDWpe4172Laz4LNY
         dBWJgQMKWV5d/gn1sw9gfMTCnoTjfTKiYj7YsxVXU50fXZXvfwnt9JmNxbG9LLucvacF
         HfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698053744; x=1698658544;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0leErRB/gfP3qUzcOy+ZVFFE3N0kPU8PLOEaS/xGOA=;
        b=R4ekDp2aBK9xVH+3fxh/OtQhCwdLksYMBvFYOnpsFcNvr7t28D6OTi+rxQoxBVdxB+
         rIGM5DI3BnjZVYV0iyTtLaJXl6oJOVVK0VEfqCMUwmdctx7jc0EGuYLaJ39rhKTabyeS
         f31PnEA5gALbO+WshBtaXcrYrGVaTfI8Yq/SSbnkC97HvpkSFV9lhLscNMDttzlk4wbQ
         rzZ7g+vgcubs/5Lj+5nLp6eEwZiDSxBtutX+DMKUEdc+gj/xnGxEtl6sjql7YqdsSYQX
         AtMKtJo3op5DscV2g7R8/SuAmOLEu8Mqljumn2Rblu0zOvKtVY4UfLIg3uwX89pt+ZGW
         FFtQ==
X-Gm-Message-State: AOJu0YxWHasxAinXkhs5z/9hR+DiEgmgD89Gyz6Eb6aApHtTxk1hBgCJ
	ORyBgl2sfnGjF82qIB3Vyc8=
X-Google-Smtp-Source: AGHT+IHgneSwf4m3xabLzLfpgpc3TOgcH747jHJSqghFAI9baHwuPKhVzhj6HuJtluZlvfuvxFqeaw==
X-Received: by 2002:a17:907:31c1:b0:9a1:891b:6eed with SMTP id xf1-20020a17090731c100b009a1891b6eedmr6554665ejb.76.1698053744481;
        Mon, 23 Oct 2023 02:35:44 -0700 (PDT)
Message-ID: <b37269c08749424e54611595e2ab1a0f4cbb3cc8.camel@gmail.com>
Subject: Re: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 12:35:43 +0300
In-Reply-To: <c474dde4-3175-426b-a10d-43e816f9fe27@xen.org>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
	 <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
	 <c474dde4-3175-426b-a10d-43e816f9fe27@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi,=20
On Thu, 2023-10-19 at 11:35 +0100, Julien Grall wrote:
> Hi,
>=20
> On 19/10/2023 10:05, Jan Beulich wrote:
> > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > The patch introduces stub header needed for full Xen build.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > ---
> > > =C2=A0 xen/include/asm-generic/paging.h | 17 +++++++++++++++++
> > > =C2=A0 1 file changed, 17 insertions(+)
> > > =C2=A0 create mode 100644 xen/include/asm-generic/paging.h
> > >=20
> > > diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-
> > > generic/paging.h
> > > new file mode 100644
> > > index 0000000000..2aab63b536
> > > --- /dev/null
> > > +++ b/xen/include/asm-generic/paging.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +#ifndef __ASM_GENERIC_PAGING_H__
> > > +#define __ASM_GENERIC_PAGING_H__
> > > +
> > > +#define paging_mode_translate(d)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0(1)
> > > +#define paging_mode_external(d)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(1)
> This is more a question for Jan, in the past I recall you asked the=20
> macor to evaluate the argument. Shouldn't we do the same here?
Could you please share a link?
I am not sure that I am in the context.

>=20
> Also, I think we want to take the opportunity to convert to true.=20
Sure, we can. I'll change definition to true.

> Lastly, this seems to be using hard tab rather than soft tab. In Xen
> we=20
> use the latter (unless this is a file imported from Linux).
Thanks. I'll update tab.

>=20
> > > +
> > > +#endif /* __ASM_GENERIC_PAGING_H__ */
> >=20
> > Looks okay, but wants accompanying by dropping (i.e. effectively
> > moving)
> > Arm's respective header.
>=20
> FWIW, I would be ok if the change is separate. I can help to write it
> also.
I would be glad if you could help.

>=20
> > The description than also wants adjusting (it
> > wasn't quite suitable anyway, as there's missing context).
>=20
>=20
~ Oleksii


