Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFAA55BA9A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 16:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356825.585127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5q4i-000503-S6; Mon, 27 Jun 2022 14:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356825.585127; Mon, 27 Jun 2022 14:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5q4i-0004xO-Ol; Mon, 27 Jun 2022 14:50:52 +0000
Received: by outflank-mailman (input) for mailman id 356825;
 Mon, 27 Jun 2022 14:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5q4g-0004xB-MQ
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 14:50:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86486995-f628-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 16:50:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C98F1F9EB;
 Mon, 27 Jun 2022 14:50:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B2F413AB2;
 Mon, 27 Jun 2022 14:50:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S+ocDcnDuWJ7RQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 14:50:49 +0000
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
X-Inumbo-ID: 86486995-f628-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656341449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVRYvn/FfdZC51N4nTWZyS4mKOShDYlGYcsTxLKihvY=;
	b=s18soCF5C7VuO5ztHer2TDoFAFg/XmaEGkvrZxTzBzn943PJe42/Q6mcLKdIZturZgorn8
	v4QglPjqq5ZD6kC/EwE8ziCUmzvdV0AI9aBRzZAljBNBvNWDHF6bQpGF6+J1Bdm2RSWx+p
	1z69Ec5tqjF7qI0Jj6uOgMnK72kQ5d0=
Message-ID: <f7c0d5c1-01da-4dca-42ac-ce17c6109371@suse.com>
Date: Mon, 27 Jun 2022 16:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should
 always be first in xsd_errors
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-2-julien@xen.org>
 <d0330408-2301-6145-f46b-c3da302a1edb@suse.com>
 <7af3e9ec-59fe-32ce-2a9d-b8dab57d0e9e@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <7af3e9ec-59fe-32ce-2a9d-b8dab57d0e9e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S0Zn0279OSf3ZGozI3PWPxwA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S0Zn0279OSf3ZGozI3PWPxwA
Content-Type: multipart/mixed; boundary="------------YU0EKbw84Hc8q0pvKb6XCjp5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
Message-ID: <f7c0d5c1-01da-4dca-42ac-ce17c6109371@suse.com>
Subject: Re: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should
 always be first in xsd_errors
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-2-julien@xen.org>
 <d0330408-2301-6145-f46b-c3da302a1edb@suse.com>
 <7af3e9ec-59fe-32ce-2a9d-b8dab57d0e9e@xen.org>
In-Reply-To: <7af3e9ec-59fe-32ce-2a9d-b8dab57d0e9e@xen.org>

--------------YU0EKbw84Hc8q0pvKb6XCjp5
Content-Type: multipart/mixed; boundary="------------2Q0ve0ZPrTlUCUo1NCMLrb9A"

--------------2Q0ve0ZPrTlUCUo1NCMLrb9A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTY6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyNy8wNi8yMDIyIDE1OjMxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjcuMDYu
MjIgMTQ6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KPj4+DQo+Pj4gU29tZSB0b29scyAoZS5nLiB4ZW5zdG9y
ZWQpIGFsd2F5cyBleHBlY3QgRUlOVkFMIHRvIGJlIGZpcnN0IGluIHhzZF9lcnJvcnMuDQo+
Pj4NCj4+PiBEb2N1bWVudCBpdCBzbywgb25lIGRvZXNuJ3QgYWRkIGEgbmV3IGVudHJ5IGJl
Zm9yZSBoYW5kIGJ5IG1pc3Rha2UuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPj4+DQo+Pj4gLS0tLQ0KPj4+DQo+Pj4gSSBo
YXZlIHRyaWVkIHRvIGFkZCBhIEJVSUxEX0JVR19PTigpIGJ1dCBHQ0MgY29tcGxhaW5lZCB0
aGF0IHRoZSB2YWx1ZQ0KPj4+IHdhcyBub3QgYSBjb25zdGFudC4gSSBjb3VsZG4ndCBmaWd1
cmUgb3V0IGEgd2F5IHRvIG1ha2UgR0NDIGhhcHB5Lg0KPj4+DQo+Pj4gQ2hhbmdlcyBpbiB2
MjoNCj4+PiDCoMKgwqDCoCAtIE5ldyBwYXRjaA0KPj4+IC0tLQ0KPj4+IMKgIHhlbi9pbmNs
dWRlL3B1YmxpYy9pby94c193aXJlLmggfCAxICsNCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvaW8veHNfd2lyZS5oIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3hzX3dpcmUuaA0KPj4+
IGluZGV4IGMxZWM3YzczZTNiMS4uZGQ0YzljOWI5NzJkIDEwMDY0NA0KPj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9pby94c193aXJlLmgNCj4+PiArKysgYi94ZW4vaW5jbHVkZS9w
dWJsaWMvaW8veHNfd2lyZS5oDQo+Pj4gQEAgLTc2LDYgKzc2LDcgQEAgc3RhdGljIHN0cnVj
dCB4c2RfZXJyb3JzIHhzZF9lcnJvcnNbXQ0KPj4+IMKgIF9fYXR0cmlidXRlX18oKHVudXNl
ZCkpDQo+Pj4gwqAgI2VuZGlmDQo+Pj4gwqDCoMKgwqDCoCA9IHsNCj4+PiArwqDCoMKgIC8q
IC8hXCBTb21lIHVzZXJzIChlLmcuIHhlbnN0b3JlZCkgZXhwZWN0IEVJTlZBTCB0byBiZSB0
aGUgZmlyc3QgZW50cnkuICovDQo+Pj4gwqDCoMKgwqDCoCBYU0RfRVJST1IoRUlOVkFMKSwN
Cj4+PiDCoMKgwqDCoMKgIFhTRF9FUlJPUihFQUNDRVMpLA0KPj4+IMKgwqDCoMKgwqAgWFNE
X0VSUk9SKEVFWElTVCksDQo+Pg0KPj4gV2hhdCBhYm91dCBhbm90aGVyIGFwcHJvYWNoLCBs
aWtlOg0KPiANCj4gSW4gcGxhY2Ugb2Ygd2hhdD8gSSBzdGlsbCB0aGluayB3ZSBuZWVkIHRo
ZSBjb21tZW50IGJlY2F1c2UgdGhpcyBhc3N1bXB0aW9uIGlzIA0KPiBub3QgcGFydCBvZiB0
aGUgQUJJIChBRkFJQ1QgeHNfd2lyZS5oIGlzIG1lYW50IHRvIGJlIHN0YWJsZSkuDQo+IA0K
PiBBdCB3aGljaCBwb2ludCwgSSBzZWUgbGltaXRlZCByZWFzb24gdG8gZml4IHhlbnN0b3Jl
ZF9jb3JlLmMuDQo+IA0KPiBCdXQgSSB3b3VsZCBoYXZlIHJlYWxseSBwcmVmZXIgdG8gdXNl
IGEgQlVJTERfQlVHX09OKCkgKG9yIHNpbWlsYXIpIHNvIHdlIGNhbiANCj4gY2F0Y2ggYW55
IG1pc3VlIGEgYnVpbGQuIE1heWJlIEkgc2hvdWxkIHdyaXRlIGEgc21hbGwgcHJvZ3JhbSB0
aGF0IGlzIGV4ZWN1dGVkIA0KPiBhdCBjb21waWxlIHRpbWU/DQoNCk15IHN1Z2dlc3Rpb24g
cmVtb3ZlcyB0aGUgbmVlZCBmb3IgRUlOVkFMIGJlaW5nIHRoZSBmaXJzdCBlbnRyeS4NCg0K
DQpKdWVyZ2VuDQoNCg==
--------------2Q0ve0ZPrTlUCUo1NCMLrb9A
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2Q0ve0ZPrTlUCUo1NCMLrb9A--

--------------YU0EKbw84Hc8q0pvKb6XCjp5--

--------------S0Zn0279OSf3ZGozI3PWPxwA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5w8gFAwAAAAAACgkQsN6d1ii/Ey/h
3wgAi/EUvF7x0kG8kwXJYcXz4fh2TM/f+PnXsi7A/qlnhf0oOOG1ufph9KTjkGzODTFjHdpTr6hC
P6/vDvg0TS986imptOppw2ROD1OtezvfjaRX0rJHhlYvJfI0QQctuwqxysE+GmX+ue15F7wVtV8i
zOrToQ93Wf2z4Q+FD953WlaLlUz4MoVILJ4q5oerfY0dTQmdVXkIollUZJIqTj8PGdCnSewmJg5B
Uu7C8E/E+IlW9VlhjPreSfpURH7F0F3vVThAAFfGqn85LmCLuxHbj4tA0z2PqDpDjWKgoQoa/Yzy
qkfqkuOL5cPgeyvkUt7ofsVcJ3AaFBrRbWf6XbEAhA==
=wUwD
-----END PGP SIGNATURE-----

--------------S0Zn0279OSf3ZGozI3PWPxwA--

