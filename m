Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC8368B8D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 05:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115872.221122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZmPH-00056z-O6; Fri, 23 Apr 2021 03:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115872.221122; Fri, 23 Apr 2021 03:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZmPH-00056a-Kx; Fri, 23 Apr 2021 03:23:03 +0000
Received: by outflank-mailman (input) for mailman id 115872;
 Fri, 23 Apr 2021 03:23:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O7KW=JU=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lZmPF-00056V-Q7
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 03:23:02 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7133674c-c0ce-49c3-94a7-0b4c2e98cb67;
 Fri, 23 Apr 2021 03:23:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 79AA65C00E6;
 Thu, 22 Apr 2021 23:23:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 22 Apr 2021 23:23:00 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA978240054;
 Thu, 22 Apr 2021 23:22:59 -0400 (EDT)
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
X-Inumbo-ID: 7133674c-c0ce-49c3-94a7-0b4c2e98cb67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TMBZ87
	ZIj72qlTGO9EzQBABC75/I35kqRRc6fQWWK68=; b=pplClVawUClPX62BMVQYYZ
	fEr1hwQlWNiC4kwYZ2PPOge0FX3yNisj+yh0yjOGSKph3fer7sPArg/CHymwbrio
	zUfmZHcFtZRG/p9QEScurSH4TtCZwXYoMTiUBc3hnx+duU3fy+RE2UBOiZqiiLZG
	69E7H/Qx49hIM4cD79dQB80dYVsS/BQuqubXGo9wkkIPGM7p881RxRvETqeETyJp
	2QKhwk6ouV+UHPM2SWVD/si4VAZUOsidO4zlwtlMZIi+uM2Bbn8vsmAWp24+P2c5
	JdBm7rFqxQle2OlpJsNGUi1b/uGzCeVXC8nAXaF/q0fXjYCbgcsqL/RZ8Ua9hNFg
	==
X-ME-Sender: <xms:lD2CYCf6d7cba5V32xTQp7bjvlFPhHRV2kAtP2TmYfAL77WobHKTqw>
    <xme:lD2CYMOovp5hdMnhCHAk8U9WCTLVPYqCBnE69P3R54ZC4RyglUl0rjp06Tb_iv4wF
    lU-lFsEaycqKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduuddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:lD2CYDhl8YcrlKfe5HicqxUmNVbV555bx85prbIDOUhSyggWube50g>
    <xmx:lD2CYP_UO-e8_iVXilIbjupkxbzYqXUaDD6cFk4Tkqw74rokdol6Wg>
    <xmx:lD2CYOuOLu9w85KzYo7aRHdMySJGY7rW9WNwDkL5HBLcGn5JqwBbXQ>
    <xmx:lD2CYM7iyBfAdCozS-FCg031L_8e5m79eCWn_P1c_IxNh1xcY1Q1zg>
Date: Fri, 23 Apr 2021 05:22:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: kernel NULL pointer dereference in gntdev_mmap ->
 mmu_interval_notifier_remove
Message-ID: <YII9jv9rJ7QMkG+2@mail-itl>
References: <YHxFtj3dyjFbeusP@mail-itl>
 <68f4d2e3-4b25-58a6-d690-d5854c509354@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o1x60crC72dVyh1D"
Content-Disposition: inline
In-Reply-To: <68f4d2e3-4b25-58a6-d690-d5854c509354@suse.com>


--o1x60crC72dVyh1D
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Apr 2021 05:22:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: kernel NULL pointer dereference in gntdev_mmap ->
 mmu_interval_notifier_remove

On Mon, Apr 19, 2021 at 11:33:27AM +0200, Juergen Gross wrote:
> Could you try the attached patch?

I've tried and it works, as in - I didn't get the crash in ~20 runs.
Since the issue is quite hard to reproduce, I'm not fully sure it
helped, but sounds plausible. I think you can treat this as Tested-by:
;)

Thanks!

> From 7ff3c32b36279aacef9cf80f4103fc6050759c10 Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> Date: Mon, 19 Apr 2021 11:15:59 +0200
> Subject: [PATCH] xen/gntdev: fix gntdev_mmap() error exit path
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Commit d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
> introduced an error in gntdev_mmap(): in case the call of
> mmu_interval_notifier_insert_locked() fails the exit path should not
> call mmu_interval_notifier_remove().
>=20
> One reason for failure is e.g. a signal pending for the running
> process.
>=20
> Fixes: d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/gntdev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index f01d58c7a042..a3e7be96527d 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -1017,8 +1017,10 @@ static int gntdev_mmap(struct file *flip, struct v=
m_area_struct *vma)
>  		err =3D mmu_interval_notifier_insert_locked(
>  			&map->notifier, vma->vm_mm, vma->vm_start,
>  			vma->vm_end - vma->vm_start, &gntdev_mmu_ops);
> -		if (err)
> +		if (err) {
> +			map->vma =3D NULL;
>  			goto out_unlock_put;
> +		}
>  	}
>  	mutex_unlock(&priv->lock);
> =20






--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--o1x60crC72dVyh1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCCPY8ACgkQ24/THMrX
1yxDvQf/a5/045ARCP+KU/yraPlWcKOUG6NaUlFLE4V3Y6VVDqjQa6ze/vCGqVkM
BJpMchFGbZ7XkIsRv8ziKMWwNXrP5Jr6jvqDm/HZ9kpItJ4Ulg5JQnD0fnyc11S2
DTc3tnFhMJIx2Vwf4tdI3VmTygWKEMG23w6J3JNTcLCwkHNV0KsuAfCayU0MKpQX
WgrX8OQd7CovCITYFHe2edQ6ol0AeWpJEjacAVFO9wEsslaPZAZCYs4W24WJJqpu
2rHLDqFDxUQJGZHx8LwxnQjkp61og8xXWYxiKxOHqDZSAgspH3qwplIDhIk0KLY8
ul0dfcgjrDhEgjGWOIiPC/yGjoMSrA==
=9/y9
-----END PGP SIGNATURE-----

--o1x60crC72dVyh1D--

