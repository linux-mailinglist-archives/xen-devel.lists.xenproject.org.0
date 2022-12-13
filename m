Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC6264B2CF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460362.718265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51zF-0005h0-Na; Tue, 13 Dec 2022 09:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460362.718265; Tue, 13 Dec 2022 09:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51zF-0005ek-Kp; Tue, 13 Dec 2022 09:54:09 +0000
Received: by outflank-mailman (input) for mailman id 460362;
 Tue, 13 Dec 2022 09:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p51zE-0005eN-7f
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:54:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1571ffd4-7acc-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 10:54:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA3F81FE0B;
 Tue, 13 Dec 2022 09:54:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A584D138F9;
 Tue, 13 Dec 2022 09:54:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U+aMJr5LmGNFUAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 09:54:06 +0000
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
X-Inumbo-ID: 1571ffd4-7acc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670925246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/a1K4N0hh9cznFFXMy6xA20fHOnTYTkrUHnpzqubU54=;
	b=G/ZraK19iPOgZSsYQbRbcDwjQVK8OnGM+BBa8FWeMSovOThdoyf05wIAYLPpsfRu6VIhuD
	bVHOwdpC/TyMD/nkp9bR0L7RhJE0D1CECyJvbVETP+BaP4xqqvgDFOwpDiu10XX0LWe4iP
	kT9ZcobQxNhkHi6OJ7QbQA8Hh/uk6Rs=
Message-ID: <0dd9932b-356b-7201-d017-41dd061c6b44@suse.com>
Date: Tue, 13 Dec 2022 10:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 11/20] tools/xenstore: move changed domain handling
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-12-jgross@suse.com>
 <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
 <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
 <81985efe-7335-770c-c411-55c88db26a75@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <81985efe-7335-770c-c411-55c88db26a75@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J00SrWioZKjMZDGMXtoANtbC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J00SrWioZKjMZDGMXtoANtbC
Content-Type: multipart/mixed; boundary="------------eEjgJAtHEBNk8GUGvVImFVjW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <0dd9932b-356b-7201-d017-41dd061c6b44@suse.com>
Subject: Re: [PATCH 11/20] tools/xenstore: move changed domain handling
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-12-jgross@suse.com>
 <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
 <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
 <81985efe-7335-770c-c411-55c88db26a75@xen.org>
In-Reply-To: <81985efe-7335-770c-c411-55c88db26a75@xen.org>

--------------eEjgJAtHEBNk8GUGvVImFVjW
Content-Type: multipart/mixed; boundary="------------xgDkKHKwjEtXi7sbY0G40XMB"

--------------xgDkKHKwjEtXi7sbY0G40XMB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTIuMjIgMTA6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEzLzEyLzIwMjIgMDY6NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwMS4xMi4yMiAyMjo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAwMS8xMS8yMDIyIDE1OjI4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiDCoCBzdGF0aWMgYm9vbCBjaGVja19pbmRleGVzKFhFTlNUT1JFX1JJTkdfSURYIGNv
bnMsIFhFTlNUT1JFX1JJTkdfSURYIHByb2QpDQo+Pj4+IEBAIC00OTIsOCArNTA0LDEyIEBA
IHN0YXRpYyBzdHJ1Y3QgZG9tYWluIA0KPj4+PiAqZmluZF9vcl9hbGxvY19leGlzdGluZ19k
b21haW4odW5zaWduZWQgaW50IGRvbWlkKQ0KPj4+PiDCoMKgwqDCoMKgIHhjX2RvbWluZm9f
dCBkb21pbmZvOw0KPj4+PiDCoMKgwqDCoMKgIGRvbWFpbiA9IGZpbmRfZG9tYWluX3N0cnVj
dChkb21pZCk7DQo+Pj4+IC3CoMKgwqAgaWYgKCFkb21haW4gJiYgZ2V0X2RvbWFpbl9pbmZv
KGRvbWlkLCAmZG9taW5mbykpDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBkb21haW4gPSBhbGxv
Y19kb21haW4oTlVMTCwgZG9taWQpOw0KPj4+PiArwqDCoMKgIGlmICghZG9tYWluKSB7DQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWdldF9kb21haW5faW5mbyhkb21pZCwgJmRvbWlu
Zm8pKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnJubyA9IEVOT0VOVDsNCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZG9tYWluID0gYWxsb2NfZG9tYWluKE5VTEwsIGRvbWlkKTsNCj4+Pj4gK8KgwqDCoCB9DQo+
Pj4NCj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRoaXMgY2hhbmdlIGlzIHJlbGF0ZWQg
dG8gdGhpcyBjb21taXQuDQo+Pg0KPj4gSXQgaXMgZGlyZWN0bHkgcmVsYXRlZCB0byB0aGUg
aHVuayBiZWxvdy4gUmV0dXJuaW5nIGVycm5vIGluDQo+PiBhY2NfYWRkX2RvbV9uYmVudHJ5
KCkgcmVxdWlyZXMgaXQgdG8gYmUgc2V0IGNvcnJlY3RseSBpbg0KPj4gZmluZF9vcl9hbGxv
Y19leGlzdGluZ19kb21haW4oKS4NCj4+DQo+PiBJJ2xsIGFkZCBhIHJlbWFyayBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UuDQo+Pg0KPj4+DQo+Pj4gWy4uLl0NCj4+Pg0KPj4+PiAraW50IGFj
Y19hZGRfZG9tX25iZW50cnkoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgbGlzdF9oZWFkICpo
ZWFkLCBpbnQgdmFsLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgZG9taWQpDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IGNoYW5nZWRfZG9tYWlu
ICpjZDsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGNkID0gYWNjX2dldF9jaGFuZ2VkX2RvbWFp
bihjdHgsIGhlYWQsIGRvbWlkKTsNCj4+Pj4gK8KgwqDCoCBpZiAoIWNkKQ0KPj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGVycm5vOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgY2QtPm5i
ZW50cnkgKz0gdmFsOw0KPj4+DQo+Pj4gQXMgYSBmdXR1cmUgaW1wcm92ZW1lbnQsIGl0IHdv
dWxkIGJlIHdvcnRoIGNvbnNpZGVyaW5nIHRvIGNoZWNrIGZvciANCj4+PiB1bmRlcmZsb3cv
b3ZlcmZsb3cuDQo+Pg0KPj4gRG8geW91IHJlYWxseSB0aGluayB3ZSBuZWVkIHRvIG1ha2Ug
c3VyZSBub3QgdG8gYWRkL3JlbW92ZSBtb3JlIHRoYW4NCj4+IDIgYmlsbGlvbiBub2RlcyBv
d25lZCBieSBhIHNpbmdsZSBkb21haW4/DQo+IE5vIGFuZCB0aGF0J3Mgbm90IG15IHBvaW50
LiBJZiB5b3UgbG9vayBhdCBkb21haW5fZW50cnlfZml4KCkgd2UgaGF2ZSBhbiANCj4gYXNz
ZXJ0KCkgdG8gY2hlY2sgaWYgdGhlIHN1bSBpcyBzdGlsbCBvdmVyIDAuDQo+IA0KPiBUaGlz
IGFzc2VydCgpIHdhcyBhY3R1YWxseSB0cmlnZ2VyZWQgYSBmZXcgdGltZXMgd2hpbGUgdGVz
dGluZyB0aGUgcHJldmlvdXMgWFNBcyANCj4gYmF0Y2guIFNvIEkgdGhpbmsgaXQgd291bGQg
YmUgd29ydGggdG8gY2FycnkgYSBzaW1pbGFyIGNoZWNrIChtYXliZSBub3QgYW4gDQo+IGFz
c2VydCgpKSBqdXN0IGluIGNhc2Ugd2UgbWVzcyB1cCB3aXRoIGFjY291bnRpbmcgaW4gdGhl
IGZ1dHVyZS4NCg0KUGF0Y2ggMiBvZiB0aGUgMm5kIHNlcmllcyBkb2VzIHRoYXQgYWxyZWFk
eS4NCg0KDQpKdWVyZ2VuDQo=
--------------xgDkKHKwjEtXi7sbY0G40XMB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xgDkKHKwjEtXi7sbY0G40XMB--

--------------eEjgJAtHEBNk8GUGvVImFVjW--

--------------J00SrWioZKjMZDGMXtoANtbC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOYS74FAwAAAAAACgkQsN6d1ii/Ey+R
0wf/Shp81pS4IoqRhVXr4fUWOljYElMPTXb7N2dYSb13yWGmfqQcMigKpPOI6C+OhWuTlsdxcAwT
KOcqqTDqW8Z2bRselDhaXl1UqN43tmcYIXwjJeGYybHw46gpF4GcToirNzZepC6FjR8AwkSs1eZ/
kjCJ101wMbNv+1xEMNQZwnslOUvFvvvqqWYep99sgfQdgJFFuMNLBMt9XBdbnpm3iuGU0eqcrAOW
diWx0YM3/a4lHxMvWGDvwRKdveYhAxqUBQWkPLBtv4S6bfy+nLIJpkMd9loyFphmTb17ACnXbqn4
Og0rv/rYvJ0tO6kopu7RDhAjnFpA0sqNWD6LMKdyog==
=lCYA
-----END PGP SIGNATURE-----

--------------J00SrWioZKjMZDGMXtoANtbC--

