Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C1BB21983
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 01:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078146.1439148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcE4-0004Jq-EU; Mon, 11 Aug 2025 23:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078146.1439148; Mon, 11 Aug 2025 23:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcE4-0004HO-BV; Mon, 11 Aug 2025 23:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1078146;
 Mon, 11 Aug 2025 23:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EhVm=2X=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ulcE1-0004HI-5C
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 23:46:46 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c5ead86-770d-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 01:46:38 +0200 (CEST)
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
X-Inumbo-ID: 6c5ead86-770d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754955996; x=1755215196;
	bh=45YZaAccxyO0H/wTpuwwvtCoJrDQ1nfLPoAe4C+9ZHk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CvOGE97DP6jnkO9gvoJHpsswc253mhFKyLKjlJuRpm+qYV7Kz91qRz35zMzrWKQgo
	 wHLX6VxZSGULNTq/XlaslouSI+yVnGUiYWJnZA7WEabpFp7gk5gXNkZx+Y8/cQnz6D
	 ECMbzRA6zLuFIhExFPV9tqj7PfclfUa6rEffsDhJngrvraSnz3EixHE0UfnkWW5sJs
	 7e2MRz9B/x/dv3Om4sqOb9TGnwrWXfeXGDGFfmTWS9mDWzxHRHy5hdI4yPnBYGq0H9
	 HboRjzNsU3vLJ2Ea/Yqlhnxrhn3e0y4jaMoUXTYsFf+wVa7vegsGXy4q9SmBBrbWyV
	 DVv8TpWWgcaPw==
Date: Mon, 11 Aug 2025 23:46:32 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v15 1/4] xen/domain: unify domain ID allocation
Message-ID: <aJqA0yi5k0qtg6TU@kraken>
In-Reply-To: <db85bafd-c2f8-4aa0-9cf4-0529b0a39bcd@suse.com>
References: <20250809170747.1836880-1-dmukhin@ford.com> <20250809170747.1836880-2-dmukhin@ford.com> <db85bafd-c2f8-4aa0-9cf4-0529b0a39bcd@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 88a8abf1cc3e039132c37fff2b1d2ee00e144360
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 01:14:49PM +0200, Jan Beulich wrote:
> On 09.08.2025 19:08, dmkhn@proton.me wrote:
> > --- /dev/null
> > +++ b/xen/common/domid.c
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Domain ID allocator.
> > + *
> > + * Covers dom0 or late hwdom, predefined domains, post-boot domains.
> > + * Excludes system domains (ID >=3D DOMID_FIRST_RESERVED).
> > + *
> > + * Copyright 2025 Ford Motor Company
> > + */
> > +
> > +#include <xen/domain.h>
> > +
> > +static DEFINE_SPINLOCK(domid_lock);
> > +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> > +
> > +/*
> > + * Allocate domain ID.
> > + *
> > + * @param domid Domain ID hint:
> > + * - If an explicit domain ID is provided, verify its availability and=
 use it
> > + *   if ID is not used;
> > + * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] =
range,
> > + *   starting from the last used ID. Implementation guarantees that tw=
o
> > + *   consecutive calls will never return the same ID. ID#0 is reserved=
 for
> > + *   the first boot domain (currently, dom0) and excluded from the all=
ocation
> > + *   range.
> > + * @return Valid domain ID in case of successful allocation,
> > + *         DOMID_INVALID - otherwise.
> > + */
> > +domid_t domid_alloc(domid_t domid)
> > +{
> > +    static domid_t domid_last;
> > +
> > +    spin_lock(&domid_lock);
> > +
> > +    /* Exact match. */
> > +    if ( domid < DOMID_FIRST_RESERVED )
> > +    {
> > +        if ( __test_and_set_bit(domid, domid_bitmap) )
> > +            domid =3D DOMID_INVALID;
> > +    }
> > +    /*
> > +     * Exhaustive search.
> > +     *
> > +     * Domain ID#0 is reserved for the first boot domain (e.g. control=
 domain)
> > +     * and excluded from allocation.
> > +     */
> > +    else
> > +    {
> > +        domid_t num =3D DOMID_FIRST_RESERVED;
> > +
> > +        domid =3D find_next_zero_bit(domid_bitmap, num, domid_last + 1=
);
> > +        if ( domid =3D=3D num && domid_last !=3D 0 )
>=20
> I'm pretty sure I commented on this before, yet then maybe it was in the =
context
> of another patch: Using =3D=3D here isn't sufficient; it needs to be >=3D=
. See e.g.
> cpumask_next().

I've missed that one. Will fix, thank you.

>=20
> Jan


