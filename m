Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D637F519
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 11:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126797.238264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh81B-0002Pq-8t; Thu, 13 May 2021 09:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126797.238264; Thu, 13 May 2021 09:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh81B-0002N6-4O; Thu, 13 May 2021 09:52:33 +0000
Received: by outflank-mailman (input) for mailman id 126797;
 Thu, 13 May 2021 09:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yjCE=KI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lh819-0002N0-K5
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 09:52:31 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aefe7773-63df-4f89-ac6f-3d9d53501116;
 Thu, 13 May 2021 09:52:30 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4D9qS3pq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 11:52:28 +0200 (CEST)
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
X-Inumbo-ID: aefe7773-63df-4f89-ac6f-3d9d53501116
ARC-Seal: i=1; a=rsa-sha256; t=1620899548; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hEfWgoDs39gKRlWOGytO1Q4VtzO00eKDV/ffvOXboszJefdeDw7Do+n+5biHqUSGe3
    G0Rf4WBMxfAaNVUdBVy4im4vgjNl7FEDnjzqehtZx37ME5wWMzPKus1mWESh0rkmAceR
    PWiAaiQM6IUfYSWulsOc0IYncxbMvdrW9IYyo/C1puQLC+J/ald5L8gH/CDzqEomzhCH
    l2VddD2itRIAgGUQ6qPK5h8zBmZT77wastRc2RRhaNjaRH/q+/X/gDKgJ7MAktH0m2QW
    yIdC+YaxB2QBRJyS5/uKNGq0bpoNtJTwqhE6n4b9xUG+Lv3Txe8LKur1/IhmGQmWxYM8
    kMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620899548;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=IFPBgtnQ4yZX6e7A5Exc73MNWqTnOip6+lgCl1NwiIY=;
    b=YJ5/KO3VQ7Kcwzznr+0n5u/CiH/VuHPFmjzp+Fi64w9jIyU7RxjXQAHOm1FuxOKJbr
    1uIf20mY1yFOY8m7SFjJWcArJwDQ8O8Plry0yX5vDzOBtvjhYSj8L4iFEHj6LkE1KqoM
    +oL9rCagLKvcuoIrhBl1Khv51DJ8LrYcESL/vKu7VQ1rl+4oHhZDImVHcOUn7OSV8wlI
    1Kb+lKLpyEzs6GfvdL0/oItc8alCoiPEN2yohJtd6ndxBhAtY4rocnjXWlJkjTiyxR+p
    HWlmmeeJgA9EEU85RPWWGXmtuJE6VvArtIFbjtIbz73VE+wZ5tx9bIgGzCPf1t3zwlDZ
    dEQQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620899548;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=IFPBgtnQ4yZX6e7A5Exc73MNWqTnOip6+lgCl1NwiIY=;
    b=l3nE4bRRUawgPSxQkIHJJKNMu8WniwWA5hWJ/yZgekuy6EohdyLzPDXi5LSWINkamn
    0erbmu9lGEzU9C/vQ8CFouNAAOeEPj6Q4kF2GpJjgov6ADwtQFhOSXD4ec5bNGluo4pa
    npCq0ONrM6ENk7/CGfwrL4vG5ISW3ZHnoXy7WXBTdlc32wOLmq30opUCEihmWgHF4noP
    p8qh2sFxJjFiM2zgm6uH78T53iPmq21PVev6sZvT0n6okyr7Q5AVMsUTHuubtEsNhKnx
    TmwCfm5cKHlVfHnAqcYjRmqe+fXFR9Nmq5v9Sf8+h1zd4vT5JMIMp/HX8Sb7HUxzsE8U
    +V3Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Thu, 13 May 2021 11:52:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: regression in Xen 4.15, unable to boot xenlinux dom0
Message-ID: <20210513115221.121aa3db.olaf@aepfle.de>
In-Reply-To: <YJz2RpJ/c8dTXG0w@Air-de-Roger>
References: <20210513112136.6dcc3aaf.olaf@aepfle.de>
	<YJz2RpJ/c8dTXG0w@Air-de-Roger>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MpTPGB1HD2zO3oIp6xK2bfL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MpTPGB1HD2zO3oIp6xK2bfL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 May 2021 11:49:58 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> Can you boot with dom0=3Dmsr-relaxed on the Xen command line?

Yes, that helps - I just discovered this cmdline option.


Olaf

--Sig_/MpTPGB1HD2zO3oIp6xK2bfL
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCc9tUACgkQ86SN7mm1
DoCVVg/9EcXBNIltPts0EONad2gy2xPDuWX7keBc38rBFomu1NtU7vXIB1B0a4rE
TgOP13DGNJ/UH0JgQK7OAAj5wUJqR5sLVTuH/RgKrQK0N/liw5dBLY1LBQU4/RFf
r1QeEP3f0gVYUprfqbZb38wdWKGU8aJiLNDaZhc48o0LkSSfBZuJF4cuNmT22QIu
HaUFLHxsryjfc2/FOl0U1c4+8N0398abcxvT3mlXF3wCjYhiTpwi+HwGwLt9HQpf
s4APX8Tu5Yff+jJsqjbevQOM9IRFR0FAEY3nWoA5bJiIOFCa/RE5fhcRm+DnP6bt
hKR38vrvoXYjzCPdRc6YDItO7POl/pdlXZatvOFn7NtckqLxGIbANJ2XuhhzX3ev
s4BxM4hwr87VYYG8DfAtgbLCd9nggxWcYI6ckz+kZJcUSRuIdJznG1351Zdiq15+
9+VTIc1Qmx0pq6mUBvmNq4RVsUr+/WPwPDMQmhVi5rWoNUXnCijQ37rlfLk19wV3
CzTK2IyD1e2rIbBwCIzb1AyIoRUiL+u1FksXW5+rO2aIyMBnCX3WMOcTA3hWS7RK
45FHZHzNjJCuTyj6N811upKFj7LaSFzo9AuqT/thLMViakP2ifgiV6sMG6UhQNZJ
M/fubDy5HVZwAyW8PBvjlLdOsutDvAuoNTIvdSck+z31vstVj2M=
=0xNu
-----END PGP SIGNATURE-----

--Sig_/MpTPGB1HD2zO3oIp6xK2bfL--

