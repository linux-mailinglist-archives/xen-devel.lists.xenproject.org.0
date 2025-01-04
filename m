Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A4DA01212
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865118.1276402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTujB-0002bP-Mq; Sat, 04 Jan 2025 03:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865118.1276402; Sat, 04 Jan 2025 03:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTujB-0002Z5-Ie; Sat, 04 Jan 2025 03:21:29 +0000
Received: by outflank-mailman (input) for mailman id 865118;
 Sat, 04 Jan 2025 03:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTujA-0002Xk-5B
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:21:28 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fafda4a3-ca4a-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:21:26 +0100 (CET)
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
X-Inumbo-ID: fafda4a3-ca4a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=i5ncakhrgjdddmshelq34qb43q.protonmail; t=1735960884; x=1736220084;
	bh=853xcxLbwv8zMwLmBBcwy0rSep7ENCS0+2oSbM3itU4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=X6j0fcQJNhiqmYHKL9VZMMNZDPSRNA+kafjAIHnrbB2NRQudy9AlvXMNBIEFwUP7b
	 Vgutt58T9awgfdpbuE9nWW+Ru1PAhFYTrh6Eia8JDBHIVm0tvt1aRYcBLNi3dD6adb
	 ahCVJAra8+PJ3rMsxuY5iE9UnTAxX3tMV3cWz5M7YXm4dlzBNJS2csQKkk7qFgQQPr
	 BQGNP2gv9UBJb5la8v9iUSd6C8tWi9Acwno3tscqPObNN1bhf+1ma3yU1eOs01pIvj
	 VWUU8DyfBOHxIQPeLYw/4W4ViUit0a56wO299SCFXshe94QD4KH+bBvVnQkws9eHkm
	 VPDmB+uOvlxrw==
Date: Sat, 04 Jan 2025 03:21:21 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 17/35] xen/console: introduce consoled_is_enabled()
Message-ID: <SMjSlxoJE3GxrhEztgVjKv27aQPczVxoIdqROw1ZHGd_pI6XGFC7aSGiBIAT73u5AnGNgDYHRBVZAivetgmknoKYz1KP8KHyf0K_qMwzxag=@proton.me>
In-Reply-To: <Z1qtYO9Kr-9bzwEh@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com> <Z1qtYO9Kr-9bzwEh@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 008483f02403bf4544509fa4674efc9c8d12f6f0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 1:31 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:47PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > There are few places which check pv_shim console under CONFIG_PV_SHIM i=
n xen
> > console driver. Instead of #ifdef-ing, use new consoled_is_enabled() to
> > customize the logic.
> >
> > Header file now can be included w/o CONFIG_X86.
> >
> > Signature of consoled_guest_{rx,tx} has changed to account for follow-o=
n
> > console switch logic cleanup.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 10 +++-------
> > xen/drivers/char/consoled.c | 18 ++++++++++++++----
> > xen/include/xen/consoled.h | 35 +++++++++++++++++++++++++++++++++--
> > 3 files changed, 50 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index f034ce5aab3f3bf59b0df9fa583ee9ce32dbf665..60c055396b697869b04b913=
2b0dcfa832fabe932 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -33,9 +33,9 @@
> > #include <xen/pv_console.h>
> > #include <asm/setup.h>
> > #include <xen/sections.h>
> > +#include <xen/consoled.h>
> >
> > #ifdef CONFIG_X86
> > -#include <xen/consoled.h>
> > #include <asm/guest.h>
> > #endif
> > #ifdef CONFIG_SBSA_VUART_CONSOLE
> > @@ -505,11 +505,9 @@ static void console_find_owner(void)
> > break;
> > }
> >
> > -#ifdef CONFIG_PV_SHIM
> > - if ( next_rx =3D=3D 1 )
> > + if ( consoled_is_enabled() && next_rx =3D=3D 1 )
> > domid =3D get_initial_domain_id();
> > else
> > -#endif
> > domid =3D next_rx - 1;
> > d =3D rcu_lock_domain_by_id(domid);
> > if ( d )
> > @@ -573,10 +571,8 @@ static void __serial_rx(char c)
> > #endif
> > }
> >
> > -#ifdef CONFIG_X86
> > - if ( pv_shim && pv_console )
> > + if ( consoled_is_enabled() )
> > consoled_guest_tx(c);
> > -#endif
> > }
> >
> > static void cf_check serial_rx(char c)
> > diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
> > index b415b632cecc0a80e161b701d7b70ba4f3cc5fb8..d6624e7697f56e1a1959b0e=
fa5dca104f34af002 100644
> > --- a/xen/drivers/char/consoled.c
> > +++ b/xen/drivers/char/consoled.c
> > @@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(vo=
id)
> > static char buf[BUF_SZ + 1];
> >
> > /* Receives characters from a domain's PV console */
> > -void consoled_guest_rx(void)
> > +int consoled_guest_rx(void)
> > {
> > size_t idx =3D 0;
> > XENCONS_RING_IDX cons, prod;
> >
> > if ( !cons_ring )
> > - return;
> > + return 0;
> >
> > spin_lock(&rx_lock);
> >
> > @@ -91,15 +91,17 @@ void consoled_guest_rx(void)
> >
> > out:
> > spin_unlock(&rx_lock);
> > +
> > + return 0;
> > }
> >
> > /* Sends a character into a domain's PV console */
> > -void consoled_guest_tx(char c)
> > +int consoled_guest_tx(char c)
> > {
> > XENCONS_RING_IDX cons, prod;
> >
> > if ( !cons_ring )
> > - return;
> > + return 0;
> >
> > cons =3D ACCESS_ONCE(cons_ring->in_cons);
> > prod =3D cons_ring->in_prod;
> > @@ -118,6 +120,7 @@ void consoled_guest_tx(char c)
> >
> > cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] =3D c;
> >
> > +
> > /* Write to the ring before updating the pointer /
> > smp_wmb();
> > ACCESS_ONCE(cons_ring->in_prod) =3D prod;
> > @@ -125,6 +128,13 @@ void consoled_guest_tx(char c)
> > notify:
> > / Always notify the guest: prevents receive path from getting stuck. */
> > pv_shim_inject_evtchn(pv_console_evtchn());
> > +
> > + return 0;
> > +}
> > +
> > +bool consoled_is_enabled(void)
> > +{
> > + return pv_shim && pv_console;
> > }
> >
> > /*
> > diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
> > index bd7ab6329ee8a7c466484021247241ded8ed03c7..696677fa5a3be458a0ec933=
60e08376c3471f95b 100644
> > --- a/xen/include/xen/consoled.h
> > +++ b/xen/include/xen/consoled.h
> > @@ -3,10 +3,41 @@
> >
> > #include <public/io/console.h>
> >
> > +#if defined(CONFIG_PV_SHIM)
> > +
> > void consoled_set_ring_addr(struct xencons_interface *ring);
> > struct xencons_interface *consoled_get_ring_addr(void);
> > -void consoled_guest_rx(void);
> > -void consoled_guest_tx(char c);
> > +int consoled_guest_rx(void);
> > +int consoled_guest_tx(char c);
> > +bool consoled_is_enabled(void);
> > +
> > +#else
> > +
> > +static inline void consoled_set_ring_addr(struct xencons_interface *ri=
ng)
> > +{
> > +}
> > +
> > +static inline struct xencons_interface *consoled_get_ring_addr(void)
> > +{
> > + return NULL;
> > +}
> > +
> > +static inline int consoled_guest_rx(void)
> > +{
> > + return 0;
> > +}
>
>
> You don't need to provide dummy implementations of
> consoled_{set,get}_ring_addr() and consoled_guest_rx(), they are only
> called from code that's build when CONFIG_PV_SHIM is selected.

Thanks; fixed.

>
> > +static inline int consoled_guest_tx(char c)
> > +{
> > + return 0;
>
>
> For consoled_guest_tx() you want to add an ASSERT_UNREACHABLE(), as
> it should never be called if !CONFIG_PV_SHIM?

Fixed.

>
> Thanks, Roger.



