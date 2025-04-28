Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18F3A9F9D2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 21:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971017.1359521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UNu-000562-Hi; Mon, 28 Apr 2025 19:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971017.1359521; Mon, 28 Apr 2025 19:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UNu-000545-EF; Mon, 28 Apr 2025 19:43:22 +0000
Received: by outflank-mailman (input) for mailman id 971017;
 Mon, 28 Apr 2025 19:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2FI=XO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u9UNr-00053z-Tq
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 19:43:21 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0800f6be-2469-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 21:43:17 +0200 (CEST)
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
X-Inumbo-ID: 0800f6be-2469-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=og4lo4ssrzgzfbcrpvzyrmv7fu.protonmail; t=1745869396; x=1746128596;
	bh=wRgkXbc2yl05GK2B9vL5f3uMltGm6Th/xvyUhONdStM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KiZX3VHNsNgysqk9qPmysAJad4Z30FYuzAlZ1S4Ibf77ZBdBo8rubyRXiUJCclDmu
	 pnwr2DkZcptHBf+pfCYtkKfDpzy3q8a3Yn3Xze7mlGltHXJqpLdUMkhxM78tGRgmJt
	 zzFOL7nt/FL+PAbTdPuR3/gmtHrDsF5ljkrsyj7qMBf599ExkWJqcUv44MBcJie1Dp
	 0bdSeDnpa/SbDUj33hp0sOOTEHumvCvSy3rroVzbVm9Za9EN18SVKUVzsZ+Tu5C83K
	 QwFvVb3pyQEmNeJYyC4V4vnkI3aX8CSjnRSaoFCHS5fXLLFNbGO0BYVBSlFoAD81WR
	 7S3/rRyAiJCeg==
Date: Mon, 28 Apr 2025 19:43:11 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v4 2/3] x86/vmx: Update DR7 type
Message-ID: <aA/aSwHbr6V3qoF/@kraken>
In-Reply-To: <27800fcd-76e3-429c-921d-72bf7670686d@citrix.com>
References: <20250426072739.39373-1-dmukhin@ford.com> <27800fcd-76e3-429c-921d-72bf7670686d@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 794d04614d3ca427c51bdd25b9fd407b2f708bd5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:48:42PM +0100, Andrew Cooper wrote:
> On 26/04/2025 8:27 am, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Convert the DR7 type to `unsigned int` and fix the accesses where neces=
sary.
> >
> > [1] https://lore.kernel.org/xen-devel/0d01646b-83e3-4a02-b365-d149d2664=
e73@citrix.com/
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  xen/arch/x86/hvm/vmx/vmx.c        | 2 +-
> >  xen/arch/x86/include/asm/domain.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index 4883bd823d..75c6992172 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -926,7 +926,7 @@ static void vmx_save_dr(struct vcpu *v)
> >      v->arch.dr[3] =3D read_debugreg(3);
> >      v->arch.dr6   =3D read_debugreg(6);
> >      /* DR7 must be saved as it is used by vmx_restore_dr(). */
> > -    __vmread(GUEST_DR7, &v->arch.dr7);
> > +    v->arch.dr7 =3D vmread(GUEST_DR7);
>=20
> Two minor points.=C2=A0 The =3D wants lining up for vertical tabulation, =
and ...
>=20
> >  }
> >
> >  static void __restore_debug_registers(struct vcpu *v)
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index 5fc1d1e5d0..a54ef3a8c1 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -595,7 +595,7 @@ struct arch_vcpu
> >
> >      /* Debug registers. */
> >      unsigned long dr[4];
> > -    unsigned long dr7; /* Ideally int, but __vmread() needs long. */
> > +    unsigned int dr7;
> >      unsigned int dr6;
>=20
> ... these fields want switching back around now that dr7 is unsigned int.
>=20
> We always access in numeric order, and they're only out-of-order for
> packing reasons.
>=20
> Can fix on commit.

Thanks!

>=20
> ~Andrew


