Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4A8CBF54
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 12:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727478.1131951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jLC-0001vF-6W; Wed, 22 May 2024 10:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727478.1131951; Wed, 22 May 2024 10:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jLC-0001tj-3m; Wed, 22 May 2024 10:37:02 +0000
Received: by outflank-mailman (input) for mailman id 727478;
 Wed, 22 May 2024 10:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKXr=MZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9jLA-0001tb-CF
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 10:37:00 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35ead437-1827-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 12:36:57 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.west.internal (Postfix) with ESMTP id 797021800152;
 Wed, 22 May 2024 06:36:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 May 2024 06:36:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 06:36:52 -0400 (EDT)
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
X-Inumbo-ID: 35ead437-1827-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716374214;
	 x=1716460614; bh=GjZWerAElwAk/mgSGVDAYJhDseHE+UnF9rG9aG0r/tU=; b=
	vVOQ37cqz/PByJF6x22DcaiHfVJ2DzR9HA6i7IqT9KPL/yGikdYd3EsmPcBDVxVb
	rhXb3xtAHdiprGmpv5MXinRc+I+fn8XvxVPn4A9MZLCy30Moj1ZGVA0vEPyoP49M
	0BNz4UbzNF/xKnlrLBcc6uKGhK931DFenP1QeSFiI2JpudJ9m2setEoeuZ4Jgea8
	BfRWtz412960EclOdNh0pbvaxy7x0ErOj5MhIe+bBc8Vs2fE8flxFbxZxwXDS04j
	Pkl+JPeuCeVdSq8KYv+d7jHZyhsKlzWGwAfB3OQy0YRGZDHDrAvgP4mUo/cK+VxS
	XbVDrhqo7I6uqKIu3FtG0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716374214; x=1716460614; bh=GjZWerAElwAk/mgSGVDAYJhDseHE
	+UnF9rG9aG0r/tU=; b=itNbxUhgYHt0J9NUHQXH4MMNykaV1lEAGaYnSrTbBnVV
	r7S8yFL11pfXf/+jCDBqv1kCDfD0vnHAkvZlLMg/+KhQ4yXo4FxbPlQf0X1rqCxD
	oJA/sg6zd2wOrbRcxcjZ+KVvQtoPmMWICJIR6t9m/9Gz3uo06GtXk1zJgEyXkUvU
	DNxd2+wPoUmYUg7GBzs2xmiwQ5ymxPd/DhFjGVtyp3uhi2VeSegMMq1VmtA1iUst
	jC1JmfbQfHbPCXDDlip7H8A9pwc8fEQycjIaDqNwfGm4yz256eVbsV9dnEIwHx8W
	NsEzVjsAWpt7aM2q17+g6BwqR7QGxfiN0os/vNaTrw==
X-ME-Sender: <xms:xcpNZjY2bdfxLZTweqGNup3zqKHvtm0P6K_qSlKo7E-6tSk6iz9U4w>
    <xme:xcpNZia18u2LV4CG9s9z20pxOyBVNPOWKedcFRcTVUS3x3tsm-3KzNdOBIKCx4MyH
    U0aGFsXLtSZLg>
X-ME-Received: <xmr:xcpNZl-df0mrDpxknMrbz-P60-DSDO9JOWMMsbhRzw6YS_94Vqk6g8Heb1L4mMUsKMbOu0JkJVhvz1IgqUXebjRJwUem8dAuNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeigedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:xcpNZprHMK05BIIiNU4f44x6tzC2loYUQA7_oZW7Rav54ifR7HqKjQ>
    <xmx:xcpNZuocVVs6n_tOckJNRmVmkmrv_TkRMMe_MMhJ3AEpsJvuh6lshw>
    <xmx:xcpNZvQn1m-j_cZUilpWIE9WOBrK2KsoTyceQgcSgjZociPXThRzDQ>
    <xmx:xcpNZmrMoeUQcDkmUl53gN_EjahZvJ-dkb0rJn6ymmm6mNTF_5-LCQ>
    <xmx:xspNZhUYWKVKB0nkYWZeRL8ePMtHSJ6NPgQbAbRx3aZwmxmSZ7eV8zUZ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 22 May 2024 12:36:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zk3Kw2WX8r8qpjQj@mail-itl>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2708dbbb-f913-4920-a008-beef12cd1265@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BEvgsup/CxFtuvLg"
Content-Disposition: inline
In-Reply-To: <2708dbbb-f913-4920-a008-beef12cd1265@suse.com>


--BEvgsup/CxFtuvLg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 May 2024 12:36:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Wed, May 22, 2024 at 09:52:44AM +0200, Jan Beulich wrote:
> On 21.05.2024 04:54, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -2009,6 +2009,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsig=
ned long gla,
> >          goto out_put_gfn;
> >      }
> > =20
> > +    if ( (p2mt =3D=3D p2m_mmio_direct) && npfec.write_access && npfec.=
present &&
> > +         subpage_mmio_write_accept(mfn, gla) &&
>=20
> Afaics subpage_mmio_write_accept() is unreachable then when CONFIG_HVM=3D=
n?

Right, the PV path hits mmio_ro_emulated_write() without my changes
already.
Do you suggest to make subpage_mmio_write_accept() under #ifdef
CONFIG_HVM?

> > +         (hvm_emulate_one_mmio(mfn_x(mfn), gla) =3D=3D X86EMUL_OKAY) )
> > +    {
> > +        rc =3D 1;
> > +        goto out_put_gfn;
> > +    }
>=20
> Overall this new if() is pretty similar to the immediate preceding one.
> So similar that I wonder whether the two shouldn't be folded.=20

I can do that if you prefer.

> In fact
> it looks as if the new one is needed only for the case where you'd pass
> through (to a DomU) a device partially used by Xen. That could certainly
> do with mentioning explicitly.

Well, the change in mmio_ro_emulated_write() is relevant to both dom0
and domU. It simply wasn't reachable (in this case) for HVM domU before
(but was for PV already).

> > +static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *en=
try)
>=20
> Considering what the function does and what it returns, perhaps better
> s/get/map/? The "get_page" part of the name generally has a different
> meaning in Xen's memory management.

Ok.

> > +{
> > +    void __iomem *mapped_page;
> > +
> > +    if ( entry->mapped )
> > +        return entry->mapped;
> > +
> > +    mapped_page =3D ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE=
);
> > +
> > +    spin_lock(&subpage_ro_lock);
> > +    /* Re-check under the lock */
> > +    if ( entry->mapped )
> > +    {
> > +        spin_unlock(&subpage_ro_lock);
> > +        iounmap(mapped_page);
>=20
> The only unmap is on an error path here and on another error path elsewhe=
re.
> IOW it looks as if devices with such marked pages are meant to never be h=
ot
> unplugged. I can see that being intentional for the XHCI console, but imo
> such a restriction also needs prominently calling out in a comment next to
> e.g. the function declaration.

The v1 included subpage_mmio_ro_remove() function (which would need to
be used in case of hot-unplug of such device, if desirable), but since
this series doesn't introduce any use of it (as you say, it isn't
desirable for XHCI console specifically), you asked me to remove it...

Should I add an explicit comment about the limitation, instead of having
it implicit by not having subpage_mmio_ro_remove() there?

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
> > +    void __iomem *addr;
>=20
> Wouldn't this better be pointer-to-volatile, with ...
>=20
> > +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(entry->mfn, mfn) )
> > +        {
> > +            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qw=
ords) )
> > +            {
> > + write_ignored:
> > +                gprintk(XENLOG_WARNING,
> > +                        "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x l=
en %u\n",
> > +                        mfn_x(mfn), offset, len);
> > +                return;
> > +            }
> > +
> > +            addr =3D subpage_mmio_get_page(entry);
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
>=20
> ... this being how it's written? (If so, volatile suitably carried throug=
h to
> other places as well.)
>=20
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
> > +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> > +{
> > +    unsigned int offset =3D PAGE_OFFSET(gla);
> > +    const struct subpage_ro_range *entry;
> > +
> > +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
>=20
> Considering the other remark about respective devices impossible to go
> away, is the RCU form here really needed? Its use gives the (false)
> impression of entry removal being possible.

Right, I forgot to change this one.

> > +        if ( mfn_eq(entry->mfn, mfn) &&
> > +             !test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qword=
s) )
>=20
> Btw, "qwords" in the field name is kind of odd when SUBPAGE_MMIO_RO_ALIGN
> in principle suggests that changing granularity ought to be possible by
> simply adjusting that #define. Maybe "->ro_elems"?

Makes sense.

> > --- a/xen/arch/x86/pv/ro-page-fault.c
> > +++ b/xen/arch/x86/pv/ro-page-fault.c
> > @@ -330,6 +330,7 @@ static int mmio_ro_do_page_fault(struct x86_emulate=
_ctxt *ctxt,
> >              return X86EMUL_UNHANDLEABLE;
> >      }
> > =20
> > +    mmio_ro_ctxt.mfn =3D mfn;
> >      ctxt->data =3D &mmio_ro_ctxt;
> >      if ( pci_ro_mmcfg_decode(mfn_x(mfn), &mmio_ro_ctxt.seg, &mmio_ro_c=
txt.bdf) )
> >          return x86_emulate(ctxt, &mmcfg_intercept_ops);
>=20
> Wouldn't you better set .mfn only on the "else" path, just out of context?
> Suggesting that the new field in the struct could actually overlay the
> (seg,bdf) tuple (being of relevance only to MMCFG intercept handling).
> This would be more for documentation purposes than to actually save space.
> (If so, perhaps the "else" itself would also better be dropped while maki=
ng
> the adjustment.)

I can do that if you prefer. But personally, I find such such use of an
union risky (without some means for a compiler to actually enforce their
proper use) - while for correct code it may save some space, it makes
the impact of a type confusion bug potentially worse - now that the
unexpected value would be potentially attacker controlled.
For a documentation purpose I can simply add a comment.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BEvgsup/CxFtuvLg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZNysMACgkQ24/THMrX
1yzjFQgAhcdVJfnkBUGUd4ZW0buOVuIZrw2zsqciwgLcscAwy4WzvqvwbDPJ6bJs
HpWExRpCmkfgnhsucnylpj5WPcWeWjQu7ctnlAKvVEjc/YdnJLmQTf9UAdbXLE/C
Olk6DSQW9VUnao7kez6+Er5I1FnI9hKBpI2gzS3yUYiNq7XJPagI9PF6JoY/fOLR
ooClh1AINqkmsB+WsRwXAWhsRU66y0uZKu/1MgpYDzmXoVbdi9zxh99RFd8D3ykF
kqRELR5jgoBmLGwHWk8yrIgu1DsVccDMp3y7sinL8RDwpSnLIaS/zqqE9WLPQODU
Msk2CGK7Dblh29KLNKOYxgg+E0QbMQ==
=pwKK
-----END PGP SIGNATURE-----

--BEvgsup/CxFtuvLg--

