Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CEADDBFA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 21:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018475.1395371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRbaM-0003I9-Ih; Tue, 17 Jun 2025 19:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018475.1395371; Tue, 17 Jun 2025 19:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRbaM-0003F2-EJ; Tue, 17 Jun 2025 19:03:06 +0000
Received: by outflank-mailman (input) for mailman id 1018475;
 Tue, 17 Jun 2025 19:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Ip9=ZA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uRbaK-0003Ew-LR
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 19:03:04 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b196e198-4bad-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 21:03:03 +0200 (CEST)
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
X-Inumbo-ID: b196e198-4bad-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750186982; x=1750446182;
	bh=GXg+ZWBOoLacSfrxkIxkToMvDVjoH881aIfuu/mn5iU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=h0R/OZLjSa70W3wtrgrr1+c0EEAMUlkobTQOowGNVJxMw7OPSvmRZx5Cogt3P7CQZ
	 uL6nB7ZNkpW8NB44EG+Dg5qTxCQK78n15iFiWprLFiHmPitTQnkV5eVGDSEH44VUtS
	 Fp2G24aXNEc9Or+99KnA+AI4LFtTeYfq9YJ+LCimaFrVH/vEfNOaNQzJ65EmxO5gKS
	 s7oFiaFDftI6XXFXvkNRBm7mx7IuQ5fON8JwxEWjHMBQR78WRMrp7PC6H3ZflYthlE
	 N3xbppXuJ35zY5IdUIA9YqOdPZneDR92+XycsDdgxQpGVXLHMxEHEZdZO1veIp31Om
	 H9Y0XXxtjA/qA==
Date: Tue, 17 Jun 2025 19:02:57 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/console: introduce domain_console struct
Message-ID: <aFG73IuCxpFKChMx@kraken>
In-Reply-To: <1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com>
References: <20250617012713.57074-1-dmukhin@ford.com> <1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cf302f9b224c3a6337c5b5cedef78fe10828da11
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:48:10AM +0200, Jan Beulich wrote:
> On 17.06.2025 03:27, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Introduce domain_console for grouping data structures used for integrat=
ing
> > domain's diagnostic console with Xen's console driver.
> >
> > Group all pbuf-related data structures under domain_console. Rename the=
 moved
> > fields to plain .buf, .idx and .lock names, since all uses of the field=
s are
> > touched.
> >
> > Bump the domain console buffer size to the closest power of 2 (256) and
> > rename the symbol to DOMAIN_CONSOLE_BUF_SIZE.
> >
> > Move d->console->buf management under CONFIG_VERBOSE_DEBUG when the
> > HYPERCALL_console_io handler is enabled.
>=20
> This, if at all, needs to be a separate change (with its own justificatio=
n).
> I for one don't think VERBOSE_DEBUG is intended to control any kind of gu=
est
> output.
>=20
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -559,7 +559,6 @@ void hvm_do_resume(struct vcpu *v)
> >  static int cf_check hvm_print_line(
> >      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> >  {
> > -    struct domain *cd =3D current->domain;
> >      char c =3D *val;
> >
> >      ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
> > @@ -570,17 +569,24 @@ static int cf_check hvm_print_line(
> >
> >      if ( !is_console_printable(c) )
> >          return X86EMUL_OKAY;
>=20
> After this "return" ...
>=20
> > -
> > -    spin_lock(&cd->pbuf_lock);
> > -    if ( c !=3D '\n' )
> > -        cd->pbuf[cd->pbuf_idx++] =3D c;
> > -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n=
') )
> > +#ifdef CONFIG_VERBOSE_DEBUG
> > +    else
>=20
> ... there's no point to have "else" here.
>=20
> >      {
> > -        cd->pbuf[cd->pbuf_idx] =3D '\0';
> > -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> > -        cd->pbuf_idx =3D 0;
> > +        struct domain *cd =3D current->domain;
>=20
> We normally name such a variable d. It also looks as if this could be poi=
nter-
> to-const.
>=20
> > +        struct domain_console *cons =3D cd->console;
> > +
> > +        spin_lock(&cons->lock);
> > +        if ( c !=3D '\n' )
> > +            cons->buf[cons->idx++] =3D c;
> > +        if ( (cons->idx =3D=3D (DOMAIN_CONSOLE_BUF_SIZE - 1)) || (c =
=3D=3D '\n') )
> > +        {
> > +            cons->buf[cons->idx] =3D '\0';
> > +            guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
> > +            cons->idx =3D 0;
> > +        }
> > +        spin_unlock(&cons->lock);
> >      }
> > -    spin_unlock(&cd->pbuf_lock);
> > +#endif
>=20
> None of the re-indentation is really warranted here (and will likely go a=
way
> anyway once the #ifdef is dropped).
>=20
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
> >      BUG_ON(!d->is_dying);
> >      BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
> >
> > -    xfree(d->pbuf);
> > +    xfree(d->console);
> >
> >      argo_destroy(d);
> >
> > @@ -800,6 +800,11 @@ struct domain *domain_create(domid_t domid,
> >      if ( (d =3D alloc_domain_struct()) =3D=3D NULL )
> >          return ERR_PTR(-ENOMEM);
> >
> > +    err =3D -ENOMEM;
> > +    d->console =3D xvzalloc(typeof(*d->console));
> > +    if ( !d->console )
> > +        goto fail;
>=20
> This definitely need to move down some, at least ...
>=20
> >      /* Sort out our idea of is_system_domain(). */
> >      d->domain_id =3D domid;
> >      d->unique_id =3D get_unique_id();
>=20
> ... past here. There absolutely must not be struct domain instances be
> passed around (see e.g. the call to sched_destroy_domain()) without the
> domain ID set. It's hard to see ...
>=20
> > @@ -862,7 +867,9 @@ struct domain *domain_create(domid_t domid,
> >      spin_lock_init(&d->shutdown_lock);
> >      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> >
> > -    spin_lock_init(&d->pbuf_lock);
> > +#ifdef CONFIG_VERBOSE_DEBUG
> > +    spin_lock_init(&d->console->lock);
> > +#endif
>=20
> .. why here or ...
>=20
> > @@ -955,11 +962,6 @@ struct domain *domain_create(domid_t domid,
> >      if ( (err =3D argo_init(d)) !=3D 0 )
> >          goto fail;
> >
> > -    err =3D -ENOMEM;
> > -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> > -    if ( !d->pbuf )
> > -        goto fail;
>=20
> ... even here wouldn't be early enough anyway.
>=20
> And btw - where did this buffer allocation move? I don't see anywhere
> that d->console->buf would now be initialized. (However, see below.)
>=20
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -371,6 +371,22 @@ struct evtchn_port_ops;
> >
> >  #define MAX_NR_IOREQ_SERVERS 8
> >
> > +/* Arbitrary value; must be a multiple of the cacheline size. */
> > +#define DOMAIN_CONSOLE_BUF_SIZE 256
>=20
> Where does the relationship with cache line size come from? What if
> Xen was to run on hardware (whichever arch) with 512-byte cache lines?
>=20
> > +/* Domain console settings. */
> > +struct domain_console {
> > +#ifdef CONFIG_VERBOSE_DEBUG
> > +    /* hvm_print_line() and guest_console_write() logging. */
> > +    char *buf;
>=20
> To avoid the need to do yet another separate allocation, how about ...
>=20
> > +    unsigned int idx;
> > +    spinlock_t lock;
> > +#endif /* CONFIG_VERBOSE_DEBUG */
> > +
> > +    /* Permission to take ownership of the physical console input. */
> > +    bool input_allowed;
>=20
>     char buf[DOMAIN_CONSOLE_BUF_SIZE];
>=20
> Ultimately this would allow the buffer size to be e.g. command line
> controlled (if so desired), by then simply converting to a flexible
> array member.

Whoops, apologies for the bogus change.
Looks like I posted from the wrong branch.

>=20
> Jan


