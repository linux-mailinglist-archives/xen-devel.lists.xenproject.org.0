Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA237FD61D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 12:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643870.1004392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8JD7-0006f1-U2; Wed, 29 Nov 2023 11:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643870.1004392; Wed, 29 Nov 2023 11:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8JD7-0006dJ-PS; Wed, 29 Nov 2023 11:58:33 +0000
Received: by outflank-mailman (input) for mailman id 643870;
 Wed, 29 Nov 2023 11:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q0oM=HK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r8JD6-0006dB-1Q
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 11:58:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c6681d9-8eae-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 12:58:29 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E7F5721AC1;
 Wed, 29 Nov 2023 11:58:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C900B1388B;
 Wed, 29 Nov 2023 11:58:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Bxa8L2QnZ2VaKQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Nov 2023 11:58:28 +0000
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
X-Inumbo-ID: 9c6681d9-8eae-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701259108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v65posCqtlgdYTkU3VCDDqsNYDig9U6BO4O0aGcFqic=;
	b=osFyS/+ibcaNtdYdikI1+9R6OD/xTbSpijOPDwx15yfXgvTgJXzrRNl8S27o8TuUtEJFWY
	RyLQ1dJLAFiPHoKBPzJxWkuhoPwAFlr6ywH42n5YoDMEv2WYXHsyCrm+JP2c4Glvn97jWW
	EZiqh2rVYChkC8htZFJm89GYgasl5vM=
Message-ID: <de3fcfc2-b92c-469d-b7fb-7eb1e9b4a38a@suse.com>
Date: Wed, 29 Nov 2023 12:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230725135557.20518-1-jgross@suse.com>
 <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
 <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
 <6cd0c3e2-ecae-971a-5c86-cf408591bee9@suse.com>
 <6300d166-621e-83bf-0ac2-70ea89b75492@suse.com>
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
In-Reply-To: <6300d166-621e-83bf-0ac2-70ea89b75492@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WdKaSu3H5MOsdKlkDGhaVzwA"
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-6.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
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
X-Spam-Score: -6.19

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WdKaSu3H5MOsdKlkDGhaVzwA
Content-Type: multipart/mixed; boundary="------------THkV8N8d00y0NuY0touZhnfr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <de3fcfc2-b92c-469d-b7fb-7eb1e9b4a38a@suse.com>
Subject: Re: [PATCH] xen/public: fix flexible array definitions
References: <20230725135557.20518-1-jgross@suse.com>
 <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
 <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
 <6cd0c3e2-ecae-971a-5c86-cf408591bee9@suse.com>
 <6300d166-621e-83bf-0ac2-70ea89b75492@suse.com>
In-Reply-To: <6300d166-621e-83bf-0ac2-70ea89b75492@suse.com>

--------------THkV8N8d00y0NuY0touZhnfr
Content-Type: multipart/mixed; boundary="------------0FM6i8fnoKkhlHTAKVU11dil"

--------------0FM6i8fnoKkhlHTAKVU11dil
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDguMjMgMTE6NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDI2LjA3LjIz
IDA3OjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDI1LjA3LjIwMjMgMTg6NTksIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMjUvMDcvMjAyMyA1OjE2IHBtLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4gT24gMjUuMDcuMjAyMyAxNTo1NSwgSnVlcmdlbiBHcm9zcyB3
cm90ZToNCj4+Pj4+IEZsZXhpYmxlIGFycmF5cyBpbiBwdWJsaWMgaGVhZGVycyBjYW4gYmUg
cHJvYmxlbWF0aWMgd2l0aCBzb21lDQo+Pj4+PiBjb21waWxlcnMuDQo+Pj4+Pg0KPj4+Pj4g
UmVwbGFjZSB0aGVtIHdpdGggYXJyW1hFTl9GTEVYX0FSUkFZX0RJTV0gaW4gb3JkZXIgdG8g
YXZvaWQgY29tcGlsYXRpb24NCj4+Pj4+IGVycm9ycy4NCj4+Pj4+DQo+Pj4+PiBUaGlzIGlu
Y2x1ZGVzIGFycmF5cyBkZWZpbmVkIGFzICJhcnJbMV0iLCBhcyBzZWVuIHdpdGggYSByZWNl
bnQgTGludXgNCj4+Pj4+IGtlcm5lbCBbMV0uDQo+Pj4+Pg0KPj4+Pj4gWzFdOiBodHRwczov
L2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzY5Mw0KPj4+Pj4NCj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+
Pj4gSSB0aGluayB3ZSBuZWVkIHRvIGJlIGNhcmVmdWwgaGVyZTogV2hhdCBpZiBzb21lb25l
IHNvbWV3aGVyZSBhcHBsaWVzDQo+Pj4+IHNpemVvZigpIHRvIGFueSBvZiB0aGUgdHlwZXMg
eW91IGFsdGVyPw0KPj4+DQo+Pj4gVGhlbiB0aGUgY29kZSB3YXMgbW9zdCBsaWtlbHkgd3Jv
bmcgYWxyZWFkeS4NCj4+DQo+PiBUaGF0J3MgcG9zc2libGUgdG8ganVkZ2Ugb25seSB3aGVu
IHNlZWluZyB0aGUgY29kZSBpbiBxdWVzdGlvbi4NCj4+DQo+Pj4+IMKgIFRoZSByZXN1bHRp
bmcgdmFsdWUgd291bGQNCj4+Pj4gY2hhbmdlIHdpdGggdGhlIGNoYW5nZXMgeW91IHByb3Bv
c2UsIHdoaWNoIHdlIGNhbm5vdCBhbGxvdyB0byBoYXBwZW4NCj4+Pj4gaW4gYSBzdGFibGUg
aW50ZXJmYWNlLiBUaGVyZWZvcmUgaW1vIGl0IGNhbiBvbmx5IGJlIGFuIG9wdC1pbiBmZWF0
dXJlDQo+Pj4+IHRvIGhhdmUgdGhlc2UgYXJyYXlzIG5vIGxvbmdlciBiZSBvbmUtZWxlbWVu
dCBvbmVzLg0KPj4+DQo+Pj4gSSBkb24ndCBjb25zaWRlciB0aGlzIGFuIGlzc3VlLg0KPj4+
DQo+Pj4gSWYgcGVvcGxlIHRha2UgYW4gdXBkYXRlIHRvIHRoZSBoZWFkZXJzIGFuZCB0aGVp
ciBjb2RlIHN0b3BzIGNvbXBpbGluZywNCj4+PiB0aGVuIG9mIGNvdXJzZSB0aGV5IGZpeCB0
aGUgY29tcGlsYXRpb24gaXNzdWUuwqAgVGhhdCdzIG5vcm1hbC4NCj4+DQo+PiBUaGUgY29k
ZSBtYXkgY29udGludWUgdG8gY29tcGlsZSBmaW5lLCBhbmQgZXZlbiBhcHBlYXIgdG8gd29y
ayBpbml0aWFsbHkuDQo+Pg0KPj4+IEl0J3MgdW5yZWFzb25hYmxlIHRvIHRha2Ugb3B0LWlu
IGZlYXR1cmVzIHRvIGEgc2V0IG9mIGhlYWRlcnMgaW50ZW5kZWQNCj4+PiB0byBiZSB2ZW5k
b3JlZCBpbiB0aGUgZmlyc3QgcGxhY2UsIHRvIHdvcmsgYXJvdW5kIGEgY29ybmVyIGNhc2Ug
dGhhdCdzDQo+Pj4gbGlrZWx5IGJ1Z2d5IGFscmVhZHkuDQo+Pg0KPj4gVGhlIG9yaWdpbmFs
IGludGVudGlvbiBjbGVhcmx5IHdhcyB0byBhbGxvdyB1c2Ugb2YgdGhlc2UgaGVhZGVycyBh
cyBpcy4NCj4+IEFueXdheSwgSSd2ZSB2b2ljZWQgbXkgdmlldywgeWV0IGlmIHRoZXJlIGFy
ZSBlbm91Z2ggcGVvcGxlIGFncmVlaW5nDQo+PiB3aXRoIHlvdSwgdGhlbiBzbyBiZSBpdC4N
Cj4gDQo+IEFueSBmdXJ0aGVyIHRob3VnaHRzPw0KPiANCj4gSSBoYXZlIGNoZWNrZWQgdGhl
IGNvZGUgaW4gdGhlIExpbnV4IGtlcm5lbCBtZWFud2hpbGUuIFRoZXJlIHNob3VsZCBiZSBu
bw0KPiBmYWxsb3V0IHJlc3VsdGluZyBmcm9tIHRoaXMgY2hhbmdlLCBidXQgSSB0aGluayB0
aGVyZSBhcmUgc29tZSB1c2VyIG1vZGUNCj4gYmFja2VuZHMgb3V0c2lkZSBvZiBxZW11IHdo
aWNoIGFyZSBwcm9iYWJseSB1c2luZyBhZmZlY3RlZCBzdHJ1Y3RzLg0KDQpJJ3ZlIHJlY2Vp
dmVkIGFub3RoZXIgbWFpbCByZWdhcmRpbmcgdGhlIHJlcG9ydCBbMV0gYWJvdmUuIEkgdGhp
bmsgd2Ugc2hvdWxkDQpfcmVhbGx5XyBjb21lIHRvIGEgY29uY2x1c2lvbi4NCg0KSSdtIHN0
aWxsIGluIGZhdm9yIG9mIGFwcGx5aW5nIG15IHN1Z2dlc3RlZCBwYXRjaC4NCg0KDQpKdWVy
Z2VuDQo=
--------------0FM6i8fnoKkhlHTAKVU11dil
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0FM6i8fnoKkhlHTAKVU11dil--

--------------THkV8N8d00y0NuY0touZhnfr--

--------------WdKaSu3H5MOsdKlkDGhaVzwA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVnJ2QFAwAAAAAACgkQsN6d1ii/Ey/i
fAf+Ik/TKKEXDgWimmLva+PWlwcSA4TBLsht36btYbSycYQIYZlP8QkAzU2WtzuN3ZAIylPPXYcY
Fu8M1gSUtLX9ttzphLPZYezAEYNTaqy6MCG1or58Rvs7A532Fi2527TCgY5VAyB/tlpmcr+CCJ/A
q4x0Nqup01Iq02brOu3yPnAj9YpCE8N2TZAWerhzpFCXVzZ1MRGi4tudveh2I2S/LIEq1q+Nrs9U
NMD53/Xa4NyPVQRGyyWWbdHCx81bK8yW3OZQ7GirE2ytAG3SWvs9AVujKSjjT8vmi+FmH4nupuKn
ueoADUAURyKYAI51X1s5ZtSueUvhMYFeXJWBk3PtHg==
=95dH
-----END PGP SIGNATURE-----

--------------WdKaSu3H5MOsdKlkDGhaVzwA--

