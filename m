Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A570B7D0
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 10:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537807.837336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q112W-00051M-OU; Mon, 22 May 2023 08:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537807.837336; Mon, 22 May 2023 08:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q112W-0004yx-Kx; Mon, 22 May 2023 08:37:12 +0000
Received: by outflank-mailman (input) for mailman id 537807;
 Mon, 22 May 2023 08:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRnz=BL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q112V-0004yr-K9
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 08:37:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c5b393-f87b-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 10:37:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16A8621972;
 Mon, 22 May 2023 08:37:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91E1913776;
 Mon, 22 May 2023 08:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HVzUIbUpa2QeWwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 22 May 2023 08:37:09 +0000
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
X-Inumbo-ID: d7c5b393-f87b-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684744630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ga5Zo8jqgo2Pq5tah2wZHCDCAl0WaiL8Zh0l8OnPpQ=;
	b=XtmMC6KGID7aLqQib45KPdLWlpll/Q7yy8XjVtDHEyg/w+IGN6zQsEw6yZj5sMUqzrozb7
	h8m+RBA1Hkf+x20fuf254GrTKCkUBksQdHvINgYp6+moEjtdKNsLqbmjnla407bw2Zaf8I
	yT72i5TTiaJxVLCVoumxC5JJe2HZjbs=
Message-ID: <c5defff8-882e-3482-0de1-e50a4bcdfa99@suse.com>
Date: Mon, 22 May 2023 10:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] x86: always initialize xen-swiotlb when xen-pcifront
 is enabling
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Christoph Hellwig <hch@lst.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl>
 <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <ZGdLErBzi9MANL3i@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yxQ05rE4I03r9lxlh0bCXS2U"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yxQ05rE4I03r9lxlh0bCXS2U
Content-Type: multipart/mixed; boundary="------------lebpN3m0ix011maVFGvYhzJB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Christoph Hellwig <hch@lst.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Message-ID: <c5defff8-882e-3482-0de1-e50a4bcdfa99@suse.com>
Subject: Re: [PATCH 2/4] x86: always initialize xen-swiotlb when xen-pcifront
 is enabling
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl>
 <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl>
In-Reply-To: <ZGdLErBzi9MANL3i@mail-itl>

--------------lebpN3m0ix011maVFGvYhzJB
Content-Type: multipart/mixed; boundary="------------mgbNAlWVI77vXQcN1yCpbTLa"

--------------mgbNAlWVI77vXQcN1yCpbTLa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDUuMjMgMTI6MTAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gRnJpLCBNYXkgMTksIDIwMjMgYXQgMDY6MDQ6MDVBTSArMDIwMCwgQ2hyaXN0b3Bo
IEhlbGx3aWcgd3JvdGU6DQo+PiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAwODoxODozOVBN
ICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+Pj4gT24gVGh1
LCBNYXkgMTgsIDIwMjMgYXQgMDM6NDI6NTFQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcg
d3JvdGU6DQo+Pj4+IFJlbW92ZSB0aGUgZGFuZ2Vyb3VzIGxhdGUgaW5pdGlhbGl6YXRpb24g
b2YgeGVuLXN3aW90bGIgaW4NCj4+Pj4gcGNpX3hlbl9zd2lvdGxiX2luaXRfbGF0ZSBhbmQg
aW5zdGVhZCBqdXN0IGFsd2F5cyBpbml0aWFsaXplDQo+Pj4+IHhlbi1zd2lvdGxiIGluIHRo
ZSBib290IGNvZGUgaWYgQ09ORklHX1hFTl9QQ0lERVZfRlJPTlRFTkQgaXMgZW5hYmxlZC4N
Cj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+DQo+Pj4NCj4+PiBEb2Vzbid0IGl0IG1lYW4gYWxsIHRoZSBQViBndWVzdHMgd2lsbCBi
YXNpY2FsbHkgd2FzdGUgNjRNQiBvZiBSQU0NCj4+PiBieSBkZWZhdWx0IGVhY2ggaWYgdGhl
eSBkb24ndCByZWFsbHkgaGF2ZSBQQ0kgZGV2aWNlcz8NCj4+DQo+PiBJZiBDT05GSUdfWEVO
X1BDSURFVl9GUk9OVEVORCBpcyBlbmFibGVkLCBhbmQgdGhlIGtlcm5lbCdzIGlzbid0IGJv
b3RlZA0KPj4gd2l0aCBzd2lvdGxiPW5vZm9yY2UsIHllcy4NCj4gDQo+IFRoYXQncyAiYSBi
aXQiIHVuZm9ydHVuYXRlLCBzaW5jZSB0aGF0IG1pZ2h0IGJlIHNpZ25pZmljYW50IHBhcnQg
b2YgdGhlDQo+IFZNIG1lbW9yeSwgb3IgaWYgeW91IGhhdmUgYSBsb3Qgb2YgVk1zLCBhIHNp
Z25pZmljYW50IHBhcnQgb2YgdGhlIGhvc3QNCj4gbWVtb3J5IC0gaXQgcXVpY2tseSBhZGRz
IHVwLg0KPiBXaGlsZSBJIHdvdWxkIHNheSBQQ0kgcGFzc3Rocm91Z2ggaXMgbm90IHZlcnkg
Y29tbW9uIGZvciBQViBndWVzdHMsIGNhbg0KPiB0aGUgZGVjaXNpb24gYWJvdXQgeGVuLXN3
aW90bGIgYmUgZGVsYXllZCB1bnRpbCB5b3UgY2FuIGVudW1lcmF0ZQ0KPiB4ZW5zdG9yZSB0
byBjaGVjayBpZiB0aGVyZSBhcmUgYW55IFBDSSBkZXZpY2VzIGNvbm5lY3RlZCAoYW5kIG5v
dA0KPiBhbGxvY2F0ZSB4ZW4tc3dpb3RsYiBieSBkZWZhdWx0IGlmIHRoZXJlIGFyZSBub25l
KT8gVGhpcyB3b3VsZA0KPiBzdGlsbCBub3QgY292ZXIgdGhlIGhvdHBsdWcgY2FzZSAoaW4g
d2hpY2ggY2FzZSwgeW91J2QgbmVlZCB0byBmb3JjZSBpdA0KPiB3aXRoIGEgY21kbGluZSks
IGJ1dCBhdCBsZWFzdCB5b3Ugd291bGRuJ3QgbG9vc2UgbXVjaCBtZW1vcnkganVzdA0KPiBi
ZWNhdXNlIG9uZSBvZiB5b3VyIFZNcyBtYXkgdXNlIFBDSSBwYXNzdGhyb3VnaCAoc28sIHlv
dSBoYXZlIGl0IGVuYWJsZWQNCj4gaW4geW91ciBrZXJuZWwpLg0KPiBQbGVhc2UgcmVtZW1i
ZXIgdGhhdCBndWVzdCBrZXJuZWwgaXMgbm90IGFsd2F5cyB1bmRlciBmdWxsIGNvbnRyb2wg
b2YNCj4gdGhlIGhvc3QgYWRtaW4sIHNvIG1ha2luZyBndWVzdHMgbG9vc2UgNjRNQiBvZiBS
QU0gYWx3YXlzLCBpbiBkZWZhdWx0DQo+IHNldHVwIGlzbid0IGdvb2QgZm9yIGN1c3RvbWVy
cyBvZiBzdWNoIFZNcy4uLg0KPiANCg0KSW4gbm9ybWFsIGNhc2VzIFBDSSBwYXNzdGhyb3Vn
aCBpbiBQViBndWVzdHMgcmVxdWlyZXMgdG8gc3RhcnQgdGhlIGd1ZXN0DQp3aXRoIGU4MjBf
aG9zdD0xLiBTbyBpdCBzaG91bGQgYmUgcmF0aGVyIGVhc3kgdG8gbGltaXQgYWxsb2NhdGlu
ZyB0aGUNCjY0TUIgaW4gUFYgZ3Vlc3RzIHRvIHRoZSBjYXNlcyB3aGVyZSB0aGUgbWVtb3J5
IG1hcCBoYXMgbm9uLVJBTSByZWdpb25zDQplc3BlY2lhbGx5IGluIHRoZSBmaXJzdCAxTUIg
b2YgdGhlIG1lbW9yeS4NCg0KVGhpcyB3aWxsIGNvdmVyIGV2ZW4gaG90cGx1ZyBjYXNlcy4g
VGhlIG9ubHkgY2FzZSBub3QgY292ZXJlZCB3b3VsZCBiZSBhDQpndWVzdCBzdGFydGVkIHdp
dGggZTgyMF9ob3N0PTEgZXZlbiBpZiBubyBQQ0kgcGFzc3Rocm91Z2ggd2FzIHBsYW5uZWQu
DQpCdXQgdGhpcyBzaG91bGQgYmUgcmF0aGVyIHJhcmUgKGF0IGxlYXN0IEkgaG9wZSBzbyku
DQoNCg0KSnVlcmdlbg0K
--------------mgbNAlWVI77vXQcN1yCpbTLa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mgbNAlWVI77vXQcN1yCpbTLa--

--------------lebpN3m0ix011maVFGvYhzJB--

--------------yxQ05rE4I03r9lxlh0bCXS2U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRrKbUFAwAAAAAACgkQsN6d1ii/Ey+v
oAf/RGlDPMYqkyXWlGUV4BUpVOohUjP+ndb+vqr426H0D3cuX5Wyojbd2qS0SGrO7sS92eu0Afv7
vOsOYgMl+2I+UGpMfiT9SNlhkcaIcZ7Trb3j4w61+m2zG52XShawOGUgnwnjk2PIoSsCHDc1iScg
8Kg6Acqa+as13B02OnnyGUO0aKEscYk3x7F0JbRrhBjhpyKZGZTg6r3MUn6f8lgsliESV1lMrQSo
x+ztSCC27+xJHhKN61OEVwbGVeunLOoEj9wn2yjrsGc3MN/+PntU2xdWmtbNybeQcy+7UlY8NUWB
hybiVNhbMYUI9qV3kMhO6M3zoXdYgL5le4urmk15oA==
=q2Cw
-----END PGP SIGNATURE-----

--------------yxQ05rE4I03r9lxlh0bCXS2U--

