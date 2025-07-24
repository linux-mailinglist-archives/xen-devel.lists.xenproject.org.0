Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E84BB0FEB7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 04:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055039.1423606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uelWU-0001q9-3m; Thu, 24 Jul 2025 02:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055039.1423606; Thu, 24 Jul 2025 02:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uelWU-0001nn-0h; Thu, 24 Jul 2025 02:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1055039;
 Thu, 24 Jul 2025 02:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BvLp=2F=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uelWS-0001nh-IA
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 02:17:28 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56c533af-6834-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 04:17:25 +0200 (CEST)
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
X-Inumbo-ID: 56c533af-6834-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753323444; x=1753582644;
	bh=bND8N3wDIqeXPtH1fS8hmggOkFpGaKFL5hqkQ/a5XgM=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WXXIUhKKL/Up2QyFWZ/G+OmsufU8EN0fmJoumr2BfCGHJMmqFXH1L0k5L82XvEG3d
	 cvjVpevJnV4Fne/F65dljXRgry+3mHP6uTUafOVRIC/6c3eWxjwWb/J9Cm5Kgb/HGu
	 ePvF4/8ukm3J17UvHxdQpp5lXVAiRv7YwkcAu04jwo8AlRvM2Pa+drB+7osuyC2NE+
	 ENS5wNeGVnP78+drkntxwgOmpa98/Ahi8y7b6wMz3rnJ+gq8wHFVVAKhWBc8GkFijc
	 XPeIhfKJCN9+DONnW6ObMthJNA0QNPaR4iiOS+C1RGDFfDqAfx4tEIwFAY0Xv49uAf
	 BVSpuTdxXZSdg==
Date: Thu, 24 Jul 2025 02:17:20 +0000
To: Jan Beulich <jbeulich@suse.com>, alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Subject: Re: [PATCH v9] xen/console: introduce domain_console struct
Message-ID: <aIGXrDdDHsOvH5rf@kraken>
In-Reply-To: <aIEowjUsuWfwqSzX@kraken>
References: <20250723001116.186009-1-dmukhin@ford.com> <b819d729-8533-46a5-b2a2-480a70cda556@suse.com> <aIEowjUsuWfwqSzX@kraken>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6b27a5bf65a41d9db3d5c7f918147345d4284f96
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 06:24:07PM +0000, dmkhn@proton.me wrote:
> On Wed, Jul 23, 2025 at 05:10:04PM +0200, Jan Beulich wrote:
> > On 23.07.2025 02:11, dmkhn@proton.me wrote:
> > > @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
> > >  static int cf_check hvm_print_line(
> > >      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> > >  {
> > > -    struct domain *cd =3D current->domain;
> > > +    struct domain *d =3D current->domain;
> >=20
> > Why the renaming? (Iff any renaming was needed here, then please to cur=
rd.)
>=20
> It was requested earlier:
>   https://lore.kernel.org/all/1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.c=
om/
>=20

What would be the preferred way to address this?

Add `const` to domain pointer?
`s/cd/currd/`?=20
`s/cd/d/` like in previous review?
Do not touch `cd`?

It make sense to adjust the code now by at least adding `const`.

> >=20
> > > +    struct domain_console *cons =3D d->console;
> > >      char c =3D *val;
> > >
> > >      ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
> > > @@ -571,16 +572,21 @@ static int cf_check hvm_print_line(
> > >      if ( !is_console_printable(c) )
> > >          return X86EMUL_OKAY;
> > >
> > > -    spin_lock(&cd->pbuf_lock);
> > > +    rcu_lock_domain(d);
> >=20
> > Given this is current->domain, it can't go away, and hence I don't thin=
k this
> > is needed here.
>=20
> Ack
>=20
> >=20
> > Jan
> >=20


