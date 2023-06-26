Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE36E73DCDF
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555429.867184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDk3D-0003R8-Di; Mon, 26 Jun 2023 11:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555429.867184; Mon, 26 Jun 2023 11:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDk3D-0003PQ-Au; Mon, 26 Jun 2023 11:06:31 +0000
Received: by outflank-mailman (input) for mailman id 555429;
 Mon, 26 Jun 2023 11:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ib7E=CO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qDk3C-0003PK-Mm
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:06:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f095ac0-1411-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 13:06:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1A4E1F898;
 Mon, 26 Jun 2023 11:06:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C196F13483;
 Mon, 26 Jun 2023 11:06:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0NtqLTJxmWRNIQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Jun 2023 11:06:26 +0000
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
X-Inumbo-ID: 7f095ac0-1411-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687777586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q06njBzDZ06pzPoqAfFSa9o2emzaxXz08iy1AQ4CwQ8=;
	b=VKzgjI5+iXg3baKxnLTgruTnVsLMW0HsgsPmKz/Ie3KcZjVthZYpKstdLGmQww0kfxGoXe
	EqwoyGiZprPKkK8nYEFsgdrlvAeoYHXaqGFA63vCSPD+4VIJlKtWZ/EZd/mG2EK1YGJfFN
	I8ASasOKxDgC8jfhoaAJIQPy43/7/Dc=
Message-ID: <2bfc737a-53c5-ef13-835e-97933a57f414@suse.com>
Date: Mon, 26 Jun 2023 13:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
In-Reply-To: <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m0K8SS3FOBwsKMdH0zXhNuIL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m0K8SS3FOBwsKMdH0zXhNuIL
Content-Type: multipart/mixed; boundary="------------gDXxzU0TCsafvRKtdcwLnrCH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2bfc737a-53c5-ef13-835e-97933a57f414@suse.com>
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>
In-Reply-To: <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>

--------------gDXxzU0TCsafvRKtdcwLnrCH
Content-Type: multipart/mixed; boundary="------------zuxdjpFnzN780GEyrBuIPjIv"

--------------zuxdjpFnzN780GEyrBuIPjIv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDYuMjMgMjA6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhlIGNvZGUgaW4gZGV0YWlscyB5ZXQuIEJ1
dCBJIGhhdmUgYSBmZXcgcXVlc3Rpb25zIA0KPiByZWdhcmRpbmcgdGhlIGNvbW1pdCBtZXNz
YWdlLw0KPiANCj4gT24gMzAvMDUvMjAyMyAxMDoxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+IFRvZGF5IGFsbCBYZW5zdG9yZSBub2RlcyBhcmUgc3RvcmVkIGluIGEgVERCIGRhdGEg
YmFzZS4gVGhpcyBkYXRhIGJhc2UNCj4+IGhhcyBzZXZlcmFsIGRpc2FkdmFudGFnZXM6DQo+
Pg0KPj4gLSBpdCBpcyB1c2luZyBhIGZpeGVkIHNpemVkIGhhc2ggdGFibGUsIHJlc3VsdGlu
ZyBpbiBoaWdoIG1lbW9yeQ0KPj4gwqDCoCBvdmVyaGVhZCBmb3Igc21hbGwgaW5zdGFsbGF0
aW9ucyB3aXRoIG9ubHkgdmVyeSBmZXcgVk1zLCBhbmQgYSByYXRoZXINCj4+IMKgwqAgbGFy
Z2UgcGVyZm9ybWFuY2UgaGl0IGZvciBzeXN0ZW1zIHdpdGggbG90cyBvZiBWTXMgZHVlIHRv
IG1hbnkNCj4+IMKgwqAgY29sbGlzaW9ucw0KPiANCj4gQ2FuIHlvdSBwcm92aWRlIHNvbWUg
Y29uY3JldGUgbnVtYmVycyBhbmQgYSBzZXR1cCBpbiBtaW5kPyBUaGlzIHdvdWxkIGhlbHAg
aWYgDQo+IHNvbWVvbmUgaW4gdGhlIGZ1dHVyZSBzYXlzIHRoYXQgdGhleSBzZWUgdGhlIGlu
dmVyc2UgYW5kIHdlIG5lZWQgdG8gcmV3b3JrIHRoZSANCj4gbG9naWMuDQoNClRoZSBoYXNo
IHRhYmxlIHNpemUgdG9kYXkgaXMgNzkxOSBlbnRyaWVzLiBUaGlzIG1lYW5zIHRoYXQgZS5n
LiBpbiBjYXNlDQpvZiBhIHNpbXBsZSBkZXNrdG9wIHVzZSBjYXNlIHdpdGggMiBvciAzIFZN
cyBwcm9iYWJseSBmYXIgbGVzcyB0aGFuIDEwJQ0Kb2YgdGhlIGVudHJpZXMgd2lsbCBiZSB1
c2VkIChhc3N1bWluZyByb3VnaGx5IDEwMCBub2RlcyBwZXIgVk0pLiBPVE9IIGENCnNldHVw
IG9uIGEgbGFyZ2Ugc2VydmVyIHdpdGggNTAwIFZNcyB3b3VsZCByZXN1bHQgaW4gaGVhdnkg
Y29uZmxpY3RzIGluDQp0aGUgaGFzaCBsaXN0IHdpdGggNS0xMCBub2RlcyBwZXIgaGFzaCB0
YWJsZSBlbnRyeS4NCg0KPiANCj4+DQo+PiAtIFhlbnN0b3JlIGlzIG9ubHkgc2luZ2xlLXRo
cmVhZGVkLCB3aGlsZSBUREIgaXMgZGVzaWduZWQgdG8gYmUgZml0DQo+PiDCoMKgIGZvciBt
dWx0aS10aHJlYWRlZCB1c2UgY2FzZXMsIHJlc3VsdGluZyBpbiBtdWNoIGhpZ2hlciBjb2Rl
DQo+PiDCoMKgIGNvbXBsZXhpdHkgdGhhbiBuZWVkZWQNCj4+DQo+PiAtIHNwZWNpYWwgdXNl
IGNhc2VzIG9mIFhlbnN0b3JlIGFyZSBub3QgcG9zc2libGUgdG8gaW1wbGVtZW50IHdpdGgg
VEQNCj4gDQo+IEJ5IHNwZWNpYWwgdXNlIGNhc2VzLCBhcmUgeW91IHJlZmVycmluZyB0byBv
bmx5IHRoZSB0cmFuc2FjdGlvbiBiZWxvdz8gSWYgbm90IA0KPiBjYW4geW91IG91dGxpbmUg
aXQ/DQoNCkkgd2FzIHRoaW5raW5nIG9mIHNwbGl0dGluZyBlYWNoIG5vZGUgaW4gdGhlIGRh
dGEgYmFzZSBpbnRvIGEgaGVhZGVyLCB0aGUNCmNoaWxkcmVuIGxpc3QgYW5kIHRoZSBub2Rl
IGNvbnRlbnRzLiBUaGlzIHdvdWxkIGVuYWJsZSB1cyB0byB1cGRhdGUgb25seQ0KdGhlIHBh
cnRzIHdoaWNoIGFyZSBjaGFuZ2VkLiBBZGRpdGlvbmFsbHkgcmVhZC1vbmx5IG9wZXJhdGlv
bnMgY291bGQganVzdA0KdXNlIHRoZSBpbnN0YW5jZSBvZiB0aGUgbm9kZSBpbiB0aGUgZGF0
YSBiYXNlIHZpYSBhIHBvaW50ZXIgaW5zdGVhZCBvZg0KYWxsb2NhdGluZyBtZW1vcnkgZm9y
IGEgY29weSBvZiB0aGUgbm9kZS4NCg0KRm9yIHRyYW5zYWN0aW9ucyBJJ2QgbGlrZSB0byB1
c2UgYSBjb3B5LW9uLXdyaXRlIHNjaGVtZSB3aXRoIGEgcGVyLW5vZGUNCmxpc3Qgb2YgdGhl
IGRpZmZlcmVudCB0cmFuc2FjdGlvbiBzcGVjaWZpYyBpbnN0YW5jZXMgb2YgYSBub2RlICh0
aGlzIG5lZWRzDQpzb21lIG1vcmUgdGhvdWdodCwgdGhvdWdoKS4NCg0KPiANCj4+IMKgwqAg
aW4gYW4gZWZmZWN0aXZlIHdheSwgd2hpbGUgYW4gaW1wbGVtZW50YXRpb24gb2YgYSBkYXRh
IGJhc2UgdGFpbG9yZWQNCj4+IMKgwqAgZm9yIFhlbnN0b3JlIGNvdWxkIHNpbXBsaWZ5IHNv
bWUgaGFuZGxpbmcgKGUuZy4gdHJhbnNhY3Rpb25zKSBhIGxvdA0KPiANCj4gRG8geW91IGhh
dmUgZm9sbG93LXVwIHBhdGNoZXMgdGhhdCB3b3VsZCBoZWxwIHRvIGZpZ3VyaW5nIG91dCB3
aGV0aGVyIHlvdXIgbmV3IA0KPiBpbnRlcmZhY2UgbWFrZXMgc2Vuc2U/DQoNCk5vdCB5ZXQu
DQoNCj4gDQo+Pg0KPj4gU28gZHJvcCB1c2luZyBUREIgYW5kIHN0b3JlIHRoZSBub2RlcyBk
aXJlY3RseSBpbiBtZW1vcnkgbWFraW5nIHRoZW0NCj4+IGVhc2lseSBhY2Nlc3NpYmxlLiBV
c2UgYSBoYXNoLWJhc2VkIGxvb2t1cCBtZWNoYW5pc20gZm9yIGZhc3QgbG9va3VwDQo+PiBv
ZiBub2RlcyBieSB0aGVpciBmdWxsIHBhdGguDQo+Pg0KPj4gRm9yIG5vdyBvbmx5IHJlcGxh
Y2UgVERCIGtlZXBpbmcgdGhlIGN1cnJlbnQgYWNjZXNzIGZ1bmN0aW9ucy4NCj4gDQo+IERv
IHlvdSBwbGFuIHRvIGhhdmUgdGhlIHJlc3Qgb2YgdGhlIHdvcmsgdXBzdHJlYW1lZCBmb3Ig
NC4xOD8gQWxzbywgaWYgZm9yIHNvbWUgDQo+IHJlYXNvbnMsIG9ubHkgdGhpcyB3b3JrIHdp
bGwgYmUgbWVyZ2VkLiBXaWxsIHRoaXMgaGF2ZSBhbiBpbXBhY3Qgb24gWGVuc3RvcmVkIA0K
PiBtZW1vcnkgdXNhZ2UvcGVyZm9ybWFuY2U/DQoNCk1lbW9yeSB1c2FnZSBzaG91bGQgZ28g
ZG93biwgZXNwZWNpYWxseSBhZnRlciBkZWxldGluZyBsb3RzIG9mIGVudHJpZXMNCihBRkFJ
SyBUREIgd2lsbCBuZXZlciBmcmVlIHRoZSB1bnVzZWQgbWVtb3J5IGFnYWluLCBpdCB3aWxs
IGp1c3Qga2VlcCBpdA0KZm9yIHRoZSBmdXR1cmUpLg0KDQpNZW1vcnkgZnJhZ21lbnRhdGlv
biBtaWdodCBnbyB1cCwgdGhvdWdoLg0KDQpQZXJmb3JtYW5jZSBtaWdodCBiZSBiZXR0ZXIs
IHRvbywgYXMgdGhlcmUgaXMgbm8gbmVlZCB0byByZWFsbG9jKCkgdGhlDQptZW1vcnkgd2hl
biBhZGRpbmcgbm9kZXMuDQoNCg0KSnVlcmdlbg0K
--------------zuxdjpFnzN780GEyrBuIPjIv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zuxdjpFnzN780GEyrBuIPjIv--

--------------gDXxzU0TCsafvRKtdcwLnrCH--

--------------m0K8SS3FOBwsKMdH0zXhNuIL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSZcTIFAwAAAAAACgkQsN6d1ii/Ey9m
/wf/XucPqrVPFFCKw4EItepNPtgV3hRMiHH9hSf+joyHsmKZau/M5Pg0lKkKgtAo4ACIfeOcyFzP
9YLodEMqMM0dQ3gnM2TV3/vbTHJMPnjU2i/mhIPaTN0tYbPvIjfmQRa41Ymr5nDbB4rpPW5i+gCh
QySEXl2UP2NWwpKz/Y08XZWUlSHZw6+A2fOd4G+94iX8KAAxH6VrRRG6ESZ+j4/4V2r4QeiegHXI
ZlhioqA7zZIbi9XG07K7lyhVVKRTbYQqpM5TIIVm7cXLijTfbnTs/R9oySBVbt12QHd+VnbBJHel
kbkRCiHx27GsgizZr5/HRFNGI/XkKGD/iIsph9dvlw==
=CPBg
-----END PGP SIGNATURE-----

--------------m0K8SS3FOBwsKMdH0zXhNuIL--

