Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4A57805E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369623.601085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOXN-0005IK-9b; Mon, 18 Jul 2022 11:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369623.601085; Mon, 18 Jul 2022 11:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOXN-0005FS-6T; Mon, 18 Jul 2022 11:03:41 +0000
Received: by outflank-mailman (input) for mailman id 369623;
 Mon, 18 Jul 2022 11:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oDOXM-0005DR-5v
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:03:40 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46684c7c-0689-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 13:03:39 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AAB665C00D8;
 Mon, 18 Jul 2022 07:03:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 18 Jul 2022 07:03:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 07:03:36 -0400 (EDT)
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
X-Inumbo-ID: 46684c7c-0689-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658142217; x=
	1658228617; bh=I28NGfmY7L0XQjjIWxfOFBpNNuQpQZYQVhCARMpxuqY=; b=v
	wnPLkMQrF+xn7jxtQC/3xkaET1ZVzN2MPm4sCXOPI2yBYTSt6voouoOkKAI4whgN
	3Npo3VKpkkQtov+4uJhyV/BinXMUIL5jA9kOJxiy69lZ+O6BMVTvbwukjBJbZI8y
	f4UZrzj4xliNDyszIWMRiWlu32fTaRubMNlo/FihgI4w7N8VCIBUNWi7OQGkWeQn
	dxZm5Zc+2dRLnQj6lzHkppNeydGthEmH5Wq0iEp47O0MZsa/nTcqDRVFjOMT4Kaa
	4ED4DkmrhPtgx7iRMHFYoNH7GEkmIUTC8+6cVoL6/3NUVlkqEpcNodDCVDuhXI90
	NwHRrANDzSzIVHk2EzMSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658142217; x=1658228617; bh=I28NGfmY7L0XQjjIWxfOFBpNNuQp
	QZYQVhCARMpxuqY=; b=eHXrExxR+/BAmzqqYQgCc9j5Q1N1QFfH/bRtJo9EGn7o
	Bx9KglSKGHSCt2jlATCeLUwCA4zBITl4hgqv3dIqnn6JdEECj+ZRx6W5LChwR/+B
	gYW1uglkPcRvlaft1I2OcZlz03VcGgrwaxIGe9bsCAN1Q7x9D03DeZfNSx2T5Fvm
	5wLiSr5N2fEGYj5WF5Q32gcFG6+ls0yMk/iedCw7lXdvs/jFvDYhpiiJPr4Blap2
	ncSxOs0WeuqT2Fx0zqGOA8HcQ84ec+OkMYK//fAdHbTuSLmmM/suECyM9PNnATxd
	bfCPilnyAmMvN3clS/xcMcXSvOIqQwYuYwbQ0YB/6Q==
X-ME-Sender: <xms:CT7VYvrSRddlzjPp6SeW7dEEGauE8V6t6P3BhfTbner5UNKA3sBC9w>
    <xme:CT7VYpqMtfaL1CHY28MZqH0-fvTDYnz7LJ6dSa3wIfzFbOMCKxtztmd-kMWMcje-m
    r7taI-ClCTW8A>
X-ME-Received: <xmr:CT7VYsOR90jJ8FsHsQ45oE1veZ0IFPwey9-Gmkld75umERhaNxKd8wLGirTeF9NSKGCrSJmF4S4h-mnUW4iiukf8fLW1IpChhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:CT7VYi6uBT0RnEXZ9wE4bNZQLDzVboOFVEijQvOidahQCMxTcYQ7Yw>
    <xmx:CT7VYu5BlMi063WX__68PzQ1v6WgHji_fbQSNBkXeIGca0HT9dSaBA>
    <xmx:CT7VYqiCqkbrTxQPIM9I3281Jl8NabqK89vO52733ls88O5HB6kLtQ>
    <xmx:CT7VYkQR5z4ibYe0pGvLdhBgxzugbvG6ztzKkigWUU_Cfc82ysyjOQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 18 Jul 2022 13:03:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/9] IOMMU: add common API for device reserved memory
Message-ID: <YtU+BbncwbW2+X16@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <2538c56f6881e4e2a3e5cee3cbdeebb88a59ccb5.1657121519.git-series.marmarek@invisiblethingslab.com>
 <38020a5e-121a-932e-691b-6eaf435be7d2@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jPCNp031vxCM1vAN"
Content-Disposition: inline
In-Reply-To: <38020a5e-121a-932e-691b-6eaf435be7d2@suse.com>


--jPCNp031vxCM1vAN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jul 2022 13:03:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/9] IOMMU: add common API for device reserved memory

On Thu, Jul 14, 2022 at 12:17:53PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > +};
> > +static unsigned int __initdata nr_extra_reserved_ranges;
> > +static struct extra_reserved_range __initdata extra_reserved_ranges[MA=
X_EXTRA_RESERVED_RANGES];
>=20
> Overly long line.

I can't find what coding style dictate in such case. Should the second
line be indented (and how much)?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jPCNp031vxCM1vAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLVPgUACgkQ24/THMrX
1yzBPQgAjUHkkreDVbtuIAfJ9BQdQkdvTLQOF0ptIqhsQVcxZxwZzQo0hlRqvS2/
N7R2RGesON2zS08i6YyGMzJtmaREki8zSV4Ha3loOHMuJufnDTR2seAXZWL2Vow2
fUDIyhD6VDI/xRIXXPM8fJe6AGG3L3m8oD2SlkBVO1Ve83Dbu8X9NZ7i99HU67qE
a4SOyOmqrZnuEhFVXFVGbzBvGCZXZ+maQjMfQJfG5mm+ZQIchk8HLWXkJnvZdODS
PDi7IxsoEOSMqYX8mPqbkE2mxfcwAG+eyGKz98i1XTN5V9n8zM6sfsW/mwI4l5wc
Jej6MntL1gT/4lph/3rW2xxUVMh+/Q==
=xtrr
-----END PGP SIGNATURE-----

--jPCNp031vxCM1vAN--

