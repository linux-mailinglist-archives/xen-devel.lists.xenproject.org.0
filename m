Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93232B553E5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 17:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122294.1466100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5ty-0002K9-N9; Fri, 12 Sep 2025 15:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122294.1466100; Fri, 12 Sep 2025 15:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5ty-0002HZ-KW; Fri, 12 Sep 2025 15:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1122294;
 Fri, 12 Sep 2025 15:41:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TRZT=3X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ux5tx-000225-7a
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 15:41:29 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1cbb760-8fee-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 17:41:27 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id CF8FF14003F4;
 Fri, 12 Sep 2025 11:41:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 12 Sep 2025 11:41:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Sep 2025 11:41:24 -0400 (EDT)
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
X-Inumbo-ID: f1cbb760-8fee-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757691686;
	 x=1757778086; bh=rwksSHDdUzKpjOvN/NyoUqYRPNHs+BbfkGgXLjLMB40=; b=
	L+F42A1XBqJuKvJf6d9SIO9J3rNb9QtgKWRzVi+esIQirsb0Z7zAN9xhMiHOpZKZ
	620IRWX60mZtiKwhdDH3W6I4ld6saAYzUhxxvANy5EZ8zI075ewCP7pRNfRMBsqx
	mZIyH91hdUq0ptC25EB3WqVwubZKloaVuS9P1JPr1Nc4NZfarrlPlXZB/FD7Rjxn
	mWJPo5KQJjf3lpR2mto16eH/6krAUk14GTlzVB9Aj2Dsgj/7ylYz4LOzIpdCJE7O
	BVQ3+DKVxWhW2CPjCyfvgjhS2Nwm3y6qd0x6C1OGmaPJrQnHZk/Z7F6PLo6xuOV9
	lOTYc/ht1qD4Jz8lxYPB+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757691686; x=1757778086; bh=rwksSHDdUzKpjOvN/NyoUqYRPNHs+BbfkGg
	XLjLMB40=; b=ILuvaCu3vd+cVKXhbfBkEFiQ2XvdLxGoO95Vd88j3yYnvclQgmX
	MJjL5oRtzAFwdol8wHf6OtiPmstm0/FTz/BYGF09AKMb4XaC596GO079I372ge7T
	7MirTTT5d94Fw4PeAsYWwQVvhWE5w+07IiS+3TGSjzMMDxST7nN5AOyDUycJYT1U
	2JmjwSmNsMBdISVAVVNUe0X/KTHSuvNFDRHMQ3SWgtvdKp0i+U0NL2/IB+V8JT8H
	ehI80fKAjUOAmotzXx31Pr5wYkB0Lz5/6jMHX2R02gs/gU7DQUM2kDopzNO+h3KQ
	eiPEj5K7JVti4FhIUpb2yD0PdfDTU2HV9qA==
X-ME-Sender: <xms:Jj_EaNAfrUfi5o7VdxmSkQ_Ga4mSQzqlnthqPF7PeNiSkFikc_H3cA>
    <xme:Jj_EaBeN-z9P6CUj6RHu6fixeilUFUTT2Ier9_kb7j2yb-7nboivW-TqgxwyPM37a
    d0JMJmpoBsxbA>
X-ME-Received: <xmr:Jj_EaFtcf6cwKXD655VYIkGsOKN4TbTu9qYKEbsLR_fGJ4cRo80TkmO4BTCCdb_m2I8genR255f6qJbOlJgeq_5ePa_zSqICWgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvleeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedufedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopegumhhukhhhihhnsehfohhrugdrtgho
    mhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpd
    hrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohep
    jhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnh
    drohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgt
    phhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Jj_EaIgfAmVNmaNJCNMo_yXYMHedpF11dc0Pt4rI7wNcyZ_MqXt5Mw>
    <xmx:Jj_EaNvoRfnKH9d_OBq4Uel56cYUsZwQtdMym3rYvdOYlahr5k2tsg>
    <xmx:Jj_EaD_Kyv9JxlVjnR2YEWneL7Yd-tzVNZHSF3LsGSn6ENXe3BTPcQ>
    <xmx:Jj_EaDaq5syRKTYTk1RqjrsQBg0W8bHAP5S50E6n2tO0BRltBt0OZQ>
    <xmx:Jj_EaG694BSELwm2sSlcYqdt6dNEB6AcrIV1J2BcQYpM_zYd3rND_ZSg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Sep 2025 17:41:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 3/8] CI: Merge categories in
 debian/12-x86_64.dockerfile
Message-ID: <aMQ_I23je3lgPP1S@mail-itl>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
 <20250912144427.1905141-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+vMEMMthi/UCmWIG"
Content-Disposition: inline
In-Reply-To: <20250912144427.1905141-4-andrew.cooper3@citrix.com>


--+vMEMMthi/UCmWIG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Sep 2025 17:41:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v4 3/8] CI: Merge categories in
 debian/12-x86_64.dockerfile

On Fri, Sep 12, 2025 at 03:44:22PM +0100, Andrew Cooper wrote:
> cpio needs to be in Tools (general) now that it's used by the general bui=
ld
> script.  Merge the rest of the test phase jobs into one group, to avoid b=
eing
> overly fine-grain.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+vMEMMthi/UCmWIG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjEPyMACgkQ24/THMrX
1yzJZgf9HJCHFHktXoFcdByD/lYyBDjJLSTLejMIOYp357ZonBJ6kpWFuHdA7wVx
nvfR6AEzqo07Da/sOuIMwn+JJuGYQPWpS3JrHQC+mlOoYieu/E4xlaNI8F6vqYlU
fPxQ3v2ypy6KCm8jDmh97F3H9bBz9nC2ZfAVYeNxZn4xT4rQKYF3HBYzFdDfMuQG
VASVI3sRKBNwph5CBBVU/m0frm77Mpac749OIKFLgdsIBy6lWhDSGRpAdn6J6+ys
WeKdJQkAmU/5/T56N+PnPdm3LRJBAG0CFGxzgzo+2PZibTfIQq04CG50fdX7VvtR
Xx5bZSGTfTriQ6od6afyNc+kF4fkZw==
=u1jk
-----END PGP SIGNATURE-----

--+vMEMMthi/UCmWIG--

