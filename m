Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBBACE7A7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 02:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006112.1385370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMyvK-0006GF-6V; Thu, 05 Jun 2025 00:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006112.1385370; Thu, 05 Jun 2025 00:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMyvK-0006Dc-3O; Thu, 05 Jun 2025 00:57:38 +0000
Received: by outflank-mailman (input) for mailman id 1006112;
 Thu, 05 Jun 2025 00:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nB46=YU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMyvI-0006DW-Jx
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 00:57:36 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102d6672-41a8-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 02:57:33 +0200 (CEST)
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
X-Inumbo-ID: 102d6672-41a8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749085052; x=1749344252;
	bh=awmIl9NoMME1vVxstyWfTyCNGNxKPbkGb9bMS0sKVPI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VMYq233qiBuLWLJ//yhRonJn/FRiysDOqu4OwGznTX0K5mWR7ynMr5/dkpeS+qU88
	 PxbpOqDCdiJT6o56XQprKFJaJxcaZZvULcUJT7PDzaUssYiBDUxs8bJZuwg4aWQEhq
	 f7nUcSIx0N+9NJFlrPH634IiNOxUkjfXepDG4CXXkBYp5x1z2ROuRORqwmK5rtXbZK
	 I7QrMyK6DHaGC7/Z/LmlNDOrUVsvDxHldTzs1o+L2SYKcqpKI810Dcg3VejA10VCSD
	 V0KNIdnJaI7Cd2aeF88HWhl3eA75ul2c7UIjBr0rXFd22qO/DhvFkBM9wCsRQFty0I
	 XOozwTkg64rvw==
Date: Thu, 05 Jun 2025 00:57:26 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aEDrcJ9JE3p6Xj7Q@kraken>
In-Reply-To: <71318dd2-0724-4c2a-9786-40b676411e56@suse.com>
References: <20250531000417.81750-1-dmukhin@ford.com> <20250531000417.81750-3-dmukhin@ford.com> <71318dd2-0724-4c2a-9786-40b676411e56@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cc8100ddd9f7c3cf39d7caf070ecff2f87063e48
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 12:48:05PM +0200, Jan Beulich wrote:
> On 31.05.2025 02:04, dmkhn@proton.me wrote:
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -577,7 +577,7 @@ static int cf_check hvm_print_line(
> >      if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n=
') )
> >      {
> >          cd->pbuf[cd->pbuf_idx] =3D '\0';
> > -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> > +        guest_printk(cd, "%s\n", cd->pbuf);
> >          cd->pbuf_idx =3D 0;
> >      }
>=20
> Why this and ...
>=20
> > @@ -755,7 +765,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PA=
RAM(char) buffer,
> >              else
> >              {
> >                  cd->pbuf[cd->pbuf_idx] =3D '\0';
> > -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kb=
uf);
> > +                guest_printk(cd, "%s%s\n", cd->pbuf, kbuf);
> >                  cd->pbuf_idx =3D 0;
> >              }
>=20
> ... this change? There's no compensation for it ...
>=20
> > @@ -1013,12 +1023,21 @@ void printk(const char *fmt, ...)
> >      va_end(args);
> >  }
> >
> > +/*
> > + * Print message from the guest on the diagnostic console.
> > + * Prefixes all messages w/ "(dX)" if domain X does not own physical c=
onsole
> > + * focus.
> > + */
> >  void guest_printk(const struct domain *d, const char *fmt, ...)
> >  {
> >      va_list args;
> > -    char prefix[16];
> > +    char prefix[16] =3D "";
> > +    struct domain *consd;
> >
> > -    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> > +    consd =3D console_get_domain();
> > +    if ( consd !=3D d )
> > +        snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> > +    console_put_domain(consd);
> >
> >      va_start(args, fmt);
> >      vprintk_common(fmt, args, prefix);
>=20
> ... here afaics, so it looks like you're undermining rate-limiting of
> those messages.

I droppped behavior change for I/O debug port on x86 and HYPERVISOR_console=
_io
hypercall.

But my understanding is that all guest debugging facilities, if enabled, sh=
ould
not be rate-limited.

>=20
> Jan


