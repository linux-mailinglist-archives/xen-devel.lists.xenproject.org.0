Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F268A7E946
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940774.1340427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qor-0003aa-Qn; Mon, 07 Apr 2025 18:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940774.1340427; Mon, 07 Apr 2025 18:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qor-0003Yh-NL; Mon, 07 Apr 2025 18:03:37 +0000
Received: by outflank-mailman (input) for mailman id 940774;
 Mon, 07 Apr 2025 18:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pNbr=WZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u1qop-0003WY-DB
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:03:36 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e5c13fe-13da-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 20:03:33 +0200 (CEST)
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
X-Inumbo-ID: 9e5c13fe-13da-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744049012; x=1744308212;
	bh=VQSjHyIMBY2yQgG6dCYksotb0DE3V4OgALr6R+duOZo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jvSZaxcuH9cDIz3QDziFD/KdFWfIm/C3Pahcat8EEeZIla0yFAmwxlxjPXWhetOhI
	 ifKIss7t4RjwoD45Hf8o0i6OdlHlLpxBi2TtvFoq5i1k8mxGXw6wQL9Qc1HSXCUV8k
	 g3byE0ut4iH7vMcIjQkBdoiK1a8nEAAhb+ru61h/1LYxJxSJrNHzf17pJkREhhfwXl
	 dGCp0QDui9pMthj20whQY+e2oI6J0upzkrQQTGYs/GZZCoiDaO6lyg35ljACkr0ahy
	 FeLxLXnO0gJtyt0XUexnBP2idsC1uY5HQuqzroa0sXMOInm80SqntFdS9qfAXqb6hJ
	 f+as++p7FdRPg==
Date: Mon, 07 Apr 2025 18:03:26 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v3] x86/emulate: Remove HAVE_AS_RDRAND and HAVE_AS_RDSEED
Message-ID: <WvbDDLWG-dJvF50QECiFigf3QxsO7k9-59uVLPwxagm7NFE_ZRoJ8RZ9XjV4umDgxFboXuKVnorjaNiLH3rPy6NBqUYY9S_rTwpPyZG6x-c=@proton.me>
In-Reply-To: <c34b4537-9563-452c-869f-a412749ebfad@citrix.com>
References: <20250405012417.3108759-1-dmukhin@ford.com> <c34b4537-9563-452c-869f-a412749ebfad@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 60c2b2a5fb91a3e6a7b9959b78f08a2f635fa5ef
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 7th, 2025 at 2:17 AM, Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:

>=20
>=20
> On 05/04/2025 2:25 am, dmkhn@proton.me wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > The new toolchain baseline knows the rdrand/rdseed instructions,
> > no need to carry the workaround in the code.
>=20
>=20
> A few minor notes. Instructions in CAPITALS please to make them easier
> to parse in context. The comma ought to be a semi-colon.
>=20
> You should note that arch_get_random() is adjusted too.
>=20
> Also, it's useful to state "No functional change." to help reviewers.
> (Or to help archaeologies figure out the intent of the patch if they
> subsequently find a bug in it.)

Noted, thanks for the feedback

>=20
> > diff --git a/xen/arch/x86/include/asm/random.h b/xen/arch/x86/include/a=
sm/random.h
> > index 9e1fe0bc1d..e1c1c765e1 100644
> > --- a/xen/arch/x86/include/asm/random.h
> > +++ b/xen/arch/x86/include/asm/random.h
> > @@ -8,7 +8,7 @@ static inline unsigned int arch_get_random(void)
> > unsigned int val =3D 0;
> >=20
> > if ( cpu_has(&current_cpu_data, X86_FEATURE_RDRAND) )
> > - asm volatile ( ".byte 0x0f,0xc7,0xf0" : "+a" (val) );
> > + asm volatile ( "rdrand %0" : "=3Da" (val) );
>=20
>=20
> This was only tied to "a" because 0xf0 is the ModRM byte. Now that we
> can use the mnemonic, it can become "=3Dr".
>=20
> I've fixed all on commit.

Thank you!

>=20
> ~Andrew

