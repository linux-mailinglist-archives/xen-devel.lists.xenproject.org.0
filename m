Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE96CC2F5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515919.799282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAdv-0006Pc-9B; Tue, 28 Mar 2023 14:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515919.799282; Tue, 28 Mar 2023 14:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAdv-0006MR-6R; Tue, 28 Mar 2023 14:49:47 +0000
Received: by outflank-mailman (input) for mailman id 515919;
 Tue, 28 Mar 2023 14:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B75i=7U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1phAdt-0006MJ-HD
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:49:45 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5133a99-cd77-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:49:41 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A57435C012B;
 Tue, 28 Mar 2023 10:49:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 28 Mar 2023 10:49:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 10:49:39 -0400 (EDT)
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
X-Inumbo-ID: c5133a99-cd77-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680014980; x=1680101380; bh=wnn0gOpdKskpRCNkgRumtSecj850TAhpnzA
	fX7/J51E=; b=E7/NqVVMsIkR2ynhI0NtM5+Rz1/OGIsvHihj4OB52DysIWzM+eA
	E5DZ/ySmPWDubT+ZaFwIKdHArtx7HPoOhc/syOv7a+PedlfcZqp1MeRTsCBNy1uZ
	5JANZwNXoqC47BJwk7nyGZeHGXhNJM3HIkn2JOtWa6mKIS0h92ymuSBAyuPc9fOa
	wjJ4IOm9BHBWfHCl7xaVycQf7ZUvQs75mwp0iTnrwG4ch85w+lkLush+3BSZC2E/
	2/EG+zlGM6TkWoLehPK7+N69DMAPycpf4+ohNhdaIq5STyuq7rIRhFQ7QdKD2cjd
	4O7gjYlp+1d0sLMpOgKyhq4I3FuFTJoVMug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680014980; x=1680101380; bh=wnn0gOpdKskpR
	CNkgRumtSecj850TAhpnzAfX7/J51E=; b=C85Z/rVG3pMmeTA5Bubq80S3/sfZ5
	fQbkQ1WhULjp9DDibRdjYMjImNeny6btMc8lVc8AuYNenfvlCwYsil346d6d6s8Z
	LPeXD5vOH+zrMyLApn1UC3Yfund5Ppt5jjmm/7ctDuwoGNQU6H9EBzCS5BWR1Z0W
	UhnTmoHzlCxdqO7hl5g2X8ycXfeT2ufNiPKHtlqTVolRU2FFeGyFlVueL1FCi1uV
	1CldTJ0mY0hTpCno+2yJZ8dyZt1jSwRnNLMRP1kVvEUN+0cZPFDb9047kFGCawVM
	5L9bODhdjjyMvfEwyiYuSvadXKMbXZiCTtBBwvzeckDYiLHMCfpQnrIYg==
X-ME-Sender: <xms:hP4iZAgt16H6x_rGYVznY1Od0OXs7vK79FRWob4OP3nLe1YlbBXyGQ>
    <xme:hP4iZJB4afbTLf4M7Abys65uHjS5jojeXKoXIpInm7Ol8WM17p1sFKpgA5UdpzCEP
    zfergTvaFSNQg>
X-ME-Received: <xmr:hP4iZIENWql89xBl7dX4rYBOMuV05Dv5KgtAQgQzWcW4boxG1rdLxM5ZTN81e4_i3RfqZPGaeO6wtp1a62laVhLCrviHg2CBa0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:hP4iZBQSSZnlD-gmscNtAd3ARVZTM_hfku3T6uG3WntA7DLaAKFSsw>
    <xmx:hP4iZNxuDilKpR7BOhs8TWJvWqmKaM_SIb1CmxjkF3htJJ2_JAv0cg>
    <xmx:hP4iZP53de6sQsLEM23S5e029W_E6Z8Q0nCSFSmQfsiT3fK9E8yjCg>
    <xmx:hP4iZF-fCbKt61rP4UkBuwWnO8Wa-lBZgtuobIR_jrU69lugdCPBXw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 28 Mar 2023 16:49:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only
Message-ID: <ZCL+gCQrUc2lUf1A@mail-itl>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
 <ZCLz/2QeoMVyOej8@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VITwGu5IVH8xZkDz"
Content-Disposition: inline
In-Reply-To: <ZCLz/2QeoMVyOej8@Air-de-Roger>


--VITwGu5IVH8xZkDz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Mar 2023 16:49:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only

On Tue, Mar 28, 2023 at 04:04:47PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 27, 2023 at 12:09:15PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > In some cases, only few registers on a page needs to be write-protected.
> > Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> > PBA table (which doesn't need to span the whole table either).
> > Current API allows only marking whole pages pages read-only, which
> > sometimes may cover other registers that guest may need to write into.
> >=20
> > Currently, when a guest tries to write to an MMIO page on the
> > mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> > that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> > from userspace (like, /dev/mem), it will try to fixup by updating page
> > tables (that Xen again will force to read-only) and will hit that #PF
> > again (looping endlessly). Both behaviors are undesirable if guest could
> > actually be allowed the write.
> >=20
> > Introduce an API that allows marking part of a page read-only. Since
> > sub-page permissions are not a thing in page tables, do this via
> > emulation (or simply page fault handler for PV) that handles writes that
> > are supposed to be allowed. Those writes require the page to be mapped
> > to Xen, so subpage_mmio_ro_add() function takes fixmap index of the
> > page. The page needs to be added to mmio_ro_ranges, first anyway.
> > Sub-page ranges are stored using rangeset for each added page, and those
> > pages are stored on a plain list (as there isn't supposed to be many
> > pages needing this precise r/o control).
>=20
> Since mmio_ro_ranges is x86 only, it is possible to mutate
> it to track address ranges instead of page frames.  The current type
> is unsigned long, so that should be fine, and would avoid having to
> create a per-page rangeset to just track offsets.

I was thinking about it, but rangeset doesn't allow attaching extra data
(fixmap index, or mapped address as you propose with ioremap()).
Changing all the places where mmio_ro_ranges is used will be a bit
tedious, but that isn't really a problem.

> > The mechanism this API is plugged in is slightly different for PV and
> > HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> > it's already called for #PF on read-only MMIO page. For HVM however, EPT
> > violation on p2m_mmio_direct page results in a direct domain_crash().
> > To reach mmio_ro_emulated_write(), change how write violations for
> > p2m_mmio_direct are handled - specifically, treat them similar to
> > p2m_ioreq_server. This makes relevant ioreq handler being called,
> > that finally end up calling mmio_ro_emulated_write().
> > Both of those paths need an MFN to which guest tried to write (to check
> > which part of the page is supposed to be read-only, and where
> > the page is mapped for writes). This information currently isn't
> > available directly in mmio_ro_emulated_write(), but in both cases it is
> > already resolved somewhere higher in the call tree. Pass it down to
> > mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Shadow mode is not tested, but I don't expect it to work differently th=
an
> > HAP in areas related to this patch.
> > The used locking should make it safe to use similar to mmio_ro_ranges,
> > but frankly the only use (introduced in the next patch) could go without
> > locking at all, as subpage_mmio_ro_add() is called only before any
> > domain is constructed and subpage_mmio_ro_remove() is never called.
> > ---
> >  xen/arch/x86/hvm/emulate.c      |   2 +-
> >  xen/arch/x86/hvm/hvm.c          |   3 +-
> >  xen/arch/x86/include/asm/mm.h   |  22 ++++-
> >  xen/arch/x86/mm.c               | 181 ++++++++++++++++++++++++++++++++=
+-
> >  xen/arch/x86/pv/ro-page-fault.c |   1 +-
> >  5 files changed, 207 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> > index 95364deb1996..311102724dea 100644
> > --- a/xen/arch/x86/hvm/emulate.c
> > +++ b/xen/arch/x86/hvm/emulate.c
> > @@ -2733,7 +2733,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsig=
ned long gla)
> >          .write      =3D mmio_ro_emulated_write,
> >          .validate   =3D hvmemul_validate,
> >      };
> > -    struct mmio_ro_emulate_ctxt mmio_ro_ctxt =3D { .cr2 =3D gla };
> > +    struct mmio_ro_emulate_ctxt mmio_ro_ctxt =3D { .cr2 =3D gla, .mfn =
=3D _mfn(mfn) };
> >      struct hvm_emulate_ctxt ctxt;
> >      const struct x86_emulate_ops *ops;
> >      unsigned int seg, bdf;
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index d326fa1c0136..f1c928e3e4ee 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -1942,7 +1942,8 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsign=
ed long gla,
> >       */
> >      if ( (p2mt =3D=3D p2m_mmio_dm) ||
> >           (npfec.write_access &&
> > -          (p2m_is_discard_write(p2mt) || (p2mt =3D=3D p2m_ioreq_server=
))) )
> > +          (p2m_is_discard_write(p2mt) || (p2mt =3D=3D p2m_ioreq_server=
) ||
> > +           p2mt =3D=3D p2m_mmio_direct)) )
> >      {
> >          if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npf=
ec) )
> >              hvm_inject_hw_exception(TRAP_gp_fault, 0);
> > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/m=
m.h
> > index db29e3e2059f..91937d556bac 100644
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -522,9 +522,31 @@ extern struct rangeset *mmio_ro_ranges;
> >  void memguard_guard_stack(void *p);
> >  void memguard_unguard_stack(void *p);
> > =20
> > +/*
> > + * Add more precise r/o marking for a MMIO page. Bytes range specified=
 here
> > + * will still be R/O, but the rest of the page (nor marked as R/O via =
another
> > + * call) will have writes passed through. The write passthrough requir=
es
> > + * providing fixmap entry by the caller.
> > + * Since multiple callers can mark different areas of the same page, t=
hey might
> > + * provide different fixmap entries (although that's very unlikely in
> > + * practice). Only the one provided by the first caller will be used. =
Return value
> > + * indicates whether this fixmap entry will be used, or a different one
> > + * provided earlier (in which case the caller might decide to release =
it).
>=20
> Why not use ioremap() to map the page instead of requiring a fixmap
> entry?

In all the cases this feature is used (for now), I do have a fixmap
anyway. So, I don't need to worry if I can call ioremap() at that boot
stage (I think it's okay in console_init_postirq(), but that may not
be obvious in other places).

> > + *
> > + * Return values:
> > + *  - negative: error
> > + *  - 0: success, fixmap entry is claimed
> > + *  - 1: success, fixmap entry set earlier will be used
> > + */
> > +int subpage_mmio_ro_add(mfn_t mfn, unsigned long offset_s,
> > +                        unsigned long offset_e, int fixmap_idx);
> > +int subpage_mmio_ro_remove(mfn_t mfn, unsigned long offset_s,
> > +                           unsigned long offset_e);
> > +
> >  struct mmio_ro_emulate_ctxt {
> >          unsigned long cr2;
> >          unsigned int seg, bdf;
> > +        mfn_t mfn;
> >  };
> > =20
> >  int cf_check mmio_ro_emulated_write(
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 0fe14faa5fa7..b50bdee40b6b 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -165,6 +165,19 @@ bool __read_mostly machine_to_phys_mapping_valid;
> > =20
> >  struct rangeset *__read_mostly mmio_ro_ranges;
> > =20
> > +/* Handling sub-page read-only MMIO regions */
> > +struct subpage_ro_range {
> > +    struct list_head list;
> > +    mfn_t mfn;
> > +    int fixmap_idx;
> > +    struct rangeset *ro_bytes;
> > +    struct rcu_head rcu;
> > +};
> > +
> > +static LIST_HEAD(subpage_ro_ranges);
> > +static DEFINE_RCU_READ_LOCK(subpage_ro_rcu);
> > +static DEFINE_SPINLOCK(subpage_ro_lock);
> > +
> >  static uint32_t base_disallow_mask;
> >  /* Global bit is allowed to be set on L1 PTEs. Intended for user mappi=
ngs. */
> >  #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE=
_GLOBAL)
> > @@ -4893,6 +4906,172 @@ long arch_memory_op(unsigned long cmd, XEN_GUES=
T_HANDLE_PARAM(void) arg)
> >      return 0;
> >  }
> > =20
> > +int subpage_mmio_ro_add(
> > +    mfn_t mfn,
> > +    unsigned long offset_s,
> > +    unsigned long offset_e,
>=20
> Since those are page offset, you can likely use unsigned int rather
> than long?
>=20
> I also wonder why not use [paddr_t start, paddr_t end] (or start and
> size) and drop the mfn parameter?  You can certainly get the mfn from
> the full address, and it seems more natural that having the caller
> pass an mfn and two offsets.

That would work for the function parameters indeed, regardless of what's
really stored.

> > +    int fixmap_idx)
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    int rc;
> > +
> > +    ASSERT(rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)));
> > +    ASSERT(offset_s < PAGE_SIZE);
> > +    ASSERT(offset_e < PAGE_SIZE);
> > +
> > +    spin_lock(&subpage_ro_lock);
> > +
> > +    list_for_each_entry( iter, &subpage_ro_ranges, list )
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
> > +    if ( !entry )
> > +    {
> > +        /* iter=3D=3DNULL marks it was a newly allocated entry */
> > +        iter =3D NULL;
> > +        entry =3D xmalloc(struct subpage_ro_range);
> > +        rc =3D -ENOMEM;
> > +        if ( !entry )
> > +            goto err_unlock;
> > +        entry->mfn =3D mfn;
> > +        entry->fixmap_idx =3D fixmap_idx;
> > +        entry->ro_bytes =3D rangeset_new(NULL, "subpage r/o mmio",
> > +                                       RANGESETF_prettyprint_hex);
> > +        rc =3D -ENOMEM;
>=20
> rc will already be -ENOMEM, albeit doing error handling this way is
> tricky...
>=20
> > +        if ( !entry->ro_bytes )
> > +            goto err_unlock;
> > +    }
> > +
> > +    rc =3D rangeset_add_range(entry->ro_bytes, offset_s, offset_e);
> > +    if ( rc < 0 )
> > +        goto err_unlock;
> > +
> > +    if ( !iter )
> > +        list_add_rcu(&entry->list, &subpage_ro_ranges);
> > +
> > +    spin_unlock(&subpage_ro_lock);
> > +
> > +    if ( !iter || entry->fixmap_idx =3D=3D fixmap_idx )
> > +        return 0;
> > +    else
> > +        return 1;
> > +
> > +err_unlock:
> > +    spin_unlock(&subpage_ro_lock);
> > +    if ( !iter )
> > +    {
> > +        if ( entry )
> > +        {
> > +            if ( entry->ro_bytes )
> > +                rangeset_destroy(entry->ro_bytes);
> > +            xfree(entry);
> > +        }
> > +    }
> > +    return rc;
> > +}
> > +
> > +static void subpage_mmio_ro_free(struct rcu_head *rcu)
> > +{
> > +    struct subpage_ro_range *entry =3D container_of(rcu, struct subpag=
e_ro_range, rcu);
> > +
> > +    rangeset_destroy(entry->ro_bytes);
> > +    xfree(entry);
> > +}
> > +
> > +int subpage_mmio_ro_remove(
> > +    mfn_t mfn,
> > +    unsigned long offset_s,
> > +    unsigned long offset_e)
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    int rc;
> > +
> > +    ASSERT(offset_s < PAGE_SIZE);
> > +    ASSERT(offset_e < PAGE_SIZE);
> > +
> > +    spin_lock(&subpage_ro_lock);
> > +
> > +    list_for_each_entry_rcu( iter, &subpage_ro_ranges, list )
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
> > +    rc =3D -ENOENT;
> > +    if ( !entry )
> > +        goto out_unlock;
> > +
> > +    rc =3D rangeset_remove_range(entry->ro_bytes, offset_s, offset_e);
> > +    if ( rc < 0 )
> > +        goto out_unlock;
> > +
> > +    rc =3D 0;
>=20
> You can use `if ( rc ) goto out_unlock;` and that avoids having to
> explicitly set rc to 0.
>=20
> > +
> > +    if ( !rangeset_is_empty(entry->ro_bytes) )
> > +        goto out_unlock;
> > +
> > +    list_del_rcu(&entry->list);
> > +    call_rcu(&entry->rcu, subpage_mmio_ro_free);
> > +
> > +out_unlock:
> > +    spin_unlock(&subpage_ro_lock);
> > +    return rc;
> > +}
> > +
> > +static void subpage_mmio_write_emulate(
> > +    mfn_t mfn,
> > +    unsigned long offset,
> > +    void *data,
> > +    unsigned int len)
> > +{
> > +    struct subpage_ro_range *entry;
>=20
> const.
>=20
> > +    void __iomem *addr;
>=20
> Do we care about the access being aligned?

I don't think Xen cares about it when page is mapped R/W to the guest,
so why should it care when it's partially R/W only?

>=20
> > +
> > +    rcu_read_lock(&subpage_ro_rcu);
> > +
> > +    list_for_each_entry_rcu( entry, &subpage_ro_ranges, list )
> > +    {
> > +        if ( mfn_eq(entry->mfn, mfn) )
> > +        {
>=20
> You need to take the spinlock at this point, since the contents of
> entry->ro_bytes are not protected by the RCU.  The RCU only provides
> safe iteration over the list, but not the content of the elements on
> the list.

mfn is not supposed to change ever on the specific list element, and
IIUC, rangeset does locking itself. Am I missing something?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VITwGu5IVH8xZkDz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQi/n8ACgkQ24/THMrX
1ywMZgf/Rbm1xOs9cGq+cbc+ydJYcLLZBzSd1ME7ROeCEk/zHDLdTr5WzHYRyVK8
VLllYhFoZ3TSL6YyZKuIK4L2bwHfobWDr9GY0FpFGFYeYwjbK6HiQM+Dzlds4Okl
si95Q68NgVEfbKvzB+Q5bJ8t72wbOmwXW11xfgnq7irkvorOhA63zGVNq4uXj6uA
5hBhtJlGRa68wcVeQNV1W1EdNyAF7KVE+GYGTtivqlk5BX1JGh33oghdb2dCQ+w9
7reASicDwoZ6D0f/qOk8Yw8s65t+ouqTtrv7LFA1rROGUkwpKGQUtZmeabCvSeIz
bGwgd8vi5pJ3xc2MYP6YJ9aOySfmiA==
=Vh9f
-----END PGP SIGNATURE-----

--VITwGu5IVH8xZkDz--

