Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9970849653
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675705.1051086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvA0-0002nz-Hn; Mon, 05 Feb 2024 09:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675705.1051086; Mon, 05 Feb 2024 09:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvA0-0002lr-Dn; Mon, 05 Feb 2024 09:21:04 +0000
Received: by outflank-mailman (input) for mailman id 675705;
 Mon, 05 Feb 2024 09:21:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWv9z-0002ll-PR
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:21:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e177977b-c407-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 10:21:02 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF4A222030;
 Mon,  5 Feb 2024 09:21:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97912136F5;
 Mon,  5 Feb 2024 09:21:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XPt7I32owGWwHAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 09:21:01 +0000
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
X-Inumbo-ID: e177977b-c407-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707124861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Tp3qKGzgjZmnMxQ5Z5H2MgUI9LsT+czRWEroxqF2alo=;
	b=Ctsl2Jfylj/BkryaNlHByhwwiDEknNn9mLuAT4Ih3t/AW3LLvUZjKFnL8dp8wxDVf67X4O
	ZYvcFYum213ovMK0sGIIyK7kq9xu1wxEa3fenB0tAbEM+aY2CJ/cBPyxZhWOn4ZmzgzOKX
	bb4kToS3XGJxd3BWhgHoHH6Qe6eVYf0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707124861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Tp3qKGzgjZmnMxQ5Z5H2MgUI9LsT+czRWEroxqF2alo=;
	b=Ctsl2Jfylj/BkryaNlHByhwwiDEknNn9mLuAT4Ih3t/AW3LLvUZjKFnL8dp8wxDVf67X4O
	ZYvcFYum213ovMK0sGIIyK7kq9xu1wxEa3fenB0tAbEM+aY2CJ/cBPyxZhWOn4ZmzgzOKX
	bb4kToS3XGJxd3BWhgHoHH6Qe6eVYf0=
Message-ID: <c4d5b0e0-e726-4ab2-9482-f284f2b92674@suse.com>
Date: Mon, 5 Feb 2024 10:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/33] tools/xenstored: move all socket handling into
 posix.c
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-26-jgross@suse.com>
 <dcc477bd-b7cf-40e8-85be-3cde5b9cfd61@xen.org>
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
In-Reply-To: <dcc477bd-b7cf-40e8-85be-3cde5b9cfd61@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K7eZ8ovPuUvz2bJcAVCFUx8q"
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ctsl2Jfy
X-Spamd-Result: default: False [-5.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BF4A222030
X-Spam-Level: 
X-Spam-Score: -5.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K7eZ8ovPuUvz2bJcAVCFUx8q
Content-Type: multipart/mixed; boundary="------------2RAwL0wvq4E7Ep80rjsE4RtN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <c4d5b0e0-e726-4ab2-9482-f284f2b92674@suse.com>
Subject: Re: [PATCH v3 25/33] tools/xenstored: move all socket handling into
 posix.c
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-26-jgross@suse.com>
 <dcc477bd-b7cf-40e8-85be-3cde5b9cfd61@xen.org>
In-Reply-To: <dcc477bd-b7cf-40e8-85be-3cde5b9cfd61@xen.org>

--------------2RAwL0wvq4E7Ep80rjsE4RtN
Content-Type: multipart/mixed; boundary="------------0B01UgYYQ45VEXIBX7L0Ul5g"

--------------0B01UgYYQ45VEXIBX7L0Ul5g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDEuMjQgMTc6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA0LzAxLzIwMjQgMDk6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
bGwgb2YgdGhlIHNvY2tldCBoYW5kbGluZyBpcyBuZWVkZWQgb25seSB3aGVuIHJ1bm5pbmcg
YXMgZGFlbW9uLg0KPj4NCj4+IE1vdmUgaXQgaW50byBwb3NpeC5jLCBhbGxvd2luZyB0byBy
ZW1vdmUgdGhlIE5PX1NPQ0tFVFMgbWFjcm8uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMzoNCj4+IC0gbmV3
IHBhdGNoDQo+PiAtLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9NYWtlZmlsZS5jb21tb24g
fMKgwqAgNCAtDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvY29yZS5jwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTU2ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCB0b29s
cy94ZW5zdG9yZWQvY29yZS5owqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKy0NCj4+IMKg
IHRvb2xzL3hlbnN0b3JlZC9kb21haW4uY8KgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKy0NCj4+
IMKgIHRvb2xzL3hlbnN0b3JlZC9taW5pb3MuY8KgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKysN
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9wb3NpeC5jwqDCoMKgwqDCoMKgwqDCoCB8IDE1MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiDCoCA2IGZpbGVzIGNoYW5nZWQs
IDE2NyBpbnNlcnRpb25zKCspLCAxNjkgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3hlbnN0b3JlZC9NYWtlZmlsZS5jb21tb24gYi90b29scy94ZW5zdG9yZWQv
TWFrZWZpbGUuY29tbW9uDQo+PiBpbmRleCAxODlhYjgxYjhkLi5lZjYzZWY2NTBjIDEwMDY0
NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL01ha2VmaWxlLmNvbW1vbg0KPj4gKysrIGIv
dG9vbHMveGVuc3RvcmVkL01ha2VmaWxlLmNvbW1vbg0KPj4gQEAgLTE2LDEwICsxNiw2IEBA
IENGTEFHUyArPSAkKENGTEFHU19saWJ4ZW5jdHJsKQ0KPj4gwqAgQ0ZMQUdTICs9ICQoQ0ZM
QUdTX2xpYnhlbmd1ZXN0KQ0KPj4gwqAgQ0ZMQUdTICs9ICQoQ0ZMQUdTX2xpYnhlbnRvb2xj
b3JlKQ0KPj4gLWlmZGVmIENPTkZJR19TVFVCRE9NDQo+PiAtQ0ZMQUdTICs9IC1ETk9fU09D
S0VUUz0xDQo+PiAtZW5kaWYNCj4+IC0NCj4+IMKgICQoWEVOU1RPUkVEX09CSlMteSk6IENG
TEFHUyArPSAkKENGTEFHU19saWJ4ZW5nbnR0YWIpDQo+PiDCoCB4ZW5zdG9yZWQuYTogJChY
RU5TVE9SRURfT0JKUy15KQ0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9jb3Jl
LmMgYi90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+PiBpbmRleCA2NTBjMWQxNTc0Li44ZmYx
ZmFjY2VmIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPj4gKysr
IGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPj4gQEAgLTIwLDEwICsyMCw2IEBADQo+PiDC
oCAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+DQo+PiDCoCAjaW5jbHVkZSA8c3lzL3N0YXQuaD4N
Cj4+IMKgICNpbmNsdWRlIDxwb2xsLmg+DQo+PiAtI2lmbmRlZiBOT19TT0NLRVRTDQo+PiAt
I2luY2x1ZGUgPHN5cy9zb2NrZXQuaD4NCj4+IC0jaW5jbHVkZSA8c3lzL3VuLmg+DQo+PiAt
I2VuZGlmDQo+PiDCoCAjaW5jbHVkZSA8c3lzL3RpbWUuaD4NCj4+IMKgICNpbmNsdWRlIDx0
aW1lLmg+DQo+PiDCoCAjaW5jbHVkZSA8dW5pc3RkLmg+DQo+PiBAQCAtNjEsNyArNTcsNyBA
QCBzdGF0aWMgdW5zaWduZWQgaW50IGN1cnJlbnRfYXJyYXlfc2l6ZTsNCj4+IMKgIHN0YXRp
YyB1bnNpZ25lZCBpbnQgbnJfZmRzOw0KPj4gwqAgc3RhdGljIHVuc2lnbmVkIGludCBkZWxh
eWVkX3JlcXVlc3RzOw0KPj4gLXN0YXRpYyBpbnQgc29jayA9IC0xOw0KPj4gK2ludCBzb2Nr
ID0gLTE7DQo+IA0KPiBTaW1pbGFyIGNvbW1lbnQgdG8gJ2Zkcycgb24gdGhlIHByZXZpb3Vz
IHBhdGNoLiBUaGlzIG5hbWUgaXMgcXVpdGUgZ2VuZXJpYy4gQ2FuIA0KPiB3ZSBlaXRoZXIg
cGFzcyBpdCBhcyBhbiBhcmd1bWVudCAob3IgcmV0dXJuKSBvciByZW5hbWUgaXQ/DQoNClR1
cm5zIG91dCB0aGlzIHBhdGNoIG5vdyBtYWtlcyB0aGUgImZkcyIgc29sdXRpb24gbW9yZSBj
b21wbGljYXRlZDogSSdkIG5lZWQgdG8NCmFkZCBmZHMgYXMgYW4gYWRkaXRpb25hbCBwYXJh
bWV0ZXIgdG8gdGhlIC5jYW5fd3JpdGUoKSBhbmQgLmNhbl9yZWFkKCkgY2FsbGJhY2tzDQpv
ZiBzdHJ1Y3QgaW50ZXJmYWNlX2Z1bmNzLg0KDQpJIGNhbiBkbyB0aGF0LCBidXQgYW4gYWx0
ZXJuYXRpdmUgd291bGQgYmUgdG8ganVzdCByZW5hbWUgZmRzIHRvIGUuZy4gcG9sbF9mZHMu
DQoNCkRvIHlvdSBoYXZlIGFueSBwcmVmZXJlbmNlPw0KDQpJbiBjYXNlIHdlIHBhc3MgZmRz
IGFzIGEgcGFyYW1ldGVyLCBJJ2QgYmUgaW5jbGluZWQgdG8gbWFrZSBpdCBldmVuIGxvY2Fs
IHRvIHRoZQ0KbWFpbigpIGZ1bmN0aW9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------0B01UgYYQ45VEXIBX7L0Ul5g
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0B01UgYYQ45VEXIBX7L0Ul5g--

--------------2RAwL0wvq4E7Ep80rjsE4RtN--

--------------K7eZ8ovPuUvz2bJcAVCFUx8q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXAqH0FAwAAAAAACgkQsN6d1ii/Ey/u
MQf9GmdF9/BRxEzqIZpm6TfF9eC7SxPhAZn9TYtjunQURxZq+d3vW56jq3tPNOFFGQfpq6sSetlc
jXgTITkAXfRKhvoYfiMyOp5lOL0BU4Wz7B7sFp7aSk8GGX8VPRW1j7o2k6V6W0kTaBMetogkUOxy
TDe/h2pu+G4HIS4UDFdSKd8Ye/gS79g/ri3BZHP+ox+rbLdnyrmuFJckS8qtVa7iu/DXmmMB0k6Y
c9nMTU0J6JFZWyOgkwGsq5nwvfEeOhi6gxUYxGn048PAgDLff8m95IBICb2Po3UKf+xfFvfHMNHL
PW+f8EbkavGoE6x0TjIFMIPlrP98tAU1F+cO64P2Cg==
=CQn2
-----END PGP SIGNATURE-----

--------------K7eZ8ovPuUvz2bJcAVCFUx8q--

