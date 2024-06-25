Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A05C917027
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 20:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748009.1155552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMAsg-0008Uk-1s; Tue, 25 Jun 2024 18:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748009.1155552; Tue, 25 Jun 2024 18:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMAsf-0008Rq-V4; Tue, 25 Jun 2024 18:27:01 +0000
Received: by outflank-mailman (input) for mailman id 748009;
 Tue, 25 Jun 2024 18:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMAsd-0008Rk-TG
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 18:26:59 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8223252d-3320-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 20:26:58 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso7242263a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 11:26:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30562cb6sm6216109a12.83.2024.06.25.11.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:26:57 -0700 (PDT)
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
X-Inumbo-ID: 8223252d-3320-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719340018; x=1719944818; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t9iUYy2mYwtHAhrEq2Qx1BKRHdyA8rRSj+E2DApKz3E=;
        b=FHUx9lqL3C5LjdGKElXUk6z8NSgCbqyXxnE6QweZ4xOzJDFIv7pM5g9vsbWEoeDuXp
         kAkeMvxf/Lu1b5qoSiCe4mblpTs3kwxcRXW6s6wY6smn2RBXlFR1DmRsqMrP9jeyVkF0
         AAHrRImp1xP02u1GDeN/np2fg4KZaJxIxTLo7qE9FqsZZJcrgfKFGz7MxponGxxH7a0A
         ka2+rpEhJd0On5m4nOBC2O8tJlEvPnuczEVVc3lzOFg1NBNrPrVjiO+kRAvWjB5/WqZu
         qPEzjVDCDi1tKvRk9ZEG7j9CiglwmgziLgSPhIxg9GYx1LReynLgvXtUl482E7/wJwgk
         aMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340018; x=1719944818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9iUYy2mYwtHAhrEq2Qx1BKRHdyA8rRSj+E2DApKz3E=;
        b=rzOguWERrZNjpkSToHnCSac4L1IeHWTvpmUanvYosFnVDqKzs6k9MABpZts8QjwVAv
         6pvOyXl2mpOLBELk24vX9LmmA6R05S2E9CWW0ISQzXG8jGzbJOMEPWUcD1t4LLK4/uSp
         KYc/L3sdJdXnGrif8cjrUwcNS1RY4lRe64qYetbQjDG8r0a+4WpT9a6E+izcGs3n+vSy
         qLcg1xjPMeihsbww1Mz2F5gBWGeBqn+JmJm66ESREB8LiXWB/hlaBV7yfnDOOkUTgz1L
         TE4uJhsFmi37kCeqq2/HCKujtT0ySyspnLZPTo8UJF84vxFTQVHP7srmntw7JSd+auex
         sTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE0MDe1Cc7ZjBIw6PADBGgh+T/4rdGZiDnCkpco2tEXZAWjmLnwddNkdb9h7VAGwpyj90MNGLpZhUvr+RO1/jLf9RGqKbDZziOQQakwno=
X-Gm-Message-State: AOJu0Yxj69DNyh5G6bkXRS++/D5RzUBFtYiIpnmebcbu0aelrRgc4GQf
	PQNccqkQ6VbXElp6me/Aj+WAH0GweT46vJuwvue3DeByxROGb7ds
X-Google-Smtp-Source: AGHT+IHOqSSMcSZYNHRPvrdbLnIRRhG27QPCLYx6cwvqAIdn0FymfvP5ZxJnKytVT7u/HTb/5+n4rA==
X-Received: by 2002:a50:d5d3:0:b0:57d:4876:55ce with SMTP id 4fb4d7f45d1cf-57d487657e4mr6821740a12.19.1719340018093;
        Tue, 25 Jun 2024 11:26:58 -0700 (PDT)
Message-ID: <3b2443ad76923afba348304b7cedbb257a6c5313.camel@gmail.com>
Subject: Re: [PATCH v13 09/10] xen/riscv: introduce ANDN_INSN
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 25 Jun 2024 20:26:57 +0200
In-Reply-To: <95f64eba-13b9-404a-8318-7a3fc77ea560@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <b0d2ff2cecf6cb324e43b9c14c87f47f3f199613.1719319093.git.oleksii.kurochko@gmail.com>
	 <95f64eba-13b9-404a-8318-7a3fc77ea560@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 16:49 +0200, Jan Beulich wrote:
> On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/cmpxchg.h
> > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > @@ -18,6 +18,20 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" );
> > =C2=A0
> > +/*
> > + * Binutils < 2.37 doesn't understand ANDN.=C2=A0 If the toolchain is
> > too
> > +ld, form
>=20
> Same question: Why's 2.37 suddenly of interest?
Andrew has (or had) an older version of binutils and started to face
the issues mentioned in this patch. As a result, some
changes were suggested.

> Plus, why would age of the
> tool chain matter?
As it is mentioned in the comment binutils < 2.37 doesn't understand
andn instruction.

> What you care about is whether you're permitted to use
> the extension at runtime.=C2=A0
At the moment we can't check that at runtime, w/o having an exception,
( there is some option to check when dts parsing will be available in
Xen ). I will add the check when dts parsing functionality will be
available. Right now the best what we can do it is just mentioned that
as requirement in docs.

> Otherwise you could again ...
>=20
> Also something went wrong with line wrapping here.
>=20
> > + * it of a NOT+AND pair
> > + */
> > +#ifdef __riscv_zbb
> > +#define ANDN_INSN(rd, rs1, rs2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 "andn " rd ", " rs1 ", " rs2 "\n"
> > +#else
> > +#define ANDN_INSN(rd, rs1, rs2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 "not " rd ", " rs2 "\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 "and " rd ", " rs1 ", " rd "\n"
>=20
> ... resort to .insn.
Hmm, good point, it could be an issue.


If this patch is still needed (Andrew, have you updated your
toolchain?), then it should use .insn instead of andn. However, using
.insn requires encoding rd, rs1, and rs2 through asm ("some_reg") (?),
which seems overly complicated. And still, it is an open question if in
reality someone will use binutils which doesn't support andn
instruction...

~ Oleksii

