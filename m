Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF66662F479
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445667.700942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Lk-0000KA-N8; Fri, 18 Nov 2022 12:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445667.700942; Fri, 18 Nov 2022 12:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0Lk-0000H7-JU; Fri, 18 Nov 2022 12:20:04 +0000
Received: by outflank-mailman (input) for mailman id 445667;
 Fri, 18 Nov 2022 12:20:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0R6=3S=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ow0Li-0008Kc-TS
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:20:02 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5228ed3b-673b-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 13:20:00 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 28C463200C05;
 Fri, 18 Nov 2022 07:19:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 18 Nov 2022 07:19:58 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 07:19:56 -0500 (EST)
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
X-Inumbo-ID: 5228ed3b-673b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668773997; x=
	1668860397; bh=iSvtC9+L0nNeMjsqo3aw2P2BV9TWCeGKsRvhhRZP+aY=; b=T
	yewhoAq51qYRBPPNQ+6c53Guc+5DPzuO12hTBFmzno0fwFlrgemX+H2rIuICZril
	CNF9lSVHq3ba3oXZUH4EvAAivoVng/EOTmBMxVDVNNnvzoz1RMHn7Q89oxxqASU/
	u+8cfF4XN46jfgFSWk8WKJecU/1duwwW8KP+YOIXgi7BybkiVV5HnCTm345tTXR1
	WQwYEHQmsprKW9m2ORGWPxYV25KZ+V8po30x4AUaqovaDoL4D7EItvH8oJ2K/d6T
	WwM+8NRb822HZGDyYaIE8v+OKY0lwRGrl9FXqWZlhoJLLTGIFemb1DoIv/f+OPie
	h74tzNCymN1swz80E1ARw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668773997; x=1668860397; bh=iSvtC9+L0nNeMjsqo3aw2P2BV9TW
	CeGKsRvhhRZP+aY=; b=Av4Al2j1m8m9NLGtPWA+6zQrJtaODUlwsJC9Ibm4IjT/
	HRxP6Lj3SFYHKYXkM9fZRecFFuJynfBWZnJgXDkYNbdAx7jHfbtzg/y49MNYgPZg
	E+9PEj/ScKXdO6Vdcmw+s6vfLGvjewrTIWJl2FlW/AzcSL1i+zkL6xuFYUFyLsjz
	PLoFpxORSVQBZjt7kLYoHmzRazvbOhObuB/uREcY9hnG/8XMuA12r4OsiIiB//J4
	0pqPWT4/5LJHqtLpTr2iWhmD9LZXPqWHqAhEdKjfTvEb5XeH14XDwXh54iutgj6T
	n8NGR3pzIcn4w2TK1/PXSaxNofbYwn/yEptCojfuFA==
X-ME-Sender: <xms:bXh3Y-CuK6UaeZbgkyvt3UdPvfZ44OnYgmj0esFRAQNPoKfuD248SQ>
    <xme:bXh3Y4jRLFHfyXwmXTcJOjsDD-Z3dLDpeesHyNDwJa0ibQLbiot14Ka5tVWtA8-or
    If6nn2v5PChVA>
X-ME-Received: <xmr:bXh3Yxm_FeWypT2ui83Puccr-kboSpfKXP4JqAlMuhjVcIieXusEwjcb_R1AojyPgb_yL8FZ9hRfMTzhATfq22auXp5aTl-3sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:bXh3Y8w_4jHM20ijXmIQq58LmDbAHeTqJ43FImnERyDmCoSqXWSc4g>
    <xmx:bXh3YzQ2-naZVsykwsuoASPWU6O4ZOUfevf-u0WnLut0AwNXY2Zi1g>
    <xmx:bXh3Y3ZoEga-oTghJ9860Tm1nRq8Fot7izLYMBjuu53qt2ZvdKQ2YA>
    <xmx:bXh3Y-dVOpxVXNmKIU8T-70QLDixWUJUqxgzhBwLckFHDiJMTcajig>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 18 Nov 2022 13:19:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table
Message-ID: <Y3d4aW4LjYwEZ85Z@mail-itl>
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
 <15138618-5cb0-8304-a56b-cb787e187772@suse.com>
 <Y3ZwAJITlD/rSf/n@mail-itl>
 <cc75d927-b936-0716-bf36-70bb65be7a1e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SYnEHPhPt8JfjktG"
Content-Disposition: inline
In-Reply-To: <cc75d927-b936-0716-bf36-70bb65be7a1e@suse.com>


--SYnEHPhPt8JfjktG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Nov 2022 13:19:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table

On Fri, Nov 18, 2022 at 08:20:14AM +0100, Jan Beulich wrote:
> On 17.11.2022 18:31, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Nov 17, 2022 at 05:34:36PM +0100, Jan Beulich wrote:
> >> On 14.11.2022 20:21, Marek Marczykowski-G=C3=B3recki wrote:
> >>> --- a/xen/arch/x86/msi.c
> >>> +++ b/xen/arch/x86/msi.c
> >>> @@ -961,6 +961,21 @@ static int msix_capability_init(struct pci_dev *=
dev,
> >>>                  domain_crash(d);
> >>>              /* XXX How to deal with existing mappings? */
> >>>          }
> >>> +
> >>> +        /*
> >>> +         * If the MSI-X table doesn't span full page(s), map the las=
t page for
> >>> +         * passthrough accesses.
> >>> +         */
> >>> +        if ( (msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & (PAGE_SIZE -=
 1) )
> >>> +        {
> >>> +            uint64_t entry_paddr =3D table_paddr + msix->nr_entries =
* PCI_MSIX_ENTRY_SIZE;
> >>> +            int idx =3D msix_get_fixmap(msix, table_paddr, entry_pad=
dr);
> >>> +
> >>> +            if ( idx >=3D 0 )
> >>> +                msix->last_table_page =3D fix_to_virt(idx);
> >>> +            else
> >>> +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table =
page: %d\n", idx);
> >>> +        }
> >>
> >> Could we avoid the extra work if there's only less than one page's
> >> worth of entries for a device? But then again maybe not worth any
> >> extra code, as the same mapping will be re-used anyway due to the
> >> refcounting that's being used.
> >=20
> > I was considering that, but decided against exactly because of
> > msix_get_fixmap() reusing existing mappings.
> >=20
> >> Makes me think of another aspect though: Don't we also need to
> >> handle stuff living on the same page as the start of the table, if
> >> that doesn't start at a page boundary?
> >=20
> > I have considered that, but decided against given every single device I
> > tried have MSI-X table at the page boundary. But if you prefer, I can
> > add such handling too (will require adding another variable to the
> > arch_msix structure - to store the fixmap location).
>=20
> To limit growth of the struct, please at least consider storing the fixmap
> indexes instead of full pointers.

Ok.

> >>> @@ -1090,6 +1105,12 @@ static void _pci_cleanup_msix(struct arch_msix=
 *msix)
> >>>              WARN();
> >>>          msix->table.first =3D 0;
> >>>          msix->table.last =3D 0;
> >>> +        if ( msix->last_table_page )
> >>> +        {
> >>> +            msix_put_fixmap(msix,
> >>> +                            virt_to_fix((unsigned long)msix->last_ta=
ble_page));
> >>> +            msix->last_table_page =3D 0;
> >>
> >> To set a pointer please use NULL.
> >=20
> > Ok.
> >=20
> >> Overall it looks like you're dealing with the issue for HVM only.
> >> You will want to express this in the title, perhaps by using x86/hvm:
> >> as the prefix. But then the question of course is whether this couldn't
> >> be dealt with in/from mmio_ro_emulated_write(), which handles both HVM
> >> and PV.=20
> >=20
> > The issue is correlating BAR mapping location with guest's view.
> > Writable BAR areas are mapped (by qemu) via xc_domain_memory_mapping(),=
 but
> > that fails for read-only pages (and indeed, qemu doesn't attempt to do
> > that for the pages with the MSI-X table). Lacking that, I need to use
> > msixtbl_entry->gtable, which is HVM-only thing.
> >=20
> > In fact there is another corner case I don't handle here: guest
> > accessing those registers when MSI-X is disabled. In that case, there is
> > no related msixtbl_entry, so I can't correlate the access, but the
> > page(s) is still read-only, so direct mapping would fail. In practice,
> > such access will trap into qemu, which will complain "Should not
> > read/write BAR through QEMU". I have seen this happening several times
> > when developing the series (due to bugs in my patches), but I haven't
> > found any case where it would happen with the final patch version.
> > In fact, I have considered handling this whole thing via qemu (as it
> > knows better where BAR live from the guest PoV), but stubdomain still
> > don't have write access to that pages, so that would need to be trapped
> > (for the second time) by Xen anyway.
> >=20
> > For the PV case, I think this extra translation wouldn't be necessary as
> > BAR are mapped at their actual location, right?
>=20
> I think so, yes.
>=20
> > But then, it makes it
> > rather different implementation (separate feature), than just having a
> > common one for PV and HVM.
>=20
> It would be different, yes, and if - as you explain above - there are
> technical reasons why it cannot be shared, then so be it. Mentioning
> this in the description may be worthwhile, or else the same question
> may be asked again (even by me, in case I forget part of the discussion
> by the time I look at a particular future version).

Ok, I'll extend the commit message.

> >> Which in turn raises the question: Do you need to handle reads
> >> in the new code in the first place?
> >=20
> > The page not being mapped is also the reason why I do need to handle
> > reads too.
>=20
> Just for my own clarity: You mean "not mapped to qemu" here?

No, to the HVM domain (in p2m). Xen (outside of MSI-X specific code for
HVM) doesn't know where those reads should be from.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SYnEHPhPt8JfjktG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN3eGkACgkQ24/THMrX
1yxmsgf9HBYVECbngHhti/dCGQVxhEiVTP17KAmcb/TactXFS0LB3Pjzih4nErLk
aDT1362UI/HP4Czj81iAcTMDVoXMM/P2m2B5QfAjD+7vlOae2rWtZ5PK+Ua+e/Iv
Vl7dciGlF9Q6+gTzZkHrDJ16wbZdTCfAz1N+VK4e0Pl8OaieHU1DUVKI8bTHm7RY
E+5T4W5mQdbqhuxGkqOEnTyldfV7rbKQFSp8n1XTvozUL6PDxsg7ABH+yWpwan9j
DVHws3SlIQ7NRsYCns4ZasmEHwiNbWvzTWhJ0KlAhAqzrBymAUTLXFP7sz1GlESB
oY8TRMut8vz4tJW3n24Rr6bATnoOOg==
=FnA0
-----END PGP SIGNATURE-----

--SYnEHPhPt8JfjktG--

