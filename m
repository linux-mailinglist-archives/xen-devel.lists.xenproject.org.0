Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66BF6A605B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 21:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503764.776070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX6Wx-00025r-Sm; Tue, 28 Feb 2023 20:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503764.776070; Tue, 28 Feb 2023 20:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX6Wx-00023Z-Q6; Tue, 28 Feb 2023 20:24:59 +0000
Received: by outflank-mailman (input) for mailman id 503764;
 Tue, 28 Feb 2023 20:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pX6Ww-00023T-1x
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 20:24:58 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7dbd8a4-b7a5-11ed-9699-2f268f93b82a;
 Tue, 28 Feb 2023 21:24:57 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id z42so11602174ljq.13
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 12:24:57 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 187-20020a2e05c4000000b002934ba305f4sm1373719ljf.59.2023.02.28.12.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 12:24:55 -0800 (PST)
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
X-Inumbo-ID: f7dbd8a4-b7a5-11ed-9699-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677615896;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BtKAsqFK1jdTJjTg5pLj9kExJOJA/4iCCLodEKrIEQA=;
        b=O5jpkwFn8oHP8BaBqYYv4++kh2wscvtvaNKYvyNDoJx6cqt0VqUjSbKiI9aOhQ3Ru1
         7/RMf+42XJg/44LEsVOBdmy6BkkzA7VMNJl51cGeiVm7pYe/68e4JreDSpXoBXnHaFRP
         mxymVtKwlQKiGc/JVWTjRCZIoVzURQcAUTtQ7eyUSDsw8IA2Uoq3xneWook/UcDeuB84
         om1wFqI9bwcxLLJt8mmbDJVbyKtnaUeXCdi0z2QBEm0ZkJhKDqH/9vl71UFfF9+4Wgi1
         aHf7Yt1RRaq6opXV/vINpHLGxjOgOv793am6QXrV6bQHbj5b0F0hg+u/UrWQBlHDMWCo
         bfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677615896;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BtKAsqFK1jdTJjTg5pLj9kExJOJA/4iCCLodEKrIEQA=;
        b=eYeFKERW5PCXpyb6XR78R6bOcaw2hEglhEVEde+E/21UBrOgW8eiH5olQjeYf20MIs
         sCE5HmUW3iv0+Sfkj1/s9Q/KFCSKVuls8CCmaea8sYSUtqIrdKnC2cm6h4xg66lbUvUa
         hfOuaHJM6uHMFXSskx24+4ZAvr+/L4Qx5k2Krv5VKgPy0jxJCZNfMKKfwsLB3BLcHOhy
         UX08ZUWgDREy801X08iOi8tRATlocjnJa/5/FJdxPBopKzpzi1tbF6mCPbthHiq+c8EY
         dJYeUTFa+5SIqa0EJUcEFj7tLtXpk6eCzAzd4ooehWBRyTOOJYK1mYtSO15V+97X92Qt
         WvJw==
X-Gm-Message-State: AO0yUKUZpMWsR8Qxgjwsrk+PVi4ADkJ9xHtQc1wg0iJjibZMua/sqNvv
	NkfuZT5w9/KfI9BeekPr4hU=
X-Google-Smtp-Source: AK7set+3Badz1PPgmqG464+EeXYWlVhhF+X12vUwcHAFCpHsB6gndwd6ibD88XNR7mEyzhcJrN2dXQ==
X-Received: by 2002:a05:651c:19a9:b0:295:c56d:55b5 with SMTP id bx41-20020a05651c19a900b00295c56d55b5mr1509432ljb.38.1677615896480;
        Tue, 28 Feb 2023 12:24:56 -0800 (PST)
Message-ID: <eece74b80edd8e32f054af8b079366c1f5a459c2.camel@gmail.com>
Subject: Re: [PATCH v3 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Date: Tue, 28 Feb 2023 22:24:53 +0200
In-Reply-To: <e4ccf8fc-12d5-686b-5ffd-cf0c2107e9cf@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
	 <8734edd9-70eb-b2bd-8763-b7468d7caba3@xen.org>
	 <bf97a55d3e6635666090d06e3affa38c7c45b6d6.camel@gmail.com>
	 <e4ccf8fc-12d5-686b-5ffd-cf0c2107e9cf@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-02-28 at 18:01 +0000, Julien Grall wrote:
> On 28/02/2023 17:21, Oleksii wrote:
> > Hi Julien,
>=20
> Hi Oleksii,
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 for ( i =3D 0, b =3D region->frame[id].bugs;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i < region->frame[id].n_bugs; b++, i++=
 )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if ( bug_loc(b) =3D=3D pc )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bug =3D b;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto found;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > + found:
> > > > +=C2=A0=C2=A0=C2=A0 if ( !bug )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +#ifdef BUG_FN_REG
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct=
 cpu_user_regs *) =3D (void
> > > > *)regs-
> > > > > BUG_FN_REG;
> > >=20
> > > AFAIU, this is necessary so Arm can use the generic
> > > do_bug_frame().
> > >=20
> > > I was under the impression that RISC-V and Arm had the similar
> > > issue
> > > with %c. It seems like you managed to resolve it on RISC-V, so
> > > can we
> > > fully switch Arm to the generic implementation of bug?
> > I tried to switch ARM to generic implementation.
> >=20
> > Here is the patch: [1]
>=20
> I have replied on the other thread.
> > > > +#ifndef BUG_ASM_CONST
> > > > +#define BUG_ASM_CONST ""
> > > > +#endif
> > >=20
> > > This line is a bit misterious to me. Would you be able to outline
> > > why
> > > an
> > > architecture would override this?
> > It is needed in case if compiler for an architecture doesn't have
> > proper support of '%c' ( it is so for ARM & RISC-V )
>=20
> Hmmm.... Why can't x86 use the same version? IOW what's the benefits
> to=20
> differ on x86?
We can't use '%c' for all architectures because not all compiler
supports '%c' fully for all architectures.
There is no any benefits. In case of x86 it is needed to delete
punctuation before immediate. I mean that immediate is passed as $1 (
or # i always missed with ARM ) and to drop $ it is used %c.
>=20
> Anyway, documentation is always good to have because it helps the=20
> reader/reviewer to understand how such decision was made.
I'll add the comment then before define.
>=20
> Cheers,
>=20
~ Oleksii

