Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD5C5929C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 18:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161983.1489791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJbA5-0008By-9l; Thu, 13 Nov 2025 17:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161983.1489791; Thu, 13 Nov 2025 17:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJbA5-0008A2-6f; Thu, 13 Nov 2025 17:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1161983;
 Thu, 13 Nov 2025 17:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJbA3-00089w-Ve
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 17:31:08 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 876fff6d-c0b6-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 18:31:04 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 54E0A1400076;
 Thu, 13 Nov 2025 12:31:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 13 Nov 2025 12:31:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 12:31:01 -0500 (EST)
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
X-Inumbo-ID: 876fff6d-c0b6-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763055063;
	 x=1763141463; bh=vtGlG/MtErkv6tPndYZcSO53jF35Tw0LqzwXYiH+q50=; b=
	I8+bhYplc5K/3ot0tbxha9bf4nMgE1hZNgEPPVOLcoZa6cS5Dy+8TCMA8t1gxa6N
	6SKpTc+6gNh1vajb7r+RlOhfxBjVADSVqw87e+xfbk8EY47waSJ7q4WPqCgZHxU/
	qoyvjkSXB38AkeRpZb+yq+usHfNYvBbTF6/zT2LKt+NyJTxnpYJEm3Ow3ecmzlAx
	b9nI3JUQ+UPmX2Qz8j+YkPKb9ci/LxvpZaBuJHD10m9/l7rghGr5cCbBiAf7lWjS
	4KzlTrmhrjwzdYAIDz3YwtisPUOJdmdoOHIxbaLASN9a6hVzOFQsSdyfPCTSoTRB
	9rCLp1A7/VbuYFZAJ8Jqww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763055063; x=1763141463; bh=vtGlG/MtErkv6tPndYZcSO53jF35Tw0Lqzw
	XYiH+q50=; b=TuigY+TrAn3VnTQ7oXp5n0jFd2MrhzibE1T0nPPKglP5vVEAw7t
	ssEXx5dKG9cggS+xh7EKibq9zpp9dYHbdhMeF3zhzSFtRmkP8wh4zT8C8EEQnDf5
	pf132SU47bE1WmobF897lmIGYeUdA3odSVB8Yj+r6RQ4kWTrD89ahhzw4ZvVFWUe
	kuJSraA31BPO1KiE3cngUJCQntFhzXsyrMTOd2LqZ8AuZInm7nEuAfT3tSkyMH3E
	j62C//9N2whwe+3/vjmel9dqUkW5omrX4CnVRHRf8D3a/v319UfUPKcCaXS+y3wC
	6rE81u+N48jKa+WuQw3j/WdHOaVCtWwN0WQ==
X-ME-Sender: <xms:1hUWaXXXvViIMNmtpkUHbR7AUN5yCnYnZdq4wx1TQ3mJ61mJ4cVSdw>
    <xme:1hUWaSK796A02PpTfQKQqy8R3vCuQZ8gkc2kIU72vXq5a2b9dAMJskerDzVhEvLCe
    elFN1R5WVl-T3FLgQ_mwFoyNvTTZ-32hHQx4hepPa4BTuq1>
X-ME-Received: <xmr:1hUWaXAOEaK3F21cRgeKl1ajpB9GFvVRO8Y6sTA3rklH6uBTpm-rvT6qwn87R3JJWKev1Y3yGUtbqJzVKNxQWCmGdJm07wH-LAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffelteevudevteeukeeggedt
    jeffheehvdeftedtvdehuddvveeuheeftedvfeejnecuffhomhgrihhnpegsrhhkrdhprg
    hgvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprh
    gtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgt
    hhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhu
    shhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdp
    rhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohep
    mhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:1hUWaSd7CNGCfr7ffS8DioLB0lmhOmeSIU9gy5n-0eG2txJGvdtjXA>
    <xmx:1hUWaW2ptXqJAO16k4FS7Bi_Sw70yfJD4MQvIxFkBJdApYOXix22-Q>
    <xmx:1hUWaZjHrj0_qxWYuDWjxyc2MG0oxhyKv0ZZmGXjhB4wp7Rqbfdw2A>
    <xmx:1hUWafmH5OM1N9Lr1G-ltm1IgnBHA1bQB4lnDm0jnK0SX5dMRWvjXg>
    <xmx:1xUWabZZkY4Tfz_M3cRHixiCmBynqWsle8r4yWHsaKjvlPd-UNVEIrva>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 18:30:59 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()
Message-ID: <aRYV0-3jo78I2bDF@mail-itl>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com>
 <aRXRtY10cFN38d02@mail-itl>
 <4391d560-870e-4010-b3bb-dee2935f9732@suse.com>
 <aRXWLrEGbSRdqDA7@mail-itl>
 <19ab9d24-057e-4c70-a663-b8288ea630a1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fWLlZUY3E35To5Xg"
Content-Disposition: inline
In-Reply-To: <19ab9d24-057e-4c70-a663-b8288ea630a1@suse.com>


--fWLlZUY3E35To5Xg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 18:30:59 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()

On Thu, Nov 13, 2025 at 02:24:38PM +0100, Jan Beulich wrote:
> On 13.11.2025 13:59, Marek Marczykowski wrote:
> > On Thu, Nov 13, 2025 at 01:46:20PM +0100, Jan Beulich wrote:
> >> On 13.11.2025 13:40, Marek Marczykowski wrote:
> >>> On Thu, Nov 13, 2025 at 12:09:37PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/include/asm/brk.h
> >>>> +++ b/xen/arch/x86/include/asm/brk.h
> >>>> @@ -2,6 +2,10 @@
> >>>> =20
> >>>>  #include <xen/types.h>
> >>>> =20
> >>>> +#define DEFINE_BRK(var, size) \
> >>>> +    static char __section(".bss..brk.page_aligned") __aligned(PAGE_=
SIZE) \
> >>>> +        __used var ## _brk_[size]
> >>>
> >>> This chunk belongs to the previous patch I think.
> >>
> >> It could, but it's not used there yet (i.e. would count as dead code).
> >=20
> > But in the current shape the linker script change in the first patch is
> > unused. IOW, I think adding .bss..brk.page_aligned to the linker script
> > should go together with DEFINE_BRK.
>=20
> Again - could be done that way, but there's no concept of "dead code" in
> the linker script (afaik at least).

Anyway, I voiced my opinion, but it isn't important enough to block the
patch on it. Either way:

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fWLlZUY3E35To5Xg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkWFdMACgkQ24/THMrX
1yzm5wf/auc9bLmP+ju+B4QcdIQ4RCayxh0aiOiMXBO/oR4GNgAKUvz3vB1ib77P
v91+DAiWqG7QoY1OK2genXBA0P1Qi9+PlCnp2e9B+QGMwlj5gNVpnR/IifQLzoFB
pv64lJ8ZwasWmBAtUNkXTAqePlBJQD8Qhz3PHKd7cph+Mdqauc09LNz1iXc0i2YZ
dNXqLjJD05MEpc8t4B41J1R1MvpuCRI9LvwnWXsYunErqreyScUAGQJcFqucOJqI
QzA2UzSuK/2LDG1x8UFEurH8cSD+I10dGVxNDVVLBgrFfpQFa8VjJZ/UJ9qeAAb7
vIRo7ipgegZALQzs0VAZygljyka0xQ==
=mZnm
-----END PGP SIGNATURE-----

--fWLlZUY3E35To5Xg--

