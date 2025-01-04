Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF1A01222
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865174.1276461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvBl-0002os-8N; Sat, 04 Jan 2025 03:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865174.1276461; Sat, 04 Jan 2025 03:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvBl-0002kF-5Y; Sat, 04 Jan 2025 03:51:01 +0000
Received: by outflank-mailman (input) for mailman id 865174;
 Sat, 04 Jan 2025 03:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvBi-0002k4-By
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:50:59 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19c9950a-ca4f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:50:55 +0100 (CET)
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
X-Inumbo-ID: 19c9950a-ca4f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735962654; x=1736221854;
	bh=whCBYl2yJcM1+Tm9Zub/cKAhE1c0VZkIoUrRKzkJ82Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=AnIDC+kg7x3GmMHofzLehRlHczL80n7zvDdlYg5zT7RDCuxqmXedFbhJ0aD0awP7r
	 DkdPsOFEADihiUHEXJzdDjG1n4uZQw+7HF2WAbiVgH9Xzs4AK0wYPzt1SIVhryvrqR
	 KmuoeDrwJfjv/TZ7U9rYpZWJGkcxcFlsWCCQsFQIvbTL2H5x4/3CwCCZwTNgUtdN+o
	 RbvBUvoWBQDtmJ50GpFjMJH6F78KL74QD6CrU+ulnnG1eSYJJkXT6bFmYgjF4gtKbO
	 ujZ3AfZwpE9XFLgmn/+kBTyDmcgjBtbqDMyj5wpgZJ7dkAGqVx29DxucgvfrtIgvI/
	 wStFI85LsnOhA==
Date: Sat, 04 Jan 2025 03:50:51 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 23/35] xen/console: introduce console_write()
Message-ID: <EqrIYfurxlsHxbvi0NaMYW6XGmmy8x1xXk1tWeOsLqb5FriS8i2hCnxP_vNKFspMZ_dRf_Yb2_JpYsfGC9isPk_2t4L4Xj4sHBc-GkXwQUk=@proton.me>
In-Reply-To: <Z1rRWAWzC1pnD3PW@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-23-e9aa923127eb@ford.com> <Z1rRWAWzC1pnD3PW@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2cd02ada5ff27473fa3e9c47e2a77f6d6ddb43df
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 4:04 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:53PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > PV Linux kernel uses HYPERVISOR_console_io hypercall for early console =
which
> > ends up being handled by Xen's console driver's guest_console_write().
> >
> > guest_console_write() duplicates the code from __putstr(), elimitate co=
de
> > duplication.
>
>
> It might be better to split the code that unifies
> guest_console_write() and __putstr() as a non-functional change.
> While the introduction of use_conring is likely a functional change.

Actually `use_conring` is not needed.
guest_console_write() depends on `opt_console_to_ring` to call
conring_puts() while __putstr() has unconditional call to conring_puts().
I solved this by adding another parameter to console_write().

>
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 97 +++++++++++++++++++++++++--------------=
-------
> > 1 file changed, 53 insertions(+), 44 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index ce3639a4cdcda00ea63e3bf119bc3b242cbfdf6a..115967d179998cba4a81578=
caba09db4e4aca7f7 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -63,6 +63,8 @@ static const char __initconst warning_sync_console[] =
=3D
> > "However it can introduce SIGNIFICANT latencies and affect\n"
> > "timekeeping. It is NOT recommended for production use!\n";
> >
> > +/* Flag: use conring for early console; switches to opt_console_to_rin=
g */
> > +static bool __read_mostly use_conring =3D true;
>
>
> __ro_after_init instead of __read_mostly.

I dropped use_conring.

>
> > /* console_to_ring: send guest (incl. dom 0) console data to console ri=
ng. */
> > static bool __read_mostly opt_console_to_ring;
> > boolean_param("console_to_ring", opt_console_to_ring);
> > @@ -661,6 +663,16 @@ static void cf_check notify_dom0_con_ring(void *un=
used)
> > static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
> > notify_dom0_con_ring, NULL);
> >
> > +static bool console_locks_busted;
> > +
> > +static void conring_write(const char *str, size_t len)
> > +{
> > + conring_puts(str, len);
> > +
> > + if ( !console_locks_busted )
> > + tasklet_schedule(&notify_dom0_con_ring_tasklet);
> > +}
> > +
> > #ifdef CONFIG_X86
> > static inline void xen_console_write_debug_port(const char *buf, size_t=
 len)
> > {
> > @@ -669,8 +681,44 @@ static inline void xen_console_write_debug_port(co=
nst char *buf, size_t len)
> > : "=3D&S" (tmp), "=3D&c" (tmp)
> > : "0" (buf), "1" (len), "d" (XEN_HVM_DEBUGCONS_IOPORT) );
> > }
> > +
> > +static void xen_console_write(const char *str, size_t len)
> > +{
> > + if ( xen_guest )
> > + xen_hypercall_console_write(str, len);
> > + else
> > + xen_console_write_debug_port(str, len);
> > +}
> > +#else
> > +static inline void xen_console_write(const char *str, size_t len)
> > +{
>
>
> opt_console_xen would only be set on x86 with the current command line
> parsing done in console_init_preirq(), so you could add an
> ASSERT_UNREACHABLE() here.

I re-arranged the code, `static inline` variant is not needed.

>
> > +}
> > #endif
> >
> > +/*
> > + * Write characters to console.
> > + *
> > + * That will handle all possible scenarios working w/ console
> > + * - serial console;
> > + * - video output;
> > + * - __HYPERVISOR_console_io hypercall (x86 only);
> > + * - debug I/O port (x86 only);
> > + * - forward to Xen event channel.
>
>
> "Xen event channel" is not the correct term. I would use "PV
> console". The event channel is just used to send the notification.

Thank you; fixed.

>
> > + */
> > +static void console_write(const char *str, size_t len)
> > +{
> > + ASSERT(rspin_is_locked(&console_lock));
> > +
> > + console_serial_puts(str, len);
> > + video_puts(str, len);
> > +
> > + if ( opt_console_xen )
> > + xen_console_write(str, len);
>
>
> Are you sure this builds? opt_console_xen is only defined on x86, and
> AFAICT console_write() is generic. AFAICT you need to keep the X86
> preprocessor guards, or alternatively do something like:

This is strange; CI did pass on that:
   https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1576164352
Fixed.

>
> #define opt_console_xen false
>
> For non-x86 arches in xen/console.h
>
> > +
> > + if ( use_conring )
> > + conring_write(str, len);
> > +}
> > +
> > static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> > unsigned int count)
> > {
> > @@ -691,28 +739,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_P=
ARAM(char) buffer,
> >
> > if ( is_hardware_domain(cd) )
> > {
> > - /* Use direct console output as it could be interactive */
> > nrspin_lock_irq(&console_lock);
> > -
> > - console_serial_puts(kbuf, kcount);
> > - video_puts(kbuf, kcount);
> > -
> > -#ifdef CONFIG_X86
> > - if ( opt_console_xen )
> > - {
> > - if ( xen_guest )
> > - xen_hypercall_console_write(kbuf, kcount);
> > - else
> > - xen_console_write_debug_port(kbuf, kcount);
> > - }
> > -#endif
> > -
> > - if ( opt_console_to_ring )
> > - {
> > - conring_puts(kbuf, kcount);
> > - tasklet_schedule(&notify_dom0_con_ring_tasklet);
> > - }
> > -
> > + console_write(kbuf, kcount);
> > nrspin_unlock_irq(&console_lock);
> > }
> > else
> > @@ -813,31 +841,9 @@ long do_console_io(
> > * *****************************************************
> > */
> >
> > -static bool console_locks_busted;
> > -
> > static void __putstr(const char *str)
> > {
> > - size_t len =3D strlen(str);
> > -
> > - ASSERT(rspin_is_locked(&console_lock));
> > -
> > - console_serial_puts(str, len);
> > - video_puts(str, len);
> > -
> > -#ifdef CONFIG_X86
> > - if ( opt_console_xen )
> > - {
> > - if ( xen_guest )
> > - xen_hypercall_console_write(str, len);
> > - else
> > - xen_console_write_debug_port(str, len);
> > - }
> > -#endif
> > -
> > - conring_puts(str, len);
> > -
> > - if ( !console_locks_busted )
> > - tasklet_schedule(&notify_dom0_con_ring_tasklet);
> > + console_write(str, strlen(str));
> > }
> >
> > static int printk_prefix_check(char *p, char **pp)
> > @@ -1171,6 +1177,9 @@ void __init console_endboot(void)
> >
> > video_endboot();
> >
> > + use_conring =3D opt_console_to_ring;
> > + smp_wmb();
>
>
> Do you really need the barrier? If so it would need a comment
> describing exactly why it's needed. I don't think it's possible for
> the write to be reordered past the return of the function, which would
> be enough to ensure correctness?

I see where I got confused: the right place to add this initialization was
console_init_postirq(). I dropped the barrier and of `use_conring` altogeth=
er.

>
> Thanks, Roger.



