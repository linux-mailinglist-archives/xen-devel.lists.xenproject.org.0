Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D861374234B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 11:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556702.869414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEnyH-0003LU-6T; Thu, 29 Jun 2023 09:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556702.869414; Thu, 29 Jun 2023 09:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEnyH-0003If-3s; Thu, 29 Jun 2023 09:29:49 +0000
Received: by outflank-mailman (input) for mailman id 556702;
 Thu, 29 Jun 2023 09:29:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3M7h=CR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEnyG-0003IZ-37
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 09:29:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bcab496-165f-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 11:29:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA4231F8AA;
 Thu, 29 Jun 2023 09:29:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B8C713905;
 Thu, 29 Jun 2023 09:29:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EdVaIAhPnWTOfgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Jun 2023 09:29:44 +0000
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
X-Inumbo-ID: 7bcab496-165f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688030984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKszLAjZrqC7eXhG1+3BH0NP/W/TUrjIo3qmuVavoLs=;
	b=Z2ZejWHkaFLgao/OqtSAJy0BwzWi+hbJBYkULSZUO6iT1LvLUMapYqqSCLEmassTY03iEF
	xU5yRlsNTp3sf35SR6FWHQYMLkUoY3+sfHySheH1tTj5e5HDnsmu5j+57WjNBeZhGmO8Kp
	6k+i9LMTXNXPfPxvI6dJ9UeZMfqPYC8=
Message-ID: <b600c26e-2aeb-c2cb-9bae-d97422e8efa9@suse.com>
Date: Thu, 29 Jun 2023 11:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/11] tools/xenstore: rename do_tdb_delete() and change
 parameter type
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-5-jgross@suse.com>
 <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tfXmtKl1WVJdOxT4tLe4TiDZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tfXmtKl1WVJdOxT4tLe4TiDZ
Content-Type: multipart/mixed; boundary="------------fVc4PG095N5lznsgBWRU2JFz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b600c26e-2aeb-c2cb-9bae-d97422e8efa9@suse.com>
Subject: Re: [PATCH 04/11] tools/xenstore: rename do_tdb_delete() and change
 parameter type
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-5-jgross@suse.com>
 <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>
In-Reply-To: <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>

--------------fVc4PG095N5lznsgBWRU2JFz
Content-Type: multipart/mixed; boundary="------------u6Ak6WktscoUSAae0tVZYtV5"

--------------u6Ak6WktscoUSAae0tVZYtV5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjMgMTM6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaCBiL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgNCj4+IGluZGV4IGY3Y2IwMzVmMjYuLjdmYzZkNzNl
NWEgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oDQo+
PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oDQo+PiBAQCAtMzU4LDEx
ICszNTgsMTIgQEAgZXh0ZXJuIHhlbmdudHRhYl9oYW5kbGUgKip4Z3RfaGFuZGxlOw0KPj4g
wqAgaW50IHJlbWVtYmVyX3N0cmluZyhzdHJ1Y3QgaGFzaHRhYmxlICpoYXNoLCBjb25zdCBj
aGFyICpzdHIpOw0KPj4gKy8qIERhdGEgYmFzZSBhY2Nlc3MgZnVuY3Rpb25zLiAqLw0KPj4g
wqAgdm9pZCBzZXRfdGRiX2tleShjb25zdCBjaGFyICpuYW1lLCBUREJfREFUQSAqa2V5KTsN
Cj4+IMKgIGludCBkb190ZGJfd3JpdGUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIFREQl9E
QVRBICprZXksIFREQl9EQVRBICpkYXRhLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IG5vZGVfYWNjb3VudF9kYXRhICphY2MsIGludCBmbGFnLCBib29sIG5vX3F1b3RhX2No
ZWNrKTsNCj4+IC1pbnQgZG9fdGRiX2RlbGV0ZShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwg
VERCX0RBVEEgKmtleSwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5vZGVfYWNj
b3VudF9kYXRhICphY2MpOw0KPj4gK2ludCBkYl9kZWxldGUoc3RydWN0IGNvbm5lY3Rpb24g
KmNvbm4sIGNvbnN0IGNoYXIgKm5hbWUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBub2RlX2FjY291bnRfZGF0YSAqYWNjKTsNCj4+IMKgIHZvaWQgY29ubl9mcmVlX2J1ZmZl
cmVkX2RhdGEoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4pOw0KPj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jIA0KPj4gYi90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfdHJhbnNhY3Rpb24uYw0KPj4gaW5kZXggMTY0NmMwNzA0MC4uYmYx
NzNmM2QxZCAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFu
c2FjdGlvbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfdHJhbnNhY3Rp
b24uYw0KPj4gQEAgLTM4NSw4ICszODUsNyBAQCBzdGF0aWMgaW50IGZpbmFsaXplX3RyYW5z
YWN0aW9uKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IC8qIEVudHJpZXMgZm9yIHVubW9kaWZpZWQgbm9kZXMgY2FuIGJlIHJlbW92ZWQgZWFybHku
ICovDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpLT5tb2RpZmllZCkgew0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGktPnRhX25vZGUpIHsNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3RkYl9rZXkoaS0+dHJhbnNfbmFtZSwgJnRh
X2tleSk7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChkb190ZGJf
ZGVsZXRlKGNvbm4sICZ0YV9rZXksIE5VTEwpKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoZGJfZGVsZXRlKGNvbm4sIGktPnRyYW5zX25hbWUsIE5VTEwpKQ0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBF
SU87DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBsaXN0X2RlbCgmaS0+bGlzdCk7DQo+PiBAQCAtMzk1LDIxICszOTQs
MjEgQEAgc3RhdGljIGludCBmaW5hbGl6ZV90cmFuc2FjdGlvbihzdHJ1Y3QgY29ubmVjdGlv
biAqY29ubiwNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCB3aGlsZSAoKGkgPSBs
aXN0X3RvcCgmdHJhbnMtPmFjY2Vzc2VkLCBzdHJ1Y3QgYWNjZXNzZWRfbm9kZSwgbGlzdCkp
KSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgc2V0X3RkYl9rZXkoaS0+bm9kZSwgJmtleSk7DQo+
IA0KPiBJdCBpcyBub3QgY2xlYXIgdG8gbWUgd2h5IHlvdSBhcmUgbW92aW5nIGxhdGVyIHRo
ZSBjYWxsIHRvIHNldF90ZGJfa2V5KCkgaW4gdGhpcyANCj4gcGF0Y2guDQoNCkl0IGlzIG5l
ZWRlZCBpbiB0aGUgaWYgKCkgY2FzZSBvbmx5IG5vdywgYmVmb3JlIHRoZSBwYXRjaCB0aGUg
ZWxzZSBjYXNlDQpuZWVkZWQgaXQsIHRvby4NCg0KPiANCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoaS0+dGFfbm9kZSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0
X3RkYl9rZXkoaS0+dHJhbnNfbmFtZSwgJnRhX2tleSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkYXRhID0gdGRiX2ZldGNoKHRkYl9jdHgsIHRhX2tleSk7DQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZGF0YS5kcHRyKSB7DQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRyYWNlX3RkYigicmVhZCAlcyBzaXplICV6dVxuIiwg
dGFfa2V5LmRwdHIsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRyYWNl
X3RkYigicmVhZCAlcyBzaXplICV6dVxuIiwgaS0+dHJhbnNfbmFtZSwNCj4gDQo+IFRoaXMg
Y2hhbmdlIHNlZW1zIHVucmVsYXRlZCB0byB0aGlzIHBhdGNoLg0KDQpIbW0sIHllcy4gSSds
bCBtb3ZlIHRoYXQgY2hhbmdlIHRvIHRoZSBwYXRjaCB3aGVyZSBpdCBiZWxvbmdzLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------u6Ak6WktscoUSAae0tVZYtV5
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

--------------u6Ak6WktscoUSAae0tVZYtV5--

--------------fVc4PG095N5lznsgBWRU2JFz--

--------------tfXmtKl1WVJdOxT4tLe4TiDZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSdTwcFAwAAAAAACgkQsN6d1ii/Ey/6
gwgAmcfi2jT2OhRtCvZiJKBXp29PHH/hW2SMNXWAkVdr6CqSVV0til1xkjwUAlkEhrXPi0Yo+Qaz
j9hmLOcgQbaamhJR/B/NZwpig2bHjv+10qHGb9aM7otbqbFsBWX5cnC5DElajk6ZVjNQsHJv6b4A
hSSFA0Spa92KILQVzxqlRD8HPLqObz3PaiRAWF6g4oF4FD2Pa7X18mUv1CyLxIN4LK/2iYdObZxs
X+dC+yk2igRC02cSYVfGD6mXXoq66f3Pr0Z1b5iyDcN8e6pP0v3qHxyskV1gOTGt7s/YbhV6mY/v
zUYVD0RLOWWPlN3qoTklri89c/RnradLGqv1HR5MdA==
=C/A1
-----END PGP SIGNATURE-----

--------------tfXmtKl1WVJdOxT4tLe4TiDZ--

