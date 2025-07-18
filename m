Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD78B0ACA0
	for <lists+xen-devel@lfdr.de>; Sat, 19 Jul 2025 01:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1049374.1419277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucumN-00086m-TF; Fri, 18 Jul 2025 23:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1049374.1419277; Fri, 18 Jul 2025 23:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucumN-00084q-QR; Fri, 18 Jul 2025 23:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1049374;
 Fri, 18 Jul 2025 23:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nesZ=Z7=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ucumN-00084f-2L
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 23:46:15 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d8e7b0f-6431-11f0-a31b-13f23c93f187;
 Sat, 19 Jul 2025 01:46:03 +0200 (CEST)
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
X-Inumbo-ID: 5d8e7b0f-6431-11f0-a31b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752882362; x=1753141562;
	bh=EXAjom+lDZxeoEmuK1JzOpMkochSmBz44hbSD4kAfww=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SNcyJoIvq32mia9j4ObZd6rVr/+EsFigBZyWKSs1oLPQArwEHX1aOmja45hLK1l+v
	 r3lm2qyLpb5lZ28IAdoSHy/XSQYVfPTrhGx2PQYa4BaRLsi8wkVpY54i68EMg6nVne
	 MQ17o63IkBzIuR5cI0Kufj/xrheUgJd95P0mnWv5S3hejhbJqxrrrhnh/FMDJgFiV/
	 oFe06cdvpm/wEOkRgJ6ySHUjA1WLRTOoOACETFZI1vQDK+YC7wPpkse3AFhvUtzeQ2
	 IQKLqwr8IuVNMRvt+goPbmLKo0cVSOOKGD5nEFq+qjs558uukngESohvMvJzcJeX3n
	 ej1f4+elb9JlA==
Date: Fri, 18 Jul 2025 23:45:57 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v8] xen/console: introduce domain_console struct
Message-ID: <aHrckaPuf8S6VK8n@kraken>
In-Reply-To: <DBF4R1PG1FZP.13QERUGFTBZY0@amd.com>
References: <20250716020447.1029992-1-dmukhin@ford.com> <DBF4R1PG1FZP.13QERUGFTBZY0@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e91ec88e5cc38a4b8f6ee93ada8f4fce51bda52a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 01:04:56PM +0200, Alejandro Vallejo wrote:
> Hi,
>=20
> I like the new encapsulation, but I have a few questions.
>=20
> On Wed Jul 16, 2025 at 4:04 AM CEST, dmukhin wrote:
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
> > Bump the domain console buffer allocation size to 256. No extra symbol =
for the
> > value since it is used only once during data structure declaration. All=
 size
> > checks use ARRAY_SIZE().
> >
> > Allocate domain_console from the heap so that the parent domain struct =
size
> > stays below PAGE_SIZE boundary to account for more console-related fiel=
ds
> > added in the future.
> >
> > Finally, update the domain_console allocation and initialization code.
> >
> > No functional change.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v7:
> > - use ARRAY_SIZE() for cons->buf checks
> > - update the commit message
> > ---
> >  xen/arch/arm/vpl011.c      |  2 +-
> >  xen/arch/x86/hvm/hvm.c     | 18 ++++++++++--------
> >  xen/arch/x86/pv/shim.c     |  2 +-
> >  xen/common/domain.c        | 19 +++++++++----------
> >  xen/drivers/char/console.c | 21 +++++++++++----------
> >  xen/include/xen/sched.h    | 22 ++++++++++++----------
> >  6 files changed, 44 insertions(+), 40 deletions(-)
> >
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index 480fc664fc62..d0d17c76b72c 100644
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
> > index 56c7de39778b..684d2c0c195c 100644
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
> > @@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
> >      if ( !is_console_printable(c) )
> >          return X86EMUL_OKAY;
> >
> > -    spin_lock(&cd->pbuf_lock);
> > +    spin_lock(&cons->lock);
> > +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
> >      if ( c !=3D '\n' )
> > -        cd->pbuf[cd->pbuf_idx++] =3D c;
> > -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n=
') )
> > +        cons->buf[cons->idx++] =3D c;
> > +    if ( (cons->idx =3D=3D (ARRAY_SIZE(cons->buf) - 1)) || (c =3D=3D '=
\n') )
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
>=20
> XVFREE() to avoid a dangling pointer. But look at the end. I'd just remov=
e the
> pointer altogether.
>=20
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
> > index ba5a809a99fb..b0d50a910e27 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -521,7 +521,7 @@ struct domain *console_get_domain(void)
> >      if ( !d )
> >          return NULL;
> >
> > -    if ( d->console.input_allowed )
> > +    if ( d->console->input_allowed )
> >          return d;
> >
> >      rcu_unlock_domain(d);
> > @@ -564,7 +564,7 @@ static void console_switch_input(void)
> >          {
> >              rcu_unlock_domain(d);
> >
> > -            if ( !d->console.input_allowed )
> > +            if ( !d->console->input_allowed )
> >                  continue;
> >
> >              console_rx =3D next_rx;
> > @@ -744,6 +744,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PA=
RAM(char) buffer,
> >          else
> >          {
> >              char *kin =3D kbuf, *kout =3D kbuf, c;
> > +            struct domain_console *cons =3D cd->console;
> >
> >              /* Strip non-printable characters */
> >              do
> > @@ -756,22 +757,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_=
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
> > +                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) -=
 1)) )
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
> > index fe53d4fab7ba..f7bb44328bbc 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -371,6 +371,17 @@ struct evtchn_port_ops;
> >
> >  #define MAX_NR_IOREQ_SERVERS 8
> >
> > +/* Domain console settings. */
> > +struct domain_console {
> > +    /* Permission to take ownership of the physical console input. */
> > +    bool input_allowed;
> > +
> > +    /* hvm_print_line() and guest_console_write() logging. */
> > +    unsigned int idx;
> > +    spinlock_t lock;
> > +    char buf[256];
>=20
> I'd rather see things a bit shuffled. Like:
>=20
>       /* hvm_print_line() and guest_console_write() logging. */
>       spinlock_t lock;
>       unsigned int idx;
>       char buf[255];
>=20
>       /* Permission to take ownership of the physical console input. */
>       bool input_allowed;
>=20
> That way the struct is fully packed (note the s/256/255/) and input_allow=
ed
> remains visually away from the other group of fields.
> input_allowed remains away from the lock, indicating that input_allowed
>=20
> Note that the lock is 64bit aligned when CONFIG_DEBUG_LOCK_PROFILE is set=
.
>=20
> Thoughts?

I can do that, no problem!

>=20
> > +};
> > +
> >  struct domain
> >  {
> >      domid_t          domain_id;
> > @@ -562,12 +573,6 @@ struct domain
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
> > @@ -653,10 +658,7 @@ struct domain
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
> Why a pointer? domain_console is a fixed-size type, so unless the domain =
is
> overflowing PAGE_SIZE (which we very definitely don't want either) I'd co=
nsider
> making it a regular member Simplifies memory management too. No alloc/fre=
e nor
> potential dangling pointers.

domain_console may grow in the future wrt console focus and further vUART
management changes, that's why I moved the entire stuct to be heap-allocate=
d.

Let me redo that.

>=20
> Do check how big struct domain is, though.

struct domain is 2432 bytes (64 bit, x86, default config, SHA 6efafbf13351)=
.=20

>=20
> >  } __aligned(PAGE_SIZE);
> >
> >  static inline struct page_list_head *page_to_list(
>=20
> Cheers,
> Alejandro
>=20


