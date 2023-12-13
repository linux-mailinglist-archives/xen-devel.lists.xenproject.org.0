Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0B810DC2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653816.1020435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLyE-00063k-W1; Wed, 13 Dec 2023 09:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653816.1020435; Wed, 13 Dec 2023 09:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLyE-00060Q-SH; Wed, 13 Dec 2023 09:56:02 +0000
Received: by outflank-mailman (input) for mailman id 653816;
 Wed, 13 Dec 2023 09:56:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7vuN=HY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rDLyD-00060K-TH
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:56:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b4ef78-999d-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 10:56:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B8FD1FD48;
 Wed, 13 Dec 2023 09:55:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 506211377F;
 Wed, 13 Dec 2023 09:55:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id beJFEq9/eWVXSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Dec 2023 09:55:59 +0000
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
X-Inumbo-ID: d1b4ef78-999d-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702461359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PK8B0Yq6iSbWfqdA8MDjltwnM2s8awqFwFOA9f3oXOg=;
	b=qOVeA+c0c0WzKUPCzwztcX+D9TigCAcAB6x9YZYxz84KxdNQ6NSpROknQV6DurOLmUKnPo
	MXjm1teLrBks+kkwuySk1HAdaTvHYPUJCIEo+C/bQLOnyKH20m84qlUZd8NtSrN7bGKhIw
	nIgHLzirCMzyn64GdIrRxHy+dzcOsaI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702461359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PK8B0Yq6iSbWfqdA8MDjltwnM2s8awqFwFOA9f3oXOg=;
	b=qOVeA+c0c0WzKUPCzwztcX+D9TigCAcAB6x9YZYxz84KxdNQ6NSpROknQV6DurOLmUKnPo
	MXjm1teLrBks+kkwuySk1HAdaTvHYPUJCIEo+C/bQLOnyKH20m84qlUZd8NtSrN7bGKhIw
	nIgHLzirCMzyn64GdIrRxHy+dzcOsaI=
Message-ID: <6156d11d-3421-42c1-9368-b9de5708030f@suse.com>
Date: Wed, 13 Dec 2023 10:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
 <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
 <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
 <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
 <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>
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
In-Reply-To: <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h1vxpmkGDfqc8Qov4uXBBTFM"
X-Spam-Level: *****************
X-Spam-Score: 17.75
X-Spam-Flag: YES
X-Spam-Level: 
X-Rspamd-Server: rspamd1
X-Spamd-Result: default: False [-0.60 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 SIGNED_PGP(-2.00)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: 8B8FD1FD48
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qOVeA+c0;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Bar: /
X-Spam-Score: -0.60

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h1vxpmkGDfqc8Qov4uXBBTFM
Content-Type: multipart/mixed; boundary="------------RJq6IgyTtUoKg2BQa9qdvO10";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <6156d11d-3421-42c1-9368-b9de5708030f@suse.com>
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
 <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
 <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
 <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
 <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>
In-Reply-To: <0f922ab8-ecad-40f5-a63c-c3be9006a5be@xen.org>

--------------RJq6IgyTtUoKg2BQa9qdvO10
Content-Type: multipart/mixed; boundary="------------ZQxX2KpuQ0b49jCvi8qXqZ2g"

--------------ZQxX2KpuQ0b49jCvi8qXqZ2g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTIuMjMgMTA6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAx
My8xMi8yMDIzIDA5OjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTMuMTIuMjMg
MDk6NDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+Pj4g
T24gMTMvMTIvMjAyMyAwNjoyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMTIu
MTIuMjMgMjA6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpIEp1ZXJnZW4sDQo+
Pj4+Pg0KPj4+Pj4gT24gMTIvMTIvMjAyMyAwOTo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+Pj4+PiBBZGQgYW5vdGhlciBmdW5jdGlvbiBsZXZlbCBpbiBzcGlubG9jay5jIGhpZGlu
ZyB0aGUgc3BpbmxvY2tfdCBsYXlvdXQNCj4+Pj4+PiBmcm9tIHRoZSBsb3cgbGV2ZWwgbG9j
a2luZyBjb2RlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyBpcyBkb25lIGluIHByZXBhcmF0aW9u
IG9mIGludHJvZHVjaW5nIHJzcGlubG9ja190IGZvciByZWN1cnNpdmUNCj4+Pj4+PiBsb2Nr
cyB3aXRob3V0IGhhdmluZyB0byBkdXBsaWNhdGUgYWxsIG9mIHRoZSBsb2NraW5nIGNvZGUu
DQo+Pj4+Pg0KPj4+Pj4gU28gYWxsIHRoZSBmaWVsZHMgeW91IHBhc3MgYXJlIHRoZSBvbmUg
ZnJvbSBzcGlubG9jay4NCj4+Pj4+DQo+Pj4+PiBMb29raW5nIGF0IHBhaG9sZSBhZnRlciB0
aGlzIHNlcmllcyBpcyBhcHBsaWQsIHdlIGhhdmU6DQo+Pj4+Pg0KPj4+Pj4gPT09PSBEZWJ1
ZyArIExvY2sgcHJvZmlsZSA9PT09DQo+Pj4+Pg0KPj4+Pj4gc3RydWN0IHNwaW5sb2NrIHsN
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgc3BpbmxvY2tfdGlja2V0c190wqDCoMKgwqDCoMKg
wqDCoCB0aWNrZXRzO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgMCA0
ICovDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHVuaW9uIGxvY2tfZGVidWfCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZWJ1ZzvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKg
wqDCoCA0IDQgKi8NCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGxvY2tfcHJvZmls
ZSAqwqDCoMKgwqDCoCBwcm9maWxlO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDC
oMKgwqAgOCA4ICovDQo+Pj4+Pg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBzaXplOiAx
NiwgY2FjaGVsaW5lczogMSwgbWVtYmVyczogMyAqLw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oCAvKiBsYXN0IGNhY2hlbGluZTogMTYgYnl0ZXMgKi8NCj4+Pj4+IH07DQo+Pj4+PiBzdHJ1
Y3QgcnNwaW5sb2NrIHsNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgc3BpbmxvY2tfdGlja2V0
c190wqDCoMKgwqDCoMKgwqDCoCB0aWNrZXRzO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8qwqDCoMKgwqAgMCA0ICovDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY3Vyc2VfY3B1O8KgwqDCoMKg
wqDCoMKgwqDCoCAvKsKgwqDCoMKgIDQgMiAqLw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1
aW50OF90wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjdXJzZV9j
bnQ7wqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNiAxICovDQo+Pj4+Pg0KPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoCAvKiBYWFggMSBieXRlIGhvbGUsIHRyeSB0byBwYWNrICovDQo+
Pj4+Pg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1bmlvbiBsb2NrX2RlYnVnwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGVidWc7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDC
oMKgwqAgOCA0ICovDQo+Pj4+Pg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBYWFggNCBi
eXRlcyBob2xlLCB0cnkgdG8gcGFjayAqLw0KPj4+Pj4NCj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGxvY2tfcHJvZmlsZSAqwqDCoMKgwqDCoCBwcm9maWxlO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgIDE2IDggKi8NCj4+Pj4+DQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgIC8qIHNpemU6IDI0LCBjYWNoZWxpbmVzOiAxLCBtZW1iZXJzOiA1ICovDQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIHN1bSBtZW1iZXJzOiAxOSwgaG9sZXM6IDIsIHN1
bSBob2xlczogNSAqLw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBsYXN0IGNhY2hlbGlu
ZTogMjQgYnl0ZXMgKi8NCj4+Pj4+IH07DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+ID09PT0gRGVi
dWcgPT09PQ0KPj4+Pj4NCj4+Pj4+IHN0cnVjdCBzcGlubG9jayB7DQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgIHNwaW5sb2NrX3RpY2tldHNfdMKgwqDCoMKgwqDCoMKgwqAgdGlja2V0czvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDAgNCAqLw0KPj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCB1bmlvbiBsb2NrX2RlYnVnwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVi
dWc7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNCA0ICovDQo+
Pj4+Pg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBzaXplOiA4LCBjYWNoZWxpbmVzOiAx
LCBtZW1iZXJzOiAyICovDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIGxhc3QgY2FjaGVs
aW5lOiA4IGJ5dGVzICovDQo+Pj4+PiB9Ow0KPj4+Pj4gc3RydWN0IHJzcGlubG9jayB7DQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHNwaW5sb2NrX3RpY2tldHNfdMKgwqDCoMKgwqDCoMKg
wqAgdGlja2V0czvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDAgNCAq
Lw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWN1cnNlX2NwdTvCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKg
wqDCoCA0IDIgKi8NCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDhfdMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY3Vyc2VfY250O8KgwqDCoMKgwqDCoMKg
wqDCoCAvKsKgwqDCoMKgIDYgMSAqLw0KPj4+Pj4NCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAg
LyogWFhYIDEgYnl0ZSBob2xlLCB0cnkgdG8gcGFjayAqLw0KPj4+Pj4NCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqAgdW5pb24gbG9ja19kZWJ1Z8KgwqDCoMKgwqDCoMKgwqDCoMKgIGRlYnVn
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDggNCAqLw0KPj4+
Pj4NCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgLyogc2l6ZTogMTIsIGNhY2hlbGluZXM6IDEs
IG1lbWJlcnM6IDQgKi8NCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgLyogc3VtIG1lbWJlcnM6
IDExLCBob2xlczogMSwgc3VtIGhvbGVzOiAxICovDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
IC8qIGxhc3QgY2FjaGVsaW5lOiAxMiBieXRlcyAqLw0KPj4+Pj4gfTsNCj4+Pj4+DQo+Pj4+
PiA9PT09IFByb2QgPT09PQ0KPj4+Pj4NCj4+Pj4+IHN0cnVjdCBzcGlubG9jayB7DQo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHNwaW5sb2NrX3RpY2tldHNfdMKgwqDCoMKgwqDCoMKgwqAg
dGlja2V0czvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDAgNCAqLw0K
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1bmlvbiBsb2NrX2RlYnVnwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGVidWc7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAg
NCAwICovDQo+Pj4+Pg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBzaXplOiA0LCBjYWNo
ZWxpbmVzOiAxLCBtZW1iZXJzOiAyICovDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIGxh
c3QgY2FjaGVsaW5lOiA0IGJ5dGVzICovDQo+Pj4+PiB9Ow0KPj4+Pj4gc3RydWN0IHJzcGlu
bG9jayB7DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHNwaW5sb2NrX3RpY2tldHNfdMKgwqDC
oMKgwqDCoMKgwqAgdGlja2V0czvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDC
oMKgIDAgNCAqLw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWN1cnNlX2NwdTvCoMKgwqDCoMKgwqDCoMKg
wqAgLyrCoMKgwqDCoCA0IDIgKi8NCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDhfdMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY3Vyc2VfY250O8KgwqDC
oMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDYgMSAqLw0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oCB1bmlvbiBsb2NrX2RlYnVnwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVidWc7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNyAwICovDQo+Pj4+Pg0KPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoCAvKiBzaXplOiA4LCBjYWNoZWxpbmVzOiAxLCBtZW1iZXJzOiA0
ICovDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIHBhZGRpbmc6IDEgKi8NCj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqAgLyogbGFzdCBjYWNoZWxpbmU6IDggYnl0ZXMgKi8NCj4+Pj4+IH07
DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IEkgdGhpbmsgd2UgY291bGQgZW1iZWQgc3BpbmxvY2tf
dCBpbiByc3BpbmxvY2tfdCB3aXRob3V0IGluY3JlYXNpbmcgDQo+Pj4+PiByc3BpbmxvY2tf
dC4gSGF2ZSB5b3UgY29uc2lkZXJlZCBpdD8gVGhpcyBjb3VsZCByZWR1Y2UgdGhlIG51bWJl
ciBvZiANCj4+Pj4+IGZ1bmN0aW9uIGxldmVsIGludHJvZHVjZWQgaW4gdGhpcyBzZXJpZXMu
DQo+Pj4+DQo+Pj4+IFRoYXQgd2FzIHRoZSBsYXlvdXQgaW4gdGhlIGZpcnN0IHZlcnNpb24g
b2YgdGhpcyBzZXJpZXMuIEphbiByZXF1ZXN0ZWQgdG8gDQo+Pj4+IGNoYW5nZQ0KPj4+PiBp
dCB0byB0aGUgY3VycmVudCBsYXlvdXQgWzFdLg0KPj4+DQo+Pj4gQWguLi4gTG9va2luZyB0
aHJvdWdoIHRoZSByZWFzb25pbmcsIEkgaGF2ZSB0byBkaXNhZ3JlZSB3aXRoIEphbiBhcmd1
bWVudGF0aW9ucy4NCj4+DQo+PiBJIHdvdWxkIF9yZWFsbHlfIGhhdmUgbGlrZWQgeW91IHRv
IG1lbnRpb24gdGhpcyBkaXNhZ3JlZW1lbnQgYmFjayB0aGVuICh5b3UndmUNCj4+IGJlZW4g
b24gQ2M6IGluIHRoZSB0aHJlYWQsIHRvbykuDQo+IA0KPiBTb3JyeSBmb3IgdGhhdC4gTXkg
ZS1tYWlscyBiYWNrbG9nIGlzIHF1aXRlIGxhcmdlIGFuZCBJIGNhbid0IGtlZXAgdXAgd2l0
aCBhbGwgDQo+IHRoZSBzZXJpZXMuDQo+IA0KPj4gTGV0dGluZyBtZSBkbyBhIG1ham9yIHJl
d29yayBhbmQgdGhlbiBhZnRlciAyIG1vcmUgaXRlcmF0aW9ucyBvZiB0aGUgc2VyaWVzDQo+
PiByZXF1ZXN0aW5nIHRvIHVuZG8gbW9zdCBvZiB0aGUgd29yayBpc24ndCBncmVhdC4NCj4g
DQo+IEluZGVlZC4gQnV0IEkgbm90ZSB5b3UgY29udGludWVkIHdpdGhvdXQgYW55IGFkZGl0
aW9uYWwgZmVlZGJhY2sgWzFdLiBJZiB5b3UgDQo+IHdlcmUgbm90IHN1cmUgYWJvdXQgdGhl
IGFwcHJvYWNoIHN1Z2dlc3RlZCBieSBKYW4sIHRoZW4gd2h5IGRpZCB5b3UgcG9zdCB0d28g
bmV3IA0KPiB2ZXJzaW9ucz8gU2hvdWxkbid0IHlvdSBoYXZlIHBpbmdlZCB0aGUgbWFpbnRh
aW5lcnMgdG8gbWFrZSBzdXJlIHRoZXJlIGlzIGEgDQo+IGNvbnNlbnN1cz8NCg0KaHR0cHM6
Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjMtMTAvbXNnMDEy
MjEuaHRtbA0KDQo+IA0KPj4NCj4+PiBBdCBsZWFzdCB3aXRoIHRoZSBmdWxsIHNlcmllcyBh
cHBsaWVkLCB0aGVyZSBpcyBubyBpbmNyZWFzZSBvZiByc3BpbmxvY2tfdCBpbiANCj4+PiBk
ZWJ1ZyBidWlsZCAoaWYgd2UgY29tcGFyZSB0byB0aGUgdmVyc2lvbiB5b3UgcHJvdmlkZWQg
aW4gdGhpcyBzZXJpZXMpLg0KPj4NCj4+IFRoYXQgd2Fzbid0IGhpcyBzb2xlIHJlYXNvbmlu
ZywgcmlnaHQ/DQo+IA0KPiBJIGd1ZXNzIHlvdSBtZWFuIHRoZSBub24tb3B0aW9uYWwgZmll
bGRzIHNob3VsZCBhbHdheXMgYmUgYXQgdGhlIHNhbWUgcG9zaXRpb24/DQoNClllcy4NCg0K
PiANCj4+DQo+Pj4gRnVydGhlcm1vcmUsIHRoaXMgaXMgZ29pbmcgdG8gcmVtb3ZlIGF0IGxl
YXN0IHBhdGNoICM2IGFuZCAjOC4gV2Ugd291bGQgc3RpbGwgDQo+Pj4gbmVlZCBucnNwaW5s
b2NrXyogYmVjYXVzZSB0aGV5IGNhbiBqdXN0IGJlIHdyYXBwZXIgdG8NCj4+PiBzcGluX2Jh
cnJpZXIoJmxvY2stPmxvY2spLg0KPj4+DQo+Pj4gVGhpcyBzaG91bGQgYWxzbyBzb2x2ZSBo
aXMgY29uY2VybiBvZiB1bndpZWxkeSBjb2RlOg0KPj4+DQo+Pj4gwqA+ICvCoMKgwqAgc3Bp
bl9iYXJyaWVyKCZwMm0tPnBvZC5sb2NrLmxvY2subG9jayk7DQo+Pg0KPj4gWWVzLCBidXQg
dGhlIGRlbWFuZCB0byBoYXZlIG9wdGlvbmFsIGZpZWxkcyBhdCB0aGUgZW5kIG9mIHRoZSBz
dHJ1Y3QgaXNuJ3QNCj4+IGNvdmVyZWQgYnkgeW91ciByZXF1ZXN0Lg0KPiANCj4gSSBub3Rl
IHRoaXMgd2FzIGEgcHJlZmVyZW5jZSBhbmQgd2VpZ2h0IGFnYWluc3QgY29kZSBkdXBsaWNh
dGlvbi4gSXQgaXMgbm90IA0KPiBjbGVhciB0byBtZSB3aGV0aGVyIEphbiBhZ3JlZXMgd2l0
aCB0aGlzIGV4dHJhIHdvcmsgbm93Lg0KPiANCj4gQW55d2F5LCBJIGFtIG5vdCBhZ2FpbnN0
IHRoaXMgYXBwcm9hY2ggYW5kIGlmIHRoaXMgaXMgd2hhdCBKYW4gbXVjaCBwcmVmZXJzIHRo
ZW4gDQo+IHNvIGJlIGl0LiBCdXQgSSB0aG91Z2h0IEkgd291bGQgcG9pbnQgb3V0IHRoZSBh
ZGRpdGlvbmFsIGNvbXBsZXhpdHkgd2hpY2ggDQo+IGRvZXNuJ3Qgc2VlbSB0byBiZSB3b3J0
aCBpdC4NCg0KVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4NCg0KSmFuPw0KDQoNCkp1
ZXJnZW4NCg==
--------------ZQxX2KpuQ0b49jCvi8qXqZ2g
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ZQxX2KpuQ0b49jCvi8qXqZ2g--

--------------RJq6IgyTtUoKg2BQa9qdvO10--

--------------h1vxpmkGDfqc8Qov4uXBBTFM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV5f64FAwAAAAAACgkQsN6d1ii/Ey+5
ZQf7Bl7bibiUsh8Z0AQFr88kRCyMq1p6DHqZD89fiMfdxSaotHs2XYGIVsq+c5U8CMAv4fdIbrtj
1BGZERxwfY+67gCbfx+RnHLN2Yiotc/QnbTjQatsVeAqqc/O+emhsyFv6UjNonBKV/QBcqNKNq5l
U87r/l7vXwWmCEZBG1gFUDJcdETchAmiZFr2OxWEDwFt5jECDzJDtpVKBc7KjotE3r3J84L7k8Et
bkNptPf/aR6YiH0U6sePZTkqXhQMHBkNlDqeYPxtEzgdOfyaPMghQeHp0rLFYuZ0LWJvPVyDxO56
ptpU3lnDyGHquGbodnh1uq4Zf18uD1YQeVPO9qvfaQ==
=6mze
-----END PGP SIGNATURE-----

--------------h1vxpmkGDfqc8Qov4uXBBTFM--

