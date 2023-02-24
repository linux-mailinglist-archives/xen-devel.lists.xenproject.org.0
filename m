Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08DD6A1FBF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501267.772938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb3f-0004fs-3P; Fri, 24 Feb 2023 16:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501267.772938; Fri, 24 Feb 2023 16:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb3f-0004dV-0h; Fri, 24 Feb 2023 16:36:31 +0000
Received: by outflank-mailman (input) for mailman id 501267;
 Fri, 24 Feb 2023 16:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVb3c-0004dI-Jy
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:36:28 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61faf62e-b461-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 17:36:26 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id n2so15350889lfb.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 08:36:26 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 m22-20020ac24256000000b004b57bbaef87sm779882lfl.224.2023.02.24.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:36:25 -0800 (PST)
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
X-Inumbo-ID: 61faf62e-b461-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PBLNpcztKBOquH/6KGWSHcSNv1WI6wUvaGKzulw6zwQ=;
        b=X34w8upy/2GpRTobrlMAaUnzAnpV5b6aIxQf49IVs5ywY2fpIHqp8GTvwabs4Z0BZi
         vYhLpEmpIKL2qLKVgzQ22UBWMVHZxZxLTO/VYTdoQ4pyk8INds1JPDqAswneuS+BfdlC
         0fSDSNP+md5NAZa0+pGYr1vUZzfMKDLYr89g4unNYvDGx63HiLqBpd5rV/TgteDK6Phq
         tZltlqrHjGpZTLVgp+OJNOo2feU5hjz/oml0u+fDL4YYeZ0eptcGmwZcVgIruO7c0mnC
         nlgiNy9mG5B5xaMvLpxCDkyeZSwInuM+o9bFO33Nzam9HIN6QSFgszshoblI7qThpovv
         suHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBLNpcztKBOquH/6KGWSHcSNv1WI6wUvaGKzulw6zwQ=;
        b=D5oKkzPqr6ClOsOhO252Wfwlq8sdPuKE960WkArdx9iDQOuyPH7urzkHiTAypy3xkT
         BMEOsE0KOGzh+SBE1AP0vHv2+BRQq1yMfoZ5yIvA4ldWa6R1ql9aVb4MdSPaL2C3nPfl
         jbZkZTJV/1qIh2++S4AEC67UpvBUUWR968ZyfmY8arLJ9Q66TbU/LJetXSX47hIxQ/b5
         y0ZGRcWafOotdyilFxFMZZEGDhM/wt+dhy5/xs1w7YrRjhrG8UCDflrL9lIgMACPJc09
         t0Yd2b/6xkHaF3nGkaoIN1YFU9d6dM7KGSAyeKLJOZYbB68S5lWpqvdUGcnQqANhjfQP
         Zb+w==
X-Gm-Message-State: AO0yUKWM4wKGN6px9rP//VMN4xPX0zjzweiUljyvXvsLhUpj+C1cER+7
	xS0K8WPWI37q0lyUbUO38vI=
X-Google-Smtp-Source: AK7set91lUBBwja1Vlta0EtqwFBC/CczfT5ORO1z9xzofAxIPYo58GZ+nR9nIZy/QNisf93Yvydx1A==
X-Received: by 2002:ac2:4479:0:b0:4da:ffb1:9872 with SMTP id y25-20020ac24479000000b004daffb19872mr5844786lfl.4.1677256586178;
        Fri, 24 Feb 2023 08:36:26 -0800 (PST)
Message-ID: <b2e99dbc61295ef8ab41ba8e8afa8f606ed6503d.camel@gmail.com>
Subject: Re: [PATCH] xen/riscv: read hart_id and dtb_base passed by
 bootloader
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 24 Feb 2023 18:36:24 +0200
In-Reply-To: <cbc043ac-fde9-50d9-a63f-40a6b4a59f34@suse.com>
References: 
	<94d722dea114defa2a5efe29e6511829f0c54b41.1677249592.git.oleksii.kurochko@gmail.com>
	 <cbc043ac-fde9-50d9-a63f-40a6b4a59f34@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-02-24 at 16:04 +0100, Jan Beulich wrote:
> On 24.02.2023 15:48, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/setup.c | 12 ++++++++++++
> > =C2=A01 file changed, 12 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index b3f8b10f71..154bf3a0bc 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -26,6 +26,18 @@ static void test_macros_from_bug_h(void)
> > =C2=A0
> > =C2=A0void __init noreturn start_xen(void)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The following things are passed by bootload=
er:
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a0 -> hart_id
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a1 -> dtb_base
> > +=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 register unsigned long hart_id=C2=A0 asm("a0");
> > +=C2=A0=C2=A0=C2=A0 register unsigned long dtb_base asm("a1");
> > +
> > +=C2=A0=C2=A0=C2=A0 asm volatile( "mv %0, a0" : "=3Dr" (hart_id) );
> > +
> > +=C2=A0=C2=A0=C2=A0 asm volatile( "mv %0, a1" : "=3Dr" (dtb_base) );
>=20
> Are you sure this (a) works and (b) is what you want? You're
> inserting
Oh, yeah... it should be:
  unsigned long hart_id;
  unsigned long dtb_base;

I did experiments with 'register' and 'asm()' and after rebase of my
internal branches git backed these changes...

Sorry for that I have to double check patches next time.

It looks like it works only because the variables aren't used anywhere.
> "mov a0, a0" and "mov a1, a1". I suppose as long as the two local
> variables aren't used further down in the function, the compiler will
> be able to recognize both registers as dead, and hence use them for
> argument passing to later functions that you call. But I would expect
> that to break once you actually consume either of the variables.
>=20
> Fundamentally I think this is the kind of thing you want do to in
> assembly. However, in the specific case here, can't you simply have
>=20
> void __init noreturn start_xen(unsigned long hard_id,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long dtb_base)
> {
> =C2=A0=C2=A0=C2=A0 ...
>=20
> and all is going to be fine, without any asm()?
One of the things that I would like to do is to not use an assembler as
much as possible. And as we have C environment ready after a few
assembly instructions in head.S I thought it would be OK to do it in C
code somewhere at the start so someone/sonething doesn't alter register
a0 and a1.
>=20
> Otherwise again a style nit: In the asm statements (not the register
> declarations) there is a missing blank each before the opening
> parenthesis.
>=20


> Jan
~Oleksii


