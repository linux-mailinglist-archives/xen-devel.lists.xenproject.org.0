Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A826CD7EC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516197.799961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOw-000269-CP; Wed, 29 Mar 2023 10:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516197.799961; Wed, 29 Mar 2023 10:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOw-00022Y-6U; Wed, 29 Mar 2023 10:51:34 +0000
Received: by outflank-mailman (input) for mailman id 516197;
 Wed, 29 Mar 2023 10:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nen3=7V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1phTOu-0007lb-Cv
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:51:32 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9a01090-ce1f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:51:31 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 182C25C007F;
 Wed, 29 Mar 2023 06:51:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 29 Mar 2023 06:51:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 06:51:28 -0400 (EDT)
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
X-Inumbo-ID: a9a01090-ce1f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680087090; x=1680173490; bh=ZDSfsW2w6ztHjS57+/dF5bkmVS3qa3EzC/L
	b9zf0gSE=; b=NIknI/4yGK4SCbzdqndLPkgMdBpEXnbLP2bI0nmZcwlI44iQ8gc
	SNLHQvexyBFBDEH8maxU7Y8t/D9aES1jR1yffAWmOvGwDVqe+ZmC2OlKmwAiYXdb
	04VSdatdoE1vOB9dapni9ydzwy9a5ZBXNAISsVa9RJBum7xeJJWKhkQuSJP+Zun0
	XDT6ho8X7j0qgwPjx5pT/8pCSXmTZuxNyQ2Q69L+Ir7CrYHFRA+evKn2WFYQnikt
	VRft9iYZ+ayE4HxmufS2BCHFx2Wl6YG7N+pJETgfYhzDPnbcGmPjAdwdrtmS6qCy
	qEN5yNszAbfazVpTjYw2LMtqU7tnjUcF6Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680087090; x=1680173490; bh=ZDSfsW2w6ztHj
	S57+/dF5bkmVS3qa3EzC/Lb9zf0gSE=; b=k9frO48nIScp5l0qJpXeQ59hR5OWl
	ghShFlQ/+H3cgO+922TtE2/IZswso26r0Ret05aPtbpupp6/X4TTGKgNTE7uSUjD
	CjL+zjWjUFxSggVm2DTOTNiB9A47aeIFC5waGgWDCE7RZkdobG/ircPOIYYD0Owo
	n2OAkhCbQbs7ebLBBscH8NTzDWb+2wa380Vlj7+Tv6UPutgdOdscz/XBryPNMeGq
	lWXYQbBHsC7aepAv97ZSmkOKYMYU2LuvLI13oibSWLIkvbtefm6rCctG9G0I1pbu
	bHoY7wAzVzYIIVTStICumoi5tYmCj09YZDTXIpD6l14edPwpiV8KEa41A==
X-ME-Sender: <xms:MRgkZJ-wedrkHF0mpnB1pMplsAjmR0MDB2NDmidrI09f1HyGwA_KEw>
    <xme:MRgkZNspCVdj4qgLKgVqUZ6L6nnmmL1X6aG71ACGPc-Rfau_pcz3UKN4yabi2Ay5p
    ARO0DUJC6H2qw>
X-ME-Received: <xmr:MRgkZHDsxcHap46fJhFctovyAmy1P9ZLhXXpOoTWQx5rYpEybiGInF4RWgAANkc9rj8GIJgFij7OMCUAtUgfMFlc-aI0OUjbX2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:MRgkZNe31a8CifKMU3i49NlR3ctNBbK_t8W65v1uP0af27Sn6tqfLg>
    <xmx:MRgkZOM0ognDme5UuBl-XF7FMViRMmdwsYR0W4js1BU-v1-Y3IGotg>
    <xmx:MRgkZPkSv_HtdDrQ2x6sG985wt-kESGa2c3sUqIBv_QesEKkZpivoQ>
    <xmx:MhgkZLp-DyEvJr68l4Qrf5GQHrocesNsxm4iF9wqQnkOrYqdd8M71w>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 29 Mar 2023 12:51:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only
Message-ID: <ZCQYLkoSfZ7klmNC@mail-itl>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
 <e238bffa-5eba-b18f-ed73-1c5c9730cf70@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sEtyxlEXaJmqpWsx"
Content-Disposition: inline
In-Reply-To: <e238bffa-5eba-b18f-ed73-1c5c9730cf70@suse.com>


--sEtyxlEXaJmqpWsx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Mar 2023 12:51:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only

On Wed, Mar 29, 2023 at 10:50:20AM +0200, Jan Beulich wrote:
> On 27.03.2023 12:09, Marek Marczykowski-G=C3=B3recki wrote:
> > In some cases, only few registers on a page needs to be write-protected.
> > Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> > PBA table (which doesn't need to span the whole table either).
>=20
> Yet like the MSI-X table the PBA is not permitted to share a page with
> other registers (the table itself excluded). So a need there would
> (again) only arise for devices violating the spec.

For PBA, indeed (and due to not seeing device needing such hack, I don't
do that for PBA yet). But the XHCI spec doesn't include such limitation, so
this case is perfectly valid.

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
> While, unlike Roger, I don't want to see mmio_ro_ranges' granularity
> changed, I wonder if a bitmap isn't going to be easier to use (even
> if perhaps requiring a little more memory, but whether that's the case
> depends on intended granularity - I'm not convinced we need byte-
> granular ranges). I'm also worried of this yet more heavily tying to
> x86 of (as of the next patch) the USB3 debug console driver (i.e. as
> opposed to Roger I wouldn't take anything that's x86-only as
> justification for making wider changes).

Well, it's still under the very same CONFIG_X86, and for the same
purpose, so I don't think it's "more heavily tying".

> As to sub-page permissions: EPT has, as one of its extensions, support
> for this. It might be worth at least mentioning, even if the feature
> isn't intended to be used right here.

Ah, ok.

> Taking both remarks together, limiting granularity to 16(?) bytes
> would allow using the advanced EPT functionality down the road, and
> would at the same time limit the suggested bitmap to just 256 bits /
> 32 bytes, which I think gets us below what even an empty rangeset
> would require. Plus lookup would also be quite a bit more lightweight.

Indeed, in that case it makes sense.

> > The mechanism this API is plugged in is slightly different for PV and
> > HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> > it's already called for #PF on read-only MMIO page. For HVM however, EPT
> > violation on p2m_mmio_direct page results in a direct domain_crash().
> > To reach mmio_ro_emulated_write(), change how write violations for
> > p2m_mmio_direct are handled - specifically, treat them similar to
> > p2m_ioreq_server. This makes relevant ioreq handler being called,
> > that finally end up calling mmio_ro_emulated_write().
>=20
> I wonder whether that isn't too heavy a change to existing behavior.
> I understand that taking this path is necessary for the purpose of the
> patch, but I don't think it is necessary for all p2m_mmio_direct pages.
> Checking at least mmio_ro_ranges right in hvm_hap_nested_page_fault()
> looks reasonable to me.

Before this change, domU was crashed on write EPT violation to
p2m_mmio_direct page (which, IIUC, can happen only for mmio_ro_ranges,
as otherwise page is mapped R/W), so I don't think there are many
accesses that would hit this path for other reasons.

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
>=20
> As long as patch 2 is going to add the only users, __init please, and
> there's no need for a "remove" counterpart.

__init makes sense. But as for removing "remove" part, I'm not sure. I
realize it is a dead code now, but it's easier to introduce it now to
provide complete API, than later by somebody else who would want to use
it in other places. Is there some trick to make compiler/linker optimize
it out?

>=20
> > +    mfn_t mfn,
> > +    unsigned long offset_s,
> > +    unsigned long offset_e,
> > +    int fixmap_idx)
>=20
> enum fixed_addresses?

If that parameter stays, yes.

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
>=20
> Nit: Style (either you view list_for_each_entry as a [pseudo]keyword
> for the purposes of what blanks should be present/absent, or you don't,
> a mixture isn't reasonable; also elsewhere).

Which version would be your preference for list_for_each_entry?

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
>=20
> If this case is really needed, this special return value (as documented
> in the header) probably needs specially handling in the callers - it's
> not necessarily an error after all. But I wonder whether it wouldn't be
> easier to check earlier on and fail right away (with e.g. -EBUSY),=20

The idea is to allow multiple sub-ranges in a single page. Again, if
using ioremap() internally, instead of fixmap provided externally, this
case will go away.

> rather
> than adding the range and _then_ (kind of, as per patch 2) failing.

Right, I missed "!=3D 0" there.

> > +err_unlock:
>=20
> Nit: Style (labels indented by at least one space please, also elsewhere).
>=20
> > +static void subpage_mmio_write_emulate(
> > +    mfn_t mfn,
> > +    unsigned long offset,
>=20
> unsigned int
>=20
> > +    void *data,
>=20
> const
>=20
> > +    unsigned int len)
> > +{
> > +    struct subpage_ro_range *entry;
> > +    void __iomem *addr;
> > +
> > +    rcu_read_lock(&subpage_ro_rcu);
> > +
> > +    list_for_each_entry_rcu( entry, &subpage_ro_ranges, list )
> > +    {
> > +        if ( mfn_eq(entry->mfn, mfn) )
> > +        {
> > +            if ( rangeset_overlaps_range(entry->ro_bytes, offset, offs=
et + len - 1) )
> > +                goto out_unlock;
>=20
> This case ...
>=20
> > +            addr =3D fix_to_virt(entry->fixmap_idx) + offset;
> > +            switch ( len )
> > +            {
> > +            case 1:
> > +                writeb(*(uint8_t*)data, addr);
> > +                break;
> > +            case 2:
> > +                writew(*(uint16_t*)data, addr);
> > +                break;
> > +            case 4:
> > +                writel(*(uint32_t*)data, addr);
> > +                break;
> > +            case 8:
> > +                writeq(*(uint64_t*)data, addr);
> > +                break;
> > +            default:
> > +                /* mmio_ro_emulated_write() already validated the size=
 */
> > +                ASSERT_UNREACHABLE();
>=20
> ... as well as, in a release build, this one wants to ...
>=20
> > +            }
> > +            goto out_unlock;
>=20
> ... not use this path but ...
>=20
> > +        }
> > +    }
> > +    gdprintk(XENLOG_WARNING,
> > +             "ignoring write to R/O MMIO mfn %" PRI_mfn " offset %lx l=
en %u\n",
> > +             mfn_x(mfn), offset, len);
>=20
> ... make it here. (By implication: I'm not convinced this wants to be a
> gdprintk(), as I think at least one such warning would better surface in
> release builds as well.)

Right, gprintk() would make more sense indeed.

> At the same time I don't think any message should be issued for write
> attempts to pages which don't have part of it marked writable. We deal
> with such silently right now, and this shouldn't change.

At least for HVM domains, it isn't really silent. It's domain_crash()
(before my change, not reaching this function at all).
I think it is silent only for PV domains (or maybe even just hardware
domain?).

> In fact even
> for ranges which don't overlap the writable portion of a page we may want
> to consider remaining silent. The log message ought to be of interest
> mainly for writes which we meant to permit, but which for whatever reason
> we elect to suppress nevertheless.
>=20
> As to the message - why do you split MFN from offset, rather than simply
> logging an address ("... %" PRI_mfn "%03x ...")?

I could use such formatting trick indeed.

> Like (iirc) Roger I think that misaligned accesses should be refused (and
> hence also make it here).

Ok, will change.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--sEtyxlEXaJmqpWsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQkGC4ACgkQ24/THMrX
1yzAlwf8DZ98cj8EOKiwBIpg5HjCYtpW6OSMq9jQVKuDrEd0YqoNtG8524SBSwwe
qnO+083KGGPUExi9iJRpPVqzfVaPDe5gxTcHv8ywxOtq+NT67ECv6HfhV51w2YT4
OStfhqnwHF+/m43KEn4OErPZF1lwt1ZdqVzAjbIx0uOmbHeV071roPj8O7t9fSJY
rCamXh2z7CJQ9YXqKqeCbc+8EqgXovOuFAklUP57VkwQGtsikRSaIlzkFEauHvnL
EJwFxR/lWyFMHVhgmaAU5GUd2mw1daU80AVaUMc/EK6buVbON8R8Of2EdYKR+iHI
Hhj4iRJB2vyu6VlWi2ufbDXfMuyy7A==
=F8ob
-----END PGP SIGNATURE-----

--sEtyxlEXaJmqpWsx--

