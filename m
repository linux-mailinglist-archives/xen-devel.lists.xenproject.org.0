Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA384950E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 09:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675682.1051036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWtzY-0007kg-6S; Mon, 05 Feb 2024 08:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675682.1051036; Mon, 05 Feb 2024 08:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWtzY-0007iL-2p; Mon, 05 Feb 2024 08:06:12 +0000
Received: by outflank-mailman (input) for mailman id 675682;
 Mon, 05 Feb 2024 08:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWtzW-0007iD-0h
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 08:06:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 684f5b12-c3fd-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 09:06:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 550B41F8A3;
 Mon,  5 Feb 2024 08:06:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29A31136F5;
 Mon,  5 Feb 2024 08:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0JdxCOuWwGWKCAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 08:06:03 +0000
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
X-Inumbo-ID: 684f5b12-c3fd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707120363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XC3UG/rC52b26n3G3wrw4PZYIDR1jSqfCbyh0n9R4PA=;
	b=CgQyfnwxzr7VUtnaF8gQ9tNImQKN+j8aVI8nMw6lh6yNUdpn0zsbKq6UH7zDX74GjoDGE1
	EUGgHxOPyRi9BP3V6Nz5Hpu3cHwWK0RadEM9ey2XOornlF7c4Dm92d9RhiiPxTlg7I/r4m
	/gQRzIupuG7DzNZhx2AqktNRxMVgau8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707120363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XC3UG/rC52b26n3G3wrw4PZYIDR1jSqfCbyh0n9R4PA=;
	b=CgQyfnwxzr7VUtnaF8gQ9tNImQKN+j8aVI8nMw6lh6yNUdpn0zsbKq6UH7zDX74GjoDGE1
	EUGgHxOPyRi9BP3V6Nz5Hpu3cHwWK0RadEM9ey2XOornlF7c4Dm92d9RhiiPxTlg7I/r4m
	/gQRzIupuG7DzNZhx2AqktNRxMVgau8=
Message-ID: <034b465b-df1f-4886-a12e-2fe1110a75ea@suse.com>
Date: Mon, 5 Feb 2024 09:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/33] tools/xenstored: move all log-pipe handling into
 posix.c
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-25-jgross@suse.com>
 <7feae542-5b76-481e-8f2e-8dac91042a03@xen.org>
Content-Language: en-US
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
In-Reply-To: <7feae542-5b76-481e-8f2e-8dac91042a03@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sGPDc7XGyjRV4V38h78Xa0Gs"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.19
X-Spamd-Result: default: False [-3.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sGPDc7XGyjRV4V38h78Xa0Gs
Content-Type: multipart/mixed; boundary="------------MPJx6rTmdo08wB5X9nmg3BC0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <034b465b-df1f-4886-a12e-2fe1110a75ea@suse.com>
Subject: Re: [PATCH v3 24/33] tools/xenstored: move all log-pipe handling into
 posix.c
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-25-jgross@suse.com>
 <7feae542-5b76-481e-8f2e-8dac91042a03@xen.org>
In-Reply-To: <7feae542-5b76-481e-8f2e-8dac91042a03@xen.org>

--------------MPJx6rTmdo08wB5X9nmg3BC0
Content-Type: multipart/mixed; boundary="------------w4OGu0mmAjRAbhcf7fbgeX5K"

--------------w4OGu0mmAjRAbhcf7fbgeX5K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDEuMjQgMTk6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA0LzAxLzIwMjQgMDk6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
bGwgb2YgdGhlIGxvZy1waXBlIGhhbmRsaW5nIGlzIG5lZWRlZCBvbmx5IHdoZW4gcnVubmlu
ZyBhcyBkYWVtb24uDQo+Pg0KPj4gTW92ZSBpdCBpbnRvIHBvc2l4LmMuIFRoaXMgcmVxdWly
ZXMgdG8gaGF2ZSBhIHNlcnZpY2UgZnVuY3Rpb24gaW4gdGhlDQo+PiBtYWluIGV2ZW50IGxv
b3AgZm9yIGhhbmRsaW5nIHRoZSByZWxhdGVkIHJlcXVlc3RzIGFuZCBvbmUgZm9yIHNldHRp
bmcNCj4+IHRoZSBmZHNbXSBhcnJheS4gVXNlIGEgZ2VuZXJpYyBuYW1lIGZvciB0aG9zZSBm
dW5jdGlvbnMsIGFzIHNvY2tldA0KPj4gaGFuZGxpbmcgY2FuIGJlIGFkZGVkIHRvIHRoZW0g
bGF0ZXIsIHRvby4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYzOg0KPj4gLSBuZXcgcGF0Y2gNCj4+IC0tLQ0K
Pj4gwqAgdG9vbHMveGVuc3RvcmVkL2NvcmUuY8KgwqAgfCA0MSArKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmVkL2NvcmUuaMKgwqAg
fCAxMSArKysrKystLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvbWluaW9zLmMgfCAxNCAr
KysrKystLS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9wb3NpeC5jwqAgfCA0NiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiDCoCA0IGZpbGVzIGNo
YW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS90b29scy94ZW5zdG9yZWQvY29yZS5jIGIvdG9vbHMveGVuc3RvcmVkL2NvcmUu
Yw0KPj4gaW5kZXggN2I1ZTFkMGMwZi4uNjUwYzFkMTU3NCAxMDA2NDQNCj4+IC0tLSBhL3Rv
b2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMN
Cj4+IEBAIC01Niw3ICs1Niw3IEBADQo+PiDCoCBleHRlcm4geGVuZXZ0Y2huX2hhbmRsZSAq
eGNlX2hhbmRsZTsgLyogaW4gZG9tYWluLmMgKi8NCj4+IMKgIHN0YXRpYyBpbnQgeGNlX3Bv
bGxmZF9pZHggPSAtMTsNCj4+IC1zdGF0aWMgc3RydWN0IHBvbGxmZCAqZmRzOw0KPj4gK3N0
cnVjdCBwb2xsZmQgKmZkczsNCj4gDQo+IFRoZSBuYW1lIGlzIHF1aXRlIGdlbmVyaWMuIFNv
LCBJIGFtIG5vdCBzdXJlIEkgbGlrZSB0aGUgaWRlYSB0byBleHBvcnQgaXQuIEhvdyANCj4g
YWJvdXQgcGFzc2luZyAnZmRzJyBhcyBhbiBhcmd1bWVudCBvZiBoYW5kbGVfc3BlY2lhbF9m
ZHMoKT8NCg0KT2theS4NCg0KPiANCj4gVGhpcyBpcyBzdGlsbCBub3QgdmVyeSBncmVhdCAo
d2UgaGF2ZSBhbiBhcnJheSBvZiAidW5rbm93biIgc2l6ZWQgcGFzcykuIEJ1dCBpdCANCj4g
aXMgYmV0dGVyIHRoYW4gZXhwb3J0aW5nIGl0Lg0KPiANCj4gVGhlIHJlc3QgTEdUTS4NCg0K
VGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg0K
--------------w4OGu0mmAjRAbhcf7fbgeX5K
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
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------w4OGu0mmAjRAbhcf7fbgeX5K--

--------------MPJx6rTmdo08wB5X9nmg3BC0--

--------------sGPDc7XGyjRV4V38h78Xa0Gs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXAluoFAwAAAAAACgkQsN6d1ii/Ey80
dggAgfiG/WcXnqMtPCuIyKROe3xd8nsn2hxdjnEOTq8AzTUgp4Ob9gfsnaNYeu6+1JmY3fOPeqO1
OwXyBFFV+X31JrkqqpqB0I8xcYs+Fj56s82h3Y3lxXk6tAsHOTU0D7RpgahBjQ2eeZm5lXqzh7eV
PWY0Ujx2iAn3jkvVuL7N5YALxvMJLD1F9XVSlUa/y2wjeCsyD+q3FX1h4WdYfslpTwzg1MyRmSyp
GkS6TTYymaB6keh4+B7GVtkpqhi26/bdcW148wHY78H8p4XDsK27yjr4lr7LysyiBypPnG3Nup/+
4pTcsI04tE3C4Q9dDTexeZORjM8FUuS80E+AckG2SQ==
=Hd+X
-----END PGP SIGNATURE-----

--------------sGPDc7XGyjRV4V38h78Xa0Gs--

