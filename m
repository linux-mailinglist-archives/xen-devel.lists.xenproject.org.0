Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E48BB8FF
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 02:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716753.1118981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s33Zj-0002ZF-SJ; Sat, 04 May 2024 00:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716753.1118981; Sat, 04 May 2024 00:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s33Zj-0002XS-PO; Sat, 04 May 2024 00:48:27 +0000
Received: by outflank-mailman (input) for mailman id 716753;
 Sat, 04 May 2024 00:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjfK=MH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s33Zi-0002XM-3N
 for xen-devel@lists.xenproject.org; Sat, 04 May 2024 00:48:26 +0000
Received: from wfout7-smtp.messagingengine.com
 (wfout7-smtp.messagingengine.com [64.147.123.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5b10ca-09af-11ef-b4bb-af5377834399;
 Sat, 04 May 2024 02:48:22 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id 85E941C00122;
 Fri,  3 May 2024 20:48:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 03 May 2024 20:48:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 May 2024 20:48:14 -0400 (EDT)
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
X-Inumbo-ID: ff5b10ca-09af-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1714783696;
	 x=1714870096; bh=8y9zp+lJs5L2nOx89qV9x4rcjsN+qZDo7GnH7Aoq+28=; b=
	5G65szjPp9UiDoAiqzCSvstriv2UAz1oL1o16gyXMFP7/pFZOBqcn1wWpOMo8/GR
	N3AC9gAdbElNwdUneGP59UOQDfS8gVkuBm0zsqOI0PbUsAPgQnWHRQZutPPE0Y0J
	GmIomaqcsbPdYKE6x3KglLC+dvKNNW4s+kx0RVdJ8+wWctPSuDHitouMIIF5aVbT
	euxBLh3DS0acic8lAZTidZp4vnCQx2kSLuYgMAVXwuriyOzkxgtK49QanZAreYtp
	kQ8hgGd0mcOBoiRBUN33kJ0VlF5nGxMXpxCJEzVGfHvUxfbEvQB+NoU4Cs6TZXay
	3Tneu8w2FDhpoqv0dNXniw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714783696; x=1714870096; bh=8y9zp+lJs5L2nOx89qV9x4rcjsN+
	qZDo7GnH7Aoq+28=; b=PNcYXFSMH9zhgRnvAlZzdinlWoDYUcijPvjBYrpzANYc
	qDw3vN3xhkYUnCCFfTRHQyuNtDViGtJ4P0UOuRAKZ7QCcvjTgqMAHMqZSIVp0MVq
	yjjbQ80GkG9esMZcxX4blZgUUsU3GLBf41uTl+dOM0/o9K3UJKNmnsMoIZIZxjP+
	ZSAdNsMV+ws+Xd+RDwLjbaUJzLOoj6F933i+HrrpicjACLU6h0ssp7Dh7dS7peXq
	NTXp4qwT+Xx1TrtamOWUuY+VormeJz9RLF3ySz/Z4C5p7wfG8D2YA4IEap1FKEjO
	4X111STgRSO0S6KYSG8uMZ+wmvzGrWZAXE2qOC8KIQ==
X-ME-Sender: <xms:z4U1Zo8KzAh8s1YqfdB22bxsSSlxKO4WHrOpJ8_c8hx02CtcoNF4Kw>
    <xme:z4U1ZgsVJxYrKE2YJTadH28LoQ7rA0ieWSqcZ2PUWM1RN5jnqhiTOnsNMk9MDNqwo
    W5Xog6H-oOWgg>
X-ME-Received: <xmr:z4U1ZuAvEHOBSgowyDlJeOq3V2znKmKtbnBySb13Akg3kVuAqVCkdcpegYaaB_bEXeTEeHKHmLOuijrfpY9tTKMZZm50gldR7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvuddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieff
    tdfgvefgkeehffekffduiedtfefhhffgvdfhgfeugfffffegleekveeiueffnecuffhomh
    grihhnpehmshhigihtsghlpghlihhsthdrnhgvgihtnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:z4U1ZocOSzAoOL2OAVYPbW8ms0h4kEdbRzjWsYj_VKRArEL4qWaMvA>
    <xmx:z4U1ZtM9urGL9O_FGN7mJ5iq4E-XcYGVRxSq5JtPEqq0tLrG-AHujw>
    <xmx:z4U1ZimBQnn7-1pe7g0gPuwojqrP2VbNNohDVFTjpTVcjm8vnXlJxA>
    <xmx:z4U1ZvtlxXO6VHXJFLiDUZHczAjqlEb7ZcdY7b3J-O8ejwrTZeHofw>
    <xmx:0IU1ZuqCYPeQzeTfCohhCQAVYxuC_9Jackt9lzNLrJnpV0Hv2pfxTG35>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 4 May 2024 02:48:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <ZjWFzEdJ9wiz2GMI@mail-itl>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
 <a9b04e2224e97a27a127a003e8ccf5edfd4922c7.1714154036.git-series.marmarek@invisiblethingslab.com>
 <ZjShYhUvx694rPEp@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IjZAMjsYod9cGStt"
Content-Disposition: inline
In-Reply-To: <ZjShYhUvx694rPEp@macbook>


--IjZAMjsYod9cGStt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 4 May 2024 02:48:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table

On Fri, May 03, 2024 at 10:33:38AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 26, 2024 at 07:54:00PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> > on the same page as MSI-X table. Device model (especially one in
> > stubdomain) cannot really handle those, as direct writes to that page is
> > refused (page is on the mmio_ro_ranges list). Instead, extend
> > msixtbl_mmio_ops to handle such accesses too.
> >=20
> > Doing this, requires correlating read/write location with guest
> > of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
>   ^ extra 'of'?
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
> > GCC 12.2.1 gets confused about 'desc' variable:
> >=20
> >     arch/x86/hvm/vmsi.c: In function =E2=80=98msixtbl_range=E2=80=99:
> >     arch/x86/hvm/vmsi.c:553:8: error: =E2=80=98desc=E2=80=99 may be use=
d uninitialized [-Werror=3Dmaybe-uninitialized]
> >       553 |     if ( desc )
> >           |        ^
> >     arch/x86/hvm/vmsi.c:537:28: note: =E2=80=98desc=E2=80=99 was declar=
ed here
> >       537 |     const struct msi_desc *desc;
> >           |                            ^~~~
> >=20
> > It's conditional initialization is actually correct (in the case where
> > it isn't initialized, function returns early), but to avoid
> > build failure initialize it explicitly to NULL anyway.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
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
> >  xen/arch/x86/hvm/vmsi.c        | 200 ++++++++++++++++++++++++++++++++--
> >  xen/arch/x86/include/asm/msi.h |   5 +-
> >  xen/arch/x86/msi.c             |  41 +++++++-
> >  3 files changed, 236 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> > index 999917983789..230e3a5dee3f 100644
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
> > @@ -213,6 +217,138 @@ static struct msi_desc *msixtbl_addr_to_desc(
> >      return NULL;
> >  }
> > =20
> > +/*
> > + * Returns:
> > + *  - ADJACENT_DONT_HANDLE if no handling should be done
> > + *  - ADJACENT_DISCARD_WRITE if write should be discarded
> > + *  - a fixmap idx to use for handling
> > + */
> > +#define ADJACENT_DONT_HANDLE UINT_MAX
> > +#define ADJACENT_DISCARD_WRITE (UINT_MAX - 1)
>=20
> I think this could be simpler, there's no need to signal with so fine
> grained detail about the action to be performed.
>=20
> Any adjacent access to the MSI-X table should be handled by the logic
> you are adding, so anything that falls in those ranges should
> terminate here.
>=20
> adjacent_handle() should IMO just return whether the access is
> replayed against the hardware, or if it's just dropped.

The distinction here is to return X86EMUL_OKAY in case of adjacent write
that is ignored because PBA is somewhere near, but X86EMUL_UNHANDLABLE
for other/error cases (like fixmap indices not initialized).
But maybe this distinction doesn't make sense and X86EMUL_UNHANDLABLE is
okay in either case?=20

> > +static unsigned int adjacent_handle(
> > +    const struct msixtbl_entry *entry, unsigned long addr, bool write)
> > +{
> > +    unsigned int adj_type;
> > +    struct arch_msix *msix;
> > +
> > +    if ( !entry || !entry->pdev )
> > +        return ADJACENT_DONT_HANDLE;
> > +
> > +    if ( PFN_DOWN(addr) =3D=3D PFN_DOWN(entry->gtable) && addr < entry=
->gtable )
> > +        adj_type =3D ADJ_IDX_FIRST;
> > +    else if ( PFN_DOWN(addr) =3D=3D PFN_DOWN(entry->gtable + entry->ta=
ble_len - 1) &&
> > +              addr >=3D entry->gtable + entry->table_len )
> > +        adj_type =3D ADJ_IDX_LAST;
> > +    else
> > +        return ADJACENT_DONT_HANDLE;
> > +
> > +    msix =3D entry->pdev->msix;
> > +    ASSERT(msix);
> > +
> > +    if ( !msix->adj_access_idx[adj_type] )
> > +    {
> > +        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
> > +                             adjacent_not_initialized) )
> > +            gprintk(XENLOG_WARNING,
> > +                    "Page for adjacent(%d) MSI-X table access not init=
ialized for %pp (addr %#lx, gtable %#lx\n",
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
> > +        return ADJACENT_DISCARD_WRITE;
> > +    }
> > +
> > +    return msix->adj_access_idx[adj_type];
> > +}
> > +
> > +static int adjacent_read(
> > +    unsigned int fixmap_idx,
> > +    paddr_t address, unsigned int len, uint64_t *pval)
> > +{
> > +    const void __iomem *hwaddr;
> > +
> > +    ASSERT(fixmap_idx <=3D FIX_MSIX_IO_RESERV_END);
> > +
> > +    hwaddr =3D fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
>=20
> IMO adjacent_handle() should be called here (and in adjacent_write()),
> and adjacent_{read,write}() called unconditionally from
> msixtbl_{read,write}() when an access that doesn't fall in the MSI-X
> table is handled.  See comment below in msixtbl_read().

Makes sense.

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
> > +    }
> > +
> > +    return X86EMUL_OKAY;
> > +}
> > +
> > +static int adjacent_write(
> > +    unsigned int fixmap_idx,
> > +    paddr_t address, unsigned int len, uint64_t val)
> > +{
> > +    void __iomem *hwaddr;
> > +
> > +    if ( fixmap_idx =3D=3D ADJACENT_DISCARD_WRITE )
> > +        return X86EMUL_OKAY;
> > +
> > +    ASSERT(fixmap_idx <=3D FIX_MSIX_IO_RESERV_END);
>=20
> Since you check the idx is sane, shouldn't you also assert idx >=3D
> FIX_MSIX_IO_RESERV_BASE?

If moving adjacent_handle() here, I'd simply drop this assert.

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
> > +    }
> > +
> > +    return X86EMUL_OKAY;
> > +}
> > +
> >  static int cf_check msixtbl_read(
> >      const struct hvm_io_handler *handler, uint64_t address, uint32_t l=
en,
> >      uint64_t *pval)
> > @@ -220,9 +356,10 @@ static int cf_check msixtbl_read(
> >      unsigned long offset;
> >      struct msixtbl_entry *entry;
> >      unsigned int nr_entry, index;
> > +    unsigned int adjacent_fixmap;
> >      int r =3D X86EMUL_UNHANDLEABLE;
> > =20
> > -    if ( (len !=3D 4 && len !=3D 8) || (address & (len - 1)) )
> > +    if ( !IS_ALIGNED(address, len) )
> >          return r;
> > =20
> >      rcu_read_lock(&msixtbl_rcu_lock);
> > @@ -230,6 +367,21 @@ static int cf_check msixtbl_read(
> >      entry =3D msixtbl_find_entry(current, address);
> >      if ( !entry )
> >          goto out;
> > +
> > +    adjacent_fixmap =3D adjacent_handle(entry, address, false);
>=20
> This seems overly complicated, but is possible I'm missing some logic.
>=20
> IMO it would seem way less convoluted to simply do:
>=20
> entry =3D msixtbl_find_entry(current, address);
> if ( !entry )
>     goto out;
>=20
> if ( address < entry->gtable ||
>      address >=3D entry->gtable + entry->table_len )
> {
>     adjacent_read(...);
>     goto out;
> }
>=20
> And put all the logic in adjacent_{read,write}() directly rather than
> having both adjacent_{read,write}() plus adjacent_handle() calls here?
>=20
> If the access doesn't fall between the boundaries of the MSI-X table
> it's either going to be a handled adjacent access, or it's going to be
> discarded.

Discarded - should it return X86EMUL_OKAY in that case? Currently it
returns X86EMUL_UNHANDLABLE in case adjacent access isn't handled (for
any reason) either.

> > +    if ( adjacent_fixmap !=3D ADJACENT_DONT_HANDLE )
> > +    {
> > +        r =3D adjacent_read(adjacent_fixmap, address, len, pval);
> > +        goto out;
> > +    }
> > +
> > +    if ( address < entry->gtable ||
> > +         address >=3D entry->gtable + entry->table_len )
> > +        goto out;
> > +
> > +    if ( len !=3D 4 && len !=3D 8 )
> > +        goto out;
> > +
> >      offset =3D address & (PCI_MSIX_ENTRY_SIZE - 1);
> > =20
> >      if ( offset !=3D PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
> > @@ -282,6 +434,7 @@ static int msixtbl_write(struct vcpu *v, unsigned l=
ong address,
> >      int r =3D X86EMUL_UNHANDLEABLE;
> >      unsigned long flags;
> >      struct irq_desc *desc;
> > +    unsigned int adjacent_fixmap;
> > =20
> >      if ( !IS_ALIGNED(address, len) )
> >          return X86EMUL_OKAY;
> > @@ -291,6 +444,21 @@ static int msixtbl_write(struct vcpu *v, unsigned =
long address,
> >      entry =3D msixtbl_find_entry(v, address);
> >      if ( !entry )
> >          goto out;
> > +
> > +    adjacent_fixmap =3D adjacent_handle(entry, address, true);
> > +    if ( adjacent_fixmap !=3D ADJACENT_DONT_HANDLE )
> > +    {
> > +        r =3D adjacent_write(adjacent_fixmap, address, len, val);
> > +        goto out;
> > +    }
> > +
> > +    if ( address < entry->gtable ||
> > +         address >=3D entry->gtable + entry->table_len )
> > +        goto out;
> > +
> > +    if ( len !=3D 4 && len !=3D 8 )
> > +        goto out;
> > +
> >      nr_entry =3D array_index_nospec(((address - entry->gtable) /
> >                                     PCI_MSIX_ENTRY_SIZE),
> >                                    MAX_MSIX_TABLE_ENTRIES);
> > @@ -356,8 +524,8 @@ static int cf_check _msixtbl_write(
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
> > @@ -374,14 +542,22 @@ static bool cf_check msixtbl_range(
> >  {
> >      struct vcpu *curr =3D current;
> >      unsigned long addr =3D r->addr;
> > -    const struct msi_desc *desc;
> > +    const struct msixtbl_entry *entry;
> > +    const struct msi_desc *desc =3D NULL;
> > +    unsigned int adjacent_fixmap;
> > =20
> >      ASSERT(r->type =3D=3D IOREQ_TYPE_COPY);
> > =20
> >      rcu_read_lock(&msixtbl_rcu_lock);
> > -    desc =3D msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr=
);
> > +    entry =3D msixtbl_find_entry(curr, addr);
> > +    adjacent_fixmap =3D adjacent_handle(entry, addr, false);
> > +    if ( adjacent_fixmap =3D=3D ADJACENT_DONT_HANDLE )
> > +        desc =3D msixtbl_addr_to_desc(entry, addr);
>=20
> I'm not sure you need adjacent_handle() here, I would think that any
> address adjacent to the MSI-X table Xen would want to handle
> unconditionally, and hence msixtbl_range() should return true:

I put it here to not duplicate a set of checks for adjacent access. It
isn't only about the range, but also few other case (like if fixmap
indices are set).

> entry =3D msixtbl_find_entry(curr, addr);
> if ( !entry )
>     return 0;
>=20
> if ( addr < entry->gtable || addr >=3D entry->gtable + entry->table_len )
>     /* Possibly handle adjacent access. */
>     return 1;
>=20
> desc =3D msixtbl_find_entry(curr, addr);
> ...
>=20
> (Missing the _unlock calls in the chunk above)
>=20
> There's no other processing that can happen for an adjacent access
> unless it's are handled here.  Otherwise such accesses will be
> discarded anyway?  Hence better short-circuit the MMIO handler search
> earlier.

Can't there be some ioreq server that could theoretically handle them?

> >      rcu_read_unlock(&msixtbl_rcu_lock);
> > =20
> > +    if ( adjacent_fixmap !=3D ADJACENT_DONT_HANDLE )
> > +        return 1;
> > +
> >      if ( desc )
> >          return 1;
> > =20
> > @@ -622,12 +798,16 @@ void msix_write_completion(struct vcpu *v)
> >           v->arch.hvm.hvm_io.msix_snoop_gpa )
> >      {
> >          unsigned int token =3D hvmemul_cache_disable(v);
> > -        const struct msi_desc *desc;
> > +        const struct msi_desc *desc =3D NULL;
> > +        const struct msixtbl_entry *entry;
> >          uint32_t data;
> > =20
> >          rcu_read_lock(&msixtbl_rcu_lock);
> > -        desc =3D msixtbl_addr_to_desc(msixtbl_find_entry(v, snoop_addr=
),
> > -                                    snoop_addr);
> > +        entry =3D msixtbl_find_entry(v, snoop_addr);
> > +        if ( entry &&
> > +             snoop_addr >=3D entry->gtable &&
> > +             snoop_addr < entry->gtable + entry->table_len )
> > +            desc =3D msixtbl_addr_to_desc(entry, snoop_addr);
>=20
> This would be easier if you added the MSI-X table boundary checks in
> msixtbl_addr_to_desc() itself, rather than open-coding here.  That way
> you don't need to modify msix_write_completion() at all.  It also
> makes msixtbl_addr_to_desc() more robust in case it gets called with
> bogus addresses.

Makes sense I think.

> >          rcu_read_unlock(&msixtbl_rcu_lock);
> > =20
> >          if ( desc &&
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
> > +            bool adjacent_pba              : 1;
> >          };
> >      } warned_kind;
> >  };
> > diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> > index 42c793426da3..c77b81896269 100644
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -913,6 +913,36 @@ static int msix_capability_init(struct pci_dev *de=
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
>=20
> This check is correct ....
>=20
> > +        {
> > +            uint64_t entry_paddr =3D table_paddr + msix->nr_entries * =
PCI_MSIX_ENTRY_SIZE;
>=20
> ... however for correctness you want to use msix->nr_entries - 1 here,
> otherwise you are requesting an address that's past the last MSI-X
> table entry, and hence msix_get_fixmap() could refuse to provide an
> idx if it ever does boundary checking.

Ok.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IjZAMjsYod9cGStt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmY1hcwACgkQ24/THMrX
1yxHMgf/TIQoc01q6v4iUJ9JUi/woENjVARQ6ckn1lBk+6zGKFgFxYjSZpJXKRK/
+cBTvD5fZ6L1oWl4Dr50ECyroX5o6gr6tDHNFcrxkthypgi6cUnvCVwGJlJGSGYh
L2qrBGPYKodi3IUxjFn8KlyGfO2ACR7E3oWlVfmnUTiijftw1pX6/j3JbTZBsbQj
/Hq3OCsQ27WVYC3PsEzOYQTwra0IRVof8aq0crH+fkdAJC05frcF08roncHf6dc6
1yZJqCqMhi4MnWpB+ZUdxY4JWjHIOPsQk4EF26iHnbOf8heyf/bOhUVN3sj9kyzz
dpt1SYFXC4MPzj8P9cl/Wccjg7CsSQ==
=JW+V
-----END PGP SIGNATURE-----

--IjZAMjsYod9cGStt--

