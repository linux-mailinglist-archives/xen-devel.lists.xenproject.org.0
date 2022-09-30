Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A95F0F25
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 17:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414294.658493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeI9J-0003Fx-3N; Fri, 30 Sep 2022 15:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414294.658493; Fri, 30 Sep 2022 15:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeI9J-0003DS-0g; Fri, 30 Sep 2022 15:42:01 +0000
Received: by outflank-mailman (input) for mailman id 414294;
 Fri, 30 Sep 2022 15:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOVy=2B=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oeI9G-0003DM-Om
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 15:41:59 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6889d696-40d6-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 17:41:56 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 366FD3200A6C;
 Fri, 30 Sep 2022 11:41:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 30 Sep 2022 11:41:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Sep 2022 11:41:50 -0400 (EDT)
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
X-Inumbo-ID: 6889d696-40d6-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664552511; x=
	1664638911; bh=MoxlBPfavur2f0fkyMZHSvl38jBS4cY0CP1Xr97RuWs=; b=w
	mJgPw6AQVVBPpTkIYPNLKCmzFhfbgxeN7PWEajBymBf7szY6m17L+kAZpxJbhhGG
	EKgQBRYoKxLous0ITyN5kx5x7YWgoAKZzxvt9ZUuARoACfIJachZ5uULvNGSS8J5
	Yj6Wo/nw/TRFX7VmG6X/xf8snXTFCJ+Np6Jt2uS+gBPHl3ThxR6lDRXIBc6xzznk
	ACm4MTyTXt89+B4M74j93lTQWxzGYKTDGVs2p0dxxaqh3y5sSDkmH/k8qiOlG4sM
	z9pos5adhQ0DCtvEheMxcqPxzDgBTLzQmheJR/uTCJzdPbFIsVGD/4W6c5Lh4uRu
	QtnlZQl7xNu1+dazygQ0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664552511; x=1664638911; bh=MoxlBPfavur2f0fkyMZHSvl38jBS
	4cY0CP1Xr97RuWs=; b=pfaa6Ed3HG+qFHzzEDf+QyfRW1XwVz8TGay93t18iuq4
	IyV5gyIc66vagePE0vpbBGqtRe70DSxsetM68b0SsuLO/Fojn9ogFROfK7ENxJDd
	QcgZJ+yXHfdZW0Bu7aUnS9kPKBOuoKaJnBu/Aobq/cdbh7RR9D5IxYeo+2YQcOfI
	Jky6/SsPJx8Ut5kSbz2LdlOyI10VRbySLDMP2nkxlZpMIghJ5jzpumLJD8DYrpbZ
	3RyQW9xClX/N/tTyk5PxYyc37nZD0yP40i3Vgbfz9GjiePFvHi7ssLHsnbbl3+ht
	Rl/PBibIpxytsLgULGFnSMT32u1acU4QekMeX0sDNg==
X-ME-Sender: <xms:Pw43Y80dAW8mzfjBKUShoJWckyo2zg5-CzYo67G55OGaF3sB0qxMbQ>
    <xme:Pw43Y3H6MctLnStCNR3kUd2R-lSA6TqMpcEaR4ADByx5rtzZQmr9OGpX90MH_lqX1
    wEFfn13nODJ4g>
X-ME-Received: <xmr:Pw43Y06A1UB1sh4fnWrT61sbO_j_kHR9JZhqTe3mLkCDa4SSHOFIHUSYyH3gHKkC73velkJLsQPI8l3BGX82D3iwPdL0hwPyOJdB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeeu
    tedugfevvdeuuefhhfeiueettedvhedvtedvgeffkefhfedtjeegjeethfejnecuffhomh
    grihhnpehinhhtvghlrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:Pw43Y10h-Zyy8bmhRxEfeJNCb7hPNBQtqHywfdNrHNqfmNXM_Lw9Dg>
    <xmx:Pw43Y_GGDE6_Q8fOvtnwGyiDjH908LoIFSF7FYJgPk9iyDTWDXbZ3g>
    <xmx:Pw43Y--WpGGMsH3DAE7HPOHz6QR8H-_WEZ5S2aqWfx7nOf0V0aiEgQ>
    <xmx:Pw43Y-0CQ8lJDHNRwIXMQhCZShD_vrsvoHdIUwRTStf_O5mLgrgviQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 30 Sep 2022 17:41:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Message-ID: <YzcOOlv1zqzWlH9e@mail-itl>
References: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
 <8f07c532-e742-fa02-27ee-b08c56299d09@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cO/Gq9L8hbdMYZtR"
Content-Disposition: inline
In-Reply-To: <8f07c532-e742-fa02-27ee-b08c56299d09@citrix.com>


--cO/Gq9L8hbdMYZtR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Sep 2022 17:41:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode

On Fri, Sep 30, 2022 at 11:25:12AM +0000, Andrew Cooper wrote:
> On 15/09/2022 11:04, Jan Beulich wrote:
> > [1] specifies a long list of instructions which are intended to exhibit
> > timing behavior independent of the data they operate on. On certain
> > hardware this independence is optional, controlled by a bit in a new
> > MSR. Provide a command line option to control the mode Xen and its
> > guests are to operate in, with a build time control over the default.
> > Longer term we may want to allow guests to control this.
> >
> > Since Arm64 supposedly also has such a control, put command line option
> > and Kconfig control in common files.
> >
> > [1] https://www.intel.com/content/www/us/en/developer/articles/technica=
l/software-security-guidance/best-practices/data-operand-independent-timing=
-isa-guidance.html
> >
> > Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> This patch should not be taken; at least not in this form.=C2=A0 The whole
> DOITM infrastructure is currently under argument, for being impossible
> to use appropriately.
>=20
> I understand why Qubes want this blanket set, but it is a steep penalty
> to pay;=C2=A0 It's only code which is already written trying to be consta=
nt
> time/cache which gains any security from this.=C2=A0

Based on the bit description, I'd say rather "prevent _breaking_
security of the code already written". It is not setting this bit that
change behaviour on new parts, but it's not setting it that breaks
previous guarantees. It's really bizarre design choice from Intel...

>  On current parts, using
> SSBD has the same behaviour, but this isn't expected to remain true in
> the future.
>=20
> Forcing it on behind the back of a VM is mutually exclusive with
> enumerating it for VMs to use at some point in the future when we have
> the capability to.=C2=A0 i.e. specifically, you are not able to maintain =
the
> ABI/API in this patch in the future.

Regarding the current behavior of the hypervisor (without this patch):
will guest see DOITM present but not set? Or will they not see it at
all?

Documentation clearly state:
    For Intel=C2=AE Core=E2=84=A2 family processors based on microarchitect=
ures
    before Ice Lake and Intel Atom=C2=AE family processors based on
    microarchitectures before Gracemont that do not enumerate
    IA32_UARCH_MISC_CTL, developers may assume that the instructions listed
    here operate as if DOITM is enabled.

So, if guests will not see the feature at all, it Xen should set it
unconditionally, to remain compliant with expected hardware behaviour.

If guests will see the thing (and see it not enabled), then indeed it's
less clear what should be done right now (but I'd still like to have an
option to enable it).

> If we do move forward with something like this (under the strict
> understanding that the behaviour is going to change in the future), then
> "DIT" is too short of an acronym to use.=C2=A0 Amongst other things, it's=
 not
> "data independent timing"; it's "controls for forcing ..." which is
> important because these are going to be vendor specific, if even needed
> in the first place.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cO/Gq9L8hbdMYZtR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM3DjoACgkQ24/THMrX
1yzH1Af/br1iJEur2UD5UsjIgXfGVASYmz9Mi0FDGbveUzX1abkvr8UYdkUI7DHX
/7RU1evWnR7pirWg0SZrgLub8Heh2o6nepUi1UZ0o3rZWkw7bg83rqHZqKjV6Vdb
B8iu6zAdKFL3Sa98Oa4+REnxG7j+7JzQd+fLjfEjCjKKyco/IRkH+fOtcp0o/KwD
NoqknvMETfYmQtyUrITh9YnoJX3lP1/vL0gbHSnd/a5NAJlQJZXuYKvdt8ZElW0T
YxdHiVUGcORcVjNzgTk2AB53IP0cgycLmFBLoL2c7gUhqllLqTefjZJDyrsof4bN
kFqoZC7qUYiz+5qAcd5juqYTUfKcaQ==
=27VJ
-----END PGP SIGNATURE-----

--cO/Gq9L8hbdMYZtR--

