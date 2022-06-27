Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1855B90F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356404.584611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ldV-0007mG-GC; Mon, 27 Jun 2022 10:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356404.584611; Mon, 27 Jun 2022 10:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ldV-0007jd-Bp; Mon, 27 Jun 2022 10:06:29 +0000
Received: by outflank-mailman (input) for mailman id 356404;
 Mon, 27 Jun 2022 10:06:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5ldT-0007jV-7U
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:06:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdfbf40b-f600-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 12:06:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D6521FAA2;
 Mon, 27 Jun 2022 10:06:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B36F13456;
 Mon, 27 Jun 2022 10:06:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3NLJHCGBuWIeOwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 10:06:25 +0000
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
X-Inumbo-ID: cdfbf40b-f600-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656324385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lgja+mgTvrj3SSYgWkQBoZdXnV38e5VIwhcxARx23FQ=;
	b=L/3gLPaALErIisJRNroZR+vUYz8I6eou3O1/zNPXkBLxAJTiY4eMTBOf2PiK7153TQewRu
	MZZD0PYV/zUlbWuKIMyZTYc1x5ceUjqDy0zIxcZE0SQ9SBUPfqZBZhvZQmKIFvVYnmC3Yo
	+pHWS/nxSr5yHMAB0K7frdVrFkEfNno=
Message-ID: <66900fb3-c86c-4413-062f-26443a0b9ba7@suse.com>
Date: Mon, 27 Jun 2022 12:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] public/io: xs_wire: Allow Xenstore to report EPERM
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220624165151.940-1-julien@xen.org>
 <d135e1aa-d0bb-8a7a-cb1d-7dc9387f1f24@suse.com>
 <ce325da1-e6d4-3692-9707-f9bd52bf78c4@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <ce325da1-e6d4-3692-9707-f9bd52bf78c4@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QoMqoaBvCXfUdaXGd0T2uw8g"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QoMqoaBvCXfUdaXGd0T2uw8g
Content-Type: multipart/mixed; boundary="------------whd0lmGyvKm86Ev7exmMOAnh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Message-ID: <66900fb3-c86c-4413-062f-26443a0b9ba7@suse.com>
Subject: Re: [PATCH] public/io: xs_wire: Allow Xenstore to report EPERM
References: <20220624165151.940-1-julien@xen.org>
 <d135e1aa-d0bb-8a7a-cb1d-7dc9387f1f24@suse.com>
 <ce325da1-e6d4-3692-9707-f9bd52bf78c4@xen.org>
In-Reply-To: <ce325da1-e6d4-3692-9707-f9bd52bf78c4@xen.org>

--------------whd0lmGyvKm86Ev7exmMOAnh
Content-Type: multipart/mixed; boundary="------------2XP7g0cjMhHeGFZjmXazOJqP"

--------------2XP7g0cjMhHeGFZjmXazOJqP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTI6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSmFuLA0KPiAN
Cj4gT24gMjcvMDYvMjAyMiAwNzo1NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyNC4w
Ni4yMDIyIDE4OjUxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2lvL3hzX3dpcmUuaA0KPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9p
by94c193aXJlLmgNCj4+PiBAQCAtNzYsNiArNzYsNyBAQCBzdGF0aWMgc3RydWN0IHhzZF9l
cnJvcnMgeHNkX2Vycm9yc1tdDQo+Pj4gwqAgX19hdHRyaWJ1dGVfXygodW51c2VkKSkNCj4+
PiDCoCAjZW5kaWYNCj4+PiDCoMKgwqDCoMKgID0gew0KPj4+ICvCoMKgwqAgWFNEX0VSUk9S
KEVQRVJNKSwNCj4+PiDCoMKgwqDCoMKgIFhTRF9FUlJPUihFSU5WQUwpLA0KPj4+IMKgwqDC
oMKgwqAgWFNEX0VSUk9SKEVBQ0NFUyksDQo+Pj4gwqDCoMKgwqDCoCBYU0RfRVJST1IoRUVY
SVNUKSwNCj4+DQo+PiBJbnNlcnRpbmcgYWhlYWQgb2YgRUlOVkFMIGxvb2tzIHRvIGJyZWFr
IHhlbnN0b3JlZF9jb3JlLmM6c2VuZF9lcnJvcigpLA0KPiANCj4gOiguDQo+IA0KPj4gd2hp
Y2ggLSBsZWdpdGltYXRlbHkgb3Igbm90IC0gYXNzdW1lcyBFSU5WQUwgdG8gYmUgZmlyc3Qu
DQo+IA0KPiBJIGFtIG5vdCBzdXJlIHdobyBlbHNlIGlzIHJlbHlpbmcgb24gdGhpcy4gU28g
SSB3b3VsZCBjb25zaWRlciB0aGlzIHRvIGJlIGJha2UgDQo+IGluIHRoZSBBQkkuIEkgdGhp
bmsgdGhlIG1pbmltdW0gaXMgdG8gYWRkIGEgQlVJTERfQlVHX09OKCkgaW4gc2VuZF9lcnJv
cigpLg0KPiANCj4gSSB3aWxsIGFsc28gbW92ZSBFUEVSTSB0b3dhcmRzIHRoZSBlbmQgKEkg
YWRkZWQgZmlyc3QgYmVjYXVzZSBFUEVSTSBpcyAxKS4NCg0KSSBhZ3JlZSB0byBib3RoIHBs
YW5zLg0KDQoNCkp1ZXJnZW4NCg==
--------------2XP7g0cjMhHeGFZjmXazOJqP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2XP7g0cjMhHeGFZjmXazOJqP--

--------------whd0lmGyvKm86Ev7exmMOAnh--

--------------QoMqoaBvCXfUdaXGd0T2uw8g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5gSEFAwAAAAAACgkQsN6d1ii/Ey+k
TAf9HDJccIF+t0V7ZrqNKVmtUoChBNIEOCDQRe4FtL3PJmKleqPAk0QwzepQb/Qmsd2cW83NQXi9
uo8pTZvjSNi3M5wXB2BSFvWpc+v4SMI4EdYv5vd4VM2PUU68OmSiv5h3Dr2kHo32PQxiZ+194VDW
jRU1PVO4MXjdBJvzyoALGCNHEa5liH3bjmEldpiDHgAxsjuKyraKaq8RxM6aUdSfyIveS0dO51kT
vdXbR+dffqnP7nYTAj1CuwqtKOeViyvs8q4M2AO/GygmbZXmT5Tp3bMIJnWspcAA9NQBriyznzgu
7uK4wI5ax+o9MOWfTEVqN6CNs+eAvSYi2PKcgLN29Q==
=7Wpx
-----END PGP SIGNATURE-----

--------------QoMqoaBvCXfUdaXGd0T2uw8g--

