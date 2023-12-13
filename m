Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753D8109D3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 07:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653717.1020178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDINE-0002U8-Ds; Wed, 13 Dec 2023 06:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653717.1020178; Wed, 13 Dec 2023 06:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDINE-0002Rn-Af; Wed, 13 Dec 2023 06:05:36 +0000
Received: by outflank-mailman (input) for mailman id 653717;
 Wed, 13 Dec 2023 06:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7vuN=HY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rDIND-0002Rh-5n
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 06:05:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f8e454a-997d-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 07:05:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E76A71FD3A;
 Wed, 13 Dec 2023 06:05:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5C9C137E8;
 Wed, 13 Dec 2023 06:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8zsmJ6dJeWUxDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Dec 2023 06:05:27 +0000
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
X-Inumbo-ID: 9f8e454a-997d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702447531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=brCf1OPoNpQdyWfoqLp+/WjPEPnkO7UI7wJ5otOemNo=;
	b=U36T/89yVH0DjAal0nhIlBNDkj6z28cniNHNVtKUjUT6mmC/XFZ86gmTU5h7lOstSgBgu9
	H17aL7jd/7Oy/N9zZIPGzHi0ewvTTDma8ihqhYcZ0laMctIU5U4uZtZpypI/Iq+fhn5WBm
	GatiXnPwttnwcmEG8DYCujtf7pq9I1A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702447527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=brCf1OPoNpQdyWfoqLp+/WjPEPnkO7UI7wJ5otOemNo=;
	b=RkhEf6osqIrK+XMXXF6mSKF4Q6v4ugH6Y+L6SjH66aqDY2V1FbxQDad28BJakf+ze6b72D
	TTkBQ9M6sBeM70XdQNZB0FNr8owKStCYP0do0b5UPvNENY43+0V/0rtGoS627V6OPd1mFy
	K38k6v5FgojoFZm1UWS/mkNUci+4rQI=
Message-ID: <3895f5bb-354c-4ada-a14d-83537dd5d119@suse.com>
Date: Wed, 13 Dec 2023 07:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
 <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>
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
In-Reply-To: <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mgRz7VM0cn4yn0PFQ15v0TSC"
X-Spam-Level: ***************
X-Spam-Flag: YES
X-Spam-Score: 15.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1
X-Rspamd-Queue-Id: E76A71FD3A
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=RkhEf6os;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [-8.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 SIGNED_PGP(-2.00)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:email,suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -8.70

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mgRz7VM0cn4yn0PFQ15v0TSC
Content-Type: multipart/mixed; boundary="------------lMU02RK5OQuKa03n1bOWkQjh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Message-ID: <3895f5bb-354c-4ada-a14d-83537dd5d119@suse.com>
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
 <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>
In-Reply-To: <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>

--------------lMU02RK5OQuKa03n1bOWkQjh
Content-Type: multipart/mixed; boundary="------------lJdRCorVmJ8MUbKIr9aku6fi"

--------------lJdRCorVmJ8MUbKIr9aku6fi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjMgMTk6NDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMi8xMi8yMDIzIDA5OjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gU3RydWN0IGxv
Y2tfcHJvZmlsZSBjb250YWlucyBhIHBvaW50ZXIgdG8gdGhlIHNwaW5sb2NrIGl0IGlzIGFz
c29jaWF0ZWQNCj4+IHdpdGguIFByZXBhcmUgc3VwcG9ydCBvZiBkaWZmZXJpbmcgc3Bpbmxv
Y2tfdCBhbmQgcnNwaW5sb2NrX3QgdHlwZXMgYnkNCj4+IGFkZGluZyBhIHR5cGUgaW5kaWNh
dG9yIG9mIHRoZSBwb2ludGVyLiBVc2UgdGhlIGhpZ2hlc3QgYml0IG9mIHRoZQ0KPj4gYmxv
Y2tfY250IG1lbWJlciBmb3IgdGhpcyBpbmRpY2F0b3IgaW4gb3JkZXIgdG8gbm90IGdyb3cg
dGhlIHN0cnVjdA0KPj4gd2hpbGUgaHVydGluZyBvbmx5IHRoZSBzbG93IHBhdGggd2l0aCBz
bGlnaHRseSBsZXNzIHBlcmZvcm1hbnQgY29kZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiBBY2tlZC1ieTogQWxlamFuZHJv
IFZhbGxlam8gPGFsZWphbmRyby52YWxsZWpvQGNsb3VkLmNvbT4NCj4+IC0tLQ0KPj4gVjI6
DQo+PiAtIG5ldyBwYXRjaA0KPj4gLS0tDQo+PiDCoCB4ZW4vY29tbW9uL3NwaW5sb2NrLmPC
oMKgwqDCoMKgIHwgMjYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4+IMKgIHhlbi9p
bmNsdWRlL3hlbi9zcGlubG9jay5oIHwgMTAgKysrKysrKystLQ0KPj4gwqAgMiBmaWxlcyBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3NwaW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMN
Cj4+IGluZGV4IGMxYTliYTEzMDQuLjdkNjExZDNkN2QgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
Y29tbW9uL3NwaW5sb2NrLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc3BpbmxvY2suYw0KPj4g
QEAgLTUzOCwxOSArNTM4LDMxIEBAIHN0YXRpYyB2b2lkIA0KPj4gc3BpbmxvY2tfcHJvZmls
ZV9pdGVyYXRlKGxvY2tfcHJvZmlsZV9zdWJmdW5jICpzdWIsIHZvaWQgKnBhcikNCj4+IMKg
IHN0YXRpYyB2b2lkIGNmX2NoZWNrIHNwaW5sb2NrX3Byb2ZpbGVfcHJpbnRfZWxlbShzdHJ1
Y3QgbG9ja19wcm9maWxlICpkYXRhLA0KPj4gwqDCoMKgwqDCoCBpbnQzMl90IHR5cGUsIGlu
dDMyX3QgaWR4LCB2b2lkICpwYXIpDQo+PiDCoCB7DQo+PiAtwqDCoMKgIHN0cnVjdCBzcGlu
bG9jayAqbG9jayA9IGRhdGEtPmxvY2s7DQo+PiArwqDCoMKgIHVuc2lnbmVkIGludCBjcHU7
DQo+PiArwqDCoMKgIHVpbnQzMl90IGxvY2t2YWw7DQo+PiArDQo+PiArwqDCoMKgIGlmICgg
ZGF0YS0+aXNfcmxvY2sgKQ0KPj4gK8KgwqDCoCB7DQo+PiArwqDCoMKgwqDCoMKgwqAgY3B1
ID0gZGF0YS0+cmxvY2stPmRlYnVnLmNwdTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBsb2NrdmFs
ID0gZGF0YS0+cmxvY2stPnRpY2tldHMuaGVhZF90YWlsOw0KPj4gK8KgwqDCoCB9DQo+PiAr
wqDCoMKgIGVsc2UNCj4+ICvCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGNwdSA9IGRh
dGEtPmxvY2stPmRlYnVnLmNwdTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBsb2NrdmFsID0gZGF0
YS0+bG9jay0+dGlja2V0cy5oZWFkX3RhaWw7DQo+PiArwqDCoMKgIH0NCj4+IMKgwqDCoMKg
wqAgcHJpbnRrKCIlcyAiLCBsb2NrX3Byb2ZpbGVfYW5jc1t0eXBlXS5uYW1lKTsNCj4+IMKg
wqDCoMKgwqAgaWYgKCB0eXBlICE9IExPQ0tQUk9GX1RZUEVfR0xPQkFMICkNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBwcmludGsoIiVkICIsIGlkeCk7DQo+PiAtwqDCoMKgIHByaW50aygi
JXM6IGFkZHI9JXAsIGxvY2t2YWw9JTA4eCwgIiwgZGF0YS0+bmFtZSwgbG9jaywNCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NrLT50aWNrZXRzLmhlYWRfdGFpbCk7DQo+PiAtwqDC
oMKgIGlmICggbG9jay0+ZGVidWcuY3B1ID09IFNQSU5MT0NLX05PX0NQVSApDQo+PiArwqDC
oMKgIHByaW50aygiJXM6IGFkZHI9JXAsIGxvY2t2YWw9JTA4eCwgIiwgZGF0YS0+bmFtZSwg
ZGF0YS0+bG9jaywgbG9ja3ZhbCk7DQo+PiArwqDCoMKgIGlmICggY3B1ID09IFNQSU5MT0NL
X05PX0NQVSApDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRrKCJub3QgbG9ja2VkXG4i
KTsNCj4+IMKgwqDCoMKgwqAgZWxzZQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHByaW50aygiY3B1
PSVkXG4iLCBsb2NrLT5kZWJ1Zy5jcHUpOw0KPj4gLcKgwqDCoCBwcmludGsoIsKgIGxvY2s6
JSIgUFJJZDY0ICIoJSIgUFJJX3N0aW1lICIpLCBibG9jazolIiBQUklkNjQgIiglIiANCj4+
IFBSSV9zdGltZSAiKVxuIiwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBkYXRhLT5sb2Nr
X2NudCwgZGF0YS0+dGltZV9ob2xkLCBkYXRhLT5ibG9ja19jbnQsIGRhdGEtPnRpbWVfYmxv
Y2spOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHByaW50aygiY3B1PSV1XG4iLCBjcHUpOw0KPj4g
K8KgwqDCoCBwcmludGsoIsKgIGxvY2s6JSIgUFJJdTY0ICIoJSIgUFJJX3N0aW1lICIpLCBi
bG9jazolIiBQUkl1NjQgIiglIiANCj4+IFBSSV9zdGltZSAiKVxuIiwNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkYXRhLT5sb2NrX2NudCwgZGF0YS0+dGltZV9ob2xkLCAodWludDY0
X3QpZGF0YS0+YmxvY2tfY250LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEtPnRp
bWVfYmxvY2spOw0KPj4gwqAgfQ0KPj4gwqAgdm9pZCBjZl9jaGVjayBzcGlubG9ja19wcm9m
aWxlX3ByaW50YWxsKHVuc2lnbmVkIGNoYXIga2V5KQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9zcGlubG9jay5oIGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmgNCj4+
IGluZGV4IDA1Yjk3YzFlMDMuLmFjM2JlZjI2N2EgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc3BpbmxvY2suaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2Nr
LmgNCj4+IEBAIC03NiwxMyArNzYsMTkgQEAgdW5pb24gbG9ja19kZWJ1ZyB7IH07DQo+PiDC
oCAqLw0KPj4gwqAgc3RydWN0IHNwaW5sb2NrOw0KPj4gKy8qIFRlbXBvcmFyeSBoYWNrIHVu
dGlsIGEgZGVkaWNhdGVkIHN0cnVjdCByc3BpbmxvY2sgaXMgZXhpc3RpbmcuICovDQo+PiAr
I2RlZmluZSByc3BpbmxvY2sgc3BpbmxvY2sNCj4+IMKgIHN0cnVjdCBsb2NrX3Byb2ZpbGUg
ew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbG9ja19wcm9maWxlICpuZXh0O8KgwqDCoMKgwqDC
oCAvKiBmb3J3YXJkIGxpbmsgKi8NCj4+IMKgwqDCoMKgwqAgY29uc3QgY2hhcsKgwqDCoMKg
wqDCoMKgwqDCoCAqbmFtZTvCoMKgwqDCoMKgwqAgLyogbG9jayBuYW1lICovDQo+PiAtwqDC
oMKgIHN0cnVjdCBzcGlubG9ja8KgwqDCoMKgICpsb2NrO8KgwqDCoMKgwqDCoCAvKiB0aGUg
bG9jayBpdHNlbGYgKi8NCj4+ICvCoMKgwqAgdW5pb24gew0KPj4gK8KgwqDCoMKgwqDCoMKg
IHN0cnVjdCBzcGlubG9jayAqbG9jazvCoMKgwqDCoMKgwqAgLyogdGhlIGxvY2sgaXRzZWxm
ICovDQo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHJzcGlubG9jayAqcmxvY2s7wqDCoMKg
wqAgLyogdGhlIHJlY3Vyc2l2ZSBsb2NrIGl0c2VsZiAqLw0KPj4gK8KgwqDCoCB9Ow0KPj4g
wqDCoMKgwqDCoCB1aW50NjRfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9ja19jbnQ7wqDC
oMKgIC8qICMgb2YgY29tcGxldGUgbG9ja2luZyBvcHMgKi8NCj4+IC3CoMKgwqAgdWludDY0
X3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsb2NrX2NudDvCoMKgIC8qICMgb2YgY29tcGxl
dGUgd2FpdCBmb3IgbG9jayAqLw0KPj4gK8KgwqDCoCB1aW50NjRfdMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYmxvY2tfY250OjYzOyAvKiAjIG9mIGNvbXBsZXRlIHdhaXQgZm9yIGxvY2sg
Ki8NCj4+ICvCoMKgwqAgdWludDY0X3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlzX3Jsb2Nr
OjE7wqAgLyogdXNlIHJsb2NrIHBvaW50ZXIgKi8NCj4gDQo+IFRoaXMgaXMgbWVhbnQgdG8g
YWN0IGxpa2UgYSBib29sLiBTbyBJIHdvdWxkIHByZWZlciBpZiB3ZSB1c2U6DQo+IA0KPiBi
b29sIGlzX3J3bG9jazoxOw0KPiANCj4gQW5kIHRoZW4gdXNlIHRydWUvZmFsc2Ugd2hlbiBz
ZXQuDQoNCkRvIHdlIHdhbnQgdG8gZG8gdGhhdD8gQUZBSUsgaXQgd291bGQgZGVwZW5kIG9u
IHRoZSBjb21waWxlciB3aGF0IHRoZSBzaXplIG9mDQp0aGUgc3RydWN0IGlzIHdoZW4gbWl4
aW5nIHR5cGVzIGluIGJpdGZpZWxkcyAoaW4gdGhpcyBjYXNlOiBib29sIGFuZCB1aW50NjRf
dCkuDQoNCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQoN
ClRoYW5rcywNCg0KDQpKdWVyZ2VuDQoNCg==
--------------lJdRCorVmJ8MUbKIr9aku6fi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lJdRCorVmJ8MUbKIr9aku6fi--

--------------lMU02RK5OQuKa03n1bOWkQjh--

--------------mgRz7VM0cn4yn0PFQ15v0TSC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV5SacFAwAAAAAACgkQsN6d1ii/Ey87
YAf+MtnjJpCZG5n+0WLoWkcsel70y9nBuGlTps4ik7IUJOeUbJySMdz4SOyM3fyB7rZs7gWji4SE
OYDG1mv9HTaFniuP5U1J5vlv6BUWorQxbtgIrAJfsh6ccIoCdWN6KsFXGoYgMJFoLECKNqe+4mji
hhwt6Ej4dbb7E8hF37fB4l9DctdSlJe5bydzv71YcBmgu+W0IAxLgGQPrdSaWhngEkXoqV6dQDA2
wZ58tOcVvvnJHJ6poL3TjmqNt3ni59RLaeRMQVAeYqf6M7qOkXKhtDL/oylPvNS9fobGypGPOSIP
KCuEybNT6zrk5rnLb+ZsC5bn084uvA3AYjxl4kI7AQ==
=Tpnt
-----END PGP SIGNATURE-----

--------------mgRz7VM0cn4yn0PFQ15v0TSC--

