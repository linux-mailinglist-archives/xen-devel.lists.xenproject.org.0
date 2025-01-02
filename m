Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030AF9FF8BF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 12:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863838.1275212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTJP4-000798-G8; Thu, 02 Jan 2025 11:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863838.1275212; Thu, 02 Jan 2025 11:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTJP4-00077S-DH; Thu, 02 Jan 2025 11:30:14 +0000
Received: by outflank-mailman (input) for mailman id 863838;
 Thu, 02 Jan 2025 11:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDYY=T2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tTJP3-00077M-ST
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 11:30:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edd7cbac-c8fc-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 12:30:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7594B21137;
 Thu,  2 Jan 2025 11:30:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59FC8132EA;
 Thu,  2 Jan 2025 11:30:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6JAPFMN4dmcJaQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 02 Jan 2025 11:30:11 +0000
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
X-Inumbo-ID: edd7cbac-c8fc-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1735817411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xyUio7lSk1U6AN0CWOCnh5MTHrtv8WAb4hH4TxOzFMY=;
	b=bz5xvm47c4wpoCQbCQQ9AvxmMgHIDIUDMHLL5x+S2KUfuTztOOHwSwf6tTn0x0n1d+bgds
	O+jg9wcaT+1JXF4M/RAPBcDY1rGqItJKisp+nBRLFIu72FA6sf/SCHwJJTH/h58mmdxZX+
	7lsvzLMYmg0q0voVaUdEqYN9h5HmHio=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=bz5xvm47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1735817411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xyUio7lSk1U6AN0CWOCnh5MTHrtv8WAb4hH4TxOzFMY=;
	b=bz5xvm47c4wpoCQbCQQ9AvxmMgHIDIUDMHLL5x+S2KUfuTztOOHwSwf6tTn0x0n1d+bgds
	O+jg9wcaT+1JXF4M/RAPBcDY1rGqItJKisp+nBRLFIu72FA6sf/SCHwJJTH/h58mmdxZX+
	7lsvzLMYmg0q0voVaUdEqYN9h5HmHio=
Message-ID: <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
Date: Thu, 2 Jan 2025 12:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
Content-Language: en-US
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
In-Reply-To: <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yGxS3TVPBwNB5uOZcFX5nauL"
X-Rspamd-Queue-Id: 7594B21137
X-Spam-Level: 
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ATTACHMENT(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.41
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yGxS3TVPBwNB5uOZcFX5nauL
Content-Type: multipart/mixed; boundary="------------h2fdSkqB4zp6tCOCDgoUle7n";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
In-Reply-To: <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>

--------------h2fdSkqB4zp6tCOCDgoUle7n
Content-Type: multipart/mixed; boundary="------------NaGY6z04VntU0UMIrtOt4oCn"

--------------NaGY6z04VntU0UMIrtOt4oCn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDEuMjUgMTE6MjAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDE5LjEyLjI0
IDE3OjE0LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+PiBIaSwNCj4+
DQo+PiBJdCBjcmFzaGVzIG9uIGJvb3QgbGlrZSBiZWxvdywgbW9zdCBvZiB0aGUgdGltZXMu
IEJ1dCBzb21ldGltZXMgKHJhcmVseSkNCj4+IGl0IG1hbmFnZXMgdG8gc3RheSBhbGl2ZS4g
QmVsb3cgSSdtIHBhc3RpbmcgZmV3IG9mIHRoZSBjcmFzaGVzIHRoYXQgbG9vaw0KPj4gZGlz
dGluY3RseSBkaWZmZXJlbnQsIGlmIHlvdSBmb2xsb3cgdGhlIGxpbmtzLCB5b3UgY2FuIGZp
bmQgbW9yZSBvZg0KPj4gdGhlbS4gSU1ITyBpdCBsb29rcyBsaWtlIHNvbWUgbWVtb3J5IGNv
cnJ1cHRpb24gYnVnIHNvbWV3aGVyZS4gSSB0ZXN0ZWQNCj4+IGFsc28gTGludXggNi4xMy1y
YzIgYmVmb3JlLCBhbmQgaXQgaGFkIHZlcnkgc2ltaWxhciBpc3N1ZS4NCj4gDQo+IC4uLg0K
PiANCj4+DQo+PiBGdWxsIGxvZzoNCj4+IGh0dHBzOi8vb3BlbnFhLnF1YmVzLW9zLm9yZy90
ZXN0cy8xMjI4NzkvbG9nZmlsZT9maWxlbmFtZT1zZXJpYWwwLnR4dA0KPiANCj4gSSBjYW4g
cmVwcm9kdWNlIGEgY3Jhc2ggd2l0aCA2LjEzLXJjNSBQViBkb20wLg0KPiANCj4gV2hhdCBp
cyByZWFsbHkgaW50ZXJlc3RpbmcgaW4gdGhlIGxvZ3M6IG1vc3QgY3Jhc2hlcyBzZWVtIHRv
IGhhcHBlbiByaWdodA0KPiBhZnRlciBhIG1vZHVsZSBiZWluZyBsb2FkZWQgKGluIG15IHJl
cHJvZHVjZXIgaXQgd2FzIHJpZ2h0IGFmdGVyIGxvYWRpbmcNCj4gdGhlIGZpcnN0IG1vZHVs
ZSkuDQo+IA0KPiBJIG5lZWQgdG8gZ28gdGhyb3VnaCB0aGUgNi4xMyBjb21taXRzLCBidXQg
SSB0aGluayBJIHJlbWVtYmVyIGhhdmluZyBzZWVuDQo+IGEgcGF0Y2ggb3B0aW1pemluZyBt
b2R1bGUgbG9hZGluZyBieSB1c2luZyBsYXJnZSBwYWdlcyBmb3IgYWRkcmVzc2luZyB0aGUN
Cj4gbG9hZGVkIG1vZHVsZXMuIE1heWJlIHRoZSBjYXNlIG9mIG5vIGxhcmdlIHBhZ2VzIGJl
aW5nIGF2YWlsYWJsZSBpc24ndA0KPiBoYW5kbGVkIHByb3Blcmx5Lg0KDQpTZWVtcyBJIHdh
cyByaWdodC4NCg0KRm9yIG1lIHRoZSBmb2xsb3dpbmcgZGlmZiBmaXhlcyB0aGUgaXNzdWUu
IE1hcmVrLCBjYW4geW91IHBsZWFzZSBjb25maXJtDQppdCBmaXhlcyB5b3VyIGNyYXNoZXMs
IHRvbz8NCg0KZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL2luaXQuYyBiL2FyY2gveDg2L21t
L2luaXQuYw0KaW5kZXggYzZkMjlmMjgzMDAxLi5iNWI3OTY0YjM0YjAgMTAwNjQ0DQotLS0g
YS9hcmNoL3g4Ni9tbS9pbml0LmMNCisrKyBiL2FyY2gveDg2L21tL2luaXQuYw0KQEAgLTEw
ODAsNyArMTA4MCw3IEBAIHN0cnVjdCBleGVjbWVtX2luZm8gX19pbml0ICpleGVjbWVtX2Fy
Y2hfc2V0dXAodm9pZCkNCg0KICAgICAgICAgc3RhcnQgPSBNT0RVTEVTX1ZBRERSICsgb2Zm
c2V0Ow0KDQotICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19BUkNIX0hBU19FWEVDTUVN
X1JPWCkpIHsNCisgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX0VYRUNN
RU1fUk9YKSAmJiANCmNwdV9mZWF0dXJlX2VuYWJsZWQoWDg2X0ZFQVRVUkVfUFNFKSkgew0K
ICAgICAgICAgICAgICAgICBwZ3Byb3QgPSBQQUdFX0tFUk5FTF9ST1g7DQogICAgICAgICAg
ICAgICAgIGZsYWdzID0gRVhFQ01FTV9LQVNBTl9TSEFET1cgfCBFWEVDTUVNX1JPWF9DQUNI
RTsNCiAgICAgICAgIH0gZWxzZSB7DQoNCg0KSnVlcmdlbg0K
--------------NaGY6z04VntU0UMIrtOt4oCn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NaGY6z04VntU0UMIrtOt4oCn--

--------------h2fdSkqB4zp6tCOCDgoUle7n--

--------------yGxS3TVPBwNB5uOZcFX5nauL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd2eMIFAwAAAAAACgkQsN6d1ii/Ey+8
pQf8DCTYKUxyaoIRjC55vU+DBj+EQgnhQ0JuRyjUeBcitWLWLDppodrSOUBAFvkI6Vr05+QoaUPv
3HR5JSrZhHE4YXC25CBoIrhtg6WW93QZnGjWN8Wj2tjKcaRlvDn3xhRVHpo0m0UUlzZUawxjSFot
W3o/MFJ9XJkqMWUQjYe7dUcVqPMhWTJ55kIS0C29kwEZKgv248ocpukZIVSKt0qmnef0jZpMwcbz
qVtqEn/jH+CBcIPc47jIVJcusJwUXPX8BtR0s+LWQeQZrmtUGtj84xD2r82dLYcAPiMNh/XMj/t/
uHHIfpw8T1Ir0+Vs54kAbFt7wvSwzuaT9e07aAh7ow==
=ON5l
-----END PGP SIGNATURE-----

--------------yGxS3TVPBwNB5uOZcFX5nauL--

