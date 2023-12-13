Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E594810D14
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653790.1020353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLHP-0001GR-2r; Wed, 13 Dec 2023 09:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653790.1020353; Wed, 13 Dec 2023 09:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLHO-0001El-WF; Wed, 13 Dec 2023 09:11:47 +0000
Received: by outflank-mailman (input) for mailman id 653790;
 Wed, 13 Dec 2023 09:11:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7vuN=HY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rDLHN-0001Ef-7g
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:11:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1173c16-9997-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 10:11:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 423552254A;
 Wed, 13 Dec 2023 09:11:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C87881377F;
 Wed, 13 Dec 2023 09:11:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2OmYL0x1eWXPPgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Dec 2023 09:11:40 +0000
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
X-Inumbo-ID: a1173c16-9997-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702458701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QdUl4RajCCF5I8J16BwxSqtLV4AuPBR5BmDWWapreug=;
	b=afSHlj2gMd1Hwgj2tRZnOKfoG+vGeauPv6Pxmg7/YTs9UxbLSyCwAM5t8N3QlBwyKhypnR
	RWE6Uphlt5lZWaINUa4UktdI31Mp80mxklkcq5LXbIil1WBKkzrIiY4wxSgEfBAhMu8CGR
	0vLHH6NFyZnxwlHPDG7MfP3BTXFcquk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702458701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QdUl4RajCCF5I8J16BwxSqtLV4AuPBR5BmDWWapreug=;
	b=afSHlj2gMd1Hwgj2tRZnOKfoG+vGeauPv6Pxmg7/YTs9UxbLSyCwAM5t8N3QlBwyKhypnR
	RWE6Uphlt5lZWaINUa4UktdI31Mp80mxklkcq5LXbIil1WBKkzrIiY4wxSgEfBAhMu8CGR
	0vLHH6NFyZnxwlHPDG7MfP3BTXFcquk=
Message-ID: <e903b152-cefe-4c87-a503-08c75a484767@suse.com>
Date: Wed, 13 Dec 2023 10:11:40 +0100
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
 <f619efa1-da81-446b-968b-f81a2d18a7e5@suse.com>
 <5c2e8010-5548-4bef-bdb0-1613e2893a0d@xen.org>
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
In-Reply-To: <5c2e8010-5548-4bef-bdb0-1613e2893a0d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J40hAAdsO36cMtttllufRLFr"
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.99
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.19
X-Spamd-Result: default: False [-6.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-0.996];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J40hAAdsO36cMtttllufRLFr
Content-Type: multipart/mixed; boundary="------------mv0FCIzmAt7nbj3THU5cK0Th";
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
Message-ID: <e903b152-cefe-4c87-a503-08c75a484767@suse.com>
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
 <c7a969af-274b-4e92-b083-56059cbc98d6@xen.org>
 <f619efa1-da81-446b-968b-f81a2d18a7e5@suse.com>
 <5c2e8010-5548-4bef-bdb0-1613e2893a0d@xen.org>
In-Reply-To: <5c2e8010-5548-4bef-bdb0-1613e2893a0d@xen.org>

--------------mv0FCIzmAt7nbj3THU5cK0Th
Content-Type: multipart/mixed; boundary="------------HMkyses7sbKQKkxnQcLs0Nqq"

--------------HMkyses7sbKQKkxnQcLs0Nqq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTIuMjMgMDk6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAx
My8xMi8yMDIzIDA2OjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTIuMTIuMjMg
MTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+Pj4g
T24gMTIvMTIvMjAyMyAwOTo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gLSNkZWZp
bmUgc3Bpbl9sb2NrX2luaXRfcHJvZihzLCBsKSBfX3NwaW5fbG9ja19pbml0X3Byb2Yocywg
bCwgc3BpbmxvY2tfdCkNCj4+Pj4gLSNkZWZpbmUgcnNwaW5fbG9ja19pbml0X3Byb2Yocywg
bCkgX19zcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwsIHJzcGlubG9ja190KQ0KPj4+PiArI2Rl
ZmluZSBzcGluX2xvY2tfaW5pdF9wcm9mKHMsIA0KPj4+PiBsKcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+PiArwqDCoMKgIF9fc3Bpbl9sb2NrX2luaXRfcHJv
ZihzLCBsLCBsb2NrLCBzcGlubG9ja190LCAwKQ0KPj4+PiArI2RlZmluZSByc3Bpbl9sb2Nr
X2luaXRfcHJvZihzLCANCj4+Pj4gbCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcDQo+Pj4+ICvCoMKgwqAgX19zcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwsIHJsb2NrLCBy
c3BpbmxvY2tfdCwgMSkNCj4+Pj4gwqAgdm9pZCBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0
cnVjdCgNCj4+Pj4gwqDCoMKgwqDCoCBpbnQzMl90IHR5cGUsIHN0cnVjdCBsb2NrX3Byb2Zp
bGVfcWhlYWQgKnFoZWFkLCBpbnQzMl90IGlkeCk7DQo+Pj4+IEBAIC0xNzQsNiArMTc5LDcg
QEAgc3RydWN0IGxvY2tfcHJvZmlsZV9xaGVhZCB7IH07DQo+Pj4+IMKgICNlbmRpZg0KPj4+
PiArDQo+Pj4NCj4+PiBTcHVyaW91cyBjaGFuZ2U/DQo+Pg0KPj4gSW5kZWVkLCB3aWxsIHJl
bW92ZSBpdC4NCj4+DQo+Pj4NCj4+Pj4gwqAgdHlwZWRlZiB1bmlvbiB7DQo+Pj4+IMKgwqDC
oMKgwqAgdWludDMyX3QgaGVhZF90YWlsOw0KPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCB7DQo+
Pj4+IEBAIC0yNjEsNCArMjY3LDEyIEBAIHZvaWQgcnNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
cnNwaW5sb2NrX3QgKmxvY2ssIA0KPj4+PiB1bnNpZ25lZCBsb25nIGZsYWdzKTsNCj4+Pj4g
wqAgLyogRW5zdXJlIGEgbG9jayBpcyBxdWllc2NlbnQgYmV0d2VlbiB0d28gY3JpdGljYWwg
b3BlcmF0aW9ucy4gKi8NCj4+Pj4gwqAgI2RlZmluZSBzcGluX2JhcnJpZXIobCnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9zcGluX2JhcnJpZXIobCkNCj4+Pj4gKyNkZWZpbmUg
bnJzcGluX3RyeWxvY2sobCnCoMKgwqAgc3Bpbl90cnlsb2NrKGwpDQo+Pj4+ICsjZGVmaW5l
IG5yc3Bpbl9sb2NrKGwpwqDCoMKgwqDCoMKgIHNwaW5fbG9jayhsKQ0KPj4+PiArI2RlZmlu
ZSBucnNwaW5fdW5sb2NrKGwpwqDCoMKgwqAgc3Bpbl91bmxvY2sobCkNCj4+Pj4gKyNkZWZp
bmUgbnJzcGluX2xvY2tfaXJxKGwpwqDCoCBzcGluX2xvY2tfaXJxKGwpDQo+Pj4+ICsjZGVm
aW5lIG5yc3Bpbl91bmxvY2tfaXJxKGwpIHNwaW5fdW5sb2NrX2lycShsKQ0KPj4+PiArI2Rl
ZmluZSBucnNwaW5fbG9ja19pcnFzYXZlKGwsIGYpwqDCoMKgwqDCoCBzcGluX2xvY2tfaXJx
c2F2ZShsLCBmKQ0KPj4+PiArI2RlZmluZSBucnNwaW5fdW5sb2NrX2lycXJlc3RvcmUobCwg
Zikgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShsLCBmKQ0KPj4+DQo+Pj4gVGhlcmUgaXMgYSBj
b21tZW50IGRlc2NyaWJpbmcgW3Jdc3BpbmxvY2sgYnV0IG5vdCB0aGlzIG5ldyB2YXJpYW50
LiBDYW4geW91IA0KPj4+IGFkZCBvbmU/DQo+Pg0KPj4gT2theS4NCj4+DQo+Pj4gVGhhdCBz
YWlkLCBJIGtub3cgdGhpcyBpcyBleGlzdGluZyBjb2RlLCBidXQgSSBoYXZlIHRvIGFkbWl0
IHRoaXMgaXMgYSBiaXQgDQo+Pj4gdW5jbGVhciB3aHkgd2UgYXJlIGFsbG93aW5nIGFuIHJl
Y3Vyc2l2ZSBzcGlubG9jayB0byBiZSBub24tcmVjdXJzaXZlLiBUbyBtZSANCj4+PiBpdCBz
b3VuZHMgbGlrZSB3ZSBhcmUgbWFraW5nIHRoZSB0eXBlc2FmZSBub3QgdmVyeSBzYWZlIGJl
Y2F1c2UgaXQgZG9lc24ndCANCj4+PiBndWFyYW50ZWUgdGhhdCB3ZSBhcmUgbm90IG1peGlu
ZyB0aGUgY2FsbCBucnNwaW5fKiB3aXRoIHJzcGluXyouDQo+Pg0KPj4gVGhpcyBpcyB0aGUg
Y3VycmVudCBBUEkuDQo+IA0KPiBJIGtub3cuIFRoaXMgaXMgd2h5IEkgd3JvdGUgIkkga25v
dyB0aGlzIGlzIGV4aXN0aW5nIGNvZGUiLg0KPiANCj4+DQo+PiBJZiB5b3UgaGF2ZSBsb2Nr
ZWQgd2l0aCBucnNwaW5fKiwgYW55IHJzcGluXyogYXR0ZW1wdCBvbiB0aGUgc2FtZSBsb2Nr
IHdpbGwNCj4+IHNwaW4gdW50aWwgcnNwaW5fdW5sb2NrIChucnNwaW5fKiB3aWxsIG5vdCBz
ZXQgcmVjdXJzZV9jcHUsIGJ1dCB0YWtlIHRoZQ0KPj4gbG9jaykuDQo+Pg0KPj4gSWYgeW91
IGhhdmUgbG9ja2VkIHdpdGggcnNwaW5fKiwgYW55IG5yc3Bpbl8qIGF0dGVtcHQgb24gdGhl
IHNhbWUgbG9jayB3aWxsDQo+PiBzcGluLCB0b28uDQo+Pg0KPj4gU28gSSBkb24ndCBzZWUg
YW55IG1ham9yIHByb2JsZW0gcmVnYXJkaW5nIGFjY2lkZW50YWwgbWlzdXNlLCB3aGljaCB3
b3VsZG4ndA0KPj4gYmUgdmlzaWJsZSBieSBkZWFkbG9ja3MgKHRoZXJlIGlzIG5vIHNpbGVu
dCBtaXNiZWhhdmlvcikuDQo+IA0KPiBSaWdodCwgc28gdGhpcyB3aWxsIGxlYWQgdG8gYSBk
ZWFkbG9jaywgd2hpY2ggaXMgbXkgY29uY2Vybi4gSWYgd2Ugd2VyZSB1c2luZyANCj4gcnNw
aW5sb2NrXyogZXZlcnl3aGVyZSB0aGVuIHRoZSBkZWFkbG9jayAoYXQgbGVhc3QgaW4gdGhl
IGNhc2Ugd2hlbiB5b3UgcmVjdXJzZSkgDQo+IHdvdWxkIGluIHRoZW9yeSBub3QgYmUgcG9z
c2libGUgKHVubGVzcyB5b3UgcmVjdXJzZSB0b28gbXVjaCkuDQoNCkEgcHJvZ3JhbW1pbmcg
ZXJyb3IgY2FuIGxlYWQgdG8gYSBkZWFkbG9jaywgeWVzLg0KDQpNeSB1bmRlcnN0YW5kaW5n
IGlzIHRoYXQgdGhlcmUgYXJlIGRlbGliZXJhdGUgdXNlIGNhc2VzIG9mIG5vbi1yZWN1cnNp
dmUgbG9ja2luZw0KYXMgcGF0aHMgdXNpbmcgcmVjdXJzaXZlIGxvY2tpbmcgb2YgdGhlIHNh
bWUgbG9jayBhcmUgbm90IGFsbG93ZWQgaW4gdGhvc2UNCmNhc2VzLg0KDQpKdXN0IHVzaW5n
IHJzcGlubG9ja18qIGluc3RlYWQgb2YgbnJzcGlubG9ja18qIHdvdWxkIHNpbGVudGx5IGln
bm9yZSBzdWNoIGNhc2VzLA0Kd2hpY2ggaXMgZmFyIHdvcnNlIHRoYW4gYSBkZWFkbG9jaywg
YXMgdGhvc2UgY2FzZXMgbWlnaHQgaW50cm9kdWNlIGUuZy4gc2VjdXJpdHkNCmhvbGVzLg0K
DQo+IE15IHBvaW50IGhlcmUgaXMgdG8gc2ltcGxpZnkgdGhlIGludGVyZmFjZSByYXRoZXIg
dGhhbiBwcm92aWRpbmcgYmVjYXVzZSBJIGRvbid0IA0KPiByZWFsbHkgc2VlIHRoZSBiZW5l
Zml0cyBvZiBwcm92aWRpbmcgYSBub24tcmVjdXJzaXZlIHZlcnNpb24gZm9yIHJlY3Vyc2l2
ZSANCj4gc3BpbmxvY2suDQo+IA0KPiBBbnl3YXkgYXMgSSBzYWlkIHRoaXMgaXMgbm90aGlu
ZyBuZXcuDQoNCkNvcnJlY3QuIE5vdGhpbmcgSSdkIGxpa2UgdG8gYWRkcmVzcyBpbiB0aGlz
IHNlcmllcy4NCg0KDQpKdWVyZ2VuDQo=
--------------HMkyses7sbKQKkxnQcLs0Nqq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HMkyses7sbKQKkxnQcLs0Nqq--

--------------mv0FCIzmAt7nbj3THU5cK0Th--

--------------J40hAAdsO36cMtttllufRLFr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV5dUwFAwAAAAAACgkQsN6d1ii/Ey/P
dAf+NVE1Q43NMXyTpaLefS07BKg78wWRQZwvo6VmPRr0Ucr5H/Fq31NL6MzNNN7C/YgRcPpht3tp
/Nwcd1x2OUXrgRle0xXffJyJJvvkY54Fh8las/6LcgnaukdWjzpMLw8J4K6h8vWX6sFFDPZlJDfi
5ducR0ncuSLDm6IQeEekjMD3GbfvvuCJxBjkcERPG9ISU+GV1VlVLPmAr+TWFGvcTqTCB/7RDr53
JNl6yDL1pocBDLn2YXJpV8tZfOUYbPYzCN+L4aLTJqvo0MYdMVPBBcqLnb9nkHFgif6YJOnMLAw1
VqDfcV1+a9NCQ8Jb9RnELWNtBYQg8AqgMAsOcI7aTA==
=0vY3
-----END PGP SIGNATURE-----

--------------J40hAAdsO36cMtttllufRLFr--

