Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A486AFDC81
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 02:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037551.1410166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIv3-0007Ad-Ed; Wed, 09 Jul 2025 00:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037551.1410166; Wed, 09 Jul 2025 00:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIv3-00079C-C2; Wed, 09 Jul 2025 00:44:17 +0000
Received: by outflank-mailman (input) for mailman id 1037551;
 Wed, 09 Jul 2025 00:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YmHR=ZW=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZIv2-000796-3P
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 00:44:16 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e44888-5c5d-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 02:44:12 +0200 (CEST)
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
X-Inumbo-ID: d4e44888-5c5d-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752021851; x=1752281051;
	bh=tl2mQ6QoMn0yhrWnJPWvuQZB84BU/n99GjTzpJLXUxE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H2l5Xgk7IRtsuE6s2s6UhjAnrHr6XA1jzFI8hZ5e156rC1JIRp0dc5PRQwlCGzOJA
	 O7+iI/p7qeELtO2n76Hn/GaD2b9x4kHqPJYAIpNjqJYcqWL8Z9HWnc1k+YngqdHAHm
	 DBU9CsP5YqGGOmTabyCge4JKSa3dHeiqbgWOh+n0FEwE4/O54Ao2+JhPCdltD2bKjQ
	 YahSLxSAmPsGH6GlxoIZghODa9Vd7o5Lq0rKXZfHc4n2cHlTKwBHjNa/3ELXf/ITDA
	 LDXb1GiDvPkhsO+IAM+6LrNhvukD6ilxWcyxNx27weLBHPYKj8M5OP2uJo0QH2fU7M
	 lHsCBmQVA7J2Q==
Date: Wed, 09 Jul 2025 00:44:06 +0000
To: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
From: dmkhn@proton.me
Subject: Re: [PATCH v5] xen/console: introduce domain_console struct
Message-ID: <aG27Uas97Mwo+l2t@kraken>
In-Reply-To: <20250625002956.408945-1-dmukhin@ford.com>
References: <20250625002956.408945-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b62d277bd11bf7a930342e649148fcf466da8720
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:30:03AM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>=20
>=20
> Introduce domain_console for grouping data structures used for integratin=
g
> domain's diagnostic console with Xen's console driver.
>=20
> Group all pbuf-related data structures under domain_console. Rename the m=
oved
> fields to plain .buf, .idx and .lock names, since all uses of the fields =
are
> touched.
>=20
> Bump the domain console buffer size to the closest power of 2 (256) and
> rename the symbol to DOMAIN_CONSOLE_BUF_SIZE.
>=20
> Finally, update the domain_console allocation and initialization code.
>=20
> No functional change.
>=20
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Can I ask for review?

> ---
> Changes since v4:
> - use xvfree() in _domain_destroy()
>=20
> Link to v4: https://lore.kernel.org/r/20250623202030.208655-1-dmukhin@for=
d.com
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1887593=
859
> ---
>  xen/arch/arm/vpl011.c      |  2 +-
>  xen/arch/x86/hvm/hvm.c     | 17 +++++++++--------
>  xen/arch/x86/pv/shim.c     |  2 +-
>  xen/common/domain.c        | 19 +++++++++----------
>  xen/drivers/char/console.c | 21 +++++++++++----------
>  xen/include/xen/sched.h    | 30 ++++++++++++++++++++----------
>  6 files changed, 51 insertions(+), 40 deletions(-)
>=20
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 2b6f2a09bca6..f4a840da10c5 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl01=
1_init_info *info)
>      }
>      else
>      {
> -        d->console.input_allowed =3D true;
> +        d->console->input_allowed =3D true;
>          vpl011->backend_in_domain =3D false;
> =20
>          vpl011->backend.xen =3D xzalloc(struct vpl011_xen_backend);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 056360d5fe50..7d599eab73f2 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
>  static int cf_check hvm_print_line(
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>  {
> -    struct domain *cd =3D current->domain;
> +    const struct domain *d =3D current->domain;
> +    struct domain_console *cons =3D d->console;
>      char c =3D *val;
> =20
>      ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
> @@ -571,16 +572,16 @@ static int cf_check hvm_print_line(
>      if ( !is_console_printable(c) )
>          return X86EMUL_OKAY;
> =20
> -    spin_lock(&cd->pbuf_lock);
> +    spin_lock(&cons->lock);
>      if ( c !=3D '\n' )
> -        cd->pbuf[cd->pbuf_idx++] =3D c;
> -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n')=
 )
> +        cons->buf[cons->idx++] =3D c;
> +    if ( (cons->idx =3D=3D (DOMAIN_CONSOLE_BUF_SIZE - 1)) || (c =3D=3D '=
\n') )
>      {
> -        cd->pbuf[cd->pbuf_idx] =3D '\0';
> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> -        cd->pbuf_idx =3D 0;
> +        cons->buf[cons->idx] =3D '\0';
> +        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
> +        cons->idx =3D 0;
>      }
> -    spin_unlock(&cd->pbuf_lock);
> +    spin_unlock(&cons->lock);
> =20
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> index bc2a7dd5fae5..bd29c53a2d34 100644
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pg=
entry_t *l4start,
>       */
>      d->max_pages =3D domain_tot_pages(d);
> =20
> -    d->console.input_allowed =3D true;
> +    d->console->input_allowed =3D true;
>  }
> =20
>  static void write_start_info(struct domain *d)
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 303c338ef293..caef4cc8d649 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>      BUG_ON(!d->is_dying);
>      BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
> =20
> -    xfree(d->pbuf);
> +    xvfree(d->console);
> =20
>      argo_destroy(d);
> =20
> @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
>          flags |=3D CDF_hardware;
>          if ( old_hwdom )
>              old_hwdom->cdf &=3D ~CDF_hardware;
> -
> -        d->console.input_allowed =3D true;
>      }
> =20
>      /* Holding CDF_* internal flags. */
> @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
>      spin_lock_init(&d->shutdown_lock);
>      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> =20
> -    spin_lock_init(&d->pbuf_lock);
> -
>      rwlock_init(&d->vnuma_rwlock);
> =20
>  #ifdef CONFIG_HAS_PCI
> @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
> =20
>      /* All error paths can depend on the above setup. */
> =20
> +    err =3D -ENOMEM;
> +    d->console =3D xvzalloc(typeof(*d->console));
> +    if ( !d->console )
> +        goto fail;
> +
> +    spin_lock_init(&d->console->lock);
> +    d->console->input_allowed =3D is_hardware_domain(d);
> +
>      /*
>       * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-dom=
ain
>       * resources want to be sized based on max_vcpus.
> @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
>      if ( (err =3D argo_init(d)) !=3D 0 )
>          goto fail;
> =20
> -    err =3D -ENOMEM;
> -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> -    if ( !d->pbuf )
> -        goto fail;
> -
>      if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
>          goto fail;
> =20
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 5d3681b16aee..a894dc6dc3b2 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -524,7 +524,7 @@ struct domain *console_get_domain(void)
>      if ( !d )
>          return NULL;
> =20
> -    if ( d->console.input_allowed )
> +    if ( d->console->input_allowed )
>          return d;
> =20
>      rcu_unlock_domain(d);
> @@ -567,7 +567,7 @@ static void console_switch_input(void)
>          {
>              rcu_unlock_domain(d);
> =20
> -            if ( !d->console.input_allowed )
> +            if ( !d->console->input_allowed )
>                  continue;
> =20
>              console_rx =3D next_rx;
> @@ -757,6 +757,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARA=
M(char) buffer,
>          else
>          {
>              char *kin =3D kbuf, *kout =3D kbuf, c;
> +            struct domain_console *cons =3D cd->console;
> =20
>              /* Strip non-printable characters */
>              do
> @@ -769,22 +770,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PA=
RAM(char) buffer,
>              } while ( --kcount > 0 );
> =20
>              *kout =3D '\0';
> -            spin_lock(&cd->pbuf_lock);
> +            spin_lock(&cons->lock);
>              kcount =3D kin - kbuf;
>              if ( c !=3D '\n' &&
> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1))=
 )
> +                 (cons->idx + (kout - kbuf) < (DOMAIN_CONSOLE_BUF_SIZE -=
 1)) )
>              {
>                  /* buffer the output until a newline */
> -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> -                cd->pbuf_idx +=3D (kout - kbuf);
> +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> +                cons->idx +=3D kout - kbuf;
>              }
>              else
>              {
> -                cd->pbuf[cd->pbuf_idx] =3D '\0';
> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf=
);
> -                cd->pbuf_idx =3D 0;
> +                cons->buf[cons->idx] =3D '\0';
> +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbu=
f);
> +                cons->idx =3D 0;
>              }
> -            spin_unlock(&cd->pbuf_lock);
> +            spin_unlock(&cons->lock);
>          }
> =20
>          guest_handle_add_offset(buffer, kcount);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fe53d4fab7ba..3c74dc71fe5e 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -371,6 +371,25 @@ struct evtchn_port_ops;
> =20
>  #define MAX_NR_IOREQ_SERVERS 8
> =20
> +/*
> + * Arbitrary value.
> + * The buffer is part of the dynamically-allocated data structure, using=
 an
> + * even multiple of a cache line size may help to optimize the allocatio=
n
> + * overhead.
> + */
> +#define DOMAIN_CONSOLE_BUF_SIZE 256
> +
> +/* Domain console settings. */
> +struct domain_console {
> +    /* Permission to take ownership of the physical console input. */
> +    bool input_allowed;
> +
> +    /* hvm_print_line() and guest_console_write() logging. */
> +    spinlock_t lock;
> +    unsigned int idx;
> +    char buf[DOMAIN_CONSOLE_BUF_SIZE];
> +};
> +
>  struct domain
>  {
>      domid_t          domain_id;
> @@ -562,12 +581,6 @@ struct domain
>      /* Control-plane tools handle for this domain. */
>      xen_domain_handle_t handle;
> =20
> -    /* hvm_print_line() and guest_console_write() logging. */
> -#define DOMAIN_PBUF_SIZE 200
> -    char       *pbuf;
> -    unsigned int pbuf_idx;
> -    spinlock_t  pbuf_lock;
> -
>      /* OProfile support. */
>      struct xenoprof *xenoprof;
> =20
> @@ -653,10 +666,7 @@ struct domain
>  #endif
> =20
>      /* Console settings. */
> -    struct {
> -        /* Permission to take ownership of the physical console input. *=
/
> -        bool input_allowed;
> -    } console;
> +    struct domain_console *console;
>  } __aligned(PAGE_SIZE);
> =20
>  static inline struct page_list_head *page_to_list(
> --=20
> 2.34.1
>=20


