Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB24CBAF8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282908.481765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiLX-0002KS-BG; Thu, 03 Mar 2022 10:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282908.481765; Thu, 03 Mar 2022 10:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiLX-0002IU-6Q; Thu, 03 Mar 2022 10:06:07 +0000
Received: by outflank-mailman (input) for mailman id 282908;
 Thu, 03 Mar 2022 10:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhVD=TO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nPiLV-0002Fn-Fb
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:06:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 890f2f87-9ad9-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:06:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B878A1F37E;
 Thu,  3 Mar 2022 10:06:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 863E013AB4;
 Thu,  3 Mar 2022 10:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u7KAHwuTIGJYeAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Mar 2022 10:06:03 +0000
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
X-Inumbo-ID: 890f2f87-9ad9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646301963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d9sA8FZ/3AU04Q3EkU7cKWh/RgkHzu0ZzGjm8gE7l4c=;
	b=jZMMSm2jVtHQ171hehxddgtJimSsjFEjvH+YgEOIdQmK8kOTdUGSS4uCc6UNGTjzmSCswa
	krRaT76Kify9mISKtM/j2/kYhQTd+tW69JYm7fSr/CkiK+CM57fEhFStAENNqyw3P35Ioy
	ZfgsWxy0eHPpEoMuo0dMnbFSNjrNPbM=
Message-ID: <9da1c49d-2655-fc24-d422-5bc4edc491f9@suse.com>
Date: Thu, 3 Mar 2022 11:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] xen/sched: Optimise when only one scheduler is
 compiled in
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220303004015.17688-1-andrew.cooper3@citrix.com>
 <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
In-Reply-To: <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Kc97eAYwoXPDVjBJ7oHo6bMw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Kc97eAYwoXPDVjBJ7oHo6bMw
Content-Type: multipart/mixed; boundary="------------0WPCTCtuG4z0dWr0L0c7ufIq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <9da1c49d-2655-fc24-d422-5bc4edc491f9@suse.com>
Subject: Re: [PATCH RFC] xen/sched: Optimise when only one scheduler is
 compiled in
References: <20220303004015.17688-1-andrew.cooper3@citrix.com>
 <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
In-Reply-To: <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>

--------------0WPCTCtuG4z0dWr0L0c7ufIq
Content-Type: multipart/mixed; boundary="------------850ZLIOXL9FQHkzO3Ns8352M"

--------------850ZLIOXL9FQHkzO3Ns8352M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDMuMjIgMDk6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDAzLjAzLjIy
IDAxOjQwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gV2hlbiBvbmx5IG9uZSBzY2hlZHVs
ZXIgaXMgY29tcGlsZWQgaW4sIGZ1bmN0aW9uIHBvaW50ZXJzIGNhbiBiZSANCj4+IG9wdGlt
aXNlZCB0bw0KPj4gZGlyZWN0IGNhbGxzLCBhbmQgdGhlIGhvb2tzIGhhcmRlbmVkIGFnYWlu
c3QgY29udHJvbGZsb3cgaGlqYWNraW5nLg0KPj4NCj4+IFJGQyBmb3Igc2V2ZXJhbCByZWFz
b25zLg0KPj4NCj4+IDEpIFRoZXJlJ3MgYW4gYWxtb3N0IGJlYXV0aWZ1bCB3YXkgb2Ygbm90
IGludHJvZHVjaW5nIE1BWUJFX1NDSEVEKCkgDQo+PiBhbmQgaGlkaW5nDQo+PiDCoMKgwqAg
dGhlIG1hZ2ljIGluIFJFR0lTVEVSX1NDSEVEVUxFUigpLCBleGNlcHQgaXQgZmFsbHMgb3Zl
cg0KPj4gwqDCoMKgIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dp
P2lkPTkxNzY1IHdoaWNoIGhhcyBubyANCj4+IGNvbW1lbnQgb3INCj4+IMKgwqDCoCByZXNv
bHV0aW9uIGF0IGFsbC4NCj4+DQo+PiAyKSBBIGRpZmZlcmVudCBhbHRlcm5hdGl2ZSB3aGlj
aCBhbG1vc3Qgd29ya3MgaXMgdG8gcmVtb3ZlIHRoZSANCj4+IGluZGlyZWN0aW9uIGluDQo+
PiDCoMKgwqAgLmRhdGEuc2NoZWR1bGVycywgYnV0IHRoZSBzaW5nbGV0b24gc2NoZWR1bGVy
IG9iamVjdCBjYW4ndCBiZSBib3RoIA0KPj4gdGhlcmUNCj4+IMKgwqDCoCBhbmQgaW4gLmlu
aXQucm9kYXRhLmNmX2Nsb2JiZXIuDQo+Pg0KPj4gMykgSSBjYW4ndCB0aGluayBvZiBhIHdh
eSBvZiBidWlsZCB0aW1lIGNoZWNrIHRvIGVuZm9yY2UgdGhhdCBuZXcgDQo+PiBzY2hlZHVs
ZXJzDQo+PiDCoMKgwqAgZ2V0IGFkZGVkIHRvIHRoZSBwcmVwcm9jZXNzb3IgbWFnaWMuDQo+
Pg0KPj4gQW5kIHRoZSBibG9ja2VyOg0KPj4gNCkgVGhpcyBpc24ndCBjb21wYXRpYmxlIHdp
dGggaG93IHNjaGVkX2lkbGVfb3BzIGdldCB1c2VkIGZvciANCj4+IGdyYW51bGFyaXR5ID4g
MS4NCj4+DQo+PiBTdWdnZXN0aW9ucyB2ZXJ5IHdlbGNvbWUuDQo+IA0KPiBEaWQgeW91IGNv
bnNpZGVyIHRvIGdlbmVyYXRlIHRoZSBuZWVkZWQgY29kZSBkeW5hbWljYWxseSBpbnN0ZWFk
Pw0KPiANCj4gSSBndWVzcyB0aGlzIGNvdWxkIGV2ZW4gYmUgZXh0ZW5kZWQgdG8gYXZvaWQg
ZnVuY3Rpb24gcG9pbnRlcnMNCj4gY29tcGxldGVseSB1c2luZyB0aGUgc2FtZSB0ZWNobmlx
dWUgYXMgaW4gbXkgaHlwZXJjYWxsIHNlcmllcy4NCj4gDQo+IEluIG9yZGVyIHRvIGF2b2lk
IHRoZSBuZWVkIGZvciBhIGNlbnRyYWwgdGFibGUgdGhlIHBlci1zY2hlZHVsZXINCj4gaG9v
a3MgY291bGQgdXNlIHN0YW5kYXJkIG5hbWVzIChhcyBtb3N0IG9mIHRoZW0gZG8gYWxyZWFk
eSkuDQo+IA0KPiBJIHRoaW5rIEkgY291bGQgY29tZSB1cCB3aXRoIGEgcGF0Y2ggaW4gYSBm
ZXcgaG91cnMgaWYgeW91IGxpa2UNCj4gdGhhdCBhcHByb2FjaC4NCg0KQlRXLCBpbiB0aGVv
cnkgdGhpcyBhcHByb2FjaCBjb3VsZCBiZSBnZW5lcmFsaXplZCBmb3Igb3RoZXIgZnVuY3Rp
b24NCnZlY3RvcnMgaW4gdGhlIGh5cGVydmlzb3IsIHRvbyAobWF5YmUgZXZlbiBhbGw/KS4N
Cg0KDQpKdWVyZ2VuDQo=
--------------850ZLIOXL9FQHkzO3Ns8352M
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------850ZLIOXL9FQHkzO3Ns8352M--

--------------0WPCTCtuG4z0dWr0L0c7ufIq--

--------------Kc97eAYwoXPDVjBJ7oHo6bMw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIgkwsFAwAAAAAACgkQsN6d1ii/Ey/y
lQf/aWWVkxTWj/NZ8JJ0EIEd+ncKGGrRp+YV9flmakPiTKnhhVa0ADw8BO1rTnLR93CsXD0c6MI0
0m0KyekdAqAI77MII9/NJOUGxePnhfODRZ6gefJ4BPN9AONJcnjXrY7ugDIab0DXch02uu9I/Iw0
xZZWGg8jgmR7ET4kPzdrOh6U7ZpCqv5w3lffE6a7B/P85eEpaUyPDvyy37d7gwZrxHDFc/kU6cF0
3urzYeBnG/4U6rhdgX80/57Utea01jFaJm8VGVxaVHzhZVajpCtBmhQ0Z8riTuAnmevtkx1s8f4/
pCHxiOXe8XxLkR736MJFegK31wG7LDlL5Z6mxOOkGQ==
=zPV9
-----END PGP SIGNATURE-----

--------------Kc97eAYwoXPDVjBJ7oHo6bMw--

