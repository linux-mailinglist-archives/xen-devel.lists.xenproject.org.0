Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78076557651
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354661.581883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ip6-0007vd-W9; Thu, 23 Jun 2022 09:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354661.581883; Thu, 23 Jun 2022 09:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ip6-0007sO-SW; Thu, 23 Jun 2022 09:08:24 +0000
Received: by outflank-mailman (input) for mailman id 354661;
 Thu, 23 Jun 2022 09:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4Ip6-0007sI-4h
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:08:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 084cc2e8-f2d4-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 11:08:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6AF331FD72;
 Thu, 23 Jun 2022 09:08:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3336D13461;
 Thu, 23 Jun 2022 09:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vxIiC4YttGLoGwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 09:08:22 +0000
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
X-Inumbo-ID: 084cc2e8-f2d4-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655975302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=saX0XxYWwqZKGK2Qs5FJNAlGmzJJFeE6nTYl6t3TRZI=;
	b=Yo+lWOmai3ek8i98JprgFxqZfh43QI+6PiXPK8O2K9LlTjU73jB906azIP/UA5cDJ0IsjM
	7vQ4URnq5fkiCqjv1tIgaA49JIzx1iQRfXVpPgnkZvi+7F1cknwRqMKoI6nctntdiDuQZu
	Hz681ouaWzUlK0vWWfScL7T1uEzPtjU=
Message-ID: <50942106-0082-e86b-8a2c-b04aaafac444@suse.com>
Date: Thu, 23 Jun 2022 11:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] xen: consider alloc-only segments when loading PV dom0
 kernel
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220623080208.2214-1-jgross@suse.com>
 <c5961627-1719-dd54-bbcf-c08a826ba14d@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c5961627-1719-dd54-bbcf-c08a826ba14d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YelCvZP46NNe4HUO0DvZ1EQh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YelCvZP46NNe4HUO0DvZ1EQh
Content-Type: multipart/mixed; boundary="------------i0YvJ6vbkw0B0PpgA60zkOmo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <50942106-0082-e86b-8a2c-b04aaafac444@suse.com>
Subject: Re: [PATCH] xen: consider alloc-only segments when loading PV dom0
 kernel
References: <20220623080208.2214-1-jgross@suse.com>
 <c5961627-1719-dd54-bbcf-c08a826ba14d@suse.com>
In-Reply-To: <c5961627-1719-dd54-bbcf-c08a826ba14d@suse.com>

--------------i0YvJ6vbkw0B0PpgA60zkOmo
Content-Type: multipart/mixed; boundary="------------JpQED6vh5kLQ3WdDvgXr1l5O"

--------------JpQED6vh5kLQ3WdDvgXr1l5O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMTE6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNi4yMDIy
IDEwOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBsb2FkaW5nIHRoZSBkb20w
IGtlcm5lbCBmb3IgUFYgbW9kZSwgdGhlIGZpcnN0IGZyZWUgdXNhYmxlIG1lbW9yeQ0KPj4g
bG9jYXRpb24gYWZ0ZXIgdGhlIGtlcm5lbCBuZWVkcyB0byB0YWtlIHNlZ21lbnRzIGludG8g
YWNjb3VudCwgd2hpY2gNCj4+IGhhdmUgb25seSB0aGUgQUxMT0MgZmxhZyBzZXQsIGJ1dCBh
cmUgbm90IHNwZWNpZmllZCB0byBiZSBsb2FkZWQgaW4NCj4+IHRoZSBwcm9ncmFtIGhlYWRl
cnMgb2YgdGhlIEVMRiBmaWxlLg0KPj4NCj4+IFRoaXMgaXMgZS5nLiBhIHByb2JsZW0gZm9y
IExpbnV4IGtlcm5lbHMgZnJvbSA1LjE5IG9ud2FyZHMsIGFzIHRob3NlDQo+PiBjYW4gaGF2
ZSBhIGZpbmFsIE5PTE9BRCBzZWN0aW9uIGF0IHRoZSBlbmQsIHdoaWNoIG11c3Qgbm90IGJl
IHVzZWQgYnkNCj4+IGUuZy4gdGhlIHN0YXJ0X2luZm8gc3RydWN0dXJlIG9yIHRoZSBpbml0
aWFsIHBhZ2UgdGFibGVzIGFsbG9jYXRlZCBieQ0KPj4gdGhlIGh5cGVydmlzb3IuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4g
LS0tDQo+PiAgIHhlbi9jb21tb24vbGliZWxmL2xpYmVsZi1sb2FkZXIuYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMzIGlu
c2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saWJlbGYvbGli
ZWxmLWxvYWRlci5jIGIveGVuL2NvbW1vbi9saWJlbGYvbGliZWxmLWxvYWRlci5jDQo+PiBp
bmRleCA2MjljYzBkM2U2Li40YjBlM2NlZDU1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1v
bi9saWJlbGYvbGliZWxmLWxvYWRlci5jDQo+PiArKysgYi94ZW4vY29tbW9uL2xpYmVsZi9s
aWJlbGYtbG9hZGVyLmMNCj4+IEBAIC00NjcsNyArNDY3LDkgQEAgZG8geyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+PiAgIHZvaWQgZWxmX3BhcnNlX2JpbmFyeShzdHJ1Y3QgZWxmX2JpbmFyeSAqZWxmKQ0K
Pj4gICB7DQo+PiAgICAgICBFTEZfSEFORExFX0RFQ0woZWxmX3BoZHIpIHBoZHI7DQo+PiAr
ICAgIEVMRl9IQU5ETEVfREVDTChlbGZfc2hkcikgc2hkcjsNCj4+ICAgICAgIHVpbnQ2NF90
IGxvdyA9IC0xLCBoaWdoID0gMCwgcGFkZHIsIG1lbXN6Ow0KPj4gKyAgICB1aW50NjRfdCB2
bG93ID0gLTEsIHZoaWdoID0gMCwgdmFkZHIsIHZvZmY7DQo+PiAgICAgICB1bnNpZ25lZCBp
LCBjb3VudDsNCj4+ICAgDQo+PiAgICAgICBjb3VudCA9IGVsZl9waGRyX2NvdW50KGVsZik7
DQo+PiBAQCAtNDgwLDYgKzQ4Miw3IEBAIHZvaWQgZWxmX3BhcnNlX2JpbmFyeShzdHJ1Y3Qg
ZWxmX2JpbmFyeSAqZWxmKQ0KPj4gICAgICAgICAgIGlmICggIWVsZl9waGRyX2lzX2xvYWRh
YmxlKGVsZiwgcGhkcikgKQ0KPj4gICAgICAgICAgICAgICBjb250aW51ZTsNCj4+ICAgICAg
ICAgICBwYWRkciA9IGVsZl91dmFsKGVsZiwgcGhkciwgcF9wYWRkcik7DQo+PiArICAgICAg
ICB2YWRkciA9IGVsZl91dmFsKGVsZiwgcGhkciwgcF92YWRkcik7DQo+PiAgICAgICAgICAg
bWVtc3ogPSBlbGZfdXZhbChlbGYsIHBoZHIsIHBfbWVtc3opOw0KPj4gICAgICAgICAgIGVs
Zl9tc2coZWxmLCAiRUxGOiBwaGRyOiBwYWRkcj0lIyIgUFJJeDY0ICIgbWVtc3o9JSMiIFBS
SXg2NCAiXG4iLA0KPj4gICAgICAgICAgICAgICAgICAgcGFkZHIsIG1lbXN6KTsNCj4+IEBA
IC00ODcsNyArNDkwLDM3IEBAIHZvaWQgZWxmX3BhcnNlX2JpbmFyeShzdHJ1Y3QgZWxmX2Jp
bmFyeSAqZWxmKQ0KPj4gICAgICAgICAgICAgICBsb3cgPSBwYWRkcjsNCj4+ICAgICAgICAg
ICBpZiAoIGhpZ2ggPCBwYWRkciArIG1lbXN6ICkNCj4+ICAgICAgICAgICAgICAgaGlnaCA9
IHBhZGRyICsgbWVtc3o7DQo+PiArICAgICAgICBpZiAoIHZsb3cgPiB2YWRkciApDQo+PiAr
ICAgICAgICAgICAgdmxvdyA9IHZhZGRyOw0KPj4gKyAgICAgICAgaWYgKCB2aGlnaCA8IHZh
ZGRyICsgbWVtc3ogKQ0KPj4gKyAgICAgICAgICAgIHZoaWdoID0gdmFkZHIgKyBtZW1zejsN
Cj4+ICAgICAgIH0NCj4+ICsNCj4+ICsgICAgdm9mZiA9IHZoaWdoIC0gaGlnaDsNCj4+ICsN
Cj4+ICsgICAgY291bnQgPSBlbGZfc2hkcl9jb3VudChlbGYpOw0KPj4gKyAgICBmb3IgKCBp
ID0gMDsgaSA8IGNvdW50OyBpKysgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBzaGRyID0g
ZWxmX3NoZHJfYnlfaW5kZXgoZWxmLCBpKTsNCj4+ICsgICAgICAgIGlmICggIWVsZl9hY2Nl
c3Nfb2soZWxmLCBFTEZfSEFORExFX1BUUlZBTChzaGRyKSwgMSkgKQ0KPj4gKyAgICAgICAg
ICAgIC8qIGlucHV0IGhhcyBhbiBpbnNhbmUgc2VjdGlvbiBoZWFkZXIgY291bnQgZmllbGQg
Ki8NCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIGlmICggIShlbGZfdXZh
bChlbGYsIHNoZHIsIHNoX2ZsYWdzKSAmIFNIRl9BTExPQykgKQ0KPj4gKyAgICAgICAgICAg
IGNvbnRpbnVlOw0KPj4gKyAgICAgICAgdmFkZHIgPSBlbGZfdXZhbChlbGYsIHNoZHIsIHNo
X2FkZHIpOw0KPj4gKyAgICAgICAgbWVtc3ogPSBlbGZfdXZhbChlbGYsIHNoZHIsIHNoX3Np
emUpOw0KPj4gKyAgICAgICAgaWYgKCB2bG93ID4gdmFkZHIgKQ0KPj4gKyAgICAgICAgew0K
Pj4gKyAgICAgICAgICAgIHZsb3cgPSB2YWRkcjsNCj4+ICsgICAgICAgICAgICBsb3cgPSB2
YWRkciAtIHZvZmY7DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBpZiAoIHZoaWdoIDwg
dmFkZHIgKyBtZW1zeiApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgdmhpZ2gg
PSB2YWRkciArIG1lbXN6Ow0KPj4gKyAgICAgICAgICAgIGhpZ2ggPSB2YWRkciArIG1lbXN6
IC0gdm9mZjsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPiANCj4gQXMgc2FpZCBpbiB0
aGUgcmVwbHkgdG8geW91ciBwcm9ibGVtIHJlcG9ydDogVGhlIHNldCBvZiBQSERScyBkb2Vz
bid0DQo+IGNvdmVyIGFsbCBzZWN0aW9ucy4gRm9yIGxvYWRpbmcgb25lIHNob3VsZCBuZXZl
ciBuZWVkIHRvIHJlc29ydCB0bw0KPiBwYXJzaW5nIHNlY3Rpb24gaGVhZGVycyAtIGluIGEg
bG9hZGFibGUgYmluYXJ5IGl0IGlzIG5vIGVycm9yIGlmDQo+IHRoZXJlJ3Mgbm8gc2VjdGlv
biB0YWJsZSBpbiB0aGUgZmlyc3QgcGxhY2UuIChUaGUgdGl0bGUgaXMgYWxzbw0KDQpUaGUg
cHJvYmxlbSBpc24ndCB0aGUgbG9hZGluZywgYnV0IHRoZSBtZW1vcnkgdXNhZ2UgYWZ0ZXIg
ZG9pbmcgdGhlDQpsb2FkaW5nLiBUaGUgaHlwZXJ2aXNvciBpcyBwbGFjaW5nIHBhZ2UgdGFi
bGVzIGluIGEgbWVtb3J5IHJlZ2lvbg0KdGhlIGtlcm5lbCBoYXMgb3RoZXIgcGxhbnMgd2l0
aC4NCg0KPiBtaXNsZWFkaW5nLCBhcyB5b3UgcmVhbGx5IG1lYW4gc2VjdGlvbnMgdGhlcmUs
IG5vdCBzZWdtZW50cy4gQWZhaWsNCj4gdGhlcmUncyBubyBjb25jZXB0IG9mICJhbGxvYyIg
Zm9yIHNlZ21lbnRzLCB3aGljaCBhcmUgd2hhdCBwcm9ncmFtDQo+IGhlYWRlcnMgZGVzY3Jp
YmUuKQ0KDQpTb3JyeSwgd2lsbCByZXdvcmQuDQoNCj4gQWxzbzogTmVlZGluZyB0byBmaXgg
dGhpcyBpbiB0aGUgaHlwZXJ2aXNvciB3b3VsZCBtZWFuIHRoYXQgTGludXgNCj4gNS4xOSBh
bmQgb253YXJkcyBjYW5ub3QgYmUgYm9vdGVkIG9uIFhlbiB3aXRob3V0IHdoaWNoZXZlciBm
aXgNCj4gYmFja3BvcnRlZC4NCg0KQ29ycmVjdC4gU2VlIG15IHJlcGx5IHRvIHRoZSByZXBs
eSB5b3UgbWVudGlvbmVkIGFib3ZlLg0KDQo+IEZpbmFsbHksIHlvdSBjaGFuZ2luZyBsaWJl
bGYgYnV0IHJlZmVycmluZyB0byBvbmx5IERvbTAgaW4gdGhlIHRpdGxlDQo+IGxvb2tzIGlu
Y29uc2lzdGVudCB0byBtZS4NCg0KSG1tLCB5ZXMuIFdpbGwgZHJvcCB0aGUgZG9tMCBhc3Bl
Y3QuDQoNCg0KSnVlcmdlbg0K
--------------JpQED6vh5kLQ3WdDvgXr1l5O
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------JpQED6vh5kLQ3WdDvgXr1l5O--

--------------i0YvJ6vbkw0B0PpgA60zkOmo--

--------------YelCvZP46NNe4HUO0DvZ1EQh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK0LYUFAwAAAAAACgkQsN6d1ii/Ey+h
9gf8Cxqu3wrSOMj0x08fvs4cw9mhUyv2jL/uowxbHt7jVlWWTOAbsS0ZZhhC05yZ7DG65p3+WaIe
ySj6RMUXBPhsZgb4kKugF4exMqzxd4RalXqCkzLyS3QagSfza7LRnCcQuxDICaT5cgY72PM2JBpw
tyhNntHyFX3ZzOrE8nJ0JGQdlKPIsCKNJSNisLxug5OnoErdSyQNK7rxC20hHOF3/+5q28Phnohi
ksifzZ6EdxbNAaL+DVYINj2U0e9pC8sBAQ5Ub+SAzLMpg9JzHly2G6XUHMjQ43lfzlh8g7f8oiID
FB/dK2gGadsr5cu/S4HYSMYLH1inOFCMCtnUu8V/Qw==
=7wXQ
-----END PGP SIGNATURE-----

--------------YelCvZP46NNe4HUO0DvZ1EQh--

