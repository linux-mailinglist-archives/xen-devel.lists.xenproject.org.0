Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F637FEBC0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644500.1005588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dEy-0004Yp-R4; Thu, 30 Nov 2023 09:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644500.1005588; Thu, 30 Nov 2023 09:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dEy-0004VP-NY; Thu, 30 Nov 2023 09:21:48 +0000
Received: by outflank-mailman (input) for mailman id 644500;
 Thu, 30 Nov 2023 09:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XJ9b=HL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r8dEx-0003Yb-3o
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:21:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e17dd65c-8f61-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 10:21:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CADC21FC81;
 Thu, 30 Nov 2023 09:21:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A994B13AB1;
 Thu, 30 Nov 2023 09:21:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0KgXKChUaGWPfQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 30 Nov 2023 09:21:44 +0000
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
X-Inumbo-ID: e17dd65c-8f61-11ee-9b0f-b553b5be7939
Message-ID: <9dda7621-2f24-428b-be94-3590721dc9ef@suse.com>
Date: Thu, 30 Nov 2023 10:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230725135557.20518-1-jgross@suse.com>
 <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
 <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
 <6cd0c3e2-ecae-971a-5c86-cf408591bee9@suse.com>
 <6300d166-621e-83bf-0ac2-70ea89b75492@suse.com>
 <de3fcfc2-b92c-469d-b7fb-7eb1e9b4a38a@suse.com>
 <eb0f9b13-1b53-41ed-80f2-da468b13e1db@suse.com>
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
In-Reply-To: <eb0f9b13-1b53-41ed-80f2-da468b13e1db@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SHoNE0vxKOqOl0bIqH81jLoB"
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: CADC21FC81
X-Spam-Flag: YES
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SHoNE0vxKOqOl0bIqH81jLoB
Content-Type: multipart/mixed; boundary="------------hkLoTL8nVoglwQP0pIs8fnmv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9dda7621-2f24-428b-be94-3590721dc9ef@suse.com>
Subject: Re: [PATCH] xen/public: fix flexible array definitions
References: <20230725135557.20518-1-jgross@suse.com>
 <5ba647c0-fc74-595e-5fe3-658f4662f16e@suse.com>
 <f54fcb50-15c5-aa72-60fa-6370547bb9f2@citrix.com>
 <6cd0c3e2-ecae-971a-5c86-cf408591bee9@suse.com>
 <6300d166-621e-83bf-0ac2-70ea89b75492@suse.com>
 <de3fcfc2-b92c-469d-b7fb-7eb1e9b4a38a@suse.com>
 <eb0f9b13-1b53-41ed-80f2-da468b13e1db@suse.com>
In-Reply-To: <eb0f9b13-1b53-41ed-80f2-da468b13e1db@suse.com>

--------------hkLoTL8nVoglwQP0pIs8fnmv
Content-Type: multipart/mixed; boundary="------------8pVXV3m7f7QbWljAmNFaW4NZ"

--------------8pVXV3m7f7QbWljAmNFaW4NZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMTEuMjMgMDk6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4xMS4yMDIz
IDEyOjU4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDkuMDguMjMgMTE6NDIsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMjYuMDcuMjMgMDc6NTIsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+PiBPbiAyNS4wNy4yMDIzIDE4OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4+Pj4gT24gMjUvMDcvMjAyMyA1OjE2IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+PiBPbiAyNS4wNy4yMDIzIDE1OjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+
PiBGbGV4aWJsZSBhcnJheXMgaW4gcHVibGljIGhlYWRlcnMgY2FuIGJlIHByb2JsZW1hdGlj
IHdpdGggc29tZQ0KPj4+Pj4+PiBjb21waWxlcnMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFJlcGxh
Y2UgdGhlbSB3aXRoIGFycltYRU5fRkxFWF9BUlJBWV9ESU1dIGluIG9yZGVyIHRvIGF2b2lk
IGNvbXBpbGF0aW9uDQo+Pj4+Pj4+IGVycm9ycy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhpcyBp
bmNsdWRlcyBhcnJheXMgZGVmaW5lZCBhcyAiYXJyWzFdIiwgYXMgc2VlbiB3aXRoIGEgcmVj
ZW50IExpbnV4DQo+Pj4+Pj4+IGtlcm5lbCBbMV0uDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFsxXTog
aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTc2OTMNCj4+
Pj4+Pj4NCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPj4+Pj4+IEkgdGhpbmsgd2UgbmVlZCB0byBiZSBjYXJlZnVsIGhlcmU6IFdo
YXQgaWYgc29tZW9uZSBzb21ld2hlcmUgYXBwbGllcw0KPj4+Pj4+IHNpemVvZigpIHRvIGFu
eSBvZiB0aGUgdHlwZXMgeW91IGFsdGVyPw0KPj4+Pj4NCj4+Pj4+IFRoZW4gdGhlIGNvZGUg
d2FzIG1vc3QgbGlrZWx5IHdyb25nIGFscmVhZHkuDQo+Pj4+DQo+Pj4+IFRoYXQncyBwb3Nz
aWJsZSB0byBqdWRnZSBvbmx5IHdoZW4gc2VlaW5nIHRoZSBjb2RlIGluIHF1ZXN0aW9uLg0K
Pj4+Pg0KPj4+Pj4+ICDCoCBUaGUgcmVzdWx0aW5nIHZhbHVlIHdvdWxkDQo+Pj4+Pj4gY2hh
bmdlIHdpdGggdGhlIGNoYW5nZXMgeW91IHByb3Bvc2UsIHdoaWNoIHdlIGNhbm5vdCBhbGxv
dyB0byBoYXBwZW4NCj4+Pj4+PiBpbiBhIHN0YWJsZSBpbnRlcmZhY2UuIFRoZXJlZm9yZSBp
bW8gaXQgY2FuIG9ubHkgYmUgYW4gb3B0LWluIGZlYXR1cmUNCj4+Pj4+PiB0byBoYXZlIHRo
ZXNlIGFycmF5cyBubyBsb25nZXIgYmUgb25lLWVsZW1lbnQgb25lcy4NCj4+Pj4+DQo+Pj4+
PiBJIGRvbid0IGNvbnNpZGVyIHRoaXMgYW4gaXNzdWUuDQo+Pj4+Pg0KPj4+Pj4gSWYgcGVv
cGxlIHRha2UgYW4gdXBkYXRlIHRvIHRoZSBoZWFkZXJzIGFuZCB0aGVpciBjb2RlIHN0b3Bz
IGNvbXBpbGluZywNCj4+Pj4+IHRoZW4gb2YgY291cnNlIHRoZXkgZml4IHRoZSBjb21waWxh
dGlvbiBpc3N1ZS7CoCBUaGF0J3Mgbm9ybWFsLg0KPj4+Pg0KPj4+PiBUaGUgY29kZSBtYXkg
Y29udGludWUgdG8gY29tcGlsZSBmaW5lLCBhbmQgZXZlbiBhcHBlYXIgdG8gd29yayBpbml0
aWFsbHkuDQo+Pj4+DQo+Pj4+PiBJdCdzIHVucmVhc29uYWJsZSB0byB0YWtlIG9wdC1pbiBm
ZWF0dXJlcyB0byBhIHNldCBvZiBoZWFkZXJzIGludGVuZGVkDQo+Pj4+PiB0byBiZSB2ZW5k
b3JlZCBpbiB0aGUgZmlyc3QgcGxhY2UsIHRvIHdvcmsgYXJvdW5kIGEgY29ybmVyIGNhc2Ug
dGhhdCdzDQo+Pj4+PiBsaWtlbHkgYnVnZ3kgYWxyZWFkeS4NCj4+Pj4NCj4+Pj4gVGhlIG9y
aWdpbmFsIGludGVudGlvbiBjbGVhcmx5IHdhcyB0byBhbGxvdyB1c2Ugb2YgdGhlc2UgaGVh
ZGVycyBhcyBpcy4NCj4+Pj4gQW55d2F5LCBJJ3ZlIHZvaWNlZCBteSB2aWV3LCB5ZXQgaWYg
dGhlcmUgYXJlIGVub3VnaCBwZW9wbGUgYWdyZWVpbmcNCj4+Pj4gd2l0aCB5b3UsIHRoZW4g
c28gYmUgaXQuDQo+Pj4NCj4+PiBBbnkgZnVydGhlciB0aG91Z2h0cz8NCj4+Pg0KPj4+IEkg
aGF2ZSBjaGVja2VkIHRoZSBjb2RlIGluIHRoZSBMaW51eCBrZXJuZWwgbWVhbndoaWxlLiBU
aGVyZSBzaG91bGQgYmUgbm8NCj4+PiBmYWxsb3V0IHJlc3VsdGluZyBmcm9tIHRoaXMgY2hh
bmdlLCBidXQgSSB0aGluayB0aGVyZSBhcmUgc29tZSB1c2VyIG1vZGUNCj4+PiBiYWNrZW5k
cyBvdXRzaWRlIG9mIHFlbXUgd2hpY2ggYXJlIHByb2JhYmx5IHVzaW5nIGFmZmVjdGVkIHN0
cnVjdHMuDQo+Pg0KPj4gSSd2ZSByZWNlaXZlZCBhbm90aGVyIG1haWwgcmVnYXJkaW5nIHRo
ZSByZXBvcnQgWzFdIGFib3ZlLiBJIHRoaW5rIHdlIHNob3VsZA0KPj4gX3JlYWxseV8gY29t
ZSB0byBhIGNvbmNsdXNpb24uDQo+Pg0KPj4gSSdtIHN0aWxsIGluIGZhdm9yIG9mIGFwcGx5
aW5nIG15IHN1Z2dlc3RlZCBwYXRjaC4NCj4gDQo+IEkgdGhpbmsgdGhlIGNoYW5nZSB3b3Vs
ZCBiZSBmaW5lIHRvIG1ha2Ugd2hlbiBhZGp1c3RlZCB0byBiZSBjb25kaXRpb25hbA0KPiB1
cG9uIChzdWl0YWJseSBidW1wZWQpIF9fWEVOX0xBVEVTVF9JTlRFUkZBQ0VfVkVSU0lPTl9f
Lg0KDQpPa2F5LCBmaW5lIHdpdGggbWUuDQoNCj4gWWV0IHdoaWxlIGxvb2tpbmcgYXQgdGhl
IHBhdGNoIGFuZCB0aGUgaGVhZGVycyBhZ2FpbiwgaXQgYWxzbyBsb29rcyBhcyBpZg0KPiB0
aGVyZSBtaWdodCBiZSBhbm90aGVyIHNtYWxsIGlzc3VlOiByaW5nLmggdXNlcyBYRU5fRkxF
WF9BUlJBWV9ESU0gd2l0aG91dA0KPiBpdHNlbGYgaW5jbHVkaW5nIHhlbi5oLiBUaGF0J3Mg
cHJvYmFibHkgb2theSBjb25zaWRlcmluZyB0aGF0IGFsbCBoZWFkZXJzDQo+IGluY2x1ZGlu
ZyByaW5nLmggYWxzbyBpbmNsdWRlIGdyYW50X3RhYmxlLmggKHdoaWNoIGluIHR1cm4gaW5j
bHVkZXMgeGVuLmgpLA0KPiBidXQgdGhpcyBkZXBlbmRlbmN5IG1heSBzdGlsbCB3YW50IG1h
a2luZyBleHBsaWNpdC4NCg0KWWVzLCBJJ2xsIGFkZCB0aGF0Lg0KDQo+IEZpbmFsbHkgLSBp
cyB0aGUgY2hhbmdlIGFjdHVhbGx5IGdvaW5nIHRvIGhlbHAgZXZlcnl3aGVyZSAobm90IGp1
c3QgaW4NCj4gTGludXgpPyBJdCBlZmZlY3RpdmVseSBkZXBlbmRzIG9uIHBlb3BsZSBlbmFi
bGluZyBDOTkgbW9kZS4gT2xkZXIgZ2NjIGZvcg0KPiBleGFtcGxlIGRpZG4ndCBldmVuIGRl
ZmluZSBfX1NURENfVkVSU0lPTl9fIHdoZW4gLXN0ZCB3YXNuJ3QgdXNlZC4gTGludXgNCj4g
ZG9lc24ndCBwZXJtaXQgdXNlIG9mIHN1Y2ggb2xkIGdjYyB2ZXJzaW9ucyBhbnltb3JlLCBi
dXQgcmVjYWxsIHdlJ3JlDQo+IGFpbWluZyB0byBiZSBDODkgY29tcGF0aWJsZS4gVGhlcmVm
b3JlIEkgdGhpbmsgdGhhdCBpbiBhZGRpdGlvbiB3ZSdkIG5lZWQNCj4gYSB3YXkgZm9yIGNv
bnN1bWVycyBvZiB0aGUgaGVhZGVycyB0byBpbmRpY2F0ZSB0aGF0IHRoZSBDOTkgZm9ybSBv
Zg0KPiBYRU5fRkxFWF9BUlJBWV9ESU0gY2FuIGJlIHVzZWQgZXZlbiB3aGVuIF9fU1REQ19W
RVJTSU9OX18gaXNuJ3QgZGVmaW5lZC4NCj4gKFRoaXMgbWF5IGFzIHdlbGwgc2ltcGx5IGJl
IGRvbmUgYnkgYWxsb3dpbmcgcGVvcGxlIHRvIHByZS1kZWZpbmUNCj4gWEVOX0ZMRVhfQVJS
QVlfRElNIGJlZm9yZSBpbmNsdWRpbmcgYW55IFhlbiBoZWFkZXJzLikNCg0KV2lsbCB0aGUg
cHJvYmxlbSBldmVuIG9jY3VyIHdpdGggc3VjaCBhbiBvbGQgZ2NjPyBJIGRvbid0IHRoaW5r
IHNvLCBhcyBvbmx5DQpyYXRoZXIgcmVjZW50IGNvbXBpbGVycyBzaG93ZWQgdGhlICJhcnJh
eSBvdXQgb2YgYm91bmRzIiBmYWlsdXJlLiBPdGhlcndpc2UNCndlIHdvdWxkIGhhdmUgaGVh
cmQgY29tcGxhaW50cyBtdWNoIGVhcmxpZXIuDQoNCg==
--------------8pVXV3m7f7QbWljAmNFaW4NZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8pVXV3m7f7QbWljAmNFaW4NZ--

--------------hkLoTL8nVoglwQP0pIs8fnmv--

--------------SHoNE0vxKOqOl0bIqH81jLoB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVoVCgFAwAAAAAACgkQsN6d1ii/Ey8X
cAf+JPq0peBLqkGChkGoFqIVLKJPKTF7yB/eEbvKwU5G3ZBdcuHXfiODheUyNu1BGfMubw1Sk/1J
HOyIN5LcxmOvoM3wNcEwMUqFWZi2delj8d2ABjWRDoHAIvBEZXCbN0+9sxUXS98KeOWbE6rVkm6/
UubNWcVWdqkSDDaCaJ9JHxS2Du6gnHPFWi3XzqnGyL2sGHCbDNuOChYm4KLlpT46fo7oqKiWqFQg
tkeYBKgxtvmCqFMg7JbNfu11qLyQYLnbZ3CIJTfUzlvcx1eei4bx/ulnGSBzSpIf5emlASOZ/+os
3ymPiUBmq0iBZEvkB0nBVJ1ic33rbXM9V9SmFx7RFQ==
=oHcV
-----END PGP SIGNATURE-----

--------------SHoNE0vxKOqOl0bIqH81jLoB--

