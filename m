Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2266938E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477021.739517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGop-0007zL-JP; Fri, 13 Jan 2023 09:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477021.739517; Fri, 13 Jan 2023 09:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGop-0007xB-Ei; Fri, 13 Jan 2023 09:57:51 +0000
Received: by outflank-mailman (input) for mailman id 477021;
 Fri, 13 Jan 2023 09:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pGGoo-0007x5-3T
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:57:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbbdf79a-9328-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 10:57:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF21E253AF;
 Fri, 13 Jan 2023 09:57:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E96013913;
 Fri, 13 Jan 2023 09:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t5SKIRorwWPaBgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Jan 2023 09:57:46 +0000
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
X-Inumbo-ID: bbbdf79a-9328-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673603866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=boXpsw2LAjhiHUbAzcspld7diNzrPJHZXzIePBCgJ4s=;
	b=VnaRTYVKUW9q/wnKbVGV6jaSlnvYjmVclpbsy3kxXTMXb843dEqtyiuOgkBeGhAIPnD71l
	y1bh7SZhYOhMv/wfxg9bMSVMT79Y+fe63P9CwYIcIwxnWtotp3LXNsdmg6C5T2SKAptu8p
	bsq/pl3DTF+H2rgmkMZgbbCSixaOKXA=
Message-ID: <b7c26a7b-0db9-61f2-df4c-6aed325927a5@suse.com>
Date: Fri, 13 Jan 2023 10:57:46 +0100
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
 <7ba1b191-ef89-1e0d-0e1b-0b24159a9eb9@suse.com>
 <009d00d8-4ba9-167d-271f-0dde655415fa@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <009d00d8-4ba9-167d-271f-0dde655415fa@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Uyeak0oqpO00idGXm6iMd0du"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Uyeak0oqpO00idGXm6iMd0du
Content-Type: multipart/mixed; boundary="------------5Mf4DjpLiz3hlP5CwQzejHyR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b7c26a7b-0db9-61f2-df4c-6aed325927a5@suse.com>
Subject: Re: [PATCH v2 10/19] tools/xenstore: change per-domain node
 accounting interface
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-11-jgross@suse.com>
 <da814fed-c177-b0ee-32be-ef0656692c82@xen.org>
 <05871696-1638-82d0-8d55-9088b4bb9a18@suse.com>
 <e9eeee72-ecd1-faaa-dc63-b57d50162bbf@xen.org>
 <7ba1b191-ef89-1e0d-0e1b-0b24159a9eb9@suse.com>
 <009d00d8-4ba9-167d-271f-0dde655415fa@xen.org>
In-Reply-To: <009d00d8-4ba9-167d-271f-0dde655415fa@xen.org>

--------------5Mf4DjpLiz3hlP5CwQzejHyR
Content-Type: multipart/mixed; boundary="------------AwP04EUSeiwXsn7hEGlUf8M0"

--------------AwP04EUSeiwXsn7hEGlUf8M0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDEuMjMgMTA6NTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEyLzAxLzIwMjMgMDU6NDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxMS4wMS4yMyAxODo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxMS8wMS8yMDIzIDA4OjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+Pj4gLi4uIHRvIG1ha2Ugc3VyZSBkb21haW5fbmJlbnRyeV9hZGQoKSBpcyBub3QgcmV0
dXJuaW5nIGEgbmVnYXRpdmUgdmFsdWUuIA0KPj4+Pj4gVGhlbiBpdCB3b3VsZCBub3Qgd29y
ay4NCj4+Pj4+DQo+Pj4+PiBBIGdvb2QgZXhhbXBsZSBpbWFnaW5lIHlvdSBoYXZlIGEgdHJh
bnNhY3Rpb24gcmVtb3Zpbmcgbm9kZXMgZnJvbSB0cmVlIGJ1dCANCj4+Pj4+IG5vdCBhZGRp
bmcgYW55LiBUaGVuIHRoZSAicmV0IiB3b3VsZCBiZSBuZWdhdGl2ZS4NCj4+Pj4+DQo+Pj4+
PiBNZWFud2hpbGUgdGhlIG5vZGVzIGFyZSBhbHNvIHJlbW92ZWQgb3V0c2lkZSBvZiB0aGUg
dHJhbnNhY3Rpb24uIFNvIHRoZSBzdW0gDQo+Pj4+PiBvZiAiZC0+bmJlbnRyeSArIHJldCIg
d291bGQgYmUgbmVnYXRpdmUgcmVzdWx0aW5nIHRvIGEgZmFpbHVyZSBoZXJlLg0KPj4+Pg0K
Pj4+PiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuDQo+Pj4+DQo+Pj4+IEkgdGhpbmsgdGhl
IGNvcnJlY3Qgd2F5IHRvIGhhbmRsZSB0aGlzIGlzIHRvIHJldHVybiBtYXgoZC0+bmJlbnRy
eSArIHJldCwgMCkgaW4NCj4+Pj4gZG9tYWluX25iZW50cnlfYWRkKCkuIFRoZSB2YWx1ZSBt
aWdodCBiZSBpbXByZWNpc2UsIGJ1dCBhbHdheXMgPj0gMCBhbmQgbmV2ZXINCj4+Pj4gd3Jv
bmcgb3V0c2lkZSBvZiBhIHRyYW5zYWN0aW9uIGNvbGxpc2lvbi4NCj4+Pg0KPj4+IEkgYW0g
Yml0IGNvbmZ1c2VkIHdpdGggeW91ciBwcm9wb3NhbC4gSWYgdGhlIHJldHVybiB2YWx1ZSBp
cyBpbXByZWNpc2UsIHRoZW4gDQo+Pj4gd2hhdCdzIHRoZSBwb2ludCBvZiByZXR1cm5pbmcg
bWF4KC4uLikgaW5zdGVhZCBvZiBzaW1wbHkgMD8NCj4+DQo+PiBQbGVhc2UgaGF2ZSBhIGxv
b2sgYXQgdGhlIHVzZSBjYXNlIGVzcGVjaWFsbHkgaW4gZG9tYWluX25iZW50cnkoKS4gUmV0
dXJuaW5nDQo+PiBhbHdheXMgMCB3b3VsZCBjbGVhcmx5IGJyZWFrIHF1b3RhIGNoZWNrcy4N
Cj4gDQo+IEkgYW0gYSBiaXQgY29uY2VybmVkIHRoYXQgd2Ugd291bGQgaGF2ZSBhIGNvZGUg
Y2hlY2tpbmcgdGhlIHF1b3RhIGJhc2VkIG9uIGFuIA0KPiBpbXByZWNpc2UgdmFsdWUuDQo+
IA0KPiBBdCB0aGUgbW9tZW50LCBJIGRvbid0IGhhdmUgYSBiZXR0ZXIgc3VnZ2VzdGlvbi4g
QnV0IHdlIHNob3VsZCBhdCBsZWFzdCBkb2N1bWVudCANCj4gaW4gdGhlIGNvZGUgd2hlbiB3
ZSB0aGluayB0aGUgdmFsdWUgaXMgaW1wcmVjaXNlIGFuZCBleHBsYWluIHdoeSBieXBhc3Np
bmcgdGhlIA0KPiBxdW90YSBjaGVjayBpcyBPSyAoSU9XIHdobyB3aWxsIGNoZWNrIGl0Pyku
DQoNClRoZSBpbXByZWNpc2UgdmFsdWUgd2lsbCBuZXZlciBiZSB0b28gbG93LCBpdCBjYW4g
b25seSBiZSB0b28gaGlnaCAoaS5lLiAwDQppbnN0ZWFkIG9mIG5lZ2F0aXZlKSwgYW5kIHRo
YXQgd2lsbCBvbmx5IGhhcHBlbiBpbiBhIHRyYW5zYWN0aW9uIHdoaWNoIGNhbid0DQpzdWNj
ZWVkLg0KDQpBZGRpbmcgYSBjb21tZW50IGlzIGdvb2QgaWRlYSwgdGhvdWdoLg0KDQoNCkp1
ZXJnZW4NCg0K
--------------AwP04EUSeiwXsn7hEGlUf8M0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------AwP04EUSeiwXsn7hEGlUf8M0--

--------------5Mf4DjpLiz3hlP5CwQzejHyR--

--------------Uyeak0oqpO00idGXm6iMd0du
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPBKxoFAwAAAAAACgkQsN6d1ii/Ey8D
3gf+M3w+cEW9DbgNQ1jyjEnPNnUyObjc9ANE4P7zjDWq0LU7tNeKt1SoDjIj+SCKCD7bXTT6JuC3
PGVHcfPn1EXal8ud7Ej4FANsyo4UplNU1XnlPkVBfTsG2jRSBVb2I0liJy0aX23I1BkRG6TqIn/l
C79CprcxtysJuuLxxfdB3WQ2G6owdzvm7NxgJcAjFN4wYCIv5TxSnIaihTQu1npsRyZLzAT7Ta+v
9gSTNtInkzSvNR5F11SvsvW3JyywFWUvnA4kZxXGY1BJG2GZ54t8gmv3ZEUs+5OguYmE0PIx1RJQ
W3tYgC0DnH0ydOv9m9Ze5yDBYkgYBd6f/7sSvGL4Vg==
=5b36
-----END PGP SIGNATURE-----

--------------Uyeak0oqpO00idGXm6iMd0du--

