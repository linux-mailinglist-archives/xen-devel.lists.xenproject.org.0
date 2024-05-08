Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA638C0696
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 23:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718993.1121605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4pDE-0001LM-W5; Wed, 08 May 2024 21:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718993.1121605; Wed, 08 May 2024 21:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4pDE-0001JB-SH; Wed, 08 May 2024 21:52:32 +0000
Received: by outflank-mailman (input) for mailman id 718993;
 Wed, 08 May 2024 21:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEwc=ML=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4pDC-0001Iz-Qo
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 21:52:31 +0000
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 410a3226-0d85-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 23:52:27 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id 105A21C0010D;
 Wed,  8 May 2024 17:52:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 08 May 2024 17:52:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 17:52:21 -0400 (EDT)
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
X-Inumbo-ID: 410a3226-0d85-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1715205142;
	 x=1715291542; bh=EhhU/8hFj1pYY+xpTRYiDtTgGET1KkwtT2kVDMcQm0A=; b=
	lYKZWkYmyVuhwoFvAJzm3zvM0L6k7Fz+Wb8qDNKIXfOJ9JFR2nlAHNI6PXilTHcv
	4lDFRuObmhRQnC/HslsGuFK++V33UILAV1jZRvDrq3Rww9ZknVKmh02iiGhGpzBB
	+dmUb019KPNyJ9hRLQ8KowprsyXwrSnwWPj8HMfsNH+4misK5nKcvTB2MVlcb0fH
	POCHkpTb37xxn01y0oP0Spk3WcHKHaobmgi0r0Nt1b1xD39Uag/FMqzauBDYfbnR
	hBpa6sN5ZP3bdBgT1Og3OcNiJ3MKOjOY5jDiXx/8rTfnsNvpfB3DFIwnVaH7qhQC
	ryeVMQOFEiA6ULG0jY3g2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715205142; x=1715291542; bh=EhhU/8hFj1pYY+xpTRYiDtTgGET1
	KkwtT2kVDMcQm0A=; b=WOS4I+hEhwTyX5b9o0+l0Su/Q12ibU70aljgHgjkRM3y
	XEbtRBNUk8aaRfQrj7OG3d6Xdsr4eolllRZ9s0HXU9r6EZ7rdXNixqvbhOjsOPpW
	8y5GekiNXO1LY5ga+y3UtJ9B2TElX+H88fsfSe/L/PfpyAxqT3+Xttnwuk9wPWOF
	+jsrolFKzLfTMyozKlp0Rm7ObVAYy3w69b3D8SyAp1Aj+0ZAbvQCUogYuIPwGJXl
	sPUF6ofA4CvkMw4OiWffc6sAmZx4LAlz8/evtwe7CBWdCDcZUcVvFOdhgW1v5ufG
	HJTQXg3AuS88Xiy5WQiZKf+m2uTZLy/UN68Qi6Yv3Q==
X-ME-Sender: <xms:FvQ7Zu-cZuFyVnvj2w9GgVIexAt2coN6c35oyc1Zkb3NqKIBiFm8zw>
    <xme:FvQ7Zuun-V_LzMPDGlOiX0QamUjmuadttXqIFueqwFEEHLJ8zO_kvVKIeW9Den0BG
    DqnTMlvCoOSqw>
X-ME-Received: <xmr:FvQ7ZkD5LbiEp4lAy6Vl8G8szQKJr_BqlxkCj_UNnxULFbuGTRMe-R_OicHXVbwr7vYrigxUw1WHHAv6BOsAyTMkX3xmUQVDhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefuddgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieff
    tdfgvefgkeehffekffduiedtfefhhffgvdfhgfeugfffffegleekveeiueffnecuffhomh
    grihhnpehmshhigihtsghlpghlihhsthdrnhgvgihtnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FvQ7ZmcMZkUMM1bUIIccUa8ND3vuYOLOqgP_U0QBGqSbiL0kCHiyqA>
    <xmx:FvQ7ZjOWzzjwgf8bF2A77zNymeHO6rMLhKTn9I2oo8x32tzdXWThVQ>
    <xmx:FvQ7ZgliP-PGtxxv3Dplq-2AwZp4nuwEAHwAzzxwZ2bQX5WZuNUiDQ>
    <xmx:FvQ7Zltl-lQR1T3SAOMLFRtEpsi9togG8BTzKqr0yTH6ZRhTOUj0Aw>
    <xmx:FvQ7ZsqfBFHyoQ6xLGSEg2uS5suueoGCGcZcfVX7yLtBT5OxQIIAc-Jj>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 8 May 2024 23:52:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <Zjv0Ea3hQyzFwpmc@mail-itl>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
 <da180c8419882dc068512b69c6c7ad3ff3343fe0.1715085837.git-series.marmarek@invisiblethingslab.com>
 <ZjujzCnAfHye_eIp@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Je8spFxkYQg5lGsn"
Content-Disposition: inline
In-Reply-To: <ZjujzCnAfHye_eIp@macbook>


--Je8spFxkYQg5lGsn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 May 2024 23:52:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table

On Wed, May 08, 2024 at 06:09:48PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 07, 2024 at 02:44:02PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> > on the same page as MSI-X table. Device model (especially one in
> > stubdomain) cannot really handle those, as direct writes to that page is
> > refused (page is on the mmio_ro_ranges list). Instead, extend
> > msixtbl_mmio_ops to handle such accesses too.
> >=20
> > Doing this, requires correlating read/write location with guest
> > MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> > it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> > for PV would need to be done separately.
> >=20
> > This will be also used to read Pending Bit Array, if it lives on the sa=
me
> > page, making QEMU not needing /dev/mem access at all (especially helpful
> > with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> > map it to the guest directly.
> > If PBA lives on the same page, discard writes and log a message.
> > Technically, writes outside of PBA could be allowed, but at this moment
> > the precise location of PBA isn't saved, and also no known device abuses
> > the spec in this way (at least yet).
> >=20
> > To access those registers, msixtbl_mmio_ops need the relevant page
> > mapped. MSI handling already has infrastructure for that, using fixmap,
> > so try to map first/last page of the MSI-X table (if necessary) and save
> > their fixmap indexes. Note that msix_get_fixmap() does reference
> > counting and reuses existing mapping, so just call it directly, even if
> > the page was mapped before. Also, it uses a specific range of fixmap
> > indexes which doesn't include 0, so use 0 as default ("not mapped")
> > value - which simplifies code a bit.
> >=20
> > Based on assumption that all MSI-X page accesses are handled by Xen, do
> > not forward adjacent accesses to other hypothetical ioreq servers, even
> > if the access wasn't handled for some reason (failure to map pages etc).
> > Relevant places log a message about that already.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Thanks, just a couple of minor comments, I think the only relevant one
> is that you can drop ADJACENT_DONT_HANDLE unless there's something
> I'm missing.  The rest are mostly cosmetic, but if you have to respin
> and agree with them might be worth addressing.
>=20
> Sorry for giving this feedback so late in the process, I should have
> attempted to review earlier versions.
>=20
> > ---
> > Changes in v7:
> > - simplify logic based on assumption that all access to MSI-X pages are
> >   handled by Xen (Roger)
> > - move calling adjacent_handle() into adjacent_{read,write}() (Roger)
> > - move range check into msixtbl_addr_to_desc() (Roger)
> > - fix off-by-one when initializing adj_access_idx[ADJ_IDX_LAST] (Roger)
> > - no longer distinguish between unhandled write due to PBA nearby and
> >   other reasons
> > - add missing break after ASSERT_UNREACHABLE (Jan)
> > Changes in v6:
> > - use MSIX_CHECK_WARN macro
> > - extend assert on fixmap_idx
> > - add break in default label, after ASSERT_UNREACHABLE(), and move
> >   setting default there
> > - style fixes
> > Changes in v5:
> > - style fixes
> > - include GCC version in the commit message
> > - warn only once (per domain, per device) about failed adjacent access
> > Changes in v4:
> > - drop same_page parameter of msixtbl_find_entry(), distinguish two
> >   cases in relevant callers
> > - rename adj_access_table_idx to adj_access_idx
> > - code style fixes
> > - drop alignment check in adjacent_{read,write}() - all callers already
> >   have it earlier
> > - delay mapping first/last MSI-X pages until preparing device for a
> >   passthrough
> > v3:
> >  - merge handling into msixtbl_mmio_ops
> >  - extend commit message
> > v2:
> >  - adjust commit message
> >  - pass struct domain to msixtbl_page_handler_get_hwaddr()
> >  - reduce local variables used only once
> >  - log a warning if write is forbidden if MSI-X and PBA lives on the sa=
me
> >    page
> >  - do not passthrough unaligned accesses
> >  - handle accesses both before and after MSI-X table
> > ---
> >  xen/arch/x86/hvm/vmsi.c        | 205 ++++++++++++++++++++++++++++++++--
> >  xen/arch/x86/include/asm/msi.h |   5 +-
> >  xen/arch/x86/msi.c             |  42 +++++++-
> >  3 files changed, 242 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> > index 999917983789..f7b7b4998b5e 100644
> > --- a/xen/arch/x86/hvm/vmsi.c
> > +++ b/xen/arch/x86/hvm/vmsi.c
> > @@ -180,6 +180,10 @@ static bool msixtbl_initialised(const struct domai=
n *d)
> >      return d->arch.hvm.msixtbl_list.next;
> >  }
> > =20
> > +/*
> > + * Lookup an msixtbl_entry on the same page as given addr. It's up to =
the
> > + * caller to check if address is strictly part of the table - if relev=
ant.
> > + */
> >  static struct msixtbl_entry *msixtbl_find_entry(
> >      struct vcpu *v, unsigned long addr)
> >  {
> > @@ -187,8 +191,8 @@ static struct msixtbl_entry *msixtbl_find_entry(
> >      struct domain *d =3D v->domain;
> > =20
> >      list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> > -        if ( addr >=3D entry->gtable &&
> > -             addr < entry->gtable + entry->table_len )
> > +        if ( PFN_DOWN(addr) >=3D PFN_DOWN(entry->gtable) &&
> > +             PFN_DOWN(addr) <=3D PFN_DOWN(entry->gtable + entry->table=
_len - 1) )
> >              return entry;
> > =20
> >      return NULL;
> > @@ -203,6 +207,10 @@ static struct msi_desc *msixtbl_addr_to_desc(
> >      if ( !entry || !entry->pdev )
> >          return NULL;
> > =20
> > +    if ( addr < entry->gtable ||
> > +         addr >=3D entry->gtable + entry->table_len )
> > +        return NULL;
> > +
> >      nr_entry =3D (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
> > =20
> >      list_for_each_entry( desc, &entry->pdev->msi_list, list )
> > @@ -213,6 +221,152 @@ static struct msi_desc *msixtbl_addr_to_desc(
> >      return NULL;
> >  }
> > =20
> > +/*
> > + * Returns:
> > + *  - ADJACENT_DONT_HANDLE if no handling should be done
> > + *  - a fixmap idx to use for handling
> > + */
> > +#define ADJACENT_DONT_HANDLE UINT_MAX
>=20
> Isn't it fine to just return 0 to signal that the access is not
> handled?
>=20
> fixmap index 0 is reserved anyway (see FIX_RESERVED), so could be used
> for this purpose and then you don't need to introduce
> ADJACENT_DONT_HANDLE?

It was this way before in v2 and you asked me to not use 0 for this
purpose...

> > +static unsigned int adjacent_handle(
> > +    const struct msixtbl_entry *entry, unsigned long addr, bool write)
>=20
> Now that it has been quite pruned, get_adjacent_idx() or some such
> might be more inline with the function logic.

makes sense

>=20
> > +{
> > +    unsigned int adj_type;
> > +    struct arch_msix *msix;
> > +
> > +    if ( !entry || !entry->pdev )
> > +    {
> > +        ASSERT_UNREACHABLE();
> > +        return ADJACENT_DONT_HANDLE;
> > +    }
> > +
> > +    if ( PFN_DOWN(addr) =3D=3D PFN_DOWN(entry->gtable) && addr < entry=
->gtable )
> > +        adj_type =3D ADJ_IDX_FIRST;
> > +    else if ( PFN_DOWN(addr) =3D=3D PFN_DOWN(entry->gtable + entry->ta=
ble_len - 1) &&
> > +              addr >=3D entry->gtable + entry->table_len )
> > +        adj_type =3D ADJ_IDX_LAST;
> > +    else
> > +    {
> > +        /* All callers should already do equivalent range checking. */
> > +        ASSERT_UNREACHABLE();
> > +        return ADJACENT_DONT_HANDLE;
> > +    }
> > +
> > +    msix =3D entry->pdev->msix;
> > +    ASSERT(msix);
>=20
> Since you already do it above, would be best to do:
>=20
> if ( !msix )
> {
>     ASSERT_UNREACHABLE();
>     return 0;
> }

Ok.

> > +
> > +    if ( !msix->adj_access_idx[adj_type] )
> > +    {
> > +        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
> > +                             adjacent_not_initialized) )
> > +            gprintk(XENLOG_WARNING,
> > +                    "Page for adjacent(%d) MSI-X table access not init=
ialized for %pp (addr %#lx, gtable %#lx\n",
>=20
> Do you really need to log an error here?  There's an error already
> printed in msix_capability_init() if the adjacent pages can't be
> mapped.

IMO it's better to keep this message, otherwise it might be pretty hard
to debug not working device - a message buried somewhere on startup
might be hard to correlate with an issue much later.

> > +                    adj_type, &entry->pdev->sbdf, addr, entry->gtable);
> > +        return ADJACENT_DONT_HANDLE;
> > +    }
> > +
> > +    /* If PBA lives on the same page too, discard writes. */
> > +    if ( write &&
> > +         ((adj_type =3D=3D ADJ_IDX_LAST &&
> > +           msix->table.last =3D=3D msix->pba.first) ||
> > +          (adj_type =3D=3D ADJ_IDX_FIRST &&
> > +           msix->table.first =3D=3D msix->pba.last)) )
> > +    {
> > +        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
> > +                             adjacent_pba) )
> > +            gprintk(XENLOG_WARNING,
> > +                    "MSI-X table and PBA of %pp live on the same page,=
 "
> > +                    "writing to other registers there is not implement=
ed\n",
> > +                    &entry->pdev->sbdf);
>=20
> I would usually start those errors with the SBDF, as that makes it
> easier to identify error originating from the same device:
>=20
> "%pp: MSI-X table and PBA share a page, discard write to adjacent memory =
(%#lx)\n",
> &entry->pdev->sbdf, addr

ok

> > +        return ADJACENT_DONT_HANDLE;
> > +    }
> > +
> > +    return msix->adj_access_idx[adj_type];
> > +}
> > +
> > +static int adjacent_read(
> > +    const struct msixtbl_entry *entry,
> > +    paddr_t address, unsigned int len, uint64_t *pval)
> > +{
> > +    const void __iomem *hwaddr;
> > +    unsigned int fixmap_idx;
> > +
>=20
> I would add an ASSERT(IS_ALIGNED(address, len)) (and in
> adjacent_write()) just in case, as otherwise the access could cross a
> page boundary.

ok

> > +    fixmap_idx =3D adjacent_handle(entry, address, false);
> > +
> > +    if ( fixmap_idx =3D=3D ADJACENT_DONT_HANDLE )
> > +    {
> > +        *pval =3D ~0UL;
> > +        return X86EMUL_OKAY;
> > +    }
>=20
> FWIW, I find it safer to unconditionally init *pval =3D ~0UL at the
> start of the function, and then the return here and in the default
> switch statement case can avoid setting it.  It's less easy to return
> without the variable being set.

It was this way in v5, but Jan asked me to move it to only relevant
branch.

> > +    hwaddr =3D fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> > +
> > +    switch ( len )
> > +    {
> > +    case 1:
> > +        *pval =3D readb(hwaddr);
> > +        break;
> > +
> > +    case 2:
> > +        *pval =3D readw(hwaddr);
> > +        break;
> > +
> > +    case 4:
> > +        *pval =3D readl(hwaddr);
> > +        break;
> > +
> > +    case 8:
> > +        *pval =3D readq(hwaddr);
> > +        break;
> > +
> > +    default:
> > +        ASSERT_UNREACHABLE();
> > +        *pval =3D ~0UL;
> > +        break;
>=20
> We should likely move this to some kind of helpers, as it's now
> exactly the same that's done in adjacent_{read,write}() in
> vpci/msix.c (not that you should do it here, just a note).
>=20
> > +    }
> > +
> > +    return X86EMUL_OKAY;
> > +}
> > +
> > +static int adjacent_write(
> > +    const struct msixtbl_entry *entry,
> > +    paddr_t address, unsigned int len, uint64_t val)
> > +{
> > +    void __iomem *hwaddr;
> > +    unsigned int fixmap_idx;
> > +
> > +    fixmap_idx =3D adjacent_handle(entry, address, true);
> > +
> > +    if ( fixmap_idx =3D=3D ADJACENT_DONT_HANDLE )
> > +        return X86EMUL_OKAY;
> > +
> > +    hwaddr =3D fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> > +
> > +    switch ( len )
> > +    {
> > +    case 1:
> > +        writeb(val, hwaddr);
> > +        break;
> > +
> > +    case 2:
> > +        writew(val, hwaddr);
> > +        break;
> > +
> > +    case 4:
> > +        writel(val, hwaddr);
> > +        break;
> > +
> > +    case 8:
> > +        writeq(val, hwaddr);
> > +        break;
> > +
> > +    default:
> > +        ASSERT_UNREACHABLE();
> > +        break;
> > +    }
> > +
> > +    return X86EMUL_OKAY;
> > +}
> > +
> >  static int cf_check msixtbl_read(
> >      const struct hvm_io_handler *handler, uint64_t address, uint32_t l=
en,
> >      uint64_t *pval)
> > @@ -222,7 +376,7 @@ static int cf_check msixtbl_read(
> >      unsigned int nr_entry, index;
> >      int r =3D X86EMUL_UNHANDLEABLE;
> > =20
> > -    if ( (len !=3D 4 && len !=3D 8) || (address & (len - 1)) )
> > +    if ( !IS_ALIGNED(address, len) )
> >          return r;
> > =20
> >      rcu_read_lock(&msixtbl_rcu_lock);
> > @@ -230,6 +384,17 @@ static int cf_check msixtbl_read(
> >      entry =3D msixtbl_find_entry(current, address);
> >      if ( !entry )
> >          goto out;
> > +
> > +    if ( address < entry->gtable ||
> > +         address >=3D entry->gtable + entry->table_len )
> > +    {
> > +        r =3D adjacent_read(entry, address, len, pval);
> > +        goto out;
> > +    }
> > +
> > +    if ( len !=3D 4 && len !=3D 8 )
> > +        goto out;
> > +
> >      offset =3D address & (PCI_MSIX_ENTRY_SIZE - 1);
> > =20
> >      if ( offset !=3D PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
> > @@ -291,6 +456,17 @@ static int msixtbl_write(struct vcpu *v, unsigned =
long address,
> >      entry =3D msixtbl_find_entry(v, address);
> >      if ( !entry )
> >          goto out;
> > +
> > +    if ( address < entry->gtable ||
> > +         address >=3D entry->gtable + entry->table_len )
> > +    {
> > +        r =3D adjacent_write(entry, address, len, val);
> > +        goto out;
> > +    }
> > +
> > +    if ( len !=3D 4 && len !=3D 8 )
> > +        goto out;
> > +
> >      nr_entry =3D array_index_nospec(((address - entry->gtable) /
> >                                     PCI_MSIX_ENTRY_SIZE),
> >                                    MAX_MSIX_TABLE_ENTRIES);
> > @@ -356,8 +532,8 @@ static int cf_check _msixtbl_write(
> >      const struct hvm_io_handler *handler, uint64_t address, uint32_t l=
en,
> >      uint64_t val)
> >  {
> > -    /* Ignore invalid length or unaligned writes. */
> > -    if ( (len !=3D 4 && len !=3D 8) || !IS_ALIGNED(address, len) )
> > +    /* Ignore unaligned writes. */
> > +    if ( !IS_ALIGNED(address, len) )
> >          return X86EMUL_OKAY;
> > =20
> >      /*
> > @@ -374,16 +550,25 @@ static bool cf_check msixtbl_range(
> >  {
> >      struct vcpu *curr =3D current;
> >      unsigned long addr =3D r->addr;
> > -    const struct msi_desc *desc;
> > +    const struct msixtbl_entry *entry;
> > +    bool ret =3D false;
> > =20
> >      ASSERT(r->type =3D=3D IOREQ_TYPE_COPY);
> > =20
> >      rcu_read_lock(&msixtbl_rcu_lock);
> > -    desc =3D msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr=
);
> > +    entry =3D msixtbl_find_entry(curr, addr);
> > +    if ( entry )
> > +    {
> > +        if ( addr < entry->gtable || addr >=3D entry->gtable + entry->=
table_len )
> > +            /* Possibly handle adjacent access. */
> > +            ret =3D true;
> > +        else
> > +            ret =3D msixtbl_addr_to_desc(entry, addr) !=3D NULL;
> > +    }
>=20
> You could probably put all this into a single condition:
>=20
> if ( entry &&
>       /* Adjacent access. */
>      (addr < entry->gtable || addr >=3D entry->gtable + entry->table_len =
||
>       /* Otherwise check if there's a matching msi_desc. */
>       msixtbl_addr_to_desc(entry, addr)) )
>     ret =3D true;
>=20
> That's IMO easier to read by setting ret once only.

Is multi-line "if" mixed with comments really easier to follow?

>=20
> >      rcu_read_unlock(&msixtbl_rcu_lock);
> > =20
> > -    if ( desc )
> > -        return 1;
> > +    if ( ret )
> > +        return ret;
> > =20
> >      if ( r->state =3D=3D STATE_IOREQ_READY && r->dir =3D=3D IOREQ_WRIT=
E )
> >      {
> > @@ -429,7 +614,7 @@ static bool cf_check msixtbl_range(
> >          }
> >      }
> > =20
> > -    return 0;
> > +    return false;
> >  }
> > =20
> >  static const struct hvm_io_ops msixtbl_mmio_ops =3D {
> > diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/=
msi.h
> > index bcfdfd35345d..923b730d48b8 100644
> > --- a/xen/arch/x86/include/asm/msi.h
> > +++ b/xen/arch/x86/include/asm/msi.h
> > @@ -224,6 +224,9 @@ struct arch_msix {
> >      } table, pba;
> >      int table_refcnt[MAX_MSIX_TABLE_PAGES];
> >      int table_idx[MAX_MSIX_TABLE_PAGES];
> > +#define ADJ_IDX_FIRST 0
> > +#define ADJ_IDX_LAST  1
> > +    unsigned int adj_access_idx[2];
> >      spinlock_t table_lock;
> >      bool host_maskall, guest_maskall;
> >      domid_t warned_domid;
> > @@ -231,6 +234,8 @@ struct arch_msix {
> >          uint8_t all;
> >          struct {
> >              bool maskall                   : 1;
> > +            bool adjacent_not_initialized  : 1;
>=20
> Not sure we need that, since we already warn of failure to map at
> initialization time, not sure it's worth also printing another error
> at access time.

See response earlier above.

> > +            bool adjacent_pba              : 1;
> >          };
> >      } warned_kind;
> >  };
> > diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> > index 42c793426da3..87190a88ed5d 100644
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -913,6 +913,37 @@ static int msix_capability_init(struct pci_dev *de=
v,
> >          list_add_tail(&entry->list, &dev->msi_list);
> >          *desc =3D entry;
> >      }
> > +    else
> > +    {
> > +        /*
> > +         * If the MSI-X table doesn't start at the page boundary, map =
the first page for
> > +         * passthrough accesses.
> > +         */
> > +        if ( PAGE_OFFSET(table_paddr) )
> > +        {
> > +            int idx =3D msix_get_fixmap(msix, table_paddr, table_paddr=
);
> > +
> > +            if ( idx > 0 )
> > +                msix->adj_access_idx[ADJ_IDX_FIRST] =3D idx;
> > +            else
> > +                gprintk(XENLOG_ERR, "Failed to map first MSI-X table p=
age: %d\n", idx);
> > +        }
> > +        /*
> > +         * If the MSI-X table doesn't end on the page boundary, map th=
e last page
> > +         * for passthrough accesses.
> > +         */
> > +        if ( PAGE_OFFSET(table_paddr + msix->nr_entries * PCI_MSIX_ENT=
RY_SIZE) )
> > +        {
> > +            uint64_t entry_paddr =3D table_paddr +
> > +                (msix->nr_entries - 1) * PCI_MSIX_ENTRY_SIZE;
> > +            int idx =3D msix_get_fixmap(msix, table_paddr, entry_paddr=
);
> > +
> > +            if ( idx > 0 )
> > +                msix->adj_access_idx[ADJ_IDX_LAST] =3D idx;
> > +            else
> > +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table pa=
ge: %d\n", idx);
>=20
> Could you prefix the messages with the SBDF of the device please?
> It's in the seg, bus, slot, func local variables AFAICT.

Ok (%pp + dev->sbdf).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Je8spFxkYQg5lGsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmY79BEACgkQ24/THMrX
1yxQtAf/QRS8CEzR8iZfvQsjKZ9mcbPIuLF3n05aLlcKbdGiFsHSqzFl5G6D+I0b
7Jz1TwPJlRvhuwBC5uplZRMZVDpvTYSYWLG6gPf7yA4lCSpjPp/joKYMCMYTQFi3
jccHEvkXhYzS4uQCeApa9rTnk8e1SAwDVTiO6zwnviJeZDdaSEaX7wE7HuN/v2PF
9089nmRvH2cd6d/zxrpQhaqX4FePc6bfSGx2nl1C5oTHyYQL0xJWg2dMAcF8SS5g
RZqjYcKaBAWLv7iFfjNJV5/mVI5yXZVxXcV8ukK6ED/5NOYGjpppUaY3RhK1mtp3
+5isYac3rvjgDIbGOU5xzaTWfTArwg==
=kW4n
-----END PGP SIGNATURE-----

--Je8spFxkYQg5lGsn--

