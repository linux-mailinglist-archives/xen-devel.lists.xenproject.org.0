Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233DB01097
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 03:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040068.1411540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua2F3-00021J-S8; Fri, 11 Jul 2025 01:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040068.1411540; Fri, 11 Jul 2025 01:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua2F3-0001zs-P9; Fri, 11 Jul 2025 01:07:57 +0000
Received: by outflank-mailman (input) for mailman id 1040068;
 Fri, 11 Jul 2025 01:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qtn+=ZY=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ua2F1-0001zl-VY
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 01:07:56 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79779cf5-5df3-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 03:07:54 +0200 (CEST)
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
X-Inumbo-ID: 79779cf5-5df3-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752196073; x=1752455273;
	bh=li73SIwEHAoldHq+rpMSeKGkFZRkIwGwKFxfMpT0TVc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aEoOk2QumtODoL0AWwwI2TUjDfbCKqraga3seqqSoWbDfHjnlwVtUce6B8v+LzchC
	 rizZXmdOTy6+uT9CqBwyOmn4u5C25hMLG+gzyCv1sA104HHR233O2H8zqKmWSv1eHg
	 +EYYpAp7gwBBwBZZ2iHKR2IoFxP335xr1747pdUWYSMqTHWIiiqU18Ty3NiJca2nuQ
	 bby117D9HFE69AuYoX6wkaSYDVkLP4wi0BTA7n3ThevqIhIYNDJJlRTcGz8ALYsoHz
	 ZW5+3P4S8eATwm6PSYYL5EiQNF4LybbVFR2nEKCW6SRguhQsxCyCGZaBEzi+RZMTME
	 uEF/T0dVVU0Mg==
Date: Fri, 11 Jul 2025 01:07:49 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] xen/console: introduce domain_console struct
Message-ID: <aHBj4IZdD50LWSgF@kraken>
In-Reply-To: <6e3600ad-f53c-4e9a-9713-4301b5bd0a6a@suse.com>
References: <20250710013421.2321353-1-dmukhin@ford.com> <6e3600ad-f53c-4e9a-9713-4301b5bd0a6a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8b8328d492120b0176cd736963a9281879a26065
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 01:16:24PM +0200, Jan Beulich wrote:
> On 10.07.2025 03:35, dmkhn@proton.me wrote:
> > @@ -877,6 +873,16 @@ struct domain *domain_create(domid_t domid,
> >
> >      /* All error paths can depend on the above setup. */
> >
> > +    BUILD_BUG_ON(DOMAIN_CONSOLE_BUF_SIZE <=3D 0);
>=20
> While the "equals 0" case can in principle happen, the "less than" part
> is dead code (and hence this needs checking differently): The type of
> DOMAIN_CONSOLE_BUF_SIZE is an unsigned one, so wrapping through 0 will
> yield huge positive values.
>=20
> > +    err =3D -ENOMEM;
> > +    d->console =3D xzalloc_bytes(DOMAIN_CONSOLE_SIZE);
>=20
> As previously indicated, new code ought to use the xv*alloc family of
> functions, which deliberately doesn't include any ..._bytes() forms.
> Note how instead there is xvzalloc_flex_struct() for situations like
> the one here.

Looks like xvzalloc_flex_struct() is not used anywhere in the code base...

>=20
> > @@ -371,6 +373,26 @@ struct evtchn_port_ops;
> >
> >  #define MAX_NR_IOREQ_SERVERS 8
> >
> > +/*
> > + * Domain console settings is the dynamically-allocated data structure=
.
> > + * Using an even multiple of a cache line size may help to optimize th=
e
> > + * allocation overhead.
> > + */
> > +#define DOMAIN_CONSOLE_SIZE     ROUNDUP(256, SMP_CACHE_BYTES)
> > +#define DOMAIN_CONSOLE_BUF_SIZE (DOMAIN_CONSOLE_SIZE - \
> > +                                 sizeof(struct domain_console))
>=20
> But you're aware that there's allocation overhead, which consumes part of
> a cacheline? I simply don't understand why this struct is so different
> from others that such cleverness needs building in. Yet if it's relevant,
> it really needs doing correctly.
>=20
> > +/* Domain console settings. */
> > +struct domain_console {
> > +    /* Permission to take ownership of the physical console input. */
> > +    bool input_allowed;
> > +
> > +    /* hvm_print_line() and guest_console_write() logging. */
> > +    unsigned int idx;
> > +    spinlock_t lock;
> > +    char buf[0];
>=20
> Iirc recent gcc warns about the use of this historic gcc extension, since
> there has been the better form using just [] for quite a long time.
>=20
> Jan


