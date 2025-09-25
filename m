Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E47B9F0BF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 13:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130457.1470013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kc3-00005M-6p; Thu, 25 Sep 2025 11:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130457.1470013; Thu, 25 Sep 2025 11:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kc3-0008Ui-3g; Thu, 25 Sep 2025 11:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1130457;
 Thu, 25 Sep 2025 11:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhi9=4E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v1kc1-0007lR-1r
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 11:58:13 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e904b889-9a06-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 13:58:12 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id AC176EC020D;
 Thu, 25 Sep 2025 07:58:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 07:58:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 07:58:09 -0400 (EDT)
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
X-Inumbo-ID: e904b889-9a06-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758801491;
	 x=1758887891; bh=HX9p3K2wchkmc/8ivOZi6vofoPtMjR9YTrC7j5IT+1E=; b=
	nI8iWDzymrOGRjlg1ERb+CPrjjPQdfCEB3hbM7X8rqYuCHVijGfAkTYGwHsycG2I
	BBtNXLgjRhkOGwAv1eh9VzuBDCWZUMHBwxoO2zUZaFAa9YDn2YE5pJ14nsjcQMoZ
	p0QvBGOkgSMF2qiQ6TWuQPNNWmTFLfUAoi6kaDtNErCihCVUt//sZ2cb040rM9V1
	fwCkE/C+7AezYDVHqIq4LYwWq8G67nWyGc2gc5nGHyLOZaMqyFumXxQFejuf3Et/
	3EEWfPjS68aMee+g71NvYCZLO1okjeHiXvdMO4sAcseuLDNW/CPni55CVFFeJrf5
	IoUpGBtixnNFyWDP40Fo/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758801491; x=1758887891; bh=HX9p3K2wchkmc/8ivOZi6vofoPtMjR9YTrC
	7j5IT+1E=; b=K/H6qgtRGSb15gEOrYiGXLsokjvWcxTsqLufazsqGlG1TX+9nmP
	VPxjsh4yRQC/FR8l8HLXJVto+DDc31woA/mtTsi1JqGMJLEAU2lEnb4AcSmwu4og
	KQ97y8Z3HyQPgX05LqcGpD+fcR76mtX1NEaJg5xx2f/BVzpGXtKJmcRzEtmK4H1N
	42JYvR8K58uS3gV8zNJx+h4NZbaTaACwHIA1R3xmMN8Gd+4yG/kZzmLnSwC9w/vb
	/L8YjwjNEkBPSzkopPHWkzmHj+qAE0eh6OwQabmQ9Je7YhszFavszODPM/8Dtcti
	1ITZUZP1klhOtCn1Xy0iE1fFbfdcgXt5TEA==
X-ME-Sender: <xms:Uy7VaKU2wuGAvhFyxcD8qcmHz8jQKcBYSW9oOESOCod10c5Y_LS_SQ>
    <xme:Uy7VaDJpsYrR_0Zx6leyRCi6ZvHpmgJlYWWMtiJYmIOhR0WbJ3qkmEyNOlgsNCiUX
    psVPUdwa1pdlsQSgo16O96mRj-Bh7EBJtJJbGnfKacNJkbhAw>
X-ME-Received: <xmr:Uy7VaC3vyjsMObR7VzuA-6YVrj1Rtx8kpTEgeuKirPBMiLb-fr42fXt9poskjDWUwgp64tdhAYMOz7cQun0V7Q_Qvt48xGy6ick>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiieegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedutddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgrshhssegtlhhouhgurdgtoh
    hmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgt
    ohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomh
    dprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhr
    tghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjh
    hulhhivghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhr
    ihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:Uy7VaIJFO3zwKjdk2faa6Oq80TqEzzsnCXrxjA6cucJGJMVrxlQT5A>
    <xmx:Uy7VaFg8pVFPlewiQi6IYbdtycTHDNFIW7_Nv2j3Vb5mYWcA-lLuIQ>
    <xmx:Uy7VaAA5tAEJt-abxPsbf_DqVKVRKjhWWLPG_npSCtcLDfGzIloP2w>
    <xmx:Uy7VaP6tssQqpZmm9P0WjY3Zc5rW6RhJS9YOCkoY1j6k72bIVpnxbg>
    <xmx:Uy7VaGxUMhmELNwyun-vCnKqr5w4IC1H3C9K6oaCizTQXskeQSj3jXtQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 25 Sep 2025 13:58:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] efi: Limit Shim's Verify success to EFI_SUCCESS
Message-ID: <aNUuUB75zY_yJ8cz@mail-itl>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
 <20fa42c198ab257085a49e157a2d0e58a0010393.1757519202.git.gerald.elder-vass@cloud.com>
 <2a1df546-c0b5-4937-9d9f-4d1c58c3e925@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3pgFQ4hiFj6ZSUDD"
Content-Disposition: inline
In-Reply-To: <2a1df546-c0b5-4937-9d9f-4d1c58c3e925@suse.com>


--3pgFQ4hiFj6ZSUDD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Sep 2025 13:58:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] efi: Limit Shim's Verify success to EFI_SUCCESS

On Thu, Sep 11, 2025 at 10:35:51AM +0200, Jan Beulich wrote:
> On 11.09.2025 10:24, Gerald Elder-Vass wrote:
> > Commit 59a1d6d3ea1e replaced the Verify status check with
> > !EFI_ERROR(...), this changed the behaviour to consider any warnings
> > (EFI_WARN_) to be considered a successful verification.
> >=20
> > This commit reverts that behaviour change.
>=20
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: ...
>=20
> > Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3pgFQ4hiFj6ZSUDD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjVLlAACgkQ24/THMrX
1yzHBQf+Mee4Vmm4EwggcQq9NZzRK89dmD/+aDFOKUNI1wfA/Ai3zI0FNpbey67F
tCsc67NUGydRRb6PHG41YqfCzrJSipiJnKLISkSv0CO0dZUqFiOtOZv2oCgF57Y2
njKn5+WMF3y+259/dFy1qdi/fFJCTGEH93GhwkYyEaou6agqrs4Lo4O7k1vn/DLI
TcNsVmthNBXyRcMErUJu7T3YIA28ljAVNmCtCwPo9JAxDEZmrjtDESj+8O33f3FS
RbNeWmPPpBJRJhSxIgA4IlxNYIotqO+1H6Njr8LIxKQq+YQIDoF/whrAQ3erYMWv
Bkaj2zppQakgCiD/n7uVjex+AwF+mw==
=yVRv
-----END PGP SIGNATURE-----

--3pgFQ4hiFj6ZSUDD--

