Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB12ACDC98
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 13:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005443.1384934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMmMw-00085U-7l; Wed, 04 Jun 2025 11:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005443.1384934; Wed, 04 Jun 2025 11:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMmMw-00083F-5D; Wed, 04 Jun 2025 11:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1005443;
 Wed, 04 Jun 2025 11:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sp6j=YT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMmMu-000839-Ph
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 11:33:16 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0eb7c76-4137-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 13:33:11 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 9C5F3114015A;
 Wed,  4 Jun 2025 07:33:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 04 Jun 2025 07:33:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Jun 2025 07:33:05 -0400 (EDT)
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
X-Inumbo-ID: b0eb7c76-4137-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749036787;
	 x=1749123187; bh=HVHucHtMlP6nGhlONqDyv1khxvbB4JaPQQFnu+jh2fY=; b=
	RmSB/mR78IyOYI7VGWCuHUzJmpeHR6n+kI6jtSRL9fnzQCgddzkpw79ewuAkFRKh
	3X3q/O3IGnPv4SXsMtT9wIGuwCuZtb35XNh4eG7Cz1rkmN86G4USj3u6RTg309Vn
	3OP/akIO0AR7ws1BKChEJWSr2jV5POmkP5RaAltK9SdrPPoWifrHptXRetCl6BfM
	oTgCNKKDWMu4Bhx6DCuF3jjMpODgjsoF5yEFZljoD8QV8N9PCFPuLRGVT+yAadQ2
	GxqOqfX5LfKEgMhvpbxfDZ4zNb1ZnQbCD29eWYIMwMnNzd0vJPLA0d8xCh5enyjw
	bgozlkyvMkrgcIHJiTBJKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749036787; x=1749123187; bh=HVHucHtMlP6nGhlONqDyv1khxvbB4JaPQQF
	nu+jh2fY=; b=afSyQJyyGUeb3/MLgZqcLh3W7eLl3lXm1ryldIqogBZ3HuoDXKs
	wYv6SZYhyDjJdlnpx/794mXfC//Iq9atNZPG8PiScfjsCHJsS11eee7Rra5MwNNu
	2Qh/I5kb2apC/ki9+YtPTWt5ceNCNP+LnSS7Np9wfvMwyvR54waw1p0Tjtp2RBm5
	91+FY63BILG53Af+AA6V0rBw6WruIoMVV8z3I9bh4oRoYhPvtt+Usf3E9bx2aUmV
	VT0GvqMSFpSceE7RUjw7sGsOJ88k+JBDgspduOnJgRh7DOmvr4nTcnNJl+Q/E+A1
	X1YC2D2IwNw03E+c/fuKRN93X0J4IvhZd8w==
X-ME-Sender: <xms:8y5AaBED1NLGtxOuN5MtJaCtfH4-mdmexrIORmyIz_EkUXoXfrZWpg>
    <xme:8y5AaGWwqBjqimm86-7ghRdOzlBaeLDa6-03MuuuBqCUYFZPoHnZkuwZ3I0uB-S3D
    R5-OnrWbZhlIA>
X-ME-Received: <xmr:8y5AaDIxyjgUVjPhKtZEWSWMjRz6c4WdH7dKDcJF8ewRbxSZnFKGUDkPTMyfeCbm66cnXQ5UXtafsVYkXEqJpdUrBl8RIKh4sSk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonh
    ihseigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinhhi
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrd
    igvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghr
    ugesvhgrthgvshdrthgvtghhpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homh
X-ME-Proxy: <xmx:8y5AaHFKRdFc-HaiL6AlGtKmKVzV6gyprjujo8s_lbnfKyEuVIfvvQ>
    <xmx:8y5AaHX80TVvJ_Qkk05-C1hyiqJtzPseGJ1LF50Sw9WMaRBZjYZsGQ>
    <xmx:8y5AaCM4_EVwUCNZzDU_KjSO3MTFC98_0thevmDwJccxrPv1pufnBQ>
    <xmx:8y5AaG3qtPPLVuuwt_6NCq5IV9Ja91J1edhU4yOXgXn_MwbZ7IPe0g>
    <xmx:8y5AaNO1OUhmhnxNTxH4RL92thO4yPhs_Qq8lOYVRpMdar7n2JdCNaeY>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 4 Jun 2025 13:33:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 9/9] CI: Add timing to junit
Message-ID: <aEAu753_eexjZn08@mail-itl>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-10-anthony@xenproject.org>
 <alpine.DEB.2.22.394.2506031130060.1147082@ubuntu-linux-20-04-desktop>
 <aEAIXmOlht3b9TkK@l14>
 <384fd17a-9236-4727-b564-543edff65e9e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gLpLWhxf59BS+ZUw"
Content-Disposition: inline
In-Reply-To: <384fd17a-9236-4727-b564-543edff65e9e@citrix.com>


--gLpLWhxf59BS+ZUw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Jun 2025 13:33:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 9/9] CI: Add timing to junit

On Wed, Jun 04, 2025 at 11:57:11AM +0100, Andrew Cooper wrote:
> On 04/06/2025 9:48 am, Anthony PERARD wrote:
> > On Tue, Jun 03, 2025 at 11:35:22AM -0700, Stefano Stabellini wrote:
> >> On Tue, 3 Jun 2025, Anthony PERARD wrote:
> >>> From: Anthony PERARD <anthony.perard@vates.tech>
> >>>
> >>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> >>> ---
> >>>  automation/scripts/run-tools-tests | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/=
run-tools-tests
> >>> index 852c1cfbcf..e38cc4068c 100755
> >>> --- a/automation/scripts/run-tools-tests
> >>> +++ b/automation/scripts/run-tools-tests
> >>> @@ -18,9 +18,12 @@ for f in "$1"/*; do
> >>>          continue
> >>>      fi
> >>>      echo "Running $f"
> >>> -    printf '  <testcase name=3D"%s">\n' "$f" >> "$xml_out"
> >>> +    time_start=3D$EPOCHREALTIME
> >>>      "$f" 2>&1 | tee /tmp/out
> >>>      ret=3D${PIPESTATUS[0]}
> >>> +    time_end=3D$EPOCHREALTIME
> >>> +    time_test=3D"$(bc <<<"$time_end - $time_start")"
> >> As it looks like no other scripts need bc at the moment but we already
> >> rely on awk (automation/scripts/xilinx-smoke-dom0less-arm64.sh) I'd
> >> prefer this version:
> >>
> >> time_test=3D"$(awk "BEGIN {print $time_end - $time_start}")"
> > You mean I have to choose between busybox and busybox?
> >
> > $ ls -l $(which bc awk)
> > lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/awk -=
> /bin/busybox
> > lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/bc ->=
 /bin/busybox
> >
> > :-)
> >
> > I guess it doesn't really matter.
> >
> > One difference though:
> > $ awk "BEGIN {print $time_end - $time_start}"
> > 3.28798
> > $ bc <<<"$time_end - $time_start"
> > 3.287982
> >
> > awk is less precise, but I guess that doesn't matter as well, gitlab UI
> > isn't going to show the extra digits.
> >
> > So I guess I can change to use `awk` instead, just in case for some
> > reason `bc` isn't present, since `awk` seems mandatory for many of our
> > scripts.
> >
> > Thanks,
>=20
> bc is a normal posix utility just like awk is, so there's no change in
> dependencies caused by this.

Linux requires bc for building, and I _very_ often find systems where it
isn't installed by default (by awk is)...
Anyway, that's probably irrelevant in the CI container that has busybox
for both.

> Furthermore, it is the right tool for this job in a way that awk isn't.=
=C2=A0
> Besides the reduction in precision, see xen/tools/check-endbr.sh for the
> number of ways we found that awk malfunctions with large numbers.
>=20
> I firmly suggest continuing to use bc here.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gLpLWhxf59BS+ZUw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhALu8ACgkQ24/THMrX
1ywPrAf/WXoFOT1N4ZV7X58Tedefv5mCJsCSPQPPZUZGy+uhm22fwPH6ER5MFJl8
K3jcH/gsao2efdSOAmGzdVFT3AEj+ICoxVsYo/T+IaMZ+8Y9xtWIZ4xLHrYDf41/
+JOvXkdTbTRu5QK67h4xGUlsst3WsZfyBj0pZF9nHF66zwJLc6DLWRv0bGk2+z3Q
+hSa0ROB2kfupptaFoMb0Z/0dPvpLbTFKqGVDWO/u4X5yoz7RHyGE5Aw0PAMrHRG
HndYo6mYnZRA+SB+zGSF8Y+oVp+Vx2T1s5yk5wZg2Yz9vbuNyMQvZpYSfTKXPPbF
yfm9M01Sy86nC9xQ015X212Ux63O9A==
=f70P
-----END PGP SIGNATURE-----

--gLpLWhxf59BS+ZUw--

