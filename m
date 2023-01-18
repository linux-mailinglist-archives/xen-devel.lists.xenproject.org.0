Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8167150F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 08:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480179.744428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2vE-0002Ib-J3; Wed, 18 Jan 2023 07:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480179.744428; Wed, 18 Jan 2023 07:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2vE-0002GI-G6; Wed, 18 Jan 2023 07:31:48 +0000
Received: by outflank-mailman (input) for mailman id 480179;
 Wed, 18 Jan 2023 07:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI2vD-0002GC-1y
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 07:31:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28c09018-9702-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 08:31:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 80FFE209FA;
 Wed, 18 Jan 2023 07:31:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D10F139D2;
 Wed, 18 Jan 2023 07:31:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A577FGCgx2OhegAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 07:31:44 +0000
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
X-Inumbo-ID: 28c09018-9702-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674027104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLfi7g2GBcYzwP9pKAdtS4hulT20e64IYvVfC/iPhts=;
	b=joaefor6cWtaqHSJJmwno/9gK+OaFS90DmFHXtiKItoylqHm/AO2xhENHOx/ATMe8kCVc1
	/fcPD/kxvTO2Rsd6KfzIlrgE8Wbff2hUaFrosbRHg/h6tSiF2l8Zww6yXtwG2VwG7Sgo6z
	R5caZgnTlS1AFzsi12hsUw1GAW+6BHE=
Message-ID: <94ab0683-e4b4-31cc-205b-2039860a4c70@suse.com>
Date: Wed, 18 Jan 2023 08:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 07/17] tools/xenstore: change per-domain node
 accounting interface
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-8-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230117091124.22170-8-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UjMhXtf085jp4tlbK4Mv2Npr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UjMhXtf085jp4tlbK4Mv2Npr
Content-Type: multipart/mixed; boundary="------------EilRpdFovX1MaHaT78vpus7w";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <94ab0683-e4b4-31cc-205b-2039860a4c70@suse.com>
Subject: Re: [PATCH v3 07/17] tools/xenstore: change per-domain node
 accounting interface
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-8-jgross@suse.com>
In-Reply-To: <20230117091124.22170-8-jgross@suse.com>

--------------EilRpdFovX1MaHaT78vpus7w
Content-Type: multipart/mixed; boundary="------------MJ3IJudYGviZTPS8aIIpoGR9"

--------------MJ3IJudYGviZTPS8aIIpoGR9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMTA6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFJld29yayB0aGUg
aW50ZXJmYWNlIGFuZCB0aGUgaW50ZXJuYWxzIG9mIHRoZSBwZXItZG9tYWluIG5vZGUNCj4g
YWNjb3VudGluZzoNCj4gDQo+IC0gcmVuYW1lIHRoZSBmdW5jdGlvbnMgdG8gZG9tYWluX25i
ZW50cnlfKigpIGluIG9yZGVyIHRvIGJldHRlciBtYXRjaA0KPiAgICB0aGUgcmVsYXRlZCBj
b3VudGVyIG5hbWUNCj4gDQo+IC0gc3dpdGNoIGZyb20gbm9kZSBwb2ludGVyIHRvIGRvbWlk
IGFzIGludGVyZmFjZSwgYXMgYWxsIG5vZGVzIGhhdmUgdGhlDQo+ICAgIG93bmVyIGZpbGxl
ZCBpbg0KPiANCj4gLSB1c2UgYSBjb21tb24gaW50ZXJuYWwgZnVuY3Rpb24gZm9yIGFkZGlu
ZyBhIHZhbHVlIHRvIHRoZSBjb3VudGVyDQo+IA0KPiBGb3IgdGhlIHRyYW5zYWN0aW9uIGNh
c2UgYWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGdldCB0aGUgbGlzdCBoZWFkDQo+IG9mIHRo
ZSBwZXItdHJhbnNhY3Rpb24gY2hhbmdlZCBkb21haW5zLCBlbmFibGluZyB0byBlbGltaW5h
dGUgdGhlDQo+IHRyYW5zYWN0aW9uX2VudHJ5XyooKSBmdW5jdGlvbnMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0tLQ0KPiBW
MzoNCj4gLSBhZGQgZ2V0X25vZGVfb3duZXIoKSAoSnVsaWVuIEdyYWxsKQ0KPiAtIHJlbmFt
ZSBkb21haW5fbmJlbnRyeV9hZGQoKSBwYXJhbWV0ZXIgKEp1bGllbiBHcmFsbCkNCj4gLSBh
dm9pZCBuZWdhdGl2ZSBlbnRyeSBjb3VudCAoSnVsaWVuIEdyYWxsKQ0KPiAtLS0NCj4gICB0
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jICAgICAgICB8ICAzMyArKysrLS0tDQo+
ICAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jICAgICAgfCAxMjYgKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21h
aW4uaCAgICAgIHwgIDEwICstDQo+ICAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3RyYW5z
YWN0aW9uLmMgfCAgMTUgKy0tDQo+ICAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3RyYW5z
YWN0aW9uLmggfCAgIDcgKy0NCj4gICA1IGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMo
KyksIDEwNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0K
PiBpbmRleCBmYjQzNzllNjdjLi41NjFmYjEyMWQzIDEwMDY0NA0KPiAtLS0gYS90b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9jb3JlLmMNCj4gQEAgLTcwMCw2ICs3MDAsMTEgQEAgaW50IGRvX3RkYl9kZWxldGUo
c3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIFREQl9EQVRBICprZXksDQo+ICAgCXJldHVybiAw
Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgZ2V0X25vZGVfb3duZXIo
Y29uc3Qgc3RydWN0IG5vZGUgKm5vZGUpDQo+ICt7DQo+ICsJcmV0dXJuIG5vZGUtPnBlcm1z
LnBbMF0uaWQ7DQo+ICt9DQoNCkkgaGF2ZSBtb3ZlZCB0aGlzIGhlbHBlciBhcyBpbmxpbmUg
ZnVuY3Rpb24gdG8geGVuc3RvcmVkX2NvcmUuaCBub3csDQphcyBpdCB3aWxsIGJlIG5lZWRl
ZCBpbiB4ZW5zdG9yZWRfZG9tYWluLmMsIHRvby4NCg0KDQpKdWVyZ2VuDQo=
--------------MJ3IJudYGviZTPS8aIIpoGR9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------MJ3IJudYGviZTPS8aIIpoGR9--

--------------EilRpdFovX1MaHaT78vpus7w--

--------------UjMhXtf085jp4tlbK4Mv2Npr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPHoF8FAwAAAAAACgkQsN6d1ii/Ey+A
iQgAkzA0zIneKhjrgRMR5+o18odVYlEUTRltA4KgWwKsL5lea57yDxCzZwXJdUHD0ev0956a0Jxw
z2TMgLMZrhbnUMegqlrfFqdtHrC4rolf0cI9i/DK7bsn9Bb1JIZDHj3gGOnUwhhrqmRgv32zeLfX
5K3G1qMdHnKCfkJgp9YVr2Hp2/JYcEABfpa+FgVwJ4VM4YsLaucik5uuCZb6roSo08duu5Zhn7Lb
G+2iT7354J7c49JdkQjJUjOqT0a6Z1yXKFbjulIpmtHs9/4IwK6Oi5zt3iSnkwVFRxGD0/SIjyBg
Ke1I8gDx/YCFIVAGaw+UHlwT2RLoNaMv97h+c13LfA==
=QGvO
-----END PGP SIGNATURE-----

--------------UjMhXtf085jp4tlbK4Mv2Npr--

