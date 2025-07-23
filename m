Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27FFB0FA3E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 20:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054626.1423357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uee8V-0001EB-FY; Wed, 23 Jul 2025 18:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054626.1423357; Wed, 23 Jul 2025 18:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uee8V-0001BG-Cn; Wed, 23 Jul 2025 18:24:15 +0000
Received: by outflank-mailman (input) for mailman id 1054626;
 Wed, 23 Jul 2025 18:24:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FKYz=2E=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uee8U-0001BA-0m
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 18:24:14 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b16d1d3-67f2-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 20:24:12 +0200 (CEST)
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
X-Inumbo-ID: 3b16d1d3-67f2-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753295051; x=1753554251;
	bh=2/kZ+Q31/+0dcWIDYtMKR9GPl3decczCQtrkGcRybA4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b007y+g5VKdUQhPPi/GVWU6SmovBWIXg3s6n8bdLGH5jVjqh4nXE4l08pVUUmzqyQ
	 U7n5utBiMCchJLXvrM7Ta4UIsDv9PNy2AGnwLxtXXpOXLsugs0cpMJ+/4iCfX+miIv
	 EXG66cwQr3qBDIYgQsT3HBg+Bk6PC5IxhbBoakCTva8ya2D8apcAY59y9F9WM0+2KU
	 qqtXOF71hzvo1DBpaQdiX77F4pvAVfc2cgqEu2JRyobulV6lETnBW4qLMgbNj1gdg5
	 sQuKL8tPTmehwitn6hJ72MIsdK9yPY02zy810tGcjHtS/VfcSeEliT+knkuN2sU8Or
	 eebcCMkaB5arQ==
Date: Wed, 23 Jul 2025 18:24:07 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9] xen/console: introduce domain_console struct
Message-ID: <aIEowjUsuWfwqSzX@kraken>
In-Reply-To: <b819d729-8533-46a5-b2a2-480a70cda556@suse.com>
References: <20250723001116.186009-1-dmukhin@ford.com> <b819d729-8533-46a5-b2a2-480a70cda556@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 41039611583913181d6f82f6b08d24dd2cf7e460
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 05:10:04PM +0200, Jan Beulich wrote:
> On 23.07.2025 02:11, dmkhn@proton.me wrote:
> > @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
> >  static int cf_check hvm_print_line(
> >      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> >  {
> > -    struct domain *cd =3D current->domain;
> > +    struct domain *d =3D current->domain;
>=20
> Why the renaming? (Iff any renaming was needed here, then please to currd=
.)

It was requested earlier:
  https://lore.kernel.org/all/1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com=
/

>=20
> > +    struct domain_console *cons =3D d->console;
> >      char c =3D *val;
> >
> >      ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
> > @@ -571,16 +572,21 @@ static int cf_check hvm_print_line(
> >      if ( !is_console_printable(c) )
> >          return X86EMUL_OKAY;
> >
> > -    spin_lock(&cd->pbuf_lock);
> > +    rcu_lock_domain(d);
>=20
> Given this is current->domain, it can't go away, and hence I don't think =
this
> is needed here.

Ack

>=20
> Jan
>=20


