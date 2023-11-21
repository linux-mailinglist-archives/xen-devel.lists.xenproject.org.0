Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECA7F2629
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 08:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637526.993399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5KsI-0007y9-K3; Tue, 21 Nov 2023 07:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637526.993399; Tue, 21 Nov 2023 07:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5KsI-0007v6-HD; Tue, 21 Nov 2023 07:08:46 +0000
Received: by outflank-mailman (input) for mailman id 637526;
 Tue, 21 Nov 2023 07:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5KsG-0007ug-Gu
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 07:08:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca3a1d97-883c-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 08:08:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BACF721940;
 Tue, 21 Nov 2023 07:08:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88BD6138E3;
 Tue, 21 Nov 2023 07:08:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N0r4H3NXXGUsYQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 07:08:35 +0000
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
X-Inumbo-ID: ca3a1d97-883c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700550515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qZKhPEPWmZmvzkettVlPpQiMq97BvlwUDXfM2/Vt7pw=;
	b=QjRwgwzgg5V/br6jOgbNzssq2CixnCnSQdg3dvznF/5S+ztLeFlSOlYRLnan7XNj455TBM
	JB+NLAgs28HCLE9dAW7nLHdSwh4Hfp1sWlYHAEcaYsKwh9+u/qy0wqznBsZ+ucXuEvGQPq
	JEXe35rQ4iCq/XqziqvJxtxzaqQ4dnA=
Message-ID: <ed4eb46f-3e32-4c5d-930e-41bd7df3eb3a@suse.com>
Date: Tue, 21 Nov 2023 08:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/29] tools/xenlogd: connect to frontend
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-4-jgross@suse.com>
 <CAKf6xpvb33Om8pQp-iv92r3LFU50Rn1yBiMbJ4R1eufVyx=Tag@mail.gmail.com>
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
In-Reply-To: <CAKf6xpvb33Om8pQp-iv92r3LFU50Rn1yBiMbJ4R1eufVyx=Tag@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------96npfEkBRLb5meH8iaiRMBD2"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.19
X-Spamd-Result: default: False [-6.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------96npfEkBRLb5meH8iaiRMBD2
Content-Type: multipart/mixed; boundary="------------Mv4INSU0oVlGlnOG02p2sTIe";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ed4eb46f-3e32-4c5d-930e-41bd7df3eb3a@suse.com>
Subject: Re: [PATCH v2 03/29] tools/xenlogd: connect to frontend
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-4-jgross@suse.com>
 <CAKf6xpvb33Om8pQp-iv92r3LFU50Rn1yBiMbJ4R1eufVyx=Tag@mail.gmail.com>
In-Reply-To: <CAKf6xpvb33Om8pQp-iv92r3LFU50Rn1yBiMbJ4R1eufVyx=Tag@mail.gmail.com>

--------------Mv4INSU0oVlGlnOG02p2sTIe
Content-Type: multipart/mixed; boundary="------------2O2ZQX0vqP0qiGRWq0NBknIu"

--------------2O2ZQX0vqP0qiGRWq0NBknIu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTEuMjMgMTY6NDksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTm92
IDEwLCAyMDIzIGF0IDE6MDTigK9QTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEFkZCB0aGUgY29kZSBmb3IgY29ubmVjdGluZyB0byBmcm9udGVu
ZHMgdG8geGVubG9nZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbi05cGZzZC94
ZW4tOXBmc2QuYyBiL3Rvb2xzL3hlbi05cGZzZC94ZW4tOXBmc2QuYw0KPj4gaW5kZXggYzM2
NWIzNWZlNS4uY2M1NzM0NDAyZCAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbi05cGZzZC94
ZW4tOXBmc2QuYw0KPj4gKysrIGIvdG9vbHMveGVuLTlwZnNkL3hlbi05cGZzZC5jDQo+IA0K
Pj4NCj4+ICtzdGF0aWMgaW50IGNoZWNrX2hvc3RfcGF0aChkZXZpY2UgKmRldmljZSkNCj4+
ICt7DQo+PiArICAgIHN0cnVjdCBzdGF0IHN0YXRidWY7DQo+PiArICAgIGNoYXIgKnBhdGgs
ICpwOw0KPj4gKyAgICBpbnQgcmV0ID0gMTsNCj4+ICsNCj4+ICsgICAgaWYgKCAhZGV2aWNl
LT5ob3N0X3BhdGggKQ0KPj4gKyAgICAgICAgcmV0dXJuIDE7DQo+PiArDQo+PiArICAgIGlm
ICggZGV2aWNlLT5ob3N0X3BhdGhbMF0gIT0gJy8nICkNCj4+ICsgICAgICAgIHJldHVybiAx
Ow0KPj4gKw0KPiANCj4gIEZyb20gdjEsIHlvdSBzdGF0ZWQgZm9yIGFsbG9jX2ZpZF9tZW0o
ZGV2aWNlLCBmaWQsIHBhdGgpOg0KPj4gTm8sICJwYXRoIiBpcyBhbHdheXMgc3RhcnRpbmcg
d2l0aCBhICIvIiBpZiBpdCBpcyBub3QgZW1wdHkuDQo+IA0KPiBBbmQgdGhlbg0KPiBzbnBy
aW50ZihmaWRwLT5wYXRoLCBwYXRobGVuLCAiJXMlcyIsIGRldmljZS0+aG9zdF9wYXRoLCBw
YXRoKTsNCj4gDQo+IFdoaWxlIGFsbG9jX2ZpZF9tZW0oKSB1c2VzICIlcyVzIg0KPiANCj4g
QW5kIHA5X2NyZWF0ZSgpIHVzZXMgIiVzLyVzIg0KDQpPZiBjb3Vyc2UgaXQgZG9lcywgYXMg
dGhpcyBpcyB0aGUgY29uY2F0ZW5hdGlvbiBvZiB0aGUgY3VycmVudCBwYXRoIHdpdGgNCnRo
ZSBuZXcgZmlsZSBuYW1lLCB3aGljaCBpcyByZWxhdGl2ZSB0byB0aGUgY3VycmVudCBwYXRo
Lg0KDQo+IHA5X3dhbGsgZG9lczoNCj4gY29uc3QgY2hhciAqcmVsX3BhdGggPSBwYXRoICsg
c3RybGVuKGRldmljZS0+aG9zdF9wYXRoKQ0KPiAuLi4NCj4gYWxsb2NfZmlkX21lbShkZXZp
Y2UsIGZpZCwgcmVsX3BhdGgpOw0KPiANCj4gU28gaG9zdF9wYXRoIGlzIGV4cGVjdGVkIG5v
dCB0byBoYXZlIGEgdGFpbGluZyAnLycgdG8gZW5zdXJlIHRoYXQNCj4gcmVsX3BhdGggc3Rh
cnRzIHdpdGggYSAnLycuICBTbyB5b3Ugd2FudCB0byBlcnJvciBvdXQgZm9yIGEgdHJhaWxp
bmcNCj4gJy8nIChvciBvdmVyd3JpdGUgd2l0aCAnXDAnKT8NCg0KSSBjYW4gYWRkIHRoYXQu
DQoNCj4gSXQgc2VlbXMgbGlrZSBhbGxvY19maWRfbWVtKCkgc2hvdWxkIGFsc28gY2hlY2sg
dG8gZW5zdXJlIHBhdGggaXMgIicvJw0KPiBpZiBpdCBpcyBub3QgZW1wdHkiLg0KDQpJJ2xs
IGFkZCBhbiBhc3NlcnQoKS4NCg0KPiBUaGlzIGlzIGFsbCBzdWJ0bGUgYW5kIHNlY3VyaXR5
IHJlbGV2YW50LCBzbyBpdCdzIGltcG9ydGFudCB0byBnZXQNCj4gdGhpcyByaWdodC4gIEEg
Y29kZSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIGV4cGVjdGF0aW9uIG9mIHBhdGhzIGZvcg0K
PiBob3N0X3BhdGggdnMuIGZpZHMgd291bGQgYmUgZ29vZC4NCg0KQWdyZWVkLg0KDQo+IEFs
c28sIG1heWJlIHVzaW5nIG9wZW5hdCgpIHdvdWxkIGJlIGEgYmV0dGVyIGFwcHJvYWNoPyAg
Q3JlYXRlIHRoZQ0KPiBkaXJmZCBwb2ludGluZyBhdCB0aGUgOXBmcyBleHBvcnQgYW5kIHRo
ZW4gdXNlIHJlbGF0aXZlIHBhdGhzIGZvciB0aGUNCj4gcGF0aHMgaW5zaWRlLiAgVGhpcyB3
b3VsZCBjdXQgZG93biBvbiB0aGUgbWFudWFsIHBhdGggbWFuaXB1bGF0aW9ucy4NCg0KSSds
bCBsb29rIGludG8gdGhhdC4gSSdsbCBoYXZlIHRvIHRyYWRlIHNwZWNpYWwgY2FzaW5nIGFj
Y2Vzc2luZyB0aGUgcm9vdA0KZGlyZWN0b3J5IHZzLiByZWR1Y2luZyBwYXRoIG9wZXJhdGlv
bnMuDQoNCj4gDQo+PiArICAgIHBhdGggPSBzdHJkdXAoZGV2aWNlLT5ob3N0X3BhdGgpOw0K
Pj4gKyAgICBpZiAoICFwYXRoICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgc3lzbG9nKExP
R19DUklULCAibWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSEiKTsNCj4+ICsgICAgICAgIHJl
dHVybiAxOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGZvciAoIHAgPSBwYXRoOyBwOyAp
DQo+PiArICAgIHsNCj4+ICsgICAgICAgIHAgPSBzdHJjaHIocCArIDEsICcvJyk7DQo+PiAr
ICAgICAgICBpZiAoIHAgKQ0KPj4gKyAgICAgICAgICAgICpwID0gMDsNCj4+ICsgICAgICAg
IGlmICggIXN0YXQocGF0aCwgJnN0YXRidWYpICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAg
ICAgICAgICBpZiAoICEoc3RhdGJ1Zi5zdF9tb2RlICYgU19JRkRJUikgKQ0KPj4gKyAgICAg
ICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgICAgICBpZiAoICFwICkNCj4+ICsgICAg
ICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgIHJldCA9IDA7DQo+PiArICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAgIH0NCj4+ICsgICAgICAgICAgICAqcCA9
ICcvJzsNCj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsgICAgICAgIH0NCj4+ICsg
ICAgICAgIGlmICggbWtkaXIocGF0aCwgMDc3NykgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFr
Ow0KPj4gKyAgICAgICAgaWYgKCBwICkNCj4+ICsgICAgICAgICAgICAqcCA9ICcvJzsNCj4+
ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBmcmVlKHBhdGgpOw0KPj4gKyAgICByZXR1cm4gcmV0
Ow0KPj4gK30NCj4+ICsNCj4gDQo+PiArDQo+PiArc3RhdGljIGludCB3cml0ZV9iYWNrZW5k
X25vZGUoZGV2aWNlICpkZXZpY2UsIGNvbnN0IGNoYXIgKm5vZGUsIGNvbnN0IGNoYXIgKnZh
bCkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBwYXRoIHA7DQo+PiArICAgIHN0cnVjdCB4c19w
ZXJtaXNzaW9ucyBwZXJtc1syXSA9IHsNCj4+ICsgICAgICAgIHsgLmlkID0gMCwgLnBlcm1z
ID0gWFNfUEVSTV9OT05FIH0sDQo+IA0KPiBUaGlzIGhhcmQgY29kZXMgZG9tMC4gIElmIHhz
X3Blcm1pc3Npb25zIHN1cHBvcnRlZCBET01JRF9TRUxGLCBpdA0KPiB3b3VsZG4ndCBuZWVk
IHRvIGJlIGxvb2tlZCB1cC4NCg0KRE9NSURfU0VMRiBpc24ndCBzdXBwb3J0ZWQuIEJ1dCB5
b3UgYXJlIHJpZ2h0LCBJIG5lZWQgdG8gYXZvaWQgaGFyZCBjb2RpbmcgZG9tMA0KaGVyZS4g
VGhpcyBjYW4gYmUgYWNoaWV2ZWQgYnkgcmVhZGluZyB0aGUgcGVybWlzc2lvbnMgYWZ0ZXIg
Y3JlYXRpbmcgdGhlIG5vZGUNCmFuZCB1c2UgdGhlIHJlc3VsdCBmb3IgdGhlIGZpcnN0IHBl
cm1pc3Npb24gZW50cnkuDQoNCj4gDQo+PiArICAgICAgICB7IC5pZCA9IGRldmljZS0+ZG9t
aWQsIC5wZXJtcyA9IFhTX1BFUk1fUkVBRCB9DQo+PiArICAgIH07DQo+PiArDQo+PiArICAg
IGNvbnN0cnVjdF9iYWNrZW5kX3BhdGgoZGV2aWNlLCBub2RlLCAmcCk7DQo+PiArICAgIGlm
ICggIXhzX3dyaXRlKHhzLCBYQlRfTlVMTCwgcC5wYXRoLCB2YWwsIHN0cmxlbih2YWwpKSAp
DQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN5c2xvZyhMT0dfRVJSLCAiZXJyb3Igd3JpdGlu
ZyBiYWPhuLFlbmQgbm9kZSBcIiVzXCIgZm9yIGRldmljZSAldS8ldSIsDQo+PiArICAgICAg
ICAgICAgICAgbm9kZSwgZGV2aWNlLT5kb21pZCwgZGV2aWNlLT5kZXZpZCk7DQo+PiArICAg
ICAgICByZXR1cm4gMTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoICF4c19zZXRf
cGVybWlzc2lvbnMoeHMsIFhCVF9OVUxMLCBwLnBhdGgsIHBlcm1zLCAyKSApDQo+PiArICAg
IHsNCj4+ICsgICAgICAgIHN5c2xvZyhMT0dfRVJSLCAiZXJyb3Igc2V0dGluZyBwZXJtaXNz
aW9ucyBmb3IgXCIlc1wiIiwgcC5wYXRoKTsNCj4+ICsgICAgICAgIHJldHVybiAxOw0KPj4g
KyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4gDQo+PiAr
DQo+PiArc3RhdGljIHZvaWQgY29ubmVjdF9kZXZpY2UoZGV2aWNlICpkZXZpY2UpDQo+PiAr
ew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgdmFsOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgcmlu
Z19pZHg7DQo+PiArICAgIGNoYXIgbm9kZVsyMF07DQo+PiArICAgIHN0cnVjdCByaW5nICpy
aW5nOw0KPj4gKyAgICB4ZW5ldnRjaG5fcG9ydF9vcl9lcnJvcl90IGV2dGNobjsNCj4+ICsN
Cj4+ICsgICAgdmFsID0gcmVhZF9mcm9udGVuZF9ub2RlX3VpbnQoZGV2aWNlLCAidmVyc2lv
biIsIDApOw0KPj4gKyAgICBpZiAoIHZhbCAhPSAxICkNCj4+ICsgICAgICAgIHJldHVybiBj
b25uZWN0X2VycihkZXZpY2UsICJmcm9udGVuZCBzcGVjaWZpZXMgaWxsZWdhbCB2ZXJzaW9u
Iik7DQo+PiArICAgIGRldmljZS0+bnVtX3JpbmdzID0gcmVhZF9mcm9udGVuZF9ub2RlX3Vp
bnQoZGV2aWNlLCAibnVtLXJpbmdzIiwgMCk7DQo+PiArICAgIGlmICggZGV2aWNlLT5udW1f
cmluZ3MgPCAxIHx8IGRldmljZS0+bnVtX3JpbmdzID4gTUFYX1JJTkdTICkNCj4+ICsgICAg
ICAgIHJldHVybiBjb25uZWN0X2VycihkZXZpY2UsICJmcm9udGVuZCBzcGVjaWZpZXMgaWxs
ZWdhbCByaW5nIG51bWJlciIpOw0KPj4gKw0KPj4gKyAgICBmb3IgKCByaW5nX2lkeCA9IDA7
IHJpbmdfaWR4IDwgZGV2aWNlLT5udW1fcmluZ3M7IHJpbmdfaWR4KysgKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICByaW5nID0gY2FsbG9jKDEsIHNpemVvZigqcmluZykpOw0KPj4gKyAg
ICAgICAgaWYgKCAhcmluZyApDQo+PiArICAgICAgICAgICAgcmV0dXJuIGNvbm5lY3RfZXJy
KGRldmljZSwgImNvdWxkIG5vdCBhbGxvY2F0ZSByaW5nIG1lbW9yeSIpOw0KPj4gKyAgICAg
ICAgZGV2aWNlLT5yaW5nW3JpbmdfaWR4XSA9IHJpbmc7DQo+PiArICAgICAgICByaW5nLT5k
ZXZpY2UgPSBkZXZpY2U7DQo+PiArICAgICAgICBwdGhyZWFkX2NvbmRfaW5pdCgmcmluZy0+
Y29uZCwgTlVMTCk7DQo+PiArICAgICAgICBwdGhyZWFkX211dGV4X2luaXQoJnJpbmctPm11
dGV4LCBOVUxMKTsNCj4+ICsNCj4+ICsNCj4gDQo+IGV4dHJhIGJsYW5rIGxpbmUuDQoNCldp
bGwgcmVtb3ZlIGl0Lg0KDQoNClRoYW5rcywNCg0KSnVlcmdlbg0KDQo=
--------------2O2ZQX0vqP0qiGRWq0NBknIu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------2O2ZQX0vqP0qiGRWq0NBknIu--

--------------Mv4INSU0oVlGlnOG02p2sTIe--

--------------96npfEkBRLb5meH8iaiRMBD2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVcV3MFAwAAAAAACgkQsN6d1ii/Ey/q
uAf9E03cMKgoCVOKKpJYdXYpjoBIMYNx68Ikfv+AY8pLs+nruiJ8UOyIlY+3rZg5YwVUkGtidXSv
YPimxuzdgRdJWEzQi0sa9j3uv9ODDt9dASZ5CnVBHqx7IbmpwXiSncRN8NwNPyqZjnV5lxKrcPg5
fhbtovQA7NbFt0I4piHGN1KI0B411dtFXEi/4S3kpGGbube3bR7zyuK566izpjksjutAlDMcZQZy
eopIJxa/XScpyTezHl1xbTM/KtCeWkLhekKY2JHUNZtOeZP9pGbaQ6Zs/ZvFoeSuHduXG5bZxM7C
QMcgjstPYsqI1kckLhOTXRBiTq+0qk6YeM1wJMrvAQ==
=szX0
-----END PGP SIGNATURE-----

--------------96npfEkBRLb5meH8iaiRMBD2--

