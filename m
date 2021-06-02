Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987BB3987FD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 13:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135979.252354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOw7-0006KF-9D; Wed, 02 Jun 2021 11:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135979.252354; Wed, 02 Jun 2021 11:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOw7-0006IO-62; Wed, 02 Jun 2021 11:21:23 +0000
Received: by outflank-mailman (input) for mailman id 135979;
 Wed, 02 Jun 2021 11:21:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loOw5-0006Gx-U8
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 11:21:21 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c5e3d0a-d4a5-488c-b578-356c9c204982;
 Wed, 02 Jun 2021 11:21:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52BLG4Tz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 13:21:16 +0200 (CEST)
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
X-Inumbo-ID: 3c5e3d0a-d4a5-488c-b578-356c9c204982
ARC-Seal: i=1; a=rsa-sha256; t=1622632876; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CtQ2P4CHqlLZR/bhH+ffeYRjSnSAIQ2RRrkKtKB5FwKxr0wKjum743DuXrWWk8/A+3
    0tPh5GnGuJrvElAlD/1Wzi7w2Tw8d8bfk2eUGxXZMDzAyALY6cJqgksp0/VWyahOqbnR
    OMGwsx109EBDD1nG6uNr5LDb745qHugebg376wMwqtN3TkDG5XlgJMIkOzAueiVIZAvA
    oeynLJUgW0IL1lwse8E9f9xtyviLP5BnxtJneyDfb0DVwfDkLeubpZuIJxi5xcJBNkZn
    0Rl6gogJ8YoSec5e9Rz6084sMkT6RSUQSNKqBWEO1STer70KAPd3jyj1rjnUR+3fM1b/
    dZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622632876;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9vWpdbDZWYsZRwpTxs4xYixb0KM4n1SJg9aWcgBfw6g=;
    b=gkJQ5rl3aL9A+75Q6dRUBfkMC1GT9PA72eX1VaJ1TfXH4InhXJx50Nh1jdmsACxLfX
    VuDFkJ54TRg0zWKTwC1y+F9U/CYmsA03dESkFZ/0jCaMtPeuJKkdtnUrZYpPK36QoXiz
    E76ezHOY0gqX0tSmEOx8aDm90vPEEVaewAOtY7kb4DcIJVlLV2QNMDlZlqP2oZq8RYXC
    d7pjKwU9fbztsJO4JMVlMJmVnlOTWJpG8gg3uyCOJREjOkxoZ28vfdbz8tR6xIThx62v
    iPhJi0+3hM9Y+O1duw6IG8Q08vVeq0JdMojc2djpNdVxAV6sf3bOh873pzWYNruCeHzm
    uPpA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622632876;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9vWpdbDZWYsZRwpTxs4xYixb0KM4n1SJg9aWcgBfw6g=;
    b=DC8qV7jHcFHU4fkaBimJZJofUxurfryEUg2mda2P2rIC1WsA8CmzEAcaTB3XjKdOet
    uwVpKKx+ehy3Xi8zykdj01GgG0unteojOBE7Eb3fGQxN53hIC3Veaks50Gf+uL61mmJD
    vr5u18Yy1yAg0ynW6YxDmQ6h9X193cRNGUZeV5MnSyKPaVCQlXb33BSGG1nsdRlcNoEk
    YfcvykPy8UGpYKR+jCDtUPyAapRw9kjgxhbmDbFWG+Tj3QjfLPJ2GvY55b6C6RixqGEQ
    UR65/P6Yt5xZ74zk6C6bU3RUyPw9GAd+DWRAb+f5j01tgNxfdJ+A12+BdVb9DldLddo0
    TnMA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 13:21:14 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 07/38] tools: unify type checking for data
 pfns in migration stream
Message-ID: <20210602132114.6fd9ee87.olaf@aepfle.de>
In-Reply-To: <9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-8-olaf@aepfle.de>
	<9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.0kF5D_cin=WVl+P6KXPNQi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.0kF5D_cin=WVl+P6KXPNQi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 08:59:13 +0200
schrieb Juergen Gross <jgross@suse.com>:

> What about XEN_DOMCTL_PFINFO_XALLOC? Is this case impossible here, or
> are you changing behavior?

I think XEN_DOMCTL_PFINFO_XALLOC is a type that does not exist in practice.

So, no change in behavior.

Olaf

--Sig_/.0kF5D_cin=WVl+P6KXPNQi
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3aaoACgkQ86SN7mm1
DoAq0xAAiSG1PWwm6py2Ekb5GUxT7/RgVIFgknbPs/vMA9rQLKwIRO/lrgfK1oqQ
CdDyBFDVEQmTMIyMqW2XndvHwGC7GpxUriziloEkFg3EzMQMJtGm1k+CxnmVJqL8
9VLyS72gk489vOro9a2xZmDfcWqaw4mHOeCPZpQmFtLhj5LmKN696qtsljG3qLNF
/YowswwH1DTq20xusPC2laCkbEhqVTOYKx3t3gtFYaLIqGc1B8IauSmvAJXvSw95
ljBMLy/vVyxXMebuWQ8hCgT1PNBvx5qAoion/pM2MuxFhZKHto3w7Fw3gzIigFTa
1bCZxgh46YuocULkeCCmzes5dGHrIdziL0tM5pUA7rSgPAnFqRLK4d+984RGAvix
eaEzvdUIXr8Knlk84lG6gOSpA3a4gRRJaP3wP/wUQej9U+qnXMqCkt6O3yinEH6V
QH2TH9H5kPhOMPbb2fBOP5J0CsE4UG33jX0KLdsWAPtmHNjFoo+kJtz0zd7C2W+e
jtQLC2kkXA8xQeA7VwR7F/648MYJshNUH3q5D6EcEKuXd8ConCt/cnKuNZOGd20m
1WfEki7/+fSbR56q9CxB1cW5xlxHau7ZU86mS4tPKR1QwVAYBiNIrUTLzEdnIipj
/Ub0DsBouQvzgSkz7Hzpoa6qyrjJm/94DJjOgqCk7X74HGh6LgY=
=5vXS
-----END PGP SIGNATURE-----

--Sig_/.0kF5D_cin=WVl+P6KXPNQi--

