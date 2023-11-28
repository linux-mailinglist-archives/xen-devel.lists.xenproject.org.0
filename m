Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5A67FBF20
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 17:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643317.1003387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80qq-0001K2-OB; Tue, 28 Nov 2023 16:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643317.1003387; Tue, 28 Nov 2023 16:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80qq-0001Ha-KV; Tue, 28 Nov 2023 16:22:20 +0000
Received: by outflank-mailman (input) for mailman id 643317;
 Tue, 28 Nov 2023 16:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TP6=HJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r80qp-0001HP-EQ
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 16:22:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c43835f-8e0a-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 17:22:18 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B64BE219A1;
 Tue, 28 Nov 2023 16:22:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 559261343E;
 Tue, 28 Nov 2023 16:22:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id y4GgE7gTZmVkYgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 28 Nov 2023 16:22:16 +0000
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
X-Inumbo-ID: 4c43835f-8e0a-11ee-98e3-6d05b1d4d9a1
Message-ID: <124182f6-d180-418c-87bb-ecf07325263b@suse.com>
Date: Tue, 28 Nov 2023 17:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>,
 Julia Zhang <Julia.Zhang@amd.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook>
 <6ee9c6e2-7ebf-42c6-a923-57f9da093160@suse.com> <ZWYRHqie0oVuawmc@macbook>
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
In-Reply-To: <ZWYRHqie0oVuawmc@macbook>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZE3tIsS7otW762Ep0kolU7Fj"
X-Spamd-Bar: +++++++++++++++++
X-Spam-Score: 17.18
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine)
X-Rspamd-Queue-Id: B64BE219A1
X-Spam-Flag: NO
X-Spam-Level: *****************
X-Spamd-Result: default: False [17.18 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.992];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_SPAM_LONG(2.38)[0.680];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZE3tIsS7otW762Ep0kolU7Fj
Content-Type: multipart/mixed; boundary="------------PpgFhmwiVEuKGbMdTdxOXh7C";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>,
 Julia Zhang <Julia.Zhang@amd.com>
Message-ID: <124182f6-d180-418c-87bb-ecf07325263b@suse.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook>
 <6ee9c6e2-7ebf-42c6-a923-57f9da093160@suse.com> <ZWYRHqie0oVuawmc@macbook>
In-Reply-To: <ZWYRHqie0oVuawmc@macbook>

--------------PpgFhmwiVEuKGbMdTdxOXh7C
Content-Type: multipart/mixed; boundary="------------hRAxNc87dZdXq79HDhcyF7nu"

--------------hRAxNc87dZdXq79HDhcyF7nu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMTEuMjMgMTc6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFR1ZSwg
Tm92IDI4LCAyMDIzIGF0IDAzOjQyOjMxUE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
DQo+PiBPbiAyOC4xMS4yMyAxNToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBP
biBGcmksIE5vdiAyNCwgMjAyMyBhdCAwNjo0MTozNlBNICswODAwLCBKaXFpYW4gQ2hlbiB3
cm90ZToNCj4+Pj4gSW4gUFZIIGRvbTAsIGl0IHVzZXMgdGhlIGxpbnV4IGxvY2FsIGludGVy
cnVwdCBtZWNoYW5pc20sDQo+Pj4+IHdoZW4gaXQgYWxsb2NzIGlycSBmb3IgYSBnc2ksIGl0
IGlzIGR5bmFtaWMsIGFuZCBmb2xsb3cNCj4+Pj4gdGhlIHByaW5jaXBsZSBvZiBhcHBseWlu
ZyBmaXJzdCwgZGlzdHJpYnV0aW5nIGZpcnN0LiBBbmQNCj4+Pj4gaWYgeW91IGRlYnVnIHRo
ZSBrZXJuZWwgY29kZXMsIHlvdSB3aWxsIGZpbmQgdGhlIGlycQ0KPj4+PiBudW1iZXIgaXMg
YWxsb2NlZCBmcm9tIHNtYWxsIHRvIGxhcmdlLCBidXQgdGhlIGFwcGx5aW5nDQo+Pj4+IGdz
aSBudW1iZXIgaXMgbm90LCBtYXkgZ3NpIDM4IGNvbWVzIGJlZm9yZSBnc2kgMjgsIHRoYXQN
Cj4+Pj4gY2F1c2VzIHRoZSBpcnEgbnVtYmVyIGlzIG5vdCBlcXVhbCB3aXRoIHRoZSBnc2kg
bnVtYmVyLg0KPj4+PiBBbmQgd2hlbiB3ZSBwYXNzdGhyb3VnaCBhIGRldmljZSwgUUVNVSB3
aWxsIHVzZSBpdHMgZ3NpDQo+Pj4+IG51bWJlciB0byBkbyBtYXBwaW5nIGFjdGlvbnMsIHNl
ZSB4ZW5fcHRfcmVhbGl6ZS0+DQo+Pj4+IHhjX3BoeXNkZXZfbWFwX3BpcnEsIGJ1dCB0aGUg
Z3NpIG51bWJlciBpcyBnb3QgZnJvbSBmaWxlDQo+Pj4+IC9zeXMvYnVzL3BjaS9kZXZpY2Vz
L3h4eHg6eHg6eHgueC9pcnEgaW4gY3VycmVudCBjb2RlLA0KPj4+PiBzbyBpdCB3aWxsIGZh
aWwgd2hlbiBtYXBwaW5nLg0KPj4+PiBBbmQgaW4gY3VycmVudCBjb2RlcywgdGhlcmUgaXMg
bm8gbWV0aG9kIHRvIHRyYW5zbGF0ZQ0KPj4+PiBpcnEgdG8gZ3NpIGZvciB1c2Vyc3BhY2Uu
DQo+Pj4NCj4+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFuZXIgdG8ganVzdCBpbnRyb2R1
Y2UgYSBuZXcgc3lzZnMgbm9kZSB0aGF0DQo+Pj4gY29udGFpbnMgdGhlIGdzaSBpZiBhIGRl
dmljZSBpcyB1c2luZyBvbmUgKG11Y2ggbGlrZSB0aGUgaXJxIHN5c2ZzDQo+Pj4gbm9kZSk/
DQo+Pj4NCj4+PiBTdWNoIGlvY3RsIHRvIHRyYW5zbGF0ZSBmcm9tIElSUSB0byBHU0kgaGFz
IG5vdGhpbmcgdG8gZG8gd2l0aCBYZW4sIHNvDQo+Pj4gcGxhY2luZyBpdCBpbiBwcml2Y21k
IGRvZXMgc2VlbSBxdWl0ZSBzdHJhbmdlIHRvIG1lLiAgSSB1bmRlcnN0YW5kDQo+Pj4gdGhh
dCBmb3IgcGFzc3Rocm91Z2ggd2UgbmVlZCB0aGUgR1NJLCBidXQgc3VjaCB0cmFuc2xhdGlv
biBsYXllciBmcm9tDQo+Pj4gSVJRIHRvIEdTSSBpcyBhbGwgTGludXggaW50ZXJuYWwsIGFu
ZCBpdCB3b3VsZCBiZSBtdWNoIHNpbXBsZXIgdG8ganVzdA0KPj4+IGV4cG9zZSB0aGUgR1NJ
IGluIHN5c2ZzIElNTy4NCj4+DQo+PiBZb3UgYXJlIGF3YXJlIHRoYXQgd2UgaGF2ZSBhIFhl
biBzcGVjaWZpYyB2YXJpYW50IG9mIGFjcGlfcmVnaXN0ZXJfZ3NpKCk/DQo+Pg0KPj4gSXQg
aXMgdGhlIFhlbiBldmVudCBjaGFubmVsIGRyaXZlciBiZWluZyByZXNwb25zaWJsZSBmb3Ig
dGhlIEdTSTwtPklSUQ0KPj4gbWFwcGluZy4NCj4gDQo+IEknbSBraW5kIG9mIGxvc3QsIHRo
aXMgdHJhbnNsYXRpb24gZnVuY3Rpb24gaXMgc3BlY2lmaWNhbGx5IG5lZWRlZCBmb3INCj4g
UFZIIHdoaWNoIGRvZXNuJ3QgdXNlIHRoZSBYZW4gc3BlY2lmaWMgdmFyaWFudCBvZiBhY3Bp
X3JlZ2lzdGVyX2dzaSgpLA0KPiBhbmQgaGVuY2UgdGhlIElSUSA8LT4gR1NJIHJlbGF0aW9u
IGlzIHdoYXRldmVyIHRoZSBMaW51eCBrZXJuZWwgZG9lcw0KPiBvbiBuYXRpdmUuDQo+IA0K
PiBJIGRvIHVuZGVyc3RhbmQgdGhhdCBvbiBhIFBWIGRvbTAgdGhlIHByb3Bvc2VkIHN5c2Zz
IGdzaSBub2RlIHdvdWxkDQo+IG1hdGNoIHRoZSBpcnEgbm9kZSwgYnV0IHRoYXQgZG9lc24n
dCBzZWVtIGxpa2UgYW4gaXNzdWUgdG8gbWUuDQo+IA0KPiBOb3RlIGFsc28gdGhhdCBQVkgg
ZG9lc24ndCB1c2UgYWNwaV9yZWdpc3Rlcl9nc2lfeGVuX2h2bSgpIGJlY2F1c2UNCj4gWEVO
RkVBVF9odm1fcGlycXMgZmVhdHVyZSBpcyBub3QgZXhwb3NlZCB0byBQVkgsIHNvIEkgZXhw
ZWN0IGl0IHVzZXMNCj4gdGhlIHg4NiBhY3BpX3JlZ2lzdGVyX2dzaV9pb2FwaWMoKS4NCg0K
T2gsIEkgd2Fzbid0IGF3YXJlIG9mIHRoaXMuDQoNClNvcnJ5IGZvciB0aGUgbm9pc2UuDQoN
Cg0KSnVlcmdlbg0K
--------------hRAxNc87dZdXq79HDhcyF7nu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hRAxNc87dZdXq79HDhcyF7nu--

--------------PpgFhmwiVEuKGbMdTdxOXh7C--

--------------ZE3tIsS7otW762Ep0kolU7Fj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVmE7cFAwAAAAAACgkQsN6d1ii/Ey8R
bgf/ZXL7CoWbkpIYw1Kt/tIDTbjdNTizT2oBdlNJgYPNGxb4ptRFawnzGb5Ru95jqXxNuNQVdZNX
+b4berVxGAJaNV5+Rl0IAt+ciSPsNlc3slIOLjZhgG6A7YDXbHvTTFCfy+HJWmXx5oYQvpnIu1ab
cK3CdSVNROLaSuOi/z3VPnC3nSkKd8PO5HeiXqT49PWEvT/2kmEoJJIbiPxLyE4Z1QqRWIWtvXwn
hWYesaKcklx3Xwfzf8+9HC8GgELDKTT56HYsySro3SBR+nPRgzGKv3gtpCqDQZjm5cpvd7XOb8HT
K8JjYBogmsLNUsv8+bcuc0daI91UF99R/KasqtSy8A==
=0jY1
-----END PGP SIGNATURE-----

--------------ZE3tIsS7otW762Ep0kolU7Fj--

