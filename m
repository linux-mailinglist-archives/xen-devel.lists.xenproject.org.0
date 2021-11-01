Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C716D441BDD
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 14:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219197.379900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhXYY-0005tD-Bj; Mon, 01 Nov 2021 13:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219197.379900; Mon, 01 Nov 2021 13:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhXYY-0005rH-8F; Mon, 01 Nov 2021 13:40:58 +0000
Received: by outflank-mailman (input) for mailman id 219197;
 Mon, 01 Nov 2021 13:40:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k6o8=PU=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mhXYW-0005rB-Nr
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 13:40:56 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aefb5d37-c936-45b3-9a43-59b5d21586d1;
 Mon, 01 Nov 2021 13:40:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1589D320005D;
 Mon,  1 Nov 2021 09:40:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Nov 2021 09:40:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Nov 2021 09:40:52 -0400 (EDT)
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
X-Inumbo-ID: aefb5d37-c936-45b3-9a43-59b5d21586d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dc9j7H
	hVVyTihjMe3EFeBiezfmVDidLjZIXdTN4QXDc=; b=KC8B/egB5IVHecPJnqnNyB
	HOPyXcrl6+I3afwdtnuIgxqQpcChCsMnFAf+qOtgc6arHdp0IOicdOVr1SnmqzGI
	ECd7wPq10xVcv4QEEnR27fVTRc/mjTB1s8OxHmd6IV8qplTnjIQsakHoAtFPYscV
	CVEtDLIaU2ey24HJetPRhPrkE1HcFdw/xpOa9owRbJoejikndT6yluOW88FCAHUX
	fF38/BhT7km2HXnsShyHsZUqbjdH5ZJLDeILQZBZOA0mvosu9ARTiBfgkyVcpzYC
	LJmUNPVbggPXeWrDjXsquSAGmjJwSw8HBUWU5y570fQR/FBXc48ye/TocGcBBMRA
	==
X-ME-Sender: <xms:Ze5_YZ-u9hSuMgtaYVkPfpgU1QTNJCddtGHTqktWLWf3jaD7IhcnJg>
    <xme:Ze5_YdtPdbJGU_tEfB_joQY_aG-oK5-U61W22ilZs_gEcgdJfA2u0EbN-nhiXjzlw
    M478l6XP_vO1A>
X-ME-Received: <xmr:Ze5_YXAa9uA_KRabJh2ndIXOc-pUjz1MPo3luTmsXXFh8gBiTrV0TlE5OjBNNIoZuEkFaXW_3gId_pZbpTWvpVTAovqobDcW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehvddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Ze5_YddNraiVTF0dokhtejimIHqXbaWtWS6yxIV05CVy-ItwjLJXVg>
    <xmx:Ze5_YeMSMfaw_mFo4-i_6yJunlDd7xxEFwdbB5M5JCseobWAUhFSKg>
    <xmx:Ze5_YfmYB67qVYQuEuKTYA_fRtTKgjlzB66-ii33sqoy-BWYO8CC3Q>
    <xmx:Ze5_YbrEos8aFK9zG0NMvR2BFQgZYjQYWQGNKCsuEc2brnSvSLiUQQ>
Date: Mon, 1 Nov 2021 14:40:48 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: Ping: [PATCH] x86/xstate: reset cached register values on resume
Message-ID: <YX/uYIk/iwf3kAXX@mail-itl>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
 <6adf41a6-8f05-8ead-2b12-e922939955da@suse.com>
 <YXFuuwvFKbgkavSB@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SzZQVFJFc5Cj6YgJ"
Content-Disposition: inline
In-Reply-To: <YXFuuwvFKbgkavSB@MacBook-Air-de-Roger.local>


--SzZQVFJFc5Cj6YgJ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Nov 2021 14:40:48 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: Ping: [PATCH] x86/xstate: reset cached register values on resume

On Thu, Oct 21, 2021 at 03:44:27PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, Oct 18, 2021 at 10:21:28AM +0200, Jan Beulich wrote:
> > On 24.08.2021 23:11, Andrew Cooper wrote:
> > > On 18/08/2021 13:44, Andrew Cooper wrote:
> > >> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
> > >>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
> > >>> register to the same value over and over. But suspend/resume implic=
itly
> > >>> reset the registers and since percpu areas are not deallocated on
> > >>> suspend anymore, the cache gets stale.
> > >>> Reset the cache on resume, to ensure the next write will really hit=
 the
> > >>> hardware. Choose value 0, as it will never be a legitimate write to
> > >>> those registers - and so, will force write (and cache update).
> > >>>
> > >>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
> > >>> - set_xcr0() is called few lines below in xstate_init(), so it will
> > >>>   update the cache with appropriate value
> > >>> - get_msr_xss() is not used anywhere - and thus not before any
> > >>>   set_msr_xss() that will fill the cache
> > >>>
> > >>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
> > >>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > >> I'd prefer to do this differently.=C2=A0 As I said in the thread, th=
ere are
> > >> other registers such as MSR_TSC_AUX which fall into the same categor=
y,
> > >> and I'd like to make something which works systematically.
> > >=20
> > > Ok - after some searching, I think we have problems with:
> > >=20
> > > cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);
> > > cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
> > > msr.c:35:DEFINE_PER_CPU(uint32_t, tsc_aux);
> > > xstate.c:36:static DEFINE_PER_CPU(uint64_t, xcr0);
> > > xstate.c:79:static DEFINE_PER_CPU(uint64_t, xss);
> > >=20
> > > There is also:
> > >=20
> > > traps.c:100:DEFINE_PER_CPU(uint64_t, efer);
> > >=20
> > > which we *almost* handle correctly, but fail to update the cache on t=
he
> > > BSP out of S3.
> > >=20
> > >=20
> > > For the APIC, I think we have issues with:
> > >=20
> > > irq.c:1083:static DEFINE_PER_CPU(struct pending_eoi,
> > > pending_eoi[NR_DYNAMIC_VECTORS]);
> > >=20
> > > because we don't defer S3 until all pending EOIs are complete.
> >=20
> > As your planned more extensive rework appears to not have made much
> > progress yet, may I suggest that we go with Marek's fix for 4.16,
> > with the one adjustment I suggested alongside giving my R-b?
>=20
> I think that's the only viable solution in order to avoid shipping a
> broken 4.16 so we should go ahead with it.

Do you want me to post v2 with `this_cpu(xss) =3D ~0` change? IIUC that's
the only thing requested in this patch specifically.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SzZQVFJFc5Cj6YgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmF/7l8ACgkQ24/THMrX
1yxYdgf+K89Wfnw02DEP7gIlsy5L0bIvVGKLWE27ElCiOpd/KBWKn+QdqPReLSqS
2Qw9AcCmWk/Nc5ffnJfeTfjQQXTTQv2plE6dQhMK/kQre8Ubq1fVvlaBGqn10oFE
Ap/WO6T9VkfH/IH/CtOQM69yIpt9fV+7S06aw8a23xImlE65CwHoUQhrPgm4+rdt
IRseyV8HffUW+1kvu00kn/FVfGAjUKg/A2abijTRTsooPhQ4wYB6gKSNa5e/edGY
R4s5pnQuq3bW+2iWNLxTB63XuEhksdM6phPWGig9KBa+/PjwZpaksXE5ZlV+Dez9
hUif+QgVT5DLrySgo5xshfwdbaNcOA==
=HMpl
-----END PGP SIGNATURE-----

--SzZQVFJFc5Cj6YgJ--

