Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77771666AFB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 06:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475822.737673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFqT3-0003Ea-37; Thu, 12 Jan 2023 05:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475822.737673; Thu, 12 Jan 2023 05:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFqT3-0003Cc-0E; Thu, 12 Jan 2023 05:49:37 +0000
Received: by outflank-mailman (input) for mailman id 475822;
 Thu, 12 Jan 2023 05:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pFqT1-0003CU-Hf
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 05:49:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e360f4a3-923c-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 06:49:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A944E3EBBA;
 Thu, 12 Jan 2023 05:49:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 822E5134AF;
 Thu, 12 Jan 2023 05:49:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JmJXHmyfv2MCLAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 12 Jan 2023 05:49:32 +0000
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
X-Inumbo-ID: e360f4a3-923c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673502572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jCSkJ2BEMY4Qzmv5UmWOj9GwhY8ENcdcUr+TNtTtszk=;
	b=KypXs4wS45T6CBlA84cK0fwR+ved3fP2bsUGeCpIr+vQXCnlWakSM4zfgsXPI1MpXPI/vb
	A/XgIGIUBLO5rdvtmgDZ9NiOKXE2dHPIN7lco/qTo5BSD6HEHRutra4UEOFd+xpmUgkEBt
	tzT7OqUT0Sqnt8RXRVrsqbSp5hHo5vw=
Message-ID: <7ba1b191-ef89-1e0d-0e1b-0b24159a9eb9@suse.com>
Date: Thu, 12 Jan 2023 06:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 10/19] tools/xenstore: change per-domain node
 accounting interface
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-11-jgross@suse.com>
 <da814fed-c177-b0ee-32be-ef0656692c82@xen.org>
 <05871696-1638-82d0-8d55-9088b4bb9a18@suse.com>
 <e9eeee72-ecd1-faaa-dc63-b57d50162bbf@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e9eeee72-ecd1-faaa-dc63-b57d50162bbf@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4Una2fEaNf807I0FAxj007AF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4Una2fEaNf807I0FAxj007AF
Content-Type: multipart/mixed; boundary="------------D1bTzj0mMMmwYj7UHgbYlVoj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <7ba1b191-ef89-1e0d-0e1b-0b24159a9eb9@suse.com>
Subject: Re: [PATCH v2 10/19] tools/xenstore: change per-domain node
 accounting interface
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-11-jgross@suse.com>
 <da814fed-c177-b0ee-32be-ef0656692c82@xen.org>
 <05871696-1638-82d0-8d55-9088b4bb9a18@suse.com>
 <e9eeee72-ecd1-faaa-dc63-b57d50162bbf@xen.org>
In-Reply-To: <e9eeee72-ecd1-faaa-dc63-b57d50162bbf@xen.org>

--------------D1bTzj0mMMmwYj7UHgbYlVoj
Content-Type: multipart/mixed; boundary="------------scW0k8HS13oUkWvjPCSjh6EM"

--------------scW0k8HS13oUkWvjPCSjh6EM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDEuMjMgMTg6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDExLzAxLzIwMjMgMDg6NTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4g
Li4uIHRvIG1ha2Ugc3VyZSBkb21haW5fbmJlbnRyeV9hZGQoKSBpcyBub3QgcmV0dXJuaW5n
IGEgbmVnYXRpdmUgdmFsdWUuIFRoZW4gDQo+Pj4gaXQgd291bGQgbm90IHdvcmsuDQo+Pj4N
Cj4+PiBBIGdvb2QgZXhhbXBsZSBpbWFnaW5lIHlvdSBoYXZlIGEgdHJhbnNhY3Rpb24gcmVt
b3Zpbmcgbm9kZXMgZnJvbSB0cmVlIGJ1dCANCj4+PiBub3QgYWRkaW5nIGFueS4gVGhlbiB0
aGUgInJldCIgd291bGQgYmUgbmVnYXRpdmUuDQo+Pj4NCj4+PiBNZWFud2hpbGUgdGhlIG5v
ZGVzIGFyZSBhbHNvIHJlbW92ZWQgb3V0c2lkZSBvZiB0aGUgdHJhbnNhY3Rpb24uIFNvIHRo
ZSBzdW0gDQo+Pj4gb2YgImQtPm5iZW50cnkgKyByZXQiIHdvdWxkIGJlIG5lZ2F0aXZlIHJl
c3VsdGluZyB0byBhIGZhaWx1cmUgaGVyZS4NCj4+DQo+PiBUaGFua3MgZm9yIGNhdGNoaW5n
IHRoaXMuDQo+Pg0KPj4gSSB0aGluayB0aGUgY29ycmVjdCB3YXkgdG8gaGFuZGxlIHRoaXMg
aXMgdG8gcmV0dXJuIG1heChkLT5uYmVudHJ5ICsgcmV0LCAwKSBpbg0KPj4gZG9tYWluX25i
ZW50cnlfYWRkKCkuIFRoZSB2YWx1ZSBtaWdodCBiZSBpbXByZWNpc2UsIGJ1dCBhbHdheXMg
Pj0gMCBhbmQgbmV2ZXINCj4+IHdyb25nIG91dHNpZGUgb2YgYSB0cmFuc2FjdGlvbiBjb2xs
aXNpb24uDQo+IA0KPiBJIGFtIGJpdCBjb25mdXNlZCB3aXRoIHlvdXIgcHJvcG9zYWwuIElm
IHRoZSByZXR1cm4gdmFsdWUgaXMgaW1wcmVjaXNlLCB0aGVuIA0KPiB3aGF0J3MgdGhlIHBv
aW50IG9mIHJldHVybmluZyBtYXgoLi4uKSBpbnN0ZWFkIG9mIHNpbXBseSAwPw0KDQpQbGVh
c2UgaGF2ZSBhIGxvb2sgYXQgdGhlIHVzZSBjYXNlIGVzcGVjaWFsbHkgaW4gZG9tYWluX25i
ZW50cnkoKS4gUmV0dXJuaW5nDQphbHdheXMgMCB3b3VsZCBjbGVhcmx5IGJyZWFrIHF1b3Rh
IGNoZWNrcy4NCg0KDQpKdWVyZ2VuDQo=
--------------scW0k8HS13oUkWvjPCSjh6EM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------scW0k8HS13oUkWvjPCSjh6EM--

--------------D1bTzj0mMMmwYj7UHgbYlVoj--

--------------4Una2fEaNf807I0FAxj007AF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO/n2wFAwAAAAAACgkQsN6d1ii/Ey8w
uwf+Im8UXjqCT06RyrHbhWgjkYeRYKz9lfPGAaD5qEMECYX7jFmE6/WKsNVlKOK5UKt37zRat2VL
ppqZm414mCaR+gAIxjBdIeN+2wWn+WvHKQt5m48REqXJb1S6LmEbUpWo482NonfnMOlR6mUVi+XF
OExG7VZAZ9DBFrVqkrYXonWvoh1gMzI3rMHsWxpv33piDfOp8wcHuvrES42ywYJ/72zg/d7DigI4
SWc4AihBlLV1chrdj6oBQLOvNq3Ojxhc+OhGRjiCNmvDD9PvlRE51nLK2lNYB1FFGmK9h5fksm3E
Bfscl4tKYcvTPyBTxEh8smhjG5KJKNk0FNSOFAaw1w==
=7sHy
-----END PGP SIGNATURE-----

--------------4Una2fEaNf807I0FAxj007AF--

