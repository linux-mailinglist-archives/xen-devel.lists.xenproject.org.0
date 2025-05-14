Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E48AB70E8
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 18:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984502.1370631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFEiK-0006PY-Bu; Wed, 14 May 2025 16:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984502.1370631; Wed, 14 May 2025 16:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFEiK-0006N9-8y; Wed, 14 May 2025 16:12:12 +0000
Received: by outflank-mailman (input) for mailman id 984502;
 Wed, 14 May 2025 16:12:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfaI=X6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uFEiI-0006N3-5W
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 16:12:10 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e99e793-30de-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 18:12:08 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 9A2591380187;
 Wed, 14 May 2025 12:12:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Wed, 14 May 2025 12:12:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 12:12:03 -0400 (EDT)
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
X-Inumbo-ID: 2e99e793-30de-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1747239126; x=1747325526; bh=GLr7pDypCW
	ihRHk+2e8io55bym6ARNiPcchrD+X7oF0=; b=AiFSrsOdfqFx/TTpEi+Fi/ArV3
	9Dh4nDm9pV4SB6WVk4FgYmJIMh4xZQsLD7F6/PU9hH/m3D5/WdH0MNEjc4zjqNLp
	dsqe7xas7LhZzEtS8qZXZnUNOJaJ5baQRL6fNXQGeW55aGT3jD6uTs/cQ8rYUMFB
	xlhG2jc+2LRQuoTa+lPsv70mVuJFpjUSAr6FMFe+vfwK20GPAQOlGpMpwDfKBVeP
	TBpbEbc24/Lu5Fn6lG3Lo5WP/T2NYYJ93SIHs26heQj5DvgfZIWa8r7SdVDS/KUH
	hLfnrMPjznwT708zTzkeSlacBo+91CWbvWC09bkNnVxsO36wFVnhSUmemwAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747239126; x=
	1747325526; bh=GLr7pDypCWihRHk+2e8io55bym6ARNiPcchrD+X7oF0=; b=Z
	7ajOJzZiLZhv1Pl3ZkC+dRYBMbnlz6bq+vd0eYtFr1i+6a1J/FsYdKb/Rw2z/G56
	0tUdYlQbEEoUVLfm4+LXymqaKfyCq41ecp7qUuOIgon1ck9ve02ampuxdWAdcm4A
	FutDXAZ+s8/vksMlxt7vGPptflZbTrA3kh/A+QD8CiNZ9u7YCSqux6WgmFOfww/Q
	u2HCX8OkqB9YQa5ZFOEyRw7bz+ImFOZT0IvVL8jEVh+4MbK0+CXVPIPy/xPMj6Sg
	inZIYO/pHXi+3hslYKYHf1j2MlhmiOmr4/fTT1yUJX4w3/8H30n1mxrpWCLaKkia
	x/Zrj1SGdpQ0qLG3oy7Fg==
X-ME-Sender: <xms:1cAkaCljst8_gppn2jKnJ4JH9l3CJw-iBzFa6MdY9fBciOOhLo6CDg>
    <xme:1cAkaJ0qzcPksZv-2zzlpN51UuAdPzFirIyXqHmiTpT3hXR0O-Ziam8W7WcrBL990
    yZegM2tbVwvcg>
X-ME-Received: <xmr:1cAkaAqLwBjWq_sD0dOapTaFN4KhjFxQc3I1Fxd4gpShjQjzH4OsnrMgPnfbqm97WhkJXN8wfw6ditQP6VyKSQ1NU3dPVZjP5Lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdejgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtgfgjgesthekredttddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhephefgteevgfefgeetteefueeuvefhfeektdelhfeuffeuleefhf
    dvgeffkefgieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegu
    vghmihhosggvnhhouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgihhird
    gumhihthhruhhkseefmhguvggsrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlhes
    lhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrd
    gtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhp
    vghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivg
    hlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrd
    hprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:1cAkaGmbAaXI4M-8Lym85jRgdBlOItbg_euDBX84Sk7grKLgoRzTnA>
    <xmx:1cAkaA1GX0IehgOo2_U9QQD5OuOA3TpKa3BfkQMvZgvxOVBYnNglhw>
    <xmx:1cAkaNsdYzZLxVdHekBE3OQhBVsdU0YpGm0LIk2iQGbYShL5Vrzl4w>
    <xmx:1cAkaMUJiBegvRpVMJeDN3Y6W9WgRbvKK1KV0ijYqGI1tRn8KD3gkA>
    <xmx:1sAkaIbqFN4suE8QnLuimwyxOBkSiZIXfAL_7KjEH3IDYgJ4s58mYUsB>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 May 2025 18:12:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v2 20/22] x86/slaunch: support EFI boot
Message-ID: <aCTA0UNMRbDex-Yi@mail-itl>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cc6da1456dfc87ed12d78f2e47e35987ec628711.1747155790.git.sergii.dmytruk@3mdeb.com>
 <68e5f8bb-42b2-4da8-86ba-231cb5657106@gmail.com>
 <aCSnskt6S2rHfUmC@MjU3Nj>
 <1ba433ce-44b6-4d70-a232-f5f83f1fbaf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; x-action=pgp-signed
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ba433ce-44b6-4d70-a232-f5f83f1fbaf8@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On Wed, May 14, 2025 at 11:58:49AM -0400, Demi Marie Obenour wrote:
> Why is it better for Xen to rely on the bootloader to implement the
> specification, instead of xen.efi itself implementing secure launch?
> That would make secure launch significantly more usable.  For an
> initial implementation it makes sense to rely on the bootloader, but
> in the future it would be better for xen.efi to have its own
> implementation.

That might be true when looking at the very limited use case. But if you
look at the broader ecosystem, having a common part in the bootloader
makes much more sense, as it can be reused for different kernels without
duplicating a lot of work.

- -- 
Best Regards,
Marek Marczykowski-Górecki
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgkwNEACgkQ24/THMrX
1yypmggAiBWdTT3yTZKYA/28IVhTXRPemEGGqdDcqyC2mDQt102kgF7m46LwSv5I
eK1xY7Hz6AG3Mp9pRH4Jltx5j7SMZ0zzesYuADEpDTNIEWx6Xh+W6AQ5ttAKco1M
tcUFiYaDujesLwRNHJpjH1D9Ih82d1SbUoNyjBgnn1cmX2hXXntVDyXttz6P+xUy
Vl8eF3NYC90+sdc0g8aaKKWe6GqDzsBRj+heISYtymiWRcePWgFWMVMrIDB4Yqmo
+KnDYWsDTQn4Bddu1O6AVVVhvlnhgzP8sHWb20gjQpZG2jwJd1DQcNwQy2Ae04xS
Fxx8mBC75utOGNqnft/Pv098BnmYqQ==
=AulS
-----END PGP SIGNATURE-----

