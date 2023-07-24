Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C975EEE2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568513.887877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNrgJ-0000x3-2d; Mon, 24 Jul 2023 09:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568513.887877; Mon, 24 Jul 2023 09:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNrgI-0000tv-VL; Mon, 24 Jul 2023 09:16:42 +0000
Received: by outflank-mailman (input) for mailman id 568513;
 Mon, 24 Jul 2023 09:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNrgH-0000tp-47
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:16:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbfd16d6-2a02-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:16:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3809822897;
 Mon, 24 Jul 2023 09:16:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D4C213476;
 Mon, 24 Jul 2023 09:16:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YO2jAXdBvmQ/IQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 09:16:39 +0000
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
X-Inumbo-ID: cbfd16d6-2a02-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690190199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVqUYuKw5DtX3E/gcgs6pb3jzkLuApZdht3gzt5Cm50=;
	b=f7uL/Wzhfec9yNBM8nwWO1QCoIl8j6hMw5PZ2mj72v6LW4XVlviqTa7qi9ntiTiaroDmuC
	slXH9Jp/bHbygQIqGHGFswTs5kT5ViiK3tfLAGqcvtFBJPzcPxPItouBsKUCq8T0/158Gs
	5nTh54WQe3YrxMCnWORNKhJwevODdlg=
Message-ID: <9dfdc8fb-443e-8f93-6602-8f3da36e4dd7@suse.com>
Date: Mon, 24 Jul 2023 11:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xenbus: check xen_domain in xenbus_probe_initcall
Content-Language: en-US
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pmladek@suse.com" <pmladek@suse.com>
References: <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
 <1fa1bb86-f0a9-62f5-b61a-ffb29daa81f5@epam.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <1fa1bb86-f0a9-62f5-b61a-ffb29daa81f5@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5jpAB1ZNhb0zUMmRkR2ST0EN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5jpAB1ZNhb0zUMmRkR2ST0EN
Content-Type: multipart/mixed; boundary="------------DzOmqtnTZFubx8I0Bg7JsIrh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pmladek@suse.com" <pmladek@suse.com>
Message-ID: <9dfdc8fb-443e-8f93-6602-8f3da36e4dd7@suse.com>
Subject: Re: [PATCH] xenbus: check xen_domain in xenbus_probe_initcall
References: <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
 <1fa1bb86-f0a9-62f5-b61a-ffb29daa81f5@epam.com>
In-Reply-To: <1fa1bb86-f0a9-62f5-b61a-ffb29daa81f5@epam.com>

--------------DzOmqtnTZFubx8I0Bg7JsIrh
Content-Type: multipart/mixed; boundary="------------BQ7VU3I4Ib1808UMHFmXbJut"

--------------BQ7VU3I4Ib1808UMHFmXbJut
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDcuMjMgMTU6MDAsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiANCj4g
DQo+IE9uIDIyLjA3LjIzIDAyOjEzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IA0K
PiBIZWxsbyBTdGVmYW5vDQo+IA0KPiANCj4+IFRoZSBzYW1lIHdheSB3ZSBhbHJlYWR5IGRv
IGluIHhlbmJ1c19pbml0Lg0KPj4gRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPj4N
Cj4+IFsgIDM1Mi4xNzU1NjNdIFRyeWluZyB0byBmcmVlIGFscmVhZHktZnJlZSBJUlEgMA0K
Pj4gWyAgMzUyLjE3NzM1NV0gV0FSTklORzogQ1BVOiAxIFBJRDogODggYXQga2VybmVsL2ly
cS9tYW5hZ2UuYzoxODkzIGZyZWVfaXJxKzB4YmYvMHgzNTANCj4+IFsuLi5dDQo+PiBbICAz
NTIuMjEzOTUxXSBDYWxsIFRyYWNlOg0KPj4gWyAgMzUyLjIxNDM5MF0gIDxUQVNLPg0KPj4g
WyAgMzUyLjIxNDcxN10gID8gX193YXJuKzB4ODEvMHgxNzANCj4+IFsgIDM1Mi4yMTU0MzZd
ICA/IGZyZWVfaXJxKzB4YmYvMHgzNTANCj4+IFsgIDM1Mi4yMTU5MDZdICA/IHJlcG9ydF9i
dWcrMHgxMGIvMHgyMDANCj4+IFsgIDM1Mi4yMTY0MDhdICA/IHByYl9yZWFkX3ZhbGlkKzB4
MTcvMHgyMA0KPj4gWyAgMzUyLjIxNjkyNl0gID8gaGFuZGxlX2J1ZysweDQ0LzB4ODANCj4+
IFsgIDM1Mi4yMTc0MDldICA/IGV4Y19pbnZhbGlkX29wKzB4MTMvMHg2MA0KPj4gWyAgMzUy
LjIxNzkzMl0gID8gYXNtX2V4Y19pbnZhbGlkX29wKzB4MTYvMHgyMA0KPj4gWyAgMzUyLjIx
ODQ5N10gID8gZnJlZV9pcnErMHhiZi8weDM1MA0KPj4gWyAgMzUyLjIxODk3OV0gID8gX19w
ZnhfeGVuYnVzX3Byb2JlX3RocmVhZCsweDEwLzB4MTANCj4+IFsgIDM1Mi4yMTk2MDBdICB4
ZW5idXNfcHJvYmUrMHg3YS8weDgwDQo+PiBbICAzNTIuMjIxMDMwXSAgeGVuYnVzX3Byb2Jl
X3RocmVhZCsweDc2LzB4YzANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPg0KPj4gVGVzdGVkLWJ5OiBQZXRy
IE1sYWRlayA8cG1sYWRla0BzdXNlLmNvbT4NCj4gDQo+IA0KPiBSZXZpZXdlZC1ieTogT2xl
a3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPiAN
Cj4gSSBndWVzcyB0aGlzIHdhbnRzIHRvIGdhaW4gdGhlIEZpeGVzIHRhZzoNCj4gDQo+IEZp
eGVzOiA1YjMzNTM5NDllODkgKCJ4ZW46IGFkZCBzdXBwb3J0IGZvciBpbml0aWFsaXppbmcg
eGVuc3RvcmUgbGF0ZXINCj4gYXMgSFZNIGRvbWFpbiIpDQoNCkknbGwgYWRkIGl0IHdoZW4g
Y29tbWl0dGluZy4NCg0KDQpKdWVyZ2VuDQo=
--------------BQ7VU3I4Ib1808UMHFmXbJut
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BQ7VU3I4Ib1808UMHFmXbJut--

--------------DzOmqtnTZFubx8I0Bg7JsIrh--

--------------5jpAB1ZNhb0zUMmRkR2ST0EN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS+QXYFAwAAAAAACgkQsN6d1ii/Ey9n
KAf9Hj4DgJBzzT8gpPihw1w6pQ97w7OH8tPD0jUYIZHPmmn37LgnHek1HVcDPx//c0eZVA14F0N3
UTnz0hq9Qc1kPDlv/r4rH5C0HqBcphbRnmn9qS9p8GWJOQhKXX1a3+et2LfHmt1BCJW2DrCaIaDm
ujmUUfk7d4O6I3RFZIlqT+43o5peyaLeNhxLrZWu9JPhxHE+9YDv9w6gj5z6ATLcxQZ17dEhtKJs
/C2C09fGUOVqabMGwW+6ldGicB4QeQ7A10zNaESHOV0r+9YnA5CgMg73YTidB5uuHFL3q5EzO/cN
rF1FQU2hMWdJgPBvIeTDs/lD+Z43o6NQRxMA295oXQ==
=NfFS
-----END PGP SIGNATURE-----

--------------5jpAB1ZNhb0zUMmRkR2ST0EN--

