Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551896CBE81
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515734.798865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph84s-0008V1-OD; Tue, 28 Mar 2023 12:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515734.798865; Tue, 28 Mar 2023 12:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph84s-0008S3-Kc; Tue, 28 Mar 2023 12:05:26 +0000
Received: by outflank-mailman (input) for mailman id 515734;
 Tue, 28 Mar 2023 12:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B75i=7U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ph84q-0008Rx-Sn
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:05:25 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe639ef-cd60-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 14:05:22 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C2EE5C017E;
 Tue, 28 Mar 2023 08:05:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 28 Mar 2023 08:05:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 08:05:19 -0400 (EDT)
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
X-Inumbo-ID: cfe639ef-cd60-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680005120; x=1680091520; bh=P+bC37AqWrmzlpXX+z6Jx69A2M8fHeNxeHl
	Lq1yNjmE=; b=ltp7sQ8CnBFcVpp7vUmlAbZcLa7C5BAjv8DSGOjDZV8y66Qi0Md
	C17j2uB2h47vBux4oQeSX0I1qEVafzOERzEqiNYicO/MCwPQ7SKLxPwSq/d5yPGR
	iFfTpUs4lqym0IrOV3WioMvT2M6yyj4MowwI4fG4RnjtjAS38rEkMVIzMHA+bfwk
	B5NOezShxByaYyYM37fT0Hrc+5ZOI6vZHcnrdKOkxva0wMnQienewIE6u6dhe1+W
	D1aI9DG6xzNkacuh3ksp/5D4FmsGS1PYNJTKIjWvaI9YnX4OXREN7grGHcYFA5LW
	fghhbOJfRqWOSZ+UsBS2i2XdizUQ9NU4CmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680005120; x=1680091520; bh=P+bC37AqWrmzl
	pXX+z6Jx69A2M8fHeNxeHlLq1yNjmE=; b=FKqf8d+rjZ+8AASwWMVxWLM2A9Lxc
	IUr7FNj5jn+Oz3bxF7P3/VnI9s6wl73r5m0rzVkjktDtPuEGoDUbv5NRDugdaivL
	i8bQHLkNias29e8q23pVgBrCI/USq7ILhuDxgA8/angWVSCw6+hXYO0ICpckHB9s
	RtXAtYK0X4H572OvgKSEukpDrNxhjQ6N0OWf2aCTHgX9QyISND6t1x32uZ3Wn6iA
	DhKV7jZJC/3/Lgq3OQvgkDCJbevRVtBGWnWZwMz/Jx85k8x3TOwl8tQ1+T519Uzf
	IHGmwdhpDDpey9jFyK6vvbOhSkewLzBSlW9WytvCNg80Prs3xseN9Jzbg==
X-ME-Sender: <xms:ANgiZCx5lP9oFvqh5fgJ-ZBoFLkpjm-Zs-pU-u6EoIWjV0sgo8ELfg>
    <xme:ANgiZOQ7m1uNI0pAUKrlCOYWbFB_yJYKhJYz4dEJo6uMhYqTsLGobMELxAM2ORLna
    TGCEiEuJAjWqw>
X-ME-Received: <xmr:ANgiZEWwd17Q699P1fMeon28eS6oujjMbZC5URQY6f9MjPfPQcu4m7q9Fh6f22YZXiiskhS3vnQZj8J4sKy8FfIkKEkEw5Mvw4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ANgiZIh301vreivqZ1gAlUzNnaAoIDQbvei_cTaxIkq0EhGnnp9vZQ>
    <xmx:ANgiZEDZEXQH24rT-Grp0aZkCtI2ysu5oG3VrPk0PFyeMfEvypduQw>
    <xmx:ANgiZJKcr7wzZFDmt2y1nOXzHZkVU4mJTMikJQ7aWvcIU3VBnBaEHA>
    <xmx:ANgiZHNCpJnKXyIzWWU59f0Qfgvt45Y5_6ujLJI0BsVAJPMLRanitg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 28 Mar 2023 14:05:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Message-ID: <ZCLX1qD/FmbF5ulu@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VavojxH82hISeCT6"
Content-Disposition: inline
In-Reply-To: <ZCLNQGXvUBxZbIGS@Air-de-Roger>


--VavojxH82hISeCT6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Mar 2023 14:05:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table

On Tue, Mar 28, 2023 at 01:28:44PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> > on the same page as MSI-X table. Device model (especially one in
> > stubdomain) cannot really handle those, as direct writes to that page is
> > refused (page is on the mmio_ro_ranges list). Instead, add internal ior=
eq
> > server that handle those writes.
> >=20
> > Doing this, requires correlating write location with guest view
> > of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> > it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> > for PV would need to be done separately.
> >=20
> > This can be also used to read Pending Bit Array, if it lives on the same
> > page, making QEMU not needing /dev/mem access at all (especially helpful
> > with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> > map it to the guest directly.
> > If PBA lives on the same page, forbid writes and log a message.
> > Technically, writes outside of PBA could be allowed, but at this moment
> > the precise location of PBA isn't saved.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
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
> >  xen/arch/x86/hvm/vmsi.c        | 154 +++++++++++++++++++++++++++++++++
> >  xen/arch/x86/include/asm/msi.h |   5 ++
> >  xen/arch/x86/msi.c             |  38 ++++++++
> >  3 files changed, 197 insertions(+)
> >=20
> > diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> > index 9c82bf9b4ec2..9293009a4075 100644
> > --- a/xen/arch/x86/hvm/vmsi.c
> > +++ b/xen/arch/x86/hvm/vmsi.c
> > @@ -438,6 +438,152 @@ static const struct hvm_io_ops msixtbl_mmio_ops =
=3D {
> >      .write =3D _msixtbl_write,
> >  };
> > =20
> > +static void __iomem *msixtbl_page_handler_get_hwaddr(
> > +    const struct domain *d,
> > +    uint64_t address,
> > +    bool write)
> > +{
> > +    const struct pci_dev *pdev =3D NULL;
> > +    const struct msixtbl_entry *entry;
> > +    int adj_type;
>=20
> unsigned AFAICT.

Ok.

> > +
> > +    rcu_read_lock(&msixtbl_rcu_lock);
> > +    /*
> > +     * Check if it's on the same page as the end of the MSI-X table, b=
ut
> > +     * outside of the table itself.
> > +     */
> > +    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> > +    {
> > +        if ( PFN_DOWN(address) =3D=3D PFN_DOWN(entry->gtable) &&
> > +             address < entry->gtable )
> > +        {
> > +            adj_type =3D ADJ_IDX_FIRST;
> > +            pdev =3D entry->pdev;
> > +            break;
> > +        }
> > +        if ( PFN_DOWN(address) =3D=3D PFN_DOWN(entry->gtable + entry->=
table_len) &&
>=20
> Should be entry->gtable + entry->table_len - 1, or else you are
> off-by-one.

Ok.

> > +             address >=3D entry->gtable + entry->table_len )
> > +        {
> > +            adj_type =3D ADJ_IDX_LAST;
> > +            pdev =3D entry->pdev;
> > +            break;
> > +        }
> > +    }
> > +    rcu_read_unlock(&msixtbl_rcu_lock);
> > +
> > +    if ( !pdev )
> > +        return NULL;
> > +
> > +    ASSERT(pdev->msix);
> > +
> > +    if ( !pdev->msix->adj_access_table_idx[adj_type] )
> > +    {
> > +        gdprintk(XENLOG_WARNING,
> > +                 "Page for adjacent MSI-X table access not initialized=
 for %pp\n",
> > +                 pdev);
> > +
> > +        return NULL;
> > +    }
> > +
> > +    /* If PBA lives on the same page too, forbid writes. */
> > +    if ( write && (
> > +        (adj_type =3D=3D ADJ_IDX_LAST &&
> > +         pdev->msix->table.last =3D=3D pdev->msix->pba.first) ||
> > +        (adj_type =3D=3D ADJ_IDX_FIRST &&
> > +         pdev->msix->table.first =3D=3D pdev->msix->pba.last)) )
> > +    {
> > +        gdprintk(XENLOG_WARNING,
> > +                 "MSI-X table and PBA of %pp live on the same page, "
> > +                 "writing to other registers there is not implemented\=
n",
> > +                 pdev);
>=20
> Don't you actually need to check that the passed address falls into the
> PBA array?  PBA can be sharing the same page as the MSI-X table, but
> that doesn't imply there aren't holes also not used by either the PBA
> or the MSI-X table in such page.

I don't know exact location of PBA, so I'm rejecting writes just in case
they do hit PBA (see commit message).

> > +        return NULL;
> > +    }
> > +
> > +    return fix_to_virt(pdev->msix->adj_access_table_idx[adj_type]) +
> > +        (address & (PAGE_SIZE - 1));
>=20
> You can use PAGE_OFFSET().

Ok.

> > +
> > +}
> > +
> > +static bool cf_check msixtbl_page_accept(
> > +        const struct hvm_io_handler *handler, const ioreq_t *r)
> > +{
> > +    ASSERT(r->type =3D=3D IOREQ_TYPE_COPY);
> > +
> > +    return msixtbl_page_handler_get_hwaddr(
> > +            current->domain, r->addr, r->dir =3D=3D IOREQ_WRITE);
>=20
> I think you want to accept it also if it's a write to the PBA, and
> just drop it.  You should always pass write=3Dfalse and then drop it in
> msixtbl_page_write() if it falls in the PBA region (but still return
> X86EMUL_OKAY).

I don't want to interfere with msixtbl_mmio_page_ops, this handler is
only about accesses not hitting actual MSI-X structures.

> > +}
> > +
> > +static int cf_check msixtbl_page_read(
> > +        const struct hvm_io_handler *handler,
> > +        uint64_t address, uint32_t len, uint64_t *pval)
>=20
> Why use hvm_io_ops and not hvm_mmio_ops?  You only care about MMIO
> accesses here.

I followed how msixtbl_mmio_ops are registered. Should that also be
changed to hvm_mmio_ops?

>=20
> > +{
> > +    void __iomem *hwaddr;
>=20
> const
>=20
> I would also initialize *pval =3D ~0ul for safety.

When returning X86EMUL_OKAY, then I agree.

> > +
> > +    if ( address & (len - 1) )
> > +        return X86EMUL_UNHANDLEABLE;
>=20
> You can use IS_ALIGNED for clarity.  In my fix for this for vPCI Jan
> asked to split unaligned accesses into 1byte ones, but I think for
> guests it's better to just drop them unless there's a specific case
> that we need to handle.
>=20
> Also you should return X86EMUL_OKAY here, as the address is handled
> here, but the current way to handle it is to drop the access.
>=20
> Printing a debug message can be helpful in case unaligned accesses
> need to be implemented in order to support some device.
>=20
> > +
> > +    hwaddr =3D msixtbl_page_handler_get_hwaddr(
> > +            current->domain, address, false);
> > +
> > +    if ( !hwaddr )
> > +        return X86EMUL_UNHANDLEABLE;
>=20
> Maybe X86EMUL_RETRY, since the page was there in the accept handler.

How does X86EMUL_RETRY work? Is it trying to find the handler again?

> > +
> > +    switch ( len )
> > +    {
> > +    case 1:
> > +        *pval =3D readb(hwaddr);
> > +        break;
> > +    case 2:
> > +        *pval =3D readw(hwaddr);
> > +        break;
> > +    case 4:
> > +        *pval =3D readl(hwaddr);
> > +        break;
> > +    case 8:
> > +        *pval =3D readq(hwaddr);
> > +        break;
>=20
> Nit: we usually add a newline after every break;

Ok.

> > +    default:
> > +        return X86EMUL_UNHANDLEABLE;
>=20
> I would rather use ASSERT_UNREACHABLE() here and fallthrough to the
> return below.  Seeing such size is likely an indication of something
> else gone very wrong, better to just terminate the access at once.
>=20
> > +    }
> > +    return X86EMUL_OKAY;
> > +}
> > +
> > +static int cf_check msixtbl_page_write(
> > +        const struct hvm_io_handler *handler,
> > +        uint64_t address, uint32_t len, uint64_t val)
> > +{
> > +    void __iomem *hwaddr =3D msixtbl_page_handler_get_hwaddr(
> > +            current->domain, address, true);
> > +
>=20
> You don't seem to check whether the access is aligned here?
>=20
> Otherwise I have mostly the same comments as in msixtbl_page_read().

Ok.

> > +    if ( !hwaddr )
> > +        return X86EMUL_UNHANDLEABLE;
> > +
> > +    switch ( len ) {
> > +        case 1:
> > +            writeb(val, hwaddr);
> > +            break;
> > +        case 2:
> > +            writew(val, hwaddr);
> > +            break;
> > +        case 4:
> > +            writel(val, hwaddr);
> > +            break;
> > +        case 8:
> > +            writeq(val, hwaddr);
> > +            break;
> > +        default:
> > +            return X86EMUL_UNHANDLEABLE;
> > +    }
> > +    return X86EMUL_OKAY;
> > +
> > +}
> > +
> > +static const struct hvm_io_ops msixtbl_mmio_page_ops =3D {
> > +    .accept =3D msixtbl_page_accept,
> > +    .read =3D msixtbl_page_read,
> > +    .write =3D msixtbl_page_write,
> > +};
> > +
> >  static void add_msixtbl_entry(struct domain *d,
> >                                struct pci_dev *pdev,
> >                                uint64_t gtable,
> > @@ -593,6 +739,14 @@ void msixtbl_init(struct domain *d)
> >          handler->type =3D IOREQ_TYPE_COPY;
> >          handler->ops =3D &msixtbl_mmio_ops;
> >      }
> > +
> > +    /* passthrough access to other registers on the same page */
> > +    handler =3D hvm_next_io_handler(d);
> > +    if ( handler )
> > +    {
> > +        handler->type =3D IOREQ_TYPE_COPY;
> > +        handler->ops =3D &msixtbl_mmio_page_ops;
> > +    }
> >  }
> > =20
> >  void msixtbl_pt_cleanup(struct domain *d)
> > diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/=
msi.h
> > index a53ade95c9ad..d13cf1c1f873 100644
> > --- a/xen/arch/x86/include/asm/msi.h
> > +++ b/xen/arch/x86/include/asm/msi.h
> > @@ -207,6 +207,10 @@ struct msg_address {
> >                                         PCI_MSIX_ENTRY_SIZE + \
> >                                         (~PCI_MSIX_BIRMASK & (PAGE_SIZE=
 - 1)))
> > =20
> > +/* indexes in adj_access_table_idx[] below */
> > +#define ADJ_IDX_FIRST 0
> > +#define ADJ_IDX_LAST  1
> > +
> >  struct arch_msix {
> >      unsigned int nr_entries, used_entries;
> >      struct {
> > @@ -214,6 +218,7 @@ struct arch_msix {
> >      } table, pba;
> >      int table_refcnt[MAX_MSIX_TABLE_PAGES];
> >      int table_idx[MAX_MSIX_TABLE_PAGES];
> > +    int adj_access_table_idx[2];
> >      spinlock_t table_lock;
> >      bool host_maskall, guest_maskall;
> >      domid_t warned;
> > diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> > index d0bf63df1def..680853f84685 100644
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -961,6 +961,34 @@ static int msix_capability_init(struct pci_dev *de=
v,
> >                  domain_crash(d);
> >              /* XXX How to deal with existing mappings? */
> >          }
> > +
> > +        /*
> > +         * If the MSI-X table doesn't start at the page boundary, map =
the first page for
> > +         * passthrough accesses.
> > +         */
>=20
> I think you should initialize
> msix->adj_access_table_idx[ADJ_IDX_{FIRST,LAST}] to -1?
>=20
> > +        if ( table_paddr & (PAGE_SIZE - 1) )
> > +        {
> > +            int idx =3D msix_get_fixmap(msix, table_paddr, table_paddr=
);
> > +
> > +            if ( idx >=3D 0 )
> > +                msix->adj_access_table_idx[ADJ_IDX_FIRST] =3D idx;
> > +            else
> > +                gprintk(XENLOG_ERR, "Failed to map first MSI-X table p=
age: %d\n", idx);
> > +        }
> > +        /*
> > +         * If the MSI-X table doesn't span full page(s), map the last =
page for
> > +         * passthrough accesses.
> > +         */
> > +        if ( (table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & =
(PAGE_SIZE - 1) )
> > +        {
> > +            uint64_t entry_paddr =3D table_paddr + msix->nr_entries * =
PCI_MSIX_ENTRY_SIZE;
> > +            int idx =3D msix_get_fixmap(msix, table_paddr, entry_paddr=
);
> > +
> > +            if ( idx >=3D 0 )
> > +                msix->adj_access_table_idx[ADJ_IDX_LAST] =3D idx;
> > +            else
> > +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table pa=
ge: %d\n", idx);
> > +        }
> >      }
> >      WARN_ON(msix->table.first !=3D (table_paddr >> PAGE_SHIFT));
> >      ++msix->used_entries;
> > @@ -1090,6 +1118,16 @@ static void _pci_cleanup_msix(struct arch_msix *=
msix)
> >              WARN();
> >          msix->table.first =3D 0;
> >          msix->table.last =3D 0;
> > +        if ( msix->adj_access_table_idx[ADJ_IDX_FIRST] )
> > +        {
> > +            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_F=
IRST]);
> > +            msix->adj_access_table_idx[ADJ_IDX_FIRST] =3D 0;
> > +        }
> > +        if ( msix->adj_access_table_idx[ADJ_IDX_LAST] )
> > +        {
> > +            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_L=
AST]);
> > +            msix->adj_access_table_idx[ADJ_IDX_LAST] =3D 0;
>=20
> Isn't 0 a valid idx?  You should check for >=3D 0 and also set
> to -1 once the fixmap entry has been put.

I rely here on msix using specific range of fixmap indexes
(FIX_MSIX_TO_RESERV_BASE - FIX_MSIX_TO_RESERV_END), which isn't starting
at 0. For this reason also, I keep unused entries at 0 (no need explicit
initialization).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VavojxH82hISeCT6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQi1/kACgkQ24/THMrX
1ywIdwf+JeXjo0IepTSQNBmMC7ncwswbDbDnOqxj/0VVIKTe60yhg9g694Il6H+J
tBQV9UyaroRBLDrn+Q0K84igWGTnPfD3lWFXOt4On/oc9ZiB0O8DCGAT4c7bOsnw
YiQF65jb320UgEH7vwXp5uCRhqBflwP3mLqIbB3xAHfjUCJahVoPxAzFwXlHbt5L
JoLcXwV8T/uGdBaADa1L4J8+oHXZnJUMTANHromKWwsu6gHyhbF2EANUABwKwNPz
xUFX3U3mnnN/t+B3sr+Jo5sovXwuEesbqBpXD2WO6Yj4/P7Zqh1VDDVLyMNrZ2lM
Ta/3dZc6dsKoxxSSBBP5jflJFXKtgg==
=yh2Q
-----END PGP SIGNATURE-----

--VavojxH82hISeCT6--

