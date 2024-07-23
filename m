Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9993A082
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 14:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763153.1173398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWEfU-0007O6-Il; Tue, 23 Jul 2024 12:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763153.1173398; Tue, 23 Jul 2024 12:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWEfU-0007MD-GA; Tue, 23 Jul 2024 12:31:00 +0000
Received: by outflank-mailman (input) for mailman id 763153;
 Tue, 23 Jul 2024 12:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWEfT-0007IO-6F
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 12:30:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 692b4e38-48ef-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 14:30:57 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85D211FBB3;
 Tue, 23 Jul 2024 12:30:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE56D137DF;
 Tue, 23 Jul 2024 12:30:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id At3OLFWin2a7FQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 23 Jul 2024 12:30:13 +0000
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
X-Inumbo-ID: 692b4e38-48ef-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721737856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=17MHGA0zIAwh2gjiHtL9aW44Q5nD5mhQ5Inj2mIQnio=;
	b=QBPnQaC1xKp70pPvaPnbIMN2zWXlQIQ268eaBBcIAVqxW8+UXAn1iVyiWfRaigk9rgUl/X
	abSts8YWtzFhGIfVxJdKqoOdtp8R/m7kSjoubkr1ylpsrBaoifH89sZkxnFSA4V96rr5uJ
	ZTO2rYk2rxsmgJUQJo+WMVqZ2zBoBwY=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QBPnQaC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721737856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=17MHGA0zIAwh2gjiHtL9aW44Q5nD5mhQ5Inj2mIQnio=;
	b=QBPnQaC1xKp70pPvaPnbIMN2zWXlQIQ268eaBBcIAVqxW8+UXAn1iVyiWfRaigk9rgUl/X
	abSts8YWtzFhGIfVxJdKqoOdtp8R/m7kSjoubkr1ylpsrBaoifH89sZkxnFSA4V96rr5uJ
	ZTO2rYk2rxsmgJUQJo+WMVqZ2zBoBwY=
Message-ID: <34350564-2faf-4af7-a66c-4ef3960a98ed@suse.com>
Date: Tue, 23 Jul 2024 14:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 5/6] tools/libxs: Use writev()/sendmsg() instead of
 write()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
 <20240722162547.4060813-1-andrew.cooper3@citrix.com>
 <cabf929b-11bd-4401-88a2-7d4c8ae4b606@suse.com>
 <702ac4d8-2eba-4b4d-bf43-3cc8277c5778@citrix.com>
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
In-Reply-To: <702ac4d8-2eba-4b4d-bf43-3cc8277c5778@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AKL2GvsYV4DMGdBLg5HpUijV"
X-Spam-Score: -8.20
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: 85D211FBB3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AKL2GvsYV4DMGdBLg5HpUijV
Content-Type: multipart/mixed; boundary="------------F6fVptUncRyDKuKphcyqbeJw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Message-ID: <34350564-2faf-4af7-a66c-4ef3960a98ed@suse.com>
Subject: Re: [PATCH v1.1 5/6] tools/libxs: Use writev()/sendmsg() instead of
 write()
References: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
 <20240722162547.4060813-1-andrew.cooper3@citrix.com>
 <cabf929b-11bd-4401-88a2-7d4c8ae4b606@suse.com>
 <702ac4d8-2eba-4b4d-bf43-3cc8277c5778@citrix.com>
In-Reply-To: <702ac4d8-2eba-4b4d-bf43-3cc8277c5778@citrix.com>

--------------F6fVptUncRyDKuKphcyqbeJw
Content-Type: multipart/mixed; boundary="------------V9yz0pjnIVQ3Mz40wOxmuV8M"

--------------V9yz0pjnIVQ3Mz40wOxmuV8M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDcuMjQgMTQ6MjUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDIzLzA3LzIw
MjQgMTA6MzcgYW0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAyMi4wNy4yNCAxODoy
NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBXaXRoIHRoZSBpbnB1dCBkYXRhIG5vdyBj
b252ZW5pZW50bHkgYXJyYW5nZWQsIHVzZSB3cml0ZXYoKS9zZW5kbXNnKCkNCj4+PiBpbnN0
ZWFkDQo+Pj4gb2YgZGVjb21wb3NpbmcgaXQgaW50byB3cml0ZSgpIGNhbGxzLg0KPj4+DQo+
Pj4gVGhpcyBjYXVzZXMgYWxsIHJlcXVlc3RzIHRvIGJlIHN1Ym1pdHRlZCB3aXRoIGEgc2lu
Z2xlIHN5c3RlbSBjYWxsLA0KPj4+IHJhdGhlcg0KPj4+IHRoYW4gYXQgbGVhc3QgdHdvLsKg
IFdoaWxlIGluIHByaW5jaXBsZSBzaG9ydCB3cml0ZXMgY2FuIG9jY3VyLCB0aGUNCj4+PiBj
aGFuY2VzIG9mDQo+Pj4gaXQgaGFwcGVuaW5nIGFyZSBzbGltIGdpdmVuIHRoYXQgbW9zdCB4
ZW5idXMgY29tbXMgYXJlIG9ubHkgYSBoYW5kZnVsIG9mDQo+Pj4gYnl0ZXMuDQo+Pj4NCj4+
PiBOZXZlcnRoZWxlc3MsIHByb3ZpZGUge3dyaXRldixzZW5kbXNnfV9leGFjdCgpIHdyYXBw
ZXJzIHdoaWNoIHRha2UNCj4+PiBjYXJlIG9mDQo+Pj4gcmVzdWJtaXR0aW5nIG9uIEVJTlRS
IG9yIHNob3J0IHdyaXRlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+PiAtLS0NCj4+PiBDQzogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+DQo+Pj4gQ0M6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+PiBDQzogRnJlZGlhbm8gWmlnbGlvIDxmcmVk
aWFuby56aWdsaW9AY2xvdWQuY29tPg0KPj4+DQo+Pj4gdjEuMToNCj4+PiAgwqAgKiBGaXgg
aW92IG92ZXJyZWFkLCBzcG90dGVkIGJ5IEZyZWRpYW5vLsKgIEZhY3RvciB0aGUgY29tbW9u
DQo+Pj4gdXBkYXRpbmcgbG9naWMNCj4+PiAgwqDCoMKgIG91dCBpbnRvIHVwZGF0ZV9pb3Yo
KS4NCj4+PiAtLS0NCj4+PiAgwqAgdG9vbHMvbGlicy9zdG9yZS94cy5jIHwgOTQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPj4+ICDCoCAxIGZpbGUg
Y2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRp
ZmYgLS1naXQgYS90b29scy9saWJzL3N0b3JlL3hzLmMgYi90b29scy9saWJzL3N0b3JlL3hz
LmMNCj4+PiBpbmRleCBlODIwY2NjYzIzMTQuLmY4MGFjNzU1OGNiZSAxMDA2NDQNCj4+PiAt
LS0gYS90b29scy9saWJzL3N0b3JlL3hzLmMNCj4+PiArKysgYi90b29scy9saWJzL3N0b3Jl
L3hzLmMNCj4+PiBAQCAtNTYzLDYgKzU2Myw5NSBAQCBzdGF0aWMgdm9pZCAqcmVhZF9yZXBs
eSgNCj4+PiAgwqDCoMKgwqDCoCByZXR1cm4gYm9keTsNCj4+PiAgwqAgfQ0KPj4+ICDCoCAr
LyoNCj4+PiArICogVXBkYXRlIGFuIGlvdi9uciBwYWlyIGFmdGVyIGFuIGluY29tcGxldGUg
d3JpdGV2KCkvc2VuZG1zZygpLg0KPj4+ICsgKg0KPj4+ICsgKiBBd2t3YXJkbHksIG5yIGhh
cyBkaWZmZXJlbnQgd2lkdGhzIGFuZCBzaWducyBiZXR3ZWVuIHdyaXRldigpIGFuZA0KPj4+
ICsgKiBzZW5kbXNnKCksIHNvIHdlIHRha2UgaXQgYW5kIHJldHVybiBpdCBieSB2YWx1ZSwg
cmF0aGVyIHRoYW4gYnkNCj4+PiBwb2ludGVyLg0KPj4+ICsgKi8NCj4+PiArc3RhdGljIHNp
emVfdCB1cGRhdGVfaW92KHN0cnVjdCBpb3ZlYyAqKnBfaW92LCBzaXplX3QgbnIsIHNpemVf
dCByZXMpDQo+Pj4gK3sNCj4+PiArwqDCoMKgIHN0cnVjdCBpb3ZlYyAqaW92ID0gKnBfaW92
Ow0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgwqAgLyogU2tpcCBmdWxseSBjb21wbGV0ZSBl
bGVtZW50cywgaW5jbHVkaW5nIGVtcHR5IGVsZW1lbnRzLiAqLw0KPj4+ICvCoMKgwqDCoMKg
wqDCoCB3aGlsZSAobnIgJiYgcmVzID49IGlvdi0+aW92X2xlbikgew0KPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzIC09IGlvdi0+aW92X2xlbjsNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5yLS07DQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpb3YrKzsNCj4+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4+ICsN
Cj4+PiArwqDCoMKgwqDCoMKgwqAgLyogUGFydGlhbCBlbGVtZW50LCBhZGp1c3QgYmFzZS9s
ZW4uICovDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXMpIHsNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvdi0+aW92X2xlbsKgIC09IHJlczsNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvdi0+aW92X2Jhc2UgKz0gcmVzOw0KPj4+
ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gKw0KPj4+ICvCoMKgwqDCoMKgwqDCoCAqcF9pb3Yg
PSBpb3Y7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgcmV0dXJuIG5yOw0KPj4+ICt9DQo+Pj4gKw0K
Pj4+ICsvKg0KPj4+ICsgKiBXcmFwcGVyIGFyb3VuZCBzZW5kbXNnKCkgdG8gcmVzdWJtaXQg
b24gRUlOVFIgb3Igc2hvcnQgd3JpdGUuDQo+Pj4gUmV0dXJucw0KPj4+ICsgKiBAdHJ1ZSBp
ZiBhbGwgZGF0YSB3YXMgdHJhbnNtaXR0ZWQsIG9yIEBmYWxzZSB3aXRoIGVycm5vIGZvciBh
bg0KPj4+IGVycm9yLg0KPj4+ICsgKiBOb3RlOiBNYXkgYWx0ZXIgQGlvdiBpbiBwbGFjZSBv
biByZXN1Ym1pdC4NCj4+PiArICovDQo+Pj4gK3N0YXRpYyBib29sIHNlbmRtc2dfZXhhY3Qo
aW50IGZkLCBzdHJ1Y3QgaW92ZWMgKmlvdiwgdW5zaWduZWQgaW50IG5yKQ0KPj4+ICt7DQo+
Pj4gK8KgwqDCoCBzdHJ1Y3QgbXNnaGRyIGhkciA9IHsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
Lm1zZ19pb3YgPSBpb3YsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5tc2dfaW92bGVuID0gbnIs
DQo+Pj4gK8KgwqDCoCB9Ow0KPj4+ICsNCj4+PiArwqDCoMKgIC8qIFNhbml0eSBjaGVjayBm
aXJzdCBlbGVtZW50IGlzbid0IGVtcHR5ICovDQo+Pj4gK8KgwqDCoCBhc3NlcnQoaW92LT5p
b3ZfbGVuID09IHNpemVvZihzdHJ1Y3QgeHNkX3NvY2ttc2cpKTsNCj4+DQo+PiBDYW4geW91
IHBsZWFzZSBtb3ZlIHRoaXMgYXNzZXJ0KCkgaW50byB3cml0ZV9yZXF1ZXN0KCksIGF2b2lk
aW5nIHRvIGhhdmUNCj4+IDIgY29waWVzIG9mIGl0Pw0KPiANCj4gSXQgd2FzIG1vcmUgcmVs
ZXZhbnQgYmVmb3JlIHVwZGF0ZV9pb3YoKSB3YXMgc3BsaXQgb3V0Lg0KPiANCj4gQnV0LCB0
aGVyZSdzIGV4YWN0bHkgdGhlIHNhbWUgYXNzZXJ0aW9uIGluIHRoZSB3cml0ZV9yZXF1ZXN0
KCkncyBjYWxsZXIsDQo+IHNvIEknZCBwcmVmZXIgdG8gc2ltcGx5IGRyb3AgaXQgaWYgdGhh
dCdzIG9rPw0KPiANCj4gVGhlIHdyaXRldigpL3NlbmRtc2coKSB3b24ndCBtYWxmdW5jdGlv
biBpZiB0aGUgZmlyc3QgZWxlbWVudCBpcyAwLCBhbmQNCj4gdXBkYXRlX2lvdigpIHdpbGwg
bm93IGNvcGUgdG9vLCBzbyBJIGRvbid0IHRoaW5rIGl0J3MgbmVjZXNzYXJ5Lg0KDQpGaW5l
IHdpdGggbWUuDQoNCg0KSnVlcmdlbg0KDQo=
--------------V9yz0pjnIVQ3Mz40wOxmuV8M
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------V9yz0pjnIVQ3Mz40wOxmuV8M--

--------------F6fVptUncRyDKuKphcyqbeJw--

--------------AKL2GvsYV4DMGdBLg5HpUijV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmafooAFAwAAAAAACgkQsN6d1ii/Ey+t
wAf/V3dcNmskw0wHypaoB84qlD1/pPSiyO0OmO2OtZZPTXPgAVXvHQbDjcXkDpzNAHNDstKa37u2
BuzY54gmUiADRCer+FuU9+mbBhI7Zsr3GFNLy0wIAlBHUyGjVXGo8kH5YRrUJ9dXPbnvWd11DFrA
h9mLU5snIwv7jDTpzkGiMQxrekBCidv0z6uH/rtZebfK8ShYJ171JsiYqETUIBDUNmG4qIQdp3z0
HxDU9eXWk2umeriUTShUapDm5agAX8QeYBqmxHf52SFb50ydKZJt8Z0fYEadBRs0Tvg6nle1Z41N
vQI1s2dWNR9k4s3aHPRLc9d14fA1thOJYI5ntEVrxg==
=50HU
-----END PGP SIGNATURE-----

--------------AKL2GvsYV4DMGdBLg5HpUijV--

