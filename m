Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1324898BF5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 18:18:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700968.1094883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPmq-0002cR-9Z; Thu, 04 Apr 2024 16:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700968.1094883; Thu, 04 Apr 2024 16:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPmq-0002ae-6i; Thu, 04 Apr 2024 16:18:00 +0000
Received: by outflank-mailman (input) for mailman id 700968;
 Thu, 04 Apr 2024 16:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsPmo-0002aW-Jw
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 16:17:58 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e63170e2-f29e-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 18:17:57 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e2ac1c16aso204016a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 09:17:57 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 eb16-20020a170907281000b00a4e0df9e793sm9229882ejc.136.2024.04.04.09.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 09:17:54 -0700 (PDT)
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
X-Inumbo-ID: e63170e2-f29e-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712247477; x=1712852277; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=twi+8O5ZkrQaJP+HbnKBwLYddmJYFcEsJDGmOJbinhQ=;
        b=nVjUUEgw4FJp1g4vGQ7KMTcBKdpixD/nfl1wfY5AzMWf4Sjc1/P6TAjaVihl3/aNO+
         GZ06aW1GsFAriJpLq8WYnSl2ys5sAu4xW4RYzcAx85qmYDTs0FfyQyns1ygyeKXLFire
         G89mkAFD8Lqob6pc+1lKrpIxY2RgETYT8iDP4AKHb2uMfWm9nni5WOUGrLZogQDY656y
         b5rtPMVWK4DEnYDnvTvSOoVJkat9VuHgg5Z+HAR/vUhuxhKknZQs5Uy/GCQbprb5ty1d
         2tM6LvjtsmZi9Bzky617sWbFzvWksxhvEpdYm23XYIhs/Ko8rkKOkLultJCKpJtLBL11
         8rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712247477; x=1712852277;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twi+8O5ZkrQaJP+HbnKBwLYddmJYFcEsJDGmOJbinhQ=;
        b=fjvETcDo0NC8vswqwgS3GrZR8x47KM+QQ2s743Q6X0ve4S4Dn47XbKCfMqVJ1JSx9u
         MuISB2gA0MmL2+HnbIobWGMraUXsDVUlsrzvvZaDFeeQGJ+rAnjjJ2e/oVbblN9Cuzko
         cRHbmLuRynAWZ0arhNgU8V8zxsFwPkzSipwiZteQXYIsHwhCrUpPr1zBU1xw5/DVGgQl
         8tkBJRBZ7vBXLGmmIQqTIhv6uXI94UGMFMATgyMGcBx7sCsUs2h5u5XTocz3VrxJdD0A
         E7OnvgYKyPOXWZhkNvfEmuX+N3j3CsUWr91jvm3lGoi11sJ7W4YIAlKpr6TFY7iJFofK
         JQMg==
X-Forwarded-Encrypted: i=1; AJvYcCWsvY2CkCH9mGGm/p9dNIP/FXCjEKViMck95swWy0+vD4+aoopIIitWHoSiUeaR7P+sR9hbrG/zQUd2YAFswFc6fZ+egxhjSk4czJeSm7U=
X-Gm-Message-State: AOJu0YyrHsKW9PRDIITyv6Gc/vf1Z83WEVPM6G3HjW/4IrqNS5x2DtdJ
	urf1/ZGsFGkL3rMoZ2DFGm5XthQHF1cdw9N8RBqb1tWbISPWdX/O
X-Google-Smtp-Source: AGHT+IHriF/YicRkjM+32K2glLgcTIvw0jnMxJHHcm6v39FdTNv3A44lB1RFHoJoBqII+Jj8gmGm9A==
X-Received: by 2002:a17:907:3e8a:b0:a4e:cd5c:da72 with SMTP id hs10-20020a1709073e8a00b00a4ecd5cda72mr2252745ejc.63.1712247475101;
        Thu, 04 Apr 2024 09:17:55 -0700 (PDT)
Message-ID: <9ac4b0f3171c6b714092d04e07c2e16add16c86a.camel@gmail.com>
Subject: Re: [PATCH v7 03/19] xen/riscv: introduce extenstion support check
 by compiler
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>,  xen-devel@lists.xenproject.org
Date: Thu, 04 Apr 2024 18:17:54 +0200
In-Reply-To: <3095e62f-583c-414d-92d9-9b09b6959251@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
	 <bda70742-04b7-4bab-8cdd-6b5a3d45dc3c@suse.com>
	 <9945cb144f5c1b95202646135b88891537230e17.camel@gmail.com>
	 <3095e62f-583c-414d-92d9-9b09b6959251@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-04 at 17:43 +0200, Jan Beulich wrote:
> On 04.04.2024 17:18, Oleksii wrote:
> > On Thu, 2024-04-04 at 12:07 +0200, Jan Beulich wrote:
> > > On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/arch.mk
> > > > +++ b/xen/arch/riscv/arch.mk
> > > > @@ -3,16 +3,27 @@
> > > > =C2=A0
> > > > =C2=A0$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > > > =C2=A0
> > > > -CFLAGS-$(CONFIG_RISCV_64) +=3D -mabi=3Dlp64
> > > > +riscv-abi-$(CONFIG_RISCV_32) :=3D -mabi=3Dilp32
> > > > +riscv-abi-$(CONFIG_RISCV_64) :=3D -mabi=3Dlp64
> > > > =C2=A0
> > > > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_RV64G) :=3D rv64g
> > > > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 :=3D $(riscv-march-y)c
> > > > =C2=A0
> > > > +riscv-generic-flags :=3D $(riscv-abi-y) -march=3D$(riscv-march-y)
> > > > +
> > > > +zbb :=3D $(call as-insn,$(CC) $(riscv-generic-
> > > > flags)_zbb,"",_zbb)
> > >=20
> > > While committing another question popped up: Why "" (i.e. no
> > > insn)
> > > here, ...
> > >=20
> > > > +zihintpause :=3D $(call as-insn,\
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 $(CC) $(riscv-generic-
> > > > flags)_zihintpause,"pause",_zihintpause)
> > >=20
> > > ... but "pause" here?
> >=20
> > In the case of the Zbb extension, we don't check for a specific
> > instruction, but with the Zihintpause, the idea was to verify if
> > the
> > pause instruction is supported or not.
>=20
> And why's this verification relevant here, but not for Zbb?
It is not relevant and can be dropped. I'll do a follow-up patch.

~ Oleksii

>=20
> Jan
>=20
> > However, in both checks, there
> > might be no instruction as an argument of as-insn.
> >=20
> > ~ Oleksii
>=20


