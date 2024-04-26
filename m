Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA48B406B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 21:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713109.1114119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Raa-000434-NJ; Fri, 26 Apr 2024 19:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713109.1114119; Fri, 26 Apr 2024 19:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Raa-00040z-Ki; Fri, 26 Apr 2024 19:50:32 +0000
Received: by outflank-mailman (input) for mailman id 713109;
 Fri, 26 Apr 2024 19:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eUo+=L7=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1s0RaZ-00040t-PL
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 19:50:31 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b9de597-0406-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 21:50:29 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 50.5.0 AUTH)
 with ESMTPSA id Dce54203QJoQCHH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 26 Apr 2024 21:50:26 +0200 (CEST)
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
X-Inumbo-ID: 3b9de597-0406-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1714161026; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eZY0kHQZHa0vbrESu0FwTkZadapwqs1OaG2FBaMe1uZO1M/Qts8cCEDh6A8HYtPvSH
    SXcuaTvnxtTZBJIPeG7fLimqt6WURL63u6L2TRkE/lcEacjrQeg3JFZzh6Lys6Zmc4uv
    o/P8wyLUQCa/kj/RNQ5xy2MTXnwHy8GIAfbF5/de9DSTANmkg8FfkK6iaVC8zcNbUDu6
    ah4y2wANOThl4UtUw3I4JahO1umrYKx3MPmgRsWMOSAjsOy4E0sowBsc3PlWdMSLzL7S
    3unD71IVfKGJ6/tV43FcsYSJWB8vaowqnZOESwrrcg8EgUeSEzp/CzwOvMK7UQ3DQ+jP
    AKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1714161026;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GipMzTNaXbexepsNXupGeKlhbYBRykgNFUxoUo7Hn9Q=;
    b=akJU55fZ14gTh0zMRD0hRfTDx2BV1vZvsyqdxbEu5Nqg4wDuqIpCFH3BKjXYDl8xKH
    IpYmHqbk6RtwiLfCFJXJgn1jVD7mEGf4I7mNn2nsx1DFVhl38cs8GIR5JS42kW7Dk1Ej
    C9Clah10kf0WDrFuU9u0shRBKBoI0ZUBvkFov7k7vgi/bJ7C31+O6vq9NdLl1EAt7+3I
    +CAadWBJdzbi4p73O7fn80r4ymkqmulBvQ2vOLz/iH6tz/yKeMc6HPIqA7vKLuxHLuj9
    mTs125PPtEGbKUkhi+tDbc6LCl/pZNQO7Ccrbt6UaSaQmFBA5Xl+V3WCveQS3pRpSGvK
    nrgQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1714161026;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GipMzTNaXbexepsNXupGeKlhbYBRykgNFUxoUo7Hn9Q=;
    b=bU6eHXDLOJ4n3Q+H725yaJ8LrZKDK4JiQcqpEuukScdtv7GkrIz02jLSteKe05Z0FF
    gW7/UdchadVmDbL0F9ycFwQMSfJX+ctoXrQxFQm8L4kdDzNh8pZgpIBoLgJHc/dcvw+a
    0FvM2qkWT2K4mLhn9HJmSYd8uxeos0av9ay+GyxBNfXkaC3TRTKs1HGWWu6eKI+Qsa/F
    Vqm7fYatqe2t0eORvEdH7vH5wOaBwqnslfpOT0GDiVi0agFyjEgjLV9o3XgxfQJmmFAK
    uTlBHaMsacYHpHGUV/qb729VtExXqtXAjTBD87xlVxVxCygRGEREjoN9GuqARKWwC/ln
    GOHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1714161026;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GipMzTNaXbexepsNXupGeKlhbYBRykgNFUxoUo7Hn9Q=;
    b=ykjvSggwE3bKw9O49S+FhdhtU9hD1ZaxnWRIhZbmx78i2mbI4Rm7yTjIeoXUuT2BOp
    gakgi/Zwp+ehUcamnhCw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4BkGIaBLsSePyHTveXmQA82g1CU11ZkCzUrDvyQ=="
Date: Fri, 26 Apr 2024 21:50:17 +0200
From: Olaf Hering <olaf@aepfle.de>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@cloud.com>, Anthony Perard <anthony.perard@cloud.com>
Subject: Re: [PATCH 3/3] tools/xentrace: Remove xentrace_format
Message-ID: <20240426215017.22b559bf.olaf@aepfle.de>
In-Reply-To: <20240426143231.4007671-4-george.dunlap@cloud.com>
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
	<20240426143231.4007671-4-george.dunlap@cloud.com>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uhbal21UnTeIMFXT1L=9ErK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/uhbal21UnTeIMFXT1L=9ErK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 26 Apr 2024 15:32:31 +0100 George Dunlap <george.dunlap@cloud.com>:

> Simple remove xentrace_format, and point people to xenalyze instead.

Acked-by: Olaf Hering <olaf@aepfle.de>


Olaf

--Sig_/uhbal21UnTeIMFXT1L=9ErK
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmYsBXoACgkQ86SN7mm1
DoAi3BAAnnpcRQY0Aa9i2+WOWf6iU9YFKu0xwJOgNuzdtAWSTj2CEpW7BbZqPwA1
PzaAgrLYhdiNEuwnZw+HQFmn19qWQKl5VN177xNy+TIju6OATaM3IPtbtBpWqHhz
XpetgCMGCNZHAXkGG/kXz2AKfu2vXw/iQ4/QM8aZk6UqFRuHaj4JJc8TDMAGKEsi
7c3ZFBIRaAbkfkf/qa7+SurQono+C+3O+ozsClaxAHu9oA0sffP2ggbh5HlLwdsa
ned4pqw0Iq2o737T0A9rmNH4xEyO6+92SAzChkqdbFIgsgoLitEpGfcHECHa4034
yop76j+mcIKx05eV+069Xe8kl6APBf3rw4cZ5uBTCDN/afPrg2qpD60W4qjGQ4f4
SCn3EvPGkWjMIDl5PyhIHV1dvrAnxUmiOtTMeZbwKNokjKW8q5cLdJrA49qOHKrp
hq8Qq+7yBFBed/M/fQ19PG3Xab5rONDTwyO4rQj5AoMUVOpt5EkJTNpdAkRsBAav
eeYoP518mj0u1BAoLGVKT0u106U5cSyqbEERoeDSc3avlArgi4Ds/pMIv9857ZGN
iUIE/9v2jgBWrAn+NLHusyLbp/5E++hdzrtlkN+3TNrBImGad5O8L9QFZ0HzjWY3
BgTcOr8Z9nBvZu9f/80Yn1ux0h6Q2+eICLi0Trq6FZp1ARK9co8=
=uOIe
-----END PGP SIGNATURE-----

--Sig_/uhbal21UnTeIMFXT1L=9ErK--

