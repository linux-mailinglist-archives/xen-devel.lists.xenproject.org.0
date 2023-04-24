Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906026ECF7B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 15:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525376.816527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwUZ-0008Hq-0x; Mon, 24 Apr 2023 13:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525376.816527; Mon, 24 Apr 2023 13:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwUY-0008El-UE; Mon, 24 Apr 2023 13:44:30 +0000
Received: by outflank-mailman (input) for mailman id 525376;
 Mon, 24 Apr 2023 13:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ydgZ=AP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pqwUX-0008Ef-H2
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 13:44:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210ad7e7-e2a6-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 15:44:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2BB271FD80;
 Mon, 24 Apr 2023 13:44:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2B1513780;
 Mon, 24 Apr 2023 13:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lz7cNbmHRmQ4JgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Apr 2023 13:44:25 +0000
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
X-Inumbo-ID: 210ad7e7-e2a6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682343866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ut1j3/DQIQ9XFsFrBKdqm6zTTRIlaSmBnfygF/bsZn8=;
	b=Urg3Q4i9PSh06ifN89I1K1mIl3MwhfdGzPmMcF2KT1rOlMp6OLKDA1xCIU1c0XNGvy+Ken
	dArOZfuMiu/O3RUYei1qaF4OkhzHkpCSMx3P7iNV1i84enhcp4PmO70S6HlhqcKX5lGLCR
	S2qZkiIhqm8729/IaKg5gtoWUw/3HpU=
Message-ID: <e3a900e6-ef5e-9ac2-19fc-c276dc31c487@suse.com>
Date: Mon, 24 Apr 2023 15:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230421135933.23353-1-jgross@suse.com>
 <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: add support for crash dump analysis with xen.efi
In-Reply-To: <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5YGvLqDVWAAeuZx5hDz5eFzt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5YGvLqDVWAAeuZx5hDz5eFzt
Content-Type: multipart/mixed; boundary="------------uJ00jS94uZG0CIg6E5RACioU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <e3a900e6-ef5e-9ac2-19fc-c276dc31c487@suse.com>
Subject: Re: [PATCH] xen: add support for crash dump analysis with xen.efi
References: <20230421135933.23353-1-jgross@suse.com>
 <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>
In-Reply-To: <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>

--------------uJ00jS94uZG0CIg6E5RACioU
Content-Type: multipart/mixed; boundary="------------ev5uejv2noG5F6pEpRgidfLb"

--------------ev5uejv2noG5F6pEpRgidfLb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDQuMjMgMTQ6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wNC4yMDIz
IDE1OjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgaXQgaXMgbm90IHBvc3Np
YmxlIHRvIGFuYWx5c2UgY3Jhc2ggZHVtcHMgb2YgYSBzeXN0ZW0gaW4NCj4+IGh5cGVydmlz
b3IgbW9kZSB3aGVuIGl0IGhhZCBiZWVuIGJvb3RlZCB2aWEgRUZJLCBhcyB0aGUgY3Jhc2gg
dXRpbGl0eQ0KPj4gZG9lc24ndCB1bmRlcnN0YW5kIHRoZSBmaWxlIGZvcm1hdCBvZiB4ZW4u
ZWZpLg0KPj4NCj4+IFRoaXMgY2FuIGVhc2lseSBiZSBzb2x2ZWQgYnkgY3JlYXRpbmcgYW4g
RUxGIGZpbGUgZnJvbSB4ZW4uZWZpIHZpYQ0KPj4gb2JqY29weS4gVXNpbmcgdGhhdCBmaWxl
IGFzIG5hbWUgbGlzdCBmb3IgY3Jhc2ggZW5hYmxlcyB0aGUgdXNlciB0bw0KPj4gYW5hbHlz
ZSB0aGUgZHVtcCBpbiBoeXBlcnZpc29yIG1vZGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiAgIHhlbi9LY29u
ZmlnLmRlYnVnICAgICB8IDUgKysrKy0NCj4+ICAgeGVuL01ha2VmaWxlICAgICAgICAgIHwg
NCArKysrDQo+PiAgIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSB8IDMgKysrDQo+PiAgIDMgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS94ZW4vS2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnDQo+PiBp
bmRleCA5NGU4MThlZTA5Li40YWVjMGZkM2FhIDEwMDY0NA0KPj4gLS0tIGEveGVuL0tjb25m
aWcuZGVidWcNCj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnDQo+PiBAQCAtMTM4LDYgKzEz
OCw5IEBAIGNvbmZpZyBERUJVR19JTkZPDQo+PiAgIAkgIHRoZSBFRkkgYm9vdCBwYXJ0aXRp
b24gKGxvb2sgZm9yICJJTlNUQUxMX0VGSV9TVFJJUCIgaW4NCj4+ICAgCSAgZG9jcy9taXNj
L2VmaS5wYW5kb2MgZm9yIG1vcmUgaW5mb3JtYXRpb24gLSB3aGVuIG5vdCB1c2luZw0KPj4g
ICAJICAibWFrZSBpbnN0YWxsLXhlbiIgZm9yIGluc3RhbGxpbmcgeGVuLmVmaSwgc3RyaXBw
aW5nIG5lZWRzIHRvIGJlDQo+PiAtCSAgZG9uZSBvdXRzaWRlIHRoZSBYZW4gYnVpbGQgZW52
aXJvbm1lbnQpLg0KPj4gKwkgIGRvbmUgb3V0c2lkZSB0aGUgWGVuIGJ1aWxkIGVudmlyb25t
ZW50KS4gTm90ZSB0aGF0IHN0cmlwcGluZw0KPj4gKwkgIHhlbi5lZmkgdXNpbmcgIklOU1RB
TExfRUZJX1NUUklQIiB3aWxsIGRpc2FibGUgdGhlIGJ1aWxkaW5nIG9mDQo+PiArCSAgeGVu
LmVmaS5lbGYsIHdoaWNoIGlzIG5lZWRlZCBmb3IgImNyYXNoIiBkdW1wIGFuYWx5c2lzIG9m
IHN5c3RlbXMNCj4+ICsJICBib290ZWQgdmlhIEVGSS4NCj4gDQo+IEknbSBhZnJhaWQgSSBk
b24ndCB1bmRlcnN0YW5kIHRoaXM6IElOU1RBTExfRUZJX1NUUklQIG9ubHkgYWZmZWN0cyB3
aGF0DQo+IG1heSAob3B0aW9uYWxseSkgYmUgcGxhY2VkIG9uIHRoZSBFRkkgcGFydGl0aW9u
LiBUaGUgbm9ybWFsbHkgaW5zdGFsbGVkDQo+IHhlbi5lZmkgc2hvdWxkIGJlIHVuYWZmZWN0
ZWQgYnkgdGhpczsgYW4gaW50ZXJtZWRpYXRlIHhlbi5lZmkuc3RyaXBwZWQNCj4gaXMgY3Jl
YXRlZCBpbnN0ZWFkLg0KDQpPaCwgb2J2aW91c2x5IEkgbWlzaW50ZXJwcmV0ZWQgc29tZXRo
aW5nLiBJJ2xsIGRyb3AgdGhpcyBodW5rLg0KDQo+IA0KPj4gLS0tIGEveGVuL01ha2VmaWxl
DQo+PiArKysgYi94ZW4vTWFrZWZpbGUNCj4+IEBAIC01MDUsNiArNTA1LDkgQEAgX2luc3Rh
bGw6ICQoVEFSR0VUKSQoQ09ORklHX1hFTl9JTlNUQUxMX1NVRkZJWCkNCj4+ICAgCQlpZiBb
IC1lICQoVEFSR0VUKS5lZmkubWFwIF07IHRoZW4gXA0KPj4gICAJCQkkKElOU1RBTExfREFU
QSkgJChUQVJHRVQpLmVmaS5tYXAgJChEKSQoREVCVUdfRElSKS8kKFQpLSQoWEVOX0ZVTExW
RVJTSU9OKS5lZmkubWFwOyBcDQo+PiAgIAkJZmk7IFwNCj4+ICsJCWlmIFsgLWUgJChUQVJH
RVQpLmVmaS5lbGYgXTsgdGhlbiBcDQo+PiArCQkJJChJTlNUQUxMX0RBVEEpICQoVEFSR0VU
KS5lZmkuZWxmICQoRCkkKERFQlVHX0RJUikvJChUKS0kKFhFTl9GVUxMVkVSU0lPTikuZWZp
LmVsZjsgXA0KPj4gKwkJZmk7IFwNCj4gDQo+IFRvIGF2b2lkIHRoZSByaXNrIG9mIHRoZSB0
d28gZ29pbmcgb3V0IG9mIHN5bmMgKGFzIGFsc28gdG8gbGltaXQNCj4gcmVkdW5kYW5jeSks
IGNvdWxkIHlvdSB3cmFwIHRoZSBlYXJsaWVyICJpZiIgaW4gYSAiZm9yIHggaW4gbWFwIGVs
ZjsNCj4gZG8gLi4uOyBkb25lIiBsb29wPw0KDQpTdXJlLCB3aWxsIGRvLg0KDQo+IA0KPj4g
LS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlDQo+PiArKysgYi94ZW4vYXJjaC94ODYvTWFr
ZWZpbGUNCj4+IEBAIC0yMjQsNiArMjI0LDkgQEAgZW5kaWYNCj4+ICAgCSQoTUFLRSkgJChi
dWlsZCk9JChARCkgLiQoQEYpLjFyLm8gLiQoQEYpLjFzLm8NCj4+ICAgCSQoTEQpICQoY2Fs
bCBFRklfTERGTEFHUywkKFZJUlRfQkFTRSkpIC1UICQob2JqKS9lZmkubGRzIC1OICQ8IFwN
Cj4+ICAgCSAgICAgICQoQEQpLy4kKEBGKS4xci5vICQoQEQpLy4kKEBGKS4xcy5vICQob3Jw
aGFuLWhhbmRsaW5nLXkpICQobm90ZV9maWxlX29wdGlvbikgLW8gJEANCj4+ICtpZmVxICgk
KENPTkZJR19ERUJVR19JTkZPKSx5KQ0KPj4gKwkkKGlmICQoZmlsdGVyIC0tc3RyaXAtZGVi
dWcsJChFRklfTERGTEFHUykpLCwkKE9CSkNPUFkpIC1PIGVsZjY0LXg4Ni02NCAkQCAkQC5l
bGYpDQo+PiArZW5kaWYNCj4+ICAgCSQoTk0pIC1wYSAtLWZvcm1hdD1zeXN2ICQoQEQpLyQo
QEYpIFwNCj4+ICAgCQl8ICQob2JqdHJlZSkvdG9vbHMvc3ltYm9scyAtLWFsbC1zeW1ib2xz
IC0teGVuc3ltcyAtLXN5c3YgLS1zb3J0ID4kKEBEKS8kKEBGKS5tYXANCj4+ICAgCXJtIC1m
ICQoQEQpLy4kKEBGKS5bMC05XSogJChARCkvLi4kKEBGKS5bMC05XSoNCj4gDQo+IFBlcnNv
bmFsbHkgSSB0aGluayB0aGF0IC0gaW4gY2FzZSBvZiBidWlsZCBwcm9ibGVtcyAtIGhhdmlu
ZyB0aGUgbWFwIGZpbGUNCj4gY3JlYXRlZCBpcyBtb3JlIGltcG9ydGFudCAoYW5kIGxlc3Mg
bGlrZWx5IHRvIGZhaWwpIHRoYW4gdGhlIEVMRiBvbmUsIHNvDQo+IEknZCBwcmVmZXIgaWYg
dGhlIHR3byBzdGVwcyBjb3VsZCBiZSBvcmRlcmVkIHRoZSBvdGhlciB3YXkgYXJvdW5kLg0K
DQpGaW5lIHdpdGggbWUuDQoNCj4gRnVydGhlciBJIHZhZ3VlbHkgcmVjYWxsIHBvc3NpYmxl
IGlzc3VlcyB3aXRoIGVudGlyZWx5IGJsYW5rIG1ha2UgcnVsZQ0KPiBsaW5lcy4gUGx1cyBo
YXZpbmcgc29tZSB0cmFjZSBvZiB0aGUgY29tbWFuZCBpbiBhIHZlcmJvc2UgbG9nIHBlcmhh
cHMNCj4gYWxzbyB3b3VsZG4ndCBodXJ0LiBJT1cgbWF5YmUgYmV0dGVyIGFkZCBhbm90aGVy
IHVzZSBvZiB0aGUgY29sb24gY29tbWFuZA0KPiBoZXJlICh3ZSBhbHJlYWR5IGhhdmUgc29t
ZSwgYXQgbGVhc3QgdGhyb3VnaCAkKE1LUkVMT0MpKToNCj4gDQo+IGlmZXEgKCQoQ09ORklH
X0RFQlVHX0lORk8pLHkpDQo+IAkkKGlmICQoZmlsdGVyIC0tc3RyaXAtZGVidWcsJChFRklf
TERGTEFHUykpLDopJChPQkpDT1BZKSAtTyBlbGY2NC14ODYtNjQgJEAgJEAuZWxmDQo+IGVu
ZGlmDQo+IA0KPiA/DQoNCk9rYXkuDQoNCj4gDQo+IEZpbmFsbHkgLSBkbyB5b3UgcmVhbGx5
IG5lZWQgdG8gY29weSBhbGwgdGhlIG5vbi1kZWJ1ZyBzZWN0aW9ucyBhcyB3ZWxsPw0KPiBN
aWdodCAtLW9ubHkta2VlcC1kZWJ1ZyBiZSBoZWxwZnVsIGhlcmUgKHByb3ZpZGVkIGl0IHdv
cmtzIGZvciBhIFBFL0NPRkYNCj4gLT4gRUxGIGNvcHkgb3BlcmF0aW9uOyBpdCBsb29rcyB0
byBkbyBzbyBpbiBteSBzaW1wbGUgZXhwZXJpbWVudHMpPw0KDQpObywgZG9lc24ndCB3b3Jr
IChvYmpjb3B5IGRvZXMsIGJ1dCBub3QgY3Jhc2ggd2l0aCB0aGF0IGZpbGUpOg0KDQogICBj
cmFzaDogeGVuLmVmaS5lbGY6IG5vIHRleHQgYW5kIGRhdGEgY29udGVudHMNCg0KDQpKdWVy
Z2VuDQo=
--------------ev5uejv2noG5F6pEpRgidfLb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ev5uejv2noG5F6pEpRgidfLb--

--------------uJ00jS94uZG0CIg6E5RACioU--

--------------5YGvLqDVWAAeuZx5hDz5eFzt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRGh7kFAwAAAAAACgkQsN6d1ii/Ey9m
0AgAlMLzhz4BvTNJZLd7eX/cOrq8hTAuTTnhi5zXz5SfLWBbywdK0C55xFngmIjDuEhUfIBhVcka
lgnBrjeaRpPZ5CJCuPekC2wTBK+8GYb6ROruhW+ZU/CHUMxi4Hu7rdLKeW+T1QRNX0aEd8xRldGo
5uqfSiZku2PsnJdb2M8L1VU1Em0bhqFvbV5Vr30v8VIow0hVn3u3NZ9V9plYk0g1fmM0zNttVwo7
TTNXqFOw4ms9rcecXFIlFsHy0QdqSJImq5Aha+DTo8OV3VKPhlf0SO1qjMnxAOHZjwG/TMryPglv
lf9YXLStN6g8myKSGEvEQWusmfs/XTQbyy8Fe4UITw==
=XZ9C
-----END PGP SIGNATURE-----

--------------5YGvLqDVWAAeuZx5hDz5eFzt--

