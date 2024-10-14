Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ABF99D674
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 20:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818812.1232091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Pm0-0001JB-6l; Mon, 14 Oct 2024 18:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818812.1232091; Mon, 14 Oct 2024 18:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Pm0-0001Gr-3x; Mon, 14 Oct 2024 18:26:28 +0000
Received: by outflank-mailman (input) for mailman id 818812;
 Mon, 14 Oct 2024 18:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=043R=RK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t0Ply-0001CD-Cr
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 18:26:26 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe570e9-8a59-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 20:26:23 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 311BE114017B
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 14:26:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 14 Oct 2024 14:26:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 14:26:20 -0400 (EDT)
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
X-Inumbo-ID: cfe570e9-8a59-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1728930381; x=1729016781; bh=M7VzohHjJK
	xRVvqGu20VrrL4HtL5ugfK54HKD2nUD3o=; b=XOgLjqcrdCojCya5ZG2M4aBeQh
	Hke5g6NO1m2YMNVTyQG+dntMrad4vQ3ZZ4vjE4aiQq2HmkaJ4WNNcnCl/nNkX5VZ
	RKZomB4Vfzao0i+RNYxivqKCb1fGsDMG+CuNE6rAmemCFMvxxIDHE6IVqibwhLli
	7hmob9oqX7tVVREIqphu1UPli+N2sbB3mOg+GsqA6+VgJ1zr8KIj02lmBbYXBYH1
	mRyE0AV5FBXa/m0VlD9Jq1R/h2EyXxEzYm+sbcRXauKp7rrdD/o27kkVDnFccj8P
	fRjiDSlTfoMd/rydu2kLMD0lMnmWFknW5fzKxaVKv3LA2hz3HrFQiGxW1dvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1728930381; x=1729016781; bh=M7VzohHjJKxRVvqGu20VrrL4HtL5ugfK54H
	KD2nUD3o=; b=nIBNwuw4EeeTj+9B6t7gtG/hHLjPaWXsZ+wc7UKxEhJQfIDZGNl
	vluUtGb0X3Q9c2ZB3fa8DMuZjjAv2m5rfAjKsfl0ptjcxqrdCuP4gid3Tk3zDjRU
	MmO7N1P/injsM9l4PFBjgm6JooGm9ycIzlUzCeem1f/cciAaVQd/EKefi6y5QWGJ
	faI9WwGhVbBNAI/9hQH96TqLQBXFRB3UeoPA+vu3uUm0ekWbv1JiIIVhaMt4i38W
	YLcQSZcxidpWLWq9xg8jc8/MS6J279N2djAZ/araAFpgYZtFXQo8q2YEOnT+JisV
	GKM7YLmAgKSyiRmJK0655KXgzGUVJvQjv/w==
X-ME-Sender: <xms:TGINZ16KacgwLSOyQ6Hu9Ut9cKEC9NpaXcRBOO1ybioEYOIWSrkUdQ>
    <xme:TGINZy563oH2F2uXEEqU8ZsON3L92qbwqpOsQouBMCntCFmhPsxhR5wpCHP32OIbS
    c5ztQlAriZu8w>
X-ME-Received: <xmr:TGINZ8exR6tWwTd4-P4OQv4L4JUNBLE9PZXyQG7BkprdqGV8W0FVi_Ilhz6XhKdNU5_KA29XEMk8stHa17diEcX9KweFmipkGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvf
    fukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohif
    shhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegheetgeeihfekvdeiuddtjeei
    ueegkeehteegkedthfektdegvdegvefhheeftdenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:TGINZ-LnlhFYVjds3TxSYZ26Hx6g-a_qQd5WMl8sUdyB9ZpcR8Aa_A>
    <xmx:TGINZ5KLMQ4xa0oNhrbsZdOGMhVNJOLVBawTjRoEvLfF6nDKUodq9g>
    <xmx:TGINZ3w1_FUX89ProUI2eSznLDfQXMMXiSht7hQNZyqikvnvMhugnQ>
    <xmx:TGINZ1K_XX2ku1h2JEVJCFdZoGFGOY4U2pf0uuU-zU24e9GYCmQ9Qw>
    <xmx:TWINZ7yguA7jbjRG7GGK8xfZGVwZAAOvZD7YSL7DrIKpQa26gZIPEhad>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Oct 2024 20:26:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Xen PAT settings vs Linux PAT settings
Message-ID: <Zw1iSuLD7473m07N@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pu0ZT9iPPfhWGJd/"
Content-Disposition: inline


--pu0ZT9iPPfhWGJd/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Oct 2024 20:26:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Xen PAT settings vs Linux PAT settings

Hi,

It looks like we've identified the second buggy driver that somewhere
assumes PAT is configured as Linux normally do natively - nvidia binary
one this time[3]. The first one affected was i915, but it turned out to be
a bug in Linux mm. It was eventually fixed[1], but it was quite painful
debugging. This time a proper fix is not known yet. Since the previous
issue, Qubes OS carried a patch[2] that changes Xen to use same PAT as
Linux. We recently dropped this patch, since the Linux fix reached all
supported by us branches, but apparently it wasn't all...

Anyway, would it be useful (and acceptable) for upstream Xen to have
a kconfig option (behind UNSUPPORTED or so) to switch this behavior?
Technically, it's a PV ABI violation, and it does break few things
(definitely PV domU with passthrough are affected - Xen considers them
L1TF vulnerable then; PV live migration is most likely broken too). But
on the other hand, if one doesn't use affected feature, it allows to
workaround an issue that otherwise is very annoying to debug...


[1] git.kernel.org/torvalds/c/548cb932051fb6232ac983ed6673dae7bdf3cf4c
[2] https://github.com/QubesOS/qubes-vmm-xen/blob/44e9fd9f3b1ebf1cf43674b5a=
1c2669f7dd253f5/1019-Use-Linux-s-PAT.patch
[3] https://github.com/QubesOS/qubes-issues/issues/9501
--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pu0ZT9iPPfhWGJd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcNYkoACgkQ24/THMrX
1yzg0AgAksa+WvRTW0vrh4Qf8T9wiHjo0psyVpYWFt5ZGCH6gYX2cHpABByg8Dj1
KROPRo+BX4JcJ5KLU8cLFSHvU1pCMn47o9LLTBDO6NBX4fZiqdVAoBE/gxcJggKJ
SyCVpF4uNggIjPYutkbysJKh8Me/zg6rUH59l5Z3DrX18uSbJzo+tYv0W7dQWuH5
CIDK4ipcySo1704IUloEBsneuXtlAEypk2vELHPytGF0TFcyOhj2TpUBhDCZ59Yd
VCRHgG84E7e/Z4heSprbuM1OjCR37a32x55TdMjzXLG7nJRZwoEr36rbbOGSSC6p
4QTbNY8rNdmIr/Vrn+tG2UevJ6HsuA==
=/l5S
-----END PGP SIGNATURE-----

--pu0ZT9iPPfhWGJd/--

