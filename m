Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52E4CBB15
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282956.481831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiU3-0007GS-Q1; Thu, 03 Mar 2022 10:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282956.481831; Thu, 03 Mar 2022 10:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiU3-0007Dw-Mu; Thu, 03 Mar 2022 10:14:55 +0000
Received: by outflank-mailman (input) for mailman id 282956;
 Thu, 03 Mar 2022 10:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhVD=TO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nPiU1-0007Dg-S3
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:14:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4324fc5-9ada-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:14:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E18221107;
 Thu,  3 Mar 2022 10:14:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3DEDD13AB4;
 Thu,  3 Mar 2022 10:14:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LhyrDRyVIGIlfAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Mar 2022 10:14:52 +0000
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
X-Inumbo-ID: c4324fc5-9ada-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646302492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VpO1IJuSqaeaIl4HygU4uDzL2FG7IDZY6MwPuuLq3pY=;
	b=Ywer96wwwEcL98fwgMhxZYOblo4iiDO1rj7XpeztxjNSnr1Fp8FFn8DuKYfZaOxfwBabZ5
	tHk4DjMBugGRZvKrV72Nms6FrIrmb0RX3/HFiDvBQfCSX+85hNT6cRs8f2/qaf74Qg/9hv
	0x3ZQRfpV0Q/uIxoN70Pr85g4xjPILM=
Message-ID: <78e6dc12-9406-743c-1fe2-4214483f08fb@suse.com>
Date: Thu, 3 Mar 2022 11:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC] xen/sched: Optimise when only one scheduler is
 compiled in
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220303004015.17688-1-andrew.cooper3@citrix.com>
 <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
Content-Language: en-US
In-Reply-To: <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AyfTCQzMqRiZJ8xFP3I4mzX0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AyfTCQzMqRiZJ8xFP3I4mzX0
Content-Type: multipart/mixed; boundary="------------ytyEUoryB00be5tkmFLDCE00";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <78e6dc12-9406-743c-1fe2-4214483f08fb@suse.com>
Subject: Re: [PATCH RFC] xen/sched: Optimise when only one scheduler is
 compiled in
References: <20220303004015.17688-1-andrew.cooper3@citrix.com>
 <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>
In-Reply-To: <4270d03c-50a9-b1aa-dc2e-53e998153a6b@suse.com>

--------------ytyEUoryB00be5tkmFLDCE00
Content-Type: multipart/mixed; boundary="------------P9qcsc8G8IY1L1ksrmMhDAk1"

--------------P9qcsc8G8IY1L1ksrmMhDAk1
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
--------------P9qcsc8G8IY1L1ksrmMhDAk1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----


--------------P9qcsc8G8IY1L1ksrmMhDAk1--

--------------ytyEUoryB00be5tkmFLDCE00--

--------------AyfTCQzMqRiZJ8xFP3I4mzX0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIglRsFAwAAAAAACgkQsN6d1ii/Ey+o
Pwf+IFqKLO3lkbNjhfebOsb+N8jbPYIFrQ9EVSkRCN1n7z6XaGim3F9T+DLU6xg/ds+TLVmr1iSf
8cRHIRo2XY72Dzfh4QBMv2lGVVTSx3uyBK0fg2pIdIrZX0Jw5VzL0FA/JnevpyYbVt88CTL3o0Z0
R2PFDZ4/Ls6sfXkTx/Xz5FKZAu3+Py5vXM/hIs7PiGAzyUsR7VVgYy6FZ7SBMjSttY29inv7aha4
5Bbc/9kRJsVzH/4wmu3Tela+2K1Xmp7BeYpimWZaQRg788KSL2ONtL8jx8mwQOKkahy46JQVhOVO
n7AMu1x4sBGqlY/F4Rfpmmz3P44TztKQb33jin0m9Q==
=osSv
-----END PGP SIGNATURE-----

--------------AyfTCQzMqRiZJ8xFP3I4mzX0--

