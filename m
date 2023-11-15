Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39C7EC99D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 18:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633797.988856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3JcK-0001cz-9E; Wed, 15 Nov 2023 17:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633797.988856; Wed, 15 Nov 2023 17:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3JcK-0001ap-6d; Wed, 15 Nov 2023 17:23:56 +0000
Received: by outflank-mailman (input) for mailman id 633797;
 Wed, 15 Nov 2023 17:23:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCCY=G4=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1r3JcI-0001ah-OS
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 17:23:54 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1a1a65-83db-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 18:23:52 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id g1b15czAFHNnRKe
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Nov 2023 18:23:49 +0100 (CET)
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
X-Inumbo-ID: bf1a1a65-83db-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1700069029; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RnWs22nGOyuNQ2Zurpo+KOY/Xi2em/wBS2I/C0MKsfHBMnduXiYQLNs+dKoAGmEeMC
    tMHUQfthdw44qcYgqgCtJORhNdtgSO6sbXEzHEidGES6Ux5cXy46pr/0k/Jd0is2JR9L
    IqU6g5qelHYJHO7fz6u5w5sYgZTcJa1xVTyekp/JHokReOEmB7WSHnn4JD6OLyWJaV2V
    hGdQI8eO4bpBefm+IvSjWvJJf3YAGO0rHda1T5jqOQhuazIlF8KtDDCtd26DVJ8D1Lgr
    pzPg34hUdqglo/nhrkpS640Gzle+kmAjwh1bIE2GA6ytPHzaowB6V7Kmqha8z49CuBfa
    isYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700069029;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=NfEx9n/KW7+QBa/Q/fkKXuUgfm6Ut+mGcw2MiCMUObA=;
    b=YqpQTzg45FRy82+TVl07Hqyv3OwH9FTRFPlrtoqHZaxmRWqoCXI8ZCdauCwRQr8W5Z
    6yZgfzFHV2yGnaxl5ZokLSs6SZOOPbLYneQECtxfMEGvQJrT2Cs02hawTxVXiEWDLBs0
    Eo2c0RA5R78hebEyoCX+U6SUJkRWnoTKafDj+Ex6KrQFa5M/2dN3QgfNrR321ZDRmzV3
    SLGtuqZb/A9OH1n4xDftrbP4HEwWZfZqmg61A2tEqg00/UhhOXp1fP5C+GJdm3IWnzM/
    Y7EcroirRPO8m7UqLkN8HSEt9vuRYH0qtKJIdNDwu3s24JNq4luqRPJuA1fiGr1nItG6
    UReg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700069029;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=NfEx9n/KW7+QBa/Q/fkKXuUgfm6Ut+mGcw2MiCMUObA=;
    b=Xv7H7eu4qWE1tFESyOOxUYTKFQjd0DgKTbGqpXNfri21q0SbKuASSG3a9liRMvyq9C
    LnnF+4ijNjiJIU0aGX7Cq2e78o171+tOD2qbxrMBfR3uU8zMw1YgdX1IUm0YyuxWoxvA
    GITZNhbn0VhqinOCga9+kJtkseD77erMp5QQG9Q1+24pa5X0CiCZLj/DbRxet0cjelPt
    Tb72UuQwf1EKWjkHN4NnHarhjpxgw7HfbbNntBw8fxuQ/7vbOlCtTOxyalcWowS8ED/5
    o8ttvtCPZW4q5oVXiM4/8E75OzR0cFSFNc3q2ClsiQSH4V1JdahR3XTAW6mskfa0y9O5
    iOZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700069029;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=NfEx9n/KW7+QBa/Q/fkKXuUgfm6Ut+mGcw2MiCMUObA=;
    b=5orEONqhkXKErbdQmfUCW59jTYToxsK2kV3tz+z7JAsb5J3FUQCKL+zDKNGxs3/xlx
    WiVra5svqzoG1P7IY3BA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BhaIaRnsNaqJN2h0dTFZeqQ89seVgD7Tlo9gNQ=="
Date: Wed, 15 Nov 2023 18:23:40 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Divin Raj <divin.raj@arm.com>
Cc: xen-devel@lists.xenproject.org, anthony.perard@citrix.com,
 jgross@suse.com, Luca Fancellu <Luca.Fancellu@arm.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable
 through 'xl.conf'
Message-ID: <20231115182340.505df6c3.olaf@aepfle.de>
In-Reply-To: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9mgcUwY5.O.ErvQM1uwJeN3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/9mgcUwY5.O.ErvQM1uwJeN3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 15 Nov 2023 15:29:09 +0000 Divin Raj <divin.raj@arm.com>:

> LIBXL_HOTPLUG_TIMEOUT

This is already solved by "libxl.LIBXL_HOTPLUG_TIMEOUT.patch" from https://=
build.opensuse.org/package/show/openSUSE:Factory/xen
Up to now it was not considered important enough for xen.git#staging.


Olaf

--Sig_/9mgcUwY5.O.ErvQM1uwJeN3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVU/pwACgkQ86SN7mm1
DoDMpxAAiyUHz3WTpeLyjU3sGJOFoKYlpVgE5I4fkkpwEa0UjWsqxgihbVGyAPP1
kgEXYvcgzYYBafjp8jyoRrx2PT8MfEtLl4QQHznXbEGBeCtAL9YKRkTIQ3e+Jnx7
zHLCMTc8Cjar+esVsxTahH0g4BG98N65b/UOm4O9WlYY1NDiSGY+dEANP7ACdxws
7sHRjeYUxwI/3gkNCCMaWbiR4S+8cKFu8jTuOrTtUf33yaqMuDXnCV8Qq4XPZvep
aYgGuyoyeptoGsCmzs/sKIlIup+89BROizDaFiP5A7pWzhlpkotMsWpJ8YxYvNCu
mv6InlLjThhfQDA1VadCIDqVFfWmLE6NnVPz1rSiKOMPCvsuxoFfxWO4UNGQADH3
PXu6uMKBDZ9wp5qohM96dawvNj6+lL7GXPzDUJO1lmz5n2IXpLlsa/HuRTGwfH1+
2AB1g5RHDCZXNK2+Uwt6bu4LZSPlw6OLz20js4KI4qpHN7O7+Xx0kOggdV2L9t65
pdCB+lOSKDga8zE+gnjX/7wU7gShsohZXfdjmLu+4ucNHxYzxufzbQT7ppUEtPUa
c1tdF4zzUr01zjd7DzDFWpEGYztjOVjjVfhWWMAXfBztnxfdjNYff1ky0fEZ0Bbe
iu57R/ZKRNO9Q2L0JAOrgi9qO0hm4JWKN3An7jQcMI/h1R4W5c4=
=y6Mj
-----END PGP SIGNATURE-----

--Sig_/9mgcUwY5.O.ErvQM1uwJeN3--

