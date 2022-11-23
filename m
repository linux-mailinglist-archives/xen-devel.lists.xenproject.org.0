Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523863512E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 08:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447414.703605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxkMS-00081O-HA; Wed, 23 Nov 2022 07:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447414.703605; Wed, 23 Nov 2022 07:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxkMS-0007zC-EE; Wed, 23 Nov 2022 07:40:00 +0000
Received: by outflank-mailman (input) for mailman id 447414;
 Wed, 23 Nov 2022 07:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVpM=3X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oxkMQ-0007z6-Gb
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 07:39:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0206c3a1-6b02-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 08:39:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 673FB1F8C3;
 Wed, 23 Nov 2022 07:39:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4528513AE7;
 Wed, 23 Nov 2022 07:39:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fvxFD0zOfWOUWQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Nov 2022 07:39:56 +0000
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
X-Inumbo-ID: 0206c3a1-6b02-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669189196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mrCiJ0zlcHkhAJ/ZATPapXHMPwLYR0ZBTjb0deb4pU4=;
	b=M9sehXuMQlKKXzqmzRp73iNavWX1tiMd4hJel8Cw8wW40GTh0bGwXxpWzcXO9gtnVuRwNd
	Ev9YjE7Rx+4tQi81h+1hJm4X9/M36Qj5mNUOfbJ9qIr3uvIvZ+HKsfbUXT4x1KfzAgXZkm
	SMu6aiqzPz5Rs5W5Y2msesrsxmgRKzY=
Message-ID: <a7af879c-0e58-d12b-287d-22ae7b9d9e2e@suse.com>
Date: Wed, 23 Nov 2022 08:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: EFI's -mapbs option may cause Linux to panic()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
 <Y3uryky3urmQlIjs@Air-de-Roger>
 <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
 <Y3yanWFrRpPg4bKW@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Y3yanWFrRpPg4bKW@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JiZcaR5veqr4OGegtPvMZoeK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JiZcaR5veqr4OGegtPvMZoeK
Content-Type: multipart/mixed; boundary="------------A7QSf6QomC8MDjaK2WDqUOzu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a7af879c-0e58-d12b-287d-22ae7b9d9e2e@suse.com>
Subject: Re: EFI's -mapbs option may cause Linux to panic()
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
 <Y3uryky3urmQlIjs@Air-de-Roger>
 <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
 <Y3yanWFrRpPg4bKW@Air-de-Roger>
In-Reply-To: <Y3yanWFrRpPg4bKW@Air-de-Roger>

--------------A7QSf6QomC8MDjaK2WDqUOzu
Content-Type: multipart/mixed; boundary="------------aAo1QpUoAJw3bzlWVdkj00FP"

--------------aAo1QpUoAJw3bzlWVdkj00FP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMTEuMjIgMTA6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwg
Tm92IDIxLCAyMDIyIGF0IDA2OjAxOjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4gT24gMjEuMTEuMjAyMiAxNzo0OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBP
biBNb24sIE5vdiAyMSwgMjAyMiBhdCAwNToyNzoxNlBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4gSGVsbG8sDQo+Pj4+DQo+Pj4+IG9uIGEgc3lzdGVtIHdpdGggdGhlc2Ug
Zmlyc3QgdHdvIEVGSSBtZW1vcnkgbWFwIGVudHJpZXMNCj4+Pj4NCj4+Pj4gKFhFTikgIDAw
MDAwMDAwMDAwMDAtMDAwMDAwMDA5ZGZmZiB0eXBlPTQgYXR0cj0wMDAwMDAwMDAwMDAwMDBm
DQo+Pj4+IChYRU4pICAwMDAwMDAwMDllMDAwLTAwMDAwMDAwOWZmZmYgdHlwZT0yIGF0dHI9
MDAwMDAwMDAwMDAwMDAwZg0KPj4+Pg0KPj4+PiBpLmUuIGV4Y2VwdCBmb3IgMiBwYWdlcyBh
bGwgc3BhY2UgYmVsb3cgMU0gYmVpbmcgQm9vdFNlcnZpY2VzRGF0YSwgdGhlDQo+Pj4+IC1t
YXBicyBvcHRpb24gaGFzIHRoZSBlZmZlY3Qgb2YgbWFya2luZyByZXNlcnZlZCBhbGwgdGhh
dCBzcGFjZS4gVGhlbg0KPj4+PiBMaW51eCBmYWlscyB0cnlpbmcgdG8gYWxsb2NhdGUgaXRz
IGxvd21lbSB0cmFtcG9saW5lICh3aGljaCByZWFsbHkgaXQNCj4+Pj4gc2hvdWxkbid0IG5l
ZWQgd2hlbiBydW5uaW5nIGluIFBWIG1vZGUpLCB1bHRpbWF0ZWx5IGxlYWRpbmcgdG8NCj4+
Pj4NCj4+Pj4gCQlwYW5pYygiUmVhbCBtb2RlIHRyYW1wb2xpbmUgd2FzIG5vdCBhbGxvY2F0
ZWQiKTsNCj4+Pj4NCj4+Pj4gaW4gdGhlaXIgaW5pdF9yZWFsX21vZGUoKS4NCj4+Pj4NCj4+
Pj4gV2hpbGUgZm9yIFBWIEkgdGhpbmsgaXQgaXMgY2xlYXIgdGhhdCB0aGUgZWFzaWVzdCBp
cyB0byBhdm9pZA0KPj4+PiB0cmFtcG9saW5lIHNldHVwIGluIHRoZSBmaXJzdCBwbGFjZSwg
aWlyYyBQVkggRG9tMCBhbHNvIHRyaWVzIHRvDQo+Pj4+IG1pcnJvciB0aGUgaG9zdCBtZW1v
cnkgbWFwIHRvIGl0cyBvd24gYWRkcmVzcyBzcGFjZS4gRG9lcyBQVkggTGludXgNCj4+Pj4g
cmVxdWlyZSBhIGxvd21lbSB0cmFtcG9saW5lPw0KPj4+DQo+Pj4gWWVzLCBpdCBkb2VzIEFG
QUlLLiAgSSBndWVzcyB0aG9zZSB0d28gcGFnZXMgd29uJ3QgYmUgZW5vdWdoIGZvcg0KPj4+
IExpbnV4IGJvb3QgdHJhbXBvbGluZSByZXF1aXJlbWVudHMgdGhlbi4NCj4+Pg0KPj4+IEkg
YXNzdW1lIG5hdGl2ZSBMaW51eCBpcyBmaW5lIHdpdGggdGhpcyBtZW1vcnkgbWFwIGJlY2F1
c2UgaXQgcmVjbGFpbXMNCj4+PiB0aGUgRWZpQm9vdFNlcnZpY2VzRGF0YSByZWdpb24gYW5k
IHRoYXQncyBlbm91Z2guDQo+Pg0KPj4gVGhhdCdzIG15IHVuZGVyc3RhbmRpbmcgYXMgd2Vs
bC4NCj4+DQo+Pj4+IFdoaWxlIHRoZSB0d28gcGFnZXMgaGVyZSBhcmUganVzdCBlbm91Z2gg
Zm9yIFhlbidzIHRyYW1wb2xpbmUsIEkgc3RpbGwNCj4+Pj4gd29uZGVyIHdoZXRoZXIgd2Ug
d2FudCB0byBhZGp1c3QgLW1hcGJzIGJlaGF2aW9yLiBTaW5jZSB3aGF0ZXZlciB3ZQ0KPj4+
PiBtaWdodCBkbyBsZWF2ZXMgYSByaXNrIG9mIGNvbmZsaWN0aW5nIHdpdGggdHJ1ZSBmaXJt
d2FyZSAobWlzKXVzZSBvZg0KPj4+PiB0aGF0IHNwYWNlLCB0aGUgYmVzdCBJIGNhbiB0aGlu
ayBvZiByaWdodCBub3cgd291bGQgYmUgYW5vdGhlciBvcHRpb24NCj4+Pj4gYWx0ZXJpbmcg
YmVoYXZpb3IgKG9yIHByb3ZpZGluZyBhbHRlcmVkIGJlaGF2aW9yKS4gWWV0IHN1Y2ggYW4g
b3B0aW9uDQo+Pj4+IHdvdWxkIGxpa2VseSBuZWVkIHRvIGJlIG1vcmUgZmluZS1ncmFpbmVk
IHRoZW4gdGhhbiBjb3ZlcmluZyBhbGwgb2YNCj4+Pj4gdGhlIGxvdyBNYiBpbiBvbmUgZ28u
IFdoaWNoIGZlZWxzIGxpa2UgYm90aCBnb2luZyB0b28gZmFyIGFuZCBtYWtpbmcNCj4+Pj4g
aXQgYXdrd2FyZCBmb3IgcGVvcGxlIHRvIGZpZ3VyZSBvdXQgd2hhdCB2YWx1ZShzKSB0byB1
c2UgLi4uDQo+Pj4+DQo+Pj4+IFRob3VnaHRzIGFueW9uZT8NCj4+Pg0KPj4+IEknbSB1bnN1
cmUgd2hhdCB0byByZWNvbW1lbmQuICBUaGUgbWFwYnMgb3B0aW9uIGlzIGEgd29ya2Fyb3Vu
ZCBmb3INCj4+PiBicm9rZW4gZmlybXdhcmUsIGFuZCBpdCdzIG5vdCBlbmFibGVkIGJ5IGRl
ZmF1bHQsIHNvIHdlIG1pZ2h0IGJlIGx1Y2t5DQo+Pj4gYW5kIG5ldmVyIGZpbmQgYSBzeXN0
ZW0gd2l0aCBhIG1lbW9yeSBtYXAgbGlrZSB5b3UgZGVzY3JpYmUgdGhhdCBhbHNvDQo+Pj4g
cmVxdWlyZXMgbWFwYnMgaW4gb3JkZXIgdG8gYm9vdC4NCj4+DQo+PiBHdWVzcyBob3cgd2Un
dmUgbGVhcm5lZCBvZiB0aGUgaXNzdWU6IFN5c3RlbXMgbWF5IGJvb3QgZmluZSB3aXRob3V0
DQo+PiAtbWFwYnMsIGJ1dCB0aGV5IG1heSBmYWlsIHRvIHJlYm9vdCBiZWNhdXNlIG9mIHRo
YXQgKGluKWZhbW91cyBpc3N1ZSBvZg0KPj4gZmlybXdhcmUgd3JpdGVycyBub3QgcHJvcGVy
bHkgc2VwYXJhdGluZyBib290IHNlcnZpY2VzIGNvZGUgcGF0aHMgZnJvbQ0KPj4gcnVudGlt
ZSBzZXJ2aWNlcyBvbmVzLiBBbmQgdGhlcmUgd2UncmUgZGVhbGluZyB3aXRoIGEgc3lzdGVt
IHdoZXJlIEkNCj4+IHN1c3BlY3QgdGhpcyB0byBiZSB0aGUgY2FzZSwganVzdCB0aGF0IC0g
dW5saWtlIGluIGVhcmxpZXIgc2ltaWxhcg0KPj4gY2FzZXMgLSB0aGVyZSdzIG5vICJjbGVh
biIgY3Jhc2ggcHJvdmluZyB0aGUgaXNzdWUgKHRoZSBzeXN0ZW0gc2ltcGx5DQo+PiBoYW5n
cykuIEhlbmNlIG15IHJlcXVlc3QgdGhhdCB0aGV5IHVzZSAtbWFwYnMgdG8gdHJ5IHRvIGZp
Z3VyZSBvdXQuDQo+Pg0KPj4gQW5kIHllcywgInJlYm9vdD1hY3BpIiBoZWxwcyB0aGVyZSwg
YnV0IHRoZXkgaW5zaXN0IG9uIGtub3dpbmcgd2hhdA0KPj4gY29tcG9uZW50IGlzIHRvIGJs
YW1lLg0KPiANCj4gV2VsbCwgaWYgcmVib290PWFjcGkgZml4ZXMgaXQgdGhlbiBpdCdzIHF1
aXRlIGNsZWFyIEVGSSByZWJvb3QgbWV0aG9kDQo+IGlzIHRvIGJsYW1lPw0KPiANCj4gT3Ig
dGhleSB3YW50IHRvIGtub3cgdGhlIGV4YWN0IGNhdXNlIHRoYXQgbWFrZXMgRUZJIHJlYm9v
dCBmYWlsLA0KPiBiZWNhdXNlIHRoYXQncyBxdWl0ZSBkaWZmaWN1bHQgdG8gZmlndXJlIG91
dCBmcm9tIG91ciBlbmQuDQo+IA0KPiBCdXQgSSdtIGFmcmFpZCBJIGRvbid0IHNlZSBhbnkg
c29sdXRpb24gdG8gbWFrZSBtYXBicyB3b3JrIHdpdGggYSBQVkgNCj4gZG9tMCBvbiBhIHN5
c3RlbSB3aXRoIGEgbWVtb3J5IG1hcCBsaWtlIHlvdSBwcm92aWRlZCwgc2hvcnQgb2YgYWRk
aW5nDQo+IHNvbWUga2luZCBvZiBib2RnZSB0byBub3QgbWFwIGFuZCBtYXJrIGFzIHJlc2Vy
dmVkIG1lbW9yeSBiZWxvdyAxTUINCj4gKGJ1dCB0aGF0IGtpbmQgb2YgZGVmZWF0cyB0aGUg
cHVycG9zZSBvZiBtYXBicykuDQoNCldoYXQgd2UgY291bGQgZG8gaW4gc3VjaCBhIGNhc2Ug
d291bGQgYmUgdG8gaW5oaWJpdCBzdXNwZW5kaW5nIHRoZQ0Kc3lzdGVtLCBhbmQgdG8gcnVu
IGRvbTAgd2l0aCBhIHNpbmdsZSBjcHUgb25seS4gQW4gZXJyb3IgbWVzc2FnZQ0KaW5kaWNh
dGluZyB0aGF0IHRoZSBzeXN0ZW0gc2hvdWxkIGJlIGJvb3RlZCB3aXRob3V0IG1hcGJzIHNo
b3VsZCBiZQ0KaXNzdWVkLCBvZiBjb3Vyc2UuDQoNCg0KSnVlcmdlbg0K
--------------aAo1QpUoAJw3bzlWVdkj00FP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------aAo1QpUoAJw3bzlWVdkj00FP--

--------------A7QSf6QomC8MDjaK2WDqUOzu--

--------------JiZcaR5veqr4OGegtPvMZoeK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmN9zksFAwAAAAAACgkQsN6d1ii/Ey/Z
cAgAncLZsSwwuAQa1rn05VaqFmkOTFNJiifijltWHObwDjux35GtqHMxNrv0SP3+SDt+aKFjl0sU
7CN7VW4SPO11qnbtWhouGuxyscWukgSfvDss+71aQC4q/t9wu21XWgU8YQYq4T2Lf+uGz/c9WA3g
esjWrCcnoQDNnp36JpLFQzp6wndlX0lgtM0vepYVfoPgngmAH5VRF8rk+7pXtnREE6rT5IF3gJd8
I+VSkKs7FteqH8vR/EKpzQ7wXzk/VDGscPThhRR5c/ElM04giRW9gXrsLAPWdJ40WyU8onJ2+CLB
cDW8acEQ8NTksgfW/wlU6YTKY/zlrHVNm68AWFB3tw==
=p5Xq
-----END PGP SIGNATURE-----

--------------JiZcaR5veqr4OGegtPvMZoeK--

