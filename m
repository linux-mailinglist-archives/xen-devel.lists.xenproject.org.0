Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F6903A84
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 13:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738304.1145025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzps-0004RO-1g; Tue, 11 Jun 2024 11:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738304.1145025; Tue, 11 Jun 2024 11:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzpr-0004PI-VG; Tue, 11 Jun 2024 11:38:43 +0000
Received: by outflank-mailman (input) for mailman id 738304;
 Tue, 11 Jun 2024 11:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H2Xh=NN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sGzpp-0004Nx-Vh
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 11:38:42 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25320fa4-27e7-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 13:38:39 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 3639E1140197;
 Tue, 11 Jun 2024 07:38:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 11 Jun 2024 07:38:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 07:38:36 -0400 (EDT)
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
X-Inumbo-ID: 25320fa4-27e7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718105918;
	 x=1718192318; bh=9jk86Gh47kEw/xgU70UqKZayQAMG0fS3Qjj5di27MrM=; b=
	h+NARRE8nOY27f6QsUSgeVOQhUS2r6B7U4Dxm5qBezpzCO5YWNGfDjMA/J/iiltU
	wAus8q0+OlJWovitFE/1Xf6nsXq5a64XWiuztneOgK28pNNrfjEGz4okiiSaz/Ik
	b8o3zvqbicxV0c1lz9rCkxCZYCyvZohdqMwX0Iyl3c2Fow3OX86FReZyPS5ED2Go
	kGsBiYV6GjHNOxO02V2IA/hyB63KqP3Eg8vbcoiW3YDvhfdCCFeMOLJHpIOi5LZI
	4JqpZIg+8kl52OBsUOi45d8g0G4lna9Jqk2E99an3cxyp2LI76ewjs6U48jAAhtk
	UKrIM7oI6TAIEi1gmG5MLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718105918; x=1718192318; bh=9jk86Gh47kEw/xgU70UqKZayQAMG
	0fS3Qjj5di27MrM=; b=b8OAY5Aqca4Eni1QQNp0c2PlWokJ3+GUPHcx/Z14JfIJ
	+8CjRajTT49s69uvrRu7z8G0pb16jfV6eh4K6bB7R+Xthu7Enw8U+zmMYSc7bAuI
	jMZyDksbsQJ+mhqHgsP2t3FlO0LlMW/Nzqc96kg+s3Po1ZUq3a++2dl275GGTSgX
	KfD/H/WqYdpwQ8p5YScviRcD3aHCZzZfjDQJ7Pvl4P1kRKIxQQMO5TPJywSfKo1X
	NbnweeMlso8LdtHUWeIciz1Ao8zAG/23N7JpG0J44SlFAd5iGzb83K/kKrlQPwa+
	RXCEaPkX62TJtamEScjkMR6J3YacIv2s6VbvLkuSOw==
X-ME-Sender: <xms:PTdoZu_z2TPjBX4lUe5hNpU93x0rWy5J5uSVGmqQwBMkYQOCjgAJqA>
    <xme:PTdoZuuyP08BhANmRG0RbUx0lMCgZpS8Wzh-o8iQDEmlLvrdqhIVbsV5y0STw1BFU
    r2o94ESfpMRKA>
X-ME-Received: <xmr:PTdoZkCo4qrVKQFQKqI8P5V-h34NragGlmeSsof5hg27GdaFm_B-YUVFH25zZo52uEldes6y4FOu50iJD-fFgRr63CxVXCZYLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:PTdoZmePjkUXybgNNxMZNEPL1DaDOoW1j1S1sJ2Fs0IUbRbO-9KkWQ>
    <xmx:PTdoZjNdwXNKbfJp2OppJCgfFk37zSO4kFgxSg9LS8QHLQeYj9adRw>
    <xmx:PTdoZgkd-6h4cnUGqNCSKNuWaubrvj_nZmQBTCNIrj-NpDwFsCPQzA>
    <xmx:PTdoZlsE65NtsNe1SEQyvMRunci0rpBbDpphY1kRwuV0liyqUNtAsg>
    <xmx:PjdoZsq6XG4OTVbVQAyI3ppl9eMplRdUOegDr4Oy9ArlHVZwu1OZiRqK>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 11 Jun 2024 13:38:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zmg3O7zvd9KBC1Fv@mail-itl>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
 <ZmgpsZJ4afLd1Fc3@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UvpSW2j5ZN71EM0u"
Content-Disposition: inline
In-Reply-To: <ZmgpsZJ4afLd1Fc3@macbook>


--UvpSW2j5ZN71EM0u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Jun 2024 13:38:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Tue, Jun 11, 2024 at 12:40:49PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 22, 2024 at 05:39:03PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > In some cases, only few registers on a page needs to be write-protected.
> > Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> > PBA table (which doesn't need to span the whole table either), although
> > in the latter case the spec forbids placing other registers on the same
> > page. Current API allows only marking whole pages pages read-only,
> > which sometimes may cover other registers that guest may need to
> > write into.
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
> > sub-page permissions are not a thing in page tables (they are in EPT,
> > but not granular enough), do this via emulation (or simply page fault
> > handler for PV) that handles writes that are supposed to be allowed.
> > The new subpage_mmio_ro_add() takes a start physical address and the
> > region size in bytes. Both start address and the size need to be 8-byte
> > aligned, as a practical simplification (allows using smaller bitmask,
> > and a smaller granularity isn't really necessary right now).
> > It will internally add relevant pages to mmio_ro_ranges, but if either
> > start or end address is not page-aligned, it additionally adds that page
> > to a list for sub-page R/O handling. The list holds a bitmask which
> > qwords are supposed to be read-only and an address where page is mapped
> > for write emulation - this mapping is done only on the first access. A
> > plain list is used instead of more efficient structure, because there
> > isn't supposed to be many pages needing this precise r/o control.
> >=20
> > The mechanism this API is plugged in is slightly different for PV and
> > HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> > it's already called for #PF on read-only MMIO page. For HVM however, EPT
> > violation on p2m_mmio_direct page results in a direct domain_crash() for
> > non hardware domains.  To reach mmio_ro_emulated_write(), change how
> > write violations for p2m_mmio_direct are handled - specifically, check
> > if they relate to such partially protected page via
> > subpage_mmio_write_accept() and if so, call hvm_emulate_one_mmio() for
> > them too. This decodes what guest is trying write and finally calls
> > mmio_ro_emulated_write(). The EPT write violation is detected as
> > npfec.write_access and npfec.present both being true (similar to other
> > places), which may cover some other (future?) cases - if that happens,
> > emulator might get involved unnecessarily, but since it's limited to
> > pages marked with subpage_mmio_ro_add() only, the impact is minimal.
> > Both of those paths need an MFN to which guest tried to write (to check
> > which part of the page is supposed to be read-only, and where
> > the page is mapped for writes). This information currently isn't
> > available directly in mmio_ro_emulated_write(), but in both cases it is
> > already resolved somewhere higher in the call tree. Pass it down to
> > mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.
> >=20
> > This may give a bit more access to the instruction emulator to HVM
> > guests (the change in hvm_hap_nested_page_fault()), but only for pages
> > explicitly marked with subpage_mmio_ro_add() - so, if the guest has a
> > passed through a device partially used by Xen.
> > As of the next patch, it applies only configuration explicitly
> > documented as not security supported.
> >=20
> > The subpage_mmio_ro_add() function cannot be called with overlapping
> > ranges, and on pages already added to mmio_ro_ranges separately.
> > Successful calls would result in correct handling, but error paths may
> > result in incorrect state (like pages removed from mmio_ro_ranges too
> > early). Debug build has asserts for relevant cases.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Shadow mode is not tested, but I don't expect it to work differently th=
an
> > HAP in areas related to this patch.
> >=20
> > Changes in v4:
> > - rename SUBPAGE_MMIO_RO_ALIGN to MMIO_RO_SUBPAGE_GRAN
> > - guard subpage_mmio_write_accept with CONFIG_HVM, as it's used only
> >   there
> > - rename ro_qwords to ro_elems
> > - use unsigned arguments for subpage_mmio_ro_remove_page()
> > - use volatile for __iomem
> > - do not set mmio_ro_ctxt.mfn for mmcfg case
> > - comment where fields of mmio_ro_ctxt are used
> > - use bool for result of __test_and_set_bit
> > - do not open-code mfn_to_maddr()
> > - remove leftover RCU
> > - mention hvm_hap_nested_page_fault() explicitly in the commit message
> > Changes in v3:
> > - use unsigned int for loop iterators
> > - use __set_bit/__clear_bit when under spinlock
> > - avoid ioremap() under spinlock
> > - do not cast away const
> > - handle unaligned parameters in release build
> > - comment fixes
> > - remove RCU - the add functions are __init and actual usage is only
> >   much later after domains are running
> > - add checks overlapping ranges in debug build and document the
> >   limitations
> > - change subpage_mmio_ro_add() so the error path doesn't potentially
> >   remove pages from mmio_ro_ranges
> > - move printing message to avoid one goto in
> >   subpage_mmio_write_emulate()
> > Changes in v2:
> > - Simplify subpage_mmio_ro_add() parameters
> > - add to mmio_ro_ranges from within subpage_mmio_ro_add()
> > - use ioremap() instead of caller-provided fixmap
> > - use 8-bytes granularity (largest supported single write) and a bitmap
> >   instead of a rangeset
> > - clarify commit message
> > - change how it's plugged in for HVM domain, to not change the behavior=
 for
> >   read-only parts (keep it hitting domain_crash(), instead of ignoring
> >   write)
> > - remove unused subpage_mmio_ro_remove()
> > ---
> >  xen/arch/x86/hvm/emulate.c      |   2 +-
> >  xen/arch/x86/hvm/hvm.c          |   4 +-
> >  xen/arch/x86/include/asm/mm.h   |  25 +++-
> >  xen/arch/x86/mm.c               | 273 ++++++++++++++++++++++++++++++++=
+-
> >  xen/arch/x86/pv/ro-page-fault.c |   6 +-
> >  5 files changed, 305 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> > index ab1bc516839a..e98513afc69b 100644
> > --- a/xen/arch/x86/hvm/emulate.c
> > +++ b/xen/arch/x86/hvm/emulate.c
> > @@ -2735,7 +2735,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsig=
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
> > index 9594e0a5c530..73bbfe2bdc99 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -2001,8 +2001,8 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsign=
ed long gla,
> >          goto out_put_gfn;
> >      }
> > =20
> > -    if ( (p2mt =3D=3D p2m_mmio_direct) && is_hardware_domain(currd) &&
> > -         npfec.write_access && npfec.present &&
> > +    if ( (p2mt =3D=3D p2m_mmio_direct) && npfec.write_access && npfec.=
present &&
> > +         (is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, =
gla)) &&
> >           (hvm_emulate_one_mmio(mfn_x(mfn), gla) =3D=3D X86EMUL_OKAY) )
> >      {
> >          rc =3D 1;
> > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/m=
m.h
> > index 98b66edaca5e..d04cf2c4165e 100644
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -522,9 +522,34 @@ extern struct rangeset *mmio_ro_ranges;
> >  void memguard_guard_stack(void *p);
> >  void memguard_unguard_stack(void *p);
> > =20
> > +/*
> > + * Add more precise r/o marking for a MMIO page. Range specified here
> > + * will still be R/O, but the rest of the page (not marked as R/O via =
another
> > + * call) will have writes passed through.
> > + * The start address and the size must be aligned to MMIO_RO_SUBPAGE_G=
RAN.
> > + *
> > + * This API cannot be used for overlapping ranges, nor for pages alrea=
dy added
> > + * to mmio_ro_ranges separately.
> > + *
> > + * Since there is currently no subpage_mmio_ro_remove(), relevant devi=
ce should
> > + * not be hot-unplugged.
> > + *
> > + * Return values:
> > + *  - negative: error
> > + *  - 0: success
> > + */
> > +#define MMIO_RO_SUBPAGE_GRAN 8
> > +int subpage_mmio_ro_add(paddr_t start, size_t size);
> > +#ifdef CONFIG_HVM
> > +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla);
> > +#endif
> > +
> >  struct mmio_ro_emulate_ctxt {
> >          unsigned long cr2;
> > +        /* Used only for mmcfg case */
> >          unsigned int seg, bdf;
> > +        /* Used only for non-mmcfg case */
> > +        mfn_t mfn;
> >  };
> > =20
> >  int cf_check mmio_ro_emulated_write(
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index d968bbbc7315..dab7cc018c3f 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -150,6 +150,17 @@ bool __read_mostly machine_to_phys_mapping_valid;
> > =20
> >  struct rangeset *__read_mostly mmio_ro_ranges;
> > =20
> > +/* Handling sub-page read-only MMIO regions */
> > +struct subpage_ro_range {
> > +    struct list_head list;
> > +    mfn_t mfn;
> > +    void __iomem *mapped;
> > +    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
> > +};
> > +
> > +static LIST_HEAD(subpage_ro_ranges);
> > +static DEFINE_SPINLOCK(subpage_ro_lock);
> > +
> >  static uint32_t base_disallow_mask;
> >  /* Global bit is allowed to be set on L1 PTEs. Intended for user mappi=
ngs. */
> >  #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE=
_GLOBAL)
> > @@ -4910,6 +4921,265 @@ long arch_memory_op(unsigned long cmd, XEN_GUES=
T_HANDLE_PARAM(void) arg)
> >      return rc;
> >  }
> > =20
> > +/*
> > + * Mark part of the page as R/O.
> > + * Returns:
> > + * - 0 on success - first range in the page
> > + * - 1 on success - subsequent range in the page
> > + * - <0 on error
> > + *
> > + * This needs subpage_ro_lock already taken.
> > + */
> > +static int __init subpage_mmio_ro_add_page(
> > +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
>=20
> Nit: parameters here seem to be indented differently than below.
>=20
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    unsigned int i;
> > +
> > +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
>=20
> AFAICT you could put the search logic into a separate function and use
> it here, plus in subpage_mmio_ro_remove_page(),
> subpage_mmio_write_emulate() and subpage_mmio_write_accept() possibly.

Good idea.

> > +    if ( !entry )
> > +    {
> > +        /* iter =3D=3D NULL marks it was a newly allocated entry */
> > +        iter =3D NULL;
> > +        entry =3D xzalloc(struct subpage_ro_range);
> > +        if ( !entry )
> > +            return -ENOMEM;
> > +        entry->mfn =3D mfn;
> > +    }
> > +
> > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D MMIO_RO_SUBPAGE_GRAN=
 )
> > +    {
> > +        bool oldbit =3D __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
> > +                                        entry->ro_elems);
> > +        ASSERT(!oldbit);
> > +    }
> > +
> > +    if ( !iter )
> > +        list_add(&entry->list, &subpage_ro_ranges);
> > +
> > +    return iter ? 1 : 0;
> > +}
> > +
> > +/* This needs subpage_ro_lock already taken */
> > +static void __init subpage_mmio_ro_remove_page(
> > +    mfn_t mfn,
> > +    unsigned int offset_s,
> > +    unsigned int offset_e)
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    unsigned int i;
> > +
> > +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
> > +    if ( !entry )
> > +        return;
> > +
> > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D MMIO_RO_SUBPAGE_GRAN=
 )
> > +        __clear_bit(i / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems);
> > +
> > +    if ( !bitmap_empty(entry->ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GR=
AN) )
> > +        return;
> > +
> > +    list_del(&entry->list);
> > +    if ( entry->mapped )
> > +        iounmap(entry->mapped);
> > +    xfree(entry);
> > +}
> > +
> > +int __init subpage_mmio_ro_add(
> > +    paddr_t start,
> > +    size_t size)
> > +{
> > +    mfn_t mfn_start =3D maddr_to_mfn(start);
> > +    paddr_t end =3D start + size - 1;
> > +    mfn_t mfn_end =3D maddr_to_mfn(end);
> > +    unsigned int offset_end =3D 0;
> > +    int rc;
> > +    bool subpage_start, subpage_end;
> > +
> > +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> > +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> > +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> > +        size =3D ROUNDUP(size, MMIO_RO_SUBPAGE_GRAN);
> > +
> > +    if ( !size )
> > +        return 0;
> > +
> > +    if ( mfn_eq(mfn_start, mfn_end) )
> > +    {
> > +        /* Both starting and ending parts handled at once */
> > +        subpage_start =3D PAGE_OFFSET(start) || PAGE_OFFSET(end) !=3D =
PAGE_SIZE - 1;
> > +        subpage_end =3D false;
>=20
> Given the intended usage of this, don't we want to limit to only a
> single page?  So that PFN_DOWN(start + size) =3D=3D PFN_DOWN/(start), as
> that would simplify the logic here?

I have considered that, but I haven't found anything in the spec
mandating the XHCI DbC registers to not cross page boundary. Currently
(on a system I test this on) they don't cross page boundary, but I don't
want to assume extra constrains - to avoid issues like before (when
on the older system I tested the DbC registers didn't shared page with
other registers, but then they shared the page on a newer hardware).

> Mostly asking because I think for the usage of XHCI the registers that
> need to be marked RO are all inside the same page, and hence would
> like to avoid introducing logic to handle multipage ranges if that's
> not tested at all.
>=20
> > +    }
> > +    else
> > +    {
> > +        subpage_start =3D PAGE_OFFSET(start);
> > +        subpage_end =3D PAGE_OFFSET(end) !=3D PAGE_SIZE - 1;
> > +    }
> > +
> > +    spin_lock(&subpage_ro_lock);
>=20
> Do you really need the lock if modifications can only happen during
> init?  Xen initialization is single threaded, so you can likely avoid
> the lock during boot.

With adding (and removing) firmly tied to init (via __ro_after_init), I
think I'm okay with dropping the spinlock here. Yet, it's still needed
for mapping the page.

> > +
> > +    if ( subpage_start )
> > +    {
> > +        offset_end =3D mfn_eq(mfn_start, mfn_end) ?
> > +                     PAGE_OFFSET(end) :
> > +                     (PAGE_SIZE - 1);
> > +        rc =3D subpage_mmio_ro_add_page(mfn_start,
> > +                                      PAGE_OFFSET(start),
> > +                                      offset_end);
> > +        if ( rc < 0 )
> > +            goto err_unlock;
> > +        /* Check if not marking R/W part of a page intended to be full=
y R/O */
> > +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> > +                                                  mfn_x(mfn_start)));
>=20
> I think it would be better if this check was done ahead, and an error
> was returned.  I see no point in delaying the check until the region
> has already been registered.

I need return value from subpage_mmio_ro_add_page() for this check,
because currently it's okay to mark further regions read-only (at which
point the page is already on mmio_ro_ranges). Theoretically I could
probably limit the scope of this API even further - to just one R/O
region per page, but even in the XHCI driver, I can imagine needing
marking more regions (which might share a page, depending on hardware
layout) in some future version that could gain some more features.

> > +    }
> > +
> > +    if ( subpage_end )
> > +    {
> > +        rc =3D subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
> > +        if ( rc < 0 )
> > +            goto err_unlock_remove;
> > +        /* Check if not marking R/W part of a page intended to be full=
y R/O */
> > +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> > +                                                  mfn_x(mfn_end)));
> > +    }
> > +
> > +    spin_unlock(&subpage_ro_lock);
> > +
> > +    rc =3D rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(=
mfn_end));
> > +    if ( rc )
> > +        goto err_remove;
> > +
> > +    return 0;
> > +
> > + err_remove:
> > +    spin_lock(&subpage_ro_lock);
> > +    if ( subpage_end )
> > +        subpage_mmio_ro_remove_page(mfn_end, 0, PAGE_OFFSET(end));
> > + err_unlock_remove:
> > +    if ( subpage_start )
> > +        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), off=
set_end);
> > + err_unlock:
> > +    spin_unlock(&subpage_ro_lock);
> > +    return rc;
> > +}
> > +
> > +static void __iomem *subpage_mmio_map_page(
> > +    struct subpage_ro_range *entry)
> > +{
> > +    void __iomem *mapped_page;
> > +
> > +    if ( entry->mapped )
> > +        return entry->mapped;
> > +
> > +    mapped_page =3D ioremap(mfn_to_maddr(entry->mfn), PAGE_SIZE);
> > +
> > +    spin_lock(&subpage_ro_lock);
> > +    /* Re-check under the lock */
> > +    if ( entry->mapped )
> > +    {
> > +        spin_unlock(&subpage_ro_lock);
> > +        if ( mapped_page )
> > +            iounmap(mapped_page);
> > +        return entry->mapped;
> > +    }
> > +
> > +    entry->mapped =3D mapped_page;
> > +    spin_unlock(&subpage_ro_lock);
> > +    return entry->mapped;
> > +}
> > +
> > +static void subpage_mmio_write_emulate(
> > +    mfn_t mfn,
> > +    unsigned int offset,
> > +    const void *data,
> > +    unsigned int len)
> > +{
> > +    struct subpage_ro_range *entry;
> > +    volatile void __iomem *addr;
> > +
> > +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(entry->mfn, mfn) )
> > +        {
> > +            if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_ele=
ms) )
> > +            {
> > + write_ignored:
> > +                gprintk(XENLOG_WARNING,
> > +                        "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x l=
en %u\n",
> > +                        mfn_x(mfn), offset, len);
> > +                return;
> > +            }
> > +
> > +            addr =3D subpage_mmio_map_page(entry);
>=20
> Given the very limited usage of this subpage RO infrastructure, I
> would be tempted to just map the mfn when the page is registered, in
> order to simplify the logic here.  The only use-case we have is XHCI,
> and further usage of this are likely to be limited to similar hardware
> that's shared between Xen and the hardware domain.

In an earlier similar series (which was about 1 or 2 pages in practice
per device) Jan requested doing lazy mapping, so I did it similar in
this series too.

> > +            if ( !addr )
> > +            {
> > +                gprintk(XENLOG_ERR,
> > +                        "Failed to map page for MMIO write at 0x%"PRI_=
mfn"%03x\n",
> > +                        mfn_x(mfn), offset);
> > +                return;
> > +            }
> > +
> > +            switch ( len )
> > +            {
> > +            case 1:
> > +                writeb(*(const uint8_t*)data, addr);
> > +                break;
> > +            case 2:
> > +                writew(*(const uint16_t*)data, addr);
> > +                break;
> > +            case 4:
> > +                writel(*(const uint32_t*)data, addr);
> > +                break;
> > +            case 8:
> > +                writeq(*(const uint64_t*)data, addr);
> > +                break;
> > +            default:
> > +                /* mmio_ro_emulated_write() already validated the size=
 */
> > +                ASSERT_UNREACHABLE();
> > +                goto write_ignored;
> > +            }
> > +            return;
> > +        }
> > +    }
> > +    /* Do not print message for pages without any writable parts. */
> > +}
> > +
> > +#ifdef CONFIG_HVM
> > +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> > +{
> > +    unsigned int offset =3D PAGE_OFFSET(gla);
> > +    const struct subpage_ro_range *entry;
> > +
> > +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> > +        if ( mfn_eq(entry->mfn, mfn) &&
> > +             !test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems)=
 )
> > +        {
> > +            /*
> > +             * We don't know the write size at this point yet, so it c=
ould be
> > +             * an unaligned write, but accept it here anyway and deal =
with it
> > +             * later.
> > +             */
> > +            return true;
>=20
> For accesses that fall into the RO region, I think you need to accept
> them here and just terminate them?  I see no point in propagating
> them further in hvm_hap_nested_page_fault().

If write hits an R/O region on a page with some writable regions the
handling should be the same as it would be just on the mmio_ro_ranges.
This is what the patch does.
There may be an opportunity to simplify mmio_ro_ranges handling
somewhere, but I don't think it belongs to this patch.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UvpSW2j5ZN71EM0u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZoNzsACgkQ24/THMrX
1yzN6Af/enoXpilNZ3xO0MWSlmNKlRMB6DV9nrG6Cq01f9aYzghws9gffLSA11gR
v82kVJbl+epSMDmxqCAAKK4UCvTlvADY/R8iqUko2sYktVVLb65js0T8lrmw3pLV
zejBpRIOvGFiWUCVQAwb3Uc9ZpwE39+QRW2EfsO8JonNFjTjiDM+fg9lFwHoEZlr
TvUnlTjpwnuFqzS9hJxYy6HpZ4FIsTSxu/JJeh/GsSRQfsr0cnHWMkyGEBXh28aW
JVNhk1mgvbVjLmLa5SGeSBkbzXSOAkybjCr3snPedk8mNtiokVrGiMwXtrHfRmwh
yS4wHltWmiuc8foRXXNfxa5JzSSmkA==
=/xei
-----END PGP SIGNATURE-----

--UvpSW2j5ZN71EM0u--

