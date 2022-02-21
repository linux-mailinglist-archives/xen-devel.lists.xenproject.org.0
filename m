Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479224BDA75
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 16:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276311.472444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMAG3-0003PV-VF; Mon, 21 Feb 2022 15:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276311.472444; Mon, 21 Feb 2022 15:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMAG3-0003Mr-Rs; Mon, 21 Feb 2022 15:05:47 +0000
Received: by outflank-mailman (input) for mailman id 276311;
 Mon, 21 Feb 2022 15:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tDfV=TE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nMAG2-0003Ml-Vx
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 15:05:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be88e436-9327-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 16:05:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B9051F390;
 Mon, 21 Feb 2022 15:05:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1483C13AF2;
 Mon, 21 Feb 2022 15:05:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FymhA0mqE2KtPQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Feb 2022 15:05:45 +0000
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
X-Inumbo-ID: be88e436-9327-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645455945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cWjERW4ljFNpjdEzpedk++KR/uFyHQxScEQA0N8qaI0=;
	b=pnYP1oAzrkGS7f6HbKgIKI57U/F5wfoOIKOeYvv21HAvFL9Ik28etjZkGTrdtnsiKSY6Ml
	uRy4U1fGWsXfIaq/LMyopONnltRqH0iTtH7gIMVxR3GeHXxqHjhqj4RtZi1FT7yzcmfJUW
	37ta/aNr5maNn3R78udsNL/DhKxPbns=
Message-ID: <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
Date: Mon, 21 Feb 2022 16:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
In-Reply-To: <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rFmTfN1Q5vtPk0yf06cc16dJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rFmTfN1Q5vtPk0yf06cc16dJ
Content-Type: multipart/mixed; boundary="------------pRbUI3m10g0G42TZ860RGg5f";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
In-Reply-To: <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>

--------------pRbUI3m10g0G42TZ860RGg5f
Content-Type: multipart/mixed; boundary="------------hu0cDC8DC5duCEmwqb0Fzf60"

--------------hu0cDC8DC5duCEmwqb0Fzf60
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDIuMjIgMTU6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wMi4yMDIy
IDE1OjI3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjEuMDIuMjIgMTU6MTgsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIxLjAyLjIwMjIgMTM6NDIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IFByb3ZpZGluZyBhIG1hY3JvIGZvciBhbiBpbnZhbGlkIGdyYW50
IHJlZmVyZW5jZSB3b3VsZCBiZSBiZW5lZmljaWFsDQo+Pj4+IGZvciB1c2VycywgZXNwZWNp
YWxseSBhcyBzb21lIGFyZSB1c2luZyB0aGUgd3JvbmcgdmFsdWUgIjAiIGZvciB0aGF0DQo+
Pj4+IHB1cnBvc2UuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCj4+Pg0KPj4+IE92ZXIgdGhlIHllYXJzIEkndmUgYmVlbiBj
b25zaWRlcmluZyB0byBhZGQgc3VjaCB0byB0aGUgcHVibGljDQo+Pj4gaW50ZXJmYWNlLCBw
ZXJoYXBzIGV2ZW4gbW9yZSB0aGFuIG9uY2UuIEJ1dCBJJ20gYWZyYWlkIGl0J3Mgbm90IHRo
YXQNCj4+PiBlYXN5LiBJbiBwcmluY2lwbGUgMHhmZmZmZmZmZiAod2hpY2ggYnR3IGlzbid0
IG5lY2Vzc2FyaWx5IH4wdSkgY291bGQNCj4+DQo+PiBJIGNhbiBjaGFuZ2UgdGhhdCB0byB1
c2UgMHhmZmZmZmZmZiBleHBsaWNpdGx5Lg0KPj4NCj4+PiBiZSBhIHZhbGlkIHJlZi4gSXQg
aXMgcmVhbGx5IGludGVybmFsIGFncmVlbWVudCBieSB1c2VycyBvZiB0aGUNCj4+PiBpbnRl
cmZhY2UgdG8gc2V0IGZvciB0aGVtc2VsdmVzIHRoYXQgdGhleSdyZSBub3QgZXZlciBnb2lu
ZyB0byBtYWtlDQo+Pj4gYSB2YWxpZCBncmFudCBiZWhpbmQgdGhhdCByZWZlcmVuY2UuDQo+
Pg0KPj4gQXMgdGhlIGdyYW50IHJlZmVyZW5jZSBpcyBhbiBpbmRleCBpbnRvIHRoZSBncmFu
dCB0YWJsZSB0aGlzIHdvdWxkDQo+PiBsaW1pdCB0aGUgc2l6ZSBvZiB0aGUgZ3JhbnQgdGFi
bGUgdG8gIm9ubHkiIFVJTlRfTUFYIC0gMS4gSSBkb24ndA0KPj4gdGhpbmsgdGhpcyB3aWxs
IGJlIGV2ZXIgYSBjb25jZXJuIChvdGhlciB0aGFuIGFuIGFjYWRlbWljYWwgb25lKS4NCj4g
DQo+IFRoYXQgd2Fzbid0IG15IHBvaW50LiBMaW1pdGluZyB0aGUgdGFibGUgdG8gb25lIGxl
c3MgZW50cnkgaXMgbm90IGENCj4gYmlnIGRlYWwgaW5kZWVkLiBCdXQgd2UgaGF2ZSBubyBy
ZWFzb24gdG8gbWFuZGF0ZSB3aGljaCBncmVmKHMpIHRvDQo+IGNvbnNpZGVyIGludmFsaWQu
IEEgZ3Vlc3QgY291bGQgY29uc2lkZXIgZ3JlZiAwIHRoZSBpbnZhbGlkIG9uZS4NCg0KV2l0
aCB0aGUgZ3JlZiBiZWluZyBhbiBpbmRleCBzdGFydGluZyB3aXRoIDAgKGdyZWYgMCBpcyB2
YWxpZCwgYXMgaXQgaXMNCnVzZWQgZm9yIHRoZSBjb25zb2xlIHJpbmcgcGFnZSksIHRoZSBu
YXR1cmFsIGNob2ljZSBmb3IgYW4gaW52YWxpZA0KdmFsdWUgaXMgdGhlIGhpZ2hlc3Qgb25l
IGJlaW5nIHJlcHJlc2VudGFibGUuIEEgZ3JlZiBpcyBvZiB0eXBlIHVpbnQzMl90DQpyZXN1
bHRpbmcgaW4gdGhpcyB2YWx1ZSBiZWluZyAweGZmZmZmZmZmLg0KDQpXaGlsZSBpbiB0aGVv
cnkgYSBncmFudCB0YWJsZSBjb3VsZCBiZSB0aGF0IGxhcmdlLCBpbiBwcmFjdGljZSB0aGlz
DQp3aWxsIG5ldmVyIGhhcHBlbi4NCg0KPiBUaGUgaHlwZXJ2aXNvciBkb2Vzbid0IGNhcmUu
IEltbyB0aGlzIHNpbXBseSBpcyBhbiBhc3BlY3Qgd2hpY2ggaXMNCg0KVGhpcyBpc24ndCB0
cnVlLiBUaGUgaHlwZXJ2aXNvciBuZWVkcyB0byBhbGxvY2F0ZSByZXNvdXJjZXMgZm9yIGJl
aW5nDQphYmxlIHRvIGhhbmRsZSB0aGUgaGlnaGVzdCBwb3NzaWJsZSBncmVmIHZhbHVlIGZv
ciBhIGd1ZXN0LiBGb3IgYSB2MQ0KZ3JhbnQgdGFibGUgdGhpcyB3b3VsZCBtZWFuIDMyR0Ig
b2YgZ3JhbnQgdGFibGUgc2l6ZS4gQXJlIHlvdSByZWFsbHkNCmNvbmNlcm5lZCB3ZSB3aWxs
IGV2ZXIgaGl0IHRoaXMgbGltaXQ/IFRoaXMgaXNuJ3QgYXQgdGhlIGd1ZXN0J3MNCmNob2lj
ZSwgYWZ0ZXIgYWxsLCBhcyB0aGUgbWF4IGdyYW50IHRhYmxlIHNpemUgaXMgbGltaXRlZCBi
eSBYZW4uDQoNCj4gbm90IGluIG5lZWQgb2YgcGlubmluZyBkb3duIGluIHRoZSBBQkkuIFll
dCBpZiBpdCB3YXMgcGlubmVkIGRvd24NCj4gbGlrZSB5b3UgZG8sIHRoZW4gdGhlIGh5cGVy
dmlzb3Igd291bGQgbmVlZCB0byBtYWtlIHN1cmUgaXQgcmVmdXNlcw0KPiB0byBhY3Qgb24g
dGhpcyBtYW5kYXRlZCBpbnZhbGlkIGdyZWYuDQoNClRoaXMgaXMgYW4gZWFzeSBvbmUuIFdl
IGNvdWxkIGp1c3QgcmVmdXNlIHRvIGhhdmUgYSBncmFudCB0YWJsZSBvZg0KdGhhdCBzaXpl
LiBJIGNhbiBhZGQgdGhpcyB0byB0aGUgcGF0Y2ggaWYgeW91IHJlYWxseSB0aGluayBpdCBp
cw0KbmVjZXNzYXJ5Lg0KDQpUQkgsIEkgdGhpbmsgc3VjaCBjb21wbGV0ZWx5IHRoZW9yZXRp
Y2FsIGNvbmNlcm5zIHNob3VsZCBub3Qgc3RhbmQNCmluIHRoZSB3YXkgb2YgYWRkaXRpb25z
IHRvIHRoZSBBQkkgbWFraW5nIGxpZmUgZWFzaWVyIGZvciBjb25zdW1lcnMuDQoNCg0KSnVl
cmdlbg0K
--------------hu0cDC8DC5duCEmwqb0Fzf60
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------hu0cDC8DC5duCEmwqb0Fzf60--

--------------pRbUI3m10g0G42TZ860RGg5f--

--------------rFmTfN1Q5vtPk0yf06cc16dJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmITqkgFAwAAAAAACgkQsN6d1ii/Ey+N
cwf6A5JodOCKMstkXsJrdXzdeHtA5OQ8x6ry84sVpFd3GpNh/HjrmUuVIHlMTk7nKXqSAV4R+GxS
34wUcAhTpcginW3llmoEEOuUPnTt1iHlU1D6JtpV2qLoEXL2ivJ9KxAH/mDPVkLhceEXoLjNKhyk
86pHi5I/BhSOvv8FeqJatSbRqI9XZAPyySYYIRZ40kSu1r28cQkmH43BBLmTQeSQpi9SMjugREUa
2LSXcBvAS4l2YyFsoeHXOr6J0hMrNKpmppK0J5hYggcGcLQwcAG+bkhlTyQVQ9rDEF40siu0sXGD
lYD80q3bEoRoO8JRrp4+8gPAdtfr0owkp7caZZEhxQ==
=V0nf
-----END PGP SIGNATURE-----

--------------rFmTfN1Q5vtPk0yf06cc16dJ--

