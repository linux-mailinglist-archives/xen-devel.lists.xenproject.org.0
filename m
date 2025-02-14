Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19300A366A9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 21:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889032.1298272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj1y1-0002ka-Iw; Fri, 14 Feb 2025 20:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889032.1298272; Fri, 14 Feb 2025 20:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj1y1-0002ia-Fa; Fri, 14 Feb 2025 20:07:17 +0000
Received: by outflank-mailman (input) for mailman id 889032;
 Fri, 14 Feb 2025 20:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w5DB=VF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tj1y0-0002iS-Ia
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 20:07:16 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492665a8-eb0f-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 21:07:15 +0100 (CET)
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
X-Inumbo-ID: 492665a8-eb0f-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739563634; x=1739822834;
	bh=s/XDEHSzC1NWhTr/8nLQqvZ/cHg/O4dU+IHqSbSEFus=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fLs62hJIFuKv2VCz6krsuKfNWSAi+CqXNgmTJwC5qoJnBzb0t8lC1qkRIZF4Q9ieN
	 NwC7wQokt4BzZyKlsQG8xNqkYKu7CAtzNpcND/uEm1TqPtuKUcXsDfLeBzA3S4yqyU
	 zdrBi0jx5Ub/XCOIJWa23VOltsQ2liKHOjd6DsKvTM8DXIsEtlJpy1mmGYBL9cUPtS
	 mrskLsa38tgG2kV/TdXrQE0TKo212KbgCXcmVOpB/Ai/um6edi3Pd1mzo7pEwGcK0/
	 SxwHcnVbcoAZZszhmmUVZ1JtxA0Z4BHpgUsJNwH1BHrVE14ACOMcmCaVPQHSEODjko
	 Ot6McYMeq0R+A==
Date: Fri, 14 Feb 2025 20:07:09 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/console: print Xen version via keyhandler
Message-ID: <tzAUNSv_X55I4CsPnmpDvLQ09p6mK5og088aJunH0vLh1CcZ3K1WYZpRGwCVbigzsiyp8MJPSrObT6rX1fqri2d3-PToFgXSMVsbWi5PHN0=@proton.me>
In-Reply-To: <e80d6139-b918-4830-9db9-aac297446e7e@suse.com>
References: <20250213214054.1745501-1-dmukhin@ford.com> <e80d6139-b918-4830-9db9-aac297446e7e@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e06fcdcc795153ce2169c37c7bafc3908c55bead
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, February 13th, 2025 at 11:54 PM, Jan Beulich <jbeulich@suse.co=
m> wrote:

>=20
>=20
> On 13.02.2025 22:41, dmkhn@proton.me wrote:
>=20
> > Add Xen version printout to 'h' keyhandler output.
> >=20
> > That is useful for debugging systems that have been left intact for a l=
ong
> > time.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > Changes since v2:
> > - moved new function declarations to xen/lib.h
> > - dropped xen_ prefix in new functions
> > ---
> > xen/common/keyhandler.c | 4 ++++
> > xen/common/version.c | 20 ++++++++++++++++++--
> > xen/drivers/char/console.c | 8 +++-----
> > xen/include/xen/lib.h | 3 +++
> > 4 files changed, 28 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> > index 6ea54838d4..0bb842ec00 100644
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -129,6 +129,10 @@ static void cf_check show_handlers(unsigned char k=
ey)
> > unsigned int i;
> >=20
> > printk("'%c' pressed -> showing installed handlers\n", key);
> > +
> > + print_version();
> > + print_build_id();
> > +
> > for ( i =3D 0; i < ARRAY_SIZE(key_table); i++ )
> > if ( key_table[i].fn )
> > printk(" key '%c' (ascii '%02x') =3D> %s\n",
> > diff --git a/xen/common/version.c b/xen/common/version.c
> > index bc3714b45f..8672d5544e 100644
> > --- a/xen/common/version.c
> > +++ b/xen/common/version.c
> > @@ -210,9 +210,25 @@ void __init xen_build_init(void)
> > }
> > }
> > #endif /* CONFIG_X86 */
> > - if ( !rc )
> > - printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
> > }
> > +
> > +void print_version(void)
> > +{
> > + printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> > + xen_major_version(), xen_minor_version(), xen_extra_version(),
> > + xen_compile_by(), xen_compile_domain(), xen_compiler(),
> > + xen_build_info(), xen_compile_date());
> > +
> > + printk("Latest ChangeSet: %s\n", xen_changeset());
> > +}
> > +
> > +void print_build_id(void)
> > +{
> > + BUG_ON(!build_id_p);
> > + BUG_ON(!build_id_len);
>=20
>=20
> Technically one of the two would likely suffice, if we need such checks
> at all. Question is why you added them. After all ...

I added assertions so that any misuse can bee easily seen.
But I did not know about XEN_HAS_BUILD_ID switch.

>=20
> > + printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
>=20
>=20
> ... this isn't supposed to malfunction when passed a NULL pointer (with
> zero length). If it can malfunction, it wants fixing there imo. And that
> extends to the case of non-zero length as well: Any extensions to %p
> that we add would better retain the basic property of %p printing when
> NULL is passed as argument. (I'm sorry for not paying enough attention
> to this on v2 already.)

No problem! Thanks for the feedback, much appreciated.

>=20
> (Later) Oh, actually these BUG_ON() are both wrong. They would trigger
> when building with a build-id-incapable linker. See the detection logic
> in the top level Makefile (search for XEN_HAS_BUILD_ID). To retain
> original behavior you will want to make the printk() conditional upon
> e.g. build_id_len being non-zero.

Oh, I see.
%p in printk() behaves correctly when passing NULL pointer - it prints
nothing.

>=20
> Jan

