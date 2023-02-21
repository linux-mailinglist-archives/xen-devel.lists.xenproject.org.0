Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0666169DC3E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 09:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498585.769471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOC5-0000Ko-7m; Tue, 21 Feb 2023 08:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498585.769471; Tue, 21 Feb 2023 08:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOC5-0000IZ-2y; Tue, 21 Feb 2023 08:40:13 +0000
Received: by outflank-mailman (input) for mailman id 498585;
 Tue, 21 Feb 2023 08:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7VW=6R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pUOC3-0000H9-Nc
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 08:40:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59528632-b1c3-11ed-93b5-47a8fe42b414;
 Tue, 21 Feb 2023 09:40:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 28C7B5BCDA;
 Tue, 21 Feb 2023 08:40:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07E4913481;
 Tue, 21 Feb 2023 08:40:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QDuQAGmD9GOqDwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Feb 2023 08:40:09 +0000
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
X-Inumbo-ID: 59528632-b1c3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676968809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVj+S+9O0XAa50nQrlGTfSdtbSxPFmvteyGHO25cHaY=;
	b=TqDDVgbzG0cX3za3fTDCXIaKPTG/cu1EsU2eDPUvOeAGvLxOuQE4gYrmlXm1L1fi33qV7i
	fi1EJvaZaB5wmceGcGwEHbmTo3U3kh3DaDrCypy2lzzzvbHPD/ND9dTWuR4ZEodJfXJaT1
	RSjb3GfP0AhZ0638ATY1JpF1XrkYDNQ=
Message-ID: <f035f5c0-3eed-d4f4-ef86-08453c721643@suse.com>
Date: Tue, 21 Feb 2023 09:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 08/13] tools/xenstore: add accounting trace support
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-9-jgross@suse.com>
 <b1cc767e-b3c0-f021-f386-27bcde3cc5c9@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b1cc767e-b3c0-f021-f386-27bcde3cc5c9@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tpdcmIIbp3DuPDGz0tqqr1Pi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tpdcmIIbp3DuPDGz0tqqr1Pi
Content-Type: multipart/mixed; boundary="------------aZ2uO5maWYzDWZrcwhYTtdW9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <f035f5c0-3eed-d4f4-ef86-08453c721643@suse.com>
Subject: Re: [PATCH v2 08/13] tools/xenstore: add accounting trace support
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-9-jgross@suse.com>
 <b1cc767e-b3c0-f021-f386-27bcde3cc5c9@xen.org>
In-Reply-To: <b1cc767e-b3c0-f021-f386-27bcde3cc5c9@xen.org>

--------------aZ2uO5maWYzDWZrcwhYTtdW9
Content-Type: multipart/mixed; boundary="------------4FztCrEWTm70OZMaEE0Z2UV9"

--------------4FztCrEWTm70OZMaEE0Z2UV9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjMgMjM6NTcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIwLzAxLzIwMjMgMTA6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgYSBuZXcgdHJhY2Ugc3dpdGNoICJhY2MiIGFuZCB0aGUgcmVsYXRlZCB0cmFjZSBjYWxs
cy4NCj4+DQo+PiBUaGUgImFjYyIgc3dpdGNoIGlzIG9mZiBwZXIgZGVmYXVsdC4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0K
PiBXaXRoIG9uZSByZWFtcmsgKHNlZSBiZWxvdyk6DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVs
aWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+PiAtLS0NCj4+IMKgIHRvb2xz
L3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmPCoMKgIHzCoCAyICstDQo+PiDCoCB0b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5owqDCoCB8wqAgMSArDQo+PiDCoCB0b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgfCAxMCArKysrKysrKysrDQo+PiDCoCAzIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyBiL3Rvb2xzL3hlbnN0
b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IGluZGV4IDZlZjYwMTc5ZmEuLjU1OGVmNDkxYjEg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiAr
KysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBAQCAtMjc0Niw3ICsy
NzQ2LDcgQEAgc3RhdGljIHZvaWQgc2V0X3F1b3RhKGNvbnN0IGNoYXIgKmFyZywgYm9vbCBz
b2Z0KQ0KPj4gwqAgLyogU29ydGVkIGJ5IGJpdCB2YWx1ZXMgb2YgVFJBQ0VfKiBmbGFncy4g
RmxhZyBpcyAoMXUgPDwgaW5kZXgpLiAqLw0KPj4gwqAgY29uc3QgY2hhciAqY29uc3QgdHJh
Y2Vfc3dpdGNoZXNbXSA9IHsNCj4+IC3CoMKgwqAgIm9iaiIsICJpbyIsICJ3cmwiLA0KPj4g
K8KgwqDCoCAib2JqIiwgImlvIiwgIndybCIsICJhY2MiLA0KPj4gwqDCoMKgwqDCoCBOVUxM
DQo+PiDCoCB9Ow0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9j
b3JlLmggYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oDQo+PiBpbmRleCAxZjgx
MWYzOGNiLi4zZTA3MzRhNmM2IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvcmUuaA0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUu
aA0KPj4gQEAgLTMwMiw2ICszMDIsNyBAQCBleHRlcm4gdW5zaWduZWQgaW50IHRyYWNlX2Zs
YWdzOw0KPj4gwqAgI2RlZmluZSBUUkFDRV9PQkrCoMKgwqAgMHgwMDAwMDAwMQ0KPj4gwqAg
I2RlZmluZSBUUkFDRV9JT8KgwqDCoCAweDAwMDAwMDAyDQo+PiDCoCAjZGVmaW5lIFRSQUNF
X1dSTMKgwqDCoCAweDAwMDAwMDA0DQo+PiArI2RlZmluZSBUUkFDRV9BQ0PCoMKgwqAgMHgw
MDAwMDAwOA0KPj4gwqAgZXh0ZXJuIGNvbnN0IGNoYXIgKmNvbnN0IHRyYWNlX3N3aXRjaGVz
W107DQo+PiDCoCBpbnQgc2V0X3RyYWNlX3N3aXRjaChjb25zdCBjaGFyICphcmcpOw0KPj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyANCj4+IGIv
dG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jDQo+PiBpbmRleCBiMWUyOWVkYjdl
Li5kNDYxZmQ4Y2M4IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2RvbWFpbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMN
Cj4+IEBAIC01MzgsNiArNTM4LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgZG9tYWluICpmaW5kX2Rv
bWFpbl9ieV9kb21pZCh1bnNpZ25lZCBpbnQgDQo+PiBkb21pZCkNCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIChkICYmIGQtPmludHJvZHVjZWQpID8gZCA6IE5VTEw7DQo+PiDCoCB9DQo+PiAr
I2RlZmluZSB0cmFjZV9hY2MoLi4uKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
DQo+IA0KPiBUaGUgaW5kZW50YXRpb24gb2YgJ1wnIGxvb2tzIG9kZC4NCg0KTm90IGZvciBt
ZS4gTWF5YmUgeW91IGhhdmUgYSBkaWZmZXJlbnQgdGFiIHNldHRpbmc/DQoNCg0KSnVlcmdl
bg0K
--------------4FztCrEWTm70OZMaEE0Z2UV9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4FztCrEWTm70OZMaEE0Z2UV9--

--------------aZ2uO5maWYzDWZrcwhYTtdW9--

--------------tpdcmIIbp3DuPDGz0tqqr1Pi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP0g2gFAwAAAAAACgkQsN6d1ii/Ey8p
HAgAns+NYkN19/sL14OUP+Q+TvofMc3g4mYVDuFNGU/LH+iBT5wyEPJa7uGBGWsLYdE8AgAfncPE
BXqNWQ54ZJmVsZ5oMthGCdhrvYd1Glmk8OVQ1E2WGKONM2JFCgY06xrrbCniZ91Yyk4V6Vkj79Ws
04lcYTkEtviG7FSknJQJgOiUK8gASaXfNpp2gMTKfnyKLkG4A95s2+0ESO3M9JJ/47aMCoMzyWCP
8JQ7TfXaS4I6wJbSIJTTXUcdHs0BL/yVZZJiLExYtD8a4RKoCCqZe/0SMZW6qzxc+K5PnfKH6i6a
7vjRiNL0A9K/fVd81MgUKE4EZIyPRJffV1qmrCYgeQ==
=1u+W
-----END PGP SIGNATURE-----

--------------tpdcmIIbp3DuPDGz0tqqr1Pi--

