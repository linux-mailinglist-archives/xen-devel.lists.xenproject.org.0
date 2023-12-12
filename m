Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9880ECC3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653107.1019354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2Qn-0001Oi-Tr; Tue, 12 Dec 2023 13:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653107.1019354; Tue, 12 Dec 2023 13:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2Qn-0001Mp-Q8; Tue, 12 Dec 2023 13:04:13 +0000
Received: by outflank-mailman (input) for mailman id 653107;
 Tue, 12 Dec 2023 13:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rD2Qm-0001MI-HG
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 13:04:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1449675-98ee-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 14:04:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D89122378;
 Tue, 12 Dec 2023 13:04:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BD68136C7;
 Tue, 12 Dec 2023 13:04:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id A+deCUpaeGXUWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 13:04:10 +0000
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
X-Inumbo-ID: f1449675-98ee-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702386250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5dg0uUNTN3hTgFfLtnfcqrrX2j4sAKgWoqJBEuyER+o=;
	b=a22p8/eArVp6yH9CXN0npkeQIvr5kpR/A7yELyVKnPwHPzSybq/bkYZAKi1FJd1ZyEbSR0
	dpUDgWo51CsgLuXRt2ogQ4iyLsLHSYNpzXEiGS4hPiOyYx03nihflB/Thgih7Auv8xymiE
	fmKDQGvyqJwUC72/7W6gyqWV0XQCow8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702386250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5dg0uUNTN3hTgFfLtnfcqrrX2j4sAKgWoqJBEuyER+o=;
	b=a22p8/eArVp6yH9CXN0npkeQIvr5kpR/A7yELyVKnPwHPzSybq/bkYZAKi1FJd1ZyEbSR0
	dpUDgWo51CsgLuXRt2ogQ4iyLsLHSYNpzXEiGS4hPiOyYx03nihflB/Thgih7Auv8xymiE
	fmKDQGvyqJwUC72/7W6gyqWV0XQCow8=
Message-ID: <492c7b3e-ee29-4fe6-b13e-f9928721a78b@suse.com>
Date: Tue, 12 Dec 2023 14:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-4-jgross@suse.com>
 <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>
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
In-Reply-To: <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OiFOPv9pVihFfHrmO9yinN0o"
X-Spam-Level: ***************
X-Spam-Score: 15.00
X-Spam-Flag: YES
X-Spam-Level: 
X-Rspamd-Server: rspamd1
X-Rspamd-Queue-Id: 6D89122378
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="a22p8/eA";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [-5.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 SIGNED_PGP(-2.00)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.00)[24.42%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -5.70

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OiFOPv9pVihFfHrmO9yinN0o
Content-Type: multipart/mixed; boundary="------------q0nkwE4xMcfyuzVHf9obbpDp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Message-ID: <492c7b3e-ee29-4fe6-b13e-f9928721a78b@suse.com>
Subject: Re: [PATCH v4 03/12] xen/spinlock: introduce new type for recursive
 spinlocks
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-4-jgross@suse.com>
 <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>
In-Reply-To: <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>

--------------q0nkwE4xMcfyuzVHf9obbpDp
Content-Type: multipart/mixed; boundary="------------0GgpLClFWkF0xOCZg2sQmuIW"

--------------0GgpLClFWkF0xOCZg2sQmuIW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjMgMTM6NTcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEyLzEyLzIwMjMgMDk6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmggYi94ZW4vaW5jbHVkZS94
ZW4vc3BpbmxvY2suaA0KPj4gaW5kZXggMWNkOTEyMGVhYy4uMjBkMTVmMzRkZCAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oDQo+PiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vc3BpbmxvY2suaA0KPj4gQEAgLTQ1LDcgKzQ1LDcgQEAgdW5pb24gbG9ja19k
ZWJ1ZyB7IH07DQo+PiDCoMKgwqDCoMKgIGxvY2sgcHJvZmlsaW5nIG9uOg0KPj4gwqDCoMKg
wqDCoCBHbG9iYWwgbG9ja3Mgd2hpY2ggc2hvdWxkIGJlIHN1YmplY3QgdG8gcHJvZmlsaW5n
IG11c3QgYmUgZGVjbGFyZWQgdmlhDQo+PiAtwqDCoMKgIERFRklORV9TUElOTE9DSy4NCj4+
ICvCoMKgwqAgREVGSU5FX1tSXVNQSU5MT0NLLg0KPj4gwqDCoMKgwqDCoCBGb3IgbG9ja3Mg
aW4gc3RydWN0dXJlcyBmdXJ0aGVyIG1lYXN1cmVzIGFyZSBuZWNlc3Nhcnk6DQo+PiDCoMKg
wqDCoMKgIC0gdGhlIHN0cnVjdHVyZSBkZWZpbml0aW9uIG11c3QgaW5jbHVkZSBhIHByb2Zp
bGVfaGVhZCB3aXRoIGV4YWN0bHkgdGhpcw0KPj4gQEAgLTU2LDcgKzU2LDcgQEAgdW5pb24g
bG9ja19kZWJ1ZyB7IH07DQo+PiDCoMKgwqDCoMKgIC0gdGhlIHNpbmdsZSBsb2NrcyB3aGlj
aCBhcmUgc3ViamVjdCB0byBwcm9maWxpbmcgaGF2ZSB0byBiZSBpbml0aWFsaXplZA0KPj4g
wqDCoMKgwqDCoMKgwqAgdmlhDQo+PiAtwqDCoMKgwqDCoCBzcGluX2xvY2tfaW5pdF9wcm9m
KHB0ciwgbG9jayk7DQo+PiArwqDCoMKgwqDCoCBbcl1zcGluX2xvY2tfaW5pdF9wcm9mKHB0
ciwgbG9jayk7DQo+PiDCoMKgwqDCoMKgwqDCoCB3aXRoIHB0ciBiZWluZyB0aGUgbWFpbiBz
dHJ1Y3R1cmUgcG9pbnRlciBhbmQgbG9jayB0aGUgc3BpbmxvY2sgZmllbGQNCj4+IEBAIC0x
MDksMTIgKzEwOSwxNiBAQCBzdHJ1Y3QgbG9ja19wcm9maWxlX3FoZWFkIHsNCj4+IMKgwqDC
oMKgwqAgc3BpbmxvY2tfdCBsID0gX1NQSU5fTE9DS19VTkxPQ0tFRChOVUxMKTvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwNCj4+IMKgwqDCoMKgwqAgc3RhdGljIHN0cnVjdCBsb2NrX3Byb2ZpbGUgX19sb2Nr
X3Byb2ZpbGVfZGF0YV8jI2wgPSBfTE9DS19QUk9GSUxFKGwpO8KgwqDCoCBcDQo+PiDCoMKg
wqDCoMKgIF9MT0NLX1BST0ZJTEVfUFRSKGwpDQo+PiArI2RlZmluZSBERUZJTkVfUlNQSU5M
T0NLKGwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
DQo+PiArwqDCoMKgIHJzcGlubG9ja190IGwgPSBfU1BJTl9MT0NLX1VOTE9DS0VEKE5VTEwp
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgc3RhdGljIHN0cnVjdCBsb2NrX3Byb2ZpbGUgX19s
b2NrX3Byb2ZpbGVfZGF0YV8jI2wgPSBfTE9DS19QUk9GSUxFKGwpO8KgwqDCoCBcDQo+PiAr
wqDCoMKgIF9MT0NLX1BST0ZJTEVfUFRSKGwpDQo+PiAtI2RlZmluZSBzcGluX2xvY2tfaW5p
dF9wcm9mKHMsIGwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiAr
I2RlZmluZSBfX3NwaW5fbG9ja19pbml0X3Byb2YocywgbCwgbG9ja3R5cGUpwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcDQo+IA0KPiBJZiBJIGFtIG5vdCBtaXN0YWtlbiB0aGUgZG91YmxlLXVuZGVyc2NvcmUg
cHJlZml4IGlzIGEgdmlvbGF0aW9uIGluIE1JU1JBLiBTbyANCj4gY2FuIHRoaXMgYmUgcmVu
YW1lZCB0bzoNCj4gDQo+IHNwaW5fbG9ja19pbml0X3Byb2ZfXygpPw0KDQpGaW5lIHdpdGgg
bWUuDQoNCk5vdGUgdGhhdCBfX2xvY2tfcHJvZmlsZV9kYXRhXyMjbCBhbmQgX19sb2NrX3By
b2ZpbGVfIyNuYW1lIHNlZW0gdG8gdmlvbGF0ZQ0KTUlTUkEsIHRvby4gUHJvYmFibHkgYSBn
b29kIGlkZWEgdG8gY2hhbmdlIHRoZW0gYXMgd2VsbD8gVGhpcyBzaG91bGQgcHJvYmFibHkN
CmJlIGRvbmUgYXMgYSBwcmVyZXEgcGF0Y2ggdGhlbj8NCg0KPiANCj4gVGhlIHJlc3Qgb2Yg
dGhlIGNvZGUgbG9va3MgZmluZS4gSSBoYXZlIGNoZWNrZWQgdGhlIGxvY2sgeW91IGFyZSBt
b2RpZnlpbmcgaW4gDQo+IGNvbW1vbi9kcml2ZXJzIGFuZCB0aGV5IGFsbCBhcmUgbWVhbnQg
dG8gYmUgcmVjdXJzaXZlIGxvY2s6DQo+IA0KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg0K
--------------0GgpLClFWkF0xOCZg2sQmuIW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0GgpLClFWkF0xOCZg2sQmuIW--

--------------q0nkwE4xMcfyuzVHf9obbpDp--

--------------OiFOPv9pVihFfHrmO9yinN0o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV4WkkFAwAAAAAACgkQsN6d1ii/Ey//
6wf+IrVtREU7qvRYS7OhMeoBKC3CmJw0bFaawzMDlboSDf2ZIKoVLWiBtF28io3aqNOk9usA5zU0
+fko4342n3ARZEc3b8jX/t/f2c+WzahMV4AgHzGaG/3K2mSxQyxe+s2jSCvgAOgX3wqRnb3cVjec
NLyx4jCIf8Yf2cgGt6KjPixFa7n4dzfAOEXOk0bFDkeTojkn0gxzNau6YXmGMvpJFOJnXyR9WbpG
o0a1LPv/TpCZN/2F8vBexpfX243rBks3QCScHXlmMtji70Uj5uYRaSm158oY6IPHhsjuYA+iNzVS
xgn7XDpsi25Gb/g8muYs40c2sS/JgBh1sZQR+T14fQ==
=Gdj1
-----END PGP SIGNATURE-----

--------------OiFOPv9pVihFfHrmO9yinN0o--

