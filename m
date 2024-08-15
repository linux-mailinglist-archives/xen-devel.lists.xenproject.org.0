Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998D952A54
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777858.1187914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVeq-0001S5-48; Thu, 15 Aug 2024 08:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777858.1187914; Thu, 15 Aug 2024 08:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVeq-0001PM-1M; Thu, 15 Aug 2024 08:16:32 +0000
Received: by outflank-mailman (input) for mailman id 777858;
 Thu, 15 Aug 2024 08:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQtD=PO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seVeo-0001PG-KJ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:16:30 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac8603aa-5ade-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 10:16:29 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f1a7faa4d4so6122261fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 01:16:29 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b7703337sm1291101fa.95.2024.08.15.01.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 01:16:28 -0700 (PDT)
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
X-Inumbo-ID: ac8603aa-5ade-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723709789; x=1724314589; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JXzI3bPd2VCOBlBwqFGePKfao7CFS/n+ifVD1NkoPFI=;
        b=Ld9KHvfzYG5jl+Mi5JD5TLi9LynleOzZ1QJA6Sro6XVJ+AT+JXpw7WH6QrtaOqDywJ
         EQjBhGIdDXai1nwujuXECeI6LSlcYzmVm6SwrL+8e7fHy9QlgNedhCnIQS3ootNEksv3
         JWDKis7SLo11E47pgvyPwaAGwUte962r23DpoOTnkokcncAXk3LQuepMWGOUKpl7R82+
         zhQZV1hFPLsoBLJjlk1ioycQgwZPCanHF4p2hFQPAOoxswGLNbG8XyHGHccnf0nhrL/o
         KhL5d/2whhRn9m0guWs4pPHdMtPYQsS7OAO8diQu90Taby3gqDvbboqxi+PXwcloKgpf
         GoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723709789; x=1724314589;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXzI3bPd2VCOBlBwqFGePKfao7CFS/n+ifVD1NkoPFI=;
        b=cxmp/uIbY4UYFwrPiLTMu7HSUk6yyS3AS4bgGM6Ofp2BXFRIYcGQHOtTK6rYPz4NeP
         /jqf5zjlTuQNfWuMpOXCnAliemDQgMpt/ksdqpc9q2Sdo7DwjTmah7ojc1SSvLtE8mtf
         ITG24QvcCtWSyVIBjSTuC/Bdd4qirlK1Yg1fIqgLlCte88g8b2jH583VPahjS5rtD1Zs
         2rgZ7KyHc5ksIW4m9dPgpM45D/IHbvigeF9SOdw/3VZFObMj2FF/FGtnww+6zHLCyGqW
         ZjYIsge0Z28v+o6K12/QDWaNSuaIZOD1dM9jASo4bj8U4Cd/WfWZORatZJQgyOGMI1dh
         AzSw==
X-Forwarded-Encrypted: i=1; AJvYcCX7CWMJrSYXEmCiUvV6Z9OxvQ+2DiK6VuRev6Ong1U5nfpK6eo1QawEqKSnRk1msWntR8dVoVpR3WcKSE6wQcC/DiLMbJtEc/m90iZ5kuQ=
X-Gm-Message-State: AOJu0YwCK40NjAuJz1ix852pB8M7q63xOYue9XrOzp7V/V1NQMitiVxu
	p0q12jJft/dNNflzL/piqLetSoqYXuDGJ1uNY5L/8DztT9CBYCe7
X-Google-Smtp-Source: AGHT+IGm0m4VYILV0AC5bthO3p6Y+hxcXgAaPAVuNMJI9Ng11y+/9jxzguiZYgx/iu8VmQ7b37cDlw==
X-Received: by 2002:a2e:4e09:0:b0:2ef:290e:4a30 with SMTP id 38308e7fff4ca-2f3b3bb7d19mr4711581fa.16.1723709788577;
        Thu, 15 Aug 2024 01:16:28 -0700 (PDT)
Message-ID: <06100e9d45d63b98c8fa4efacdc0a73f88690de0.camel@gmail.com>
Subject: Re: [PATCH v4 2/7] xen/riscv: set up fixmap mappings
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2024 10:16:27 +0200
In-Reply-To: <bede9f51-0278-4c97-9c0d-ee3478373d72@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <1c1c0f912a9abbb542baa1ce92e75d64ec8043e9.1723214540.git.oleksii.kurochko@gmail.com>
	 <07f19bb5-bd76-4158-875e-48f74e427a89@suse.com>
	 <9361b63712bffc7bb0cb6bb1fc5954ade18314d2.camel@gmail.com>
	 <bede9f51-0278-4c97-9c0d-ee3478373d72@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-08-14 at 17:08 +0200, Jan Beulich wrote:
> On 14.08.2024 16:21, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-13 at 10:22 +0200, Jan Beulich wrote:
> > > On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/include/asm/page.h
> > > > +++ b/xen/arch/riscv/include/asm/page.h
> > > > @@ -81,6 +81,12 @@ static inline void
> > > > flush_page_to_ram(unsigned
> > > > long mfn, bool sync_icache)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > =C2=A0}
> > > > =C2=A0
> > > > +/* Write a pagetable entry. */
> > > > +static inline void write_pte(pte_t *p, pte_t pte)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 *p =3D pte;
> > > > +}
> > >=20
> > > No use of write_atomic() here? And no read_pte() counterpart
> > > right
> > > away (then
> > > also properly using read_atomic())?
> > I wanted to avoid the fence before "*p=3Dpte" which in case of
> > write_atomic() will be present.
>=20
> Well, this goes back to write_atomic() resolving to write{b,w,l,q}()
> for
> unclear reasons; even the comment in our atomic.h says "For some
> reason".
> The fence there is of course getting in the way here. I keep
> forgetting
> about that aspect, because neither x86 nor Arm has anything similar
> afaics.
Good point. I overlooked something here ( and misinterpreted your
comments regarding that write_atomic() implementation ) but I think it
would be better to use write{b,w,l,q}_cpu() for write_atomic.

~ Oleksii

>=20
> > Won't it be enough to use here WRITE_ONCE()?
>=20
> Maybe. I'm not entirely sure.
>=20
> Jan


