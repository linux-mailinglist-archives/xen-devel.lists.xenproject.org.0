Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748664BF3C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461256.719324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Das-0002hv-4o; Tue, 13 Dec 2022 22:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461256.719324; Tue, 13 Dec 2022 22:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Das-0002fE-22; Tue, 13 Dec 2022 22:17:46 +0000
Received: by outflank-mailman (input) for mailman id 461256;
 Tue, 13 Dec 2022 22:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dap-0002f7-RF
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:17:44 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ca84aa-7b33-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:17:41 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F060E32005B5;
 Tue, 13 Dec 2022 17:17:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 13 Dec 2022 17:17:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:17:36 -0500 (EST)
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
X-Inumbo-ID: f4ca84aa-7b33-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670969857; x=
	1671056257; bh=Kup6ZQkTZkd625cYDAS1Nqee6DmzrAAqp7YEQ0GQpA4=; b=E
	EBm9ThhrI+oDQT5QmTzETc+mxHOwwQ0yv6yNEUC/ld/vpzKpq5mzqT4aS87QKqsA
	R/LRB2cXkhaNlLV5GiyR7EdVKyEBJf3uOvpeCjDXoxkJWanbMfzpjvx+WKuIsai8
	zzIl0SVvgt5rC/btCihsiKbRq08fXGIPd9hjcaBLYT2iT+yUxU7+Ehseki+scF+w
	AdZ3mSOcIRDI5v6eTicH3KifHUIvdk/8pEZdVCq3oFoM+/EDQpXeYVLBPYb5dijf
	9DF9FnqqT7sleOGObdWYHwuw0IG7IBp6L3/aak7jYjj8LJompRyBLTJDyje73BtK
	ZDFcNha3f4GoIzZfUycBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670969857; x=1671056257; bh=Kup6ZQkTZkd625cYDAS1Nqee6Dmz
	rAAqp7YEQ0GQpA4=; b=Xpz/IytRi2UfyIoYL52jI7wwEaPHyXRMdL3//WBo5lt9
	Tq3fcrrp0BbhwFZpRSixKM9PQQRDR7y9L3K6KHF4NfVvymc8b8b7zCzLPaqWOwRJ
	Mv68pJ40iUNZGQclDRGndB6MZ3FJkzJaht6EMsbLUTNTej5MW8er+LGu/BkfBLhC
	P8Jmqj/13Uaqxxb1ssFcjF1AKuQKhjv8P8DY9sCsOTuug893o6oXTI0Z7HQA2I7z
	1U5P31cCZQG0/kvj41y6lZ59c+1oZ6RUfMnbKWIaS9lQWOhFSaE0RirnFz0YsrCi
	XAjM51JhVmGfsPm9VDFRqzvcVq76vR6KX2jbus5WUw==
X-ME-Sender: <xms:AfqYY0IqKNFuuRWN91UwStq0kxbI9lpG62X0dDR2XMyz-tF16Z0sXg>
    <xme:AfqYY0Jm35xDCJbP5hD2oSwbGf0uFnLFLACu3c-R8JWwWyUWsh5cEwlLZuktYvJu7
    LAZGVKmeRQrLTs>
X-ME-Received: <xmr:AfqYY0suNvmysDpQuX_1pe-6K2r9JjY56iztvRsD6BhrygsMPt07tZ5mcuyD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:AfqYYxaEsMVDvOWZRe-2BHaYd3lw6pITs33uh8lMu2Eob8ZiU6BH9A>
    <xmx:AfqYY7bFX9fbKiZtEhPUWaxJxDHB2mZHHc2aVUlyS2QB4XoWUXVHFA>
    <xmx:AfqYY9BOF1h8wfeCXNt_piFKkAe_IyonfVoeln1JYY5AQMewi455qg>
    <xmx:AfqYY1nW5snyYPd4PqE46ajjfVKPbcJHsYKy5WtFokdZp3J5T6iFKQ>
Feedback-ID: iac594737:Fastmail
Date: Tue, 13 Dec 2022 17:17:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>,
	"Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 3/4] Add xen superpage splitting support to arm
Message-ID: <Y5j5/qinMwxizxMc@itl-email>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB1642CCC518921DC7F2BB3BB3CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <c8f9e15a-81d1-ef8c-0baf-1758e7d89eee@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Z+BkJtS1zxzekW8"
Content-Disposition: inline
In-Reply-To: <c8f9e15a-81d1-ef8c-0baf-1758e7d89eee@xen.org>


--+Z+BkJtS1zxzekW8
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Dec 2022 17:17:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>,
	"Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 3/4] Add xen superpage splitting support to arm

On Tue, Dec 13, 2022 at 09:15:49PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 13/12/2022 19:54, Smith, Jackson wrote:
> > Updates xen_pt_update_entry function from xen/arch/arm/mm.c to
> > automatically split superpages as needed.
> Your signed-off-by is missing.
>=20
> > ---
> >   xen/arch/arm/mm.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++=
+--------
> >   1 file changed, 78 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > index 6301752..91b9c2b 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -753,8 +753,78 @@ static int create_xen_table(lpae_t *entry)
> >   }
> >   #define XEN_TABLE_MAP_FAILED 0
> > -#define XEN_TABLE_SUPER_PAGE 1
> > -#define XEN_TABLE_NORMAL_PAGE 2
> > +#define XEN_TABLE_NORMAL_PAGE 1
> > +
> > +/* More or less taken from p2m_split_superpage, without the p2m stuff =
*/
> > +static bool xen_split_superpage(lpae_t *entry, unsigned int level,
> > +                                unsigned int target, const unsigned in=
t *offsets)
> > +{
> > +    struct page_info *page;
> > +    lpae_t pte, *table;
> > +    unsigned int i;
> > +    bool rv =3D true;
> > +
> > +    mfn_t mfn =3D lpae_get_mfn(*entry);
> > +    unsigned int next_level =3D level + 1;
> > +    unsigned int level_order =3D XEN_PT_LEVEL_ORDER(next_level);
> > +
> > +    ASSERT(level < target);
> > +    ASSERT(lpae_is_superpage(*entry, level));
> > +
> > +    page =3D alloc_domheap_page(NULL, 0);
> Page-table may be allocated from the boot allocator. So you want to use
> create_xen_table().
>=20
> > +    if ( !page )
> > +        return false;
> > +
> > +    table =3D __map_domain_page(page);
>=20
> You want to use xen_map_table().
>=20
> > +
> > +    /*
> > +     * We are either splitting a first level 1G page into 512 second l=
evel
> > +     * 2M pages, or a second level 2M page into 512 third level 4K pag=
es.
> > +     */
> > +    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )
> > +    {
> > +        lpae_t *new_entry =3D table + i;
> > +
> > +        /*
> > +         * Use the content of the superpage entry and override
> > +         * the necessary fields. So the correct permission are kept.
> > +         */
> > +        pte =3D *entry;
> > +        lpae_set_mfn(pte, mfn_add(mfn, i << level_order));
> > +
> > +        /*
> > +         * First and second level pages set walk.table =3D 0, but third
> > +         * level entries set walk.table =3D 1.
> > +         */
> > +        pte.walk.table =3D (next_level =3D=3D 3);
> > +
> > +        write_pte(new_entry, pte);
> > +    }
> > +
> > +    /*
> > +     * Shatter superpage in the page to the level we want to make the
> > +     * changes.
> > +     * This is done outside the loop to avoid checking the offset to
> > +     * know whether the entry should be shattered for every entry.
> > +     */
> > +    if ( next_level !=3D target )
> > +        rv =3D xen_split_superpage(table + offsets[next_level],
> > +                                 level + 1, target, offsets);
> > +
> > +    clean_dcache_va_range(table, PAGE_SIZE);
>=20
> Cleaning the cache is not necessary. This is done in the P2M case because=
 it
> is shared with the IOMMU which may not support coherent access.
>=20
> > +    unmap_domain_page(table);
>=20
> This would be xen_map
>=20
> > +
> > +    /*
> > +     * Generate the entry for this new table we created,
> > +     * and write it back in place of the superpage entry.
> > +     */
>=20
> I am afraid this is not compliant with the Arm Arm. If you want to update
> valid entry (e.g. shattering a superpage), then you need to follow the
> break-before-make sequence. This means that:
>   1. Replace the valid entry with an entry with an invalid one
>   2. Flush the TLBs
>   3. Write the new entry
>=20
> Those steps will make your code compliant but it also means that a virtual
> address will be temporarily invalid so you could take a fault in the midd=
le
> of your split if your stack or the table was part of the region. The same
> could happen for the other running CPUs but this is less problematic as t=
hey
> could spin on the page-table lock.

Could this be worked around by writing the critical section in
assembler?  The assembler code would never access the stack and would
run with interrupts disabled.  There could also be BUG() checks for
attempting to shatter a PTE that was needed to access the PTE in
question, though I suspect one can work around this with a temporary
PTE.  That said, shattering large pages requires allocating memory,
which might fail.  What happens if the allocation does fail?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--+Z+BkJtS1zxzekW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOY+f0ACgkQsoi1X/+c
IsHCqw/+Na5l85XXjIzHuwXgL+m8+Tnspco4ZurXSW26wGmUWHJZLNqXtLqmj0pM
Mji2qQdcm4dmL2FUYNebMVbZa4RJ2prSf6usP0QCFfGTgfD6DyYHghxMeY9bP7DJ
ZMXoQ43589xzGh8QxQrt4ejs19VCfL+dcRw7iqSGr2dH4fuKSZbzONPG0U7hyIAO
sD21f97b7X184kUl/rC0bwYzGhIHEeAx5aQRpV/wTqYK6ZnvSbJtWYWmZEs9HH8F
vJ67Wpcy11aSczetPXH6VeGR5+9IaOB77zm29Ah7tX8R2Y9kM1BTdhCX0SegQ4dJ
HBGchuL+6AJYwgrfeVY65piE5T887qsdF8uZFQdBgORP8Y+U71iSWU2HVGDZymHX
Cw8orwsl0plhu6m01mtg82IaB4XVUPOQ1BInsjeToOTi9nSPcY7b2kfEU9pdOF05
aIZLtAA4/4k85fEfYQzoRC+nOjI+B1Cl/dt6zJK+D3vx3m1Rvo14ztBbR5MUqz0Q
u6Yt0NnBkptoLKWlWtSpesSYKcDHK58RGIY5mxzBlrtxQ9EbkR2u56EX7b73vmgL
PIgjkmxpp6Qo92AqIt8kGkivk0FpBrRUhjm2bGCbpFpnXl+cn81TvNOG5K7v2dP0
uxC3JAVIdzrmKoUZAxqg9jPKn17hgsa6GnSu8Qmyd7ROlTyVow8=
=/gI1
-----END PGP SIGNATURE-----

--+Z+BkJtS1zxzekW8--

