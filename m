Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26A6C6DE6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 17:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513975.795802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNzL-0008Ae-Ru; Thu, 23 Mar 2023 16:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513975.795802; Thu, 23 Mar 2023 16:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNzL-00088w-Nj; Thu, 23 Mar 2023 16:40:31 +0000
Received: by outflank-mailman (input) for mailman id 513975;
 Thu, 23 Mar 2023 16:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfNzK-00088q-4L
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 16:40:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ae6fcb7-c999-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 17:40:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9260E1FE07;
 Thu, 23 Mar 2023 16:40:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64567132C2;
 Thu, 23 Mar 2023 16:40:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KEfZFvuAHGRCUAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 16:40:27 +0000
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
X-Inumbo-ID: 6ae6fcb7-c999-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679589627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8JmWYs218CJkET5pLUP2ycIM0iwiFIFOGiRvj+uu0SM=;
	b=bTf5RrlkI8l6513pk7q3ViMD3ihr4ZpRlu5BUjBRagObvneWx3j4zxj3mqVUi4S4UNyD/V
	kqS8w3y8ZY+uhqrf2RI2+pxDWT9aHfueYrOS2WL50uazbxGQ+VnWN2/ym3Asmf9MgABGFJ
	58EZYl187Z80cMWvWOyvQOi4Kykb2b4=
Message-ID: <55af029a-99bb-f931-34ff-f0b9ce91da3c@suse.com>
Date: Thu, 23 Mar 2023 17:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <osstest-179607-mainreport@xen.org>
 <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
 <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>
 <fe65b5ae-f5db-0726-650d-173826679f2c@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <fe65b5ae-f5db-0726-650d-173826679f2c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6n0cp2gb30ulTVp8XoqpyacS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6n0cp2gb30ulTVp8XoqpyacS
Content-Type: multipart/mixed; boundary="------------7t43iJSaBoBGK5U0jRSlIQXL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <55af029a-99bb-f931-34ff-f0b9ce91da3c@suse.com>
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
References: <osstest-179607-mainreport@xen.org>
 <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
 <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>
 <fe65b5ae-f5db-0726-650d-173826679f2c@suse.com>
In-Reply-To: <fe65b5ae-f5db-0726-650d-173826679f2c@suse.com>

--------------7t43iJSaBoBGK5U0jRSlIQXL
Content-Type: multipart/mixed; boundary="------------0bYVsKOGxAlJibzNiN825TJe"

--------------0bYVsKOGxAlJibzNiN825TJe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjMgMTc6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wMy4yMDIz
IDE2OjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTQuMDMuMjMgMTQ6MjcsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMTQuMDMuMjMgMTM6NTIsIG9zc3Rlc3Qgc2Vy
dmljZSBvd25lciB3cm90ZToNCj4+Pj4gZmxpZ2h0IDE3OTYwNyBsaW51eC1saW51cyByZWFs
IFtyZWFsXQ0KPj4+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0
ZXN0L2xvZ3MvMTc5NjA3Lw0KPj4+Pg0KPj4+PiBSZWdyZXNzaW9ucyA6LSgNCj4+Pj4NCj4+
Pj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsDQo+Pj4+
IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOg0KPj4+PiAgwqAgdGVz
dC1hbWQ2NC1hbWQ2NC1mcmVlYnNkMTItYW1kNjQgMTMgZ3Vlc3Qtc3RhcnTCoMKgwqDCoMKg
wqDCoMKgwqAgZmFpbCBSRUdSLiB2cy4gMTc4MDQyDQo+Pj4+ICDCoCB0ZXN0LWFtZDY0LWFt
ZDY0LXhsLWNyZWRpdDHCoCAxOSBndWVzdC1zYXZlcmVzdG9yZS4ywqDCoMKgwqDCoCBmYWls
IFJFR1IuIHZzLiAxNzgwNDINCj4+Pj4gIMKgIHRlc3QtYW1kNjQtYW1kNjQteGwtc2hhZG93
wqDCoCAxNCBndWVzdC1zdGFydMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVH
Ui4gdnMuIDE3ODA0Mg0KPj4+DQo+Pj4gLi4uDQo+Pj4NCj4+PiBJbiB0aGUgbG9ncyBbMV0g
SSdtIHNlZWluZyBlcnJvcnMgbGlrZToNCj4+Pg0KPj4+IE1hciAxMyAyMzo1MToyNi4yNzU0
MjEgW8KgIDI3MS43MTM3NDBdIHhlbmJyMDogcG9ydCAyKHZpZjEuMCkgZW50ZXJlZCBmb3J3
YXJkaW5nDQo+Pj4gc3RhdGUNCj4+PiBNYXIgMTMgMjM6NTE6MjYuMjg3MzQ2IChYRU4pIGNv
bW1vbi9ncmFudF90YWJsZS5jOjI5ODI6ZDB2MyBjb3B5IGJleW9uZCBwYWdlIGFyZWENCj4+
PiBNYXIgMTMgMjM6NTE6NDguMTE1MzgzIChYRU4pIGNvbW1vbi9ncmFudF90YWJsZS5jOjI5
ODI6ZDB2MyBjb3B5IGJleW9uZCBwYWdlIGFyZWENCj4+PiBNYXIgMTMgMjM6NTE6NDkuMTIz
MzQ3IChYRU4pIGNvbW1vbi9ncmFudF90YWJsZS5jOjI5ODI6ZDB2MyBjb3B5IGJleW9uZCBw
YWdlIGFyZWENCj4+PiBNYXIgMTMgMjM6NTE6NDkuNDU5MzY3IChYRU4pIGNvbW1vbi9ncmFu
dF90YWJsZS5jOjI5ODI6ZDB2MyBjb3B5IGJleW9uZCBwYWdlIGFyZWENCj4+Pg0KPj4+IEdp
dmVuIHRoZSB2aWYgcmVsYXRlZCBtZXNzYWdlIGRpcmVjdGx5IGJlZm9yZSB0aG9zZSBlcnJv
cnMgdGhlIGNoYW5jZSBpcyBoaWdoDQo+Pj4gdGhpcyBwcm9ibGVtIGlzIHJlbGF0ZWQgdG8g
bmV0YmFjay4NCj4+Pg0KPj4+IFJvc3MsIHlvdXIgcGF0Y2ggInhlbi9uZXRiYWNrOiBFbnN1
cmUgcHJvdG9jb2wgaGVhZGVycyBkb24ndCBmYWxsIGluIHRoZQ0KPj4+IG5vbi1saW5lYXIg
YXJlYSIgKHVwc3RyZWFtIGNvbW1pdCBhZDdmNDAyYWU0ZjQ2NjYpIGRpZCB0aGUgbW9zdCBy
ZWNlbnQgY2hhbmdlcw0KPj4+IGluIG5ldGJhY2sgYWZmZWN0aW5nIEdOVFRBQk9QX2NvcHkg
b3BlcmF0aW9ucy4gVGhlcmUgYXJlIHByb2JhYmx5IHBhZ2UgYm91bmRhcnkNCj4+PiBjaGVj
a3MgKHByb2JhYmx5IG9uIG5ldGJhY2sgc2lkZSkgbWlzc2luZy4gQ291bGQgeW91IHBsZWFz
ZSBoYXZlIGEgbG9vaz8NCj4+DQo+PiBPa2F5LCBJJ3ZlIGhhZCBhIHRyeSAoc2VlIGF0dGFj
aGVkIHBhdGNoKS4NCj4gDQo+IEp1c3Qgb25lIHJlbWFyazogRG9uJ3QgeW91IG5lZWQgdG8g
dXNlIFhFTl9QQUdFX1NJWkUgaW4gcGxhY2Ugb2YgUEFHRV9TSVpFPw0KDQpBaCwgeWVzLCBi
dXQgZm9yIHRoZSB0ZXN0IHRoaXMgc2hvdWxkbid0IG1hdHRlci4NCg0KDQpKdWVyZ2VuDQo=

--------------0bYVsKOGxAlJibzNiN825TJe
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0bYVsKOGxAlJibzNiN825TJe--

--------------7t43iJSaBoBGK5U0jRSlIQXL--

--------------6n0cp2gb30ulTVp8XoqpyacS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQcgPoFAwAAAAAACgkQsN6d1ii/Ey/C
PQf/cwBxIDSVGElR9E8m1WCoyYMGACSPVKVxCMoShYUDjxUO8HhIq4KczgQ1LGvBOWjhDOZSRFLS
Z9cXM1LVQE3zUWCzkmGAnVrOYcFWsHwXPWRpkAgCeDB2+muVh8Ri+OGsLhxHcuET4zZc0yIZ4jw9
RJk2iKNI2pOpQHNAPBefTF3WEGtYp8zD//cNZlJww6aBRgyAXfyn73Fq5NKGH4BQ1lG7zBhMYTk3
2QlLf8X0fYm88MXSiPVGY2utTb1lMKY5WrP0OiQwg930weM0OzKVJsrXI2T/VigijB1DY+Euau1W
Cey4Y+75nbJDWAjFF7leNl2m1RaHvuUZGp4HsxVXRQ==
=9ERv
-----END PGP SIGNATURE-----

--------------6n0cp2gb30ulTVp8XoqpyacS--

