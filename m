Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A66A6C66
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 13:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504012.776483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXLdu-0001EU-Oo; Wed, 01 Mar 2023 12:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504012.776483; Wed, 01 Mar 2023 12:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXLdu-0001B6-LM; Wed, 01 Mar 2023 12:33:10 +0000
Received: by outflank-mailman (input) for mailman id 504012;
 Wed, 01 Mar 2023 12:33:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXLdt-0001A6-L8
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 12:33:09 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3955e524-b82d-11ed-96a3-2f268f93b82a;
 Wed, 01 Mar 2023 13:33:09 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id f16so13755145ljq.10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 04:33:09 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 b14-20020a2e988e000000b002945d119e09sm1652062ljj.8.2023.03.01.04.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:33:08 -0800 (PST)
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
X-Inumbo-ID: 3955e524-b82d-11ed-96a3-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677673989;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rs+eVZNuYNxRD2SPfl1GBY+FetWiyECeBk76AcmnzK0=;
        b=hSBs2vKuP+RVgXFvz7o7kptMpklGJ+K3L8d0E9X8tB+D5vaCAV3NR/u9HApfP9lCre
         T7Srs/rAWnPdqTCcsPztf45hRsLd7N6U6OqwdIsTUm6TeztF/9zg1WJ7OR13D+OXabEX
         zP3osFSLMbv3566Oeh/d0X2/hV1a/GRTxF/cq+j3KJpItzZRlyGbiXHOHzToLJRfOHIK
         4kCCH+qoEbitUZ9h6clNyRJroK4Z7djJIGAkSx2SVtwhzjitTD4TPTC7PBM+bAF7ixiM
         lHAMo658XAJPebRKmbshzRR2EcSLccg6gFI99XVCCM1+ExxSIfhajsWrWOF1i51Cw9mB
         oOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677673989;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rs+eVZNuYNxRD2SPfl1GBY+FetWiyECeBk76AcmnzK0=;
        b=QLldww85QeIL19GV1ztrESjpiXcqVJVb7LshfkdPpkDJYPK5rvjFhuAC+kVnLHcZUX
         3Q1reX1jWEP9aRnc0yBH+9yX8AfpDAZ1Y6NpYs7VFucPMKNpIJOUXKDr7dJbAUA2nUTE
         g3r9rk+YHM9erVmgIJAYPMwDRVVtxfj81dN5uOYtmoHCDxeXP5hb2D4lQbkWBrfmzjFA
         RyUkdgyi3JODiY75DIg3ie0pWX4WCxPD9/p3oNxvXzuYrriCt/iA3ZiTmhksZ47hUKkA
         Z7G5gHe87TV28CBrdhhATWMHhvWsdCS8ax+CCEj9e9E8sDbvHtyQQ9jNq2R5Vo3DK48o
         Luww==
X-Gm-Message-State: AO0yUKWmqt1hd1RyXAj9YGzCzGGVun8qdXgopEl0BomItT2UqADrX1wa
	5LA3Bs5CwKrCkzCed+uW+io=
X-Google-Smtp-Source: AK7set/aYKO4NaEUWByulN1M+N+vycqtkNeXVdK2EbDEe2fSe8JfqLzAu0QUFOvYsqwU++Z1U5OTTg==
X-Received: by 2002:a2e:9815:0:b0:295:a2a5:87eb with SMTP id a21-20020a2e9815000000b00295a2a587ebmr1796915ljj.6.1677673988809;
        Wed, 01 Mar 2023 04:33:08 -0800 (PST)
Message-ID: <15934c091c536fc2bf56ada185d74123b1e5ed1d.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 01 Mar 2023 14:33:07 +0200
In-Reply-To: <538020a3-07d2-391b-0fcc-4e4b4902d2f7@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
	 <c0e628d744f03c70d2e7b66540ea27aa31d90043.camel@gmail.com>
	 <46e96dd9-bcb4-4569-b282-05c019cabcc3@xen.org>
	 <a2980d855cb11e447a794725163ff120d38fc127.camel@gmail.com>
	 <538020a3-07d2-391b-0fcc-4e4b4902d2f7@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-01 at 09:31 +0000, Julien Grall wrote:
> Hi,
>=20
> On 01/03/2023 08:58, Oleksii wrote:
> > On Tue, 2023-02-28 at 17:48 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > On 28/02/2023 15:09, Oleksii wrote:
> > > > On Sat, 2023-02-25 at 16:49 +0000, Julien Grall wrote:
> > > > > Hi Oleksii,
> > > > >=20
> > > > > On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > > > > > The following changes were made:
> > > > > > * make GENERIC_BUG_FRAME mandatory for ARM
> > > > >=20
> > > > > I have asked in patch #1 but will ask it again because I
> > > > > think
> > > > > this
> > > > > should be recorded in the commit message. Can you outline why
> > > > > it
> > > > > is
> > > > > not
> > > > > possible to completely switch to the generic version?
> > > > I haven't tried to switch ARM too because of comment regarding
> > > > 'i'
> > > > in
> > > > <asm/bug.h>:
> > > > /*
> > > > =C2=A0=C2=A0 * GCC will not allow to use "i"=C2=A0 when PIE is enab=
led (Xen
> > > > doesn't
> > > > set
> > > > the
> > > > =C2=A0=C2=A0 * flag but instead rely on the default value from the
> > > > compiler).
> > > > So
> > > > the
> > > > =C2=A0=C2=A0 * easiest way to implement run_in_exception_handler() =
is to
> > > > pass
> > > > the
> > > > to
> > > > =C2=A0=C2=A0 * be called function in a fixed register.
> > > > =C2=A0=C2=A0 */
> > >=20
> > > I would expect this comment to be valid for any arch. So if there
> > > is
> > > a
> > > need to deal with PIE, then we would not be able to use "i" in
> > > the
> > > BUG
> > > frame.
> > >=20
> > > Note that we are now explicitly compiling Xen without PIE (see
> > > Config.mk).
> > Then it looks like some architectures isn't expected to be compiled
> > with PIE. I mean that x86's bug.h is used 'i' and there is no any
> > alternative version in case of PIE.
> >=20
> > If Xen should be compilable with PIE then we have to use ARM
> > implementation of bug.h everywhere. ( based on comment about 'i'
> > with
> > PIE ).
>=20
> The comment was added because until commit ecd6b9759919 ("Config.mk:=20
> correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS") we would let
> the compiler to decide whether PIE should be enabled.
>=20
> Now we are forcing -fno-pie for Xen on any architecture (the flag is=20
> added at the top-level in Config.mk).
>=20
> >=20
> > Now I am totally confused...
>=20
> My point was not about using the Arm implementation everywhere. My
> point=20
> was that we disable even for Arm and therefore it is fine to use the=20
> common version.
>=20
> If in the future we need to support PIE in Xen (I am not aware of any
> effort yet), then we could decide to update the common BUG framework.
> But for now, I don't think this is something you need to care in your
> series.
>=20
Thanks for clarification.

> Cheers,
>=20


