Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A4ACBE09
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 03:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003949.1383587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMG3j-0001Lk-Tb; Tue, 03 Jun 2025 01:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003949.1383587; Tue, 03 Jun 2025 01:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMG3j-0001Ij-Qr; Tue, 03 Jun 2025 01:03:19 +0000
Received: by outflank-mailman (input) for mailman id 1003949;
 Tue, 03 Jun 2025 01:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XduF=YS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMG3h-0001IU-RZ
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 01:03:18 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 873f035b-4016-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 03:03:15 +0200 (CEST)
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
X-Inumbo-ID: 873f035b-4016-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748912593; x=1749171793;
	bh=xb16ngmh0Y4gX1KL08ipj9+1nfE4yRAO6vOVfdFkpmA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iK3d86RxaQd80PyD56bM/9TabG4rcH75iDx9QTRcCxnVTzCONgV4v5O5ewh8I1d/p
	 4ZG3viDaZkoBH9TEWn8nCKWUx38FUe/lucRD6D4VBmiuvNYyqa+dW3pWWit6XDAcwj
	 OqfeVmuhYbc8DrZHy3cFCXaKML0A8hjMzZtTJlksW2dH55KhG0AZFG8eC1Wler5VaK
	 1hJdOoSlvDN1FEay82lkh4UPFNsEupPtyjxyEPn8ZLYbXdbVz8NoGZz0NqVtlhV+P6
	 YdDLr23bng+hzYUxSatBex1urkfXThTOuS+dS94mnwqU7puTdxYpG715uOa+uZv8Bs
	 esksEc2qxJcag==
Date: Tue, 03 Jun 2025 01:03:08 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 3/4] xen/console: remove max_init_domid dependency
Message-ID: <aD5JxnenoQ+83lpw@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2506021733330.1147082@ubuntu-linux-20-04-desktop>
References: <20250530231841.73386-1-dmukhin@ford.com> <20250530231841.73386-4-dmukhin@ford.com> <alpine.DEB.2.22.394.2506021733330.1147082@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 70ac7c5d8bfbc04b1a8f0c45f2c1aba9e03999db
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2025 at 05:36:25PM -0700, Stefano Stabellini wrote:
> On Fri, 30 May 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > The physical console input rotation depends on max_init_domid symbol, w=
hich is
> > managed differently across architectures.
> >
> > Instead of trying to manage max_init_domid in the arch-common code the =
console
> > input rotation code can be reworked by removing dependency on max_init_=
domid
> > entirely.
> >
> > To do that, introduce domid_find_with_input_allowed() in arch-independe=
nt
> > location to find the ID of the next possible console owner domain. The =
IDs
> > are rotated across non-system domain IDs and DOMID_XEN.
> >
> > Also, introduce helper console_set_domid() for updating identifier of t=
he
> > current console input owner (points to Xen or domain).
> >
> > Use domid_find_with_input_allowed() and console_set_domid() in
> > console_switch_input().
> >
> > Remove uses of max_init_domid in the code.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v4:
> > - fixed domid_find_with_input_allowed()
> > - kept switching to get_initial_domain_id() in console_endboot()
> > ---
> >  xen/arch/arm/include/asm/setup.h        |  2 -
> >  xen/arch/arm/setup.c                    |  2 -
> >  xen/arch/ppc/include/asm/setup.h        |  2 -
> >  xen/arch/riscv/include/asm/setup.h      |  2 -
> >  xen/arch/x86/include/asm/setup.h        |  2 -
> >  xen/common/device-tree/dom0less-build.c |  2 -
> >  xen/common/domain.c                     | 33 +++++++++
> >  xen/drivers/char/console.c              | 90 +++++++++----------------
> >  xen/include/xen/domain.h                |  1 +
> >  9 files changed, 65 insertions(+), 71 deletions(-)
> >
> > diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/as=
m/setup.h
> > index 6cf272c160..f107e8eebb 100644
> > --- a/xen/arch/arm/include/asm/setup.h
> > +++ b/xen/arch/arm/include/asm/setup.h
> > @@ -25,8 +25,6 @@ struct map_range_data
> >      struct rangeset *irq_ranges;
> >  };
> >
> > -extern domid_t max_init_domid;
> > -
> >  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> >
> >  size_t estimate_efi_size(unsigned int mem_nr_banks);
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 734e23da44..0a18d479f9 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -61,8 +61,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
> >  bool __read_mostly acpi_disabled;
> >  #endif
> >
> > -domid_t __read_mostly max_init_domid;
> > -
> >  static __used void init_done(void)
> >  {
> >      int rc;
> > diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/as=
m/setup.h
> > index e4f64879b6..956fa6985a 100644
> > --- a/xen/arch/ppc/include/asm/setup.h
> > +++ b/xen/arch/ppc/include/asm/setup.h
> > @@ -1,6 +1,4 @@
> >  #ifndef __ASM_PPC_SETUP_H__
> >  #define __ASM_PPC_SETUP_H__
> >
> > -#define max_init_domid (0)
> > -
> >  #endif /* __ASM_PPC_SETUP_H__ */
> > diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/includ=
e/asm/setup.h
> > index c9d69cdf51..d1fc64b673 100644
> > --- a/xen/arch/riscv/include/asm/setup.h
> > +++ b/xen/arch/riscv/include/asm/setup.h
> > @@ -5,8 +5,6 @@
> >
> >  #include <xen/types.h>
> >
> > -#define max_init_domid (0)
> > -
> >  void setup_mm(void);
> >
> >  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> > diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/as=
m/setup.h
> > index ac34c69855..b67de8577f 100644
> > --- a/xen/arch/x86/include/asm/setup.h
> > +++ b/xen/arch/x86/include/asm/setup.h
> > @@ -69,6 +69,4 @@ extern bool opt_dom0_verbose;
> >  extern bool opt_dom0_cpuid_faulting;
> >  extern bool opt_dom0_msr_relaxed;
> >
> > -#define max_init_domid (0)
> > -
> >  #endif
> > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/devic=
e-tree/dom0less-build.c
> > index 9a6015f4ce..703f20faed 100644
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -977,8 +977,6 @@ void __init create_domUs(void)
> >          domid =3D domid_alloc(DOMID_INVALID);
> >          if ( domid =3D=3D DOMID_INVALID )
> >              panic("Error allocating ID for domain %s\n", dt_node_name(=
node));
> > -        if ( max_init_domid < domid )
> > -            max_init_domid =3D domid;
> >
> >          d =3D domain_create(domid, &d_cfg, flags);
> >          if ( IS_ERR(d) )
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index d75ece1b61..4a54bc27a3 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -2461,6 +2461,39 @@ void domid_free(domid_t domid)
> >      spin_unlock(&domid_lock);
> >  }
> >
> > +/*
> > + * Find the ID of the next possible console owner domain.
> > + *
> > + * @return Domain ID: DOMID_XEN or non-system domain IDs within
> > + * the range of [0..DOMID_FIRST_RESERVED-1].
> > + */
> > +domid_t domid_find_with_input_allowed(domid_t hint)
> > +{
> > +    domid_t domid =3D DOMID_XEN;
> > +
> > +    if ( hint < DOMID_FIRST_RESERVED )
> > +    {
> > +        struct domain *d;
> > +
> > +        rcu_read_lock(&domlist_read_lock);
> > +
> > +        for ( d =3D domid_to_domain(hint);
> > +              d && get_domain(d) && d->domain_id < DOMID_FIRST_RESERVE=
D;
>=20
> The get_domain(d) worries me because it is increasing the domain's
> refcnt but I don't see a corresponding call to put_domain to decrease
> it.
>=20
> If I keep rotating between consoles, I could keep increasing refcnt
> indefinitely?
>=20
> I think we either need a corresponding put_domain(d) call when the domain
> loses input focus, or we remove the get_domain(d) based on the fact that
> we don't need it. I think before this patch we didn't increment refcnt
> when a domain has focus but I am not sure it was correct.

Thank you for catching this!

My understanding the code should be doing refcnt-ing properly to
access the domain fields, so there has to be a put_domain() call.

Will update.

>=20
>=20
> > +              d =3D rcu_dereference(d->next_in_list) )
> > +        {
> > +            if ( d->console.input_allowed )
> > +            {
> > +                domid =3D d->domain_id;
> > +                break;
> > +            }
> > +        }
> > +
> > +        rcu_read_unlock(&domlist_read_lock);
> > +    }
> > +
> > +    return domid;
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 9a9836ba91..37289d5558 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -498,26 +498,17 @@ static void cf_check conring_dump_keyhandler(unsi=
gned char key)
> >
> >  /*
> >   * CTRL-<switch_char> changes input direction, rotating among Xen, Dom=
0,
> > - * and the DomUs started from Xen at boot.
> > + * and the DomUs.
> >   */
> >  #define switch_code (opt_conswitch[0]-'a'+1)
> > -/*
> > - * console_rx=3D0 =3D> input to xen
> > - * console_rx=3D1 =3D> input to dom0 (or the sole shim domain)
> > - * console_rx=3DN =3D> input to dom(N-1)
> > - */
> > -static unsigned int __read_mostly console_rx =3D 0;
> >
> > -#define max_console_rx (max_init_domid + 1)
> > +/* Console owner domain identifier. */
> > +static domid_t __read_mostly console_rx =3D DOMID_XEN;
> >
> >  struct domain *console_get_domain(void)
> >  {
> > -    struct domain *d;
> > +    struct domain *d =3D rcu_lock_domain_by_id(console_rx);
> >
> > -    if ( console_rx =3D=3D 0 )
> > -            return NULL;
> > -
> > -    d =3D rcu_lock_domain_by_id(console_rx - 1);
> >      if ( !d )
> >          return NULL;
> >
> > @@ -535,43 +526,14 @@ void console_put_domain(struct domain *d)
> >          rcu_unlock_domain(d);
> >  }
> >
> > -static void console_switch_input(void)
> > +static void console_set_domid(domid_t domid)
> >  {
> > -    unsigned int next_rx =3D console_rx;
> > +    if ( domid =3D=3D DOMID_XEN )
> > +        printk("*** Serial input to Xen");
> > +    else
> > +        printk("*** Serial input to DOM%u", domid);
> >
> > -    /*
> > -     * Rotate among Xen, dom0 and boot-time created domUs while skippi=
ng
> > -     * switching serial input to non existing domains.
> > -     */
> > -    for ( ; ; )
> > -    {
> > -        domid_t domid;
> > -        struct domain *d;
> > -
> > -        if ( next_rx++ >=3D max_console_rx )
> > -        {
> > -            console_rx =3D 0;
> > -            printk("*** Serial input to Xen");
> > -            break;
> > -        }
> > -
> > -        if ( consoled_is_enabled() && next_rx =3D=3D 1 )
> > -            domid =3D get_initial_domain_id();
> > -        else
> > -            domid =3D next_rx - 1;
> > -        d =3D rcu_lock_domain_by_id(domid);
> > -        if ( d )
> > -        {
> > -            rcu_unlock_domain(d);
> > -
> > -            if ( !d->console.input_allowed )
> > -                continue;
> > -
> > -            console_rx =3D next_rx;
> > -            printk("*** Serial input to DOM%u", domid);
> > -            break;
> > -        }
> > -    }
> > +    console_rx =3D domid;
> >
> >      if ( switch_code )
> >          printk(" (type 'CTRL-%c' three times to switch input)",
> > @@ -579,12 +541,30 @@ static void console_switch_input(void)
> >      printk("\n");
> >  }
> >
> > +/*
> > + * Switch console focus.
> > + * Rotates input focus among Xen and domains with console input permis=
sion.
> > + */
> > +static void console_switch_input(void)
> > +{
> > +    domid_t hint;
> > +
> > +    if ( console_rx =3D=3D DOMID_XEN )
> > +        hint =3D get_initial_domain_id();
> > +    else
> > +        hint =3D console_rx + 1;
> > +
> > +    hint =3D domid_find_with_input_allowed(hint);
> > +
> > +    console_set_domid(hint);
> > +}
> > +
> >  static void __serial_rx(char c)
> >  {
> >      struct domain *d;
> >      int rc =3D 0;
> >
> > -    if ( console_rx =3D=3D 0 )
> > +    if ( console_rx =3D=3D DOMID_XEN )
> >          return handle_keypress(c, false);
> >
> >      d =3D console_get_domain();
> > @@ -1169,14 +1149,6 @@ void __init console_endboot(void)
> >
> >      video_endboot();
> >
> > -    /*
> > -     * If user specifies so, we fool the switch routine to redirect in=
put
> > -     * straight back to Xen. I use this convoluted method so we still =
print
> > -     * a useful 'how to switch' message.
> > -     */
> > -    if ( opt_conswitch[1] =3D=3D 'x' )
> > -        console_rx =3D max_console_rx;
> > -
> >      register_keyhandler('w', conring_dump_keyhandler,
> >                          "synchronously dump console ring buffer (dmesg=
)", 0);
> >      register_irq_keyhandler('+', &do_inc_thresh,
> > @@ -1186,8 +1158,8 @@ void __init console_endboot(void)
> >      register_irq_keyhandler('G', &do_toggle_guest,
> >                              "toggle host/guest log level adjustment", =
0);
> >
> > -    /* Serial input is directed to DOM0 by default. */
> > -    console_switch_input();
> > +    if ( opt_conswitch[1] !=3D 'x' )
> > +        (void)console_set_domid(get_initial_domain_id());
> >  }
> >
> >  int __init console_has(const char *device)
> > diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> > index 8aab05ae93..a88eb34f3f 100644
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -36,6 +36,7 @@ void getdomaininfo(struct domain *d, struct xen_domct=
l_getdomaininfo *info);
> >  void arch_get_domain_info(const struct domain *d,
> >                            struct xen_domctl_getdomaininfo *info);
> >
> > +domid_t domid_find_with_input_allowed(domid_t hint);
> >  domid_t get_initial_domain_id(void);
> >
> >  domid_t domid_alloc(domid_t domid);
> > --
> > 2.34.1
> >
> >


