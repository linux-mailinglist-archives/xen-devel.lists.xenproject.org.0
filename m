Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E2BAD0A2A
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 01:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008963.1388094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNg9X-0000LX-2Z; Fri, 06 Jun 2025 23:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008963.1388094; Fri, 06 Jun 2025 23:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNg9W-0000JQ-Sq; Fri, 06 Jun 2025 23:07:10 +0000
Received: by outflank-mailman (input) for mailman id 1008963;
 Fri, 06 Jun 2025 23:07:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNg9U-0000JK-73
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 23:07:09 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6b16186-432a-11f0-b894-0df219b8e170;
 Sat, 07 Jun 2025 01:07:05 +0200 (CEST)
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
X-Inumbo-ID: f6b16186-432a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749251224; x=1749510424;
	bh=qbaqTN/mef++TeA9JmNKxIFqEwBNLbAgRNs6naITzf0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Y5RZ1nVoSUlHhYsCSs0lFQ1GF/dJ99RjG19Y0SRlFYcRiEz1eFlxSnx0Z+cpyORV3
	 UYQZ5c4+VG/Gv+ucF3qIbeeTvKw1jKVRoaSSSKMsjT4XkIvwpbmZ4vr3AvQU8yPDEJ
	 quzPFWFJwaLKSa4HM9VETXS3jC6tqJnFT4Wi5SgYQx+YfQCOucP/yNTYicjsNIwrcY
	 qbrCqzliHJ/bWiNkwpOtm9Sq6H/ViBJ7zVgzqwxChydqC85ZYdnfTmj2w4Tdh/i1Ut
	 xep/2Wp4R9oGXZLMuD4FgP1PzzAAG+sW6c4gu3fschWS9tk0eT2PY8LiLDyL68RwkJ
	 xQmvz87VTjfaQ==
Date: Fri, 06 Jun 2025 23:06:57 +0000
To: Teddy Astie <teddy.astie@vates.tech>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1] xen/console: group pbuf under console field
Message-ID: <aEN0i6tD3humMN3a@kraken>
In-Reply-To: <00ffcc4b-b63e-4b4d-8b8f-8d02fb7ef234@vates.tech>
References: <20250606194937.2412579-1-dmukhin@ford.com> <00ffcc4b-b63e-4b4d-8b8f-8d02fb7ef234@vates.tech>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 36aa3f7d241158689357caf906bfc4bce5689522
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 08:24:44PM +0000, Teddy Astie wrote:
> Hello,
>=20
> Le 06/06/2025 =C3=A0 21:51, dmkhn@proton.me a =C3=A9crit=C2=A0:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Group all pbuf-related data structures under domain's console field.
> >
> > No functional change.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >   xen/arch/x86/hvm/hvm.c     | 14 +++++++-------
> >   xen/common/domain.c        |  8 ++++----
> >   xen/drivers/char/console.c | 19 +++++++++++--------
> >   xen/include/xen/sched.h    | 12 ++++++------
> >   4 files changed, 28 insertions(+), 25 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 4cb2e13046..17d1fd42ce 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -571,16 +571,16 @@ static int cf_check hvm_print_line(
> >       if ( !is_console_printable(c) )
> >           return X86EMUL_OKAY;
> >
> > -    spin_lock(&cd->pbuf_lock);
> > +    spin_lock(&cd->console.pbuf_lock);
> >       if ( c !=3D '\n' )
> > -        cd->pbuf[cd->pbuf_idx++] =3D c;
> > -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n=
') )
> > +        cd->console.pbuf[cd->console.pbuf_idx++] =3D c;
> > +    if ( (cd->console.pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =
=3D=3D '\n') )
> >       {
> > -        cd->pbuf[cd->pbuf_idx] =3D '\0';
> > -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> > -        cd->pbuf_idx =3D 0;
> > +        cd->console.pbuf[cd->console.pbuf_idx] =3D '\0';
> > +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->console.pbuf);
> > +        cd->console.pbuf_idx =3D 0;
> >       }
> > -    spin_unlock(&cd->pbuf_lock);
> > +    spin_unlock(&cd->console.pbuf_lock);
> >
> >       return X86EMUL_OKAY;
> >   }
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 153cd75340..dd1867b2fe 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
> >       BUG_ON(!d->is_dying);
> >       BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
> >
> > -    xfree(d->pbuf);
> > +    xfree(d->console.pbuf);
> >
> >       argo_destroy(d);
> >
> > @@ -862,7 +862,7 @@ struct domain *domain_create(domid_t domid,
> >       spin_lock_init(&d->shutdown_lock);
> >       d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> >
> > -    spin_lock_init(&d->pbuf_lock);
> > +    spin_lock_init(&d->console.pbuf_lock);
> >
> >       rwlock_init(&d->vnuma_rwlock);
> >
> > @@ -956,8 +956,8 @@ struct domain *domain_create(domid_t domid,
> >           goto fail;
> >
> >       err =3D -ENOMEM;
> > -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> > -    if ( !d->pbuf )
> > +    d->console.pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> > +    if ( !d->console.pbuf )
> >           goto fail;
> >
> >       if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 616f4968b0..3855962af7 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -769,22 +769,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_=
PARAM(char) buffer,
> >               } while ( --kcount > 0 );
> >
> >               *kout =3D '\0';
> > -            spin_lock(&cd->pbuf_lock);
> > +            spin_lock(&cd->console.pbuf_lock);
> >               kcount =3D kin - kbuf;
> >               if ( c !=3D '\n' &&
> > -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1=
)) )
> > +                 cd->console.pbuf_idx + kout - kbuf < DOMAIN_PBUF_SIZE=
 - 1 )
>=20
> I don't think we want to drop the parentheses here.

The line will will exceed 80 chars if I keep parentheses.

Will something like the following work:

-                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
+                 (cd->console.pbuf_idx + (kout - kbuf) <
+                    (DOMAIN_PBUF_SIZE - 1)) )

?

>=20
> >               {
> >                   /* buffer the output until a newline */
> > -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> > -                cd->pbuf_idx +=3D (kout - kbuf);
> > +                memcpy(cd->console.pbuf + cd->console.pbuf_idx,
> > +                       kbuf,
> > +                       kout - kbuf);
> > +                cd->console.pbuf_idx +=3D (kout - kbuf);
> >               }
> >               else
> >               {
> > -                cd->pbuf[cd->pbuf_idx] =3D '\0';
> > -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kb=
uf);
> > -                cd->pbuf_idx =3D 0;
> > +                cd->console.pbuf[cd->console.pbuf_idx] =3D '\0';
> > +                guest_printk(cd,
> > +                             XENLOG_G_DEBUG "%s%s\n", cd->console.pbuf=
, kbuf);
> > +                cd->console.pbuf_idx =3D 0;
> >               }
> > -            spin_unlock(&cd->pbuf_lock);
> > +            spin_unlock(&cd->console.pbuf_lock);
> >           }
> >
> >           guest_handle_add_offset(buffer, kcount);
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index fe53d4fab7..637aa09ec4 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -562,12 +562,6 @@ struct domain
> >       /* Control-plane tools handle for this domain. */
> >       xen_domain_handle_t handle;
> >
> > -    /* hvm_print_line() and guest_console_write() logging. */
> > -#define DOMAIN_PBUF_SIZE 200
> > -    char       *pbuf;
> > -    unsigned int pbuf_idx;
> > -    spinlock_t  pbuf_lock;
> > -
> >       /* OProfile support. */
> >       struct xenoprof *xenoprof;
> >
> > @@ -654,6 +648,12 @@ struct domain
> >
> >       /* Console settings. */
> >       struct {
> > +        /* hvm_print_line() and guest_console_write() logging. */
> > +#define DOMAIN_PBUF_SIZE 200
> > +        char *pbuf;
> > +        unsigned int pbuf_idx;
> > +        spinlock_t pbuf_lock;
> > +
> >           /* Permission to take ownership of the physical console input=
. */
> >           bool input_allowed;
> >       } console;
>=20
>=20
> Teddy Astie | Vates XCP-ng Developer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>=20
>=20


