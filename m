Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7956645F12
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 17:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456511.714285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2xP3-0003eS-GW; Wed, 07 Dec 2022 16:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456511.714285; Wed, 07 Dec 2022 16:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2xP3-0003c2-D4; Wed, 07 Dec 2022 16:36:13 +0000
Received: by outflank-mailman (input) for mailman id 456511;
 Wed, 07 Dec 2022 16:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=peuN=4F=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p2xP1-0003bw-2n
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 16:36:11 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e975f41-764d-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 17:36:07 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BB99932009EF;
 Wed,  7 Dec 2022 11:36:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 07 Dec 2022 11:36:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:36:02 -0500 (EST)
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
X-Inumbo-ID: 3e975f41-764d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670430963; x=
	1670517363; bh=axhUXMA34HA+Q1j97/dwkpqUsNJUM/48DcRDMKvPUN4=; b=L
	2E9c8LkJrg0CNJ8n2mXEHYcRzbJ3/ZHKnwMJ9GyQn/+Y3vuK7MJnnxVyfSdlUxXt
	iQtaF3Lk5PWMf3nj1SH8k3YZaie6enbRLofb6Eg6mpxPuhX7n4ti51QVoKxUF3Xo
	qMElbe6FIykKyaNvmLv5VFqiR6t/CYdOF9XyRe275cOrr5tuI9UIji4ipDXxQYQs
	jTeCnnuU2d7dV7Jsn/dZSLYUifcA7rYUJkOJdN1u6aETERkqazPC0j08mjWIOQSQ
	H+k0Luzzp+aRwnEFv2bHBw2WRuu+iAtkp8IQAtIlO6zaSGrmuZDtqxtZRMhpINje
	g21grB005iDSJcMLyTYIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670430963; x=1670517363; bh=axhUXMA34HA+Q1j97/dwkpqUsNJU
	M/48DcRDMKvPUN4=; b=mFearBLiVx53W5gteYjDFezL2WkZKq9QixokEWPLoU/H
	js6Qxyi+BcmGBJJLGxegSNljyHFsmfzlloE88eJKeCoCCxWZZE5meOmSSE4xOrxK
	0JTxxsK8PrwjNa9iibx+G0UC5qvOQDV8kpS62dkMKb6EpajOfl1HjSNcgAeQX8oc
	VzNKD3fyIiVKRT5DGZESzheTpoEbv1lBYgiJK0RHzAne2cO2UnvYXQ6hTayPSvil
	tn8zMjTl8hhJHw8Mo4jNsmLwRjcc+V30Ihqz4leGq8vl4smuvD9K7CnXxdU8rFGZ
	VAiuGAVctjYdQKEu63ehgb4do9+GiOlvsiaDmWyf8Q==
X-ME-Sender: <xms:88CQYxqfAHRYDut-CQ915UxSt-mDf-5FxI2IFicRDOBIKd-vgMTf1g>
    <xme:88CQYzo2I3NvIA-GDlmhb7hBROnGmO_9P0BQTM4NgwiJoQRoauNvc_fQXPwZP_OrL
    k1hrRg6XvT2bA>
X-ME-Received: <xmr:88CQY-OKjuk7NQLoZGmTHh8J-q2nXHtLSCY1kPo35rIQxlIYbOH1jRGz6FNVzeUkcEkl4ozTLeOv9SvjF79dkqaTsIhdpt620Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:88CQY86AoKqZfEfiRy7-mznXvyXoggUi3vu4QK6vQE1vPQZYBWWZyA>
    <xmx:88CQYw6wO3gnrL-KBbmr-s09suUzXNJqPdOhgDMRE9VwrGYKSuwt_g>
    <xmx:88CQY0gmZcPZ1WSVTxzbDemzdJq796ZKJZ_5Ct3LdBf3MRsKyf2xqQ>
    <xmx:88CQY-SXzVnlH7W4QwzpXfbN12XNL_ATUb8PRvhjc4fw1KCMDXU7_A>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 7 Dec 2022 17:35:57 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] vchan-socket-proxy: add reconnect marker support
Message-ID: <Y5DA7VqkvJ1kvoBj@mail-itl>
References: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
 <Y5CvxjkqB2qIKVz3@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jgA1g4YBcMUBxEuj"
Content-Disposition: inline
In-Reply-To: <Y5CvxjkqB2qIKVz3@perard.uk.xensource.com>


--jgA1g4YBcMUBxEuj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Dec 2022 17:35:57 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] vchan-socket-proxy: add reconnect marker support

On Wed, Dec 07, 2022 at 03:22:46PM +0000, Anthony PERARD wrote:
> On Mon, Sep 05, 2022 at 03:50:18PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > +                reconnect_marker_value =3D atoi(optarg);
>=20
> atoi() isn't great, if there's garbage it just return 0, which is
> validated below.
>=20
> Would there be value here in using strtol() which can detect input
> error? To at least help with maybe hard to debug issues?

I'll send v2 with this changed.

> > +                if (reconnect_marker_value < 0 || reconnect_marker_val=
ue > 255) {
> > +                    fprintf(stderr, "invalid argument for --reconnect-=
marker, "
> > +                                    "must be a number between 0 and 25=
5\n");
> > +                    usage(argv);
> > +                }
> > +                break;
> >              case '?':
> >                  usage(argv);
> >          }
> > @@ -509,6 +549,15 @@ int main(int argc, char **argv)
> >                  ret =3D 1;
> >                  break;
> >              }
> > +            if (reconnect_marker_value !=3D -1) {
> > +                const char marker_buf[] =3D { reconnect_marker_value };
> > +
> > +                if (libxenvchan_write(state.ctrl, marker_buf, sizeof(m=
arker_buf))
> > +                        !=3D sizeof(marker_buf)) {
> > +                    fprintf(stderr, "failed to send reconnect marker\n=
");
>=20
> Is this an expected failure? If so, maybe adding "(ignored)" might be
> valuable to someone reading the logs?

No, it isn't, it may mean server is gone or other fatal communication
error. The break below will terminate the process (after performing
cleanup).

> > +                    break;
> > +                }
> > +            }
> >              if (data_loop(&state) !=3D 0)
> >                  break;
> >              /* don't reconnect if output was stdout */
>=20
>=20
> Otherwise, the patch looks fine. Even if kept as is:
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>=20
> Thanks,
>=20
> --=20
> Anthony PERARD

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jgA1g4YBcMUBxEuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOQwO0ACgkQ24/THMrX
1yzgGQf9GZ+23jXZ8qdXjug4ekZHOVIF7LJtd19EyzzgMBtE3xjolN9ZL6inTFWg
2PuGqIpBqIYdT0DxWHYAj13F0/B9xmwBSDchDmz+p5j/ISikWMPyGbCMvGqkoKUH
EYk+UeQrK/q0hldXuo3LxtaOFtunXZ+p33sxavKpA2qgVMly89fJ84XE0eDLN38Q
H/LI8UN00iHnQd8vGOHcCikbqMmDAPVcUnai548SH6SoANrDazxM+ndz6H3OG6lC
P0m/0So5pqVgN8aNVCDL/39jEm0hZ1X5fOcQst0IAXQS1Q01B0J7lKWfVCAWCy5x
qMeelFuVfivga3WLpB67l7RSKNXM0g==
=jruy
-----END PGP SIGNATURE-----

--jgA1g4YBcMUBxEuj--

