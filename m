Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D5D912B69
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 18:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745400.1152524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKhAc-0008GD-9Z; Fri, 21 Jun 2024 16:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745400.1152524; Fri, 21 Jun 2024 16:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKhAc-0008EH-6o; Fri, 21 Jun 2024 16:31:26 +0000
Received: by outflank-mailman (input) for mailman id 745400;
 Fri, 21 Jun 2024 16:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1oNf=NX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sKhAa-0008EB-Qe
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 16:31:25 +0000
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b14a57f2-2feb-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 18:31:22 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id 64AFE1C00078;
 Fri, 21 Jun 2024 12:31:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 21 Jun 2024 12:31:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jun 2024 12:31:17 -0400 (EDT)
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
X-Inumbo-ID: b14a57f2-2feb-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718987479;
	 x=1719073879; bh=Lg6KZ4rv402lmmxWX4I7NIkvVbPXj4grBgrj1P9T370=; b=
	bK1VKnUJ4PTxCcMsXNA3pWtrOYb0W5CdCsYiWKDHnwO0KnpAwe6CTmjFKCKvC/Cy
	P19mB1v1XsozxF/hdnvZDT7Py2aR2ApX9FUu6acQrOmXDZmxLGmxomYMOEgQ75vK
	DkjjjrN4H3IfLJMnhn8OoBBscue8gbQA3EsLNNa0GAxEw2PwHlPFIu/+a58ZUTIs
	KLtr0i5igXMb9ETDulVzGufeVBDNGYMPs+1pPakEiSYfwP80xf3/ssBO6dGRZ2AV
	TMTLTQ3dJXT/1DjVd2Mlc2FbKJedsb8XRHQ6+OeCRPqMRT/XifC8GQHw8HI9sv8K
	T0aAyIUqjZanNHRodczi2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1718987479; x=1719073879; bh=Lg6KZ4rv402lmmxWX4I7NIkvVbPX
	j4grBgrj1P9T370=; b=EINf2H/PkzJmvpcTYeX9EKO8I67LVSknJR+CHqE1XpkR
	VN+R68l4VQCVeSBxCYbnhnRqhNmOGE2X3qN0+hcykdDEWwKsRL27E64qceiIikfR
	bwkxBiLEX79pA85rAYvcshXj8M2dLelT+kY/CAkhMfP11X/yU5JHqdUbA5N42XJw
	pb70p65ZIJGTiRDgQZlurwIQfPP9TcxKyzkt9/QV999cxUahdNKk3MqpiRduTwub
	zgasao3v+wYYWUbpGEI/OVhLd9owufFQuZ+Q/XDNnoRHXRpwbzsbqQSNEyZLjpIq
	4U3mWYNVw+qvA0YAN5QYqK4xy1p77Kk527qkSIUGeQ==
X-ME-Sender: <xms:1qp1ZsHizsx_1iy8lp0rpIAiFEy31lZUPqmfnKWUE7EMq9-FwlBwCw>
    <xme:1qp1ZlUOssPCFlJTqJXCCzKJwRjV_LM-TDbDDTfcwcbMcrxBw2bbmL3mrgVTB4VJM
    zrrGp_gFFdXDQ>
X-ME-Received: <xmr:1qp1ZmLQbC8LRAfSlfAyVqq6V_0tXWLbag3cp7epeGDXF77V-cJkOyW-oaVh6_8wVM8xjGt8IuYDx_Lf0P5jKfuzFWm0tJt4WQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeu
    keetteeggffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffoh
    hmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:1qp1ZuExyE_I5BpMTLL4GeiuLzlc7u1xUIK6JCyQ16RBpl6fQOu5Tw>
    <xmx:1qp1ZiUnvSoxWCAYJtVqsJ4hveQqGCGML_QFLAQ0JW2k-ldMRNc7AQ>
    <xmx:1qp1ZhOFt9Dceo5un2hLkJvCy1XPWv_T-KTjO02NflQTXPmN_T83cg>
    <xmx:1qp1Zp1M1FlO5yqWj3s4W1H9oOe0sLI9H9de7MEF7Mz2CXIp1uQgug>
    <xmx:16p1ZkfNpwjdRN47-VBHlZZ4tycxOUUfdlxa5_imKbTegie9P6_RcEb3>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 21 Jun 2024 18:31:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC
Message-ID: <ZnWq0lzbE3Rxjwna@mail-itl>
References: <20240621161656.63576-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J9jQFlsl7RzgvedU"
Content-Disposition: inline
In-Reply-To: <20240621161656.63576-1-andrew.cooper3@citrix.com>


--J9jQFlsl7RzgvedU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Jun 2024 18:31:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC

On Fri, Jun 21, 2024 at 05:16:56PM +0100, Andrew Cooper wrote:
> `xl devd` has been observed leaking /var/log/xldevd.log into children.
>=20
> Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd=
, so
> after setting up stdout/stderr, it's only the logfile fd which will close=
 on
> exec().
>=20
> Link: https://github.com/QubesOS/qubes-issues/issues/8292
> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Also entirely speculative based on the QubesOS ticket.
>=20
> v2:
>  * Extend the commit message to explain why stdout/stderr aren't closed by
>    this change
>=20
> For 4.19.  This bugfix was posted earlier, but fell between the cracks.
> ---
>  tools/xl/xl_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> index 17489d182954..060186db3a59 100644
> --- a/tools/xl/xl_utils.c
> +++ b/tools/xl/xl_utils.c
> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfil=
e)
>          exit(-1);
>      }
> =20
> -    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY|O_CREAT|O_APPEND, 06=
44));
> +    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY | O_CREAT | O_APPEND=
 | O_CLOEXEC, 0644));
>      free(fullname);
>      assert(logfile >=3D 3);
> =20
> --=20
> 2.39.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--J9jQFlsl7RzgvedU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZ1qtIACgkQ24/THMrX
1yxTBwf+NYZcjqSncwaWLfQxtjZTGZ+mPGAfV934pMPzZEB0+JGOWlBtf/7Md9ri
vWsVM/xi52QphTKZziIL4hfWGpL646AmFRCeFV+msXCAQ/k4a2j8w4U1J9uriPMy
jRx1lH4jR5RokVQ1tHU84mkNVLIY3lIXyEbxl0RejjqM0/sK0xRO7q8/0J2DsEP6
qlOGQmNGKQpByvQqXSMMgXt2wGR7Uv464Ur4HYPO/0+y+l1g/idCUhVTRpD5ZcSG
y4GRb3Z+1GcIe0cxsACez5eWMoLnNisbq7SdGH9uRgZFJ156/Tx312trS+jp2vzb
d8hrjKcdWBvHgZr7NXjAvfnvovb9tA==
=Z2B+
-----END PGP SIGNATURE-----

--J9jQFlsl7RzgvedU--

