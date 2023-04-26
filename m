Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6846EF06F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526592.818457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prapC-0002Va-6W; Wed, 26 Apr 2023 08:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526592.818457; Wed, 26 Apr 2023 08:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prapC-0002T3-2z; Wed, 26 Apr 2023 08:48:30 +0000
Received: by outflank-mailman (input) for mailman id 526592;
 Wed, 26 Apr 2023 08:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HkN=AR=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1prapB-0002SV-30
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:48:29 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ca7f6dc-e40f-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 10:48:27 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3Q8m1HY8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Apr 2023 10:48:01 +0200 (CEST)
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
X-Inumbo-ID: 1ca7f6dc-e40f-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1682498888; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GQdomyordl0bHLukLePWnovJVCsLzJZoq2ZusSO92w3F49JqtHUo7k5rvlpeTzwMnl
    3tmkloljiSOOGXkSX+e/t8I5K9fxy8xjE67dUW/Lpitawe7Eo7Zv+Gcovg50yFj61Gjp
    7eIGxU9+o0Iq+TxXTQFwLWbAyYpzxA0xNR5J2CwWY9YVOy2G0WqgevY+6cIANa0qFdw+
    WxjpiZbO5rzmuLjvdZQS5PdjWUBJCxn9Veb+xJh++RkRKwQYS8s9K2lS1sMMhKGjCuko
    +c0ARFRbXlXdgbXyp99NV0XetUmNeBkKY033rc0QXX6WU6JKzTcEJ4Fdr7W3FOITxLkT
    r3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1682498888;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=QurI9vR3tSuWRRdF4/fGjffLmEynoAziTMR+dZMGWEI=;
    b=erZg9fuhcnXr6pL3POqpZyLwQqH7cgSSfiCqiyso35+zIpqQkH66IChgQIOtHNLQYF
    dGmUXH3P7zmw71hU8sKCJRAdTHoTNgmrFwfMKG2g1GY5jizMgCmJH4g++xTCMi7l3UD0
    M2RZcIbvPQ+CkVeJOG9uMJLFoRbNH8riNkMyRstjRLu+VEdlAHFLzQ56hpW2BfmP3IRb
    B6PqydAeAHa3HVIpkssge9mR4GMPHALL08WL+4bf1VucouTo7PFNVpm9s0lrxkwNGZu6
    ARP+CxtodbfA3KrOGbCUBM5AUbYXiMzDuPFyndhX7/RgOGcDkaID+1mJvE0iBHJs5LCw
    Fzww==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1682498888;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=QurI9vR3tSuWRRdF4/fGjffLmEynoAziTMR+dZMGWEI=;
    b=I6310rjdCQETMPzJxVNKSh0v6IOIeEU1RHtSebKqWoUhdpI+OeRXce6AQKT3zbsFOM
    a5jfmba2vbKiavzg4QjXto5fgZcFwTXwQBe6F/ot5AjJrnS+gNAST49EZZrakRXrfGYF
    U5dskY/RFydhzbGjECITM0IDc5b1zXmzaZfZkSAInXS8xcy7QufCHfXbuv7JywVUgMZs
    6cxHAF93juxLfTikS5E+MVHad1byTDQO8rhA4c+lMXA35hADM5sxIJ44sWbtqpD9wtXA
    VLueEtIWY6j0pjJ1oWWSKR6iKcWUXsYAHVkeSD74xhxGMqICWBnL/7WvqpY7vhqwtN7V
    14CQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1682498888;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=QurI9vR3tSuWRRdF4/fGjffLmEynoAziTMR+dZMGWEI=;
    b=vWRMrMhhUfpK0md7JZWIvYfyWeSULSC7zEUpPRHTValARmvZu8NzMaat51oGLp69vs
    hF0GX2iYVs9KoEwld/Bw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BBKIYx7sXVVhU9+brASRK3ZldJTnR7IDHecOJA=="
Date: Wed, 26 Apr 2023 10:47:54 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] Fix install.sh for systemd
Message-ID: <20230426104754.78845a19.olaf@aepfle.de>
In-Reply-To: <650a7f6e-be82-0312-05f2-bb69e51e828d@suse.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
	<20230426091533.68324d8d.olaf@aepfle.de>
	<650a7f6e-be82-0312-05f2-bb69e51e828d@suse.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jIE2x=fIqeynXMOA2_HVT_3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/jIE2x=fIqeynXMOA2_HVT_3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 26 Apr 2023 10:28:38 +0200 Jan Beulich <jbeulich@suse.com>:

> Is this to be translated to Reviewed-by: <you>?

It was a Nack, in case such thing exists, and if it has any meaning if sent=
 by me.

There are a few places already which do a mkdir -p XEN_RUN_DIR prior usage.
But a few are missing.
XEN_RUN_DIR and most likely also XEN_RUN_STORED have to be removed from mak=
e install.


Olaf

--Sig_/jIE2x=fIqeynXMOA2_HVT_3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRI5ToACgkQ86SN7mm1
DoC4sQ//Vy2cuy2PKtfsFjg2NKsOpIL2dLo3HXZV4ugUzgBml5D70zBgSuKjfMjQ
TGn3MHz5I3u2isUXmN12PB8Q5581hYcS0ZxLW0sJg9u2+RVk48jmFHV6x+99+KFU
sh2AHiZAh6dfKhMTKz/bxKyql2i2SVE28huD8Mjdr0KoQH2S5P8BklEOihMYDQns
J+yZhI92u4P4KavdSBP+V61M0ob3aI4y4aost2KPOTZNzS382gdhcOBEkDJaTCp3
z2SX4IJObNmFyq6P596Sofx+ij8Q0vKNVHtg6SPOUdK8W2FiduhqDG1aX7I+FgQv
TmI2s9GK4IaOITL3jrwVgtYI9iKfZNprmC9+hx1h6F1srzcIfqzALkucMLgsDuum
l2PUOpdBYwfXVQxrW5J3xWuVkz4Tiaeng+o7u2OHt/yUwypbI/47hw6gENA178k9
ml65H5utsBkXachhMgnaZj9kCQ0wpWGMjBqudjsLjzu84MReZPKP4sqtJ3Z/dxe9
8EQ6BAzBimCq2raBFzsLkM5KZWGJL2jZLgGGZ/Vja2ANkcN6Ua1Ks569r4JsmRak
r3/LQ8Zs42ZPRZpSluY8gnjMKY9XuHYK5VEY12xvyu1HRl73hK1YiXm3Y+e8rwQy
rtZyfVtYTGlIr2ZdnlGqWXfKShPk2S8GZDAE2As21zB61Vd2N8M=
=WZaD
-----END PGP SIGNATURE-----

--Sig_/jIE2x=fIqeynXMOA2_HVT_3--

