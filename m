Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AA39DB66
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 13:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137876.255367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDU4-00081p-J9; Mon, 07 Jun 2021 11:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137876.255367; Mon, 07 Jun 2021 11:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDU4-0007yp-G9; Mon, 07 Jun 2021 11:31:56 +0000
Received: by outflank-mailman (input) for mailman id 137876;
 Mon, 07 Jun 2021 11:31:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rwXN=LB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lqDU2-0007yj-Js
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:31:54 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b37b0e00-aa96-4582-ad38-d79e3bdfa504;
 Mon, 07 Jun 2021 11:31:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx57BVmKDp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 7 Jun 2021 13:31:48 +0200 (CEST)
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
X-Inumbo-ID: b37b0e00-aa96-4582-ad38-d79e3bdfa504
ARC-Seal: i=1; a=rsa-sha256; t=1623065508; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OxbxY5O8QxF1r5z5FQ2va6VasBaxrZMIKLr6BfKeojnVXHcWK3hfko1KXEpF509C5e
    2RtlNfAyjiGP4r98jUnV1TfjKMFExHLGgtrE5pOAMZWxSGA0kVO2oD4WKqrZUEGH5kj+
    Q6HEH96r0hiiXH41iO0vzNQrRWPh4X3FfSQDjjgc6IA6oVG8cLcfzL6HrEhX+WMz2pZI
    3LeruEvVfBw/qpfn3v8MO169JMxO7nUZufEjCN29fFfBiWcEwoMHF3mbMFW5F0cphpyv
    9N+oIse76rlz20vn/3nF01nweqKlI7CMmsAE5zumovcMJ6fDugdblos8opfp2S6zRkJf
    T1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623065508;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tSUe+mhW0778pNVSSqM5Qlq2C/BzFqClSM00cyxyRzk=;
    b=NdNWynOoUorQUmF4+sypuCjJlvDOYuUOoNx5coBcjsUPzUxQQe88kORYKqEdHZ4KsG
    h2MHkFq3WkpjHitp3+EvVODbJwdOtW4l/iGmqkR+S9Q7R8dSaItB5JSqUC+eNxsrfVST
    7ahxRaHsEM7bP529/VdSKjMFQezR9qQmaNBeZ+aCVQ6rB04OvP3HbOgeQYHTka5RXSjI
    nMzFpu1DVlLSpmZsTg60F86H/fZyyKqtXK0SO1nLSQLynAJolzlaTcTHK5Q8dGlBMyUB
    wXoFuHR1eY3EiTGqfCly5tFaVe3alCjUJJJSBCO+h4AzUW2PiFuWe/469B3ccFU2D3QF
    vE2Q==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623065508;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tSUe+mhW0778pNVSSqM5Qlq2C/BzFqClSM00cyxyRzk=;
    b=nRQ1clVO3RktG6v8mc2d79hrpIqakI00ZZ+CI5hB9CUKe5Qv9UwD9c8IhlbTrBxcpC
    jWQxlActcP9N+M2sbfA6ntU1EsDwwxD9ojpMk6UK13ZR9uw0XfHyQ5hYAtqe/TRpNDTN
    mmarB/Zsn04gVtxevrDw/4qaF8Y/lz6bUv+mvtmGxShCRxSno7h6Z4Q2tTdCdRNn0WbM
    OxPkmLiUkw30sGd5lH015XGGHUIwJOEbvDU9MP3J6f9e+s68DW8NtKFl+RvNdpNJMo+5
    npM/Vl95vmVXM0BWkMReylzOGUUEQ+prFVg6IZ2UIfJ7sHW87RYaS6LU/mJOXGj63CBI
    e6vg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Ax6Fb03sCxOoTBq7r1dZtjiRLxxzC79Iv3HI"
X-RZG-CLASS-ID: mo00
Date: Mon, 7 Jun 2021 13:31:33 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 04/38] tools: add readv_exact to libxenctrl
Message-ID: <20210607133133.2d2c52b6.olaf@aepfle.de>
In-Reply-To: <6e1aed4e-8d32-0711-609d-dfabe906c40e@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-5-olaf@aepfle.de>
	<23783088-dc59-abd1-c66c-5fcd314d1f5c@suse.com>
	<20210602125710.0607a985.olaf@aepfle.de>
	<6e1aed4e-8d32-0711-609d-dfabe906c40e@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sukKz6=fq0Pb4nEPkGJme0A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sukKz6=fq0Pb4nEPkGJme0A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 13:41:02 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Shouldn't you check for zero length iovec elements as in the
> writev_exact() case then?

It is not clear to me what the purpose of skipping zero-length iov's at the=
 beginning of the iov array in writev_exact is.

I assume the syscall (or libc) will just skip them anyway. The code would n=
ot handle empty iov's in the middle of the array. Perhaps writev_exact shou=
ld be done in the same way as my readv_exact, that would also remove the ne=
ed for malloc. I think in the past I had a patch to do just that. Maybe jus=
t locally, maybe I sent it to this list.


In case of readv_exact, only the trailing incomplete iov will be filled wit=
h read_exact. I think the length parameter for read_exact can not become ze=
ro, "len" would already be zero. Zero-length iov's will be skipped by the l=
oop AFAICS.


Olaf

--Sig_/sukKz6=fq0Pb4nEPkGJme0A
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC+A5UACgkQ86SN7mm1
DoCTPg/9EqBFJd9+SrqmRDsKa5bn2y37kgb0CSQhj50nP8cBBhrKT+u7ZFiAmw2S
WScBfospfvZPS0Yc++K8RitovLnPgr2ljQuw5tnLtyBzVBstoTl2x1AHw4jefFav
9MOba1rl2D47prxO5aEr8Dv5tbstijx5xoAbqI2GJa2AjRWABR9T9vmrC72F190Q
FKoBhPUZ4eB/udD3Dxsz8pFcS1j/2sHAN80JxGTPbdsKAqUNZcACiLaRKZMh3XGy
qjpnwW95mdwnU0GL/y1zQNVx5r+61kRnGFKVlsicP6KnkAkoioc9vFDNQGhPQ2Hr
HBxCUaL905Ita4bZNUz81gHc4q/IL6Mb4qgf4Gkw7qNPqKwlDLch/l69NXsSK4yy
66FVl3NVhsU8ejcdfOnsgm5b5ipXj4YrnNKOra0IUIHhuTQ0dRH+HxhwmTmofejL
xlG2OqJ1te+tH/lezQPJGNLXkajjBQjkapX8w/cooYog/0KzqVHfYz702qd/kvrC
7pZOVeCAfBrVd+fm27db+RCmxItsG8uffxwTUTaVDoWlB1DPaREj4bfEej5ioY2+
P2tQs4FAg0ct5rg+kbHUZy89Jcg7nEV9GvKG0++VEJymjDCkPamIFxNMr0CPPAi4
iQwE4zzlp8xMx+zHKYRRMqlIRw2GpQSjvgs1M70qMSHuB2kAlXk=
=nFGj
-----END PGP SIGNATURE-----

--Sig_/sukKz6=fq0Pb4nEPkGJme0A--

