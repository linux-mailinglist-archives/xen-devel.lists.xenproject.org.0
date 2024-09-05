Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A467096DEB5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791212.1201044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEg5-0006Ui-MI; Thu, 05 Sep 2024 15:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791212.1201044; Thu, 05 Sep 2024 15:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEg5-0006Sk-Ic; Thu, 05 Sep 2024 15:45:45 +0000
Received: by outflank-mailman (input) for mailman id 791212;
 Thu, 05 Sep 2024 15:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uanP=QD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1smEg5-0005UO-1X
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:45:45 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8f91f15-6b9d-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 17:45:43 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f4f2868710so10663301fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:45:43 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f74bec11a8sm1873991fa.98.2024.09.05.08.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 08:45:41 -0700 (PDT)
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
X-Inumbo-ID: e8f91f15-6b9d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725551143; x=1726155943; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w9eOzEbow2j15tnr7LG/W4qTp7R4tCI9Fh+0ZABW4no=;
        b=dsWnXHCy5fbrl+4T3AaBR9o6aFJRwJR29+Cn0npodLnOaRvLlsz5URxKkMZzSsmARD
         nhlP+/kQh+zvsZWh0VHlCxFm8nV8qiV8pT0a7IrtqW1F0M3DPUow8HtSuZd1Csoqewp9
         3iov8qlfx0d45sN8gzylGNA9e6rWqTJ1am13Fw9pVazFS2BsN3oLIqF0Jh7V8g1KHLPd
         Eef5h/N6UIegUj5JQs9pBRSJ3oLTEh5B+dlPWnzi/8BE8qKvfPzSZsYkeQG4BCXqL7fq
         62hQwrtg4d9K5D+SFD8Ae+AStmAWZrXpw5S0Uuypim4/dfLD37aE76UyXuIWTXX9MIXc
         OVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551143; x=1726155943;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9eOzEbow2j15tnr7LG/W4qTp7R4tCI9Fh+0ZABW4no=;
        b=eiR/ySF619NWQKV65JWuN7anNOcNgSPtsmouI22Jqo1FvfIsqnz4DoGzKCmQ5P+XrH
         trZrbontzuRLe6IwI4DGuJiZ3Vtrj2o4hPsGaff/MvFvdqIRfDkR2OvN/kf3VsDHNsjB
         wSZW8SKR0gwldqDfmH0OlbuQ9kf8HXhAAjz+YGb+/o5ErGvUGnRZJPtLC3Rf1JPR0mTL
         AvwxVDLsrTH6GVcr46mvG2liJ+z2PvwJBJINIBlD6khRHW6reZPOgbJuG7Osrd/79DvP
         MUHWUN/v0tK7QSHvbeQ/4i8Wi1CXNMEj5M/l+I/LZ+nbzYrasc2ahB6bu3vdewdmvZxl
         6oKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJA5yFdh5wGr8d565Q6DTeACVOr6yFkfNbe8bOF3Bwrp+DYe12lRU92Sk/+86Lc++zKUEAvDJ/ZLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfWlf8wo+Td0+nlI34U7395Jd2qA/UiFBM1QqwYqCh9wX5nTp0
	rxSv0vsp4k/lJJlDsM0L89DGBJmBzI/P8lm17br9CEmt4193rm0FN2JSQg==
X-Google-Smtp-Source: AGHT+IH4RP5+CXU6Yw1lrLMzLqwkdBgklYtuXQw0EWGTd0Y49CrCzUxXqxoJPXWN+YBz4qr4FRaG6g==
X-Received: by 2002:a2e:b88e:0:b0:2f7:4e8c:9c11 with SMTP id 38308e7fff4ca-2f74e8c9f65mr13907491fa.1.1725551141907;
        Thu, 05 Sep 2024 08:45:41 -0700 (PDT)
Message-ID: <5d70645df40772ce17867c2034050bddddcad87d.camel@gmail.com>
Subject: Re: [PATCH v6 2/9] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Thu, 05 Sep 2024 17:45:40 +0200
In-Reply-To: <4cd314fa-9a4f-4656-98f0-bc696a082913@citrix.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <4b62d7e3faa24f6070430607262a3aed1bbf1861.1725295716.git.oleksii.kurochko@gmail.com>
	 <577dea81-06a7-4ca3-9a22-e76c966b5dcf@citrix.com>
	 <c6e42423d925e26942f2cfd0dafba09e0ed5b78a.camel@gmail.com>
	 <4cd314fa-9a4f-4656-98f0-bc696a082913@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-04 at 11:31 +0100, Andrew Cooper wrote:
> On 04/09/2024 11:27 am, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-09-03 at 15:21 +0100, Andrew Cooper wrote:
> > > On 02/09/2024 6:01 pm, Oleksii Kurochko wrote:
> > > > diff --git a/xen/arch/riscv/include/asm/atomic.h
> > > > b/xen/arch/riscv/include/asm/atomic.h
> > > > index 31b91a79c8..3c6bd86406 100644
> > > > --- a/xen/arch/riscv/include/asm/atomic.h
> > > > +++ b/xen/arch/riscv/include/asm/atomic.h
> > > > @@ -31,21 +31,17 @@
> > > > =C2=A0
> > > > =C2=A0void __bad_atomic_size(void);
> > > > =C2=A0
> > > > -/*
> > > > - * Legacy from Linux kernel. For some reason they wanted to
> > > > have
> > > > ordered
> > > > - * read/write access. Thereby read* is used instead of
> > > > read*_cpu()
> > > > - */
> > > > =C2=A0static always_inline void read_atomic_size(const volatile voi=
d
> > > > *p,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *res,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size)
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 switch ( size )
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > -=C2=A0=C2=A0=C2=A0 case 1: *(uint8_t *)res =3D readb(p); break;
> > > > -=C2=A0=C2=A0=C2=A0 case 2: *(uint16_t *)res =3D readw(p); break;
> > > > -=C2=A0=C2=A0=C2=A0 case 4: *(uint32_t *)res =3D readl(p); break;
> > > > +=C2=A0=C2=A0=C2=A0 case 1: *(uint8_t *)res =3D readb_cpu(p); break=
;
> > > > +=C2=A0=C2=A0=C2=A0 case 2: *(uint16_t *)res =3D readw_cpu(p); brea=
k;
> > > > +=C2=A0=C2=A0=C2=A0 case 4: *(uint32_t *)res =3D readl_cpu(p); brea=
k;
> > > > =C2=A0#ifndef CONFIG_RISCV_32
> > > > -=C2=A0=C2=A0=C2=A0 case 8: *(uint32_t *)res =3D readq(p); break;
> > > > +=C2=A0=C2=A0=C2=A0 case 8: *(uint32_t *)res =3D readq_cpu(p); brea=
k;
> > > This cast looks suspiciously like it's wrong already in
> > > staging...
> > Thanks for noticing that, it should be really uint64_t. I'll update
> > that in the next patch version.
>=20
> This bug is in 4.19.
>=20
> I know RISC-V is experimental, but this is the kind of thing that Jan
> might consider for backporting.
>=20
> Whether it gets backported or not, it wants to be in a standalone
> bugfix, not as a part of "rewrite the accessors used".
It makes sense. I will send a separate patch tomorrow.

~ Oleksii


