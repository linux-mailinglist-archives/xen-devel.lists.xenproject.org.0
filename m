Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569837FBB63
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643162.1003102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7y53-0002Oq-MZ; Tue, 28 Nov 2023 13:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643162.1003102; Tue, 28 Nov 2023 13:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7y53-0002MU-J9; Tue, 28 Nov 2023 13:24:49 +0000
Received: by outflank-mailman (input) for mailman id 643162;
 Tue, 28 Nov 2023 13:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TP6=HJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7y52-0002MO-IR
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:24:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f60ce88-8df1-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 14:24:46 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E23C2199D;
 Tue, 28 Nov 2023 13:24:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D39A91343E;
 Tue, 28 Nov 2023 13:24:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 93xhMhzqZWXKKAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 28 Nov 2023 13:24:44 +0000
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
X-Inumbo-ID: 7f60ce88-8df1-11ee-9b0e-b553b5be7939
Message-ID: <75e85d00-02ad-43c8-930f-cfbf91235652@suse.com>
Date: Tue, 28 Nov 2023 14:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-7-jgross@suse.com>
 <6f712c33-fcfe-42e1-a31d-53e0c7ffea44@cloud.com>
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
In-Reply-To: <6f712c33-fcfe-42e1-a31d-53e0c7ffea44@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TUMc0ew5PfFhICRb7KYBDADD"
X-Spamd-Bar: ++++++++++++++++++
X-Spam-Score: 18.43
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine)
X-Rspamd-Queue-Id: 2E23C2199D
X-Spam-Flag: NO
X-Spam-Level: ******************
X-Spamd-Result: default: False [18.43 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(2.26)[0.754];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_SPAM_LONG(1.16)[0.333];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TUMc0ew5PfFhICRb7KYBDADD
Content-Type: multipart/mixed; boundary="------------eVh1H1TSxLKpE2f6t4ec1xbG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <75e85d00-02ad-43c8-930f-cfbf91235652@suse.com>
Subject: Re: [PATCH v3 06/13] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-7-jgross@suse.com>
 <6f712c33-fcfe-42e1-a31d-53e0c7ffea44@cloud.com>
In-Reply-To: <6f712c33-fcfe-42e1-a31d-53e0c7ffea44@cloud.com>

--------------eVh1H1TSxLKpE2f6t4ec1xbG
Content-Type: multipart/mixed; boundary="------------txhSLXUJpxTuv68XQ780d0o8"

--------------txhSLXUJpxTuv68XQ780d0o8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjMgMjA6MjMsIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPiBPbiAyMC8x
MS8yMDIzIDExOjM4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW5zdGVhZCBvZiBzcGVj
aWFsIGNhc2luZyByc3Bpbl9sb2NrX2lycXNhdmUoKSBhbmQNCj4+IHJzcGluX3VubG9ja19p
cnFyZXN0b3JlKCkgZm9yIHRoZSBjb25zb2xlIGxvY2ssIGFkZCB0aG9zZSBmdW5jdGlvbnMN
Cj4+IHRvIHNwaW5sb2NrIGhhbmRsaW5nIGFuZCB1c2UgdGhlbSB3aGVyZSBuZWVkZWQuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
Pj4gLS0tDQo+PiBWMjoNCj4+IC0gbmV3IHBhdGNoDQo+PiAtLS0NCj4+IMKgIHhlbi9hcmNo
L3g4Ni90cmFwcy5jwqDCoMKgwqDCoMKgIHwgMTQgKysrKysrKystLS0tLS0NCj4+IMKgIHhl
bi9jb21tb24vc3BpbmxvY2suY8KgwqDCoMKgwqAgfCAxNiArKysrKysrKysrKysrKysrDQo+
PiDCoCB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDE4ICstLS0tLS0tLS0tLS0tLS0t
LQ0KPj4gwqAgeGVuL2luY2x1ZGUveGVuL2NvbnNvbGUuaMKgIHzCoCA1ICsrKy0tDQo+PiDC
oCB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaCB8wqAgNyArKysrKysrDQo+PiDCoCA1IGZp
bGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdHJhcHMuYyBiL3hlbi9hcmNoL3g4Ni90cmFw
cy5jDQo+PiBpbmRleCBlMTM1NmY2OTZhLi5mNzI3NjllNzliIDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gveDg2L3RyYXBzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jDQo+
PiBAQCAtNjQ3LDEzICs2NDcsMTUgQEAgdm9pZCBzaG93X3N0YWNrX292ZXJmbG93KHVuc2ln
bmVkIGludCBjcHUsIGNvbnN0IHN0cnVjdCANCj4+IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+
PiDCoCB2b2lkIHNob3dfZXhlY3V0aW9uX3N0YXRlKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCAvKiBQcmV2ZW50IGludGVybGVh
dmluZyBvZiBvdXRwdXQuICovDQo+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3MgPSBj
b25zb2xlX2xvY2tfcmVjdXJzaXZlX2lycXNhdmUoKTsNCj4+ICvCoMKgwqAgdW5zaWduZWQg
bG9uZyBmbGFnczsNCj4+ICsNCj4+ICvCoMKgwqAgcnNwaW5fbG9ja19pcnFzYXZlKCZjb25z
b2xlX2xvY2ssIGZsYWdzKTsNCj4gDQo+IFRoaXMgZmVlbHMgYSBiaXQgd2VpcmQgYmVjYXVz
ZSByc3Bpbl9sb2NrX2lycXNhdmUoKSBiZWluZyBsb3dlcmNhc2UNCj4gaGludHMgdGhhdCBp
dCdzIGEgZWl0aGVyIGEgZnVuY3Rpb24gb3IgYmVoYXZlcyBsaWtlIG9uZS4gRm9yIHRoYXQg
aXQNCj4gc2hvdWxkIHRha2UgJmZsYWdzIGluc3RlYWQuDQoNCkkgZG9uJ3QgdGhpbmsgc28u
IFRoaXMgaXMgY29tbW9uIGJlaGF2aW9yIHdpdGggdGhlIExpbnV4IGtlcm5lbCwgYW5kIEkN
CnRoaW5rIHdlIHNob3VsZCBrZWVwIGl0LiBFc3BlY2lhbGx5IGFzIEkgYmVsaWV2ZSByc3Bp
bl9sb2NrX2lycXNhdmUoKQ0KYW5kIHNwaW5fbG9ja19pcnFzYXZlKCkgc2hvdWxkIGhhdmUg
YSBzaW1pbGFyIGludGVyZmFjZS4gT3Igd291bGQgeW91IHdhbnQNCnVzIHRvIGNoYW5nZSBt
b3JlIHRoYW4gMjUwIGNhbGwgc2l0ZXMgb2Ygc3Bpbl9sb2NrX2lycXNhdmUoKT8NCg0KPiAN
Cj4+IMKgwqDCoMKgwqAgc2hvd19yZWdpc3RlcnMocmVncyk7DQo+PiDCoMKgwqDCoMKgIHNo
b3dfY29kZShyZWdzKTsNCj4+IMKgwqDCoMKgwqAgc2hvd19zdGFjayhyZWdzKTsNCj4+IC3C
oMKgwqAgY29uc29sZV91bmxvY2tfcmVjdXJzaXZlX2lycXJlc3RvcmUoZmxhZ3MpOw0KPj4g
K8KgwqDCoCByc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY29uc29sZV9sb2NrLCBmbGFncyk7
DQo+PiDCoCB9DQo+PiDCoCB2b2lkIGNmX2NoZWNrIHNob3dfZXhlY3V0aW9uX3N0YXRlX25v
bmNvbnN0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gQEAgLTY2Myw3ICs2NjUs
NyBAQCB2b2lkIGNmX2NoZWNrIHNob3dfZXhlY3V0aW9uX3N0YXRlX25vbmNvbnN0KHN0cnVj
dCANCj4+IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiDCoCB2b2lkIHZjcHVfc2hvd19leGVj
dXRpb25fc3RhdGUoc3RydWN0IHZjcHUgKnYpDQo+PiDCoCB7DQo+PiAtwqDCoMKgIHVuc2ln
bmVkIGxvbmcgZmxhZ3MgPSAwOw0KPj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOw0K
Pj4gwqDCoMKgwqDCoCBpZiAoIHRlc3RfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdz
KSApDQo+PiDCoMKgwqDCoMKgIHsNCj4+IEBAIC02OTgsNyArNzAwLDcgQEAgdm9pZCB2Y3B1
X3Nob3dfZXhlY3V0aW9uX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gwqAgI2VuZGlmDQo+
PiDCoMKgwqDCoMKgIC8qIFByZXZlbnQgaW50ZXJsZWF2aW5nIG9mIG91dHB1dC4gKi8NCj4+
IC3CoMKgwqAgZmxhZ3MgPSBjb25zb2xlX2xvY2tfcmVjdXJzaXZlX2lycXNhdmUoKTsNCj4+
ICvCoMKgwqAgcnNwaW5fbG9ja19pcnFzYXZlKCZjb25zb2xlX2xvY2ssIGZsYWdzKTsNCj4+
IMKgwqDCoMKgwqAgdmNwdV9zaG93X3JlZ2lzdGVycyh2KTsNCj4+IEBAIC03MDgsNyArNzEw
LDcgQEAgdm9pZCB2Y3B1X3Nob3dfZXhlY3V0aW9uX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBTdG9wIGludGVybGVhdmluZyBwcmV2ZW50aW9u
OiBUaGUgbmVjZXNzYXJ5IFAyTSBsb29rdXBzIGludm9sdmUNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogbG9ja2luZywgd2hpY2ggaGFzIHRvIG9jY3VyIHdpdGggSVJRcyBlbmFibGVk
Lg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+IC3CoMKgwqDCoMKgwqDCoCBjb25z
b2xlX3VubG9ja19yZWN1cnNpdmVfaXJxcmVzdG9yZShmbGFncyk7DQo+PiArwqDCoMKgwqDC
oMKgwqAgcnNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNvbnNvbGVfbG9jaywgZmxhZ3MpOw0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNob3dfaHZtX3N0YWNrKHYsICZ2LT5hcmNoLnVzZXJf
cmVncyk7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IEBAIC03MTcsNyArNzE5LDcgQEAgdm9pZCB2
Y3B1X3Nob3dfZXhlY3V0aW9uX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICggZ3Vlc3Rfa2VybmVsX21vZGUodiwgJnYtPmFyY2gudXNlcl9yZWdz
KSApDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaG93X2d1ZXN0X3N0YWNrKHYs
ICZ2LT5hcmNoLnVzZXJfcmVncyk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgY29uc29sZV91bmxv
Y2tfcmVjdXJzaXZlX2lycXJlc3RvcmUoZmxhZ3MpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZjb25zb2xlX2xvY2ssIGZsYWdzKTsNCj4+IMKgwqDC
oMKgwqAgfQ0KPj4gwqAgI2lmZGVmIENPTkZJR19IVk0NCj4+IGRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL3NwaW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMNCj4+IGluZGV4IDI2
YzY2N2QzY2MuLjE3NzE2ZmM0ZWIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL3NwaW5s
b2NrLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc3BpbmxvY2suYw0KPj4gQEAgLTQ3NSw2ICs0
NzUsMTYgQEAgdm9pZCByc3Bpbl9sb2NrKHJzcGlubG9ja190ICpsb2NrKQ0KPj4gwqDCoMKg
wqDCoCBsb2NrLT5yZWN1cnNlX2NudCsrOw0KPj4gwqAgfQ0KPj4gK3Vuc2lnbmVkIGxvbmcg
X19yc3Bpbl9sb2NrX2lycXNhdmUocnNwaW5sb2NrX3QgKmxvY2spDQo+PiArew0KPj4gK8Kg
wqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4gKw0KPj4gK8KgwqDCoCBsb2NhbF9pcnFf
c2F2ZShmbGFncyk7DQo+PiArwqDCoMKgIHJzcGluX2xvY2sobG9jayk7DQo+PiArDQo+PiAr
wqDCoMKgIHJldHVybiBmbGFnczsNCj4+ICt9DQo+PiArDQo+PiDCoCB2b2lkIHJzcGluX3Vu
bG9jayhyc3BpbmxvY2tfdCAqbG9jaykNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgaWYgKCBs
aWtlbHkoLS1sb2NrLT5yZWN1cnNlX2NudCA9PSAwKSApDQo+PiBAQCAtNDg0LDYgKzQ5NCwx
MiBAQCB2b2lkIHJzcGluX3VubG9jayhyc3BpbmxvY2tfdCAqbG9jaykNCj4+IMKgwqDCoMKg
wqAgfQ0KPj4gwqAgfQ0KPj4gK3ZvaWQgcnNwaW5fdW5sb2NrX2lycXJlc3RvcmUocnNwaW5s
b2NrX3QgKmxvY2ssIHVuc2lnbmVkIGxvbmcgZmxhZ3MpDQo+PiArew0KPj4gK8KgwqDCoCBy
c3Bpbl91bmxvY2sobG9jayk7DQo+PiArwqDCoMKgIGxvY2FsX2lycV9yZXN0b3JlKGZsYWdz
KTsNCj4+ICt9DQo+PiArDQo+PiDCoCAjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklM
RQ0KPj4gwqAgc3RydWN0IGxvY2tfcHJvZmlsZV9hbmMgew0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMN
Cj4+IGluZGV4IDM2OWIyZjkwNzcuLmNjNzQzYjY3ZWMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
ZHJpdmVycy9jaGFyL2NvbnNvbGUuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25z
b2xlLmMNCj4+IEBAIC0xMjAsNyArMTIwLDcgQEAgc3RhdGljIGludCBfX3JlYWRfbW9zdGx5
IHNlcmNvbl9oYW5kbGUgPSAtMTsNCj4+IMKgIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9j
b25zb2xlX3hlbjsgLyogY29uc29sZT14ZW4gKi8NCj4+IMKgICNlbmRpZg0KPj4gLXN0YXRp
YyBERUZJTkVfUlNQSU5MT0NLKGNvbnNvbGVfbG9jayk7DQo+PiArREVGSU5FX1JTUElOTE9D
Syhjb25zb2xlX2xvY2spOw0KPj4gwqAgLyoNCj4+IMKgwqAgKiBUbyBjb250cm9sIHRoZSBh
bW91bnQgb2YgcHJpbnRpbmcsIHRocmVzaG9sZHMgYXJlIGFkZGVkLg0KPj4gQEAgLTExNTgs
MjIgKzExNTgsNiBAQCB2b2lkIGNvbnNvbGVfZW5kX2xvZ19ldmVyeXRoaW5nKHZvaWQpDQo+
PiDCoMKgwqDCoMKgIGF0b21pY19kZWMoJnByaW50X2V2ZXJ5dGhpbmcpOw0KPj4gwqAgfQ0K
Pj4gLXVuc2lnbmVkIGxvbmcgY29uc29sZV9sb2NrX3JlY3Vyc2l2ZV9pcnFzYXZlKHZvaWQp
DQo+PiAtew0KPj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4gLQ0KPj4gLcKg
wqDCoCBsb2NhbF9pcnFfc2F2ZShmbGFncyk7DQo+PiAtwqDCoMKgIHJzcGluX2xvY2soJmNv
bnNvbGVfbG9jayk7DQo+PiAtDQo+PiAtwqDCoMKgIHJldHVybiBmbGFnczsNCj4+IC19DQo+
PiAtDQo+PiAtdm9pZCBjb25zb2xlX3VubG9ja19yZWN1cnNpdmVfaXJxcmVzdG9yZSh1bnNp
Z25lZCBsb25nIGZsYWdzKQ0KPj4gLXsNCj4+IC3CoMKgwqAgcnNwaW5fdW5sb2NrKCZjb25z
b2xlX2xvY2spOw0KPj4gLcKgwqDCoCBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7DQo+PiAt
fQ0KPj4gLQ0KPj4gwqAgdm9pZCBjb25zb2xlX2ZvcmNlX3VubG9jayh2b2lkKQ0KPj4gwqAg
ew0KPj4gwqDCoMKgwqDCoCB3YXRjaGRvZ19kaXNhYmxlKCk7DQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL2NvbnNvbGUuaCBiL3hlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmgN
Cj4+IGluZGV4IGFiNWMzMGMwZGEuLmRmZjAwOTZiMjcgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4vY29uc29sZS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vY29uc29s
ZS5oDQo+PiBAQCAtOCw4ICs4LDExIEBADQo+PiDCoCAjZGVmaW5lIF9fQ09OU09MRV9IX18N
Cj4+IMKgICNpbmNsdWRlIDx4ZW4vaW50dHlwZXMuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL3Nw
aW5sb2NrLmg+DQo+PiDCoCAjaW5jbHVkZSA8cHVibGljL3hlbi5oPg0KPj4gK2V4dGVybiBy
c3BpbmxvY2tfdCBjb25zb2xlX2xvY2s7DQo+PiArDQo+PiDCoCBzdHJ1Y3QgeGVuX3N5c2N0
bF9yZWFkY29uc29sZTsNCj4+IMKgIGxvbmcgcmVhZF9jb25zb2xlX3Jpbmcoc3RydWN0IHhl
bl9zeXNjdGxfcmVhZGNvbnNvbGUgKm9wKTsNCj4+IEBAIC0yMCw4ICsyMyw2IEBAIHZvaWQg
Y29uc29sZV9pbml0X3Bvc3RpcnEodm9pZCk7DQo+PiDCoCB2b2lkIGNvbnNvbGVfZW5kYm9v
dCh2b2lkKTsNCj4+IMKgIGludCBjb25zb2xlX2hhcyhjb25zdCBjaGFyICpkZXZpY2UpOw0K
Pj4gLXVuc2lnbmVkIGxvbmcgY29uc29sZV9sb2NrX3JlY3Vyc2l2ZV9pcnFzYXZlKHZvaWQp
Ow0KPj4gLXZvaWQgY29uc29sZV91bmxvY2tfcmVjdXJzaXZlX2lycXJlc3RvcmUodW5zaWdu
ZWQgbG9uZyBmbGFncyk7DQo+PiDCoCB2b2lkIGNvbnNvbGVfZm9yY2VfdW5sb2NrKHZvaWQp
Ow0KPj4gwqAgdm9pZCBjb25zb2xlX3N0YXJ0X3N5bmModm9pZCk7DQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmggYi94ZW4vaW5jbHVkZS94ZW4vc3Bpbmxv
Y2suaA0KPj4gaW5kZXggYzk5ZWU1MjQ1OC4uNTNmMGY3MmFjNCAxMDA2NDQNCj4+IC0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
c3BpbmxvY2suaA0KPj4gQEAgLTIxOCw3ICsyMTgsMTQgQEAgdm9pZCBfc3Bpbl9iYXJyaWVy
KHNwaW5sb2NrX3QgKmxvY2spOw0KPj4gwqDCoCAqLw0KPj4gwqAgaW50IHJzcGluX3RyeWxv
Y2socnNwaW5sb2NrX3QgKmxvY2spOw0KPj4gwqAgdm9pZCByc3Bpbl9sb2NrKHJzcGlubG9j
a190ICpsb2NrKTsNCj4+ICsjZGVmaW5lIHJzcGluX2xvY2tfaXJxc2F2ZShsLCBmKcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwNCj4+ICvCoMKgwqAgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoMKgwqDCoMKgIEJVSUxE
X0JVR19PTihzaXplb2YoZikgIT0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKTvCoMKgwqDCoMKg
wqAgXA0KPj4gK8KgwqDCoMKgwqDCoMKgICgoZikgPSBfX3JzcGluX2xvY2tfaXJxc2F2ZShs
KSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+
PiArwqDCoMKgIH0pDQo+IA0KPiBJZiBmIGlzICZmbGFncywgdGhlbiBzL2YvKihmKS8gd291
bGQgYmUgbmVlZGVkIGluIHRoZXNlIDIgY2FzZXMuDQo+IA0KPiBPbiBvdGhlciBtYXR0ZXJz
IGlmIHdlIGhhZCAtV2NvbnZlcnNpb24gdHVybmVkIG9uIGJ5IGRlZmF1bHQgdGhhdA0KPiBC
VUlMRF9CVUdfT04oKSB3b3VsZG4ndCBiZSBuZWVkZWQuIE5vdCB0aGF0IHlvdSBjYW4gZG8g
aXQgKEknbSBzdXJlIHRoZSBjb2RlYmFzZSANCj4gd291bGQgZXhwbG9kZSBldmVyeXdoZXJl
IGlmIHdlIHN3aXRjaGVkIGl0IG9uKSwgYnV0IG1pZ2h0IGJlDQo+IHNvbWV0aGluZyB0byBj
b25zaWRlciBpbiB0aGUgZnV0dXJlLg0KDQpBZ2FpbiwgdGhpcyBpcyBsaWtlIExpbnV4IGtl
cm5lbC4gQW5kIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCBleHBsaWNpdCBjYXN0cw0KZXZlcnl3
aGVyZSB3aGVuIGUuZy4gbW92aW5nIHZhbHVlcyBiZXR3ZWVuIGZpeGVkIHNpemVkIGZpZWxk
cyBhbmQgc3RhbmRhcmQNCmludGVnZXIgdHlwZWQgZmllbGRzLg0KDQoNCkp1ZXJnZW4NCg==

--------------txhSLXUJpxTuv68XQ780d0o8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------txhSLXUJpxTuv68XQ780d0o8--

--------------eVh1H1TSxLKpE2f6t4ec1xbG--

--------------TUMc0ew5PfFhICRb7KYBDADD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVl6hwFAwAAAAAACgkQsN6d1ii/Ey/x
cAf+LUlRgYOpOhi1gmJkdclYP27OC/s8XIERzX4Mk04M5Bgqh9A126/I8JuIvHduj2HZ/sT2m+Km
ULawBsX32nxBDSQWyhXmq5bdzJs4VJVep8IfaQRtFjYFpG/2TqPQF2sPUvBBfdceeBAM4yVu7hIH
Dae9dKp8VW1S0eVE5vy2VVIrMVO20F+NCIlvf3aMA/xjCPlqmWzOd5JKqJ3ATusACq27qg24+55J
F7rXcvA9zvq3yCSA/b8xfs6pgH4yqDCm9eLFqmja/NvMhm3ZmKQsGgK0fnjD800am5afQRkk5Rk2
nJ5nYj+aWfRIDqxSkzrji6ub48Ywbmsvex11oAaHQQ==
=WUZS
-----END PGP SIGNATURE-----

--------------TUMc0ew5PfFhICRb7KYBDADD--

