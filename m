Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF429A825
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 10:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12720.32977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXLYJ-0003u1-Ib; Tue, 27 Oct 2020 09:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12720.32977; Tue, 27 Oct 2020 09:46:03 +0000
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
	id 1kXLYJ-0003tc-FW; Tue, 27 Oct 2020 09:46:03 +0000
Received: by outflank-mailman (input) for mailman id 12720;
 Tue, 27 Oct 2020 09:46:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXLYG-0003tX-OS
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:46:01 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8cf5222-6f65-40b3-9a8a-8f69c8c20c1d;
 Tue, 27 Oct 2020 09:45:57 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
 with ESMTPSA id R05874w9R9jt3Ji
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 27 Oct 2020 10:45:55 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vej7=EC=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXLYG-0003tX-OS
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:46:01 +0000
X-Inumbo-ID: b8cf5222-6f65-40b3-9a8a-8f69c8c20c1d
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b8cf5222-6f65-40b3-9a8a-8f69c8c20c1d;
	Tue, 27 Oct 2020 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603791956;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=+rHiVQMTt3NwVmMjrLIIZ1zBDbkzJm5NmfYzYF1RJ84=;
	b=b07vKBICZeep5QWgqtjTBVTeEE5lFh0EvINkrNinuqZdoBipr2RDJv6ljjaT/88vo3
	A0Zfkde+8z5u6KhLekMq+I0PF58MXa9uGC03UgNRCn+usvGgfO8Zd1oYgBn236G975Ai
	qyl8ocVEg+7nLbdx079pgmD71CTAGuYpWCmoo5lQ3MhObiogxfKFCweuCxHKejKxzyVR
	ewwx2aXsSf6I9l9CKrS3euYsAxcFLACti6W0juVYHNHIuSi/Ko17/L6GEKrzxyHcYJst
	/3ZOwZKeOroNBPurrss0KkJdTSGz1B17RwaPWiSa+EVFihAMg7cWfOccPxyRMAaPZ0V2
	nyqQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
	with ESMTPSA id R05874w9R9jt3Ji
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
	for <xen-devel@lists.xenproject.org>;
	Tue, 27 Oct 2020 10:45:55 +0100 (CET)
Date: Tue, 27 Oct 2020 10:45:48 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: flawed Makefile dependencies in libacpi
Message-ID: <20201027104548.5823c554.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ERL4GRi0oNJ/V0HkyQYZzqP"; protocol="application/pgp-signature"

--Sig_/ERL4GRi0oNJ/V0HkyQYZzqP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Every once in a while build.c fails to compile because ssdt_s3.h does not e=
xist. The 'sed' command which creates the file appears a few lines down in =
the build log.

I'm not familiar with make. I wonder if "build.o" should depend on "$(H_SRC=
)" instead of the expanded list of generated headers. Some sort of dependen=
cy to the individual files seem to exist, otherwise make would probably com=
plain.

Olaf

--Sig_/ERL4GRi0oNJ/V0HkyQYZzqP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+X7E0ACgkQ86SN7mm1
DoAFjxAAljUa5v4li8vp0YrLoz6nA7TMqdt9DUMtBvz0sg/WJ9MSPkTr8KDVe4Wc
MVM5I71PnKJ9CUjV4sy1CUi4J6dOgp/mGBDdhmpuRz/mAD9OjQbnmHkAeb/V+eI9
hKBsk//0ZceDPaH3UsOcLrZDji6tBubTd4kuUJAT7ir8OenXfXRnOSfap/ECiN7T
hT7YD5u+80eJ6nXJ+ql6m2Y2BUxwNeEEJcVx3klQcSks/O7PCnftP1orR9mgtxj5
szSfzzbwOK6SdOyvrRCnFfAGPHzRZ9u4jpK3DgnRzX0RqEcLjtporn25Ca8qKOOH
cATKxccLjPiNOJDcpD4sKw/fTEU/90UTIf8IEYYGEubqjLoKbgnBKFp7xdqbGHCd
SvIbD8GKyvoxpPzNaGCepkGZJOE/6OE91zHzrgCZuD+U6ZZ/6fSLcblx8+jN0M8f
cYuI+b1bXxT9mPCDb8DHqd1sdtNnK5tUCzVUBhRnEZf05zEb4XvMJ/ffBRZRDa5A
UEM1FMJiiX4JtGIY2MpPaefRghorxxX/iogO+LOoJasr2okoBd9tznm9dWNZNZbR
Uv4kb3s2l8ymTX5PNop6o+fw5g5Mo8LcBl/RENlIzu86bUkdJCpS+2+gGMvc7FCq
b4Sfj3XQh3o7X+FWNcz+V/FJj5Q7ixZUh2QVkwkqhzMagbwHLjo=
=0M+Z
-----END PGP SIGNATURE-----

--Sig_/ERL4GRi0oNJ/V0HkyQYZzqP--

