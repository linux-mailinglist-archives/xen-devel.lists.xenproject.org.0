Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9E29CF79
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 11:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13485.34155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXigm-00035e-6p; Wed, 28 Oct 2020 10:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13485.34155; Wed, 28 Oct 2020 10:28:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXigm-00035F-3b; Wed, 28 Oct 2020 10:28:20 +0000
Received: by outflank-mailman (input) for mailman id 13485;
 Wed, 28 Oct 2020 10:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXigj-00035A-U0
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:28:18 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940f04aa-0f76-462e-b7cb-0a490b3c20f9;
 Wed, 28 Oct 2020 10:28:15 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
 with ESMTPSA id D03373w9SASE413
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Oct 2020 11:28:14 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXigj-00035A-U0
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 10:28:18 +0000
X-Inumbo-ID: 940f04aa-0f76-462e-b7cb-0a490b3c20f9
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 940f04aa-0f76-462e-b7cb-0a490b3c20f9;
	Wed, 28 Oct 2020 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603880895;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=F8L2CeB5oyokna2/67oN32iBHrH7X44E8SkvSap2Qc4=;
	b=BZxRiZEg4sChYbus6nL6RX3XWywWugKt1llRJ1H5FzfeUVW80gdsMh1F+/9ZFmir3b
	rh5Bgc4uWFAIgydkQ51mO2uz1AWybBEUhws8vZqXZ9fLO3V7ODB7vK7Fs3k3/RujdKYd
	RiVaGCN3JtgSf1bP5ogVVCZS1NZUr0yjkiyBZOJ5PBF6PdRdn3eXLOYm1qVxZqkzprAU
	hU4Nt0i3RT/jnGZGuwWFECaUPJt4LZa6Ip07z8qHedd4es+HXnNpZHfU81wt+JGf/gPx
	NGdWkaigtM5uB/V00XKLnc1pbRa1P3rjIE+fFZNw+S2UuRGrTxKjA0bSGEIGUhsXp0Eb
	DBQA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
	with ESMTPSA id D03373w9SASE413
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 28 Oct 2020 11:28:14 +0100 (CET)
Date: Wed, 28 Oct 2020 11:28:05 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: inconsistent pfn type checking in process_page_data
Message-ID: <20201028112805.34ae0c5d.olaf@aepfle.de>
In-Reply-To: <6c595f1b-72cf-4f9e-5bad-eb0ebde45630@citrix.com>
References: <20201027184119.1d3f701e.olaf@aepfle.de>
	<6c595f1b-72cf-4f9e-5bad-eb0ebde45630@citrix.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3kgZeESTg/d5bWGlhjx7R2O"; protocol="application/pgp-signature"

--Sig_/3kgZeESTg/d5bWGlhjx7R2O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 27 Oct 2020 23:18:47 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> I suspect we probably want an is_known_page_type() predicate on the
> source side to sanity check data from Xen, and on the destination side
> in handle_page_data() to sanity check data in the stream, and we
> probably want a page_type_has_data() predicate to use in
> write_batch()/process_page_data() to ensure that the handling is consiste=
nt.

=46rom what I have seen, two (or three) helpers for sender and receiver will =
be needed:
is_known_page_type()
is_data_page_type()
maybe is_ptbl_page_type() for normalise/localise.

I will prepare a batch of changes in the coming days.


Olaf

--Sig_/3kgZeESTg/d5bWGlhjx7R2O
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+ZR7UACgkQ86SN7mm1
DoCjqQ/9HGZvCkeE3UGjzeTGkO0GQV1SUh7PzZnQop3eFSnqh4j6dvx0qRt9VRka
q42+IcerDy2LoY7FTU4JP1vYSBWa3/NMzG88pgYdw28TWPmUXeMdR6xlDssvxeGV
9Mui0gqe4KAmzg5FurkH2Lai6a/e8CXGWIR3wjhbp8kkylDEzKGmj/M7kgd3S8Ru
UqeQxoTLqumx0I+3YuEyA08mWqwurRsKNtHz2TF2BwGfQMl/FGaPo0GPUX71NS+c
pbk2sg5+NWFoujAZ99ZNdM9FVpDNo1CZeCzMG7Ef29sDytGxkPUrrGR6cG6OCJYb
/BdjGD7cNFDrC3CJZ9w87A0QEJws2w1Z+W8GrUZXMBcqWnc0Kl4yszu4n9UTNSQ5
WpLHEIlMPCqKJM38NWLn7iGb1wgzIpyxgenuIR6gdtKyrl4YiDU+mwkJtaKuRjun
5kE44zuHZ/nsgkOcHeuzCTkXicEIcO3Q2oh/mTjVkp0DgKW3oe8+pQmfSDEJ2K5a
OxfLbVrUAMkX3KZ/tQ66S+qgl7v5wPr5FbFOoYmySwHu8M/lYeW+RTmrwOP1WrL2
/HtpryfAk6+KAX5mGyWaMF94GFeq8zpTJ3ANtMsXKsmg2mpPhytnalSNkH6wct3r
p2PrtaMW1FSOAHXfC1kmkQj6nUoqoqyUYGMPdCxDwbJycX1h4AQ=
=UQj5
-----END PGP SIGNATURE-----

--Sig_/3kgZeESTg/d5bWGlhjx7R2O--

