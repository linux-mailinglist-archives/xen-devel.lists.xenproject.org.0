Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A89D31E0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 02:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840886.1256418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDZP3-00034h-0d; Wed, 20 Nov 2024 01:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840886.1256418; Wed, 20 Nov 2024 01:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDZP2-00031d-UF; Wed, 20 Nov 2024 01:21:08 +0000
Received: by outflank-mailman (input) for mailman id 840886;
 Wed, 20 Nov 2024 01:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xlhZ=SP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tDZP1-00031X-P8
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 01:21:07 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b286d2ad-a6dd-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 02:20:59 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id C77DA114016B;
 Tue, 19 Nov 2024 20:20:57 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Tue, 19 Nov 2024 20:20:58 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Nov 2024 20:20:55 -0500 (EST)
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
X-Inumbo-ID: b286d2ad-a6dd-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTQ3IiwiaGVsbyI6ImZvdXQtYjQtc210cC5tZXNzYWdpbmdlbmdpbmUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIyODZkMmFkLWE2ZGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDY1NjU5LjYwMzkwOSwic2VuZGVyIjoibWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732065657;
	 x=1732152057; bh=04YXZq3yZT+PFGzFZmaOgkjeqd4tZMpfOGbDn6YR6BY=; b=
	NhYoITUhq30R58wm5V94FcISFXdvxfqzBGTx5UysyKiXWnlDBVX5/xLd8bic99u6
	cMrpAxrrQAUebDhhJaAMX/VF53FWZgwMm6W7R9R1qk35CJv+gZCWQYBIZW0006Xe
	C3qgUr/w8wYTcmDFhP6ZH8ettf/LA/GGLDNDuvAJ3xBHm33ThUG7QyyRZLjU77Sw
	LxaMxuh0ZZ5sW+VLDMcugON0OqD84wU+PD5gOVxyemwmFYMg+WtS5aH5qlioc57t
	dkjkrom8aq9O984S1Fe7r4vV6zK0nvFgdBkxHrrQV+dI9vyTC7T08JVXFhF50KNl
	/jDrHwZWjmdVxsnunW/w3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1732065657; x=1732152057; bh=04YXZq3yZT+PFGzFZmaOgkjeqd4tZMpfOGb
	Dn6YR6BY=; b=aml+nCDgWnuhYz1zzIrwM6pP3Wx4J8fj5kPXUNK4KXG2Z8xRqbE
	eKwc6E8tcuQJuMpvnQN1n3WBrMF1Z3rlczAoEgVi9d3r0HYyQ8Meinw40C+nWouo
	kACkV+otgVFIEi7R6dtikSV1XIv0Yl/2K497CgWsm6eGw2QglIyj8CUM4IzU2xyK
	qn21T8NczCpxm9ICjHEdiLS+VAg39Npa9ERnv01izLXukXftg8KaTYfphPnId7tM
	ZEpolpMvV8WVZZpSeu1ibXRgdOmgWq8uAQcU64pPgImaCsTlTZI2ET3YYgoQ4EZ5
	fGjYoHKQgrB5wMui0Tn05xNFM5VTvQ3k6TQ==
X-ME-Sender: <xms:eTk9Z4LWiWx5kLCJ5bf87xKdXbuCaKRSnB-TTFrW1gVdP9wNQ_E23g>
    <xme:eTk9Z4I9N9GlcU5HBcC5OXJhXRF6v1LyXnwo9HCRjTRdeFZXxhSFzPL17sEoAlhXW
    emhNKDgRggd9g>
X-ME-Received: <xmr:eTk9Z4tUAB1xpL26SVb0-J6oI3FLlrvLri4MVs1NqFW1SNZnAwFG2HuDtKSGGEijIRbThPc4GNZsNGdjxvt3d6IhIbI7aRiJQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeefgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhholhho
    ugihmhihrhgpsggrsggthhhukhesvghprghmrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlhes
    lhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrd
    gtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehjsggvuhhlihgthhes
    shhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpth
    htohepsggvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhmrdgtohhmpdhrtghpthhtohep
    mhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepughfrghgghhioh
    hlihesshhushgvrdgtohhm
X-ME-Proxy: <xmx:eTk9Z1ZNIGRss0wTbb7zLMz0Al6H_WRe-BBlFAHw9KVNwsWfpvxNiA>
    <xmx:eTk9Z_b1x8IqtiqT9Nd-AZ9K1PvVE7nCv4GoTH3VAA8DT9oAVDD4bw>
    <xmx:eTk9ZxBazSkJ-cY2QGUUHB-ODTNNWla7W7X8Yd4gSjqiecG8UBONGA>
    <xmx:eTk9Z1ZKt6TYvVi-uqsmbb6ln1kowZwSuzohlLZTgh10KikWbIrMyQ>
    <xmx:eTk9Z8Txj0iJHMOSdhjz1tbvRm2jqSvug2qT1FxDv1RxT41kXXUurlYT>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 20 Nov 2024 02:20:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
Message-ID: <Zz05dJdAOvaKKrag@mail-itl>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
 <875xojmexk.fsf@epam.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MBWhVwDka29qAHhA"
Content-Disposition: inline
In-Reply-To: <875xojmexk.fsf@epam.com>


--MBWhVwDka29qAHhA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Nov 2024 02:20:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support

On Tue, Nov 19, 2024 at 03:16:56PM +0000, Volodymyr Babchuk wrote:
> > Honestly, aside from these two comments, this looks quite good. I would
> > suggest adding a GitLab CI job to exercise this, if nothing else, to
> > serve as an integration point since multiple components are required for
> > this to work.
>=20
> I was considering this as well. Problem is that fuzzing should be
> running for a prolonged periods of time. There is no clear consensus on
> "how long", but most widely accepted time period is 24 hours. So looks
> like it should be something like "nightly build" task. Fuzzer code
> needs to be extended to support some runtime restriction, because right
> now it runs indefinitely, until user stops it.

Regardless of the actual fuzzing (which takes time), I'd suggest to add
a gitlab job that does sanity test, checks if stuff still builds etc. It
can probably be limited to 1min fuzzing or such.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MBWhVwDka29qAHhA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmc9OXQACgkQ24/THMrX
1yySFAf/Yt/m3i2IykunM9aiQfcCNvZ/dmNzA1ULoAGKKR01yk+opYGWoIfyFCYt
Cz7/2TnBoUN9NBJq5Beft94o1DVhn5/kaeU/mGPQl7XWgiHFhMmmgfVkDulp56mw
gUfMBh77azvah86Dl7j/9nSEafpZOxjW+5KElJpKBaFIZBeFj7IV6AgUd/DTHfl/
jbnTSnYHYXbs38ZCvlHeu0D4gezgnuFDaKw81x/5DcZ+tE6E9WjTGNCuDpNnCt+f
2gBKAfUPtl1xF2FSr2+YUPuwnDyjow3IRNkl5ZVKyUA5gVD9hwmML3cQ5/7yiMdO
RBBKZEIxsnqT8FqKhEGbh928kIsCtQ==
=HmpQ
-----END PGP SIGNATURE-----

--MBWhVwDka29qAHhA--

