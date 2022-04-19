Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79FC507227
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308342.524050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq9I-0000uW-E3; Tue, 19 Apr 2022 15:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308342.524050; Tue, 19 Apr 2022 15:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq9I-0000sa-9J; Tue, 19 Apr 2022 15:52:16 +0000
Received: by outflank-mailman (input) for mailman id 308342;
 Tue, 19 Apr 2022 15:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngq9H-0000Lk-4j
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:52:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae692991-bff8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 17:52:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C7D5221118;
 Tue, 19 Apr 2022 15:52:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A721C139BE;
 Tue, 19 Apr 2022 15:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1IanJ63aXmJARAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 15:52:13 +0000
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
X-Inumbo-ID: ae692991-bff8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650383533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rtr7Hvd3Cy9exIqtS2n2EwunDKE/wU9yRJBm1EAYCFg=;
	b=noN9ej1o1SmnZgE9uJSyD53ecvWiI0OUKk+RRnwGyBoLOAJkAxBz1dLJF4FQWw/AfwL7T2
	lVI2z5O3ZvWm4Y3c8HMXfpQlbskdIQ5OoCuJt6NCCWkYAMykBFy855r0Z0/acNm61VrgQa
	UPKT//Y6wl1WyEiXRsyO3CxksuDNb/E=
Message-ID: <bd446b5b-49ea-3d6f-6792-7d785586ea69@suse.com>
Date: Tue, 19 Apr 2022 17:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9fVKk5cVDzapF4T0gupMQ28S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9fVKk5cVDzapF4T0gupMQ28S
Content-Type: multipart/mixed; boundary="------------gPf1bZNqDMTtK7Itj10UpTaM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>
Message-ID: <bd446b5b-49ea-3d6f-6792-7d785586ea69@suse.com>
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>
In-Reply-To: <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>

--------------gPf1bZNqDMTtK7Itj10UpTaM
Content-Type: multipart/mixed; boundary="------------g0Wtpe4qxRR82tl2KLkh9wtl"

--------------g0Wtpe4qxRR82tl2KLkh9wtl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDQuMjIgMTc6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE5LzA0LzIw
MjIgMTA6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gQmVzaWRlcyB0aGUgcmVwb3J0ZXIn
cyBpc3N1ZSBvZiBoaXR0aW5nIGEgTlVMTCBkZXJlZiB3aGVuICFDT05GSUdfR0RCU1gsDQo+
PiBYRU5fRE9NQ1RMX3Rlc3RfYXNzaWduX2RldmljZSBjYW4gbGVnaXRpbWF0ZWx5IGVuZCB1
cCBoYXZpbmcgTlVMTCBwYXNzZWQNCj4+IGhlcmUsIHdoZW4gdGhlIGRvbWN0bCB3YXMgcGFz
c2VkIERPTUlEX0lOVkFMSUQuDQo+Pg0KPj4gRml4ZXM6IDcxZTYxN2E2YjhmNiAoInVzZSBp
c19pb21tdV9lbmFibGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4iKQ0KPj4gUmVwb3J0ZWQt
Ynk6IENoZXllbm5lIFdpbGxzIDxjaGV5ZW5uZS53aWxsc0BnbWFpbC5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pg0KPj4gLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPj4gQEAgLTU1OCw3ICs1NTgsNyBAQCBpbnQgaW9t
bXVfZG9fZG9tY3RsKA0KPj4gICB7DQo+PiAgICAgICBpbnQgcmV0ID0gLUVOT0RFVjsNCj4+
ICAgDQo+PiAtICAgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQ0KPj4gKyAgICBpZiAo
ICEoZCA/IGlzX2lvbW11X2VuYWJsZWQoZCkgOiBpb21tdV9lbmFibGVkKSApDQo+PiAgICAg
ICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiANCj4gSGF2aW5nIHNwZW50IHRoZSBiZXR0
ZXIgcGFydCBvZiBhIGRheSBkZWJ1Z2dpbmcgdGhpcyBtZXNzLCB0aGlzIHBhdGNoIGlzDQo+
IHBsYWluIGJyb2tlbi4NCj4gDQo+IEl0IGRlcGVuZHMgb24gSnVlcmdlbidzICJ4ZW4vaW9t
bXU6IGNsZWFudXAgaW9tbXUgcmVsYXRlZCBkb21jdGwNCj4gaGFuZGxpbmciIHBhdGNoLCBi
ZWNhdXNlIG90aGVyd2lzZSBpdCBlcnJvbmVvdXNseSBmYWlscyBub24tSU9NTVUgc3Vib3Bz
Lg0KDQpXaGljaCBpcyBub3QgYSByZWFsIHByb2JsZW0sIGFzIGl0IGlzIGJlaW5nIGNhbGxl
ZCBhZnRlciBhbGwgb3RoZXINCnN1Ym9wcyBkaWRuJ3QgbWF0Y2guIE9yIHdpdGggbXkgM3Jk
IHBhdGNoIGFwcGxpZWQgaXQgaXMgY2FsbGVkIG9ubHkNCmZvciBJT01NVSBzdWJvcHMuDQoN
Cg0KSnVlcmdlbg0K
--------------g0Wtpe4qxRR82tl2KLkh9wtl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------g0Wtpe4qxRR82tl2KLkh9wtl--

--------------gPf1bZNqDMTtK7Itj10UpTaM--

--------------9fVKk5cVDzapF4T0gupMQ28S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJe2q0FAwAAAAAACgkQsN6d1ii/Ey9Z
uwf/R9J4bS+cn8R80bVukp3KHXR7QBlbEghuBu+ncf6z039dgSi9J2Qgj9JMp/eL3GQqyn1+kDBY
GsaAZ7WRLVbwNXUkUttsAgAMiV6IwlAAUnzUW6fd10R9PWFyE+uxbxX5VoL7Xm8aywsQQuxFIF9I
17h+XwiQdbg4PE+Glghe3DAz3LSh+3awM+TiuLgLlcRPnv7LGHgLDQJzotIAqWZxnVJWlSGOZya9
281GSyoh0k+cui+WXBKa3RhftV96xZCEMQwEGqxaNOL23LwbH7AvmnMPAsF3P1txxRIZz/ytNjVi
CSxRXFbXbBClYXg5dmBPWUOYgtw8VcX1qN6+osv6/Q==
=Pqnk
-----END PGP SIGNATURE-----

--------------9fVKk5cVDzapF4T0gupMQ28S--

