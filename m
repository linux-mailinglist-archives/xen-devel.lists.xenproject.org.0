Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813104E625B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 12:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294245.500225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXLVM-0007V7-UZ; Thu, 24 Mar 2022 11:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294245.500225; Thu, 24 Mar 2022 11:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXLVM-0007TK-RW; Thu, 24 Mar 2022 11:19:48 +0000
Received: by outflank-mailman (input) for mailman id 294245;
 Thu, 24 Mar 2022 11:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+IHq=UD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXLVL-0007TE-8A
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 11:19:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f60b987-ab64-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 12:19:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1C491F38D;
 Thu, 24 Mar 2022 11:19:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62D1012FF7;
 Thu, 24 Mar 2022 11:19:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PIqbFtFTPGIzMgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Mar 2022 11:19:45 +0000
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
X-Inumbo-ID: 4f60b987-ab64-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648120785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OyeL1W/oDX7IwtYkxlM5s6yxrIAm3hiMKl80lJzfsjo=;
	b=D439oqcHkMYS7aMQ+R0EQH7Mq1FSlqYt57ZRjIhDOIiPEUgDTkpg/oJULUd+HBpCV/9xt0
	U9eXVvBWRt28TfatDS8jrxzav+hCe5iA+Rd7nF36Pr5eXBqjJT33BeebtA9vCrD5qLz5Pk
	v+YFAlreZN7AFgWnbhpItxUjz2yWFzk=
Message-ID: <84010992-34ed-3e40-f70d-da91cbb0d210@suse.com>
Date: Thu, 24 Mar 2022 12:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 03/10] xen: harmonize return types of hypercall
 handlers
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20220324081312.18222-1-jgross@suse.com>
 <20220324081312.18222-4-jgross@suse.com>
 <c53e65d5-82fa-2cbd-c49e-94a3935c2b7e@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c53e65d5-82fa-2cbd-c49e-94a3935c2b7e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mqeXIAXwUek10H4KIooUufBb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mqeXIAXwUek10H4KIooUufBb
Content-Type: multipart/mixed; boundary="------------9VQ7kNr89GeI65FQwx5qnjtv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <84010992-34ed-3e40-f70d-da91cbb0d210@suse.com>
Subject: Re: [PATCH v5 03/10] xen: harmonize return types of hypercall
 handlers
References: <20220324081312.18222-1-jgross@suse.com>
 <20220324081312.18222-4-jgross@suse.com>
 <c53e65d5-82fa-2cbd-c49e-94a3935c2b7e@suse.com>
In-Reply-To: <c53e65d5-82fa-2cbd-c49e-94a3935c2b7e@suse.com>

--------------9VQ7kNr89GeI65FQwx5qnjtv
Content-Type: multipart/mixed; boundary="------------MBy3FpnTgMXZGFT1ICiB72aM"

--------------MBy3FpnTgMXZGFT1ICiB72aM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjIgMTE6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wMy4yMDIy
IDA5OjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgbW9zdCBoeXBlcmNhbGwg
aGFuZGxlcnMgaGF2ZSBhIHJldHVybiB0eXBlIG9mIGxvbmcsIHdoaWxlIHRoZQ0KPj4gLS0t
IGEveGVuL2FyY2gveDg2L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwuYw0KPj4gKysrIGIv
eGVuL2FyY2gveDg2L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwuYw0KPj4gQEAgLTQsNiAr
NCw3IEBADQo+PiAgIA0KPj4gICBFTUlUX0ZJTEU7DQo+PiAgIA0KPj4gKyNpbmNsdWRlIDx4
ZW4vaHlwZXJjYWxsLmg+DQo+PiAgICNpbmNsdWRlIDx4ZW4vbGliLmg+DQo+PiAgICNpbmNs
dWRlIDxjb21wYXQvcGxhdGZvcm0uaD4NCj4+ICAgI2luY2x1ZGUgPHhlbi9oeXBlcmNhbGwu
aD4NCg0KVGhpcyBzZWVtcyB0byBiZSBhbiBhcnRpZmFjdCBvZiB0aGUgcmViYXNlIGRvbmUg
aW4gVjQgb2YgdGhlIHNlcmllcywgd2hpY2gNCndhcyBuZWNlc3NhcnkgYXMgQW5kcmV3J3Mg
bGFyZ2Ugc2VyaWVzIHVzZWQgdHdvIHBhdGNoZXMgb2YgbXkgVjMgc2VyaWVzLg0KDQpEbyB5
b3Ugd2FudCBtZSB0byByZXNlbmQgd2l0aG91dCB0aGlzIGh1bms/DQoNCg0KSnVlcmdlbg0K

--------------MBy3FpnTgMXZGFT1ICiB72aM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------MBy3FpnTgMXZGFT1ICiB72aM--

--------------9VQ7kNr89GeI65FQwx5qnjtv--

--------------mqeXIAXwUek10H4KIooUufBb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI8U9AFAwAAAAAACgkQsN6d1ii/Ey9g
Jwf/VANbhbM2IfP9Iv25g4ZMCjcRIBBRbFB/QO7lnKbzoQVcZUFKCdLrQYWeoy+364cj1apEX52k
WgDq8U5ZTQ0bDKXrgbc9e999JZPPttb4BPnGbm+c1EkYbwCDc84TAMJg3dNBpDJDGb8Eib1rQgnS
BhPs4uwQyQh0LRKOyuyMiIEDQYSwE7yB5wENscPxLnVqMp01NjBt8WG/4y8gOKLuJRZibYLvFIoD
dsVjUPsBDIfSSF5SmZFMQG3Sua4TEduSYLy3PdXJEDpRZkr7AdzLGIzBe5S2aBWEFWJbvYzVZDS1
/hejhmlC3Dzmq6oDTvdyBsk6vDuQ+xfSpmtJyWLV6A==
=HABl
-----END PGP SIGNATURE-----

--------------mqeXIAXwUek10H4KIooUufBb--

