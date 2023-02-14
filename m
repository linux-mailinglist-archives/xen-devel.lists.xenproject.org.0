Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F769683A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495207.765485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxMt-0000wy-E1; Tue, 14 Feb 2023 15:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495207.765485; Tue, 14 Feb 2023 15:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxMt-0000v3-BK; Tue, 14 Feb 2023 15:37:19 +0000
Received: by outflank-mailman (input) for mailman id 495207;
 Tue, 14 Feb 2023 15:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncYx=6K=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pRxMq-0000ux-Ng
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:37:18 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 743dda42-ac7d-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 16:37:14 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pRxLi-009fnp-0h; Tue, 14 Feb 2023 15:36:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A87A4302E5D;
 Tue, 14 Feb 2023 12:22:17 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DC38A20B4E943; Tue, 14 Feb 2023 12:22:17 +0100 (CET)
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
X-Inumbo-ID: 743dda42-ac7d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b7LTeIXXRhjHNZKLwP2eUBOvy8A+bNKHoN43DEwbShs=; b=ZJ60tcltd9tUxPXvvq0xlFyIL6
	54nH3MAS0etSF71Vg31JUcBLXpBh0L+qyMjnH0cxJZnhy+fNVHyAzg6tUysiafwkXr6EGN1bBLvH8
	EYt+sO5hnoq5doF2AgnlkNiLoWPL6qsbM1FtrRNneXwa9ml2PbJyjXR/IJ2cuIvmKzCrsRHcWDyHW
	pNejNvINpl6m6Rt/Z/UQdUP58lzgNnEq801+MLxXOmpukMds0dFq1ldemt3EOaEF2sESv/EOD4B5P
	2whxU1KzDZJfq7oBespZomiCoXfkBFdsr7hb1C+wZ5VkYomLpJgiFCa2lMYkziYJc7yEVbHqvKP/D
	ysJjZYXQ==;
Date: Tue, 14 Feb 2023 12:22:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Xen Devel <xen-devel@lists.xenproject.org>,
	Per Bilse <per.bilse@citrix.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the xen-tip tree
Message-ID: <Y+tu6Xqqb6cdiDAA@hirez.programming.kicks-ass.net>
References: <20230214124700.22f0a62e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9N+tlQnp6RT7SrtH"
Content-Disposition: inline
In-Reply-To: <20230214124700.22f0a62e@canb.auug.org.au>


--9N+tlQnp6RT7SrtH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023 at 12:47:00PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commits are also in the tip tree as different commits
> (but the same patches):
>=20
>   415dab3c1796 ("drivers/xen/hypervisor: Expose Xen SIF flags to userspac=
e")
>   336f560a8917 ("x86/xen: don't let xen_pv_play_dead() return")
>   f697cb00afa9 ("x86/xen: mark xen_pv_play_dead() as __noreturn")
>=20
> These are commits
>=20
>   859761e770f8 ("drivers/xen/hypervisor: Expose Xen SIF flags to userspac=
e")
>   076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead() return")
>   1aff0d2658e5 ("x86/xen: mark xen_pv_play_dead() as __noreturn")
>=20
> in the tip tree.

This was intentional (dependencies) and the plan is to only offer the
tip branch for merge after the Xen tree goes in.

--9N+tlQnp6RT7SrtH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmPrbuMACgkQdkfhpEvA
5Lq1xQ//X0sV6gQk3sHy5WQPnx4D4OcH0oiOyu9ytASjCEVL/wxNlB3TOAW9TV1e
eWTTdx3NoTI8A2i3u8SEYzlGN6+p/jCJdIlfwyeRTpJ5l6f0U+xKN2LYc7yn7h34
faixh10wtlG//RzdJjVsOMkORjKiZuV7BYSViVNu9Trc5AhcpP53wevx5wk7VN9E
wTM7wJM6r3/g3SGM7f5ZNB4rr0SnZGoNNcO9dEeBOPK5PR5iGSQJtPMSS/2lKk5i
KQimr0N7jR6aRPzsN0+zAECnE0WW71N/4UCUZ5tGJIMZreCBhZTyXC+D+tTerxkM
C53RaFq6zRx+wQVN7waVHLuboKKO5vaGYrt8gy9sVkaoo6sdtz94QuHldG6FCg4b
3APdN43UCd0vB2WX4yEmnAsgOY4AqkebEAcFyCEME+nEpA2zr/tjCXG7JfKqQNG8
Ujy84aM2mKs4fVmaPhunXCv9IxHLcyTriVsnmcYi+gn68913NsFVqHiAr4/Lf9dO
QfCyAqWEcxxfoqiy8ebOumivjXNn8Mz5lSWD/oEJTI11rtzleRJLwrt7W9JE6gI3
HRZK1/x7Mc8kbQIvACqx4paxa0B/8+/67xruENgjv7EbUxjIoX7uYeIixfol7OMf
eKgsJ25N7IvxWnSDUtXeHI5BvyKHX/4B/aVacyyDJHva4R5dHQA=
=YOXl
-----END PGP SIGNATURE-----

--9N+tlQnp6RT7SrtH--

