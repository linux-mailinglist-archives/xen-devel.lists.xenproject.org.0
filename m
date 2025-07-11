Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE9B0207A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 17:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041026.1412219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaFky-0005vR-9n; Fri, 11 Jul 2025 15:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041026.1412219; Fri, 11 Jul 2025 15:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaFky-0005sJ-68; Fri, 11 Jul 2025 15:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1041026;
 Fri, 11 Jul 2025 15:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uaFkw-0005s3-OC
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 15:33:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e8daa42-5e6c-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 17:33:45 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5213121169;
 Fri, 11 Jul 2025 15:33:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 250381388B;
 Fri, 11 Jul 2025 15:33:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2A4EBtgucWjJaAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Jul 2025 15:33:44 +0000
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
X-Inumbo-ID: 6e8daa42-5e6c-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752248024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l1JNOF279ETzPkLm7kwCoDXl7BwKGGEHNrSJGirwVxU=;
	b=i5EHLPQzvrvNXSnP8G/VJ79ZhHyJxjw7QXr4hCnnwX0Hd7GuFCBHCZf2zFoKNdLK0hzPT1
	VIVn7b3EOxTg6iDnzb4A3ReH3bzIlIpyDymqG1jvJHGrPsK2veIlB8vRSb5i1cvLb+aqkS
	JbM+fbD1MwWOzNKhg0lohS5fb5mNmTw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752248024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l1JNOF279ETzPkLm7kwCoDXl7BwKGGEHNrSJGirwVxU=;
	b=i5EHLPQzvrvNXSnP8G/VJ79ZhHyJxjw7QXr4hCnnwX0Hd7GuFCBHCZf2zFoKNdLK0hzPT1
	VIVn7b3EOxTg6iDnzb4A3ReH3bzIlIpyDymqG1jvJHGrPsK2veIlB8vRSb5i1cvLb+aqkS
	JbM+fbD1MwWOzNKhg0lohS5fb5mNmTw=
Message-ID: <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
Date: Fri, 11 Jul 2025 17:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
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
In-Reply-To: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rqxqtOGgqO0ahnRMFJSeYGDi"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rqxqtOGgqO0ahnRMFJSeYGDi
Content-Type: multipart/mixed; boundary="------------YHSirK61DnQI0tDWP6m5SeyB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
In-Reply-To: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>

--------------YHSirK61DnQI0tDWP6m5SeyB
Content-Type: multipart/mixed; boundary="------------00plCIAGcT6Ejd6mrIjaB38u"

--------------00plCIAGcT6Ejd6mrIjaB38u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDcuMjUgMTg6MTEsIEFudGhvaW5lIEJvdXJnZW9pcyB3cm90ZToNCj4gV2UgZm91
bmQgYXQgVmF0ZXMgdGhhdCB0aGVyZSBhcmUgbG90IG9mIHNwdXJpb3VzIGludGVycnVwdHMg
d2hlbg0KPiBiZW5jaG1hcmtpbmcgdGhlIFBWIGRyaXZlcnMgb2YgWGVuLiBUaGlzIGlzc3Vl
IGFwcGVhcmVkIHdpdGggYSBwYXRjaA0KPiB0aGF0IGFkZHJlc3NlcyBzZWN1cml0eSBpc3N1
ZSBYU0EtMzkxIChzZWUgRml4ZXMgYmVsb3cpLiBPbiBhbiBpcGVyZg0KPiBiZW5jaG1hcmss
IHNwdXJpb3VzIGludGVycnVwdHMgY2FuIHJlcHJlc2VudCB1cCB0byA1MCUgb2YgdGhlDQo+
IGludGVycnVwdHMuDQo+IA0KPiBTcHVyaW91cyBpbnRlcnJ1cHRzIGFyZSBpbnRlcnJ1cHRz
IHRoYXQgYXJlIHJpc2VkIGZvciBub3RoaW5nLCB0aGVyZSBpcw0KPiBubyB3b3JrIHRvIGRv
LiBUaGlzIGFwcGVuZHMgYmVjYXVzZSB0aGUgZnVuY3Rpb24gdGhhdCBoYW5kbGVzIHRoZQ0K
PiBpbnRlcnJ1cHRzICgieGVubmV0X3R4X2J1Zl9nYyIpIGlzIGFsc28gY2FsbGVkIGF0IHRo
ZSBlbmQgb2YgdGhlIHJlcXVlc3QNCj4gcGF0aCB0byBnYXJiYWdlIGNvbGxlY3QgdGhlIHJl
c3BvbnNlcyByZWNlaXZlZCBkdXJpbmcgdGhlIHRyYW5zbWlzc2lvbg0KPiBsb2FkLg0KPiAN
Cj4gVGhlIHJlcXVlc3QgcGF0aCBpcyBkb2luZyB0aGUgd29yayB0aGF0IHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciBzaG91bGQNCj4gaGF2ZSBkb25lIG90aGVyd2lzZS4gVGhpcyBpcyBwYXJ0
aWN1cmFyeSB0cnVlIHdoZW4gdGhlcmUgaXMgbW9yZSB0aGFuDQo+IG9uZSB2Y3B1IGFuZCBn
ZXQgd29yc2UgbGluZWFybHkgd2l0aCB0aGUgbnVtYmVyIG9mIHZjcHUvcXVldWUuDQo+IA0K
PiBNb3Jlb3ZlciwgdGhpcyBwcm9ibGVtIGlzIGFtcGxpZnllZCBieSB0aGUgcGVuYWx0eSBp
bXBvc2VkIGJ5IGEgc3B1cmlvdXMNCj4gaW50ZXJydXB0LiBXaGVuIGFuIGludGVycnVwdCBp
cyBmb3VuZCBzcHVyaW91cyB0aGUgaW50ZXJydXB0IGNoaXAgd2lsbA0KPiBkZWxheSB0aGUg
RU9JIHRvIHNsb3dkb3duIHRoZSBiYWNrZW5kLiBUaGlzIGRlbGF5IHdpbGwgYWxsb3cgbW9y
ZQ0KPiByZXNwb25zZXMgdG8gYmUgaGFuZGxlZCBieSB0aGUgcmVxdWVzdCBwYXRoIGFuZCB0
aGVuIHRoZXJlIHdpbGwgYmUgbW9yZQ0KPiBjaGFuY2UgdGhlIG5leHQgaW50ZXJydXB0IHdp
bGwgbm90IGZpbmQgYW55IHdvcmsgdG8gZG8sIGNyZWF0aW5nIGEgbmV3DQo+IHNwdXJpb3Vz
IGludGVycnVwdC4NCj4gDQo+IFRoaXMgY2F1c2VzIHBlcmZvcm1hbmNlIGlzc3VlLiBUaGUg
c29sdXRpb24gaGVyZSBpcyB0byByZW1vdmUgdGhlIGNhbGxzDQo+IGZyb20gdGhlIHJlcXVl
c3QgcGF0aCBhbmQgbGV0IHRoZSBpbnRlcnJ1cHQgaGFuZGxlciBkbyB0aGUgcHJvY2Vzc2lu
ZyBvZg0KPiB0aGUgcmVzcG9uc2VzLiBUaGlzIGFwcHJvY2ggcmVtb3ZlcyBzcHVyaW91cyBp
bnRlcnJ1cHRzICg8MC4wNSUpIGFuZA0KPiBhbHNvIGhhcyB0aGUgYmVuZWZpdCBvZiBmcmVl
aW5nIHVwIGN5Y2xlcyBpbiB0aGUgcmVxdWVzdCBwYXRoLCBhbGxvd2luZw0KPiBpdCB0byBw
cm9jZXNzIG1vcmUgd29yaywgd2hpY2ggaW1wcm92ZXMgcGVyZm9ybWFuY2UgY29tcGFyZWQg
dG8gbWFza2luZw0KPiB0aGUgc3B1cmlvdXMgaW50ZXJydXB0IG9uZSB3YXkgb3IgYW5vdGhl
ci4NCj4gDQo+IFNvbWUgdmlmIHRocm91Z2hwdXQgcGVyZm9ybWFuY2UgZmlndXJlcyBmcm9t
IGEgOCB2Q1BVcywgNEdCIG9mIFJBTSBIVk0NCj4gZ3Vlc3Qocyk6DQo+IA0KPiBXaXRob3V0
IHRoaXMgcGF0Y2ggb24gdGhlIDoNCj4gdm0gLT4gZG9tMDogNC41R2Ivcw0KPiB2bSAtPiB2
bTogICA3LjBHYi9zDQo+IA0KPiBXaXRob3V0IFhTQS0zOTEgcGF0Y2ggKHJldmVydCBvZiBi
MjdkNDc5NTBlNDgpOg0KPiB2bSAtPiBkb20wOiA4LjNHYi9zDQo+IHZtIC0+IHZtOiAgIDgu
N0diL3MNCj4gDQo+IFdpdGggWFNBLTM5MSBhbmQgdGhpcyBwYXRjaDoNCj4gdm0gLT4gZG9t
MDogMTEuNUdiL3MNCj4gdm0gLT4gdm06ICAgMTIuNkdiL3MNCj4gDQo+IEZpeGVzOiBiMjdk
NDc5NTBlNDggKCJ4ZW4vbmV0ZnJvbnQ6IGhhcmRlbiBuZXRmcm9udCBhZ2FpbnN0IGV2ZW50
IGNoYW5uZWwgc3Rvcm1zIikNCj4gU2lnbmVkLW9mZi1ieTogQW50aG9pbmUgQm91cmdlb2lz
IDxhbnRob2luZS5ib3VyZ2VvaXNAdmF0ZXMudGVjaD4NCg0KUGxlYXNlIHJlc2VuZCB0aGlz
IHBhdGNoIHdpdGggdGhlIHJlbGV2YW50IG1haW50YWluZXJzIGFkZGVkIGluIHRoZQ0KcmVj
aXBpZW50cyBsaXN0Lg0KDQpZb3UgY2FuIGFkZCBteSBSZXZpZXdlZC1ieTogdGFnLCBvZiBj
b3Vyc2UuDQoNCg0KSnVlcmdlbg0K
--------------00plCIAGcT6Ejd6mrIjaB38u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------00plCIAGcT6Ejd6mrIjaB38u--

--------------YHSirK61DnQI0tDWP6m5SeyB--

--------------rqxqtOGgqO0ahnRMFJSeYGDi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhxLtcFAwAAAAAACgkQsN6d1ii/Ey8C
gQf+OLBYLEbOvDfUSeqac+QUZMnnyL4lEmIunyM/HXgaWwjK76A4gxlUpzdsRAWP1A2rTCfqNIUb
vnX5PsIlRLKwwBIOjFgdGhirzioLeTUxydL00R0XL9z1hM2yzRxxU+40faKp8BAnN5KsCLkmMgeb
S0wkVP2hrsAkstFBr0azT6GgYyMhhgXQyEHFT0CUh4+UahGIhGFz1roZKAqvo1qy8Vs21fWfiGF7
5FO3QW35T2+YvlmfcUmRChSEpEhQFjizQQUblxpp1q7E8gwN53cchaxvw9XxthZDwjHvFr2h3WPQ
39rCrnb9za9Q3P7vJCHBVbAPEpaU2VD3BHt2J+xXBw==
=2yL5
-----END PGP SIGNATURE-----

--------------rqxqtOGgqO0ahnRMFJSeYGDi--

