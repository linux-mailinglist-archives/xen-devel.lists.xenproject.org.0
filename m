Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC93BB90E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149918.277277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jul-0000Zq-CU; Mon, 05 Jul 2021 08:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149918.277277; Mon, 05 Jul 2021 08:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jul-0000XN-9D; Mon, 05 Jul 2021 08:25:15 +0000
Received: by outflank-mailman (input) for mailman id 149918;
 Mon, 05 Jul 2021 08:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0Juj-0000Ws-Ua
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:25:13 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dd2b95b-1338-4fa8-945d-0abb6118bcb6;
 Mon, 05 Jul 2021 08:25:12 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx658P7Kjz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 10:25:07 +0200 (CEST)
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
X-Inumbo-ID: 7dd2b95b-1338-4fa8-945d-0abb6118bcb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625473507;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ekgrVn9piLsvyOQyD78NTGf1aHgwIbptsXJ4pzNW4R4=;
    b=ZdfLvjSKitZyBpAWb7w3TvnmDq0NuibztZgKjE4jBOj4cwZYhO588gyMw9RgKqsksl
    Vj9YdC2W4739qwDEyySokt2Txiq8p+3rGuS4BXuWOhJKdYPneTwQfjICP31HXAbMOmlN
    ocIMH7VSOx0U34+MUqNq9tHlrZXhc0OxLe+VOxJijFNsNY9z5XPNa6+UKSRziZd5GreC
    CxwGtvbrzc47MYFkIWMIZ3SGg7eA+qDe5em/Kq03fHcNZKuoiwec7U4JD4Fwo06mLV85
    XkoRmGhfvMv2xHz5SfkiUSj2h/W/oj/4h8uuJtCkQqPuDHOEIK56IyfCjy9lOXO9uN03
    eDpg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 10:25:05 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210701 11/40] tools: use sr_is_known_page_type
Message-ID: <20210705102505.41712140.olaf@aepfle.de>
In-Reply-To: <b026dd29-4c6c-3e6d-879d-b0339f2c208b@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-12-olaf@aepfle.de>
	<b026dd29-4c6c-3e6d-879d-b0339f2c208b@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CGcRpi7WEaCSzBdx5ZFnTRn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CGcRpi7WEaCSzBdx5ZFnTRn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 2 Jul 2021 20:27:21 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Any reason this isn't folded into the previous patch, like your
> subsequent two page type helper patches are?

I think I wanted to separate this for simpler review, but I forgot to split=
 the followup change as well.

> > +            ERROR("Wrong type %#"PRIpfn" for pfn %#"PRIpfn, types[i], =
mfns[i]); =20
> "Unknown type" would be more accurate.

Yes, this is better. Thanks.

Olaf

--Sig_/CGcRpi7WEaCSzBdx5ZFnTRn
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDiweEACgkQ86SN7mm1
DoCr9w//dGrxVzPUox2VfyW4LChcH/L4cHRhNoCFq8nDUEDBKLJ8AT112EFjmDnK
qlUmxjSFrXIN10CkPazYqsGY7maKe8jb2SbDI3Z47CZuyWV4mRoapaxVvVYWe40f
cHXgzgp2NvX3bDpFyKb34kUovZvnCOTVH8RdZzO9Bg0BhmonTQ6tNTt1oo8SVfB/
yv9CpAc+wYKYpOHaiXADsRcCA2MqIJ/FCiLZw3QIRUJsLN71hX8WD5m9UZU9dPVx
MArR6ysAMQLKujTmJ8ephBKbgowUH5Ndk9g3dOlyolpdfAXe/2DH69WcQdgu3DcO
crbn/WArlVlQjfYMj0UWs7HWFfqhErtYaY6Wsyn4aBcuMSi0/rT07WlppsQ1UmHw
poScS5CvOwRYrTyPUBRYmvSHuajUbSNASaqiuXUYnOTydY27cjqx964M7FT2aTSu
dE49Rt9vHlnf4tMPIrAb7PKNDRaaOh0QBrTFXv4NYnQYoWWa6t9HVu5RVJ07klER
qRBt7PUcP1RaMTVW0BcIInClmeIa0ZzDDT8oc2SRXvtwOnDYGEFm0KY2YkSOkdXe
Gf+z6ScEpFPLG+CV6Tthxpt3T9yNYdAwh7s5faQbggyC7xY4LWlpbRRB1REv3s8s
Xj6hLobeM+NGRT98JXeJkdqdyGn9jHzulsMdylmDEewbNPgAX0M=
=L8Xq
-----END PGP SIGNATURE-----

--Sig_/CGcRpi7WEaCSzBdx5ZFnTRn--

