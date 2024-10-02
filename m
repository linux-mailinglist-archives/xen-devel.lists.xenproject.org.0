Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3544C98D8BA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 16:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808807.1220827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svzy8-0005tc-4v; Wed, 02 Oct 2024 14:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808807.1220827; Wed, 02 Oct 2024 14:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svzy8-0005r2-1Y; Wed, 02 Oct 2024 14:04:44 +0000
Received: by outflank-mailman (input) for mailman id 808807;
 Wed, 02 Oct 2024 14:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lMz=Q6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1svzy6-0005qw-Uq
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 14:04:43 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4396be8c-80c7-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 16:04:40 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 10A4C114009C;
 Wed,  2 Oct 2024 10:04:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 02 Oct 2024 10:04:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 10:04:36 -0400 (EDT)
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
X-Inumbo-ID: 4396be8c-80c7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727877879;
	 x=1727964279; bh=5lQqEsdx0CFV7+w9KNwfj3mLkJMhU7CBwPratBvDi3w=; b=
	hIV9z2B9/BLfUEiQ2A3FY1yj2FEym8969VU9WjG4M1gu13dm0gxmzuqrHJcRU/O5
	SqIG1JxbrKnzlB3tKfPv8UWE/8nhSe8SyaJsIRGMeucdJxVqOzZX6ivAqbFV2tGz
	O1JN9b/TrK8PpPlhLPcptJj1+97XQlb0hMFnr1R+tR8pE2XwmW6ip2/e34hrs2lq
	CUX6ItowRkMCqpeN26vhXrhbjJr39QjjcVN+abrkoB39Z2mrCrdgUC1PdaSWESVU
	2yX1kbCGOi1GObzib/WjXyLg9LrOmynlzOuESMWz5k5VNztNCimMFf4vmEWZV+my
	SqAEXiPtnR8dPlB2HWJTDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727877879; x=1727964279; bh=5lQqEsdx0CFV7+w9KNwfj3mLkJMh
	U7CBwPratBvDi3w=; b=Clu1G4ssXZiZYzbTV9Aj0+kiLiZsk/b3f2iqksUTW+Fb
	KUDu/YSGJsKwdMCm4RzgcMCjgvfiZQEfu+WPW1G+JMupCa2TBzB9C+0Skm8DlYNE
	M6RayYC0nW35MzhCrtytANztPlstxCfAeeFo7YdfFX1D1C5BzMt2rse4XC5LTx20
	iiazTmdfudiTjx72wfKXdgaUxNt+rXwbLR4lSmG2Ym9pSvz8EoB/Q7+kRbMy3egd
	L1zklEytOfQ1gqX9PzFRD2rZikDvyG6+zA/cwYpsS4amfBtWdF4dWMmNtDL7pGAL
	/HKOeaweSEsCz4D2p+CgURwR1FdAv0SQ01ptnfxYfQ==
X-ME-Sender: <xms:9lL9Ztoh5_cqA6p9uX7E_xxlzgcoBd4RPpKKop9h5tihzjByNMlHyw>
    <xme:9lL9Zvphwb6s6GfD6vWHvlm-kEODFoV9XlTpHE88OwSs-S5sGncKWlCL-hwhhSwll
    wfR1tO8gxpExA>
X-ME-Received: <xmr:9lL9ZqOrNQwUt7mmnFOKeasAF_uI5m0CfWX9CUz3LcOFr7nYo46nyIOafmNT-oPuJONFYeCZwMY9lLsGugKzUJELzuhBrckiRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheetheelge
    euledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegtlhhouh
    gurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprh
    gtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghp
    thhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepughpsh
    hmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:9lL9Zo7yNUTsyBKgg6Oj-ja8kOewXC-3SAl-Wkybq-jhXQ75Z1PHGQ>
    <xmx:9lL9Zs6eD35TrZTW5KZBtwI1R6w7jhy2xi6-p7cXfLGB5BnOxeskdA>
    <xmx:9lL9ZghOIkCSZIUYYe060OaBOhauIF01-CusklEWy1ZISp0ALmmJlA>
    <xmx:9lL9Zu76s3JMSe1AA5uUNp9mFkNtQ2HA2Pl9HLQaxASN8gkGKOfTZw>
    <xmx:91L9ZmQ-DvyKz3ePyF3Z-aWrwz76T0nd-EscQ-MYrcvOQzE7cAA1GeQY>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 2 Oct 2024 16:04:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code
Message-ID: <Zv1S88isxSSMuqqk@mail-itl>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o0uWTmDI7XYT7Mcq"
Content-Disposition: inline
In-Reply-To: <20241001102239.2609631-1-frediano.ziglio@cloud.com>


--o0uWTmDI7XYT7Mcq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Oct 2024 16:04:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code

On Tue, Oct 01, 2024 at 11:22:37AM +0100, Frediano Ziglio wrote:
> This series came from part of the work of removing duplications between
> boot code and rewriting part of code from assembly to C.
> Rewrites EFI code in pure C.

The MB2+EFI tests on Adler Lake fail with this series:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1478766782
Looking at the VGA output (unfortunately not collected by the test
itself) it hangs just after bootloader, before printing anything on the
screen (or even clearing it after bootloader). The serial is silent too.

It does pass on Zen 3+ runners.

Since there were some issues with the ADL runner today on plain staging,
I'm not 100% sure if it isn't some infrastructure issue yet. But the
symptoms look different than usual infra issues (and different than
todays failures on staging), so I think it's more likely an issue with
the patches here.

> Changes since v1, more details in specific commits:
> - style updates;
> - comments and descriptions improvements;
> - other improvements.
>=20
> Changes since v2:
> - rebased on master, resolved conflicts;
> - add comment on trampoline section.
>=20
> Changes since v3:
> - changed new function name;
> - declare efi_multiboot2 in a separate header;
> - distinguish entry point from using magic number;
> - other minor changes (see commens in commits).
>=20
> Changes since v4:
> - rebase on staging;
> - set %fs and %gs as other segment registers;
> - style and other changes.
>=20
> Changes since v5:
> - fixed a typo.
>=20
> Changes since v6:
> - remove merged patch;
> - comment and style;
> - change some pointer checks to avoid overflows;
> - rename parse-mbi2.c to mbi2.c.
>=20
> Frediano Ziglio (2):
>   x86/boot: Rewrite EFI/MBI2 code partly in C
>   x86/boot: Improve MBI2 structure check
>=20
>  xen/arch/x86/boot/head.S       | 146 +++++++--------------------------
>  xen/arch/x86/efi/Makefile      |   1 +
>  xen/arch/x86/efi/efi-boot.h    |   7 +-
>  xen/arch/x86/efi/mbi2.c        |  66 +++++++++++++++
>  xen/arch/x86/efi/stub.c        |  10 +--
>  xen/arch/x86/include/asm/efi.h |  18 ++++
>  6 files changed, 123 insertions(+), 125 deletions(-)
>  create mode 100644 xen/arch/x86/efi/mbi2.c
>  create mode 100644 xen/arch/x86/include/asm/efi.h
>=20
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--o0uWTmDI7XYT7Mcq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb9UvMACgkQ24/THMrX
1yxxXggAhkNXUPwtMm5WYb8vxh4ORDoIB8O8LA5pWsByrw8xz6e78rfLtnW9AAsO
ZEpuyWSVhaie8jPzM1HTIUbxyBteSlbsRIIsR9mjoMlgEp5DUgEP6HCLKSiPs2H3
YXPchdg0Q3xOui31+L9hD9OF5m+gLOn+vpKZLErLAFuzA5tGhQU3aRL+3T2frgCH
TkHWbReFX/Yp31QBPXg8GKhKjnBmwnwG7SMWs17nD9dVd7ORlJqgIQkfDMr7icaD
IAcZPbvwRnlh37nhTsEhRUqZ5GClKWCIo8T7wI9x4/TnMST/RhoZjiJf9YTWEO+n
lUjF0E4LjYYd29zymMLUBiNTbZ6c1g==
=ZRAU
-----END PGP SIGNATURE-----

--o0uWTmDI7XYT7Mcq--

