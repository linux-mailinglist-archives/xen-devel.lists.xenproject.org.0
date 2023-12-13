Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE758810A25
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 07:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653720.1020188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDIYc-0004QP-Fd; Wed, 13 Dec 2023 06:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653720.1020188; Wed, 13 Dec 2023 06:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDIYc-0004Nx-C9; Wed, 13 Dec 2023 06:17:22 +0000
Received: by outflank-mailman (input) for mailman id 653720;
 Wed, 13 Dec 2023 06:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7vuN=HY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rDIYb-0004Nr-6l
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 06:17:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 449bf78d-997f-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 07:17:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22F621FD3B;
 Wed, 13 Dec 2023 06:17:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5F1F137E8;
 Wed, 13 Dec 2023 06:17:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CQ7RJm1MeWX5EAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Dec 2023 06:17:17 +0000
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
X-Inumbo-ID: 449bf78d-997f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702448238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mHK8q3vJE+OjcW2u4TBQGGX1PBvKCT0ty4MmbcIUzu0=;
	b=EuPa+9IyqehDiHAFW7uxCKjfGOrV3Y6+651v2WI4RWIUALgee4OYE3objGMMDpnqNuFiIY
	x5u1qj3NiPyZ4hN6Say8MbR4qDpgfqwMvVFOtWvlfxduTmzKResMmZxh9lMXVPskosLg3K
	kL6uHW3n4Lv22iqX0uJS20yFg2Fp6r8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702448238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mHK8q3vJE+OjcW2u4TBQGGX1PBvKCT0ty4MmbcIUzu0=;
	b=EuPa+9IyqehDiHAFW7uxCKjfGOrV3Y6+651v2WI4RWIUALgee4OYE3objGMMDpnqNuFiIY
	x5u1qj3NiPyZ4hN6Say8MbR4qDpgfqwMvVFOtWvlfxduTmzKResMmZxh9lMXVPskosLg3K
	kL6uHW3n4Lv22iqX0uJS20yFg2Fp6r8=
Message-ID: <f619efa1-da81-446b-968b-f81a2d18a7e5@suse.com>
Date: Wed, 13 Dec 2023 07:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
 <c7a969af-274b-4e92-b083-56059cbc98d6@xen.org>
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
In-Reply-To: <c7a969af-274b-4e92-b083-56059cbc98d6@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U8pLdVWt4PD8TQ8TSHL0ppGQ"
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.99
X-Spam-Level: 
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-5.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: -5.99

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U8pLdVWt4PD8TQ8TSHL0ppGQ
Content-Type: multipart/mixed; boundary="------------x96oUW6390DxsmmhINMkChZW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
Message-ID: <f619efa1-da81-446b-968b-f81a2d18a7e5@suse.com>
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
 <c7a969af-274b-4e92-b083-56059cbc98d6@xen.org>
In-Reply-To: <c7a969af-274b-4e92-b083-56059cbc98d6@xen.org>

--------------x96oUW6390DxsmmhINMkChZW
Content-Type: multipart/mixed; boundary="------------0mFD8HQnVjlRlrC00R0b1cEe"

--------------0mFD8HQnVjlRlrC00R0b1cEe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjMgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEyLzEyLzIwMjMgMDk6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiAt
I2RlZmluZSBzcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwpIF9fc3Bpbl9sb2NrX2luaXRfcHJv
ZihzLCBsLCBzcGlubG9ja190KQ0KPj4gLSNkZWZpbmUgcnNwaW5fbG9ja19pbml0X3Byb2Yo
cywgbCkgX19zcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwsIHJzcGlubG9ja190KQ0KPj4gKyNk
ZWZpbmUgc3Bpbl9sb2NrX2luaXRfcHJvZihzLCBsKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoCBfX3NwaW5fbG9ja19pbml0X3Byb2YocywgbCwg
bG9jaywgc3BpbmxvY2tfdCwgMCkNCj4+ICsjZGVmaW5lIHJzcGluX2xvY2tfaW5pdF9wcm9m
KHMsIGwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoCBf
X3NwaW5fbG9ja19pbml0X3Byb2YocywgbCwgcmxvY2ssIHJzcGlubG9ja190LCAxKQ0KPj4g
wqAgdm9pZCBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgNCj4+IMKgwqDCoMKgwqAg
aW50MzJfdCB0eXBlLCBzdHJ1Y3QgbG9ja19wcm9maWxlX3FoZWFkICpxaGVhZCwgaW50MzJf
dCBpZHgpOw0KPj4gQEAgLTE3NCw2ICsxNzksNyBAQCBzdHJ1Y3QgbG9ja19wcm9maWxlX3Fo
ZWFkIHsgfTsNCj4+IMKgICNlbmRpZg0KPj4gKw0KPiANCj4gU3B1cmlvdXMgY2hhbmdlPw0K
DQpJbmRlZWQsIHdpbGwgcmVtb3ZlIGl0Lg0KDQo+IA0KPj4gwqAgdHlwZWRlZiB1bmlvbiB7
DQo+PiDCoMKgwqDCoMKgIHVpbnQzMl90IGhlYWRfdGFpbDsNCj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IHsNCj4+IEBAIC0yNjEsNCArMjY3LDEyIEBAIHZvaWQgcnNwaW5fdW5sb2NrX2lycXJl
c3RvcmUocnNwaW5sb2NrX3QgKmxvY2ssIHVuc2lnbmVkIA0KPj4gbG9uZyBmbGFncyk7DQo+
PiDCoCAvKiBFbnN1cmUgYSBsb2NrIGlzIHF1aWVzY2VudCBiZXR3ZWVuIHR3byBjcml0aWNh
bCBvcGVyYXRpb25zLiAqLw0KPj4gwqAgI2RlZmluZSBzcGluX2JhcnJpZXIobCnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9zcGluX2JhcnJpZXIobCkNCj4+ICsjZGVmaW5lIG5y
c3Bpbl90cnlsb2NrKGwpwqDCoMKgIHNwaW5fdHJ5bG9jayhsKQ0KPj4gKyNkZWZpbmUgbnJz
cGluX2xvY2sobCnCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKGwpDQo+PiArI2RlZmluZSBucnNw
aW5fdW5sb2NrKGwpwqDCoMKgwqAgc3Bpbl91bmxvY2sobCkNCj4+ICsjZGVmaW5lIG5yc3Bp
bl9sb2NrX2lycShsKcKgwqAgc3Bpbl9sb2NrX2lycShsKQ0KPj4gKyNkZWZpbmUgbnJzcGlu
X3VubG9ja19pcnEobCkgc3Bpbl91bmxvY2tfaXJxKGwpDQo+PiArI2RlZmluZSBucnNwaW5f
bG9ja19pcnFzYXZlKGwsIGYpwqDCoMKgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZShsLCBmKQ0K
Pj4gKyNkZWZpbmUgbnJzcGluX3VubG9ja19pcnFyZXN0b3JlKGwsIGYpIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUobCwgZikNCj4gDQo+IFRoZXJlIGlzIGEgY29tbWVudCBkZXNjcmliaW5n
IFtyXXNwaW5sb2NrIGJ1dCBub3QgdGhpcyBuZXcgdmFyaWFudC4gQ2FuIHlvdSBhZGQgDQo+
IG9uZT8NCg0KT2theS4NCg0KPiBUaGF0IHNhaWQsIEkga25vdyB0aGlzIGlzIGV4aXN0aW5n
IGNvZGUsIGJ1dCBJIGhhdmUgdG8gYWRtaXQgdGhpcyBpcyBhIGJpdCANCj4gdW5jbGVhciB3
aHkgd2UgYXJlIGFsbG93aW5nIGFuIHJlY3Vyc2l2ZSBzcGlubG9jayB0byBiZSBub24tcmVj
dXJzaXZlLiBUbyBtZSBpdCANCj4gc291bmRzIGxpa2Ugd2UgYXJlIG1ha2luZyB0aGUgdHlw
ZXNhZmUgbm90IHZlcnkgc2FmZSBiZWNhdXNlIGl0IGRvZXNuJ3QgDQo+IGd1YXJhbnRlZSB0
aGF0IHdlIGFyZSBub3QgbWl4aW5nIHRoZSBjYWxsIG5yc3Bpbl8qIHdpdGggcnNwaW5fKi4N
Cg0KVGhpcyBpcyB0aGUgY3VycmVudCBBUEkuDQoNCklmIHlvdSBoYXZlIGxvY2tlZCB3aXRo
IG5yc3Bpbl8qLCBhbnkgcnNwaW5fKiBhdHRlbXB0IG9uIHRoZSBzYW1lIGxvY2sgd2lsbA0K
c3BpbiB1bnRpbCByc3Bpbl91bmxvY2sgKG5yc3Bpbl8qIHdpbGwgbm90IHNldCByZWN1cnNl
X2NwdSwgYnV0IHRha2UgdGhlDQpsb2NrKS4NCg0KSWYgeW91IGhhdmUgbG9ja2VkIHdpdGgg
cnNwaW5fKiwgYW55IG5yc3Bpbl8qIGF0dGVtcHQgb24gdGhlIHNhbWUgbG9jayB3aWxsDQpz
cGluLCB0b28uDQoNClNvIEkgZG9uJ3Qgc2VlIGFueSBtYWpvciBwcm9ibGVtIHJlZ2FyZGlu
ZyBhY2NpZGVudGFsIG1pc3VzZSwgd2hpY2ggd291bGRuJ3QNCmJlIHZpc2libGUgYnkgZGVh
ZGxvY2tzICh0aGVyZSBpcyBubyBzaWxlbnQgbWlzYmVoYXZpb3IpLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------0mFD8HQnVjlRlrC00R0b1cEe
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0mFD8HQnVjlRlrC00R0b1cEe--

--------------x96oUW6390DxsmmhINMkChZW--

--------------U8pLdVWt4PD8TQ8TSHL0ppGQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV5TG0FAwAAAAAACgkQsN6d1ii/Ey88
fwf+PvmY90SgiqWCSfRxWMU9h8Ot/XAenRzhPeyvbA7doUyyvw2EFI9i7ly/ILpkZV1hkOSkUUCQ
nLdSfK6RWhaDsGxMa+R/3c6ExNR1p5HFTKEfG9TYHgxixcb/lxVc0YRWNLUGDv/LXn1j8ieRghV8
mgnuwkyDU6tSsvQCPEZri9zPKLnFggOFMmSb4AWz9H5jpwmPl8SgYzgB4/XF5y3pyKpTJxNdqxi4
Z6YUAh4dxekQKjtCT4f7hA88xTBcepSzKCuTRxBMxBYyJDdb3C186+q7Eye1/L2Ry4/bleKIYz4d
0WjOjoualKHu4qBce8xnTdNpBxkURVtStsWnFiMN3w==
=zJbY
-----END PGP SIGNATURE-----

--------------U8pLdVWt4PD8TQ8TSHL0ppGQ--

