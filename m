Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED9A7E689
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 18:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940583.1340306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pNU-0004Ba-NS; Mon, 07 Apr 2025 16:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940583.1340306; Mon, 07 Apr 2025 16:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pNU-0004A8-KZ; Mon, 07 Apr 2025 16:31:16 +0000
Received: by outflank-mailman (input) for mailman id 940583;
 Mon, 07 Apr 2025 16:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1pNT-0004A0-0F
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 16:31:15 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b777c8a6-13cd-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 18:31:12 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id 048D8138004D;
 Mon,  7 Apr 2025 12:31:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Mon, 07 Apr 2025 12:31:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 12:31:09 -0400 (EDT)
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
X-Inumbo-ID: b777c8a6-13cd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744043470;
	 x=1744129870; bh=xT4+rhkCW6C45J8Vy4pZUUTZ25K4Fxj6TRhI313bPVI=; b=
	Zv3IC9LfAah7QyJN2K/7EtMR2Loa+3w7YUHgG9Yz5sSKFIqljMcuOTMJZTMEZq+j
	hLKsa1Aasdi2cn0PihG4UC1JhODzGBP4jlixRs6jxsxsCfnNeeBz5zMa/k9+jeq6
	p8sqPtbd/NBlGBtINMRnydfZ60LwKMWqlFD1z0ATP3ulkZv3AwLm44KWxX7JPYTH
	XWjhVyT0nOc7NtvJOft8fTfmINAnIpNwywPlYOMECeCQVHLe4BqgbHld1gjvwmZO
	Wwvrl5Xg1lV9xzpfxrKYtJP4S0w8JmleavbSKWreFSLGcSnTWTN7cOSPaizOqZOs
	trbqlffVS0AV3xwl0vNqeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744043470; x=1744129870; bh=xT4+rhkCW6C45J8Vy4pZUUTZ25K4Fxj6TRh
	I313bPVI=; b=RPOnxul0iUO/R/ZddKcZnVMSwKu0XKMkRLRgfH3Fnz0O1Ycrkf/
	18GCIvK9qwhKXJ3zKiRwWfpbUol1ZdkXTkkGSrpnKb1RYNKOx+BHiarN/pQ/IZRi
	h7Fdw0+fbsrJA+4kjSMXDyp/ABpuVXpdI6SQPZxhdGZ7++9Wg0Be6EXUpjWbcbCy
	o8JU3LAQJdc2BepREhtC2rTFECFnG23NXLnVHy+LyS03DuVDdzio51Ovox2RCIQi
	gWitIC4ihURn4M2PfySdgV3rg/mbc0y44xF6TSBoCAiQVKJ5gcobt4neBPzfsB+Q
	st1oeUbrMWOecBaPoBIvCGnbAXbYwdYE1fg==
X-ME-Sender: <xms:zv3zZ85k9NPw8l25apD7Cqwk1cw-y0DvW7T0PsCfn0tu03YwtAFB4Q>
    <xme:zv3zZ94bfqsbSL2tuYE2b4miL8m_4j6XvVrKrLPRbio42R7NUr-w_VKERqBfTJz3P
    BFfqjDFw0CHTg>
X-ME-Received: <xmr:zv3zZ7epw30Aw1Ch-5X3aFbzSv3XikboRKmNxbJ0nMwtx7qCkygHZh7JEwz31wj-sN3uGZr4fI-DN3lHY73DORHegrXjsbGDNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehs
    shhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhhthhhonh
    ihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhg
    vghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:zv3zZxIZYcJWeumHLHg-8xKCNrL-RoRUoFuad2MeUEt6-L7k08PMsw>
    <xmx:zv3zZwKdufSqyZ-tTVz5x-HmYzJ39pYZ0r3Dx8Vjj1gKkW4dJ2ZfVw>
    <xmx:zv3zZyxC1vAuen7Nz5Wi1RUnG2pjVd1c63jOFzyI_TH4XK07VCuCFQ>
    <xmx:zv3zZ0JG26WqB8orU9VffMAp_-xcN8mZhmYC90GF9fdZyiMYHHlNxg>
    <xmx:zv3zZ589FQae7a9Vwvb_pUze6RzvU5xPrU9B9Z4P0cVqQfFR1jo1o2Sf>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 7 Apr 2025 18:31:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio
Message-ID: <Z_P9y8lxB_-kEcy6@mail-itl>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
 <a2b01279-4e67-4ce9-9752-21c16c33fe32@citrix.com>
 <04ae4edc-8ea6-489d-8485-6e45aa750607@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ld7lPVxnRA0CmEKW"
Content-Disposition: inline
In-Reply-To: <04ae4edc-8ea6-489d-8485-6e45aa750607@citrix.com>


--Ld7lPVxnRA0CmEKW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 7 Apr 2025 18:31:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio

On Mon, Apr 07, 2025 at 05:22:05PM +0100, Andrew Cooper wrote:
> On 07/04/2025 5:17 pm, Andrew Cooper wrote:
> > On 07/04/2025 1:31 pm, Marek Marczykowski-G=C3=B3recki wrote:
> >> Build initrd format directly digestable by the kernel. Additionally,
> >> include it itself inside as boot/initrd-domU file, for domU booting in
> >> tests.
> >> This should avoid the need to repack tar -> cpio as part of the test
> >> job.
> >>
> >> Keep generating initrd.tar.gz as that's still used by older branches.
> >>
> >> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethin=
gslab.com>
> > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >
> >> ---
> >>  scripts/x86_64-rootfs-alpine.sh | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-a=
lpine.sh
> >> index b70b3a5..13e85fa 100755
> >> --- a/scripts/x86_64-rootfs-alpine.sh
> >> +++ b/scripts/x86_64-rootfs-alpine.sh
> >> @@ -58,3 +58,8 @@ passwd -d "root" root
> >>  cd /
> >>  tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
> >>      bin dev etc home init lib mnt opt root sbin usr var
> > What's required to drop the tar version?=C2=A0 Presumably merging the r=
est of
> > your series?
>=20
> NVM, I can't read.=C2=A0 I'm tempted to fold in:
>=20
> #TODO, drop .tar.gz when Xen 4.20 drops out of testing
>=20
> That said, I expect we'll be backporting these changes.


There is one more difference: the cpio.gz contains the whole thing
twice. Once as rootfs for dom0 and then another as boot/initrd-domU.
Dropping .tar.gz is probably a good idea at some point, so I'm okay with
such comment added. But I imagine some future tests may benefit from
just one layer, which may want introducing another cpio.gz without
boot/initrd-domU included. In fact, even right now that might be useful
- for example dom0less arm64 test uses just busybox for domU rootfs, not
the whole archive (so with my changes dom0 rootfs has unused
boot/initrd-domU included).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Ld7lPVxnRA0CmEKW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfz/csACgkQ24/THMrX
1yxwsQf+JBzdK2q/eXEndctbt+sZXevmKq9O6C7aiZLMCk26ixyRY/BwNCuropjI
epNbAoylT3Iwc+quA3j5VUvZwkGO+G0QmQpBEGzluBTKyUBXMomK9mGnASKDqWkd
JVDh5aQ0+s/3IHtx1cg3tN11nGLq1SZhILDmWlKh/M4eh3YFwpAmRgP2O1nZAj/i
/saubMZo+oRNxFbj/yehbKolztEIgGzUT84HHUTJTATltklcQt/pmt3O153P51aj
NtaIFvKhB/P66sYStZ4S5zK4PrhEPOdWXcbxloXJQYZZKlWRz1QKEVDECjlgo8Ty
vrefkbKGErl3/qw4ZZ09Bmi+d2Ri9A==
=dx5b
-----END PGP SIGNATURE-----

--Ld7lPVxnRA0CmEKW--

