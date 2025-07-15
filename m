Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1220B055BB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 11:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043887.1413936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbYd-0001vc-0t; Tue, 15 Jul 2025 09:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043887.1413936; Tue, 15 Jul 2025 09:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbYc-0001sc-Tg; Tue, 15 Jul 2025 09:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1043887;
 Tue, 15 Jul 2025 09:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubbYb-0001qn-3E
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 09:02:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ad939d-615a-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 11:02:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 348D521244;
 Tue, 15 Jul 2025 09:02:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F210813306;
 Tue, 15 Jul 2025 09:02:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FdZHOSkZdmgsXwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 09:02:33 +0000
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
X-Inumbo-ID: 72ad939d-615a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752570154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C1grTt4IfEny7+WO/U9sRuzX1qYLnZUBF5/g0J/RCwI=;
	b=LHBo1rnIHzvCS7dbN5NPB4vwTPK4luF6BpFrqmv/lePLSOcEDQegvD4V9VMujATMl137Ex
	8DCaRu38SNyNSmfQnYY768tnjnwseS5lK3HPaI/BKGKiNtstNW7RkZjIxlOdKQ0pq3LbUL
	UaFgAkhQigGEB8iVMxq4at0Rnj5VX80=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=LHBo1rnI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752570154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C1grTt4IfEny7+WO/U9sRuzX1qYLnZUBF5/g0J/RCwI=;
	b=LHBo1rnIHzvCS7dbN5NPB4vwTPK4luF6BpFrqmv/lePLSOcEDQegvD4V9VMujATMl137Ex
	8DCaRu38SNyNSmfQnYY768tnjnwseS5lK3HPaI/BKGKiNtstNW7RkZjIxlOdKQ0pq3LbUL
	UaFgAkhQigGEB8iVMxq4at0Rnj5VX80=
Message-ID: <8f39cb41-a02d-4b55-9846-87fa9f67f901@suse.com>
Date: Tue, 15 Jul 2025 11:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 12/19] mini-os: kexec: add support for handing
 over some memory across kexec
To: Jason Andryuk <jason.andryuk@amd.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-13-jgross@suse.com>
 <cbb2c96d-c4da-4360-9f74-0dbfe3448747@amd.com>
 <82e521d2-9886-4540-8e8c-7096fd34451e@suse.com>
 <000bcec6-09ad-4784-9c1c-a5acd2ee52bb@amd.com>
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
In-Reply-To: <000bcec6-09ad-4784-9c1c-a5acd2ee52bb@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VuIFDv8p1TkY2q3cjiogkx0X"
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 348D521244
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Spam-Score: -6.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VuIFDv8p1TkY2q3cjiogkx0X
Content-Type: multipart/mixed; boundary="------------0ttz9XwLzz75lCOgCc3g3xdu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
Message-ID: <8f39cb41-a02d-4b55-9846-87fa9f67f901@suse.com>
Subject: Re: [MINI-OS PATCH 12/19] mini-os: kexec: add support for handing
 over some memory across kexec
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-13-jgross@suse.com>
 <cbb2c96d-c4da-4360-9f74-0dbfe3448747@amd.com>
 <82e521d2-9886-4540-8e8c-7096fd34451e@suse.com>
 <000bcec6-09ad-4784-9c1c-a5acd2ee52bb@amd.com>
In-Reply-To: <000bcec6-09ad-4784-9c1c-a5acd2ee52bb@amd.com>

--------------0ttz9XwLzz75lCOgCc3g3xdu
Content-Type: multipart/mixed; boundary="------------tno3Bow4pTmSNGkLbxdIU051"

--------------tno3Bow4pTmSNGkLbxdIU051
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDcuMjUgMjM6MjIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDct
MTEgMDM6NDksIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAxMS4wNy4yNSAwMToyMSwg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBPbiAyMDI1LTA3LTAyIDA0OjEyLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOg0KPj4+PiBFc3BlY2lhbGx5IGZvciBzdXBwb3J0IG9mIFhlbnN0b3Jl
LXN0dWJkb20gbGl2ZSB1cGRhdGUgc29tZSBtZW1vcnkgbXVzdA0KPj4+PiBiZSBoYW5kZWQg
b3ZlciB0byB0aGUgbmV3IGtlcm5lbCB3aXRob3V0IG1vdmluZyBpdCBhcm91bmQ6IGFzIHRo
ZQ0KPj4+PiA5cGZzIGRldmljZSB1c2VkIGZvciBzdG9yaW5nIGFuZCByZXRyaWV2aW5nIHRo
ZSBzdGF0ZSBvZiBYZW5zdG9yZQ0KPj4+PiBuZWVkcyB0byBiZSBrZXB0IG9wZXJhdGlvbmFs
IGFjcm9zcyBrZXhlYyAoaXQgY2FuJ3QgYmUgcmVvcGVuZWQgZHVlIHRvDQo+Pj4+IFhlbnN0
b3JlIG5vdCBiZWluZyBhdmFpbGFibGUgd2l0aG91dCBhY2Nlc3MgdG8gdGhlIGRldmljZSks
IHRoZSByaW5nDQo+Pj4+IHBhZ2VzIG5lZWQgdG8gYmUgYWNjZXNzaWJsZSB2aWEgYWN0aXZl
IGdyYW50cyBieSB0aGUgYmFja2VuZCBhbGwgdGhlDQo+Pj4+IHRpbWUuDQo+Pj4+DQo+Pj4+
IEFkZCB0aGUgYmFzaWMgc3VwcG9ydCBmb3IgdGhhdCBieSByZXNlcnZpbmcgYSBwcmUtZGVm
aW5lZCBudW1iZXIgb2YNCj4+Pj4gbWVtb3J5IHBhZ2VzIGF0IHRoZSB0b3Agb2YgdGhlIG1l
bW9yeS4gVGhpcyBtZW1vcnkgYXJlYSB3aWxsIGJlDQo+Pj4+IGhhbmRlZCBvdmVyIHRvIHRo
ZSBuZXcga2VybmVsIHZpYSBzcGVjaWZ5aW5nIGl0IGFzIGEgbW9kdWxlIGluDQo+Pj4+IHN0
cnVjdCBodm1fc3RhcnRfaW5mby4NCj4+Pj4NCj4+Pj4gVGhlIGNvbnRlbnRzIG9mIHRoZSBt
ZW1vcnkgYXJlYSBhcmUgZGVzY3JpYmVkIHZpYSBhIGdlbmVyaWMgdGFibGUgb2YNCj4+Pj4g
Y29udGVudHMgaW4gdGhlIGxhc3QgcGFnZSBvZiB0aGUgbWVtb3J5Lg0KPj4+Pg0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPj4+
PiBkaWZmIC0tZ2l0IGEvQ29uZmlnLm1rIGIvQ29uZmlnLm1rDQo+Pj4+IGluZGV4IGI5Njc1
ZTYxLi4wZTRlODZkOCAxMDA2NDQNCj4+Pj4gLS0tIGEvQ29uZmlnLm1rDQo+Pj4+ICsrKyBi
L0NvbmZpZy5taw0KPj4+PiBAQCAtMjIwLDYgKzIyMCw4IEBAIENPTkZJRy0kKGx3aXApICs9
IENPTkZJR19MV0lQDQo+Pj4+IMKgICQoZm9yZWFjaCBpLCQoQ09ORklHLXkpLCQoZXZhbCAk
KGkpID89IHkpKQ0KPj4+PiDCoCAkKGZvcmVhY2ggaSwkKENPTkZJRy1uKSwkKGV2YWwgJChp
KSA/PSBuKSkNCj4+Pj4gK0NPTkZJRy12YWwtJChDT05GSUdfS0VYRUMpICs9IENPTkZJR19L
RVhFQ19NT0RVTEVfUEFHRVMNCj4+Pj4gKw0KPj4+DQo+Pj4gSSBkb24ndCBrbm93IE1ha2Vm
aWxlcyB3ZWxsIGVub3VnaCB0byByZXZpZXcgdGhlIHByZWNlZGluZyBwYXRjaC4gVGhpcyAN
Cj4+PiBkb2Vzbid0IHNlZW0gdG8gYmUgdXNlZD8NCj4+DQo+PiBJdCBpcy4NCj4gDQo+IE9o
LCBzbyBzZXR0aW5nIENPTkZJRy12YWwteSwgdGhyb3VnaCB0aGUgTWFrZWZpbGUgbWFnaWMs
IGNyZWF0ZXMNCj4gLURDT05GSUdfS0VYRUNfTU9EVUxFX1BBR0VTPSRuDQo+IA0KPiBJIHNh
aWQgSSBkaWRuJ3Qga25vdyBNYWtlZmlsZXMgd2VsbCA6KQ0KPiANCj4+Pg0KPj4+PiDCoCAk
KGZvcmVhY2ggaSwkKENPTkZJRy12YWwteSksJChldmFsICQoaSkgPz0gMCkpDQo+Pj4+IMKg
IENPTkZJRy14ICs9IENPTkZJR19MSUJYUw0KPiANCj4+Pj4gK8KgwqDCoCBtb2R1bGVfcHRy
ID0gKHZvaWQgKikobW9kICsgbW9kX3NpemUgLSAodW5zaWduZWQgbG9uZylQQUdFX1NJWkUp
Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgLyogQ2hlY2sgZXllIGNhdGNoZXIuICovDQo+Pj4+
ICvCoMKgwqAgaWYgKCBtZW1jbXAobW9kdWxlX3B0ci0+ZXllX2NhdGNoZXIsIEtFWEVDTU9E
X0VZRUNBVENIRVIsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6
ZW9mKG1vZHVsZV9wdHItPmV5ZV9jYXRjaGVyKSkgKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIE5VTEw7DQo+Pj4+ICvCoMKgwqAgaWYgKCBtb2R1bGVfcHRyLT5uX3BhZ2VzICE9
IChtb2Rfc2l6ZSA+PiBQQUdFX1NISUZUKSAtIDEgKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIE5VTEw7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCByZXR1cm4gbW9kdWxlX3B0cjsN
Cj4+Pj4gK30NCj4+Pg0KPj4+PiArI2RlZmluZSBtaW4oYSwgYikgKChhKSA8IChiKSA/IChh
KSA6IChiKSkNCj4+Pj4gK3ZvaWQga2V4ZWNfbW9kdWxlKHVuc2lnbmVkIGxvbmcgc3RhcnRf
cGZuLCB1bnNpZ25lZCBsb25nIG1heF9wZm4pDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgLyog
UmV1c2UgYWxyZWFkeSBleGlzdGluZyBrZXhlYyBtb2R1bGUuICovDQo+Pj4+ICvCoMKgwqAg
bW9kX3B0ciA9IGtleGVjX2NoZWNrX21vZHVsZSgpOw0KPj4+PiArwqDCoMKgIGlmICggIW1v
ZF9wdHIgJiYgQ09ORklHX0tFWEVDX01PRFVMRV9QQUdFUyApDQo+Pj4NCj4+PiBXaGF0IGlm
IENPTkZJR19LRVhFQ19NT0RVTEVfUEFHRVMgY2hhbmdlcyBiZXR3ZWVuIHRoZSBvbGQgYW5k
IHRoZSBuZXcgc3R1YmRvbT8NCj4+DQo+PiBSaWdodCBub3cgdGhpcyB3b3VsZG4ndCByZWFs
bHkgbWF0dGVyLiBUaGUgQ09ORklHIHZhbHVlIGlzIHVzZWQNCj4+IG9ubHkgZm9yIHNpemlu
ZyB0aGUgbW9kdWxlIGlmIHdlIGFyZSBub3Qgc3RhcnRlZCB2aWEga2V4ZWMoKS4NCj4gDQo+
IFdoZW4gSSB3cm90ZSB0aGlzIEkgd2FzIHRoaW5raW5nIG9mOg0KPiBBIC0tIGtleGVjIC0t
PiBCIC0tIGtleGVjIC0tPiBDDQo+IA0KPiBBOiBDT05GSUdfS0VYRUNfTU9EVUxFX1BBR0VT
PTQNCj4gQjogQ09ORklHX0tFWEVDX01PRFVMRV9QQUdFUz02DQo+IA0KPiBXaGVuIEIgaXMg
cnVubmluZywgaXQgaGFzIHRoZSA0IHBhZ2VzIGZyb20gQSwgYnV0IGl0IGV4cGVjdHMgNiBh
dmFpbGFibGUgZm9yIGl0cyANCj4gdXNlLi4uLg0KDQpEZXBlbmRzLi4uDQoNCkxvb2tpbmcg
YXQgdGhlIGZpcnN0IHVzZXIgKHhlbnN0b3JlLXN0dWJkb20pLCB0aGluZ3MgYXJlIGEgbGl0
dGxlIGJpdCBtb3JlDQpjb21wbGljYXRlZC4NCg0KQWxsIHRoZSBhbGxvY2F0ZWQgcGFnZXMg
KHNvIGV2ZXJ5dGhpbmcgYXBhcnQgZnJvbSB0aGUgbGFzdCBwYWdlIGNvbnRhaW5pbmcgdGhl
DQpyZWNvcmRzKSBhcmUgdXNlZCBmb3IgdGhlIDlwZnMgZGV2aWNlIHNoYXJlZCBwYWdlcy4g
VGhpcyBudW1iZXIgd2lsbCBvbmx5DQpjaGFuZ2UsIGlmIHRoZSByaW5nIGJ1ZmZlciBzaXpl
IGlzIGNoYW5nZWQgKGxldHMgc2tpcCB0aGUgY2FzZSB3aGVyZSBhbm90aGVyDQp1c2UgY2Fz
ZSBvZiBhIGtleGVjIG1vZHVsZSBwYWdlIGlzIGNvbWluZyB1cCkuIEFzIHRoZSBkZXZpY2Ug
aXMgYmVpbmcga2VwdCBvcGVuDQphY3Jvc3Mga2V4ZWMoKSwgdGhlIHNpemUgb2YgdGhlIHJp
bmcgYnVmZmVyIHdpbGwgYmUga2VwdCwgc28gdGhlcmUgaXMgbm8gcmVhc29uDQp0byB1c2Ug
bW9yZSBrZXhlYyBtb2R1bGUgcGFnZXMuIFRoaXMgaXMgd29ya2luZyBmaW5lLCBhcyBhbGwg
dGhlIHJlbGV2YW50DQpwYXJhbWV0ZXJzIG9mIHRoZSA5cGZzIGRldmljZSBhcmUgdGFrZW4g
ZnJvbSB0aGUga2V4ZWMgOXBmcyByZWNvcmQgb3IgdGhlDQpzaGFyZWQgcGFnZXMgdGhlbXNl
bHZlcyBhZnRlciBrZXhlYygpLCBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBidWlsdGluIGRlZmF1
bHRzLg0KDQpUaGlzIGNvdWxkIGNoYW5nZSBvbmx5LCBpZiB3ZSdkIGFkZCBzdXBwb3J0IHRv
IHJlY29ubmVjdCB0aGUgOXBmcyBkZXZpY2UgYWZ0ZXINCmtleGVjKCkgdXNpbmcgYSBkaWZm
ZXJlbnQgcmluZyBidWZmZXIgc2l6ZSAoYW5kL29yIG1heWJlIG11bHRpcGxlIHJpbmdzKS4g
SW4NCnRoaXMgY2FzZSB3ZSdkIG5lZWQgdG8gaW1wbGVtZW50IHRoZSBjYXBhYmlsaXR5IHRv
IHJlc2l6ZSB0aGUga2V4ZWMgbW9kdWxlLA0Kd2hpY2ggaXMgcG9zc2libGUgd2l0aCB0aGUg
Y3VycmVudCBkZXNpZ24sIGJ1dCBub3QgbmVlZGVkIHlldC4NCg0KPiANCj4+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUva2V4ZWMuaCBiL2luY2x1ZGUva2V4ZWMuaA0KPj4+PiBpbmRleCBi
ODljMzAwMC4uMDIwMDAwNWYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUva2V4ZWMuaA0K
Pj4+PiArKysgYi9pbmNsdWRlL2tleGVjLmgNCj4+Pj4gQEAgLTIsNiArMiw0OCBAQA0KPj4+
PiDCoCAjZGVmaW5lIF9LRVhFQ19IDQo+Pj4+IMKgICNpbmNsdWRlIDxtaW5pLW9zL2VsZi5o
Pg0KPj4+PiArLyoNCj4+Pj4gKyAqIEtleGVjIG1vZHVsZSB1c2VkIHRvIGhhbmQgb3ZlciBt
ZW1vcnkgYWNyb3NzIGtleGVjKCkuDQo+Pj4+ICsgKg0KPj4+PiArICogVGhpcyBpcyBhbiBB
Qkkgd2hpY2ggc2hvdWxkIGJlIG1vZGlmaWVkIG9ubHkgaW4gYSBjb21wYXRpYmxlIHdheS4N
Cj4+Pj4gKyAqIHN0cnVjdCBrZXhlY19tb2R1bGUgaXMgbG9jYXRlZCBhdCB0aGUgc3RhcnQg
b2YgdGhlIGxhc3QgcGFnZSBvZiB0aGUgbW9kdWxlLg0KPj4+DQo+Pj4gV2h5IGlzIGtleGVj
X21vZHVsZSwgd2hpY2ggc2VlbXMgbGlrZSBhIGhlYWRlciwgcGxhY2VkIGluIHRoZSBsYXN0
IHBhZ2U/DQo+Pg0KPj4gSW4gY2FzZSB3ZSBldmVyIG5lZWQgdG8gZ3JvdyB0aGUgbW9kdWxl
IChlLmcuIHdoZW4gYWRkaW5nIG5ldyBkYXRhDQo+PiB0byBpdCBhbmQgd2l0aCB0aGF0IGhh
dmluZyB0byBoYW5kbGUgZGlmZmVyZW50IENPTkZJR19LRVhFQ19NT0RVTEVfUEFHRVMNCj4+
IHZhbHVlcyBiZXR3ZWVuIG9sZCBhbmQgbmV3IGJ1aWxkKSwgaXQgd2lsbCBiZSBlYXNpZXIs
IGFzIHRoZSBtb2R1bGUgd2lsbA0KPj4gbm9ybWFsbHkgYmUgbG9jYXRlZCBhdCB0aGUgZW5k
IG9mIHRoZSB1c2FibGUgbWVtb3J5LCBzbyB3ZSB3b3VsZG4ndCBoYXZlDQo+PiB0byBtb3Zl
IHRoZSBzdHJ1Y3Qga2V4ZWNfbW9kdWxlIGFyb3VuZC4NCj4gDQo+IC4uIGFuZCB0aGlzIGF2
b2lkcyB0aGF0IGlzc3VlIHNpbmNlIHRoZSBleHRyYSBwYWdlcyBjYW4gYmUgZ3JhYmJlZCB3
aXRob3V0IA0KPiBtb3Zpbmcgc3RydWN0IGtleGVjX21vZHVsZS4NCg0KUmlnaHQuDQoNCj4g
DQo+Pj4NCj4+Pj4gKyAqDQo+Pj4+ICsgKiBUaGUgbW9kdWxlIGNhbiBjb250YWluIGRhdGEv
cGFnZXMgb2YgbXVsdGlwbGUgdXNlcnMuIEVhY2ggdXNlciBoYXMgYW4gb3duDQo+Pj4+ICsg
KiByZWNvcmQgd2hpY2ggbGF5b3V0IGlzIGRlcGVuZGluZyBvbiB0aGUgdXNlci4gUmVjb3Jk
cyBhcmUgbGlua2VkIHZpYSBhIA0KPj4+PiB0YWJsZQ0KPj4+PiArICogb2YgcmVjb3JkIG9m
ZnNldHMuDQo+Pj4+ICsgKg0KPj4+PiArICogQWxsIGFkbWluIGRhdGEgKHN0cnVjdCBrZXhl
Y19tb2R1bGUsIHJlY29yZCBvZmZzZXQgdGFibGUgYW5kIHJlY29yZHMpIG11c3QNCj4+Pj4g
KyAqIGZpdCBpbnRvIHRoZSBsYXN0IHBhZ2Ugb2YgdGhlIG1vZHVsZS4NCj4+Pj4gKyAqLw0K
Pj4+PiArc3RydWN0IGtleGVjX21vZHVsZSB7DQo+Pj4+ICvCoMKgwqAgdWludDhfdCBleWVf
Y2F0Y2hlcls4XTsNCj4+Pj4gKyNkZWZpbmUgS0VYRUNNT0RfRVlFQ0FUQ0hFUiAiS2V4ZWNN
ZW0iDQo+Pj4+ICvCoMKgwqAgdWludDE2X3Qgbl9wYWdlczvCoMKgwqDCoMKgwqAgLyogTnVt
YmVyIG9mIGFsbG9jYXRhYmxlIHBhZ2VzIGluIHRoZSANCj4+Pj4gbW9kdWxlLsKgwqDCoCAq
Lw0KPj4+PiArwqDCoMKgIHVpbnQxNl90IG5fcmVjb3JkczvCoMKgwqDCoCAvKiBTaXplIG9m
IHJlY29yZCB0YWJsZSAobWF4LiANCj4+Pj4gMjU1KS7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqLw0KPj4+PiArI2RlZmluZSBLRVhFQ01PRF9SRUNfTUFYwqDCoMKgIDI1NQ0KPj4+
PiArwqDCoMKgIHVpbnQxNl90IHJlY3Nfb2ZmO8KgwqDCoMKgwqAgLyogT2Zmc2V0IHRvIHJl
Y29yZCB0YWJsZSBmcm9tIHN0YXJ0IG9mIA0KPj4+PiBwYWdlLsKgwqDCoCAqLw0KPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8qIFRoZSByZWNvcmQgdGFibGUgaXMgYW4gYXJyYXkgDQo+Pj4+IG9mwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHN0cnVjdCANCj4+Pj4ga2V4ZWNfbW9k
dWxlX3JlYy7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8N
Cj4+Pj4gK8KgwqDCoCB1aW50OF90IHBnMnJlY1tdO8KgwqDCoMKgwqDCoCAvKiBPbmUgZW50
cnkgcGVyIGFsbG9jYXRhYmxlIG1vZHVsZSBwYWdlLCANCj4+Pj4gdmFsdWXCoCAqLw0KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC8qIGlzIHJlY29yZCBudW1iZXIgKHN0YXJ0aW5nIGZyb20gMCkgDQo+Pj4+IGFzc29j
aWF0ZWQgKi8NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiB3aXRoIGl0LiBGcmVlIHBhZ2VzIGhhdmUgdmFsdWUgDQo+
Pj4+IDI1NS7CoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+DQo+Pj4gVGhpcyByZWFkcyBs
aWtlIGl0IGlzIDEgcGFnZSBwZXIgcmVjb3JkLi4uDQo+Pg0KPj4gTm8sIHRoaXMgbWVhbnMg
dGhhdCBlYWNoIHVzZWQgcGFnZSBpcyBhc3NvY2lhdGVkIHdpdGggYSByZWNvcmQsIGJ1dA0K
Pj4gdGhlcmUgY2FuIGJlIFswIC4uLiBuX3BhZ2VzXSBhc3NvY2lhdGVkIHdpdGggZWFjaCBy
ZWNvcmQuDQo+IA0KPiBNYXliZToNCj4gIk1hcHBpbmcgb2YgbW9kdWxlIHBhZ2VzIHRvIGFz
c29jaWF0ZWQgbW9kdWxlIHJlY29yZC7CoCBBbGxvY2F0ZWQgcGFnZXMgYXJlIA0KPiBpbmRp
Y2F0ZWQgYnkgdGhlaXIgcmVjb3JkIG51bWJlciAoc3RhcnRpbmcgZnJvbSAwKS7CoCBGcmVl
IHBhZ2VzIGhhdmUgdmFsdWUgMjU1LiI/DQoNCkZpbmUgd2l0aCBtZS4NCg0KPiANCj4+Pg0K
Pj4+PiArI2RlZmluZSBLRVhFQ01PRF9QR19GUkVFwqDCoMKgIDI1NQ0KPj4+PiArfTsNCj4+
Pj4gKw0KPj4+PiArc3RydWN0IGtleGVjX21vZHVsZV9yZWMgew0KPj4+PiArwqDCoMKgIHVp
bnQxNl90IG9mZnNldDvCoMKgwqDCoMKgwqDCoCAvKiBPZmZzZXQgdG8gcmVjb3JkIGZyb20g
c3RhcnQgb2YgDQo+Pj4+IHBhZ2UuwqDCoMKgwqDCoMKgwqDCoMKgICovDQo+Pj4NCj4+PiAu
Li4gYnV0IHRoZW4gd2h5IHdvdWxkIHlvdSBuZWVkIGFuIG9mZnNldD/CoCBIb3cgZG8geW91
IGlkZW50aWZ5IHdoaWNoICJwYWdlIiANCj4+PiBvciBkbyB5b3UgbWVhbiBmcm9tIHRoZSBz
dGFydCBvZiB0aGUgbW9kdWxlPw0KPj4NCj4+IFRoZSByZWNvcmQgaXRzZWxmIG5lZWRzIHRv
IGNvbnRhaW4gdGhlIGRhdGEgZm9yIGZpbmRpbmcgdGhlIHBhZ2VzDQo+PiBhc3NvY2lhdGVk
IHdpdGggaXQuIFNlZSBwYXRjaCAxOCBmb3IgdGhlIGRldGFpbHMgb2YgdGhlIDlwZnMgcmVj
b3JkDQo+PiBhZGRlZCB0aGVyZS4NCj4+DQo+PiBJdCB3aWxsIHVzZSBhbGwgMTcgYWxsb2Nh
dGFibGUgcGFnZXMgZnJvbSB0aGUgbW9kdWxlICgxIGZvciB0aGUgbWFpbg0KPj4gOXBmcyBz
aGFyZWQgaW50ZXJmYWNlIHBhZ2UgcGx1cyAxNiBmb3IgdGhlIHNoYXJlZCByaW5ncyksIHdo
aWxlIHRoZQ0KPj4gcmVjb3JkIGl0c2VsZiB3aWxsIGhvbGQgdGhlIGdyYW50IHJlZmVyZW5j
ZSBvZiB0aGUgOXBmcyBpbnRlcmZhY2UNCj4+IHBhZ2UsIHdoaWNoIHNlcnZlcyBhcyB0aGUg
a2V5IGZvciBsb2NhdGluZyB0aGUgcGFnZSBpdHNlbGYgYW5kIHRoZQ0KPj4gcmluZyBwYWdl
cy4NCj4gDQo+IEkgd2FzIG1pc3NpbmcgdGhlIG92ZXJhbGwgdmlldy7CoCBJIHRoaW5rIEkg
aGF2ZSBpdCBub3cgZnJvbSByZWFkaW5nIHBhdGNoIDEzLg0KPiANCj4gIEZyb20ga2V4ZWNf
bW9kX3N0YXJ0LCB3ZSBoYXZlOg0KPiAoQ09ORklHX0tFWEVDX01PRFVMRV9QQUdFUyAtIDEp
IHBhZ2VzIChhbGxvY2F0ZWQgYXMgcGFnZXMgLSByZWZlcmVuY2VkIGJ5IHBnMnJlYykNCj4g
c3RydWN0IGtleGVjX21vZHVsZSAqbW9kX3B0ciBpcyB0aGUgc3RhcnQgb2YgdGhlIGZpbmFs
IHBhZ2UuDQo+IHBnMnJlY1tuX3BhZ2VzXQ0KPiBzdHJ1Y3Qga2V4ZWNfbW9kdWxlX3JlYyBt
b2RfcmVjc1tuX3JlY29yZHNdDQo+IDwgZXh0cmEgZGF0YSBmb3IgZWFjaCBtb2RfcmVjcyBm
b3VuZCBieSAub2Zmc2V0IGFuZCAuc2l6ZSA+DQo+IA0KPiBJIGRpZG4ndCByZWFsaXplIHRo
ZSBtb2RfcmVjcyB3ZXJlIHNlcGFyYXRlIGZyb20gdGhlaXIgImV4dHJhIGRhdGEiLCBhbmQg
ZXh0cmEgDQo+IGRhdGEgdG9vayB1cCB0aGUgZW5kIG9mIHRoZS7CoCBJZiB0aGF0J3MgY29y
cmVjdCwgSSB0aGluayBpdCB3b3VsZCBiZSBoZWxwZnVsIHRvIA0KPiBkZXNjcmliZSB0aGUg
b3ZlcmFsbCBsYXlvdXQuDQoNCkknbGwgY2hhbmdlIHRoZSBrZXhlYyBtb2R1bGUgZGVzY3Jp
cHRpb24gY29tbWVudC4NCg0KDQpKdWVyZ2VuDQo=
--------------tno3Bow4pTmSNGkLbxdIU051
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tno3Bow4pTmSNGkLbxdIU051--

--------------0ttz9XwLzz75lCOgCc3g3xdu--

--------------VuIFDv8p1TkY2q3cjiogkx0X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh2GSkFAwAAAAAACgkQsN6d1ii/Ey9E
ywf+L6T1qifK0mFtET7dKE0xXIQc34JdFmd6BTecaaxsEtl2QSKpMXEcDifsyESkOpKLzLTTqqf7
UlG64Rle27s+jV/9Anli6/djienpNLvgo/Os6sYxamxUw8KHIvo3HTKGt7BvlUReT6NjtYZMf/Ml
h+8cZsVmWBLjiMXl5tfv/eomCI6ZTY+dAXMhf3avjOY9ZC/9jwVKNvjQDhHFyBIZ5x+AjzOIrGLZ
Di3Ab3PT9MOFsRpgDMu85RqrANK/ndVIJb7H2SxSn4MaxKmv41NaEkR6PD8zW2lco+ZNuba/fsPt
h924tL62Erqq3k21BwBtKN3BL2BLzvJ2h+AvdFUZ7Q==
=ORnd
-----END PGP SIGNATURE-----

--------------VuIFDv8p1TkY2q3cjiogkx0X--

