Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1338AFDBD8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 01:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037475.1410096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHj5-0001Rp-NC; Tue, 08 Jul 2025 23:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037475.1410096; Tue, 08 Jul 2025 23:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHj5-0001PF-Jj; Tue, 08 Jul 2025 23:27:51 +0000
Received: by outflank-mailman (input) for mailman id 1037475;
 Tue, 08 Jul 2025 23:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6HMe=ZV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZHj3-0001P9-JK
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 23:27:50 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28061020-5c53-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 01:27:47 +0200 (CEST)
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
X-Inumbo-ID: 28061020-5c53-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752017266; x=1752276466;
	bh=wrTphK1PVHv/AY8CTxBQfvtP4/TQU3Fef9S082i2sJM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bxIxeJvnKtw2FcheDB8DUTi/lATHCSeurE3rN0mGzU0W9Z1U2BOLYqEP8Z+c9x64Z
	 nXQhniTusZr5OQslSxIggdfCHd34K5NXcxe3x59Vnx81uATHxwjzHggu1eEzgKfRBN
	 4+zW/Dg0D5JZW6sGIbb3ENDWbzoTmHUprmGPRx4rljPBMHvG3LbztJI2rC2VGxplR6
	 945aEETx8fiOMrqeLOznVud8lVQ8J4b1fotL5uHSJCXSsIBfEGYPfKmOAAh2cXoIfj
	 UUMRpfiDik+X3T3NEhaWnReGiTvWB+DD7i4lKNZvUDIhB7yfrQt7IpfsMBvh8tnkYS
	 NNbJAmhRrUv0g==
Date: Tue, 08 Jul 2025 23:27:40 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aG2paMXmJ/0kIIhf@kraken>
In-Reply-To: <aFvUkWvIAmu4sMHO@macbook.local>
References: <20250606201102.2414022-1-dmukhin@ford.com> <20250606201102.2414022-3-dmukhin@ford.com> <aFvUkWvIAmu4sMHO@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2b9579ea8aa2d097f72c6cd8675632b2cb5d7355
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:50:57PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 06, 2025 at 08:11:26PM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > If virtual UART from domain X prints on the physical console, the behav=
ior is
> > updated to (see [1]):
> > - console focus in domain X: do not prefix messages;
> > - no console focus in domain X: prefix all messages with "(dX)".
> >
> > Use guest_printk() in all current in-hypervisor UART emulators. That al=
igns the
> > behavior with debug I/O port 0xe9 handler on x86 and slightly improves =
the
> > logging since guest_printk() already prints the domain ID. guest_printk=
() was
> > modified to account for console focus ownership.
> >
> > Modify guest_console_write() for hardware domain case by adding domain =
ID to
> > the message when hwdom does not have console focus.
> >
> > [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360=
.463523@ubuntu-linux-20-04-desktop/
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v2:
> > - dropped rate-limiting change for vuart
> > ---
> >  xen/arch/arm/vpl011.c      |  6 +++---
> >  xen/arch/arm/vuart.c       |  2 +-
> >  xen/drivers/char/console.c | 23 +++++++++++++++++++++--
> >  3 files changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index 480fc664fc..2b6f2a09bc 100644
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -87,7 +87,7 @@ static void vpl011_write_data_xen(struct domain *d, u=
int8_t data)
> >      {
> >          if ( intf->out_prod =3D=3D 1 )
> >          {
> > -            printk("%c", data);
> > +            guest_printk(d, "%c", data);
> >              intf->out_prod =3D 0;
> >          }
> >          else
> > @@ -95,7 +95,7 @@ static void vpl011_write_data_xen(struct domain *d, u=
int8_t data)
> >              if ( data !=3D '\n' )
> >                  intf->out[intf->out_prod++] =3D '\n';
> >              intf->out[intf->out_prod++] =3D '\0';
> > -            printk("%s", intf->out);
> > +            guest_printk(d, "%s", intf->out);
> >              intf->out_prod =3D 0;
> >          }
> >      }
> > @@ -107,7 +107,7 @@ static void vpl011_write_data_xen(struct domain *d,=
 uint8_t data)
> >              if ( data !=3D '\n' )
> >                  intf->out[intf->out_prod++] =3D '\n';
> >              intf->out[intf->out_prod++] =3D '\0';
> > -            printk("DOM%u: %s", d->domain_id, intf->out);
> > +            guest_printk(d, "%s", intf->out);
> >              intf->out_prod =3D 0;
> >          }
> >      }
> > diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
> > index bd2f425214..6641f9d775 100644
> > --- a/xen/arch/arm/vuart.c
> > +++ b/xen/arch/arm/vuart.c
> > @@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
> >          if ( c !=3D '\n' )
> >              uart->buf[uart->idx++] =3D '\n';
> >          uart->buf[uart->idx] =3D '\0';
> > -        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
> > +        guest_printk(d, XENLOG_G_DEBUG "%s", uart->buf);
> >          uart->idx =3D 0;
> >      }
> >      spin_unlock(&uart->lock);
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 6e77b4af82..3855962af7 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_P=
ARAM(char) buffer,
> >          if ( is_hardware_domain(cd) )
> >          {
> >              /* Use direct console output as it could be interactive */
> > +            char prefix[16] =3D "";
> > +            struct domain *consd;
> > +
> > +            consd =3D console_get_domain();
> > +            if ( consd !=3D cd )
> > +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_=
id);
> > +            console_put_domain(consd);
> > +
> >              nrspin_lock_irq(&console_lock);
> > +            if ( prefix[0] !=3D '\0' )
> > +                console_send(prefix, strlen(prefix), flags);
> >              console_send(kbuf, kcount, flags);
> >              nrspin_unlock_irq(&console_lock);
> >          }
> > @@ -1032,12 +1042,21 @@ void printk(const char *fmt, ...)
> >      va_end(args);
> >  }
> >
> > +/*
> > + * Print message from the guest on the diagnostic console.
> > + * Prefixes all messages w/ "(dX)" if domain X does not own physical c=
onsole
> > + * focus.
> > + */
> >  void guest_printk(const struct domain *d, const char *fmt, ...)
> >  {
> >      va_list args;
> > -    char prefix[16];
> > +    char prefix[16] =3D "";
> > +    struct domain *consd;
> >
> > -    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> > +    consd =3D console_get_domain();
> > +    if ( consd !=3D d )
> > +        snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
> > +    console_put_domain(consd);
>=20
> It might be helpful to abstract this into a separate helper, as it's
> used by both functions:
>=20
> static void fill_console_prefix(char *prefix, unsigned int len,
>                                 const struct domain *d)
> {
>     struct domain *consd =3D console_get_domain();
>=20
>     if ( consd ? consd !=3D d : !is_hardware_domain(d)) )
>        snprintf(prefix, len, "(d%d) ", d->domain_id);
>     console_put_domain(consd);
> }
>=20
> Note the above code should also handle the current discussion of not
> printing the (d0) prefix for the hardware domain when the console
> target is Xen.  I think this keeps the previous behavior when console
> input is switched to Xen, while still providing unified (dX) prefixes
> otherwise.

Thanks, will do.

>=20
> Thanks, Roger.
>=20


