Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705673E733
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 20:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555622.867510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDqdB-0004UO-GD; Mon, 26 Jun 2023 18:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555622.867510; Mon, 26 Jun 2023 18:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDqdB-0004RT-DQ; Mon, 26 Jun 2023 18:08:05 +0000
Received: by outflank-mailman (input) for mailman id 555622;
 Mon, 26 Jun 2023 18:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xEDn=CO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qDqd9-0004RL-SA
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 18:08:04 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f8d24c0-144c-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 20:07:58 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 386A0320095B;
 Mon, 26 Jun 2023 14:07:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 26 Jun 2023 14:07:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jun 2023 14:07:50 -0400 (EDT)
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
X-Inumbo-ID: 5f8d24c0-144c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1687802872; x=1687889272; bh=NKYlru5Q8zyii4/RLMHTs5aFTdaMFCYIUB3
	DGGzv8BI=; b=ZVMoOYbJ5EWeVEVChkCyEfWTN1kYNJgJJQnvkT3OJ5GO32Gh2Fs
	yEzda5itzvRvnXhCkSFwl9Gx5iFl0sLoJrJt0Den3fGG4qbYXg599pynQmrpAtGQ
	w5QWvgzQ9Oliw0j+BlYU7C3ei5gtPTimPAZLiXo0T8N0nvpxmBKsQxTqc7bLx945
	2xls8r+sVjXLl1T0Po0Vk39/6uPVur8JoloqcvhArCAJhpQGFu26EElscgc+y82x
	uqj2ESxQT8CemMG0HiSmUs6nrAVqKHCX6Tl0iWBj/sP9YlalNsA0VlH1jNuZaOdq
	9KZP9lr7gUKtn+xUdMCVAZpJCmcvxKKdwkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687802872; x=1687889272; bh=NKYlru5Q8zyii
	4/RLMHTs5aFTdaMFCYIUB3DGGzv8BI=; b=Sx86gt5SZcLtaVHVrdUCm+Qz4Zr4q
	5UrSiWXMlC5J2vYIMn/t+3glVTglOH5uNn3BBvvBdlXvz+O9e8eY/1Fns9/Bovpx
	l/cNL3eSnkv1u7AhZFOb7+4twg003IWudiQPngh/wyLfWu7wjNqmvyzBY2L7sphq
	EsXMSwVfIA69GMan3mLUeWUJyhRlQOEqDV2WovGKVBtSX5qRH2FtVGbKO+iVigLk
	pwr15VcEW/rinjMiaCGz7Dqb/AaPNXNUPtiHCB5+0SIGuL+xIm9hKC8ytU+IjbGf
	jcgnb0tkFrguWMVEhtnsawWeYapaHBU35pVLmSZlGqJTzOz5hvpnYOE1w==
X-ME-Sender: <xms:-NOZZJib0kfQvNC_9OpdCJGTlmeBDN4mO06pABZbipwFW8d3GLUAaw>
    <xme:-NOZZODrjFTJHEpmskjD2Fd6VmQ3sFLaV2-g8MKLgiU_Fy_qRhhyK_CsMuqx7x-WM
    2zFq4TpVT-PLQ>
X-ME-Received: <xmr:-NOZZJEGzEUQJWPinC-kvIhuuftafus3X2gbhscGYGjb_gRSYfvQTbJTnIBy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehfedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:-NOZZOR9VBZyDEdvwaypiLXIycGpc9sy6AoyillyEHoriXMGDzmoCw>
    <xmx:-NOZZGw2iG1ViL9qab3YxjGGF0O8ifHbUMF462RqDvUiu266IPls9Q>
    <xmx:-NOZZE7QWliTLDSjiGZ1iBQtVCIYsLPhctLLgYeROg5NjfUQjo1B0Q>
    <xmx:-NOZZAuBHSEocTBdHkHRsVrrBnSClHAlroJXns2PK7bjR6s-IkUnrA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 26 Jun 2023 20:07:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/python: Fix memory leak on error path
Message-ID: <ZJnT8rdnMT5lrR0A@mail-itl>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
 <20230608135913.560413-2-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q7VND38KbmXZn2zz"
Content-Disposition: inline
In-Reply-To: <20230608135913.560413-2-luca.fancellu@arm.com>


--Q7VND38KbmXZn2zz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jun 2023 20:07:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/python: Fix memory leak on error path

On Thu, Jun 08, 2023 at 02:59:13PM +0100, Luca Fancellu wrote:
> Commit 56a7aaa16bfe introduced a memory leak on the error path for a
> Py_BuildValue built object that on some newly introduced error path
> has not the correct reference count handling, fix that by decrementing
> the refcount in these path.
>=20
> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for =
Arm")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  tools/python/xen/lowlevel/xc/xc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index e14e223ec903..d3ea350e07b9 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -919,11 +919,16 @@ static PyObject *pyxc_physinfo(XcObject *self)
>          sve_vl_bits =3D arch_capabilities_arm_sve(pinfo.arch_capabilitie=
s);
>          py_arm_sve_vl =3D PyLong_FromUnsignedLong(sve_vl_bits);
> =20
> -        if ( !py_arm_sve_vl )
> +        if ( !py_arm_sve_vl ) {
> +            Py_DECREF(objret);
>              return NULL;
> +        }
> =20
> -        if( PyDict_SetItemString(objret, "arm_sve_vl", py_arm_sve_vl) )
> +        if( PyDict_SetItemString(objret, "arm_sve_vl", py_arm_sve_vl) ) {
> +            Py_DECREF(py_arm_sve_vl);
> +            Py_DECREF(objret);
>              return NULL;
> +        }
>      }
>  #endif
> =20
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Q7VND38KbmXZn2zz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSZ0/IACgkQ24/THMrX
1yzkqgf+OrPOM0qKb03qS48qBXD9MmpOk8e34lOHB6btFKrC/glsw7ZrPMuhVPM0
evLyzDfULn1jAEYc+i8aPXOOtzFrFDxtS+2zA9IGdOSJUpyr/yjbPz1Gp8jTPhZN
s7vvg+vhtlOIFabvaO4Ao/9/0N97qMZZw3wmer9cdjsHSHb14xhxV2VbLk4W17rz
jOiWGHv1pNAghxteUpWWYSUcJRTbw6DS2lxFwNSsPEL0gtH4MttySzsG0FsyFr78
2Txg5aeD3aHq94hTXtT014paxTRn21MFQPqhcfjDoXQMIjEdHmFJPAGlpAhNsbei
M8DlqnagmzKE7Rwaj7HybAXCaMTkMA==
=6F/O
-----END PGP SIGNATURE-----

--Q7VND38KbmXZn2zz--

