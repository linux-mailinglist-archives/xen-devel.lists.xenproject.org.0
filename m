Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A77AAAC4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 09:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606730.944735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjauS-0005Ij-Iv; Fri, 22 Sep 2023 07:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606730.944735; Fri, 22 Sep 2023 07:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjauS-0005G0-Fq; Fri, 22 Sep 2023 07:49:08 +0000
Received: by outflank-mailman (input) for mailman id 606730;
 Fri, 22 Sep 2023 07:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvYF=FG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qjauR-0005Fs-6B
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 07:49:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80203778-591c-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 09:49:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D9A621963;
 Fri, 22 Sep 2023 07:49:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B84B13478;
 Fri, 22 Sep 2023 07:49:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o+QyDe9GDWXDKAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Sep 2023 07:49:03 +0000
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
X-Inumbo-ID: 80203778-591c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695368943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=miTsi/5ki2BQBcjdJJLXTVssrm7KN5It1DnbTudDPE4=;
	b=ovi2HZnaw4vIZkTiP4Nb7bLLoYfdx6ZHGQzNSY8HfgBEkIKNtONUAb9i5SIApeytih7jWl
	AyV69/KvnMPSzpsCIqV92rCMYPsAkyJTqAfRXCB1OAFTISmfINZnkzuwD24Pw2HEZzDnFk
	TCkZPYybBO7vtAlO1C0AhKRlhx+CBZ4=
Message-ID: <43cfe65e-c874-46e8-b647-c21c2cea4ca4@suse.com>
Date: Fri, 22 Sep 2023 09:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] credit: Don't steal vcpus which have yielded
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
 <20230921122352.2307574-2-george.dunlap@cloud.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20230921122352.2307574-2-george.dunlap@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2NjXxoRROZoCI1MJwd2AcLP9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2NjXxoRROZoCI1MJwd2AcLP9
Content-Type: multipart/mixed; boundary="------------00sqphl72C1UNjV4tVr80EIb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <43cfe65e-c874-46e8-b647-c21c2cea4ca4@suse.com>
Subject: Re: [PATCH v2 2/2] credit: Don't steal vcpus which have yielded
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
 <20230921122352.2307574-2-george.dunlap@cloud.com>
In-Reply-To: <20230921122352.2307574-2-george.dunlap@cloud.com>

--------------00sqphl72C1UNjV4tVr80EIb
Content-Type: multipart/mixed; boundary="------------b0S0LSxb7nZqLfM1MHLBMjf3"

--------------b0S0LSxb7nZqLfM1MHLBMjf3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDkuMjMgMTQ6MjMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIGxhcmdlIHN5
c3RlbXMgd2l0aCBtYW55IHZjcHVzIHlpZWxkaW5nIGR1ZSB0byBzcGlubG9jayBwcmlvcml0
eQ0KPiBpbnZlcnNpb24sIGl0J3Mgbm90IHVuY29tbW9uIGZvciBhIHZjcHUgdG8geWllbGQg
aXRzIHRpbWVzbGljZSwgb25seQ0KPiB0byBiZSBpbW1lZGlhdGVseSBzdG9sZW4gYnkgYW5v
dGhlciBwY3B1IGxvb2tpbmcgZm9yIGhpZ2hlci1wcmlvcml0eQ0KPiB3b3JrLg0KPiANCj4g
VG8gcHJldmVudCB0aGlzOg0KPiANCj4gKiBLZWVwIHRoZSBZSUVMRCBmbGFnIHVudGlsIGEg
dmNwdSBpcyByZW1vdmVkIGZyb20gYSBydW5xdWV1ZQ0KPiANCj4gKiBXaGVuIGxvb2tpbmcg
Zm9yIHdvcmsgdG8gc3RlYWwsIHNraXAgdmNwdXMgd2hpY2ggaGF2ZSB5aWVsZGVkDQo+IA0K
PiBOQiB0aGF0IHRoaXMgZG9lcyBtZWFuIHRoYXQgc29tZXRpbWVzIGEgVk0gaXMgaW5zZXJ0
ZWQgaW50byBhbiBlbXB0eQ0KPiBydW5xdWV1ZTsgaGFuZGxlIHRoYXQgY2FzZS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2xvdWQuY29t
Pg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gLSBNb3ZlZCBhIGNvbW1lbnQgdHdl
YWsgdG8gdGhlIHJpZ2h0IHBhdGNoDQo+IA0KPiBDQzogRGFyaW8gRmFnZ2lvbGkgPGRmYWdn
aW9saUBzdXNlLmNvbT4NCj4gLS0tDQo+ICAgeGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQuYyB8
IDI1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zY2hlZC9jcmVkaXQuYyBiL3hlbi9jb21tb24vc2NoZWQvY3JlZGl0LmMNCj4g
aW5kZXggNWMwNmY1OTZkMi4uMzhhNmY2ZmE2ZCAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1v
bi9zY2hlZC9jcmVkaXQuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdC5jDQo+
IEBAIC0yOTgsMTQgKzI5OCwxMCBAQCBfX3J1bnFfaW5zZXJ0KHN0cnVjdCBjc2NoZWRfdW5p
dCAqc3ZjKQ0KPiAgICAgICAgKiBydW5uYWJsZSB1bml0IGlmIHdlIGNhbi4gIFRoZSBuZXh0
IHJ1bnFfc29ydCB3aWxsIGJyaW5nIGl0IGZvcndhcmQNCj4gICAgICAgICogd2l0aGluIDMw
bXMgaWYgdGhlIHF1ZXVlIHRvbyBsb25nLiAqLw0KPiAgICAgICBpZiAoIHRlc3RfYml0KENT
Q0hFRF9GTEFHX1VOSVRfWUlFTEQsICZzdmMtPmZsYWdzKQ0KPiAtICAgICAgICAgJiYgX19y
dW5xX2VsZW0oaXRlciktPnByaSA+IENTQ0hFRF9QUklfSURMRSApDQo+IC0gICAgew0KPiAr
ICAgICAgICAgJiYgX19ydW5xX2VsZW0oaXRlciktPnByaSA+IENTQ0hFRF9QUklfSURMRQ0K
PiArICAgICAgICAgJiYgaXRlci0+bmV4dCAhPSBydW5xKQ0KDQpTdHlsZQ0KDQo+ICAgICAg
ICAgICBpdGVyPWl0ZXItPm5leHQ7DQo+ICAgDQo+IC0gICAgICAgIC8qIFNvbWUgc2FuaXR5
IGNoZWNrcyAqLw0KPiAtICAgICAgICBCVUdfT04oaXRlciA9PSBydW5xKTsNCj4gLSAgICB9
DQo+IC0NCj4gICAgICAgbGlzdF9hZGRfdGFpbCgmc3ZjLT5ydW5xX2VsZW0sIGl0ZXIpOw0K
PiAgIH0NCj4gICANCj4gQEAgLTMyMSw2ICszMTcsMTEgQEAgX19ydW5xX3JlbW92ZShzdHJ1
Y3QgY3NjaGVkX3VuaXQgKnN2YykNCj4gICB7DQo+ICAgICAgIEJVR19PTiggIV9fdW5pdF9v
bl9ydW5xKHN2YykgKTsNCj4gICAgICAgbGlzdF9kZWxfaW5pdCgmc3ZjLT5ydW5xX2VsZW0p
Ow0KPiArDQo+ICsgICAgLyoNCj4gKyAgICAgKiBDbGVhciBZSUVMRCBmbGFnIHdoZW4gc2No
ZWR1bGluZyBiYWNrIGluDQo+ICsgICAgICovDQo+ICsgICAgY2xlYXJfYml0KENTQ0hFRF9G
TEFHX1VOSVRfWUlFTEQsICZzdmMtPmZsYWdzKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGlj
IGlubGluZSB2b2lkDQo+IEBAIC0xNjM3LDYgKzE2MzgsMTMgQEAgY3NjaGVkX3J1bnFfc3Rl
YWwoaW50IHBlZXJfY3B1LCBpbnQgY3B1LCBpbnQgcHJpLCBpbnQgYmFsYW5jZV9zdGVwKQ0K
PiAgICAgICAgICAgaWYgKCBzcGVlci0+cHJpIDw9IHByaSApDQo+ICAgICAgICAgICAgICAg
YnJlYWs7DQo+ICAgDQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIERvbid0IHN0ZWFs
IGEgVU5JVCB3aGljaCBoYXMgeWllbGRlZDsgaXQncyB3YWl0aW5nIGZvciBhDQo+ICsgICAg
ICAgICAqIHJlYXNvbg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgaWYgKHRlc3RfYml0
KENTQ0hFRF9GTEFHX1VOSVRfWUlFTEQsICZzcGVlci0+ZmxhZ3MpKQ0KDQpTdHlsZQ0KDQo+
ICsgICAgICAgICAgICBjb250aW51ZTsNCj4gKw0KPiAgICAgICAgICAgLyogSXMgdGhpcyBV
TklUIHJ1bm5hYmxlIG9uIG91ciBQQ1BVPyAqLw0KPiAgICAgICAgICAgdW5pdCA9IHNwZWVy
LT51bml0Ow0KPiAgICAgICAgICAgQlVHX09OKCBpc19pZGxlX3VuaXQodW5pdCkgKTsNCj4g
QEAgLTE5NTQsMTEgKzE5NjIsNiBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBjc2NoZWRfc2No
ZWR1bGUoDQo+ICAgICAgICAgICBkZWNfbnJfcnVubmFibGUoc2NoZWRfY3B1KTsNCj4gICAg
ICAgfQ0KPiAgIA0KPiAtICAgIC8qDQo+IC0gICAgICogQ2xlYXIgWUlFTEQgZmxhZyBiZWZv
cmUgc2NoZWR1bGluZyBvdXQNCj4gLSAgICAgKi8NCj4gLSAgICBjbGVhcl9iaXQoQ1NDSEVE
X0ZMQUdfVU5JVF9ZSUVMRCwgJnNjdXJyLT5mbGFncyk7DQo+IC0NCj4gICAgICAgZG8gew0K
PiAgICAgICAgICAgc25leHQgPSBfX3J1bnFfZWxlbShydW5xLT5uZXh0KTsNCj4gICANCg0K
V2l0aCB0aGUgc3R5bGUgaXNzdWVzIGZpeGVkOg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------b0S0LSxb7nZqLfM1MHLBMjf3
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

--------------b0S0LSxb7nZqLfM1MHLBMjf3--

--------------00sqphl72C1UNjV4tVr80EIb--

--------------2NjXxoRROZoCI1MJwd2AcLP9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUNRu4FAwAAAAAACgkQsN6d1ii/Ey92
xQf/ajWp/pohNAjUYektoulA+kHjboNP4o6wJtbAdFGEuDhAKp1VCsDeQqMVyl/9WUB/PZcIoAsK
WXvYBvvQRoNYhxrE/fI6qAXdp9bAetWUzUiC4+lRtdi2C6lYM5qoKc2PIoEZ0yXSFKyQOgHniusV
v51jb1wqVlIhvylg+CY7E59kE/+zDep1YFbR/ZfoC9k4sS8qgxW3lNatA02ReNn8pIBjhmI1KGwx
XYG9K23RnOyU2eCKGMIH4hvpqmLe1ReL6/75BP9oF9hHlC3+9lsWxjJnmHoRgHMrmDDudej2i9yl
UMQfsHmIe/FVUH1gGBRzD3hb6QK+WTNWfAzHnLJ63Q==
=QYG1
-----END PGP SIGNATURE-----

--------------2NjXxoRROZoCI1MJwd2AcLP9--

