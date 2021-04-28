Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D636D375
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 09:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119057.225376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbeyO-0000G6-G5; Wed, 28 Apr 2021 07:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119057.225376; Wed, 28 Apr 2021 07:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbeyO-0000Fh-D6; Wed, 28 Apr 2021 07:51:04 +0000
Received: by outflank-mailman (input) for mailman id 119057;
 Wed, 28 Apr 2021 07:51:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSVs=JZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lbeyM-0000Fc-4K
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 07:51:02 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b795db7-9504-4ea0-86b4-7c294e4bccf2;
 Wed, 28 Apr 2021 07:51:00 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.2 AUTH)
 with ESMTPSA id D0155dx3S7ow3hl
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Wed, 28 Apr 2021 09:50:58 +0200 (CEST)
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
X-Inumbo-ID: 1b795db7-9504-4ea0-86b4-7c294e4bccf2
ARC-Seal: i=1; a=rsa-sha256; t=1619596259; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Eq7L8vJwqnIbI6PCSzdg9/PEOAzpyGzoVPlazYpm5jnnIfuOF3n4J2w5j+NMOFilfD
    b3fugFwMLhKXDYbJGKdvkJre7y2FG0c//nHgmXnGXS6rDCs6vyc7ehSxM2Tz6ttS387N
    suy40KMtj4Arced931E/v459qXRpBoyfwFsrTCG6wA7jpiRhOL7uhkCpczs7v4FkWmXL
    4VDE8adAryKtsTUEcFRdQiTTQ80dN1AF1Oq1ylZm8Cbg7IZQooTjH4rNTTo/6xANVoc7
    ft44R+fsVAglo1dM1yK6AZN/h7HQbp7hS0qU93F8ERZUlwstPgb/EaKVBLYBv3UZszxF
    im8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619596259;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=Vf4gFG2hXiU7RxjRytL1xvL8OT69uRvJR5wULQDYZ1Q=;
    b=oCMtTreFdB2mUfRVxQwFJ+sArLnvp+xpFwTMmY6Gvpc/9c98i/rGhr+Vna07XV9uuH
    sJB/kRVSei1tMuzuvsSwejt2ZC/vLP9nhQiezCWJ235koXi9P/a4QcdP3U8otRu1OHcd
    hnIz1k2uOnzjykUcANqdo6NX9/8ScaE05OIE420bILKt1EUJ4vV7IUSAGOyW8vKxz52d
    Vh4hhIyZusSh5N/K7IfWzhKW/nJlf5/EhTQ1OseQz0Yi4Uy7ZPJAAk9c6a9t+ic9LJN0
    cjfVhpC+S3DdnQ60LSrEXwBWlgTbRAKQRAV2VWN7/VDMtQbwZeeeY0EE/7DHG3mxUPpy
    aVkA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619596259;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=Vf4gFG2hXiU7RxjRytL1xvL8OT69uRvJR5wULQDYZ1Q=;
    b=UmquaNWoOsC9wuypOTomaxwKkCxSKCAF5eCQTwsrK0I6FVn0zbHiFg2zqYT/1BE6g0
    9T8fI5vGDFkSChIbXZY+UUanng+gP78RuM0Mqf4JjhzQPF0hb3biCPR3BGXnmYaGUw6b
    4y82jhYjBYyHjNoJx+H6iY0623gPPguAlnSXC55n0ta/2K0+vc6PQrK8RCsc3SCm4kIP
    KwzV0pF/gfo+FWhw63Vxyp+w1rtKOPaNjJsEqK4kYNWOysy7dEPprfgW7sa1yl3sZAeC
    3z7I++itqe3rIPAr0uwXJ2ZR/uTwvtJr4P0HlZW8BMG6QWbPP6kyHv9qivNJ3xBXqzjt
    Dxow==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisEsVR6GbU3svGYLiH9zFD0wpO7hNb2D/K88Gfjs"
X-RZG-CLASS-ID: mo00
Date: Wed, 28 Apr 2021 09:50:49 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: obtain a list of granttable PFNs from toolstack
Message-ID: <20210428095049.14a8272b.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.04.21 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dE8OC3P8fXpfa_9Ehs93HrM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dE8OC3P8fXpfa_9Ehs93HrM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Is there an API to get a list of PFNs which are currently being active in t=
he grant table for a given domid?

Olaf

--Sig_/dE8OC3P8fXpfa_9Ehs93HrM
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCJE9kACgkQ86SN7mm1
DoCxzQ//XxJprA3nZdIGwu9eqqyBgDMtwI994+GogphqN9S9j52V7ewHVuBvMqsY
Kgl6JCvmS4e+LYNXI+sz2PoPNMvgH+oUfZcHGa2Sirtoo13BqsNzYCIW+cZhUhat
g75J4GdeKrDfAOdPA8drJNFvjQkoGJiqI0cwXvRzaMsRMBj8FFQEY6OWu8kdzIPD
rfggo8XIJgyfrx0z1N/fRHW+D6WCyVLXZZrhfHSmZcYYeIzTwwMP6H4z8TtpsYy7
g8ockcD30CtgkvQhZCaVy5s5HB8XgZ87i38Pf5lK0r9VqIu0xXnuEGCgAFbeY9D8
3b3sjEg94TA7XwojMm2WFB84Q1Q4blJQoIHQeuVLXXopk1weTRI6vxkvuWiVj5gV
lDQhUCfI2kHbBV6Bpt4OpijuxBxIAnDNI6ngZ/T5MNCa9FxskB3Inf2u1bMvYDWT
j7Rfa58/D8HHlqReHjWfc5v+U0HWfrSJOs6YtO9FYNP/F7Sl+WQgTiyGyVjKD8if
tl1CYBAjbHfWmc6YalPTW3/ZuJxkiUtdIEh1h3VviWSzHFZuh2QoRZ+rIcHghGrr
ZGmuJwQ6YLiK4sGmkA+BoeGyeqOLoz5jjDnoNGqlDj0QtHji9Js4BBOYMmI6/ml3
UxbNtJUybym0WKvT7jaRUCuRRPHaYUGvO3w7B4nN4O39mbJXl/A=
=PyOQ
-----END PGP SIGNATURE-----

--Sig_/dE8OC3P8fXpfa_9Ehs93HrM--

