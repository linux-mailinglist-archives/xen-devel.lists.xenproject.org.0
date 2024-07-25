Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E8093BCAB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 08:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764685.1175185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWs9r-0002Ej-5j; Thu, 25 Jul 2024 06:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764685.1175185; Thu, 25 Jul 2024 06:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWs9r-0002BG-2m; Thu, 25 Jul 2024 06:40:59 +0000
Received: by outflank-mailman (input) for mailman id 764685;
 Thu, 25 Jul 2024 06:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWs9p-0002Ak-B3
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 06:40:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6c7f67f-4a50-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 08:40:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC55321A9C;
 Thu, 25 Jul 2024 06:40:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDC1513874;
 Thu, 25 Jul 2024 06:40:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WZHCLHTzoWZECgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 25 Jul 2024 06:40:52 +0000
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
X-Inumbo-ID: d6c7f67f-4a50-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721889653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S4kS8VMWkCS8vOn9IpAnhLR4KboBpI7iPk1Vz8YTmrI=;
	b=i+wlaYUcBG/c7s97dbHRN5A2Dk1lfQ1CSyv4oTaoX42sm+YtymEdxk70b5xsK8QlLTv3bb
	B6xqHb5mhkyJxVNWeBDanQp2Gu+IWndEkHVa2tkSKZFEOrQerA74SAiaJaNcnbDdAgqn85
	XP0D65E6jQblQ64nWizKMOocK2eUOHE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721889652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S4kS8VMWkCS8vOn9IpAnhLR4KboBpI7iPk1Vz8YTmrI=;
	b=A1fSnjEQSSpSMl9QcUl/djssZquY0wNe+d8RZDudJqSnYByxDZWO7/VfxbWqeTG1nQl59E
	YCC9qzTTg8XE/ubvloYiH5Dgm9jGDOWtoOGNT4TZ/ldsbASPXlG/tg4S8QclqtfnOm8iSH
	/QqkcyNX1DeAW9Nar8MVSaKhtCsUsm4=
Message-ID: <39396c60-691f-422c-a065-7d148a81977d@suse.com>
Date: Thu, 25 Jul 2024 08:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mini-os: remove sanity_check()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-5-jgross@suse.com>
 <20240722213544.hjyohnoz4mtcfltr@begin>
 <884d746c-47e4-4d0f-87a9-e2a03d2a3286@suse.com>
 <20240724224431.jelemlo6tt2jgaw2@begin>
 <7b76ceae-181d-4371-8feb-195fd4cc6d90@suse.com>
 <20240725062902.croun5gpmgfplfyt@begin>
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
In-Reply-To: <20240725062902.croun5gpmgfplfyt@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7cdd5Knu3JOrgWvNmis168ZQ"
X-Spamd-Result: default: False [-5.99 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.99

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7cdd5Knu3JOrgWvNmis168ZQ
Content-Type: multipart/mixed; boundary="------------96XCosfT8gZudRYgzDFfjsOZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <39396c60-691f-422c-a065-7d148a81977d@suse.com>
Subject: Re: [PATCH 4/4] mini-os: remove sanity_check()
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-5-jgross@suse.com>
 <20240722213544.hjyohnoz4mtcfltr@begin>
 <884d746c-47e4-4d0f-87a9-e2a03d2a3286@suse.com>
 <20240724224431.jelemlo6tt2jgaw2@begin>
 <7b76ceae-181d-4371-8feb-195fd4cc6d90@suse.com>
 <20240725062902.croun5gpmgfplfyt@begin>
In-Reply-To: <20240725062902.croun5gpmgfplfyt@begin>

--------------96XCosfT8gZudRYgzDFfjsOZ
Content-Type: multipart/mixed; boundary="------------BKXl3rn22l0PYF1iVOm178o4"

--------------BKXl3rn22l0PYF1iVOm178o4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjQgMDg6MjksIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSsO8cmdlbiBH
cm/DnywgbGUgamV1LiAyNSBqdWlsLiAyMDI0IDA4OjI1OjE4ICswMjAwLCBhIGVjcml0Og0K
Pj4gT24gMjUuMDcuMjQgMDA6NDQsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4+PiBIZWxs
bywNCj4+Pg0KPj4+IErDvHJnZW4gR3Jvw58sIGxlIG1hci4gMjMganVpbC4gMjAyNCAwODoz
NjoxMyArMDIwMCwgYSBlY3JpdDoNCj4+Pj4gT24gMjIuMDcuMjQgMjM6MzUsIFNhbXVlbCBU
aGliYXVsdCB3cm90ZToNCj4+Pj4+IEp1ZXJnZW4gR3Jvc3MsIGxlIGx1bi4gMjIganVpbC4g
MjAyNCAxNzowMTo0MSArMDIwMCwgYSBlY3JpdDoNCj4+Pj4+PiBSZW1vdmUgdGhlIHNhbml0
eV9jaGVjaygpIGZ1bmN0aW9uLCBhcyBpdCBpcyB1c2VkIG5vd2hlcmUuDQo+Pj4+Pj4NCj4+
Pj4+PiBTaW5jZSBhbnkgYXBwbGljYXRpb24gbGlua2VkIHdpdGggTWluaS1PUyBjYW4ndCBj
YWxsIHNhbml0eV9jaGVjaygpDQo+Pj4+Pj4gZWl0aGVyICh0aGVyZSBpcyBubyBFWFBPUlRf
U1lNQk9MIGZvciBpdCksIHRoZXJlIGlzIHplcm8gY2hhbmNlIG9mDQo+Pj4+Pj4gYnJlYWtp
bmcgYW55IHVzZSBjYXNlLg0KPj4+Pj4NCj4+Pj4+IERvbid0IHdlIHN0aWxsIHdhbnQgdG8g
a2VlcCBpdCBhcm91bmQsIGF0IGxlYXN0IGFzIGZvcm1hbCBkb2N1bWVudGF0aW9uDQo+Pj4+
PiBvZiB0aGUgZXhwZWN0ZWQgc3RhdHVzIG9mIHRoZSBsaXN0Pw0KPj4+Pg0KPj4+PiBIbW0s
IGlzIGl0IHJlYWxseSB3b3J0aCB0aGUgZXh0cmEgY29kZT8NCj4+Pg0KPj4+IEkgaGF2ZSBh
bHJlYWR5IHNlZW4gc3VjaCBraW5kIG9mIHBpZWNlIG9mIGNvZGUgZ2V0dGluZyB2ZXJ5IGNv
bnZlbmllbnQNCj4+PiB3aGVuIHRyYWNraW5nIG9kZCBidWdzLg0KPj4NCj4+IFdoYXQgYWJv
dXQgcHV0dGluZyBpdCB1bmRlciBDT05GSUdfVEVTVCB0aGVuPw0KPiANCj4gT2vCoCENCg0K
SSB3ZW50IGEgbGl0dGxlIGJpdCBmdXJ0aGVyIGJ5IGNhbGxpbmcgc2FuaXR5X2NoZWNrKCkg
ZnJvbSBwZXJpb2RpY190aHJlYWQoKQ0KaW4gdGVzdC5jIG9uY2UgYSBzZWNvbmQuIFRoaXMg
d2lsbCBtYWtlIHJlYWwgdXNlIG9mIHRoZSBmdW5jdGlvbi4NCg0KDQpKdWVyZ2VuDQo=
--------------BKXl3rn22l0PYF1iVOm178o4
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

--------------BKXl3rn22l0PYF1iVOm178o4--

--------------96XCosfT8gZudRYgzDFfjsOZ--

--------------7cdd5Knu3JOrgWvNmis168ZQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmah83QFAwAAAAAACgkQsN6d1ii/Ey/v
5gf/Qx6wAjba0UmYYUPL5UgT5CqZmYLphB6cbdnGR4hU2VofE4OLzZnStQSuDyPnNuNqaKrc9/+C
2B5PuyaCwKWrT6HY0g5RNIvKPFPxt3lPoF1w3NTTBW4PqGJIQbJSf0Z1P6XrdVfs5aF9W0MXai61
GhylftN2dKuszQvCQz9/pJU8hRT2DXPpuJ60e9WjvKn3K9gcuLM8yAfQGENFPlu6eTs+JZlsAI2H
4HjYv7WrT01FQtrKSfU0BIV//l+G6FUM0LsA/PpGSXt26cbX27uDeKhasRxIRBegSH+o905ZrP5Y
1pnwy95JusQOoUVvA8ofeu7AHPjh8BblkTzXatx+Og==
=TWi8
-----END PGP SIGNATURE-----

--------------7cdd5Knu3JOrgWvNmis168ZQ--

