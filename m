Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06678CBC28
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727247.1131667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gXP-0002AK-GD; Wed, 22 May 2024 07:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727247.1131667; Wed, 22 May 2024 07:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gXP-00027W-DS; Wed, 22 May 2024 07:37:27 +0000
Received: by outflank-mailman (input) for mailman id 727247;
 Wed, 22 May 2024 07:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+y9w=MZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s9gXO-00027Q-1g
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 07:37:26 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20e19630-180e-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 09:37:23 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e8a8ff4083so5616291fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 00:37:23 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d18344desm38641271fa.138.2024.05.22.00.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:37:22 -0700 (PDT)
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
X-Inumbo-ID: 20e19630-180e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716363443; x=1716968243; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DKRNFZzvIbL0pORYIxOHD/ZDQvIm7q+yrchKCOPsIjE=;
        b=LjJlq0a9jGxB/ajVdGbSpt4jsujjaSU1juTrLflNh9y0Oq8rfVLxyEA37DXjNrldaw
         f9mqrUSRF5r6SuSlikxo29bYCIybl7KMHuI6LbnkYgtMlSfIFWwdjVPGjTljnIaJfKv4
         WxD0aj59doHtIOutb1+ZuJ3xOO7k5kieDXgtCw8kgc2mCbzCNbz8FRl/nyqO/Fgiinwv
         c7ZP9WZLtGpiSR15GpELVXylblhE/R5C+WRtG9Xc53/AIAio9iPM7CLFxrWnbgg+UDS0
         n4nxKrpCowng9fZwNNnt3Ydjztld6YHg8PpsozqOXeqbuNUp2UaPYSTG4xbcoHtpn1C7
         cu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716363443; x=1716968243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKRNFZzvIbL0pORYIxOHD/ZDQvIm7q+yrchKCOPsIjE=;
        b=OxSTrCtKK705aXO6d99sjLBLMMLeuGZrpQCsOIa8mI/g8EpwDrlZxdQeXTosmrAYYS
         JoE40UZAIml9WaxKKC06kAvJFyYTkMgtykzzacnmMxcx+zbgfD9LbqUzRBhBlB4e+6Qd
         auvPS9YeYrZHfejLHpcrsGRXLTi83xPuIG46SyrELXr7HlIubKxOG5VZITwPytMCwl+7
         rvBQOk2QMTbVLffduaH9xM34ty2kADPnBNC8CycisCmPlQqYiglMI2AiFDAVJSg4SSqL
         7jQojZtgPa6U+Y6sfIQuK90lXYnu69tUkpNCvOvExTjFR7Kop4v+sGaubMitC43XStmy
         tAEg==
X-Forwarded-Encrypted: i=1; AJvYcCXvg022U2MXRrZTJAIqvyLCEDt7+NFfsrdCKmwROzgUVqU9V601H9VnIaChXpMoLQs2BkVXaIDF5SlQIPSHVX+JgCMxTUsWiTExcKT9XUk=
X-Gm-Message-State: AOJu0YzW7Li53wjBnGMppbJZLpclCp7GsNsoQQq3y7Lr+TXgH+Q56q6M
	kMCLIAKwJ1uiGykN8gTndpRYVpW8qtq6DndvwwaiItAWPh4V5fjQ
X-Google-Smtp-Source: AGHT+IESgKnIK9J8eqTpzAs/87mX/VdvKKQvGMvWmTeZvHGLDkK00OOWjhDFVddxJ15so5DzNeJnbA==
X-Received: by 2002:a2e:8911:0:b0:2dc:f188:9945 with SMTP id 38308e7fff4ca-2e7171cc6demr31057841fa.25.1716363442785;
        Wed, 22 May 2024 00:37:22 -0700 (PDT)
Message-ID: <9e59da99eb87a7d3fcd8cc6a3c6d6ef2753736af.camel@gmail.com>
Subject: Re: [PATCH v10 03/14] xen/bitops: implement fls{l}() in common logic
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 May 2024 09:37:21 +0200
In-Reply-To: <d26a4033-8cd1-4a9c-8549-49a36b7d52fb@suse.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
	 <43df611d1c7b7ac16b181fb819f5d886daa31bad.1715952103.git.oleksii.kurochko@gmail.com>
	 <d26a4033-8cd1-4a9c-8549-49a36b7d52fb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-05-21 at 13:18 +0200, Jan Beulich wrote:
> On 17.05.2024 15:54, Oleksii Kurochko wrote:
> > To avoid the compilation error below, it is needed to update to
> > places
> > in common/page_alloc.c where flsl() is used as now flsl() returns
> > unsigned int:
> >=20
> > ./include/xen/kernel.h:18:21: error: comparison of distinct pointer
> > types lacks a cast [-Werror]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (void) (&_x =3D=3D &_y);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
> > =C2=A0=C2=A0=C2=A0 common/page_alloc.c:1843:34: note: in expansion of m=
acro 'min'
> > =C2=A0=C2=A0=C2=A0=C2=A0 1843 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned int inc_order =3D min(MAX_ORDER, flsl(e
> > - s) - 1);
> >=20
> > generic_fls{l} was used instead of __builtin_clz{l}(x) as if x is
> > 0,
> > the result in undefined.
> >=20
> > The prototype of the per-architecture fls{l}() functions was
> > changed to
> > return 'unsigned int' to align with the generic implementation of
> > these
> > functions and avoid introducing signed/unsigned mismatches.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0The patch is almost independent from Andrew's patch series
> > =C2=A0(
> > https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.coope=
r3@citrix.com/T/#t
> > )
> > =C2=A0except test_fls() function which IMO can be merged as a separate
> > patch after Andrew's patch
> > =C2=A0will be fully ready.
>=20
> If there wasn't this dependency (I don't think it's "almost
> independent"),
> I'd be offering R-b with again one nit below.

Aren't all changes, except those in xen/common/bitops.c, independent? I
could move these changes in xen/common/bitops.c to a separate commit. I
think it is safe to commit them ( an introduction of common logic for
fls{l}() and tests ) separately since the CI tests have passed.

~ Oleksii

>=20
> > --- a/xen/arch/x86/include/asm/bitops.h
> > +++ b/xen/arch/x86/include/asm/bitops.h
> > @@ -425,20 +425,21 @@ static always_inline unsigned int
> > arch_ffsl(unsigned long x)
> > =C2=A0 *
> > =C2=A0 * This is defined the same way as ffs.
> > =C2=A0 */
> > -static inline int flsl(unsigned long x)
> > +static always_inline unsigned int arch_flsl(unsigned long x)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 long r;
> > +=C2=A0=C2=A0=C2=A0 unsigned long r;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 asm ( "bsr %1,%0\n\t"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "jnz 1f\n\=
t"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mov $-1,%=
0\n"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:" : "=
=3Dr" (r) : "rm" (x));
> > -=C2=A0=C2=A0=C2=A0 return (int)r+1;
> > +=C2=A0=C2=A0=C2=A0 return (unsigned int)r+1;
>=20
> Since you now touch this, you'd better tidy it at the same time:
>=20
> =C2=A0=C2=A0=C2=A0 return r + 1;
>=20
> (i.e. style and no need for a cast).
>=20
> Jan


