Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88AB0243F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 21:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041460.1412257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaJ3Z-0001nP-7e; Fri, 11 Jul 2025 19:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041460.1412257; Fri, 11 Jul 2025 19:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaJ3Z-0001lK-4E; Fri, 11 Jul 2025 19:05:13 +0000
Received: by outflank-mailman (input) for mailman id 1041460;
 Fri, 11 Jul 2025 19:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qtn+=ZY=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uaJ3W-0001lE-Sz
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 19:05:12 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f450e072-5e89-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 21:05:05 +0200 (CEST)
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
X-Inumbo-ID: f450e072-5e89-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752260703; x=1752519903;
	bh=c8tRDjYYdpmEef284QOcHnjnpQn0Tf5DyiOZlR+GJnU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RHYrvTvulOPT0sMDjbsUNO0g8TivVtTUeeOQ85HNx0vY/UJwhoY4G5rbhh2eKuifr
	 QHOuw2L8g1K6cAVDftMmo+wa6b+8qQCpEZ33ysRrLn+uBkSYsl4fbqFzkGmGuj/CXv
	 OZcnJLYy3TzKyzSp+yDEHBTBwhAf0p2c2baEQnj9LOh6uizCt89Ou2aJFDYxpE/pn3
	 fXG95jmrLAW1TiA2ttuNYkjFzhffJrP6AVtpZ29I/2tfj4K79WEIQtX4zssVfL5FeT
	 uu6+Nme1zHu1U8jIVZgm9VXGJfcxBE+fsIQTDP+jFQvxtP2VF6PCDVy+Uc3Twrs8hr
	 jSOr4473y5+Dg==
Date: Fri, 11 Jul 2025 19:04:59 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v7] xen/console: introduce domain_console struct
Message-ID: <aHFgVsxsVLKM1tE2@kraken>
In-Reply-To: <aHDtU-9NOCb7UmSl@macbook.local>
References: <20250711004003.23920-1-dmukhin@ford.com> <aHDtU-9NOCb7UmSl@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dc69e8186c367fe207683633a5a33836c65f3157
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 12:54:11PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jul 11, 2025 at 12:40:11AM +0000, dmkhn@proton.me wrote:
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
> > Bump the domain console buffer allocation size to 256.
> >
> > Rename domain console buffer size symbol to DOMAIN_CONSOLE_BUF_SIZE.
> >
> > Finally, update the domain_console allocation and initialization code.
> >
> > No functional change.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v6:
> > - reverted allocation of domain_console as in v5
> > - dropped the commentary for DOMAIN_CONSOLE_BUF_SIZE
> >
> > Link to v6: https://lore.kernel.org/xen-devel/20250710013421.2321353-1-=
dmukhin@ford.com/
> > CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/19194=
73093
> > ---
> >  xen/arch/arm/vpl011.c      |  2 +-
> >  xen/arch/x86/hvm/hvm.c     | 17 +++++++++--------
> >  xen/arch/x86/pv/shim.c     |  2 +-
> >  xen/common/domain.c        | 19 +++++++++----------
> >  xen/drivers/char/console.c | 21 +++++++++++----------
> >  xen/include/xen/sched.h    | 24 ++++++++++++++----------
> >  6 files changed, 45 insertions(+), 40 deletions(-)
> >
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index 2b6f2a09bca6..f4a840da10c5 100644
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl=
011_init_info *info)
> >      }
> >      else
> >      {
> > -        d->console.input_allowed =3D true;
> > +        d->console->input_allowed =3D true;
> >          vpl011->backend_in_domain =3D false;
> >
> >          vpl011->backend.xen =3D xzalloc(struct vpl011_xen_backend);
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 56c7de39778b..2be98f6ccbd1 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
> >  static int cf_check hvm_print_line(
> >      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> >  {
> > -    struct domain *cd =3D current->domain;
> > +    const struct domain *d =3D current->domain;
> > +    struct domain_console *cons =3D d->console;
> >      char c =3D *val;
> >
> >      ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
> > @@ -571,16 +572,16 @@ static int cf_check hvm_print_line(
> >      if ( !is_console_printable(c) )
> >          return X86EMUL_OKAY;
> >
> > -    spin_lock(&cd->pbuf_lock);
> > +    spin_lock(&cons->lock);
> >      if ( c !=3D '\n' )
> > -        cd->pbuf[cd->pbuf_idx++] =3D c;
> > -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n=
') )
> > +        cons->buf[cons->idx++] =3D c;
> > +    if ( (cons->idx =3D=3D (DOMAIN_CONSOLE_BUF_SIZE - 1)) || (c =3D=3D=
 '\n') )
> >      {
> > -        cd->pbuf[cd->pbuf_idx] =3D '\0';
> > -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> > -        cd->pbuf_idx =3D 0;
> > +        cons->buf[cons->idx] =3D '\0';
> > +        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
> > +        cons->idx =3D 0;
> >      }
> > -    spin_unlock(&cd->pbuf_lock);
> > +    spin_unlock(&cons->lock);
> >
> >      return X86EMUL_OKAY;
> >  }
> > diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> > index bc2a7dd5fae5..bd29c53a2d34 100644
> > --- a/xen/arch/x86/pv/shim.c
> > +++ b/xen/arch/x86/pv/shim.c
> > @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_=
pgentry_t *l4start,
> >       */
> >      d->max_pages =3D domain_tot_pages(d);
> >
> > -    d->console.input_allowed =3D true;
> > +    d->console->input_allowed =3D true;
> >  }
> >
> >  static void write_start_info(struct domain *d)
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 303c338ef293..caef4cc8d649 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
> >      BUG_ON(!d->is_dying);
> >      BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
> >
> > -    xfree(d->pbuf);
> > +    xvfree(d->console);
> >
> >      argo_destroy(d);
> >
> > @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
> >          flags |=3D CDF_hardware;
> >          if ( old_hwdom )
> >              old_hwdom->cdf &=3D ~CDF_hardware;
> > -
> > -        d->console.input_allowed =3D true;
> >      }
> >
> >      /* Holding CDF_* internal flags. */
> > @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
> >      spin_lock_init(&d->shutdown_lock);
> >      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> >
> > -    spin_lock_init(&d->pbuf_lock);
> > -
> >      rwlock_init(&d->vnuma_rwlock);
> >
> >  #ifdef CONFIG_HAS_PCI
> > @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
> >
> >      /* All error paths can depend on the above setup. */
> >
> > +    err =3D -ENOMEM;
> > +    d->console =3D xvzalloc(typeof(*d->console));
> > +    if ( !d->console )
> > +        goto fail;
> > +
> > +    spin_lock_init(&d->console->lock);
> > +    d->console->input_allowed =3D is_hardware_domain(d);
> > +
> >      /*
> >       * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-d=
omain
> >       * resources want to be sized based on max_vcpus.
> > @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
> >      if ( (err =3D argo_init(d)) !=3D 0 )
> >          goto fail;
> >
> > -    err =3D -ENOMEM;
> > -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> > -    if ( !d->pbuf )
> > -        goto fail;
> > -
> >      if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
> >          goto fail;
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index f54632bc0811..469f5e8832da 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -526,7 +526,7 @@ struct domain *console_get_domain(void)
> >      if ( !d )
> >          return NULL;
> >
> > -    if ( d->console.input_allowed )
> > +    if ( d->console->input_allowed )
> >          return d;
> >
> >      rcu_unlock_domain(d);
> > @@ -569,7 +569,7 @@ static void console_switch_input(void)
> >          {
> >              rcu_unlock_domain(d);
> >
> > -            if ( !d->console.input_allowed )
> > +            if ( !d->console->input_allowed )
> >                  continue;
> >
> >              console_rx =3D next_rx;
> > @@ -788,6 +788,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PA=
RAM(char) buffer,
> >          else
> >          {
> >              char *kin =3D kbuf, *kout =3D kbuf, c;
> > +            struct domain_console *cons =3D cd->console;
> >
> >              /* Strip non-printable characters */
> >              do
> > @@ -800,22 +801,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_=
PARAM(char) buffer,
> >              } while ( --kcount > 0 );
> >
> >              *kout =3D '\0';
> > -            spin_lock(&cd->pbuf_lock);
> > +            spin_lock(&cons->lock);
> >              kcount =3D kin - kbuf;
> >              if ( c !=3D '\n' &&
> > -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1=
)) )
> > +                 (cons->idx + (kout - kbuf) < (DOMAIN_CONSOLE_BUF_SIZE=
 - 1)) )
> >              {
> >                  /* buffer the output until a newline */
> > -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> > -                cd->pbuf_idx +=3D (kout - kbuf);
> > +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> > +                cons->idx +=3D kout - kbuf;
> >              }
> >              else
> >              {
> > -                cd->pbuf[cd->pbuf_idx] =3D '\0';
> > -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kb=
uf);
> > -                cd->pbuf_idx =3D 0;
> > +                cons->buf[cons->idx] =3D '\0';
> > +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, k=
buf);
> > +                cons->idx =3D 0;
> >              }
> > -            spin_unlock(&cd->pbuf_lock);
> > +            spin_unlock(&cons->lock);
> >          }
> >
> >          guest_handle_add_offset(buffer, kcount);
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index fe53d4fab7ba..8771b7f22b48 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -371,6 +371,19 @@ struct evtchn_port_ops;
> >
> >  #define MAX_NR_IOREQ_SERVERS 8
> >
> > +#define DOMAIN_CONSOLE_BUF_SIZE (256)
> > +
> > +/* Domain console settings. */
> > +struct domain_console {
> > +    /* Permission to take ownership of the physical console input. */
> > +    bool input_allowed;
> > +
> > +    /* hvm_print_line() and guest_console_write() logging. */
> > +    unsigned int idx;
> > +    spinlock_t lock;
> > +    char buf[DOMAIN_CONSOLE_BUF_SIZE];
> > +};
> > +
> >  struct domain
> >  {
> >      domid_t          domain_id;
> > @@ -562,12 +575,6 @@ struct domain
> >      /* Control-plane tools handle for this domain. */
> >      xen_domain_handle_t handle;
> >
> > -    /* hvm_print_line() and guest_console_write() logging. */
> > -#define DOMAIN_PBUF_SIZE 200
> > -    char       *pbuf;
> > -    unsigned int pbuf_idx;
> > -    spinlock_t  pbuf_lock;
> > -
> >      /* OProfile support. */
> >      struct xenoprof *xenoprof;
> >
> > @@ -653,10 +660,7 @@ struct domain
> >  #endif
> >
> >      /* Console settings. */
> > -    struct {
> > -        /* Permission to take ownership of the physical console input.=
 */
> > -        bool input_allowed;
> > -    } console;
> > +    struct domain_console *console;
>=20
> I assume I'm missing some context, what's the reason for converting
> this field into a pointer, instead of moving the existing fields
> inside and allocate the buffer at domain_create()?

The reason is avoid crossing PAGE_SIZE boundary for domain structure *if* m=
ore
console-related fields are added to the "domain console settings" (which wi=
ll
happen for console focus management and probably for vUARTs).

>=20
> Does having the buf field size known by the compiler allows for extra
> safety checks?
>=20
> I think if you make it that way you might want to change usages of
> DOMAIN_CONSOLE_BUF_SIZE in the code to instead use ARRAY_SIZE() of the
> field.

Ack.

>=20
> Thanks, Roger.


