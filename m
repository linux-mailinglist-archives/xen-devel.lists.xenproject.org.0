Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482F677653
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 09:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482675.748304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsEk-0001aN-Je; Mon, 23 Jan 2023 08:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482675.748304; Mon, 23 Jan 2023 08:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsEk-0001Yd-G5; Mon, 23 Jan 2023 08:31:30 +0000
Received: by outflank-mailman (input) for mailman id 482675;
 Mon, 23 Jan 2023 08:31:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MxFs=5U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pJsEj-0001YV-Ep
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 08:31:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 544743c4-9af8-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 09:31:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 433723369B;
 Mon, 23 Jan 2023 08:31:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 185B01357F;
 Mon, 23 Jan 2023 08:31:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bs2tBN9FzmP9VQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 23 Jan 2023 08:31:27 +0000
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
X-Inumbo-ID: 544743c4-9af8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674462687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ewVBAu9a3/y/RNyxMOCnGlgWgktLuFtjJXwjo6hq/d0=;
	b=b+zG+v2gU2ZkfLCUWiwr5KPFX+Oak5e5aFjJYsVyR1gZQnCREg3EpeApAGe37H3ujXaGqK
	/MoO2SMl94Hoho72DdRhvu4uY8eFLX7UNuqD6GHHc4hzdElKob3jA6W2L/gUFBSI+8q9fc
	ZgMkZ8AGW+aAzW+jNYIULqBZpYB+CQE=
Message-ID: <d369672f-394b-f8f3-18ee-a72594a86204@suse.com>
Date: Mon, 23 Jan 2023 09:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] libxl: Fix guest kexec - skip cpuid policy
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
References: <20230121213908.6504-1-jandryuk@gmail.com>
 <20230121213908.6504-2-jandryuk@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230121213908.6504-2-jandryuk@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9i3ud0TwJ0a0B0BFjVKP0hEO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9i3ud0TwJ0a0B0BFjVKP0hEO
Content-Type: multipart/mixed; boundary="------------C18HrWHGgTJm0HnQ0nMFlr4J";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <d369672f-394b-f8f3-18ee-a72594a86204@suse.com>
Subject: Re: [PATCH 1/2] libxl: Fix guest kexec - skip cpuid policy
References: <20230121213908.6504-1-jandryuk@gmail.com>
 <20230121213908.6504-2-jandryuk@gmail.com>
In-Reply-To: <20230121213908.6504-2-jandryuk@gmail.com>

--------------C18HrWHGgTJm0HnQ0nMFlr4J
Content-Type: multipart/mixed; boundary="------------qiOjBqHYKhXU9u03ofetlxRb"

--------------qiOjBqHYKhXU9u03ofetlxRb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDEuMjMgMjI6MzksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFdoZW4gYSBkb21h
aW4gcGVyZm9ybXMgYSBrZXhlYyAoc29mdCByZXNldCksIGxpYnhsX19idWlsZF9wcmUoKSBp
cw0KPiBjYWxsZWQgd2l0aCB0aGUgZXhpc3RpbmcgZG9taWQuICBDYWxsaW5nIGxpYnhsX19j
cHVpZF9sZWdhY3koKSBvbiB0aGUNCj4gZXhpc3RpbmcgZG9tYWluIGZhaWxzIHNpbmNlIHRo
ZSBjcHVpZCBwb2xpY3kgaGFzIGFscmVhZHkgYmVlbiBzZXQsIGFuZA0KPiB0aGUgZ3Vlc3Qg
aXNuJ3QgcmVidWlsdCBhbmQgZG9lc24ndCBrZXhlYy4NCj4gDQo+IHhjOiBlcnJvcjogRmFp
bGVkIHRvIHNldCBkMSdzIHBvbGljeSAoZXJyIGxlYWYgMHhmZmZmZmZmZiwgc3VibGVhZiAw
eGZmZmZmZmZmLCBtc3IgMHhmZmZmZmZmZikgKDE3ID0gRmlsZSBleGlzdHMpOiBJbnRlcm5h
bCBlcnJvcg0KPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2NwdWlkLmM6NDk0OmxpYnhsX19jcHVp
ZF9sZWdhY3k6IERvbWFpbiAxOkZhaWxlZCB0byBhcHBseSBDUFVJRCBwb2xpY3k6IEZpbGUg
ZXhpc3RzDQo+IGxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRlLmM6MTY0MTpkb21jcmVhdGVf
cmVidWlsZF9kb25lOiBEb21haW4gMTpjYW5ub3QgKHJlLSlidWlsZCBkb21haW46IC0zDQo+
IGxpYnhsOiBlcnJvcjogbGlieGxfeHNoZWxwLmM6MjAxOmxpYnhsX194c19yZWFkX21hbmRh
dG9yeTogeGVuc3RvcmUgcmVhZCBmYWlsZWQ6IGAvbGlieGwvMS90eXBlJzogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQ0KPiBsaWJ4bDogd2FybmluZzogbGlieGxfZG9tLmM6NDk6bGli
eGxfX2RvbWFpbl90eXBlOiB1bmFibGUgdG8gZ2V0IGRvbWFpbiB0eXBlIGZvciBkb21pZD0x
LCBhc3N1bWluZyBIVk0NCj4gDQo+IER1cmluZyBhIHNvZnRfcmVzZXQsIHNraXAgY2FsbGlu
ZyBsaWJ4bF9fY3B1aWRfbGVnYWN5KCkgdG8gYXZvaWQgdGhlDQo+IGlzc3VlLiAgQmVmb3Jl
IHRoZSBmaXhlcyBjb21taXQsIHRoZSBsaWJ4bF9fY3B1aWRfbGVnYWN5KCkgZmFpbHVyZSB3
b3VsZA0KPiBoYXZlIGJlZW4gaWdub3JlZCwgc28ga2V4ZWMgd291bGQgY29udGludWUuDQo+
IA0KPiBGaXhlczogMzQ5OTA0NDZjYTkxICJsaWJ4bDogZG9uJ3QgaWdub3JlIHRoZSByZXR1
cm4gdmFsdWUgZnJvbSB4Y19jcHVpZF9hcHBseV9wb2xpY3kiDQo+IFNpZ25lZC1vZmYtYnk6
IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gLS0tDQo+IFByb2JhYmx5
IGEgYmFja3BvcnQgY2FuZGlkYXRlIHNpbmNlIHRoaXMgaGFzIGJlZW4gYnJva2VuIGZvciBh
IHdoaWxlLg0KPiAtLS0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2NyZWF0ZS5jICAg
fCA0ICsrLS0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbS5jICAgICAgfCA1ICsr
Ky0tDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oIHwgMiArLQ0KPiAg
IDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3JlYXRlLmMgYi90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX2NyZWF0ZS5jDQo+IGluZGV4IDVjZGRjM2RmNzkuLjU4N2E1
MTVkZmYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3JlYXRlLmMN
Cj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9jcmVhdGUuYw0KPiBAQCAtNTEwLDcg
KzUxMCw3IEBAIGludCBsaWJ4bF9fZG9tYWluX2J1aWxkKGxpYnhsX19nYyAqZ2MsDQo+ICAg
ICAgIHN0cnVjdCB0aW1ldmFsIHN0YXJ0X3RpbWU7DQo+ICAgICAgIGludCBpLCByZXQ7DQo+
ICAgDQo+IC0gICAgcmV0ID0gbGlieGxfX2J1aWxkX3ByZShnYywgZG9taWQsIGRfY29uZmln
LCBzdGF0ZSk7DQo+ICsgICAgcmV0ID0gbGlieGxfX2J1aWxkX3ByZShnYywgZG9taWQsIGRf
Y29uZmlnLCBzdGF0ZSwgZmFsc2UpOw0KDQpJbnN0ZWFkIG9mIGFkZGluZyBhIHBhcmFtZXRl
ciB0byBsaWJ4bF9fYnVpbGRfcHJlKCkgSSdkIHJhdGhlciBhZGQgYW5vdGhlcg0KYm9vbCAi
c29mdF9yZXNldCIgdG8gbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZS4NCg0KVGhpcyB3b3Vs
ZCBiZSBtb3JlIHNpbWlsYXIgdG8gdGhlIGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGUtPnJl
c3RvcmUgdXNlDQpjYXNlLg0KDQoNCkp1ZXJnZW4NCg==
--------------qiOjBqHYKhXU9u03ofetlxRb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------qiOjBqHYKhXU9u03ofetlxRb--

--------------C18HrWHGgTJm0HnQ0nMFlr4J--

--------------9i3ud0TwJ0a0B0BFjVKP0hEO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPORd4FAwAAAAAACgkQsN6d1ii/Ey+6
WQf/XE5XoskGYucst2H3x73kW45nMSEnqJP5CoitIczEdR8Z8Df7OjLL+gDXC6TfF4WfaM0Di4q9
tY5UOpALvtkQcZ8vOA9jDxvfdheajouo8iYGLHg9LnIxxTMdGOjSqhesYY3g44aX2BvZ1vhAjYMU
Td2t07anWJ366MvTX2P2oSRqoXSGDFgzbCX77V9ngX3elhgPiDN9Riiq7IfkMVIwtyIH8ZnARi8e
L/3j2cBEuWdfrg71ERXcGaVdGZlMaNivbxZoUcVBMOGZIQvcCKaVM2HpdraHR3FvE4lTiPPi5dsZ
kZcGijJiZR1RC/LeMJx9ciVtmjgbLeyStIzo3b7eQw==
=/hnd
-----END PGP SIGNATURE-----

--------------9i3ud0TwJ0a0B0BFjVKP0hEO--

