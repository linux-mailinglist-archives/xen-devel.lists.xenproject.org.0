Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D55E7599
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 10:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410659.653755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdvQ-0003nT-BV; Fri, 23 Sep 2022 08:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410659.653755; Fri, 23 Sep 2022 08:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdvQ-0003lQ-8U; Fri, 23 Sep 2022 08:20:44 +0000
Received: by outflank-mailman (input) for mailman id 410659;
 Fri, 23 Sep 2022 08:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVNC=Z2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1obdvO-0003l4-Rx
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 08:20:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cb7f47e-3b18-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 10:20:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 084851F86C;
 Fri, 23 Sep 2022 08:20:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E448713AA5;
 Fri, 23 Sep 2022 08:20:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DZVFNlhsLWP9BgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 23 Sep 2022 08:20:40 +0000
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
X-Inumbo-ID: 9cb7f47e-3b18-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663921241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4AdOxgRV+RTXVRLhvM56GZZ0gqGziqhG/M4w1trrCg=;
	b=X+Qzs2iXkyw7W3M6vvUuTU33okiuol4W3U4G94B9EHBbu+0pNEG7sLz/shT0UJQJPZhDrT
	F1hQVyvKSm7xrGrdSfbA2kWVMmO9Xv2S88EI++16A0w43wcV96QBbj0iV3+TBSMkSLwkLb
	xlxkfLfBavXRHWQz3xtns9ypqPvygV0=
Message-ID: <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
Date: Fri, 23 Sep 2022 10:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyszY+qHOVkCTe92@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Design session PVH dom0
In-Reply-To: <YyszY+qHOVkCTe92@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QjsC1YmJi4Vl1R091dRCQYM1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QjsC1YmJi4Vl1R091dRCQYM1
Content-Type: multipart/mixed; boundary="------------Prsalu08F1pm8DGmDmZqo87R";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
Subject: Re: Design session PVH dom0
References: <YyszY+qHOVkCTe92@mail-itl>
In-Reply-To: <YyszY+qHOVkCTe92@mail-itl>

--------------Prsalu08F1pm8DGmDmZqo87R
Content-Type: multipart/mixed; boundary="------------CtbXZEJR33n7y0QryO006Pb0"

--------------CtbXZEJR33n7y0QryO006Pb0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDkuMjIgMTc6NTMsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gU2Vzc2lvbiBkZXNjcmlwdGlvbiAoYnkgSmFuKToNCj4gSW4gdGhlIGNvdXJzZSBvZiB3
b3JraW5nIG9uIGFuIFhTQSBJIGhhZCB0byBmaW5hbGx5IGdldCBQVkggRG9tMCB3b3JrIG9u
IGF0IGxlYXN0IG9uZSBvZiBteSBzeXN0ZW1zLCBpbiBhIG1pbmltYWwgZmFzaGlvbi4gVGhp
cyBoYWQgdHVybmVkIHVwIGEgbnVtYmVyIG9mIGlzc3Vlcywgc29tZSBvZiB3aGljaCBoYXZl
IHNpbmNlIHJlbWFpbmVkIHBlbmRpbmcuIFRoZXJlZm9yZSBJ4oCZZCBsaWtlIHRvIGdhaW4g
dW5kZXJzdGFuZGluZyBvbiB3aGV0aGVyIHRoZXJlIGlzIGFueSBmdXR1cmUgdG8gdGhpcyBt
b2RlIG9mIERvbTAgb3BlcmF0aW9uLCBhbmQgaWYgc28gd2hlbiBpdCBjYW4gYmUgZXhwZWN0
ZWQgdG8gYmUgYmV0dGVyIHRoYW4gdGVjaCBwcmV2aWV3IG9yIGV2ZW4ganVzdCBleHBlcmlt
ZW50YWwuDQoNCi4uLg0KDQo+IErDvHJnZW46IFBWSCBkb20wIHBlcmZvcm1hbmNlPw0KPiAN
Cj4gUm9nZXI6IGl0J3MgYmFkOyBtb3N0bHkgcmVsZXZhbnQgaXMgcWVtdSBpbnRlcmZhY2Vz
DQo+IA0KPiBHZW9yZ2U6IG9ubHkgZm9yIHNhZmV0eSBjZXJ0aWZpY2F0aW9ucz8gcGVyZm9y
bWFuY2UgcGVuYWx0eSBtYXkgYmUgb2theQ0KPiANCj4gSsO8cmdlbjogaHlwZXJjYWxscyBj
YW4gYmUgaW1wcm92ZWQgKHZpcnR1YWwgYnVmZmVycz8pDQoNClNvbWUgbW9yZSB0aG91Z2h0
cyBvbiB0aGlzIHRvcGljOiBIYXZpbmcgaHlwZXJjYWxsIHZhcmlhbnRzIHdpdGggcGh5c2lj
YWxseQ0KYWRkcmVzc2VkIGJ1ZmZlcnMgd2lsbCBoZWxwLCBidXQgdGhlcmUgaXMgYW4gYWRk
aXRpb25hbCBjb21wbGV4aXR5OiB3aGF0DQphYm91dCBoeXBlcmNhbGxzIHdpdGggcmVhbGx5
IGxhcmdlIGJ1ZmZlcnMgKGUuZy4gdGhlIGJpdG1hcCBmb3IgbW9kaWZpZWQNCnBhZ2VzIGZv
ciBndWVzdCBtaWdyYXRpb24pLiBJbiBvcmRlciB0byBhdm9pZCBoYXZpbmcgdG8gYWxsb2Nh
dGUgaHVnZQ0KcGh5c2ljYWxseSBjb250aWd1b3VzIGJ1ZmZlcnMgZm9yIHRob3NlIHB1cnBv
c2VzIHdlJ2QgcHJvYmFibHkgbmVlZA0Kc29tZXRoaW5nIGxpa2Ugc2NhdHRlci9nYXRoZXIg
bGlzdHMgZm9yIGh5cGVyY2FsbCBidWZmZXJzLiBBbmQgdGhvc2UgbWlnaHQNCndhbnQgdG8g
YmUgc3VwcG9ydGVkIGluIGEgZ2VuZXJpYyB3YXkuIEFkZGl0aW9uYWxseTogd2hhdCBpZiBz
dWNoIGEgU0ctbGlzdA0Kd291bGQgZXhjZWVkIHRoZSBzaXplIG9mIGEgcGFnZT8gVGhlIGRp
cnR5IGJpdG1hcCBvZiBhIGd1ZXN0IHdpdGggNjQgR0Igb2YNClJBTSB3b3VsZCBhbHJlYWR5
IG5lZWQgNTEyIHBhZ2VzLCBzbyB0aGUgU0ctbGlzdCBmb3IgdGhhdCBiaXRtYXAgd291bGQg
YWxyZWFkeQ0KZmlsbCBhIGNvbXBsZXRlIHBhZ2UgYXNzdW1pbmcgb25seSA4IGJ5dGUgZm9y
IG9uZSBTRy1lbnRyeSAod2hpY2ggd291bGQgbGltaXQNCnRoZSBnZW5lcmFsIHVzYWJpbGl0
eSBhbHJlYWR5KS4NCg0KTXkgZmF2b3JpdGUgc29sdXRpb24gd291bGQgYmUgc29tZSBraW5k
IG9mIGJ1ZmZlciBhZGRyZXNzIHF1YWxpZmllciBmb3IgZWFjaA0KYnVmZmVyIChlLmcuIHZp
cnR1YWwsIHBoeXNpY2FsLCBTRy1saXN0LCBtYXliZSBuZXN0ZWQgU0ctbGlzdCkuIFNvIHRo
ZSBuZXcNCmh5cGVyY2FsbHMgd291bGQgbm90IG1lYW4gInBoeXNpY2FsIGJ1ZmZlciBhZGRy
ZXNzZXMiLCBidXQgInF1YWxpZmllZCBidWZmZXINCmFkZHJlc3NlcyIuIEJ5IHJlcXVpcmlu
ZyBhIG1pbmltdW0gb2YgNC1ieXRlIGFsaWdubWVudCBmb3IgZWFjaCBidWZmZXIgKGNhbiB3
ZQ0KZG8gdGhhdCwgYXQgbGVhc3QgZm9yIHRoZSBuZXcgaHlwZXJjYWxscz8pIHRoaXMgd291
bGQgbGVhdmUgdGhlIDIgbG93ZXN0IGJpdHMNCm9mIGEgYnVmZmVyIGFkZHJlc3MgZm9yIHRo
ZSBuZXcgcXVhbGlmaWVyLiBJZiBieSBhbnkgbWVhbnMgYW4gdW5hbGlnbmVkIGJ1ZmZlcg0K
aXMgbmVlZGVkIHNvbWV0aW1lcywgaXQgY291bGQgc3RpbGwgYmUgYWNoaWV2ZWQgdmlhIGEg
c2luZ2xlLWVudHJ5IFNHLWxpc3QuDQoNCg0KSnVlcmdlbg0K
--------------CtbXZEJR33n7y0QryO006Pb0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CtbXZEJR33n7y0QryO006Pb0--

--------------Prsalu08F1pm8DGmDmZqo87R--

--------------QjsC1YmJi4Vl1R091dRCQYM1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMtbFgFAwAAAAAACgkQsN6d1ii/Ey+1
awf/VYVH9gjCdTXVUhMnAewBRmi9gNPdLmpmuUnPMsJqJkdEjvLgg2MGHt3N0ONOjE207su1nu8p
1PVrCcCURcgJdcytZGp/ZGMlGx2ezUjuHBbZn+ma2mk2DSTaDnCU8m2xifo1Ts158hIL2BJkPpqm
x3LpkdtN/hRrq/GzO/6ywyQu2apBVl1XbFO0YDfYWRu042lnuPYweqI8vqse1vRhiKVcIhK6TXES
PB6SEwYJZbpFeyCVIQWZnzQ+paGNCOcZ2VMN5DzkqrsvjrKv3eFuvOTHP2+Sc2en2GzZvEYvyost
hT9RZ/zsNS20Vz2pUsQaObIb9jmPcQtWHdJ2On0dLg==
=aClv
-----END PGP SIGNATURE-----

--------------QjsC1YmJi4Vl1R091dRCQYM1--

