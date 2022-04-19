Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2150679F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307926.523326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk4H-0005Ct-Dv; Tue, 19 Apr 2022 09:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307926.523326; Tue, 19 Apr 2022 09:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk4H-0005Ag-9U; Tue, 19 Apr 2022 09:22:41 +0000
Received: by outflank-mailman (input) for mailman id 307926;
 Tue, 19 Apr 2022 09:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngk4F-0005AX-H8
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:22:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 415a303e-bfc2-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 11:22:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF31A210FD;
 Tue, 19 Apr 2022 09:22:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4E3E132E7;
 Tue, 19 Apr 2022 09:22:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nvPsJl1/XmKqDQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 09:22:37 +0000
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
X-Inumbo-ID: 415a303e-bfc2-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650360157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oT6cpzs5kAcRX8N26eYbViBKolb/NleOVQ5LSfBVkSI=;
	b=j4MQ4dvfTn/DzvFj7P9jfEXb0LXbXvbxjnOJsHJFgoW9uDDI9kZYXANYjiIUMY3zDbftFZ
	mMU6icUYhiHVaISCdl6YyK8XunRR4dhzklf5hwGA2PSxRRy3f71sCWEZ13j8kwA4wbRdU0
	7ogtMg5A9lg2noLBolb6nidgHLDkOIg=
Message-ID: <eae4f0db-0dbf-44fe-fa37-74aeaa6bc04a@suse.com>
Date: Tue, 19 Apr 2022 11:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>, xen-devel@lists.xenproject.org
References: <20220416133158.16162-1-jgross@suse.com>
 <fb19f5ac-b8e9-7cdb-4f72-71b73e6f4b8e@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <fb19f5ac-b8e9-7cdb-4f72-71b73e6f4b8e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ssjmJhrXMdlGSHlz2ng25N6z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ssjmJhrXMdlGSHlz2ng25N6z
Content-Type: multipart/mixed; boundary="------------0gJ8Civc5B8EBwA0mADfFzns";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <eae4f0db-0dbf-44fe-fa37-74aeaa6bc04a@suse.com>
Subject: Re: [PATCH] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
References: <20220416133158.16162-1-jgross@suse.com>
 <fb19f5ac-b8e9-7cdb-4f72-71b73e6f4b8e@suse.com>
In-Reply-To: <fb19f5ac-b8e9-7cdb-4f72-71b73e6f4b8e@suse.com>

--------------0gJ8Civc5B8EBwA0mADfFzns
Content-Type: multipart/mixed; boundary="------------lp8vsfq0ve3DIdInHpKGdujA"

--------------lp8vsfq0ve3DIdInHpKGdujA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDQuMjIgMTA6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wNC4yMDIy
IDE1OjMxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9kb21j
dGwuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYw0KPj4gQEAgLTMwOCw3ICszMDgs
OSBAQCBsb25nIGNmX2NoZWNrIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhl
bl9kb21jdGxfdCkgdV9kb21jdGwpDQo+PiAgICAgICAgICAgaWYgKCBvcC0+ZG9tYWluID09
IERPTUlEX0lOVkFMSUQgKQ0KPj4gICAgICAgICAgIHsNCj4+ICAgICAgIGNhc2UgWEVOX0RP
TUNUTF9jcmVhdGVkb21haW46DQo+PiArI2lmZGVmIENPTkZJR19HREJTWA0KPj4gICAgICAg
Y2FzZSBYRU5fRE9NQ1RMX2dkYnN4X2d1ZXN0bWVtaW86DQo+PiArI2VuZGlmDQo+PiAgICAg
ICAgICAgICAgIGQgPSBOVUxMOw0KPj4gICAgICAgICAgICAgICBicmVhazsNCj4+ICAgICAg
ICAgICB9DQo+IA0KPiBXb3VsZG4ndCB3ZSBiZSBiZXR0ZXIgb2ZmIHNpbXBseSBkZWxldGlu
ZyB0aGlzIGNhc2UgbGFiZWw/IGRiZ19yd19tZW0oKQ0KPiByZXNvbHZlcyB0aGUgZG9taWQg
YW55d2F5IChleGFjdGx5IGFzIGRvbmUgYSBmZXcgbGluZXMgZG93biBmcm9tIGhlcmUpLA0K
PiBzbyBJIGRvbid0IHNlZSB3aHkgd2UgY291bGRuJ3QgcGFzcyBhIHN0cnVjdCBkb21haW4g
KiB0aGVyZSBpbnN0ZWFkIG9mDQo+IGEgZG9taWRfdC4NCg0KU2VlbXMgbGlrZSBhIGdvb2Qg
aWRlYS4NCg0KV2lsbCBzZW5kIFYyLg0KDQo+IFRoaXMgd291bGQgYWxzbyByZWR1Y2UgdGhl
IHJpc2sgb2YgZnVydGhlciBzaW1pbGFyICJvdmVycmlkZXMiIGFwcGVhcmluZw0KPiBoZXJl
ICh0YWtpbmcgZXhpc3RpbmcgaW5zdGFuY2VzIGFzICJleGN1c2UiKSwgYW5kIGJyZWFraW5n
IHRoaW5ncyBhZ2Fpbg0KPiBpbiBhIHNpbWlsYXIgd2F5Lg0KPiANCj4gQW5kIGZpbmFsbHkg
SSB0aGluayBpb21tdV9kb19kb21jdGwoKSBuZWVkcyBtYWtpbmcgcmVzaWxpZW50IGFnYWlu
c3QgZA0KPiBjb21pbmcgaW4gYXMgTlVMTC4gVGhpcyBpc24ndCBqdXN0IHRvIGNvdmVyIHRo
ZSBpc3N1ZSBoZXJlLCBidXQgcGVyaGFwcw0KPiBtb3JlIGltcG9ydGFudGx5IGJlY2F1c2Ug
WEVOX0RPTUNUTF90ZXN0X2Fzc2lnbl9kZXZpY2UgY2FuIGxlZ2l0aW1hdGVseQ0KPiBlbmQg
dXAgaGF2aW5nIE5VTEwgcGFzc2VkIGhlcmUgKHdoZW4gdGhlIGNhbGxlciBwYXNzZWQgRE9N
SURfSU5WQUxJRCkuDQo+IFdlJ3ZlIHNpbXBseSBiZWVuIGx1Y2t5IHRoYXQgbGlieGwgZG9l
c24ndCB1c2UgdGhpcyB2YXJpYW50IG9mIGNhbGxpbmcNCj4gdGhpcyBkb21jdGwuIEkgZ3Vl
c3Mgd2hlbiBkIGlzIE5VTEwgd2Ugb3VnaHQgdG8gY2hlY2sgdGhlIGdsb2JhbCBmbGFnDQo+
IHRoZXJlIHJhdGhlciB0aGFuIHRoZSBwZXItZG9tYWluIG9uZS4NCg0KSSB0aGluayB0aGlz
IHNob3VsZCBiZSBhbm90aGVyIHBhdGNoLCB0aG91Z2guDQoNCg0KSnVlcmdlbg0K
--------------lp8vsfq0ve3DIdInHpKGdujA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------lp8vsfq0ve3DIdInHpKGdujA--

--------------0gJ8Civc5B8EBwA0mADfFzns--

--------------ssjmJhrXMdlGSHlz2ng25N6z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJef10FAwAAAAAACgkQsN6d1ii/Ey+6
Agf+O4nuRx02TJ4BtAprYpFEIl5VgYoSh+eiJPLT8mo/ISGTqS39WTXskmEstp+sFh6oPHldKVzY
6lhw8qWA2wdb+Flqfl3ysUjLyjq4ESb4AgearE34DeHoYta2UssncyVkwjnY8kAhHdC2P+KVOSDF
+Fm3qFRQq3vvGLeqh+E58I1gy3ySgFwKxb6UhYRuM10ukubUu+BINt/ebANUTRI3/4OtIJjhafZV
USCO+lJjMrkkMURoXw7wGBmFYXfGS/k+9n5jLddb4L2s2oUZj63XiH/DEnQjPD1TgM72UtUrjg3W
GfIMpRgvsKftmAGRE1bbQ9B61CTt3BUP5Nxtxf8NSQ==
=eXTq
-----END PGP SIGNATURE-----

--------------ssjmJhrXMdlGSHlz2ng25N6z--

