Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEAC51801B
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319313.539511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nloG6-0007f4-T4; Tue, 03 May 2022 08:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319313.539511; Tue, 03 May 2022 08:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nloG6-0007cy-P1; Tue, 03 May 2022 08:51:50 +0000
Received: by outflank-mailman (input) for mailman id 319313;
 Tue, 03 May 2022 08:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nloG4-0007aJ-Nc
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:51:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4421949f-cabe-11ec-a406-831a346695d4;
 Tue, 03 May 2022 10:51:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FC961F74A;
 Tue,  3 May 2022 08:51:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5363F13ABE;
 Tue,  3 May 2022 08:51:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vVPIEiPtcGJmRQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 03 May 2022 08:51:47 +0000
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
X-Inumbo-ID: 4421949f-cabe-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651567907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5DuNjEqYNOcxKieN8yThqpywf6NZlx1pIXkxbIrQ6YI=;
	b=vWKhlEObLLZMRIcC5KvQjARxfWMJqicuOCNtRBB5kZ92fEjnXeuRRiTsi2cEb37cZDNkKs
	QXFv7arA8jRXR7E/x0hGWTf+AIw1oNAA8eFdQbVpmjdM/FNXErbSlmnFXBx453Rr4UfGYO
	8WFEA6TvtKuhLpWtB/Wpj/qMwlcMt1Y=
Message-ID: <bddf9ad9-4fd4-7287-0499-1d2344ae0bc1@suse.com>
Date: Tue, 3 May 2022 10:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 5/7] xenstored: send an evtchn notification on
 introduce_domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-5-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220429205732.2030094-5-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p0e4CkB8aMlo8308yjURNBz8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p0e4CkB8aMlo8308yjURNBz8
Content-Type: multipart/mixed; boundary="------------Dz0Ol03438vtcDYvRUzsLIIu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <bddf9ad9-4fd4-7287-0499-1d2344ae0bc1@suse.com>
Subject: Re: [PATCH v5 5/7] xenstored: send an evtchn notification on
 introduce_domain
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-5-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-5-sstabellini@kernel.org>

--------------Dz0Ol03438vtcDYvRUzsLIIu
Content-Type: multipart/mixed; boundary="------------YDM17gSiqSw5OmiIpVZjfFfl"

--------------YDM17gSiqSw5OmiIpVZjfFfl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDQuMjIgMjI6NTcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJvbTog
THVjYSBNaWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5jb20+DQo+IA0KPiBXaGVuIHhzX2ludHJv
ZHVjZV9kb21haW4gaXMgY2FsbGVkLCBzZW5kIG91dCBhIG5vdGlmaWNhdGlvbiBvbiB0aGUN
Cj4geGVuc3RvcmUgZXZlbnQgY2hhbm5lbCBzbyB0aGF0IGFueSAoZG9tMGxlc3MpIGRvbWFp
biB3YWl0aW5nIGZvciB0aGUNCj4geGVuc3RvcmUgaW50ZXJmYWNlIHRvIGJlIHJlYWR5IGNh
biBjb250aW51ZSB3aXRoIHRoZSBpbml0aWFsaXphdGlvbi4NCj4gQmVmb3JlIHNlbmRpbmcg
dGhlIG5vdGlmaWNhdGlvbiwgY2xlYXIgWFNfQ09OTkVDVElPTl9TVEFURV9SRUNPTk5FQ1RJ
TkcuDQo+IA0KPiBUaGUgZXh0cmEgbm90aWZpY2F0aW9uIGlzIGhhcm1sZXNzIGZvciBkb21h
aW5zIHRoYXQgZG9uJ3QgcmVxdWlyZSBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2Eg
TWljY2lvIDxsdWNtaWNjaW9AZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPiBDQzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4NCj4gLS0tDQo+IEkgZHJvcHBlZCB0aGUgUmV2aWV3ZWQtYnkgdGFncyBk
dWUgdG8gdGhlIGNvbm5lY3QgPSAwIGNoYW5nZS4gSnVsaWVuDQo+IGFsc28gc3VnZ2VzdGVk
IGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIHRvIGFkZCBhIGNsYXJpZmljYXRpb24gc3RhdGVt
ZW50DQo+IGFib3V0IHRoZSB1c2FnZSBvZiBYU19DT05ORUNUSU9OX1NUQVRFX1JFQ09OTkVD
VElORyBpbiB0aGUgaGVhZGVyIGZpbGVzDQo+IGJ1dCBJIHdhc24ndCBzdXJlIHdoYXQgdG8g
d3JpdGUuIFBsZWFzZSBhZHZpc2UgYW5kIEkgYW0gaGFwcHkgdG8gaW5jbHVkZQ0KPiBhIHN0
YXRlbWVudCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KPiANCj4gQ2hhbmdlcyBpbiB2NToNCj4g
LSByZXNldCBYU19DT05ORUNUSU9OX1NUQVRFX1JFQ09OTkVDVElORyBiZWZvcmUgbm90aWZ5
aW5nIHRoZSBkb21VDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIGRyb3AgdGhlIG5ldyBs
YXRlX2luaXQgcGFyYW1ldGVyDQo+IC0tLQ0KPiAgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9kb21haW4uYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWlu
LmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMNCj4gaW5kZXggYWUwNjVm
Y2JlZS4uN2JiOGM2NGQzMyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2RvbWFpbi5jDQo+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4u
Yw0KPiBAQCAtNDkzLDYgKzQ5MywxMCBAQCBzdGF0aWMgc3RydWN0IGRvbWFpbiAqaW50cm9k
dWNlX2RvbWFpbihjb25zdCB2b2lkICpjdHgsDQo+ICAgCQkvKiBOb3cgZG9tYWluIGJlbG9u
Z3MgdG8gaXRzIGNvbm5lY3Rpb24uICovDQo+ICAgCQl0YWxsb2Nfc3RlYWwoZG9tYWluLT5j
b25uLCBkb21haW4pOw0KPiAgIA0KPiArCQkvKiBOb3RpZnkgdGhlIGRvbWFpbiB0aGF0IHhl
bnN0b3JlIGlzIGF2YWlsYWJsZSAqLw0KPiArCQlpbnRlcmZhY2UtPmNvbm5lY3Rpb24gPSAw
eDA7DQoNClBsZWFzZSB1c2UgWEVOU1RPUkVfQ09OTkVDVEVEIGluc3RlYWQgb2YgMHgwLg0K
DQo+ICsJCXhlbmV2dGNobl9ub3RpZnkoeGNlX2hhbmRsZSwgZG9tYWluLT5wb3J0KTsNCj4g
Kw0KPiAgIAkJaWYgKCFpc19tYXN0ZXJfZG9tYWluICYmICFyZXN0b3JlKQ0KPiAgIAkJCWZp
cmVfd2F0Y2hlcyhOVUxMLCBjdHgsICJAaW50cm9kdWNlRG9tYWluIiwgTlVMTCwNCj4gICAJ
CQkJICAgICBmYWxzZSwgTlVMTCk7DQoNCg0KSnVlcmdlbg0K
--------------YDM17gSiqSw5OmiIpVZjfFfl
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

--------------YDM17gSiqSw5OmiIpVZjfFfl--

--------------Dz0Ol03438vtcDYvRUzsLIIu--

--------------p0e4CkB8aMlo8308yjURNBz8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJw7SIFAwAAAAAACgkQsN6d1ii/Ey//
ewgAitrLF0iP3qpyiW93/xa3WaiXFgzEwPBhYc/bIE8I5mmKYv/vMJrclO0Y5IoWgDvM0h/hJ7jW
az1gGW/b+vs7mhSziXkWBG30d64G6PKLpKF/mqvZy5XmSDKg00bdK9chJH5WXDekpglgW2KIth/z
85UVEL4w1K4dl2nvNFZaCK8Qlh+tQEk1AO/z3hwr+pvoHVRKMTCwdfp8FhTQ0+OvKAsMS1zepBL+
R1kzUe9Hl/HMl6MIdSnwD3zo4WlAI0VKKgYbtyVCp2R9AKVgEKsjtFTrrz1wI1X3Bn7C6zwHXDkN
3+bmR+qs6Z4IL+0j0Lr7khfJfMrDyoC/AHnRXGLyHw==
=msF3
-----END PGP SIGNATURE-----

--------------p0e4CkB8aMlo8308yjURNBz8--

