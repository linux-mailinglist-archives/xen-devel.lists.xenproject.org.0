Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793CF62E317
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 18:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445313.700469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovik6-0005Gt-00; Thu, 17 Nov 2022 17:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445313.700469; Thu, 17 Nov 2022 17:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovik5-0005EK-S6; Thu, 17 Nov 2022 17:32:01 +0000
Received: by outflank-mailman (input) for mailman id 445313;
 Thu, 17 Nov 2022 17:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p9yL=3R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ovik3-0005EC-3Z
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 17:31:59 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9f5e6b0-669d-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 18:31:56 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0A4A53200AAF;
 Thu, 17 Nov 2022 12:31:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 12:31:52 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 12:31:50 -0500 (EST)
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
X-Inumbo-ID: b9f5e6b0-669d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668706311; x=
	1668792711; bh=9CXAbQhD2xKtfBYKhEglWorCMZdwciiY+cXUjSUioGQ=; b=m
	NzmzTMFqllmJRiaUjq8gYFFcHuYMVlbpnM9DULo45KbRjottg5PdmGPK1cKaw8ZH
	DUR2nz3zbto1Regnxuw9Gw5aW4RlTdUo2NFqEatkt+J8oNARRkO5AJFWFXXgME8a
	qcN9WyydR3MxJsAFPmFIED0QV1H7KBguzD87VITsdHo51+SyjF55nvXb4Q+v5rs5
	5YJi3a+865ZxzE91Sfxirpv9N/qdepZC3qOHMO+O1ATlMKhfioF1wgQxE9omwzX4
	NTJHtbSmUzLa0hasOSUS5+qtRvDJudSPDJdN6cSwMTJyiTpOkv268ai/C/Cuc7+0
	T4WYm1RBTsAKRKBYzHm7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668706311; x=1668792711; bh=9CXAbQhD2xKtfBYKhEglWorCMZdw
	ciiY+cXUjSUioGQ=; b=R4gKKhQ8ySctosg1i7niH9oIP9uju5a6H6x+8O5YYQYd
	aJue6YPpTlmHAkoJu/gd9pd2yl1Tr08pVkAgM7xQgZyw5k0e/Sbg0QiVDEiSRGRI
	9uByL5XfVoRs2uiE9KaSWpWJbE88WI9S63hDYRSRTenqiyiV2UBcqsZ8Wx05qrYl
	9yEo6RpIa8vuXCNGNAPN4xIf/E0sHDuhWa2YXe3VSI17vxibFIAq5D+1uVLnJFHu
	furXiO3MBcx9nrHkpfa5TS7T+T8v8qByO4PMD0wVmvVnDNbyeHizJcgjcZxkQFl7
	+R8RC1/rkbBpoc82j+at+SD2iyCei4M6QAH7FKTttg==
X-ME-Sender: <xms:B3B2Y2shpiKyL0M3tpoRnW5dAuOJ7CC1iSntYOcRC9eIUwcVizdJHQ>
    <xme:B3B2Y7d4XOOIzxxlifecdsOTP4LQjTWp9oc8lzpBG5Rf6RVW9AfK_Rl7RM_wYNRtE
    tLBggl1sfbwVQ>
X-ME-Received: <xmr:B3B2Yxwo6NQ5lPE1a4kS18GG8vepG8bSXIMOuzKMF7B6QI-vSmyakG-ROyYaONJlXHKnEfFX19lzrLF68KdCX12QpbEvq2BLFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:B3B2YxOolcHX8Fjol78lZ7xWZY8y1K23gWW_NB43xAFNuaMKfj9sZA>
    <xmx:B3B2Y29mgYkjJKMwyI5ZUE9XzHzzMtxUPuuxZbZOph7fI_di-0U6Fg>
    <xmx:B3B2Y5XzWv_ddbSBKWtzCdiu-q3BYBNigKWln6vYL2H_cneasPL4lA>
    <xmx:B3B2Y4IyI5SOsOCEZJLE5NoBHfYYPqFZEJVDq-LjTut57OV7YwWiyQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Nov 2022 18:31:44 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table
Message-ID: <Y3ZwAJITlD/rSf/n@mail-itl>
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
 <15138618-5cb0-8304-a56b-cb787e187772@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DHyxoT84A3Hd42vl"
Content-Disposition: inline
In-Reply-To: <15138618-5cb0-8304-a56b-cb787e187772@suse.com>


--DHyxoT84A3Hd42vl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Nov 2022 18:31:44 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table

On Thu, Nov 17, 2022 at 05:34:36PM +0100, Jan Beulich wrote:
> On 14.11.2022 20:21, Marek Marczykowski-G=C3=B3recki wrote:
> > Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> > on the same page as MSI-X table. Device model (especially one in
> > stubdomain) cannot really handle those, as direct writes to that page is
> > refused (page is on mmio_ro_ranges list). Instead, add internal ioreq
> > server that handle those writes.
> >=20
> > This may be also used to read Pending Bit Array, if it lives on the same
>=20
> "may" sounds as if this would be future work, yet ...

I was meaning it applies only if it shares the page, but indeed it
should be "will".

> > page, making QEMU not needing /dev/mem access at all (especially helpful
> > with lockdown enabled in dom0). If PBA lives on another page, it can be
> > (and will be) mapped to the guest directly.
> > If PBA lives on the same page, forbid writes.
>=20
> ... here you say you actually handle the case (because otherwise you
> wouldn't need to distinguish writes from reads). It is only ...
>=20
> > Technically, writes outside
> > of PBA could be allowed, but at this moment the precise location of PBA
> > isn't saved.
>=20
> ... this part which right now you don't handle. I have to admit that I'm
> not convinced we should take such a partial implementation, especially
> if there's nothing recorded in the log (making it harder to tell whether
> something not working is because of this implementation restriction or
> some other issue).

For this, I need to save exact offset to PBA. I can extend the patch for
that case too.

> > --- a/xen/arch/x86/hvm/vmsi.c
> > +++ b/xen/arch/x86/hvm/vmsi.c
> > @@ -428,6 +428,133 @@ static const struct hvm_io_ops msixtbl_mmio_ops =
=3D {
> >      .write =3D _msixtbl_write,
> >  };
> > =20
> > +static void __iomem *msixtbl_page_handler_get_hwaddr(
> > +        const struct vcpu *v,
> > +        uint64_t address,
> > +        bool write)
>=20
> These want to be indented just like ...
>=20
> > +{
> > +    struct domain *d =3D v->domain;
> > +    struct pci_dev *pdev =3D NULL;
> > +    struct msixtbl_entry *entry;
> > +    void __iomem *ret =3D NULL;
> > +    uint64_t table_end_addr;
>=20
> ... function scope local variables.
>=20
> Also: Pointer-to-const for the first three local variables? And maybe
> omit "ret", which is effectively used just once (as you could use
> "return" at the point where you assign to it). Also you don't further
> use v afaics, so maybe have the callers pass in const struct domain *
> right away?

Makes sense indeed.

> > +    rcu_read_lock(&msixtbl_rcu_lock);
> > +    /*
> > +     * Check if it's on the same page as the end of the MSI-X table, b=
ut
> > +     * outside of the table itself.
> > +     */
> > +    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> > +        if ( PFN_DOWN(address) =3D=3D PFN_DOWN(entry->gtable + entry->=
table_len) &&
> > +             address >=3D entry->gtable + entry->table_len )
> > +        {
> > +            pdev =3D entry->pdev;
> > +            break;
> > +        }
> > +    rcu_read_unlock(&msixtbl_rcu_lock);
> > +
> > +    if ( !pdev )
> > +        return NULL;
> > +
> > +    ASSERT( pdev->msix );
>=20
> Style: ASSERT is not a (pseudo-)keyword and hence should not have
> blanks immediately inside the parentheses. (More instances further
> down.)

Ok.

> > +    table_end_addr =3D (pdev->msix->table.first << PAGE_SHIFT) +
> > +        pdev->msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
> > +    ASSERT( PFN_DOWN(table_end_addr) =3D=3D pdev->msix->table.last );
>=20
> What are you trying to catch here? I ask because the local variable
> exists just for this checking afaics.

This is a double check if pdev->msix->table.last value is correct,
because I have two ways of calculating the address. Now, that I've
written this sentence, I see the way table_end_addr is calculated is
wrong, as it ignores table table not starting at the page boundary. I'll
remove both above lines.

> > +    /* If PBA lives on the same page too, forbid writes. */
> > +    if ( write && pdev->msix->table.last =3D=3D pdev->msix->pba.first )
> > +        return NULL;
> > +
> > +    if ( pdev->msix->last_table_page )
> > +        ret =3D pdev->msix->last_table_page + (address & (PAGE_SIZE - =
1));
> > +    else
> > +        gdprintk(XENLOG_WARNING,
> > +                 "MSI-X last_table_page not initialized for %04x:%02x:=
%02x.%u\n",
> > +                 pdev->seg,
> > +                 pdev->bus,
> > +                 PCI_SLOT(pdev->devfn),
> > +                 PCI_FUNC(pdev->devfn));
> > +
>=20
> Please use %pp.

Ok.

> > +static bool cf_check msixtbl_page_accept(
> > +        const struct hvm_io_handler *handler, const ioreq_t *r)
> > +{
> > +    unsigned long addr =3D r->addr;
>=20
> Any particular reason for having this local variable, which is used ...
>=20
> > +    ASSERT( r->type =3D=3D IOREQ_TYPE_COPY );
> > +
> > +    return msixtbl_page_handler_get_hwaddr(
> > +            current, addr, r->dir =3D=3D IOREQ_WRITE);
> > +}
>=20
> ... exactly once?

Ok, will reduce.

> > +static int cf_check msixtbl_page_read(
> > +        const struct hvm_io_handler *handler,
> > +        uint64_t address, uint32_t len, uint64_t *pval)
> > +{
> > +    void __iomem *hwaddr =3D msixtbl_page_handler_get_hwaddr(
> > +            current, address, false);
> > +
> > +    if ( !hwaddr )
> > +        return X86EMUL_UNHANDLEABLE;
> > +
> > +    switch ( len ) {
>=20
> Style: Brace on its own line please and ...
>=20
> > +        case 1:
> > +            *pval =3D readb(hwaddr);
> > +            break;
> > +        case 2:
> > +            *pval =3D readw(hwaddr);
> > +            break;
> > +        case 4:
> > +            *pval =3D readl(hwaddr);
> > +            break;
> > +        case 8:
> > +            *pval =3D readq(hwaddr);
> > +            break;
> > +        default:
> > +            return X86EMUL_UNHANDLEABLE;
>=20
> ... the body un-indented by a level.

Ok.

> As to operation I'm unconvinced that carrying out misaligned accesses
> here is generally safe. If we find devices really needing such, we
> may need to think about ways to deal with them without putting at
> risk everyone else. At the very least you need to make sure you don't
> access beyond the end of the page.

Right.

> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -961,6 +961,21 @@ static int msix_capability_init(struct pci_dev *de=
v,
> >                  domain_crash(d);
> >              /* XXX How to deal with existing mappings? */
> >          }
> > +
> > +        /*
> > +         * If the MSI-X table doesn't span full page(s), map the last =
page for
> > +         * passthrough accesses.
> > +         */
> > +        if ( (msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & (PAGE_SIZE - 1=
) )
> > +        {
> > +            uint64_t entry_paddr =3D table_paddr + msix->nr_entries * =
PCI_MSIX_ENTRY_SIZE;
> > +            int idx =3D msix_get_fixmap(msix, table_paddr, entry_paddr=
);
> > +
> > +            if ( idx >=3D 0 )
> > +                msix->last_table_page =3D fix_to_virt(idx);
> > +            else
> > +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table pa=
ge: %d\n", idx);
> > +        }
>=20
> Could we avoid the extra work if there's only less than one page's
> worth of entries for a device? But then again maybe not worth any
> extra code, as the same mapping will be re-used anyway due to the
> refcounting that's being used.

I was considering that, but decided against exactly because of
msix_get_fixmap() reusing existing mappings.

> Makes me think of another aspect though: Don't we also need to
> handle stuff living on the same page as the start of the table, if
> that doesn't start at a page boundary?

I have considered that, but decided against given every single device I
tried have MSI-X table at the page boundary. But if you prefer, I can
add such handling too (will require adding another variable to the
arch_msix structure - to store the fixmap location).

> > @@ -1090,6 +1105,12 @@ static void _pci_cleanup_msix(struct arch_msix *=
msix)
> >              WARN();
> >          msix->table.first =3D 0;
> >          msix->table.last =3D 0;
> > +        if ( msix->last_table_page )
> > +        {
> > +            msix_put_fixmap(msix,
> > +                            virt_to_fix((unsigned long)msix->last_tabl=
e_page));
> > +            msix->last_table_page =3D 0;
>=20
> To set a pointer please use NULL.

Ok.

> Overall it looks like you're dealing with the issue for HVM only.
> You will want to express this in the title, perhaps by using x86/hvm:
> as the prefix. But then the question of course is whether this couldn't
> be dealt with in/from mmio_ro_emulated_write(), which handles both HVM
> and PV.=20

The issue is correlating BAR mapping location with guest's view.
Writable BAR areas are mapped (by qemu) via xc_domain_memory_mapping(), but
that fails for read-only pages (and indeed, qemu doesn't attempt to do
that for the pages with the MSI-X table). Lacking that, I need to use
msixtbl_entry->gtable, which is HVM-only thing.

In fact there is another corner case I don't handle here: guest
accessing those registers when MSI-X is disabled. In that case, there is
no related msixtbl_entry, so I can't correlate the access, but the
page(s) is still read-only, so direct mapping would fail. In practice,
such access will trap into qemu, which will complain "Should not
read/write BAR through QEMU". I have seen this happening several times
when developing the series (due to bugs in my patches), but I haven't
found any case where it would happen with the final patch version.
In fact, I have considered handling this whole thing via qemu (as it
knows better where BAR live from the guest PoV), but stubdomain still
don't have write access to that pages, so that would need to be trapped
(for the second time) by Xen anyway.

For the PV case, I think this extra translation wouldn't be necessary as
BAR are mapped at their actual location, right? But then, it makes it
rather different implementation (separate feature), than just having a
common one for PV and HVM.

> Which in turn raises the question: Do you need to handle reads
> in the new code in the first place?

The page not being mapped is also the reason why I do need to handle
reads too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DHyxoT84A3Hd42vl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN2cAEACgkQ24/THMrX
1ywnTQf+Ipskn0MWsi0X7smmsFLkiKj7ZTlx7xQbu/I+Mh4V4BHWNGKbQp34KDUq
f+P2KHC74BvWqxazB6jeudsq/Jj5iUHVlSYyoaQHf7KnP7BRrREW6rFgLGI8pHsU
maFc0rdSeWWeXQo1UBpApt7tYVVGFd1uF2fgPyr/wze6AEOnBMabEnYuGFsvMBP3
s4orePiHheyT5VCeBGhezrNROplp3k8ZU1NAeFcYM+BdiNM98eXfTjcEQBNL8Ftp
63xiKsoRVkOg18bczDjtJCPnLCGp02D/QGi1NF87swqRwpwfzz2aGKX/r26/6Q37
QQH/8yU7RRnby89IyZOPI5DdulttPg==
=qVZP
-----END PGP SIGNATURE-----

--DHyxoT84A3Hd42vl--

