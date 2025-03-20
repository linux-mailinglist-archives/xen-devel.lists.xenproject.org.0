Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D5A6A67B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 13:51:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922001.1325877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFN8-0001Iz-Vp; Thu, 20 Mar 2025 12:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922001.1325877; Thu, 20 Mar 2025 12:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFN8-0001Gs-Sk; Thu, 20 Mar 2025 12:51:42 +0000
Received: by outflank-mailman (input) for mailman id 922001;
 Thu, 20 Mar 2025 12:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W2V2=WH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tvFN7-0001Gm-0s
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 12:51:41 +0000
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f68b529-058a-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 13:51:38 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 6926A1140090;
 Thu, 20 Mar 2025 08:51:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 20 Mar 2025 08:51:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 08:51:34 -0400 (EDT)
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
X-Inumbo-ID: 0f68b529-058a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742475096;
	 x=1742561496; bh=ddBxeD3ev8ZbJoq5oPx9jjAeaIeDCIsFRzjy8nA3aaE=; b=
	1p2htpDLKAOwVxamf0f0gb8pxSkd6AoM/1ePN+srORmjbegKKx+iw5pVzZo2QV+f
	Mp2WHJydCUmJL9czMbX27fNfPoR5sa7hgh19c4cjzagm8GGfxhwdWvFudf39VV1M
	T6N43fyztjMTRekWPG2LwDefDtTWv9UKC6gumEb5sA4SQYk3Gw0WcFxKkCYek/pc
	T5QgW6UkbmX+4ez7f3KUZnyI/XBHdeBeQXUmdqqQ0cAfFQL+UsARO+hzCQhfM8zx
	Bmg3L5dIf4OxM+wZLrqFlzuGFdHm1pHTe8J2/N9QTYZ7y4+PJMmaNhhfhwg8inN8
	RSSxSrx2zHpi7IBGBxJQCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742475096; x=1742561496; bh=ddBxeD3ev8ZbJoq5oPx9jjAeaIeDCIsFRzj
	y8nA3aaE=; b=wN0GfzMmuhCCejQJQ3Y+15R9ASPDscDqFZWCWjN6yi5u99W5i5c
	dZxw8cTOXyMIyOJs67a4TcQXSgbMrJQbMCmProOLKzRcEH6BL+iZSRPVKBx7B08M
	2ZwHNk8LP8mDgTMjin+bAjTe0hSOiQvv8qQCeDv80B/5EhO0aW4vZzS9X2pEbOfM
	3J9F10Iypr6gkXznI/JhyTVUxun2xXIfgiE6f8jAoj8V52ec3kkOc5cTnko6NztF
	nTOSRnpwsih4UNnRultJOad7RoqsVt+TYMY0Dg5iH2IOcbylEI6MeLFuDnOCafq4
	y9Fdj7/TSuAdfDOrMKsHxtjB30TJ+044SqA==
X-ME-Sender: <xms:Vw_cZ8h4b_0XkGgLLf_vmvoNZINoNpwh-GoiCsYLOHSHWqxbIYuvjg>
    <xme:Vw_cZ1A5UB8_BEEkJZE02huZvnqdGxMDr_LFXYSFyu-aNss__IBCGRLzqrABw-6wr
    OrYCinAIk1Gpw>
X-ME-Received: <xmr:Vw_cZ0GfxpW8aVtR0MgBRhWN3qIquLXKZgrcFu92yR92isAsfDvTsuVaJSMkKBQ3WZ5qMDDyZ_LU9rnFE8_KsW9YioKzKCfRHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    thhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehjsggvuh
    hlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtrdhpihgvrhhr
    vghtsehquhgsvghsqdhoshdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvg
    hrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegr
    mhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoh
    eprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:Vw_cZ9SgdauE-z1qNxl-pMWU2W-Ed6tI9Gg7cYmkpoFyFQz3A4URew>
    <xmx:Vw_cZ5y2Rwf0sn33HcT-nb-miQYErnsI2FF3o7ekrKfzE8auMi4ENg>
    <xmx:Vw_cZ76ET6h4yHmZ8PsQFiTDVjJpBW_lTRUhR548ItfAl4GvQWGU-w>
    <xmx:Vw_cZ2zK47C8VfOti6T1C9JG_ebAQHiGRwxJEgXkTHABXbjYFtX5XQ>
    <xmx:WA_cZ5eeRPFNDpvlqDMJIJ-nfpbLIOHX-o1w_TkdqNzcqwKaV65lYCtd>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Mar 2025 13:51:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
Message-ID: <Z9wPVGd0fEsbaO_s@mail-itl>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com>
 <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com>
 <Z9rJUWCARMQYqNXr@mail-itl>
 <Z9vrc1Xvm5OEy8rM@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0t8BOYQamV7XZBDO"
Content-Disposition: inline
In-Reply-To: <Z9vrc1Xvm5OEy8rM@l14>


--0t8BOYQamV7XZBDO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Mar 2025 13:51:29 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86

On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > There are clearly some build path embedding left. And
> > -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correctly with
> > XEN_ROOT having xen/.. at the end.
> > BTW, would it be acceptable to have this?
> >
> >     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath $(XE=
N_ROOT))=3D.)
>=20
> Hi,
>=20
> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It's fine
> in "tools/"). In "xen/", there's a few variables you can use if they are
> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(srctree)
> $(objtree) for relative path. That also should avoid the need to use
> $(realpath ).

XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it to
not have /.. for prefix-map to work correctly. Would it be better to use
literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) and
have paths in debug symbols relative to hypervisor source dir, instead
of xen repo root? I'm not sure if that wouldn't confuse some tools...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0t8BOYQamV7XZBDO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfcD1QACgkQ24/THMrX
1yxncAf/Q3yYp0wrGieO61OUY78ZHjnHMt2YJHQEnoJiB/ccNyTeOwpFXnCQIF0T
hhCj0V1sKsIDQ7Mo5GiMtRFPCQviVdjyX1LeUxGi7P929zNZxW+flJsfZ3IuqLK4
aRLQ8OagUifmdloO/+1KeBGNpQPTJpYlG6pN7RkOH5Igxx6f8TH4hmhlMylByQX2
x4KdCD3ti1bhttcmwf7NcCnbrlo6Y+sdPzBbD5Mn875MMHDvIThboptXxYGE5X1a
mw3rl5unC5NkmuzznUKbw6gUZ8Aw+v6EwxaRcikNApbyL6eiAcXa+GAQYAtuDY3L
acsohI7wQnF5iPIZ5RN13Pj/hA7p/w==
=B3Y5
-----END PGP SIGNATURE-----

--0t8BOYQamV7XZBDO--

