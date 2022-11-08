Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A6620990
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 07:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439733.693778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osI1Y-000321-7H; Tue, 08 Nov 2022 06:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439733.693778; Tue, 08 Nov 2022 06:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osI1Y-0002zK-4Y; Tue, 08 Nov 2022 06:23:52 +0000
Received: by outflank-mailman (input) for mailman id 439733;
 Tue, 08 Nov 2022 06:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MYs3=3I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1osI1W-0002zE-Hz
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 06:23:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e753ef95-5f2d-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 07:23:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6CBB521B6C;
 Tue,  8 Nov 2022 06:23:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E7B8139F1;
 Tue,  8 Nov 2022 06:23:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sxDmCfP1aWPxEwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Nov 2022 06:23:47 +0000
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
X-Inumbo-ID: e753ef95-5f2d-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667888627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PEO7DL0zNZ32Tn8RciNsd2P0Lr0cQbcHn0BJiX8qFAM=;
	b=cnO3vPpizF2vggI2V7NajnKAkjdHTjBBV9W8ZJkVbzxuitawTG0tH6x+nAinQVX3elQXtc
	fmei5MdhTRpmv8P27rtI+r6ly/hbPjY2+KBL0bJmGjUzKhjcbQF0wGMMERaikx3ya3Jm7K
	D5qkqoi56XGWt8YagwaGCe1RB1tAZjo=
Message-ID: <5ec6a009-d451-cf5c-5ce6-6f36ac3f99b6@suse.com>
Date: Tue, 8 Nov 2022 07:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH][4.17] kexec: restore hypercall 1st arg's type
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B2Z0fgTiE53p0j2fBKmgUylX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------B2Z0fgTiE53p0j2fBKmgUylX
Content-Type: multipart/mixed; boundary="------------v9wsCFkPsTNwqU1LFT3TnxgT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
Message-ID: <5ec6a009-d451-cf5c-5ce6-6f36ac3f99b6@suse.com>
Subject: Re: [PATCH][4.17] kexec: restore hypercall 1st arg's type
References: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
In-Reply-To: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>

--------------v9wsCFkPsTNwqU1LFT3TnxgT
Content-Type: multipart/mixed; boundary="------------qKE8dmZOy01aRDjq0DcT0sIR"

--------------qKE8dmZOy01aRDjq0DcT0sIR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTEuMjIgMTY6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGlzIHJldmVydHMg
YSBzbWFsbCBwYXJ0IG9mIDdlMjFiMjUwNTllZCAoInhlbjogaGFybW9uaXplIHJldHVybiB0
eXBlcw0KPiBvZiBoeXBlcmNhbGwgaGFuZGxlcnMiKS4gVGhlIGNoYW5nZSBmcm9tICJ1bnNp
Z25lZCBsb25nIiB0byAidW5zaWduZWQNCj4gaW50IiBmb3IgdGhlIG5hdGl2ZSBoYW5kbGVy
IGZ1bmN0aW9uIG1lYW50IHRoYXQgcHJldmlvdXNseSBpbnZhbGlkDQo+IHZhbHVlcyBiZWNh
bWUgdmFsaWQuIFdoaWxlIHBlcmhhcHMgbm90IGEgc2lnbmlmaWNhbnQgaXNzdWUsIHN0cmlj
dGx5DQo+IHNwZWFraW5nIHRoYXQncyBzdGlsbCBhIGNoYW5nZSB0byB0aGUgQUJJLiBEb24n
dCBnbyBhcyBmYXIgYXMgcmVzdG9yaW5nDQo+IHRoZSBjb21wYXQgZW50cnkgcG9pbnQncyB0
eXBlIHRob3VnaDogVGhhdCBvbmUgY2FuJ3QgaGF2ZSB2YWx1ZXMgcGFzc2VkDQo+IHdoaWNo
IGRvbid0IGZpdCBpbiAzMiBiaXRzLg0KPiANCj4gTm90ZSB0aGF0IGFzIGEgc2lkZSBlZmZl
Y3QgdGhpcyBmaXhlcyB0aGUgaW52b2NhdGlvbiBvZg0KPiBoeXBlcmNhbGxfY3JlYXRlX2Nv
bnRpbnVhdGlvbigpLCB3aGljaCBieSBtaXN0YWtlIHdhc24ndCBhZGp1c3RlZCBieSB0aGUN
Cj4gZWFybGllciBjaGFuZ2UuDQo+IA0KPiBBbHNvIHRha2UgdGhlIG9wcG9ydHVuaXR5IGFu
ZCBjb3JyZWN0IHRoZSByZXNwZWN0aXZlIGNvbW1lbnQgaW4gdGhlDQo+IHB1YmxpYyBoZWFk
ZXIuIChUaGUgd2F5IGl0IHdhcyBpdCByZWFsbHkgc3VwcG9ydHMgdGhhdCBpdCBwcm9iYWJs
eSB3YXMNCj4gcG9pbnRsZXNzIHRvIHVzZSAibG9uZyIsIGJ1dCB0aGF0J3MgdGhlIHdheSB0
aGUgaHlwZXJjYWxsIHdhcw0KPiBpbnRyb2R1Y2VkLikNCj4gDQo+IFJlcXVlc3RlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------qKE8dmZOy01aRDjq0DcT0sIR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------qKE8dmZOy01aRDjq0DcT0sIR--

--------------v9wsCFkPsTNwqU1LFT3TnxgT--

--------------B2Z0fgTiE53p0j2fBKmgUylX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNp9fIFAwAAAAAACgkQsN6d1ii/Ey8V
ggf+OgvQbE0V5VxdMrBN43PAjFRdvCGpFfb7Y5Ndlm7wecYF9u9ckiBGdD4veQInMmXCiEd0GAuC
yvJ88YeHjADRgZe/DoSPrM0QwMuAiRacBa2YZ31xuuBNtIGIai/AeirRMOnmm1mrx1c5fmxhib4a
0H+Wz/5ZwmhKzdazUndqkAmKFZFOhOe+tR5dbUn9ud5FRzMqZobRkDZzM4b34/Q/LlOaaF7Pnu4M
+4Qpnv+v2UMiAiFPDSzg+uhQBfENeDvnea+6I4GrUCVpBsRfDg76LvYrOrxZmMP/Lmk21l1EuhnF
f7qD4Dgw2iA70iwBrCVq9WrPjgCgC6fqjyMG8duwzQ==
=qL2s
-----END PGP SIGNATURE-----

--------------B2Z0fgTiE53p0j2fBKmgUylX--

