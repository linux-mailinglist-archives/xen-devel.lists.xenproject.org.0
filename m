Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8763AD4733
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 02:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011255.1389635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8zt-0008C2-Vi; Wed, 11 Jun 2025 00:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011255.1389635; Wed, 11 Jun 2025 00:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8zt-0008AM-S8; Wed, 11 Jun 2025 00:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1011255;
 Wed, 11 Jun 2025 00:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SK+0=Y2=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP8zr-0008AF-Ht
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 00:07:16 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04582a3d-4658-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 02:07:09 +0200 (CEST)
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
X-Inumbo-ID: 04582a3d-4658-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749600427; x=1749859627;
	bh=jaLJ79BvQJaBvTtiM9Elp0dvx6sjx1xkBHzCm9ge+Rk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ml2nTtQF8sL3Maq/Tt9nI5z1+dvImHHyZmjzZ3llYzw34HdJRxyGq3Kt+TDzEi3my
	 QVvOOV6RszTGfHz59W7d69B/2wAI6HplPKJEHMdyfIhmxLypym2Le6LUlQKC19O5zH
	 Jx1JVdo7CW+xgUAZOuLeSg4imBsd0q4Yjn3wsCS/cTIffhr7EsFmFzuvukCTPpjsNs
	 8zxca0cGBU36+cbMqX/a/SVMN/XdWYdmRpkzzO5DDoYVVD8SoOTk9tpeX0+QteAk6X
	 Gs1SuyEh+cxD9rjoawlT+xkgVtHweMYyNZGG3PmLp92WYrgpEbT4bE/wUDbMwDJQY3
	 4J0PP4HsQrgMA==
Date: Wed, 11 Jun 2025 00:07:00 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aEjInVF3zaa+VVd2@kraken>
In-Reply-To: <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com>
References: <20250606201102.2414022-1-dmukhin@ford.com> <20250606201102.2414022-3-dmukhin@ford.com> <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b531e9a38685d23f8c2392f03c58e829a1ec2011
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
> On 06.06.2025 22:11, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > If virtual UART from domain X prints on the physical console, the behav=
ior is
> > updated to (see [1]):
> > - console focus in domain X: do not prefix messages;
> > - no console focus in domain X: prefix all messages with "(dX)".
>=20
> While, as indicated (much) earlier, I can see why omitting the prefix
> may make sense for the domain having input focus, ...
>=20
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_P=
ARAM(char) buffer,
> >          if ( is_hardware_domain(cd) )
> >          {
> >              /* Use direct console output as it could be interactive */
> > +            char prefix[16] =3D "";
> > +            struct domain *consd;
> > +
> > +            consd =3D console_get_domain();
> > +            if ( consd !=3D cd )
> > +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_=
id);
> > +            console_put_domain(consd);
> > +
> >              nrspin_lock_irq(&console_lock);
> > +            if ( prefix[0] !=3D '\0' )
> > +                console_send(prefix, strlen(prefix), flags);
> >              console_send(kbuf, kcount, flags);
> >              nrspin_unlock_irq(&console_lock);
> >          }
>=20
> ... this, aiui, is a behavioral change for the non-dom0less case, where
> Dom0 output will suddenly also gain the prefix. Which I don't think is
> wanted: Switching focus between Xen and Dom0 should remain unaffected
> in this regard.

This change ensures that dom0 traces aren't mixed with domU traces when dom=
U
has input focus, or with Xen traces when the administrator is in the diagno=
stic
console.

Also, this can be used in the non-interactive tests (e.g. XTF).

>=20
> Jan
>=20


