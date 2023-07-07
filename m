Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D374AF52
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 13:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560407.876322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjEE-0001hP-Vy; Fri, 07 Jul 2023 11:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560407.876322; Fri, 07 Jul 2023 11:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjEE-0001f7-Rk; Fri, 07 Jul 2023 11:02:22 +0000
Received: by outflank-mailman (input) for mailman id 560407;
 Fri, 07 Jul 2023 11:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3LXA=CZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qHjED-0001f1-HT
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 11:02:21 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc668bb7-1cb5-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 13:02:19 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 54AEE3200914;
 Fri,  7 Jul 2023 07:02:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 07 Jul 2023 07:02:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jul 2023 07:02:13 -0400 (EDT)
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
X-Inumbo-ID: bc668bb7-1cb5-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1688727734; x=1688814134; bh=2JQhjxKyml7irJHr5y4i+kR5NB0VbxX81e8
	nVB6UkMY=; b=MtkHcl9zK76gSt147cAhfus7vEtSPtpsHLRC9F29WwVFMy2CUoW
	1OEQAIDV1BaG7MAZlS8yLmyh6lnmkRZontWBYt3redfjR2o38iRUABq/S4xHKhjg
	EBga80SmmBFaHdry0YN4qds2IldQ9/X7jv7s8B7WmPnl3dzAQOzC5DM0OTKzq2x9
	rZS+U7nELcEHD/YF4Ix7ceKVigcH8XKaq40bAPuLqw74Vgr9yRA7PK+obBlayLq5
	3lPLcgDoDsBDkt4pO8IawfxC5GIt8KmuLmXmz2Zppw0J2/BCm0aFEjehTL0CbZK+
	NMDXNRa5mXY5zhJ2D+Sk2Jar6WfwIgT49hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688727734; x=1688814134; bh=2JQhjxKyml7ir
	JHr5y4i+kR5NB0VbxX81e8nVB6UkMY=; b=N1J0dO5KZq7kWaFRtU7EwMyH/frqe
	ot2dwClYR+g6pnZIH5wXU9vtVoJMIVh88ybE8U1twuIMaXS2lH/BWM+cy0kaijo2
	A5nXS1sceE1Iv9rL/24VCkQcKQrJg0BG9cwRRMAlerWoBFKNg3q4QhRaOhxLMfLj
	yC1hpg/wgwipes9ldaltEP0/U4e4XZE3oU8CkjwNRfX2kg5PWhGppmQXzIyqZ2aD
	NCapEt47Ht0b6BKz47X6jg+q5RZAKuCcoCT7AAV3ybST1sz7s93x26r7y1FHVNZP
	tfPQbJGMYDTRZKSO5GStMdljVxjg2Zhmlq1/33veWiTa0ivSVr1FCavQA==
X-ME-Sender: <xms:tvCnZOsXexGsJVEQ6eNYpEsWR_eiLfjLkUIu4j29UFuhvs3Q-RTwIQ>
    <xme:tvCnZDdtgCdXoi2sQAPtz9138T7RnVbUkiM-4QTQ9sH8FI_vKsTM0NTln4PS9_O-1
    GYFsm1YntVU1A>
X-ME-Received: <xmr:tvCnZJxC4ovZxBF7L6zbzosh_3_qThz399iw20OcPrlRTUw6EXBWWbAlcictABagp0gdxBIyoXIWCd612Skxy80ATNIvJJR6j1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvddugdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tvCnZJPw4cuNJ9GSOcu4LMPB1mQ_v40zBbQEPQsPNAOxeMiHMf_7yQ>
    <xmx:tvCnZO9EH0s6vVQdLWiHTfTNvdudie9Pn0Jd1i-ACtf3ZCdNhpN9Gw>
    <xmx:tvCnZBWweWNHEeO7oh8OK90QQLT9pAMum10zHnLzZh4gx4-3ubBc8g>
    <xmx:tvCnZFYjvsphxvBY2SdinnwKbjUpPm9TUqmSvh8Wr_KV0fVstIDsMQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 7 Jul 2023 13:02:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <ZKfwsvFmwEo+gzh9@mail-itl>
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
 <f3531050-fb31-2d9e-f3dd-2d310dc7c5ec@suse.com>
 <ZJ9XFdGhxyKLY3fm@mail-itl>
 <3773dc6e-9d36-ba80-2a0a-bb1589c9993f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9xpvJaW4i3iau5pz"
Content-Disposition: inline
In-Reply-To: <3773dc6e-9d36-ba80-2a0a-bb1589c9993f@suse.com>


--9xpvJaW4i3iau5pz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Jul 2023 13:02:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Wed, Jul 05, 2023 at 10:23:53AM +0200, Jan Beulich wrote:
> On 01.07.2023 00:28, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, May 30, 2023 at 01:56:34PM +0200, Jan Beulich wrote:
> >> On 05.05.2023 23:25, Marek Marczykowski-G=C3=B3recki wrote:
> >>> --- a/xen/arch/x86/hvm/hvm.c
> >>> +++ b/xen/arch/x86/hvm/hvm.c
> >>> @@ -1990,6 +1990,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, uns=
igned long gla,
> >>>          goto out_put_gfn;
> >>>      }
> >>> =20
> >>> +    if ( (p2mt =3D=3D p2m_mmio_direct) && npfec.write_access && npfe=
c.present &&
> >>> +         subpage_mmio_write_accept(mfn, gla) &&
> >>> +         (hvm_emulate_one_mmio(mfn_x(mfn), gla) =3D=3D X86EMUL_OKAY)=
 )
> >>> +    {
> >>> +        rc =3D 1;
> >>> +        goto out_put_gfn;
> >>> +    }
> >>
> >> But npfec.write_access set doesn't mean it was a write permission
> >> violation, does it?=20
> >=20
> > Doesn't it? IIUC it means it was a write attempt, to a mapped page
> > (npfec.present), and since we've got EPT violation, it got denied.=20
>=20
> But the denial may have been for reasons other than the W bit being
> clear, at least in principle? Abusing the bit now, even if in
> practice there was no other possible reason on existing hardware
> with the features we presently use, might lead to hard to locate
> issues in case a different reason appears down the road.

Ok, so how do you propose to check if it was a write violation?

(...)

> >> Since you mark the qwords which are to be protected, how is one to set
> >> up safely two discontiguous ranges on the same page? I think I had
> >> asked for v1 already why you don't do things the other way around:
> >> Initially the entire page is protected, and then writable regions are
> >> carved out.
> >=20
> > Because that's not how the API is used. This API is for those how want
> > to write-protect some specific ranges (to be written exclusively by
> > Xen). They don't need to even know what is else is on the same page.
> > Take XHCI case as an example: it gets the range to write-protect by
> > enumerating XHCI extended capabilities, which is a linked list. The
> > driver gets info where XHCI console registers are.  Things before/after
> > them on that page may not even be XHCI extended caps at all.
> > This in fact is very similar approach to already existing
> > mmio_ro_ranges.
>=20
> While I agree there's a similarity, multiple entities caring about the
> same MFN isn't an expected scenario there. Whereas here you explicitly
> add support for such.
>=20
> Furthermore you sub-divide pages covered by mmio_ro_ranges here, so
> defaulting to "full page protected" and then carving out sub-regions
> would be the more natural approach imo.

But then the API would be awkward to use. Instead of "mark this (smaller
than a page) region as read-only" so Xen can use it safely, you would
(likely) need marking _two_ regions as writable, after marking a page as
read-only. So, either you'd need separate (3?) calls, array of ranges or
something similar.

> >> I guess I shouldn't further ask about overlapping r/o ranges and their
> >> cleaning up. But at least a comment towards the restriction would be
> >> nice. Perhaps even check upon registration that no part of the range
> >> is already marked r/o.
> >=20
> > Yes, this is a good suggestion, I'll add that.
>=20
> As long as all restrictions are properly spelled out, this may be
> sufficient. But please don't be surprised if I ask again on a
> subsequent version.

(...)

> >>> +static void subpage_mmio_write_emulate(
> >>> +    mfn_t mfn,
> >>> +    unsigned int offset,
> >>> +    const void *data,
> >>> +    unsigned int len)
> >>> +{
> >>> +    struct subpage_ro_range *entry;
> >>> +    void __iomem *addr;
> >>> +
> >>> +    rcu_read_lock(&subpage_ro_rcu);
> >>> +
> >>> +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
> >>> +    {
> >>> +        if ( mfn_eq(entry->mfn, mfn) )
> >>> +        {
> >>> +            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_=
qwords) )
> >>> +                goto write_ignored;
> >>
> >> I think you can get away with just a single "goto" by putting the gpri=
ntk()
> >> (and its label) here.
> >=20
> > write_ignored label is used also below in "default" case (which should
> > be unreachable, but still).
>=20
> Right, which is why I said 'just a single "goto"' (implying a label would
> still be needed).
>=20
> > Do you suggest jumping from default case into here?
>=20
> Yes, that would be one way of structuring things.

IMO jumping into a middle of some nested conditional/loop is harder to
follow, I'd prefer to avoid such practice. Furthermore, if moving the
gprintk here, it still needs "goto out_unlock", so it isn't really
saving any "goto", just changing its target.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9xpvJaW4i3iau5pz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSn8LIACgkQ24/THMrX
1yx4gwf/eHlpAf5cam8pUZ4YggNwBd0X4vWyXFHzn3myrhHploaGC9WLZLU+if5d
4zhVi4K63+F2TuLw0QA7ejxtvO9n/g9PlqUWVbq/cCBeWI4mNsE87OphGySeLWE/
t22aKb/cMSgIS0Pfu5TTe7rB97FXftxBf/GGmrv5HXFgOlLHb4qdnyamFmOYzWRY
1C1XFDr4gsrFPpYb7AtGBWLaLkMECUr4/5CXpGkJMvWEJG07tdZlVRq/QWWBOMwx
Y4S2LZc1vACSgbsScluwdpvEONNPBAaZ5Y/fffS1qB13zn9AGW2RHOfw+tjJbuuJ
mf55mWS8Z8neK4EYoRFBtlM2erboFA==
=usiB
-----END PGP SIGNATURE-----

--9xpvJaW4i3iau5pz--

