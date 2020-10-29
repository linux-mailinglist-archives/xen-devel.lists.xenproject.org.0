Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0229EA0A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 12:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14133.35104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY5mE-00087x-N2; Thu, 29 Oct 2020 11:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14133.35104; Thu, 29 Oct 2020 11:07:30 +0000
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
	id 1kY5mE-00087W-Jh; Thu, 29 Oct 2020 11:07:30 +0000
Received: by outflank-mailman (input) for mailman id 14133;
 Thu, 29 Oct 2020 11:07:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kY5mD-00087R-0D
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 11:07:29 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9b4f07b-0764-428c-91da-afb4e77150ea;
 Thu, 29 Oct 2020 11:07:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9TB7P1pP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 12:07:25 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kY5mD-00087R-0D
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 11:07:29 +0000
X-Inumbo-ID: d9b4f07b-0764-428c-91da-afb4e77150ea
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d9b4f07b-0764-428c-91da-afb4e77150ea;
	Thu, 29 Oct 2020 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603969646;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=OkdInhY8ISYKDz1eHHErpkH+spNmrkzvpZ+j9etzVro=;
	b=U5eShJ7osS0cMMMK17kqtmwgQpTvKdI/F9yCl+bCVejQZREY18UiBiYrEmKzwaCCCk
	iR4vSqlV8A5kqUzeEi9jzmI8jLc2XAa+1MKyJujprKUlfhS33nt6OEn33q09pfJZDhiq
	kmCkdzd0Dv/0Lz8TzQtglnAI9G9zAXjVtDKYicJW9uZVEf7YopCKtShdQu5ahJWnZiOk
	Z7wtUpLGofs2KT6J3swFpuT0Nf7arUPvxBmTuwEy2PJ4S/D4XVdrS+LP3zHFywPYZ15x
	gl9QWi/2f3V8FGDra+IYnga7HzLi417yvJNEKVM8qlTH3b9uN+ZeR8+WACMBa0u6ZoQh
	UPIQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9TB7P1pP
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 12:07:25 +0100 (CET)
Date: Thu, 29 Oct 2020 12:07:10 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
 <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
Message-ID: <20201029120710.382b48b8.olaf@aepfle.de>
In-Reply-To: <20201029105715.GG2214@perard.uk.xensource.com>
References: <20201026204151.23459-1-olaf@aepfle.de>
	<68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
	<20201027112703.24d55a50.olaf@aepfle.de>
	<bc7a5e73-af27-45ae-5d82-f53176cd43a9@suse.com>
	<24025dd2-2c61-7e92-a9b1-2433eea2e909@citrix.com>
	<3880bcbd-9281-10a5-7de5-f73bcf74557a@suse.com>
	<20201028181344.GA273696@perard.uk.xensource.com>
	<4597e596-822e-041a-83de-9fcbfbd03933@suse.com>
	<20201029105715.GG2214@perard.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t1lFA3iyqOAZ4XapZ9mVPva"; protocol="application/pgp-signature"

--Sig_/t1lFA3iyqOAZ4XapZ9mVPva
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 29 Oct 2020 10:57:15 +0000
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> we need to add '.DELETE_ON_ERROR:'

The last paragraph at https://www.gnu.org/software/make/manual/html_node/Er=
rors.html#Errors suggests that this is a good thing to have.


Olaf

--Sig_/t1lFA3iyqOAZ4XapZ9mVPva
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+aol4ACgkQ86SN7mm1
DoBOlA/+KB6IsoSYAk250IUqUJyBirmv8C5IGkopUrEfY3o90wWOJDQFSeQ/azeI
cEjENVLl2oh/txAM0D7fzdBzAerOSN9/W1rVDVl3bWccEjV9CkSUuiAI6AyCbrZz
uLnpjU+QxCfPbmvFJKWDoSJXpFqdmObDWOaLs9rvA9BrUrbeWCsnv7gsXkD5jfFq
hH41MYfraFMLvLe1ux2Zf92lUvKFbyyEUuISDCEhAasrxvMCS4GTh7q9tqq7OQ+u
OKwsWS/WcoNmfN8eTY+YV6D3xlBAIMqkuSN6HboZNJqxztBuUkQeC9knF+/dnGkF
e1Fm3FxkK8yNQytb07ymgq/EMh6+Dqc7555xvk6yymxytN/uqOfTCjTQAKrXQynR
vO6R47rj5w/tw81mUJoUYJnZww6Ivfdkw89U4cZcyFwiF3sJpyzhFsz7hU3GvsiC
g8kHi6qd0mxYt/uLIkarIhC4v/gla8iSZv1e/kqVir6paW+KdipLXFt3+nNpVp2Q
lxULfXkFujl2E6Bj8C9K3WHpwhX2vMZ+NG6ImbNqp1SL0Lu4TuJ8hxQZdKSa09zn
kJtjS/jGmkqnIbtzHZ5QTR6N8E8iS0N21AfQWnbW+oRX+jtukIxpJmAAbBEYnU/a
91WiMiKoSfq7hLj2XYkEsPdtfDLor4oFpZ4fymvm/e2NM0Tb2dA=
=60w4
-----END PGP SIGNATURE-----

--Sig_/t1lFA3iyqOAZ4XapZ9mVPva--

