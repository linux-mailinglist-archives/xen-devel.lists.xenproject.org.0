Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2930853E4CB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342554.567597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCvm-00017g-Fr; Mon, 06 Jun 2022 13:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342554.567597; Mon, 06 Jun 2022 13:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCvm-00014j-CI; Mon, 06 Jun 2022 13:38:06 +0000
Received: by outflank-mailman (input) for mailman id 342554;
 Mon, 06 Jun 2022 13:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyCvk-00014N-Dp
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:38:04 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e21e7185-e59d-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 15:38:02 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 794915C0161;
 Mon,  6 Jun 2022 09:38:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 06 Jun 2022 09:38:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 09:37:58 -0400 (EDT)
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
X-Inumbo-ID: e21e7185-e59d-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1654522680; x=
	1654609080; bh=NV+ZKZwxOXIqN4jf9GPyMHPIHRuU7FgMyNT5XXB5+1g=; b=g
	fVdI/JeOojWucbFo0dQCpuXNwRWpBA2TSjCcXLkPE8N2M0A+ypBfATfmoFtRXoz4
	pF//ITbLe/b4ZDfzzXxFyT6i7W7Adrn0vnWFxri2x/t6NDBAAwM8/VhN5Gv0kWPc
	QJ7Pi5S+sxoL4jFTIv2Td5O73uTWxs5tXT2gV5Rw9/TMcQ0WygNJZEDtquLB8nQR
	cPbXU8mRJEF9G0I+Q+JDEECFybbwQrLOiC54Bf/tHVvue/XMsuvdzsBVVqrHzWlI
	8uLZrfUUw0QVymFgfjvB00PIAfY1fiuui7DU6rx2cg3Yy5rqzXZlLlExaqLSPead
	/yp8nUYJ5iBLVICX+o5Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1654522680; x=1654609080; bh=NV+ZKZwxOXIqN4jf9GPyMHPIHRuU
	7FgMyNT5XXB5+1g=; b=a6Y7k0etXHqiLj697Lq+tdtC3+ayjZCe4PuWPzvCcw6Q
	1BHaCPCE1brWr7n+WkUiiX//+ISBZ8j2cABI96n2UIGa2foBZHBI0VkysUVm6mcC
	RdJjDHIuOmivjV79A+UU1nL1wdlbmFyzq93QQJ6SqRmJLN8i5K0LiCUDkPLfms7B
	aLDJRTNrVrcKtSCdNH5UYJfGgkpCSBlNdv2xwQWZUwXPEKgjlJrEY5yXsd3YtMwu
	72PAJzKxmUWjvcp1zdNr2ykOvQQ6AELrYO2jW6DAQIFkcU/6C2I2kUC3yMT+zm5V
	NSWZ6dH6P7WKbP6i93TwikTwBpFv/rRGVZU23ooICQ==
X-ME-Sender: <xms:OAOeYmaGzf494ZLJE2370KwY9X0SekBIAMlhhZeA3atCtC7ji71sEg>
    <xme:OAOeYpb5P8aT6YRXee_0CCnHuf0eG6WDZ0lypkNjRhK9AWnbnlwGZUdIVT_mtpbKs
    8n9s990fxL1mQ>
X-ME-Received: <xmr:OAOeYg9hIgWc7omaBxyrnG3MYJHTMr27K540yrVmWFVPy18G3WDFMBNHZFWo7ZQe2OItJxI-SK1QcCxvz5sTYT3adWF-xkHvpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepfdforghr
    tgiihihkohifshhkihdpucforghrvghkfdcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffhffgveegleeu
    ieektdffuedvudfhkedvteeihffhhefhheegledvhefhvdevieenucffohhmrghinhepgh
    hithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:OAOeYoo5jtObSaEORs30uLnYg8rvRNl5kPxWsUtTHi1lPx0vXV8I-A>
    <xmx:OAOeYhpAvM7NAMPIK0YZCm_sQ6n1h2w6pAP3C54iZLtT5_1siah6vA>
    <xmx:OAOeYmRDnUwQYufGZTNNF-0r9O8WWdmtwRCVIGRXMVqBt2e9bgPa5g>
    <xmx:OAOeYs3QLMMXK0k2mdWSi8FuXT4YKwo6V4I6xdZbloVQfCg3v7R__w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 6 Jun 2022 15:37:55 +0200
From: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Beulich, Jan" <JBeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Pau =?utf-8?B?TW9ubsOpLA==?= Roger <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability
Message-ID: <Yp4DM0L8e+f77oRe@mail-itl>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
 <CY4PR11MB0056686DC984391051B53D59FBA29@CY4PR11MB0056.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+XH+T9PvfQDREpFq"
Content-Disposition: inline
In-Reply-To: <CY4PR11MB0056686DC984391051B53D59FBA29@CY4PR11MB0056.namprd11.prod.outlook.com>


--+XH+T9PvfQDREpFq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Jun 2022 15:37:55 +0200
From: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Beulich, Jan" <JBeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Pau =?utf-8?B?TW9ubsOpLA==?= Roger <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability

On Mon, Jun 06, 2022 at 01:18:42PM +0000, Lengyel, Tamas wrote:
> Happy to see this effort, it's been long overdue to get this feature upst=
ream! If you have a git branch somewhere I'm happy to test it out. I alread=
y have tested Xue before on my NUC and it was working well.

It's here:
https://github.com/marmarek/xen/tree/master-xue
warning: I do force-push to this branch from time to time

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+XH+T9PvfQDREpFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKeAzMACgkQ24/THMrX
1ywk/gf9GVdRcp41W4swFkulvGo9XmGMe7HtlL2B8UzIjrt+sItv1OJ+w08TOzbd
oJWlUfwu0M5yPwaXAe04EoUiqoYE9ffEHgK7CRrGMfUujPj9gPY49JDoNk+WkxBs
P74mVw5up8ZL1xbvcQ4sjLVJVId5IMnDTkwutxAQFEPkAastsXwVt3IK4jtXw4Fd
8wY7K/WbBGnC+3Ge1spg3BE+G74n9/8//eLvDi/M59BzLJ737iACoWv28dNdtQhu
Eh1neCpy6kz/tTLatP8I6tS+NXZAykFi6OHiF3a92rJtUP1KZKG2jSg3mIejZOnT
TmsFB/ThPBP8NI4Tkbc3a66UKAxLcQ==
=nDXm
-----END PGP SIGNATURE-----

--+XH+T9PvfQDREpFq--

