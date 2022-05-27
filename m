Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3BF536377
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 15:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338071.562819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuaIE-0005Rs-QQ; Fri, 27 May 2022 13:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338071.562819; Fri, 27 May 2022 13:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuaIE-0005Pa-NP; Fri, 27 May 2022 13:46:18 +0000
Received: by outflank-mailman (input) for mailman id 338071;
 Fri, 27 May 2022 13:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nuaIC-0005PR-V8
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 13:46:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60863a8b-ddc3-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 15:46:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 884771F460;
 Fri, 27 May 2022 13:46:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30ADF139C4;
 Fri, 27 May 2022 13:46:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L+OyCSbWkGItTgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 May 2022 13:46:14 +0000
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
X-Inumbo-ID: 60863a8b-ddc3-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653659174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/DlYf7tU7F/Vu2fbHo8Rd3nV/4jGmq37Bvumm1ygGeg=;
	b=tLztS/TtyBtr0h9Du3Wut/72stfQVml8ZpSX3ZZCQ1qSqtchnMYlLw1yh+9B1iA+rfD+7q
	/YMUdeb3Ixu/Ck0HDdW9TXfIJy1B6o+MUCHNZyTcM1PQKlTOES0rGiCQrLutjSOiWC2T5X
	kY4h71QB3jrVGXfmET/dPqdP6HseqPc=
Message-ID: <91a372cb-2e4c-e738-a6bd-d65189bcd194@suse.com>
Date: Fri, 27 May 2022 15:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tools/libxl: optimize domain creation skipping domain
 cpupool move
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com, andrew.cooper3@citrix.com,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220526081230.3194-1-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220526081230.3194-1-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p2iyBy8O0HkBIDt478YptPQm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p2iyBy8O0HkBIDt478YptPQm
Content-Type: multipart/mixed; boundary="------------p1x56kwc0ip1JhHnMnRqFqxw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com, andrew.cooper3@citrix.com,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <91a372cb-2e4c-e738-a6bd-d65189bcd194@suse.com>
Subject: Re: [PATCH] tools/libxl: optimize domain creation skipping domain
 cpupool move
References: <20220526081230.3194-1-luca.fancellu@arm.com>
In-Reply-To: <20220526081230.3194-1-luca.fancellu@arm.com>

--------------p1x56kwc0ip1JhHnMnRqFqxw
Content-Type: multipart/mixed; boundary="------------mo8eIL20T3s0RXOib0s410JB"

--------------mo8eIL20T3s0RXOib0s410JB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDUuMjIgMTA6MTIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IENvbW1pdCA5MmVh
OWM1NGZjODEgKCJhcm0vZG9tMGxlc3M6IGFzc2lnbiBkb20wbGVzcyBndWVzdHMgdG8gY3B1
cG9vbHMiKQ0KPiBpbnRyb2R1Y2VkIGEgd2F5IHRvIHN0YXJ0IGEgZG9tYWluIGRpcmVjdGx5
IG9uIGEgY2VydGFpbiBjcHVwb29sLA0KPiBhZGRpbmcgYSAiY3B1cG9vbF9pZCIgbWVtYmVy
IHRvIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbi4NCj4gDQo+IFRoaXMgd2FzIGRv
bmUgdG8gYmUgYWJsZSB0byBzdGFydCBkb20wbGVzcyBndWVzdHMgaW4gZGlmZmVyZW50IHBv
b2xzIHRoYW4NCj4gY3B1cG9vbDAsIGJ1dCB0aGUgdG9vbHN0YWNrIGNhbiBiZW5lZml0IGZy
b20gaXQgYmVjYXVzZSBpdCBjYW4gbm93IHVzZQ0KPiB0aGUgc3RydWN0IG1lbWJlciBkaXJl
Y3RseSBpbnN0ZWFkIG9mIGNyZWF0aW5nIHRoZSBndWVzdCBpbiBjcHVwb29sMA0KPiBhbmQg
dGhlbiBtb3ZpbmcgaXQgdG8gdGhlIHRhcmdldCBjcHVwb29sLg0KPiANCj4gU3VnZ2VzdGVk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNClJl
dmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdl
bg0K
--------------mo8eIL20T3s0RXOib0s410JB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mo8eIL20T3s0RXOib0s410JB--

--------------p1x56kwc0ip1JhHnMnRqFqxw--

--------------p2iyBy8O0HkBIDt478YptPQm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKQ1iUFAwAAAAAACgkQsN6d1ii/Ey/A
PQgAkEiwfcJjyC3/fAD0DWZHhp8aMslM9fO9WwSBjpPdpYw4O0qBv1crW4oQwoO5ZgdEosZ8/LZg
H8d4PBzZLz75LfQbJuCOI7xFGoeMU2899L/cPPZfR1BSd8WTWmewr73U0fQ27We58GbeXd6M/4QI
QsxBIJ+xszwOQGWdvcwH/nx30QJETRtNyVCrQ+uA1HkrozWL+gfHS8In+5EliRVf7vd/N5VFMcw6
w74xhmOco63Oyo+/YXhPF5nslfhPHcmol1BVAJrbM4T+V/+WZCopMTiThZEytEWaKDfIKfB1dmax
YhnhqcybJiRSS9gYw4Ip8yu298VOONUWwG6vJ+T6Ow==
=vxCM
-----END PGP SIGNATURE-----

--------------p2iyBy8O0HkBIDt478YptPQm--

