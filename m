Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1053A5BE6F8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 15:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409411.652397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oadE0-0003N4-Kn; Tue, 20 Sep 2022 13:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409411.652397; Tue, 20 Sep 2022 13:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oadE0-0003KS-HG; Tue, 20 Sep 2022 13:23:44 +0000
Received: by outflank-mailman (input) for mailman id 409411;
 Tue, 20 Sep 2022 13:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHMs=ZX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oadDy-0003KE-Ss
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 13:23:43 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70c5c260-38e7-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 15:23:40 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B0145C00EB;
 Tue, 20 Sep 2022 09:23:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 20 Sep 2022 09:23:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 09:23:37 -0400 (EDT)
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
X-Inumbo-ID: 70c5c260-38e7-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663680219; x=
	1663766619; bh=8FD6DUsqOAoaMqj2hffhF5MoQj24xK+dBODsmGYQboo=; b=Z
	BpIYmqCr3CeuBYpFCAt+FXA1ERwkCxI27FC9a962sxsLibHVU8CJfEY1Jm/1/FV0
	RPZLlydKeHrcdMSAfh4UUUZYziMty6m6WD5lIEI1Dnznf8tOm1tu6YZlGTQbs7mv
	cUjIAk29rgE3DSsaRNT9wahxhtGjW3X9Y5WX1L56fzgPssD0411CUFdlSwM1Ste+
	5Ui6D2TWndTeu95oJsaozlPHn0+o49y7Csvtv4KL8OmburKpzc43NG+yNSYong3u
	1DnSIUKD1TuK4d5VcBhaZpurQMFQf0lpKofhTNi/2LTrKUfn5lLaS9DJyaSGFhLS
	lJNHE1i7QgScmaLPQtfWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663680219; x=1663766619; bh=8FD6DUsqOAoaMqj2hffhF5MoQj24
	xK+dBODsmGYQboo=; b=ZNqyVN6lIlgGSBPJr0mJnrRRZFHRWYpRR4Bl0q2P2reZ
	v3RpLwIcFuKGL8u8U0KYrYF1OKzdV/tPgGIottORZN2xwClBNSe3AftjN5W+esr6
	eFK3BIu85XCBRmMvDHA0oRQlYTqCJFGn+Vjd6sh3Ud4b/7/AFGXu55lVIRVaOlhO
	4O1/AxmLOLi9olmxOXQvPwPftqWanPuZc8k1WA6kHEFd3muDn2ZuopB4F7pz934e
	Fqld3iVyP9Lufu4mtIM1pPWHfmpZ5TMkIAJx4yd8PoPXgk12/N/hnP6z552bQHmb
	9X5a1jI7PLfJ05klTllXV2z5cBBsVdlTrWvf7pfiMA==
X-ME-Sender: <xms:2r4pY8Bn_U-jyoycKu5QirpC29PYnHS5_kb192lXcPrz8naxkKp4yA>
    <xme:2r4pY-jIESeZ0a6IjE-YzjNJxVvhlsry4fjcQLjVPrU-FuClHtI2ChEdak7yFeqvb
    cjB6-p6W1DQLw>
X-ME-Received: <xmr:2r4pY_lSU_owtIUuMS0md11zlZSYS3YqvWf4NFs7579DjfQraI_ffaxSlFH->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:2r4pYyx2dSIJCTWhkuBvSEUQ_SYFTqRGGrMB3VufIPSN4cd4-1cnVA>
    <xmx:2r4pYxSdAonB2yQRkyIoPEiy00O1h_IujRF3u5jUUEwWWD45_WeaFg>
    <xmx:2r4pY9Z1k1ai69R9hwjOmHM_6aSDNeCsnK8S2gDmwDZzNs-HKuW_iw>
    <xmx:274pYwKbPOl-B9ZFShCr6Qj8sHAygyQ6v-dDjp_QyeARJ-0HladCRQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 20 Sep 2022 15:23:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: credit2: respect credit2_runqueue=all when
 arranging runqueues
Message-ID: <Yym+1k7YlkMpvvaU@mail-itl>
References: <20220919150927.30081-1-marmarek@invisiblethingslab.com>
 <a0f02ef8-d93e-6083-a0b7-c8dae8905ada@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HzSivIJW2fTAiZJ+"
Content-Disposition: inline
In-Reply-To: <a0f02ef8-d93e-6083-a0b7-c8dae8905ada@suse.com>


--HzSivIJW2fTAiZJ+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Sep 2022 15:23:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: credit2: respect credit2_runqueue=all when
 arranging runqueues

On Tue, Sep 20, 2022 at 11:06:57AM +0200, Jan Beulich wrote:
> On 19.09.2022 17:09, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/common/sched/credit2.c
> > +++ b/xen/common/sched/credit2.c
> > @@ -996,9 +996,13 @@ cpu_add_to_runqueue(const struct scheduler *ops, u=
nsigned int cpu)
> >               *
> >               * Otherwise, let's try to make sure that siblings stay in=
 the
> >               * same runqueue, pretty much under any cinrcumnstances.
> > +             *
> > +             * Furthermore, try to respect credit2_runqueue=3Dall, as =
long as
> > +             * max_cpus_runq isn't violated.
>=20
> This last part is questionable, partly because the command line doc is
> ambiguous as to which of the two options is intended to "win". I guess
> one needs to know the original intentions to resolve this.

Right, I've chosen this approach, because you can still emulate the
other by setting sufficiently large max_cpus_runq. I can add doc
clarification in v2.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HzSivIJW2fTAiZJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMpvtYACgkQ24/THMrX
1yyIGwf/XAC2AcooLCBQsEo/8D+VbsvPoSAsEM0jKeuqtGbiigRF8StDyZa1N7DF
W5mDdjdIn4TcShBZ35YPgKpMmHYaMV32Ij2YhrZQKraD/wkExxJPW62k+RgycpOY
uyL0FMmY2jVx/cmBOU1PkSDpH20l0N055YUHd0NQk5CNCv/M5fXt/WziRW8pVUy4
544oTgUApsEXLS6A8wxEx4jMDroxhN1kR5ByzF2kp72Tmz6MxzHnnNYIEIiMJdE3
4kJazJ8Lnv/yLo1YokEdgmr9LzCq1IbVge2aaFuxWfncoZ+ecEPi2M0SWnBt6K/4
CxlYq1iVwNBBODKg8e0THKP75yC90Q==
=KM8p
-----END PGP SIGNATURE-----

--HzSivIJW2fTAiZJ+--

