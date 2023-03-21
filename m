Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256996C3017
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512342.792302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZzf-0003h3-1R; Tue, 21 Mar 2023 11:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512342.792302; Tue, 21 Mar 2023 11:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZze-0003fM-Uz; Tue, 21 Mar 2023 11:17:30 +0000
Received: by outflank-mailman (input) for mailman id 512342;
 Tue, 21 Mar 2023 11:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YM/b=7N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1peZzd-0003fG-Bk
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:17:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6610f44-c7d9-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 12:17:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E283D21C2D;
 Tue, 21 Mar 2023 11:17:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEDD413451;
 Tue, 21 Mar 2023 11:17:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hmPnLEaSGWT9WwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Mar 2023 11:17:26 +0000
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
X-Inumbo-ID: f6610f44-c7d9-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679397446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nGLK7P3XT7gEMPVvoCZZg9QAGZqWjG+kt2i5cEPILq8=;
	b=RL4ioPHKpY2WHJN0CdZBcxx193GacRXqkEzrymvN3CfIJGd68wDiO03WcaU9cLkQTOYNIC
	j72ZGhKcogXzDeNqUywuKs7ITM7N6R1ZMRHWFZHeOl6TDuPvn44a5iABzbcM6k2s4WkJCf
	uSVIkB8aGuG6uF3Cb60mmkSlfwCaUAQ=
Message-ID: <c658ce3d-a61b-6dcd-92f9-566412a52cd6@suse.com>
Date: Tue, 21 Mar 2023 12:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] tools/xl: rework p9 config parsing
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20230317111546.18061-1-jgross@suse.com>
 <20230317111546.18061-3-jgross@suse.com>
 <319f2c2a-0166-4311-96a4-77ab54b6b853@perard>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <319f2c2a-0166-4311-96a4-77ab54b6b853@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uPKQfbay0k7QPPyGIJ8rUKvd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uPKQfbay0k7QPPyGIJ8rUKvd
Content-Type: multipart/mixed; boundary="------------YY0MkQchyLEyxsbC0Wfp16pV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <c658ce3d-a61b-6dcd-92f9-566412a52cd6@suse.com>
Subject: Re: [PATCH 2/2] tools/xl: rework p9 config parsing
References: <20230317111546.18061-1-jgross@suse.com>
 <20230317111546.18061-3-jgross@suse.com>
 <319f2c2a-0166-4311-96a4-77ab54b6b853@perard>
In-Reply-To: <319f2c2a-0166-4311-96a4-77ab54b6b853@perard>

--------------YY0MkQchyLEyxsbC0Wfp16pV
Content-Type: multipart/mixed; boundary="------------8ppRBQX0JnJHeHqd00GroAVJ"

--------------8ppRBQX0JnJHeHqd00GroAVJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDMuMjMgMTE6NDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBGcmksIE1h
ciAxNywgMjAyMyBhdCAxMjoxNTo0NlBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gUmV3b3JrIHRoZSBjb25maWcgcGFyc2luZyBvZiBhIHA5IGRldmljZSB0byB1c2UgdGhl
DQo+PiBzcGxpdF9zdHJpbmdfaW50b19wYWlyKCkgZnVuY3Rpb24gaW5zdGVhZCBvZiBvcGVu
IGNvZGluZyBpdC4NCj4gDQo+IEJ1dCB0aGF0IHdhc24ndCBhbiBvcGVuIGNvZGRlZCB2ZXJz
aW9uIG9mIHNwbGl0X3N0cmluZ19pbnRvX3BhaXIoKS4gTm93DQo+IGlmIGEgdmFsdWUgY29u
dGFpbnMgYSAnPScsIGV2ZXJ5dGhpbmcgYWZ0ZXIgaXQgaXMgaWdub3JlZC4NCj4gDQo+IHNw
bGl0X3N0cmluZ19pbnRvX3BhaXIoKSB3b3VsZCBzcGxpdCB0aGUgc3RyaW5nICJmb289YmFy
PXZvaWQiIGludG8ganVzdA0KPiAiZm9vIiBhbmQgImJhciIuDQo+IA0KPiBBcyB0aGUgbWFu
IHBhZ2UgZG9lc24ndCBzYXkgdGhhdCBWQUxVRSBjYW4ndCBjb250YWlucyAnPScsIHRoaXMg
cGF0Y2gNCj4gbG9va3MgbGlrZSBhIHJlZ3Jlc3Npb24uDQo+IA0KPiBJIHN0YXJ0IHRvIHRo
aW5rIHRoYXQgc3BsaXRfc3RyaW5nX2ludG9fcGFpcigpIGlzIGJyb2tlbi4gSSd2ZSBub3Rp
Y2UNCj4gdGhlIHNhbWUgaXNzdWUgd2hlbiByZXZpZXdpbmcgdGhlICJzbWJpb3MiIGFkZGl0
aW9uLCBhbmQgZGlkIHByb3Bvc2VkIHRvDQo+ICJvcGVuIGNvZGUiIHNwbGl0X3N0cmluZ19p
bnRvX3BhaXIoKS4gQnV0IG1heWJlIHRoYXQgZnVuY3Rpb24gbmVlZHMNCj4gZml4aW5nIGlu
c3RlYWQuDQoNClllcywgSSdsbCBhZGQgYSBwYXRjaCBmaXhpbmcgc3BsaXRfc3RyaW5nX2lu
dG9fcGFpcigpLg0KDQoNCkp1ZXJnZW4NCg0K
--------------8ppRBQX0JnJHeHqd00GroAVJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8ppRBQX0JnJHeHqd00GroAVJ--

--------------YY0MkQchyLEyxsbC0Wfp16pV--

--------------uPKQfbay0k7QPPyGIJ8rUKvd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQZkkYFAwAAAAAACgkQsN6d1ii/Ey+x
uAf8CUcrc5NOIFlsjgYMxLFXbq2khmTIokA1defC0s/vMexCdA5SyaUhXr0xybA0nackjdbaZWF5
r+RSVVMNJ9IRz30f9f30IY54XlaaqgeJAK+SsgMxELP4af7WN8nEvbt7YRU9eA+mElVyN2Pg0htc
eF9NixmTeMkB/lbf1tPkl9icVWmaXen9bJWCzU/i8kEQdHdwjM0ZP7tu5jpOIPzOcBc6v9iqhXYo
vXUQNmOb62a2ycMqmG9k8VC4liXOu2so5xlGOiyC6ezHR4QK/TpxiWLcVIBZMRcTIaw4xSAOh8xY
2lEPoaV1RRvvZ+ZbUI2VuD/5LT6aI3brp+jtL8Bx8Q==
=OEQ2
-----END PGP SIGNATURE-----

--------------uPKQfbay0k7QPPyGIJ8rUKvd--

