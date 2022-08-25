Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6F5A1A7E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 22:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393582.632623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRJcC-0000uy-EE; Thu, 25 Aug 2022 20:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393582.632623; Thu, 25 Aug 2022 20:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRJcC-0000se-BF; Thu, 25 Aug 2022 20:38:12 +0000
Received: by outflank-mailman (input) for mailman id 393582;
 Thu, 25 Aug 2022 20:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tRsu=Y5=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oRJcA-0000sY-Sq
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 20:38:11 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d17291ca-24b5-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 22:38:07 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F1E85C0098;
 Thu, 25 Aug 2022 16:38:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 16:38:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 16:38:03 -0400 (EDT)
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
X-Inumbo-ID: d17291ca-24b5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661459883; x=
	1661546283; bh=esGFAPYjiaVZuPYDgBvYwDMkwCO3JhvARQcK6N2i5HA=; b=J
	Za5H8a46AtEKYqBq8lCRk2coLkTmgcXvSWG45cbSc+V/35iYc4y9zt4pI4U5n2r0
	Ox+zJgIn91VSpP6u4v0IjWVxDoyjHopd+WfumdLrKrj3ifBx2mfM30I8sPhl5dnM
	nEbXc2t4yjFmTTJ2XTQJayp++AWgCIxCehzq9JpyXkIEyeuaI7nQzwzCGLGh/P8S
	0TsXKUZQiBzqOer6On8qiM58ZNWNgw4sFBke+kJZzvsGmwGoKrpm++oxIFreJfsJ
	DQRrJKMwytF0Zqww0LLw1zZqpCQsqBz1FJmymzUr79VAqIUYRJgESdU/JIXD7Ua3
	J6cKQfGjA4fZWX5OprS1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661459883; x=1661546283; bh=esGFAPYjiaVZuPYDgBvYwDMkwCO3
	JhvARQcK6N2i5HA=; b=fa1RVP0WEfn00QEKWZRZAEN03lz0l49n1n6KetTFs5um
	bizMsTnU3whNFqr6CHfSzog8Z1QmuZK5+S1Ur0PYZnyPTwpblQ1dQlo5PgC3VQL8
	zUXxll5rqq7Trs8vQuN6c/smFnR5PhWcczFHeJgD8XoFkTZwPI/77ROpcW/+X5+k
	YKhDrfH2aT34SKJ2GOYyQvUP72qhJKCEuMHA06JlGwfwcvZAPg9BjJ12t/kI47oY
	LqKyIsyu3wgo5unjKF0rcdhprKvYpKjL6vYhN9SVEVKEBgy21V/VIH8XjT84W4lJ
	kGoi/BpXMFjmVyQ0rUcc9MbN0dx0JSiDDdMJoGbAMw==
X-ME-Sender: <xms:q90HY5W3KbddFkr7dIPVXSm5meC769corEzIvCUwaGwuwdc_V_QYAQ>
    <xme:q90HY5kkBTMv_h52ZQuszILUBLSz54T-LFc8nhy7gxxKU5StQFJGanBMCJs1oZi6c
    8YeqyYLbFeC9W0>
X-ME-Received: <xmr:q90HY1ZjfrqwacyPvd-MS15Qnf78kOvqTyUUOekQowFALHt5jnJg33tcszc9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffej
    geejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:q90HY8X7OmHwq5_4bhOxd3K5iFdfVVD_vnhGZ3koiJC2yWMpkwqcFA>
    <xmx:q90HYzn1L5A6NfkcsVCyaW2oY4FAx8xfDzSgoQl3SSk_iUkNU3P-qg>
    <xmx:q90HY5c7L3p6JFHsiHh53EMx9SaSKkiZGyIXM9ZniTPLCqN6417-wQ>
    <xmx:q90HYytVuHf1hrfk5thsdCNbH546NWuM3FPObqNzb6dcbV2HQWIeNA>
Feedback-ID: iac594737:Fastmail
Date: Thu, 25 Aug 2022 16:36:55 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use
Message-ID: <YwfdpPH9PyPXlMAa@itl-email>
Mail-Followup-To: Jan Beulich <jbeulich@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
References: <20220824210452.3089-1-demi@invisiblethingslab.com>
 <df443aab-a2eb-75c2-3a4d-df6d093b5788@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T8hDfOfGMj5RUCiT"
Content-Disposition: inline
In-Reply-To: <df443aab-a2eb-75c2-3a4d-df6d093b5788@suse.com>


--T8hDfOfGMj5RUCiT
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Aug 2022 16:36:55 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use

On Thu, Aug 25, 2022 at 09:59:56AM +0200, Jan Beulich wrote:
> On 24.08.2022 23:04, Demi Marie Obenour wrote:
> > The XEN_FW_EFI_MEM_INFO platform op has very surprising behavior: it
> > only sets info->mem.size if the initial value was *larger* than the size
> > of the memory region.
>=20
> And intentionally so - the caller didn't ask for any bigger region,
> after all.

That needs to be documented, then.  I thought it provided the full
region that contained the address.

> >  This is not particularly useful and cost me most
> > of a day of debugging.  It also has some integer overflow problems,
> > though as the data comes from dom0 or the firmware (both of which are
> > trusted) these are not security issues.
>=20
> I'm afraid we're trusting the firmware in this regard elsewhere as
> well. So if there was a need to change that, I guess it would need
> changing everywhere, not just here. But we trust the E820 map as
> well, when on non-EFI platforms, so I don't see why we would need
> to change that. In any event such would want to be a separate
> change imo.

That is valid.

> > Fix both of these problems by unconditionally setting the memory region
> > size
>=20
> If you were to report a larger ending address, why would you not also
> report a smaller starting address?
>=20
> But before you go that route - I don't think we can change the API
> now that it has been in use this way for many years. If a "give me
> the full enclosing range" variant is wanted, it will need to be
> fully separate.

Does anyone use this API?

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--T8hDfOfGMj5RUCiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMH3aMACgkQsoi1X/+c
IsH5/g//ZG7ez1Ej3gqZvCu1lopA98OkG3Z6Z18HZzfrpKLY0PsAmJ9FhYZ6rIHx
DDEjJnY+b9bDQMheh72Gv4nlbz497E2QLcbpTwDC4iXSZ3HN4SJEb9+SHlatCLQq
zf6fiHiLMSKVKWDf0S+8XuQhzc1tUn24F2PnCksJ8LeNv7cA7ULFf5836f/BPRMy
RhuIdYhfbvF0ZixrEyPFZuOIbLmy6P8b3HW8b0eFWq7bbdJsQ4g+JGjUrkLkXQww
EBkyT7DrFteR9gPAUiWjSq8hJ8hcWe0byujOFByVPW30wnCRIpZcficInqpBTQCL
TGENBtJvhPCXRuGtE1VPQsjDu7/WKfzrM8vBB6u+VqjUb5dtdWDk87tLgqj1U8Lk
S6uyRprZMMRVanpKROYf1ERGEz6Giz13Y1QsqLsZx4HGqDE/zFdTZN9QvFPDakGe
valcafzo45OqrqSSNHijOg3DpurlCcFAaeSoiFOFP36EFnT43FwjY8ZchAi+tcqu
QuNJJdFRc/hUmBPTtLsomY0yl46zOfmMLpJcVApbSJTRnxavV8JZsn7eRI+AkY+7
grP2CKw+2hkS4pk0zx/NfFhkA2m0h8bNBJZ2D8gC7XjGN6mhKJAD26NHwdEQ3Ykx
dZ6yymLCKl5p3p9Oa4vdrhRNte/BHvOt8q11UXwwkKKWLi8Xf6o=
=lxYd
-----END PGP SIGNATURE-----

--T8hDfOfGMj5RUCiT--

