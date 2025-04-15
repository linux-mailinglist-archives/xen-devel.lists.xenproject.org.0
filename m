Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE25A89A79
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952637.1348031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4diF-00006s-VZ; Tue, 15 Apr 2025 10:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952637.1348031; Tue, 15 Apr 2025 10:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4diF-0008Vs-SL; Tue, 15 Apr 2025 10:40:19 +0000
Received: by outflank-mailman (input) for mailman id 952637;
 Tue, 15 Apr 2025 10:40:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hH2Z=XB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4diE-0008Vm-KB
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:40:18 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04a71d7e-19e6-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:40:16 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 5CA3A11402E6;
 Tue, 15 Apr 2025 06:40:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Tue, 15 Apr 2025 06:40:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 06:40:14 -0400 (EDT)
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
X-Inumbo-ID: 04a71d7e-19e6-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744713615;
	 x=1744800015; bh=3QI00x+H5wZTnrF69vSppg9W+nDIPR5j+TnbKBDihJA=; b=
	b2Vl6ojs71mSvv8cTuJYarJns4Sw+vE+I/Vv2ZYV5v9DW0GdrumWqikGfCn+1D0D
	TXZUITim3sv9+Ut5Zd2PLUSGrbJWSNSKJ9hrJk8ThY5+U1bz9ce9HQOhFZBmLS9j
	vroYYC/70WpMCMmtUfvVhKM9bCwbHgWC3LkY8JjnqF4xUatfEyeGI2BDRWdmFR1b
	1yEqHBsjhIyHNYTUdiRHU3Zubg02BTISlQgK+bfkX1U9IWV3NVG64nSEPHZuUcz/
	Pd72L4YWfB+OAez15vv/3h3fNY7vK/jW9YvIwTUHVO8MGZQsPC+hfZTq2trB+08V
	Ar5yF/d95mIdZ8Sr+5jtrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744713615; x=1744800015; bh=3QI00x+H5wZTnrF69vSppg9W+nDIPR5j+Tn
	bKBDihJA=; b=qw9y/hvRY/9zeICGN9IyYw+ZV+LS/jME+FGKyxfbP80ogb5mMU0
	YjnC7e4RSD4MctqRlCghACylFwXc4+/58IlawQETy+sAG4JyiScfiSxr2H+wkYLn
	m/KpgaKAIXunGpBbiaxcXDvGXKCtvstuOGWINyvw/ttqGIR0s4hZK361svi88NtS
	pMIQTYS11MqPAiVw5c/Vrx96LPME8998sLZQLoWsV3WlW4sHAuc8j0XxsV4SAc9b
	DPNJGNUWlfK+crNXhBu4tW01IM6B+ip46qsISBPp7BUkdOYz0rGd//vl5m3L7ZrX
	e+sSKnMdbNvqKkC6LSDHiflBGkAL91JUAUQ==
X-ME-Sender: <xms:jzf-Zzw46zuW3nMHpAuy8YIZP36TVgeUdNasc0_20JuYFTlYkWkeuA>
    <xme:jzf-Z7T18v42c3kGKCDhyS6arWXFNCTUH3P-yVkwioCgpKsyho3eHLu2uP_JPkMhg
    yybB-8S1lkK_w>
X-ME-Received: <xmr:jzf-Z9WtgmcUsx_-nPlvHpriKm8SAuuDg_ZibeiYdd4nrxpcrErga0djnxUaCq4F4BiMnvPk08Q6oKz2l5p3V-8LVLe0MBsDRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghr
    nhepgfekuddtffettefhieeuheffkeeuffelvdffuddtteetledtveekfeekleehjefgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhm
    rghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpth
    htohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehs
    uhhsvgdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhr
    tghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorh
    hg
X-ME-Proxy: <xmx:jzf-Z9jNELZX51SUMBwWrbak_1KlhON7X4CM7WhABr8O-mEJZcco6A>
    <xmx:jzf-Z1B5e-2YoZN3oHd7eLlzUVab7-lcnFsRoCffSYIQT2JHrfP32Q>
    <xmx:jzf-Z2IjN8Mo0IAxjAeB5x8mWg0aQvzf2AieVippp2RaBZFkDgYAmw>
    <xmx:jzf-Z0CuObWAy67LTT5_qbw7bDKgbfm3RLpJ375xk51ckg48MhzKrQ>
    <xmx:jzf-Zy6IOURDE_8MBUKrGhQVUn4g289J52XDZ2RwiWNBit_ZKYvlnRH3>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 15 Apr 2025 12:40:11 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <Z_43iyD0Sod4uTN2@mail-itl>
References: <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
 <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
 <Z_4aBL7JhTv_oxWR@macbook.lan>
 <4dd5ada8-32e7-4b94-b2a4-51b20e09eb79@suse.com>
 <Z_4vE1qHlvGliqXY@macbook.lan>
 <0c74e9c9-c01d-4213-af01-cc287d1ef76b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4rqauA1srzC8XHdr"
Content-Disposition: inline
In-Reply-To: <0c74e9c9-c01d-4213-af01-cc287d1ef76b@suse.com>


--4rqauA1srzC8XHdr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Apr 2025 12:40:11 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages

On Tue, Apr 15, 2025 at 12:18:04PM +0200, Jan Beulich wrote:
> On 15.04.2025 12:04, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Apr 15, 2025 at 11:41:27AM +0200, Jan Beulich wrote:
> >> On 15.04.2025 10:34, Roger Pau Monn=C3=A9 wrote:
> >>> On Tue, Apr 15, 2025 at 09:32:37AM +0200, Jan Beulich wrote:
> >>>> On 14.04.2025 18:13, Roger Pau Monn=C3=A9 wrote:
> >>>>> On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
> >>>>>> On 14.04.2025 15:53, Roger Pau Monn=C3=A9 wrote:
> >>>>>>> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
> >>>>>>>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
> >>>>>>>> p2m_mmio_direct.
> >>>>>>>
> >>>>>>> But that won't go into hvm_hap_nested_page_fault() when using
> >>>>>>> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
> >>>>>>> mapped as p2m_mmio_direct)?
> >>>>>>>
> >>>>>>> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is ha=
ndled
> >>>>>>> differently?
> >>>>>>
> >>>>>> All true as long as things work as expected (potentially including=
 the guest
> >>>>>> also behaving as expected). Also this was explicitly only an examp=
le I could
> >>>>>> readily think of. I'm simply wary of handle_mmio_with_translation(=
) now
> >>>>>> getting things to handle it's not meant to ever see.
> >>>>>
> >>>>> How was access to MMIO r/o regions supposed to be handled before
> >>>>> 33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
> >>>>> added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
> >>>>> (~2010), yet I can't figure out how writes would be handled back th=
en
> >>>>> that didn't result in a p2m fault and crashing of the domain.
> >>>>
> >>>> Was that handled at all before said change?
> >>>
> >>> Not really AFAICT, hence me wondering how where write accesses to r/o
> >>> MMIO regions supposed to be handled by (non-priv) domains.  Was the
> >>> expectation that those writes trigger an p2m violation thus crashing
> >>> the domain?
> >>
> >> I think so, yes. Devices with such special areas weren't (aren't?) sup=
posed
> >> to be handed to DomU-s.
> >=20
> > Oh, I see.  That makes stuff a bit clearer.  I think we would then
> > also want to add some checks to {ept_}p2m_type_to_flags()?
> >=20
> > I wonder why handling of mmio_ro_ranges was added to the HVM p2m code
> > in ~2010 then.  If mmio_ro_ranges is only supposed to be relevant for
> > the hardware domain in ~2010 an HVM dom0 was not even in sight?
>=20
> I fear because I was wrong with what I said in the earlier reply: There's
> one exception - the MSI-X tables of devices. DomU-s (and even Dom0) aren't
> supposed to access them directly, but we'd permit reads (which, at least
> back at the time, were also required to keep qemu working).

And there is also a case where some devices have other registers on the
same page as MSI-X tables. But this case is handled specially in the
MSI-X code, not via sub-page R/O API.

> > Sorry to ask so many questions, I'm a bit confused about how this
> > was/is supposed to work.
>=20
> No worries - as you can see, I'm not getting it quite straight either.
>=20
> >>>> mmio_ro_do_page_fault() was
> >>>> (and still is) invoked for the hardware domain only, and quite likely
> >>>> the need for handling (discarding) writes for PVHv1 had been overloo=
ked
> >>>> until someone was hit by the lack thereof.
> >>>
> >>> I see, I didn't realize r/o MMIO was only handled for PV hardware
> >>> domains only.  I could arguably do the same for HVM in
> >>> hvm_hap_nested_page_fault().
> >>>
> >>> Not sure whether the subpage stuff is supposed to be functional for
> >>> domains different than the hardware domain?  It seems to be available
> >>> to the hanrdware domain only for PV guests, while for HVM is available
> >>> for both PV and HVM domains:
> >>
> >> DYM Dom0 and DomU here?
> >=20
> > Indeed, sorry.

I'm not sure about the PV case and domU. I think I tested it at some
iteration, but it isn't configuration that I care much about. If it
doesn't work (and fixing it would make it even more complex), IMO we can
simply adjust documentation of XHCI_SHARE_ANY to say it works only with
HVM domU.

The domU case exists mostly (only?) to enable automated testing. I do a
lot of that on laptops, which have only a single USB controller (no way
to plug any extra one), and I need that USB controller in a domU for
several tests. In fact, the XHCI console is a debugging feature in the
first place. So, the domU part doesn't need security support, can
require extra hoops to jump through etc.

> >>> is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, gla)
> >>>
> >>> In hvm_hap_nested_page_fault().
> >>
> >> See the three XHCI_SHARE_* modes. When it's XHCI_SHARE_ANY, even DomU-s
> >> would require this handling. It looks like a mistake that we permit the
> >> path to be taken for DomU-s even when the mode is XHCI_SHARE_HWDOM.
> >=20
> > Arguable a domU will never get the device assigned in the first place
> > unless the share mode is set to XHCI_SHARE_ANY.  For the other modes
> > the device is hidden, and hence couldn't be assigned to a domU anyway.
>=20
> Correct. Yet then we permit a code path to be taken which is supposedly
> unnecessary, but potentially (if something went wrong) harmful.

Since the XHCI_SHARE_ANY case is rare (and not security-supported),
maybe there should be a global variable guarding this part? It would be
set to true only if XHCI_SHARE_ANY is used (or some future use of this
subpage-ro API with a domU). Then, that code would still be potentially
reachable for all domUs (if XHCI_SHARE_ANY is used), but that's still
better?
Anyway, I'm still not sure what the concern is. What is the (not purely
theoretical) case where domU gains access to the emulator, where without
this feature it wouldn't have it already? Any HVM can hit the emulator
already, regardless of this feature, no?

> >>>>> I'm happy to look at other ways to handling this, but given there's
> >>>>> current logic for handling accesses to read-only regions in
> >>>>> hvm_hap_nested_page_fault() I think re-using that was the best way =
to
> >>>>> also handle accesses to MMIO read-only regions.
> >>>>>
> >>>>> Arguably it would already be the case that for other reasons Xen wo=
uld
> >>>>> need to emulate an instruction that accesses a read-only MMIO regio=
n?
> >>>>
> >>>> Aiui hvm_translate_get_page() will yield HVMTRANS_bad_gfn_to_mfn for
> >>>> p2m_mmio_direct (after all, "direct" means we expect no emulation is
> >>>> needed; while arguably wrong for the introspection case, I'm not sure
> >>>> that and pass-through actually go together). Hence it's down to
> >>>> hvmemul_linear_mmio_access() -> hvmemul_phys_mmio_access() ->
> >>>> hvmemul_do_mmio_buffer() -> hvmemul_do_io_buffer() -> hvmemul_do_io(=
),
> >>>> which means that if hvm_io_intercept() can't handle it, the access
> >>>> will be forwarded to the responsible DM, or be "processed" by the
> >>>> internal null handler.
> >>>>
> >>>> Given this, perhaps what you do is actually fine. At the same time
> >>>> note how several functions in hvm/emulate.c simply fail upon
> >>>> encountering p2m_mmio_direct. These are all REP handlers though, so
> >>>> the main emulator would then try emulating the insn the non-REP way.
> >>>
> >>> I'm open to alternative ways of handling such accesses, just used what
> >>> seemed more natural in the context of hvm_hap_nested_page_fault().
> >>>
> >>> Emulation of r/o MMIO accesses failing wouldn't be an issue from Xen's
> >>> perspective, that would "just" result in the guest getting a #GP
> >>> injected.
> >>
> >> That's not the part I'm worried about. What worries me is that we open=
 up
> >> another (or better: we're widening a) way to hit the emulator in the f=
irst
> >> place. (Plus, as said, the issue with the not really tidy P2M type sys=
tem.)
> >=20
> > But the hit would be limited to domains having r/o p2m_mmio_direct
> > entries in the p2m, as otherwise the path would be unreachable?
>=20
> I fear I don't follow - all you look for in the newly extended conditional
> is the type being p2m_mmio_direct. There's no r/o-ness being checked for
> until we'd make it through the emulator and into subpage_mmio_accept().

But EPT violation can be hit on p2m_mmio_direct page only if it's a
write and the page is read-only, no? Is there any other case that exists
today?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4rqauA1srzC8XHdr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf+N4sACgkQ24/THMrX
1yyRvwf/VKD94EZl++2o6AR8vMk7Rh5dFwOvlcwfyZ1VTrVNbFA3Gi03Li2sseYI
Vv1f7DHlpJmhjAvz/5eAkDGn9vhKLzp9C53AkYqrVDrFCJOhEjDQ95y8dhFPptRY
dHzrrwWRell8WqtvlZHj2CkX35vbV6UPbm+c1hsUBsIWgp7rR8WQdK01YQ/uZZem
lSVT7UU6VcOoNDHC+KPnGcILY8GwQP6bm8/NIywMMUqPbULpd0Uw24MTTeuM59AM
04kEYSHGQ4IaPtPXVX+xRKt4TzFoV7SpqS3BJgz0Tj2IZQP/wS2Rztx4sddTcJ1m
mbr0hE9Ydm5QMPHrgxbx2O1LTcwxcw==
=gDib
-----END PGP SIGNATURE-----

--4rqauA1srzC8XHdr--

