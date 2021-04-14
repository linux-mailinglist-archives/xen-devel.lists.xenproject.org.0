Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E768335EE0D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 09:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110320.210572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZos-0005Y6-8v; Wed, 14 Apr 2021 07:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110320.210572; Wed, 14 Apr 2021 07:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZos-0005Xg-5P; Wed, 14 Apr 2021 07:20:14 +0000
Received: by outflank-mailman (input) for mailman id 110320;
 Wed, 14 Apr 2021 07:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ow40=JL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lWZoq-0005XY-Fl
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 07:20:12 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7abfd449-1df8-48af-9db5-5522493e3ff6;
 Wed, 14 Apr 2021 07:20:11 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.2 DYNA|AUTH)
 with ESMTPSA id 603b2dx3E7Jx1XU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 14 Apr 2021 09:19:59 +0200 (CEST)
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
X-Inumbo-ID: 7abfd449-1df8-48af-9db5-5522493e3ff6
ARC-Seal: i=1; a=rsa-sha256; t=1618384800; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=N+tS4NLrknEppOkm+Zoe/MMyjWzeo39Sc+MjrOZjc+DtjwSjN7Xtz+EadctWGSPt1s
    2H3xD1yWtAXbKvewiFeqpwvb1cQnX/7KhmplUkvB1gVtcdLCPjcg296W/ZKfZ1vjOUaE
    vQ15ntnnxWx9YRCUGlPlUvw3aKtkGvzdvv1gDE7XpYJXV/vd1sqm2yohjxWwCeEG2ndl
    tYm2IpAC2tjgbXvOp4Cin3CkDMkOaCiIVPXZ2u0x9vIcl5cRYwxPbzZB/wgewl9SoMTg
    spSEZET/vZAUx7OEbyMi+1rb792DCLaqR2T73NGgbGZwZiuOPN0myyoMqVCS4ZRty+eF
    ttAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618384800;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Dd2Gix0oisdWq7KeY6Dqs8jNrF0K7WZF5HjPN/OKm0s=;
    b=d48l29suwGGdz7vkld9+N6nD61j2DEjGYGQlf3rLxeZ7V5VhinjDjvCjku/J0jvaoB
    Cyvejgj7icaSS5F346rWJ3h1CpBwqjFR8tu1X7CMY5lts9Mo/RVfYMSxEgs6/DA/mUnw
    pGDDl1QjUBAmgB89pVlvwAqPbVe+8ZkbzWKAYGCCt1Ri/ZZGBcQa7cLYQH6AKbvKtAcr
    CSYP6+JFzKAPrQYTq5mO2ohvRV9Rfm2S7yA5wWpqWYyteBIrc+judtfqo5KO3/GJML6o
    mzZOWCdMJ4qR+6ohvMdC/CqaeYh3MgB90Yw8ZMxrgFQoxo2m5u7QoA5EpA7Nxw23ym8q
    ormQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618384800;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Dd2Gix0oisdWq7KeY6Dqs8jNrF0K7WZF5HjPN/OKm0s=;
    b=g1VSZ651JQAibYCPtRUGaUVwPs/w8EXXceuuXTxH995ypoSZDsaMzgHtpALkJOml87
    2tty8epXD2aVSQCJY+bcv6pHg556fRYEbZ+4hWFuGR+5JO2ZUOFlRpR43ni44Kla7OdM
    HpMmI3CzziXgrJaaYCY6mPi4Ai7decWfDXLbifBCze6QEVkcA2ziFEgpWy/SbewUPXv/
    th0n14pT9TpQPeekt3RysJoEACzngZaOE589EOfPjFqX7HsLSp/AOo7N+Ne+aLLfGYMO
    9lQb9oQsFa+5iXc92eMrBa3a7CKnxYPa9TpKXrx8E29so4pxM8hxTmuDGcNWR+DGEQ3b
    +tDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWeiX"
X-RZG-CLASS-ID: mo00
Date: Wed, 14 Apr 2021 09:19:45 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3] tools: create libxensaverestore
Message-ID: <20210414091945.138b12f8.olaf@aepfle.de>
In-Reply-To: <5d483005-c6ca-88f1-0469-dd4a23c6752d@suse.com>
References: <20210413172028.29373-1-olaf@aepfle.de>
	<5d483005-c6ca-88f1-0469-dd4a23c6752d@suse.com>
X-Mailer: Claws Mail 2021.03.05 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hqFfU2YC3spdR8IeP0APbOY"; protocol="application/pgp-signature"

--Sig_/hqFfU2YC3spdR8IeP0APbOY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 14 Apr 2021 07:46:24 +0200
schrieb Juergen Gross <jgross@suse.com>:

> What about dropping the "xg_" prefix from the filenames?

None of the other moved files where renamed during the move.

But sure, if this the single blocking issue, why not.


Olaf

--Sig_/hqFfU2YC3spdR8IeP0APbOY
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmB2l5IACgkQ86SN7mm1
DoDZSA//fgD+rsQi1Eb2b1VjdH+7aDvULQFpGaQrtymcOgmFJ60LLeVm7IkTeuPw
6mStOsIfW7m+bYYieKY409wllTODivj8h9SotSsZ79xtmas8ACo79ueP4yRnisAO
Ude+wS01OA5z3PkKBA8PCScJjRS18HzKSnT+7JiOAfNONWdZhy5n5lYkTyOeL9vG
MB+EXVwU5OFsV2QfsyHns6E/7UYBp5a7csD7K3c/O8DHT9qqwZfwpNemJHFl/tvr
lcpPJHJabFiWuI61E2VWouMZUYd/SkkgJPYBAQES4EbCIWPBwtDLuPSz8Z0CL3i+
XXg8uxU69mNJgSCq+jHqysLv31YzRXOt78jNnPsutqN7O6TCNY1bCiTWLISXoDAU
uL7LA/simkUkrdxWtrOr/SQ2h/800Nk8GH32LURykN8LJCk0zzIvoLUpbH7s9DPy
UC1uZYWPEOSv9qG19qEEY2tW/u/uaJpv7MMtUohiBUOo85Yr1sdLWyLKWCniC7qV
X/IVya6NswQOxJhT6u42/CvJ3z6QpgdQMpSP1o24A8yfJdy3VVtIFnMtdo516nQ4
ZBO7o+xIUhSghKT+gD2SKiqd1+YRoT1zNhUXnnbM6OWXd5xK20q4SIKmdmy0mInu
GFx04Z6/mIl4sZKDcWNiickcuF/6M4iqccaImsIfYLBGptvC348=
=g18a
-----END PGP SIGNATURE-----

--Sig_/hqFfU2YC3spdR8IeP0APbOY--

