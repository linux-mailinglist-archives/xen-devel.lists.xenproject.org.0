Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E276AE3B2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507495.781071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYq7-0007q2-Cs; Tue, 07 Mar 2023 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507495.781071; Tue, 07 Mar 2023 15:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYq7-0007oG-98; Tue, 07 Mar 2023 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 507495;
 Tue, 07 Mar 2023 15:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZYq5-0007oA-Io
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:02:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f2d273-bcf9-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:02:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3C351FDA8;
 Tue,  7 Mar 2023 15:02:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 892A81341F;
 Tue,  7 Mar 2023 15:02:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zqALIBtSB2TZEwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 15:02:51 +0000
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
X-Inumbo-ID: 21f2d273-bcf9-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678201371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=19Pk9Gc0c3alF8ZSAH3oNY4JxqknmWOJT5Meq1qlhsw=;
	b=S7ypyMEZ4PIWWMXiUowNHeKQCVV9/F8TazESVD7ZgBC+62D3FNVBilK/OkZDnnz+VOhzix
	S8mjQWJWZLQ4u5AUB0Ox+PyzayORuorjqJkiK9QEEQ9ZZOTyuA/qaXhJB7SEMDSLBA30N9
	DwwtJ1ofOSSOvJ7wVZ/gxmjG1pVJuNw=
Message-ID: <7f4d5da3-13b8-f120-69fc-14aa65e735e3@suse.com>
Date: Tue, 7 Mar 2023 16:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
 <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
 <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
In-Reply-To: <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3IFsqxvwcrjQLJyGJf87SKdM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3IFsqxvwcrjQLJyGJf87SKdM
Content-Type: multipart/mixed; boundary="------------rxOuyg30JT8YwXjrUlTHNnkz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <7f4d5da3-13b8-f120-69fc-14aa65e735e3@suse.com>
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
 <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
 <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>
In-Reply-To: <c8c8209f-0ad1-2a13-946d-0ac9a0f454bc@suse.com>

--------------rxOuyg30JT8YwXjrUlTHNnkz
Content-Type: multipart/mixed; boundary="------------r04IQMsGS4JrBukLVg18wR9y"

--------------r04IQMsGS4JrBukLVg18wR9y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjMgMTU6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMy4yMDIz
IDE1OjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDcuMDMuMjMgMTU6MTgsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAzLjIwMjMgMTU6MDQsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDA3LjAzLjIzIDExOjQxLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDA3LjAzLjIwMjMgMDc6MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gLS0tIGEveGVuL0tjb25maWcuZGVidWcNCj4+Pj4+PiArKysgYi94ZW4vS2NvbmZpZy5k
ZWJ1Zw0KPj4+Pj4+IEBAIC0xNSw4ICsxNSwxMSBAQCBjb25maWcgREVCVUdfSU5GTw0KPj4+
Pj4+ICAgICAJYm9vbCAiQ29tcGlsZSBYZW4gd2l0aCBkZWJ1ZyBpbmZvIg0KPj4+Pj4+ICAg
ICAJZGVmYXVsdCBERUJVRw0KPj4+Pj4+ICAgICAJLS0taGVscC0tLQ0KPj4+Pj4+IC0JICBJ
ZiB5b3Ugc2F5IFkgaGVyZSB0aGUgcmVzdWx0aW5nIFhlbiB3aWxsIGluY2x1ZGUgZGVidWdn
aW5nIGluZm8NCj4+Pj4+PiAtCSAgcmVzdWx0aW5nIGluIGEgbGFyZ2VyIGJpbmFyeSBpbWFn
ZS4NCj4+Pj4+PiArCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBidWlsZCBYZW4gd2l0
aCBkZWJ1ZyBpbmZvcm1hdGlvbi4gVGhpcw0KPj4+Pj4+ICsJICBpbmZvcm1hdGlvbiBpcyBu
ZWVkZWQgZS5nLiBmb3IgZG9pbmcgY3Jhc2ggZHVtcCBhbmFseXNpcyBvZiB0aGUNCj4+Pj4+
PiArCSAgaHlwZXJ2aXNvciB2aWEgdGhlICJjcmFzaCIgdG9vbC4NCj4+Pj4+PiArCSAgU2F5
aW5nIFkgd2lsbCBpbmNyZWFzZSB0aGUgc2l6ZSBvZiB4ZW4tc3ltcyBhbmQgdGhlIGJ1aWx0
IEVGSQ0KPj4+Pj4+ICsJICBiaW5hcnkuDQo+Pj4+Pg0KPj4+Pj4gTGFyZ2VseSBmaW5lIHdp
dGggbWUsIGp1c3Qgb25lIHF1ZXN0aW9uOiBXaHkgZG8geW91IG1lbnRpb24geGVuLXN5bXMg
YnkNCj4+Pj4+IG5hbWUsIGJ1dCB0aGVuIHZlcmJhbGx5IGRlc2NyaWJlIHhlbi5lZmk/IEFu
ZCBzaW5jZSwgdW5saWtlIGZvciB4ZW4tc3ltcywNCj4+Pj4NCj4+Pj4gRm9yIHhlbi1zeW1z
IEkgY291bGRuJ3QgZmluZCBhbiBlYXNpbHkgdW5kZXJzdGFuZGFibGUgd29yZGluZy4gSSdk
IGJlIGZpbmUNCj4+Pj4gd2l0aCBqdXN0IHNheWluZyAieGVuLmVmaSIuDQo+Pj4+DQo+Pj4+
PiB0aGlzIGFmZmVjdHMgdGhlIGluc3RhbGxlZCBiaW5hcnkgYWN0dWFsbHkgdXNlZCBmb3Ig
Ym9vdGluZyAod2hpY2ggbWF5DQo+Pj4+PiBiZSBwbGFjZWQgb24gYSBzcGFjZSBjb25zdHJh
aW5lZCBwYXJ0aXRpb24pLCBpdCBtYXkgYmUgcHJ1ZGVudCB0bw0KPj4+Pj4gbWVudGlvbiBJ
TlNUQUxMX0VGSV9TVFJJUCBoZXJlIChhcyBhIHdheSB0byByZWR1Y2UgdGhlIGJpbmFyeSBz
aXplIG9mDQo+Pj4+PiB3aGF0IGVuZHMgdXAgb24gdGhlIEVGSSBwYXJ0aXRpb24sIGV2ZW4g
aWYgdGhhdCB3b3VsZG4ndCBhZmZlY3QgdGhlDQo+Pj4+PiAibm9ybWFsIiB3YXkgb2YgcHV0
dGluZyB0aGUgYmluYXJ5IG9uIHRoZSBFRkkgcGFydGl0aW9uIC0gcGVvcGxlIHdvdWxkDQo+
Pj4+PiBzdGlsbCBuZWVkIHRvIHRha2UgY2FyZSBvZiB0aGF0IGluIHRoZWlyIGRpc3Ryb3Mp
Lg0KPj4+Pg0KPj4+PiBXaGF0IGFib3V0IGFkZGluZyBhIHJlbGF0ZWQgS2NvbmZpZyBvcHRp
b24gaW5zdGVhZD8NCj4+Pg0KPj4+IEhvdyB3b3VsZCBhIEtjb25maWcgb3B0aW9uIHBvc3Np
Ymx5IGFmZmVjdCB0aGlzPyBZb3Ugd2FudCBkZWJ1ZyBpbmZvDQo+Pj4gaW4gdGhlIHhlbi5l
ZmkgaW4gaXRzIHN0YW5kYXJkIGluc3RhbGwgbG9jYXRpb24gKG91dHNpZGUgb2YgdGhlIEVG
SQ0KPj4+IHBhcnRpdGlvbik7IG9yIGVsc2UgaWYgeW91IGRvbid0IHdhbnQgaXQgdGhlcmUg
d2h5IHdvdWxkIHlvdSB3YW50IGl0DQo+Pj4gaW4geGVuLXN5bXM/IEl0IGlzIHRoZSBzdGVw
IG9mIHBvcHVsYXRpbmcgdGhlIEVGSSBwYXJ0aXRpb24gZnJvbSB0aGUNCj4+PiBzdGFuZGFy
ZCBpbnN0YWxsIGxvY2F0aW9uIHdoZXJlIHNvbWUgZXF1aXZhbGVudCBvZiBJTlNUQUxMX0VG
SV9TVFJJUA0KPj4+IHdvdWxkIGNvbWUgaW50byBwbGF5LiBUaGF0IHN0ZXAgaXMgZG9uZSBv
dXRzaWRlIG9mIFhlbidzIGJ1aWxkDQo+Pj4gc3lzdGVtIGFuZCBoZW5jZSBvdXRzaWRlIG9m
IGFueSBLY29uZmlnIGNvbnRyb2wuDQo+Pg0KPj4gV2UgaGF2ZSAyIGJpbmFyaWVzIGZvciB0
aGUgbm9uLUVGSSBoeXBlcnZpc29yICh4ZW4tc3ltcyBhbmQgeGVuWy5nel0pLg0KPj4gV2h5
IGNhbid0IHdlIGhhdmUgdGhlIHNhbWUgZm9yIEVGST8gRS5nLiB4ZW4tc3ltcy5lZmkgYW5k
IHhlbi5lZmkuDQo+PiBUaGUgZm9ybWVyIHdvdWxkIGhhdmUgdGhlIGRlYnVnLWluZm8sIHRo
ZSBsYXR0ZXIgY291bGQgYmUgaW5zdGFsbGVkDQo+PiBpbnRvIHRoZSBFRkkgcGFydGl0aW9u
Lg0KPiANCj4gSSB2aWV3IHRoZSB0d28tYmluYXJpZXMgbW9kZWwgb2YgdGhlIG5vbi1FRkkg
Y2FzZSBhcyBtZXJlbHkgYW4NCj4gaW1wbGVtZW50YXRpb24gZGV0YWlsOw0KDQpUaGUgYWJp
bGl0eSB0byBkbyBjcmFzaCBkdW1wIGFuYWx5c2lzIGlzIG1vcmUgdGhhbiBhbiBpbXBsZW1l
bnRhdGlvbg0KZGV0YWlsIElNSE8uIEl0IGlzIGEgZmVhdHVyZSBhbmQgYXMgc3VjaCB0aGUg
YXZhaWxhYmlsaXR5IG9mIHhlbi1zeW1zDQpzaG91bGQgYmUgc2VlbiBhcyBhbiBpbnRlcmZh
Y2Ugd2hpY2ggZnVuY3Rpb25hbGl0eSBzaG91bGQgYmUga2VwdC4NCg0KPiBpdCBqdXN0IHNv
IGhhcHBlbnMgdGhhdCB0aGVyZSdzIGxpdHRsZSBwb2ludA0KPiBpbiBta2VsZjMyIHJldGFp
bmluZyBkZWJ1ZyBpbmZvLiBJIHRoZXJlZm9yZSBkb24ndCB2aWV3IGl0IGFzIHZlcnkNCj4g
cmVhc29uYWJsZSB0byBhcnRpZmljaWFsbHkgaW50cm9kdWNlIHlldCBhbm90aGVyIGJpbmFy
eS4NCg0KSW4gY2FzZSB0aGVyZSBpcyBubyBvdGhlciB3YXkgdG8gZW5hYmxlIGh5cGVydmlz
b3IgY3Jhc2ggZHVtcCBhbmFseXNpcw0KSSBkb24ndCBzZWUgdGhpcyBhcyBhbiB1bnJlYXNv
bmFibGUgYXBwcm9hY2guDQoNCkl0IHNob3VsZCBiZSB2ZXJpZmllZCB0aGF0IHRoaXMgYXBw
cm9hY2ggaXMgcmVhbGx5IGVuYWJsaW5nIHRoZSBjcmFzaA0KZHVtcCBhbmFseXNpcyBvZiBh
IGNyYXNoIGR1bXAgZnJvbSBhIHhlbi5lZmkgYm9vdGVkIHN5c3RlbSwgb2YgY291cnNlLg0K
DQoNCkp1ZXJnZW4NCg==
--------------r04IQMsGS4JrBukLVg18wR9y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------r04IQMsGS4JrBukLVg18wR9y--

--------------rxOuyg30JT8YwXjrUlTHNnkz--

--------------3IFsqxvwcrjQLJyGJf87SKdM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQHUhsFAwAAAAAACgkQsN6d1ii/Ey8C
Uwf/arqa7IzsPYelhTWXnCnzWytWVzfuDUYDNGw3KSrIU7+yF1v8DkhvC0Wrw1mtK94uzvB33JTE
EieNF5yyGGuieU8MIGmC/A+9nhqHJHiH4huJbhfq/KxQ8nooBUMdFyNfml5GKpVo7ACaTTQd+8tT
Zhr1QvnjO0c23GOAnY3q+1OF00tj6sicLjLa3U7RTGQH6nMDWI2Bt6MTr5+ejghHE+eBs3ErPWVy
JPrvjjLYAK9jnj8viw31mToNYPRZof87j7Ui0R+53/XUNGp03NszE5Cm6TG8ekrT0PNFY8Z29hA4
sHgFIp36etYL/i8KFe2OLxGwErxfFPT8MrZWGts+MA==
=gA3q
-----END PGP SIGNATURE-----

--------------3IFsqxvwcrjQLJyGJf87SKdM--

