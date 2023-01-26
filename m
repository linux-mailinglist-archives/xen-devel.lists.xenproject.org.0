Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24067CB3C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485036.751970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1fm-0008Km-9Z; Thu, 26 Jan 2023 12:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485036.751970; Thu, 26 Jan 2023 12:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1fm-0008J3-5h; Thu, 26 Jan 2023 12:48:10 +0000
Received: by outflank-mailman (input) for mailman id 485036;
 Thu, 26 Jan 2023 12:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WJ2g=5X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pL1fk-0008Iv-Eh
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 12:48:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa36da72-9d77-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 13:48:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9DAD1FF65;
 Thu, 26 Jan 2023 12:48:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C316213A09;
 Thu, 26 Jan 2023 12:48:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fSzXLYV20mOzSwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 26 Jan 2023 12:48:05 +0000
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
X-Inumbo-ID: aa36da72-9d77-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674737285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xUpmI9iYBy7d/T2ZPrcHnej9OUVSQnMndyr9lRWTEWY=;
	b=rS9ITiznH+SkERQkDiPLRyTNH4/grMZmtjQ96/HtPHauz6Pt2eqThkSsL2J2g6V9NZCjHC
	Knf08M3UMOKO30jGrQmHEgXzbegzXksc+CaxdF8BxwVK7N1AYBzl4KVuXKDiC2Zv/9J3xN
	nJU7cdXO+SXCPakD+247zFkjeKWnjbo=
Message-ID: <17b8673a-2c31-1ed8-4bda-ab514ad7ad5a@suse.com>
Date: Thu, 26 Jan 2023 13:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tools/helpers: don't log errors when trying to load PVH
 xenstore-stubdom
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230126122406.14627-1-jgross@suse.com>
 <c80da13e-32c1-0499-de91-67cabc3a495e@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c80da13e-32c1-0499-de91-67cabc3a495e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Iiyi6dtwAAeART1IBbWE5c18"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Iiyi6dtwAAeART1IBbWE5c18
Content-Type: multipart/mixed; boundary="------------5dA2ampjOGOPtEPY3t84EbHh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <17b8673a-2c31-1ed8-4bda-ab514ad7ad5a@suse.com>
Subject: Re: [PATCH] tools/helpers: don't log errors when trying to load PVH
 xenstore-stubdom
References: <20230126122406.14627-1-jgross@suse.com>
 <c80da13e-32c1-0499-de91-67cabc3a495e@suse.com>
In-Reply-To: <c80da13e-32c1-0499-de91-67cabc3a495e@suse.com>

--------------5dA2ampjOGOPtEPY3t84EbHh
Content-Type: multipart/mixed; boundary="------------4kPHOl7zIIYgX19W0LaRaMTU"

--------------4kPHOl7zIIYgX19W0LaRaMTU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDEuMjMgMTM6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wMS4yMDIz
IDEzOjI0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBsb2FkaW5nIGEgWGVuc3Rv
cmUgc3R1YmRvbSB0aGUgbG9hZGVyIGRvZXNuJ3Qga25vdyB3aGV0aGVyIHRoZQ0KPj4gbG8g
YmUgbG9hZGVkIGtlcm5lbCBpcyBhIFBWSCBvciBhIFBWIG9uZS4gU28gaXQgdHJpZXMgdG8g
bG9hZCBpdCBhcw0KPj4gYSBQVkggb25lIGZpcnN0LCBhbmQgaWYgdGhpcyBmYWlscyBpdCBp
cyBsb2FkaW5nIGl0IGFzIGEgUFYga2VybmVsLg0KPj4NCj4+IFRoaXMgcmVzdWx0cyBpbiBl
cnJvcnMgYmVpbmcgbG9nZ2VkIGluIGNhc2UgdGhlIHN0dWJkb20gaXMgYSBQViBrZXJuZWwu
DQo+Pg0KPj4gU3VwcHJlc3MgdGhvc2UgZXJyb3JzIGJ5IHNldHRpbmcgdGhlIG1pbmltdW0g
bG9nZ2luZyBsZXZlbCB0bw0KPj4gImNyaXRpY2FsIiB3aGlsZSB0cnlpbmcgdG8gbG9hZCB0
aGUga2VybmVsIGFzIFBWSC4NCj4gDQo+IEFuZCBpZiB0aGUgUFYgbG9hZGluZyBhbHNvIGZh
aWxzIGFuZCBQVkggd2FzIGFjdHVhbGx5IGV4cGVjdGVkLCB0aGVuIHRoZQ0KPiBtZXNzYWdl
cyB3aWxsIGJlIGhlYXZpbHkgbWlzbGVhZGluZz8gU2hvdWxkbid0IHlvdSBpbnN0ZWFkIGFj
Y3VtdWxhdGUgdGhlDQo+IFBWSCBtZXNzYWdlcywgYW5kIHRocm93IHRoZW0gYXdheSBvbmx5
IGluIGNhc2UgUFYgbG9hZGluZyBhY3R1YWxseSB3b3JrZWQNCj4gKG9yIGlzc3VlIHRoZW0g
YXQgbG93ZXIgc2V2ZXJpdHksIGluIGNhc2UgdGhleSdyZSBhY3R1YWxseSBvZiBpbnRlcmVz
dCk/DQoNCkkgdGhpbmsgdGhpcyB3b3VsZCBhZGQgYSBsb3Qgb2YgY29kZSBmb3IgbGl0dGxl
IGdhaW4uDQoNCldoYXQgSSBjb3VsZCBkbyBpcyB0byByZXBlYXQgdGhlIFBWSCBsb2FkIGF0
dGVtcHQgd2l0aCBmdWxsIGxvZ2dpbmcgaWYgdGhlDQpQViBsb2FkIGZhaWxzLCB0b28uDQoN
Cg0KSnVlcmdlbg0K
--------------4kPHOl7zIIYgX19W0LaRaMTU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4kPHOl7zIIYgX19W0LaRaMTU--

--------------5dA2ampjOGOPtEPY3t84EbHh--

--------------Iiyi6dtwAAeART1IBbWE5c18
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPSdoUFAwAAAAAACgkQsN6d1ii/Ey9t
2gf/UCiXQXWpzH4Ar2bKpI8jkrC5cZNZwotDdDVRArKFu+GP9NtvvsRLFcXMR7OxrvudnRVSlfQI
eZRl8Ob/f/LA8ABqXu/5SkO32efiQibAUC+jPOiNlOlL6r6LlF0pnDlC05p06UnLuJ5Qq3dVKHqH
CqVz9EZkFOASCZNV9SWmsRmPKWa5N5WNSW8H/t+YxQJ6ie43GSE/3fWMfRyaJEksF+wTD2rcXoeY
AFxifUNCHsPHsWqaghkRbNJh1o9v7r6D/i8bTDpBOyze2iOin2LTKRiFxZbtiPiVBNKLde+3UDUj
BOMAmfuSwe5tczedqRKl7LSEu4tejvNEyVjYjD2hGQ==
=CVg0
-----END PGP SIGNATURE-----

--------------Iiyi6dtwAAeART1IBbWE5c18--

