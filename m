Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 438CEB281F3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 16:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083521.1443116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvWx-0006wi-VZ; Fri, 15 Aug 2025 14:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083521.1443116; Fri, 15 Aug 2025 14:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvWx-0006uG-So; Fri, 15 Aug 2025 14:35:43 +0000
Received: by outflank-mailman (input) for mailman id 1083521;
 Fri, 15 Aug 2025 14:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VEq/=23=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1umvWw-0006uA-ML
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 14:35:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ddc1795-79e5-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 16:35:40 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D737C21841;
 Fri, 15 Aug 2025 14:35:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8E1513876;
 Fri, 15 Aug 2025 14:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 67QqJ7pFn2h5CQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 15 Aug 2025 14:35:38 +0000
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
X-Inumbo-ID: 1ddc1795-79e5-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755268539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6pp+ytwLOK+MztvsSRVjiwIuvmSzvA9Aw7OxJ82sq54=;
	b=hni2Gz7XeYjECOZO7DuKzCVZ1j9MA7O2Sl3/5ims49WVjqEQuAlI/PH2aFAw84h9B/Frr8
	qOYUgrij0wYCEgvdazBg9dvcEQaSS7Hxjio1UQlSJFIwCYOKGc6whhYV+s/5BB4hTPcWBw
	oumJ6DoKhirTscKJV7qLCyQad9qnX2I=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="XrFtaJ/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755268538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6pp+ytwLOK+MztvsSRVjiwIuvmSzvA9Aw7OxJ82sq54=;
	b=XrFtaJ/cl7c6LlIo08otXrRhKa8b2KaTF2l9uFdRltkmn6Iu9Qna7hChdnwQGhrj+SfIIq
	kqqEcibksZUSeHJJK7G3UIxexgXsy+SjFe/c7RszxDIFOQm0H38epMUxccdIn/0+koIv95
	3HtGLg74/+iTzHgoU4Sl6QiFhd0109k=
Message-ID: <115eca26-32a3-403f-9bf6-553c6b20940c@suse.com>
Date: Fri, 15 Aug 2025 16:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii <oleksii.kurochko@gmail.com>
References: <20250815143236.27641-1-jgross@suse.com>
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
In-Reply-To: <20250815143236.27641-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A0Dcn3IjDW2NBO0w5M2PlIz0"
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D737C21841
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.91 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,citrix.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.91

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A0Dcn3IjDW2NBO0w5M2PlIz0
Content-Type: multipart/mixed; boundary="------------2Lb4BPtvePWZwQg4grnGBijt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii <oleksii.kurochko@gmail.com>
Message-ID: <115eca26-32a3-403f-9bf6-553c6b20940c@suse.com>
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
References: <20250815143236.27641-1-jgross@suse.com>
In-Reply-To: <20250815143236.27641-1-jgross@suse.com>

--------------2Lb4BPtvePWZwQg4grnGBijt
Content-Type: multipart/mixed; boundary="------------ec8tc0rs9iqSFNSQgMMruLG0"

--------------ec8tc0rs9iqSFNSQgMMruLG0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KyBSZWxlYXNlIE1hbmFnZXINCg0KT24gMTUuMDguMjUgMTY6MzIsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6DQo+IEluIG9yZGVyIHRvIGJlIGFibGUgdG8gdXNlICJ4bCBpbmZvIiBiZWZvcmUg
WGVuc3RvcmUgaGFzIGJlZW4gc3RhcnRlZA0KPiBvciBhZnRlciBpdCBoYXMgY3Jhc2hlZCwg
aGlkZSBvYnRhaW5pbmcgdGhlIGF2YWlsYWJsZSBYZW5zdG9yZSBmZWF0dXJlcw0KPiBiZWhp
bmQgdGhlIG5ldyBvcHRpb24gIi14Ii4NCj4gDQo+IEZpeGVzOiBlY2NlNzk3MGNmZTcgKCJ0
b29scy94bDogYWRkIGF2YWlsYWJsZSBYZW5zdG9yZSBmZWF0dXJlcyB0byB4bCBpbmZvIG91
dHB1dCIpDQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQo+IC0tLQ0KPiAgIGRvY3MvbWFuL3hsLjEucG9kLmluICAgICB8ICA0ICsrKysN
Cj4gICBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gfCAgMiArLQ0KPiAgIHRvb2xzL3hsL3hs
X2luZm8uYyAgICAgICB8IDE0ICsrKysrKysrKystLS0tDQo+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RvY3MvbWFuL3hsLjEucG9kLmluIGIvZG9jcy9tYW4veGwuMS5wb2QuaW4NCj4gaW5kZXgg
ZmUzODcyNGIyYi4uODhjY2Y3YWQ4MiAxMDA2NDQNCj4gLS0tIGEvZG9jcy9tYW4veGwuMS5w
b2QuaW4NCj4gKysrIGIvZG9jcy9tYW4veGwuMS5wb2QuaW4NCj4gQEAgLTk5Niw2ICs5OTYs
MTAgQEAgQjxPUFRJT05TPg0KPiAgIA0KPiAgIExpc3QgaG9zdCBOVU1BIHRvcG9sb2d5IGlu
Zm9ybWF0aW9uDQo+ICAgDQo+ICs9aXRlbSBCPC14PiwgQjwtLXhlbnN0b3JlPg0KPiArDQo+
ICtTaG93IFhlbnN0b3JlIGZlYXR1cmVzIGF2YWlsYWJsZS4NCj4gKw0KPiAgID1iYWNrDQo+
ICAgDQo+ICAgPWl0ZW0gQjx0b3A+DQo+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcu
NS5wb2QuaW4gYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4NCj4gaW5kZXggZjBjOTIwYjM5
ZC4uYWNmZjQ1ZDMwOCAxMDA2NDQNCj4gLS0tIGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmlu
DQo+ICsrKyBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbg0KPiBAQCAtNzQzLDcgKzc0Myw3
IEBAIGNvbmRpdGlvbi4NCj4gICA9YmFjaw0KPiAgIA0KPiAgIFRoZSBmZWF0dXJlcyBzdXBw
b3J0ZWQgYnkgdGhlIHJ1bm5pbmcgWGVuc3RvcmUgaW5zdGFuY2UgY2FuIGJlIHJldHJpZXZl
ZA0KPiAtdmlhIHRoZSBCPHhsIGluZm8+IGNvbW1hbmQgaW4gZG9tMC4NCj4gK3ZpYSB0aGUg
Qjx4bCBpbmZvIC14PiBjb21tYW5kIGluIGRvbTAuDQo+ICAgDQo+ICAgVGhlIGRlZmF1bHQg
dmFsdWUgaXMgQjwweGZmZmZmZmZmPiwgbWVhbmluZyB0aGF0IGFsbCBwb3NzaWJsZSBYZW5z
dG9yZQ0KPiAgIGZlYXR1cmVzIGFyZSB2aXNpYmxlIGJ5IHRoZSBndWVzdC4NCj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3hsL3hsX2luZm8uYyBiL3Rvb2xzL3hsL3hsX2luZm8uYw0KPiBpbmRl
eCBlYjAxOWUzZWU5Li5kMzU4M2NiZjhmIDEwMDY0NA0KPiAtLS0gYS90b29scy94bC94bF9p
bmZvLmMNCj4gKysrIGIvdG9vbHMveGwveGxfaW5mby5jDQo+IEBAIC0zNTMsNyArMzUzLDcg
QEAgc3RhdGljIHZvaWQgb3V0cHV0X3hlbnN0b3JlX2luZm8odm9pZCkNCj4gICAgICAgeHNf
Y2xvc2UoeHNoKTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCBwcmludF9pbmZvKGlu
dCBudW1hKQ0KPiArc3RhdGljIHZvaWQgcHJpbnRfaW5mbyhpbnQgbnVtYSwgYm9vbCB4cykN
Cj4gICB7DQo+ICAgICAgIG91dHB1dF9ub2RlaW5mbygpOw0KPiAgIA0KPiBAQCAtMzY1LDcg
KzM2NSw4IEBAIHN0YXRpYyB2b2lkIHByaW50X2luZm8oaW50IG51bWEpDQo+ICAgICAgIH0N
Cj4gICAgICAgb3V0cHV0X3hlbmluZm8oKTsNCj4gICANCj4gLSAgICBvdXRwdXRfeGVuc3Rv
cmVfaW5mbygpOw0KPiArICAgIGlmICh4cykNCj4gKyAgICAgICAgb3V0cHV0X3hlbnN0b3Jl
X2luZm8oKTsNCj4gICANCj4gICAgICAgbWF5YmVfcHJpbnRmKCJ4ZW5kX2NvbmZpZ19mb3Jt
YXQgICAgIDogNFxuIik7DQo+ICAgDQo+IEBAIC02MzEsMTQgKzYzMiwxOSBAQCBpbnQgbWFp
bl9pbmZvKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gICAgICAgaW50IG9wdDsNCj4gICAg
ICAgc3RhdGljIHN0cnVjdCBvcHRpb24gb3B0c1tdID0gew0KPiAgICAgICAgICAgeyJudW1h
IiwgMCwgMCwgJ24nfSwNCj4gKyAgICAgICAgeyJ4ZW5zdG9yZSIsIDAsIDAsICd4J30sDQo+
ICAgICAgICAgICBDT01NT05fTE9OR19PUFRTDQo+ICAgICAgIH07DQo+ICAgICAgIGludCBu
dW1hID0gMDsNCj4gKyAgICBib29sIHhzID0gZmFsc2U7DQo+ICAgDQo+IC0gICAgU1dJVENI
X0ZPUkVBQ0hfT1BUKG9wdCwgIm4iLCBvcHRzLCAiaW5mbyIsIDApIHsNCj4gKyAgICBTV0lU
Q0hfRk9SRUFDSF9PUFQob3B0LCAibngiLCBvcHRzLCAiaW5mbyIsIDApIHsNCj4gICAgICAg
Y2FzZSAnbic6DQo+ICAgICAgICAgICBudW1hID0gMTsNCj4gICAgICAgICAgIGJyZWFrOw0K
PiArICAgIGNhc2UgJ3gnOg0KPiArICAgICAgICB4cyA9IHRydWU7DQo+ICsgICAgICAgIGJy
ZWFrOw0KPiAgICAgICB9DQo+ICAgDQo+ICAgICAgIC8qDQo+IEBAIC02NDgsNyArNjU0LDcg
QEAgaW50IG1haW5faW5mbyhpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICAgICAgIGlmIChu
dW1hID09IDAgJiYgYXJnYyA+IG9wdGluZCkNCj4gICAgICAgICAgIGluZm9fbmFtZSA9IGFy
Z3Zbb3B0aW5kXTsNCj4gICANCj4gLSAgICBwcmludF9pbmZvKG51bWEpOw0KPiArICAgIHBy
aW50X2luZm8obnVtYSwgeHMpOw0KPiAgICAgICByZXR1cm4gMDsNCj4gICB9DQo+ICAgDQoN
Cg==
--------------ec8tc0rs9iqSFNSQgMMruLG0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ec8tc0rs9iqSFNSQgMMruLG0--

--------------2Lb4BPtvePWZwQg4grnGBijt--

--------------A0Dcn3IjDW2NBO0w5M2PlIz0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmifRboFAwAAAAAACgkQsN6d1ii/Ey8y
4wf9FZshIg+hJnal1upPNBUIcCo9MRmHsdtNeNen5Tk5vucKgJmN83uyjFDtJ96KeP89oJ+9Z40g
1eN1uen8nN5TOWbqO043ZBRBQyRLGucWXmfYVfsixPVkElYNgbWmdoU5YPFmHKXpt383zzy8Fars
EulkQviIzIFUmXjD8wv1ThPRmjuIVrhxoyp7+WOr27Sl33kvfOc2xpirpeO7A+ffrA9kqNsiDBfa
Kbe+NCLNjgBuaetf8JDuG1S8WH4wCojYud6wwW2SuyBOHlfAas3oZ077osr96Rc9ojz+YfDsmXlu
nDbkSnYW4ZTTINRRmTNo6be5ntLY2ZFQIQX4GsyqQw==
=J+UN
-----END PGP SIGNATURE-----

--------------A0Dcn3IjDW2NBO0w5M2PlIz0--

