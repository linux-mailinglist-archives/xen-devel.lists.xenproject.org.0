Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81870A9E5F3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 03:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970013.1358809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9DbA-0004jz-Sh; Mon, 28 Apr 2025 01:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970013.1358809; Mon, 28 Apr 2025 01:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9DbA-0004hs-NS; Mon, 28 Apr 2025 01:47:56 +0000
Received: by outflank-mailman (input) for mailman id 970013;
 Mon, 28 Apr 2025 01:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2FI=XO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u9Db8-0004hm-V0
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 01:47:55 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca699850-23d2-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 03:47:52 +0200 (CEST)
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
X-Inumbo-ID: ca699850-23d2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745804867; x=1746064067;
	bh=UMYjEXEuqWl7LjG6RLbe+r7fsYC4zyS9YbdfmdkFimU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=F7G2FNK9gVT9I/FkVTSxarSNfdkmPbLxWLeK57BD66UeUiI3RUJF0GQauT7FID9oG
	 Ub4Sn19E3iAkJrpTlLggb9fiPjnb6F/r7/3KNvDgFIBGFGMMxUz+UNqP64no45tyIl
	 1n3ZRwykPRO+FtPy/YIwbnOcvDOMqncxwkqwrjltQ83kPJAtbzEju6IZebEi8vh9kn
	 wFmlMeAlPem8lkdDDANfOJxlNpBEQTUlQuT8Y8PAZfkzOncKfCP4Gk791xQtSBpbyr
	 PO2tUN090fapqwWy0efzVEZMw4mwbw4TuzR/aj94WK6l2PFbctsoXteFkAbIlZAJze
	 HOca2aHlgycPA==
Date: Mon, 28 Apr 2025 01:47:44 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v1 2/3] xen/console: introduce console_puts()
Message-ID: <aA7ePF23LExpH9NW@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2504251545480.785180@ubuntu-linux-20-04-desktop>
References: <20250403000604.169619-1-dmukhin@ford.com> <20250403000604.169619-3-dmukhin@ford.com> <alpine.DEB.2.22.394.2504251545480.785180@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 33d94894bbf7cfdd3c4c08e9d53b2f45d63f4b2f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 03:47:53PM -0700, Stefano Stabellini wrote:
> On Thu, 3 Apr 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > guest_console_write() duplicates the code from __putstr(), eliminate co=
de
> > duplication.
> >
> > Introduce console_puts() for writing a buffer to console devices.
> >
> > Also, introduce internal console flags to control which console devices
> > should be used.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  xen/drivers/char/console.c | 112 ++++++++++++++++++++++---------------
> >  1 file changed, 66 insertions(+), 46 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index aaa97088aa..2618c2e47d 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -41,6 +41,20 @@
> >  #include <asm/vpl011.h>
> >  #endif
> >
> > +/* Internal console flags. */
> > +enum {
> > +    CONSOLE_SERIAL  =3D BIT(0, U),    /* Use serial device. */
> > +    CONSOLE_PV      =3D BIT(1, U),    /* Use PV console. */
> > +    CONSOLE_VIDEO   =3D BIT(2, U),    /* Use video device. */
> > +    CONSOLE_DEBUG   =3D BIT(3, U),    /* Use debug device. */
> > +    CONSOLE_RING    =3D BIT(4, U),    /* Use console ring. */
> > +    CONSOLE_DEFAULT =3D CONSOLE_SERIAL | CONSOLE_PV | CONSOLE_VIDEO |
> > +                      CONSOLE_DEBUG,
> > +    CONSOLE_ALL     =3D CONSOLE_DEFAULT | CONSOLE_RING,
> > +};
> > +
> > +static void console_puts(const char *str, size_t len, unsigned int fla=
gs);
> > +
> >  /* console: comma-separated list of console outputs. */
> >  static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
> >  string_param("console", opt_console);
> > @@ -338,8 +352,6 @@ static bool console_locks_busted;
> >
> >  static void conring_puts(const char *str, size_t len)
> >  {
> > -    ASSERT(rspin_is_locked(&console_lock));
> > -
> >      while ( len-- )
> >          conring[CONRING_IDX_MASK(conringp++)] =3D *str++;
> >
> > @@ -432,9 +444,6 @@ void console_serial_puts(const char *s, size_t nr)
> >          serial_steal_fn(s, nr);
> >      else
> >          serial_puts(sercon_handle, s, nr);
> > -
> > -    /* Copy all serial output into PV console */
> > -    pv_console_puts(s, nr);
> >  }
> >
> >  static void cf_check dump_console_ring_key(unsigned char key)
> > @@ -468,8 +477,7 @@ static void cf_check dump_console_ring_key(unsigned=
 char key)
> >          c +=3D len;
> >      }
> >
> > -    console_serial_puts(buf, sofar);
> > -    video_puts(buf, sofar);
> > +    console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_=
PV);
>=20
> Actually I take back the R-b. It looks like this change is breaking
> because console_puts now requires the console_lock to be held, while
> here the console_lock is not held.

Yes, the locking is wrong, thanks for the catch!
Lock adjustment from Patch 3 should be moved to Patch 2 (here).

>=20
> If I am not mistaken if you try to use the 'w' key with this patch
> applied you'll hit the ASSERT at the beginning of console_puts
>=20
>=20
> >      free_xenheap_pages(buf, order);
> >  }
> > @@ -618,11 +626,61 @@ static inline void xen_console_write_debug_port(c=
onst char *buf, size_t len)
> >  }
> >  #endif
> >
> > +static inline void console_debug_puts(const char *str, size_t len)
> > +{
> > +#ifdef CONFIG_X86
> > +    if ( opt_console_xen )
> > +    {
> > +        if ( xen_guest )
> > +            xen_hypercall_console_write(str, len);
> > +        else
> > +            xen_console_write_debug_port(str, len);
> > +    }
> > +#endif
> > +}
> > +
> > +/*
> > + * Write buffer to all enabled console devices.
> > + *
> > + * That will handle all possible scenarios working w/ console
> > + * - physical console (serial console, VGA console (x86 only));
> > + * - PV console;
> > + * - debug console (x86 only): debug I/O port or __HYPERVISOR_console_=
io
> > + *   hypercall;
> > + * - console ring.
> > + */
> > +static void console_puts(const char *str, size_t len, unsigned int fla=
gs)
> > +{
> > +    ASSERT(rspin_is_locked(&console_lock));
> > +
> > +    if ( flags & CONSOLE_SERIAL )
> > +        console_serial_puts(str, len);
> > +
> > +    if ( flags & CONSOLE_PV )
> > +        pv_console_puts(str, len);
> > +
> > +    if ( flags & CONSOLE_VIDEO )
> > +        video_puts(str, len);
> > +
> > +    if ( flags & CONSOLE_DEBUG )
> > +        console_debug_puts(str, len);
> > +
> > +    if ( flags & CONSOLE_RING )
> > +        conring_puts(str, len);
> > +}
> > +
> > +static inline void __putstr(const char *str)
> > +{
> > +    console_puts(str, strlen(str), CONSOLE_ALL);
> > +}
> > +
> >  static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >                                  unsigned int count)
> >  {
> >      char kbuf[128];
> >      unsigned int kcount =3D 0;
> > +    unsigned int flags =3D opt_console_to_ring
> > +                         ? CONSOLE_ALL : CONSOLE_DEFAULT;
> >      struct domain *cd =3D current->domain;
> >
> >      while ( count > 0 )
> > @@ -640,23 +698,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_P=
ARAM(char) buffer,
> >          {
> >              /* Use direct console output as it could be interactive */
> >              nrspin_lock_irq(&console_lock);
> > -
> > -            console_serial_puts(kbuf, kcount);
> > -            video_puts(kbuf, kcount);
> > -
> > -#ifdef CONFIG_X86
> > -            if ( opt_console_xen )
> > -            {
> > -                if ( xen_guest )
> > -                    xen_hypercall_console_write(kbuf, kcount);
> > -                else
> > -                    xen_console_write_debug_port(kbuf, kcount);
> > -            }
> > -#endif
> > -
> > -            if ( opt_console_to_ring )
> > -                conring_puts(kbuf, kcount);
> > -
> > +            console_puts(kbuf, kcount, flags);
> >              nrspin_unlock_irq(&console_lock);
> >          }
> >          else
> > @@ -757,28 +799,6 @@ long do_console_io(
> >   * *****************************************************
> >   */
> >
> > -static void __putstr(const char *str)
> > -{
> > -    size_t len =3D strlen(str);
> > -
> > -    ASSERT(rspin_is_locked(&console_lock));
> > -
> > -    console_serial_puts(str, len);
> > -    video_puts(str, len);
> > -
> > -#ifdef CONFIG_X86
> > -    if ( opt_console_xen )
> > -    {
> > -        if ( xen_guest )
> > -            xen_hypercall_console_write(str, len);
> > -        else
> > -            xen_console_write_debug_port(str, len);
> > -    }
> > -#endif
> > -
> > -    conring_puts(str, len);
> > -}
> > -
> >  static int printk_prefix_check(char *p, char **pp)
> >  {
> >      int loglvl =3D -1;
> > --
> > 2.34.1
> >
> >


