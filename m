Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783C6FB5CE
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 19:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531687.827468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw4U6-0004EG-Dp; Mon, 08 May 2023 17:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531687.827468; Mon, 08 May 2023 17:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw4U6-0004C8-Ar; Mon, 08 May 2023 17:17:14 +0000
Received: by outflank-mailman (input) for mailman id 531687;
 Mon, 08 May 2023 17:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fEaP=A5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pw4U4-0004C2-TP
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 17:17:12 +0000
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b8a7262-edc4-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 19:17:12 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz48HH81ia
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 May 2023 19:17:08 +0200 (CEST)
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
X-Inumbo-ID: 2b8a7262-edc4-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683566228; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=W5kIyWZBRtirVB8R8ABRp+GuE5Wdlf/KkMElpiFRHAMl2TRgu409DRaik8UZw4yFGA
    yQf9a4wkZpC5JiSKUQF7fVv3BZX8Ytg5tHqBWdA1/hK0Jm/NfQ83S1BZfFAFDqDQz93k
    pXP0Z8Wm7W69gVy9kZsoXWbmpdxn6dXbolcUIH3py5K+u2oskLf9p9IipiwzZXVhN97c
    cRqh/5Ye3oql+1/dUnpZq31cnE2t8q/cIWar5JH6Bw5j18k8xN0MjLP+d5D88oeLgWQq
    KDrrRyPki4+isDRxIpfX6QJf61lfjzDz04C0GTg2qow2rHm1ulMZxy91fXEydMVOclQP
    YdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683566228;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JJjjfI8cGGCBUnmE7uP1IovAWHC+stQjDcKDTynV5EM=;
    b=anb+H1BggY9Al/43BWLcTC6X3IacWo/qQC4SmycI/M9NADwN4GrV4JoUpnxeo24WRd
    r/ucRm0likxPTCNxVPO/V8tcGo6V3MA5w/PbmVa+0+nwnxS3rJferrioafr2A5XXfdwA
    sK51kyLMgCO8gvpTs91SvPRyjByZT4iX1L6WNI7lqIWu8ZxR3VW2Vun8ScM4S/9YNPBy
    gcLzH87e4K6F4Kqnd7L84QKzb8fguresfuLOBS3ykjqFcJRHnLoyXK+XOK4kr/kLHSs6
    8ILHMf9hE8bjPc3g03O/hGhmjVPF6XrzBQwi3v6D5gDl/mYNnat3bgTOxxoF5/HJbAOF
    1C5Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683566228;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JJjjfI8cGGCBUnmE7uP1IovAWHC+stQjDcKDTynV5EM=;
    b=tEAdgWKY31K7pXA5G0cggg6Y4/f8HBazh+jQCxX7I8ez45pRqBiwcrdNJ7R8MAMVup
    JdG7DyBG26j1slFLo87EuG4HPfaK/2l6IdnXYVyAYIRwIR5qvj+ktiHmFMwXFq6ALsAQ
    TjDCsaHPMokqOHPDrv4ljRAqQpzXBqVSwUPzlIskyVCGyCenMT53ZK3dYPh9e78Wf6c3
    YYTvmQ0BIKSj6MjGIOZvMFCW+M/kEBgoEImNphIasmA9XSKAWR6SYCUiWpirrqDkUa90
    +ISilLlNm7Un2ghGS960EeZDZhHmbIOQYf8XHnPTPYqym7QVSeoS8woIkm7GB1lTgugo
    q3rQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683566228;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JJjjfI8cGGCBUnmE7uP1IovAWHC+stQjDcKDTynV5EM=;
    b=W9ktGnwlemDpkX5JnkPK040mp1hkOagfgwP/AQz/vdF6GheLbB8plTGXInrSFpgpRI
    Qaeo7Cbqb5ErMQRGPRCg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Mon, 8 May 2023 19:17:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] Fix install.sh for systemd
Message-ID: <20230508191706.52cd21f4.olaf@aepfle.de>
In-Reply-To: <CAKf6xpt-h7sMjznhbn1RvdT_kn1iri5oXq+_ugjWib6YyuCx+w@mail.gmail.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
	<20230426091533.68324d8d.olaf@aepfle.de>
	<650a7f6e-be82-0312-05f2-bb69e51e828d@suse.com>
	<20230426104754.78845a19.olaf@aepfle.de>
	<9dfb4f01-979e-e225-214e-34ddb51a9199@suse.com>
	<20230426124051.24c2a9a6.olaf@aepfle.de>
	<CAKf6xpt-h7sMjznhbn1RvdT_kn1iri5oXq+_ugjWib6YyuCx+w@mail.gmail.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kem2mED/kyqZYZrf0a0a5uZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/kem2mED/kyqZYZrf0a0a5uZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Wed, 26 Apr 2023 09:31:44 -0400 Jason Andryuk <jandryuk@gmail.com>:

> On Wed, Apr 26, 2023 at 6:40=E2=80=AFAM Olaf Hering <olaf@aepfle.de> wrot=
e:
> > +++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
> > @@ -49,6 +49,7 @@ fi
> >
> >  do_start () {
> >         echo Starting xl devd...
> > +       mkdir -m700 -p ${XEN_RUN_DIR} =20
> This one should be "@XEN_RUN_DIR@"?

I changed it, it was a result of copy&paste from another file.

Since hotplug.sh is included in many scripts, all such users could be conve=
rted to a shell variable. But this would be a separate change.


Olaf

--Sig_/kem2mED/kyqZYZrf0a0a5uZ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRZLpIACgkQ86SN7mm1
DoDHRw//SmBrqDmjqaXIMqVXSNyzP2zU33erPjdoQixcOeigyLisfJZUMfCDSnOV
oWKgd6wsEIdNP/0iXfoXwXwL8LYfM16gIaJ40SJ8ZFryTF4TC9Z1ySnJPp1rfjG+
R5/j/4caUJA0BW3mKAtENZ1YScQU2vM76IgeXcXfxIOhZLKnfFiolXI02ZR16OR9
kRrR0H3JisqEvv60xj8J1D2y4mUw3nbnB6Bim1Aqnyby/XuJP6DbZPtSmsGUhg4a
KNTtu137lZELkE4t1H55zlUFle/d/s0JLu1qstD6O633K/DbemPME6mNaDrrE74k
8MgHpM2nsEpPcnnpSxzwSfSv8tk8pOnO+i/LBjZaTQq0uqTlWcLVzxP87ffb/qgT
oGe8Qx/stp7H5rL4OOXl0GhlSyTgcEDvJhckg+FIk9wJ2riGEvs6Kr3aXj29PDTi
EjFO6D7y9V+txzdtu+xyxkHBcXYEZJvAlyEf4QFcndq1F9pSdoguMcT/Jwwd6HoG
C2RCX5SSykX0nDqE56RhAG6v2uqppk1bbrInpogMJxUWssB5FWNn/x2SWJY3UBO9
WOHfHdfM6faZSj2dmbps6YJEf8yUaYpQ9Ux+21Vq3POyaJU/R3iBkcd/1ayaAOef
FFIMgLJmtWkJ17+Btip0y0zz0YQFpLddeqsg1G6vmlAmS/woLDw=
=VZWr
-----END PGP SIGNATURE-----

--Sig_/kem2mED/kyqZYZrf0a0a5uZ--

