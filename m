Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCB747642
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 18:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558551.872757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGigx-0004av-O8; Tue, 04 Jul 2023 16:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558551.872757; Tue, 04 Jul 2023 16:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGigx-0004ZC-L1; Tue, 04 Jul 2023 16:15:51 +0000
Received: by outflank-mailman (input) for mailman id 558551;
 Tue, 04 Jul 2023 16:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHuo=CW=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1qGigv-0004Yy-Kl
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 16:15:49 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 082aaa87-1a86-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 18:15:47 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A58115C00F4;
 Tue,  4 Jul 2023 12:15:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 04 Jul 2023 12:15:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jul 2023 12:15:44 -0400 (EDT)
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
X-Inumbo-ID: 082aaa87-1a86-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1688487345; x=1688573745; bh=Fp/8yqcayF4NwPyZG43PI2MRc2q+xpq7Gn3
	x+6aR+dQ=; b=gB3yGAY34WJrdgMzVzTTU8qsZCzOygCFLug18pyQoj6BKfrDX2s
	H89w+cTaZS5txeMF2ByItwHyhEB+AogK9LfI2rEPXhESkXrZaBG0GIt7n5EHySAD
	ZrvL7C3XlU/oDb1J2q9bldWjP9RlWr6YJeKgAPtiO0Xy7rL7jcIzK9x8BequmKLZ
	UEPxgX+OI65aoEdSdPFdRBIAMnawwiwZUBm/W8kH5/WY5xU/l+Raf+upfdNEJ4sS
	78BYxSDUkGgGHsdkd0BzCYbKSbfkNze4M8JEf1ZR4wDoJzOsAxaOIAs2IynuWAlv
	uRjQzLq8556s00O6nBeuIGFYzge81VQ8jgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688487345; x=1688573745; bh=Fp/8yqcayF4Nw
	PyZG43PI2MRc2q+xpq7Gn3x+6aR+dQ=; b=fqJgrCQxCy0aPhjZxaCmcswj/Sb0r
	m5vjb6Bzk2Q1nzog0d2QLS/j6qygEPACAUllywoixnoE0PyPBkz0Ky4W1PTSOUsZ
	E9tliLXEfcYjt5me0Qr7Jht3sDd/gEeE6G4+aU6kV817FfTR5T2TJ+6nNfNUuMo4
	jLZGur1iVF9y3MZbYADVaxSLjjPfT5cGjMsg2yMYOLyrZQuG9lKRBn4j/TFgTztj
	TCXBF60871Dc1yXoxfO6P3y/CKJZqo3RrzJnx8/xw2wyd+jD1a6LJZSW/J8WtbRM
	wiMOWgW9v+R/I4NbruXrFhe13uPSshAh3oQ3AYbi2Pylv1vDTHRC5/+rA==
X-ME-Sender: <xms:sEWkZKH4jgHa4KI2nPgPHQ5LBDgdydN4VUBmlNZvh68qje2tBmX5IQ>
    <xme:sEWkZLWeojckH-4Euo99iwalgoeCsa6DW38yNZ0BdBc6-fGX119CLf12yPDD5WVAP
    Q6P1ke7tLX4AJI>
X-ME-Received: <xmr:sEWkZEKJEAccmI15AAOvJvaM_JUWNN0K8ZZGbbr2V1NpGqNvsUphcjBePOoueQxu296ZNTzKlc5TOEPEPyoKOUOSl2gDlKgh4KVuBCyZbTv1tkGk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeggdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:sUWkZEEpF-cVJXnRaWZuFka8dxOK3bbtNyKIVStjJV4j8fh841CTLw>
    <xmx:sUWkZAW7HNYGP3rI0Uu8Mtft0hVHLVbG5rw9zaLPfnF_sRxesWR6cQ>
    <xmx:sUWkZHO7xDkZMOIm2izF8XmdYkF9OoRGKzfQbp4xFHpavltfK_HFaw>
    <xmx:sUWkZKcmw0RXdHVhky1PWF06v67TCuN0z0gMc8Iez5cGTPNOvtqYvA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 4 Jul 2023 12:15:40 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v3] xen: speed up grant-table reclaim
Message-ID: <ZKRFrtHQ0Gll0IpY@itl-email>
References: <20230627172216.1359-1-demi@invisiblethingslab.com>
 <c11f1c6a-795d-2245-0571-ea956f7881d2@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KiAHZyX4uOBKxCD9"
Content-Disposition: inline
In-Reply-To: <c11f1c6a-795d-2245-0571-ea956f7881d2@suse.com>


--KiAHZyX4uOBKxCD9
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 4 Jul 2023 12:15:40 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v3] xen: speed up grant-table reclaim

On Tue, Jul 04, 2023 at 02:07:47PM +0200, Jan Beulich wrote:
> On 27.06.2023 19:22, Demi Marie Obenour wrote:
> > When a grant entry is still in use by the remote domain, Linux must put
> > it on a deferred list.  Normally, this list is very short, because
> > the PV network and block protocols expect the backend to unmap the grant
> > first.  However, Qubes OS's GUI protocol is subject to the constraints
> > of the X Window System, and as such winds up with the frontend unmapping
> > the window first.  As a result, the list can grow very large, resulting
> > in a massive memory leak and eventual VM freeze.
> >=20
> > To partially solve this problem, make the number of entries that the VM
> > will attempt to free at each iteration tunable.  The default is still
> > 10, but it can be overridden at compile-time (via Kconfig), boot-time
> > (via a kernel command-line option), or runtime (via sysfs).
> >=20
> > This is Cc: stable because (when combined with appropriate userspace
> > changes) it fixes a severe performance and stability problem for Qubes
> > OS users.
> >=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>=20
> Why am I _still_ - after two earlier private questions to the same
> effect - on the To: list of this submission? Please can you respect
> other people's time and interests and properly follow patch
> submission rules, applying common sense when (like has been the
> case in the past for Linux) those rules result in overly broad sets
> of people.
>=20
> Jan

Sorry, I somehow had that in an old version of the patch, and was
editing the patch by hand rather than generating it with git
format-patch.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--KiAHZyX4uOBKxCD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmSkRa4ACgkQsoi1X/+c
IsFzEA/8CaiCw3M57idWrMBHxn3aMAdco5w3dfBtLah/UZ3EfXD5Cj8cCWKfW/Qg
+6SRIil/gPCSnXS/l0S+/hfLQEHLb+00kYqVEf6eWVhylAKF2p3bybtkk3PcwX8C
8wfIVIGznoRrf4Si0gmVJOslHW30Jup8nOVHFEq9CCvwUB+1FC/doS85zmlSqMSf
hXUMZVnWfVtxcKNoyKFZ+gCSQNKmL8r6z8OO6lN1QEbo3DmfCRR55NeHEEuZi4RE
+LUtuIhlQQGcQ13dinZiMaO6wkkUnNCEcaYCyZ+XMuSd2BZfzZiiw5kHT6eWNsoq
Pa9NihyEMsmcVvs6zh4tY2KF/P52Ri1M7ptgsU3Fj7qK04goPRwUm/VcdGzFSg+L
qxJgQmLc7FdwSK0KP9oF81rfPsYN5743bmaAQNaakCZ+H+WDqZPYvcb8wNaNFlpi
F4FqU2BJK3JT3HQNEMoCLJjChS9Pi8AaTdDxEOsxxmKFMi/Wx9UX6U8WtdRhCv5O
Dqj3goBK9bkd3b9zIZXbmgHHHkAFJQLzfb2r8ftBWzZxXrCpV6OQmTnUiwC+kfng
rXxFuAgBB6q86TY9to89O14n8T3hT5/Uwl8Ij/z/SUFnO1axRelEaCpj3FA16ODS
mIqyF8EqrJZ8YvGBlziGyPNY9Qec+QdhYAwDReBI3faku5WuUqQ=
=FuCD
-----END PGP SIGNATURE-----

--KiAHZyX4uOBKxCD9--

