Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1E7FEE10
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 12:39:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644567.1005741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fNu-0002PQ-86; Thu, 30 Nov 2023 11:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644567.1005741; Thu, 30 Nov 2023 11:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fNu-0002NZ-4H; Thu, 30 Nov 2023 11:39:10 +0000
Received: by outflank-mailman (input) for mailman id 644567;
 Thu, 30 Nov 2023 11:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XJ9b=HL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r8fNr-0001pu-MI
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 11:39:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a86367-8f75-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 12:39:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E55501F855;
 Thu, 30 Nov 2023 11:39:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAC4413AB1;
 Thu, 30 Nov 2023 11:39:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ae3XJ1l0aGWYIgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 30 Nov 2023 11:39:05 +0000
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
X-Inumbo-ID: 11a86367-8f75-11ee-98e4-6d05b1d4d9a1
Message-ID: <ad0558a6-7f8d-4524-b410-f40df19000be@suse.com>
Date: Thu, 30 Nov 2023 12:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/public: fix flexible array definitions
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231130092112.18118-1-jgross@suse.com>
 <d373be79-af9e-49d0-95c3-5e5c0c187cca@xen.org>
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
In-Reply-To: <d373be79-af9e-49d0-95c3-5e5c0c187cca@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VjeQGyjLBSGYFiZRbmOmFEH3"
X-Spam-Level: *******************
X-Spamd-Bar: +++++++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [19.10 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-0.997];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 19.10
X-Rspamd-Queue-Id: E55501F855
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VjeQGyjLBSGYFiZRbmOmFEH3
Content-Type: multipart/mixed; boundary="------------ZCkCqFpWSncdtyYsn4upYerD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <ad0558a6-7f8d-4524-b410-f40df19000be@suse.com>
Subject: Re: [PATCH v2] xen/public: fix flexible array definitions
References: <20231130092112.18118-1-jgross@suse.com>
 <d373be79-af9e-49d0-95c3-5e5c0c187cca@xen.org>
In-Reply-To: <d373be79-af9e-49d0-95c3-5e5c0c187cca@xen.org>

--------------ZCkCqFpWSncdtyYsn4upYerD
Content-Type: multipart/mixed; boundary="------------nNk0UkHr5Pi5RUDTcD6WE58b"

--------------nNk0UkHr5Pi5RUDTcD6WE58b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMTEuMjMgMTI6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzExLzIwMjMgMDk6MjEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiAt
LS0NCj4+IFYyOg0KPj4gLSBidW1wIGludGVyZmFjZSB2ZXJzaW9uIGFuZCBtYWtlIGNoYW5n
ZSBvbmx5IGZvciBuZXcgdmVyc2lvbg0KPj4gwqDCoCAoSmFuIEJldWxpY2gpDQo+PiAtLS0N
Cj4+IMKgIHhlbi9pbmNsdWRlL3B1YmxpYy9pby9jYW1lcmFpZi5oIHwgMiArLQ0KPj4gwqAg
eGVuL2luY2x1ZGUvcHVibGljL2lvL2Rpc3BsaWYuaMKgIHwgMiArLQ0KPj4gwqAgeGVuL2lu
Y2x1ZGUvcHVibGljL2lvL2ZzaWYuaMKgwqDCoMKgIHwgNCArKy0tDQo+PiDCoCB4ZW4vaW5j
bHVkZS9wdWJsaWMvaW8vcHZjYWxscy5owqAgfCAyICstDQo+PiDCoCB4ZW4vaW5jbHVkZS9w
dWJsaWMvaW8vcmluZy5owqDCoMKgwqAgfCA1ICsrKy0tDQo+PiDCoCB4ZW4vaW5jbHVkZS9w
dWJsaWMvaW8vc25kaWYuaMKgwqDCoCB8IDIgKy0NCj4+IMKgIHhlbi9pbmNsdWRlL3B1Ymxp
Yy94ZW4tY29tcGF0LmjCoCB8IDIgKy0NCj4+IMKgIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4u
aMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKysrKw0KPj4gwqAgOCBmaWxlcyBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9wdWJsaWMvaW8vY2FtZXJhaWYuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9p
by9jYW1lcmFpZi5oDQo+PiBpbmRleCAxMzc2M2FiZWY5Li5hMzg5NDQzNzY5IDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2lvL2NhbWVyYWlmLmgNCj4+ICsrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9pby9jYW1lcmFpZi5oDQo+PiBAQCAtNzYzLDcgKzc2Myw3IEBA
IHN0cnVjdCB4ZW5jYW1lcmFfYnVmX2NyZWF0ZV9yZXEgew0KPj4gwqDCoCAqLw0KPj4gwqAg
c3RydWN0IHhlbmNhbWVyYV9wYWdlX2RpcmVjdG9yeSB7DQo+PiDCoMKgwqDCoMKgIGdyYW50
X3JlZl90IGdyZWZfZGlyX25leHRfcGFnZTsNCj4+IC3CoMKgwqAgZ3JhbnRfcmVmX3QgZ3Jl
ZlsxXTsgLyogVmFyaWFibGUgbGVuZ3RoICovDQo+PiArwqDCoMKgIGdyYW50X3JlZl90IGdy
ZWZbWEVOUFZfRkxFWF9BUlJBWV9ESU1dOw0KPj4gwqAgfTsNCj4+IMKgIC8qDQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lvL2Rpc3BsaWYuaCBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9pby9kaXNwbGlmLmgNCj4+IGluZGV4IDczZDBjYmRmMTUuLjEzMmM5NmZhNWMg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vZGlzcGxpZi5oDQo+PiAr
KysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vZGlzcGxpZi5oDQo+PiBAQCAtNTM3LDcgKzUz
Nyw3IEBAIHN0cnVjdCB4ZW5kaXNwbF9kYnVmX2NyZWF0ZV9yZXEgew0KPj4gwqAgc3RydWN0
IHhlbmRpc3BsX3BhZ2VfZGlyZWN0b3J5IHsNCj4+IMKgwqDCoMKgwqAgZ3JhbnRfcmVmX3Qg
Z3JlZl9kaXJfbmV4dF9wYWdlOw0KPj4gLcKgwqDCoCBncmFudF9yZWZfdCBncmVmWzFdOyAv
KiBWYXJpYWJsZSBsZW5ndGggKi8NCj4+ICvCoMKgwqAgZ3JhbnRfcmVmX3QgZ3JlZltYRU5Q
Vl9GTEVYX0FSUkFZX0RJTV07DQo+PiDCoCB9Ow0KPj4gwqAgLyoNCj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vZnNpZi5oIGIveGVuL2luY2x1ZGUvcHVibGljL2lv
L2ZzaWYuaA0KPj4gaW5kZXggZWM1Nzg1MDIzMy4uZGNhZGUxYzY5OCAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9mc2lmLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9pby9mc2lmLmgNCj4+IEBAIC00MCw3ICs0MCw3IEBAIHN0cnVjdCBmc2lmX3Jl
YWRfcmVxdWVzdCB7DQo+PiDCoMKgwqDCoMKgIGludDMyX3QgcGFkOw0KPj4gwqDCoMKgwqDC
oCB1aW50NjRfdCBsZW47DQo+PiDCoMKgwqDCoMKgIHVpbnQ2NF90IG9mZnNldDsNCj4+IC3C
oMKgwqAgZ3JhbnRfcmVmX3QgZ3JlZnNbMV07wqAgLyogVmFyaWFibGUgbGVuZ3RoICovDQo+
PiArwqDCoMKgIGdyYW50X3JlZl90IGdyZWZzW1hFTlBWX0ZMRVhfQVJSQVlfRElNXTsNCj4+
IMKgIH07DQo+PiDCoCBzdHJ1Y3QgZnNpZl93cml0ZV9yZXF1ZXN0IHsNCj4+IEBAIC00OCw3
ICs0OCw3IEBAIHN0cnVjdCBmc2lmX3dyaXRlX3JlcXVlc3Qgew0KPj4gwqDCoMKgwqDCoCBp
bnQzMl90IHBhZDsNCj4+IMKgwqDCoMKgwqAgdWludDY0X3QgbGVuOw0KPj4gwqDCoMKgwqDC
oCB1aW50NjRfdCBvZmZzZXQ7DQo+PiAtwqDCoMKgIGdyYW50X3JlZl90IGdyZWZzWzFdO8Kg
IC8qIFZhcmlhYmxlIGxlbmd0aCAqLw0KPj4gK8KgwqDCoCBncmFudF9yZWZfdCBncmVmc1tY
RU5QVl9GTEVYX0FSUkFZX0RJTV07DQo+PiDCoCB9Ow0KPj4gwqAgc3RydWN0IGZzaWZfc3Rh
dF9yZXF1ZXN0IHsNCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcHZj
YWxscy5oIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3B2Y2FsbHMuaA0KPj4gaW5kZXggMjMw
YjA3MTllMy4uYWYwZTlhYmQxMyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9pby9wdmNhbGxzLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9wdmNhbGxz
LmgNCj4+IEBAIC0zMCw3ICszMCw3IEBAIHN0cnVjdCBwdmNhbGxzX2RhdGFfaW50ZiB7DQo+
PiDCoMKgwqDCoMKgIHVpbnQ4X3QgcGFkMls1Ml07DQo+PiDCoMKgwqDCoMKgIFJJTkdfSURY
IHJpbmdfb3JkZXI7DQo+PiAtwqDCoMKgIGdyYW50X3JlZl90IHJlZltdOw0KPj4gK8KgwqDC
oCBncmFudF9yZWZfdCByZWZbWEVOUFZfRkxFWF9BUlJBWV9ESU1dOw0KPiANCj4gSSBhbSBw
cm9iYWJseSBtaXNzaW5nIHNvbWV0aGluZy4gSW4gdGhlIGNvbW1pdCBtZXNzYWdlLCB5b3Ug
c3VnZ2VzdGVkIHRoYXQgDQo+IFhFTlBWX0ZMRVhfQVJSQVlfRElNIHdpbGwgdXNlIDEgZm9y
IG9sZGVyIGludGVyZmFjZSB2ZXJzaW9uIGZvciBjb21wYXRpYmlsaXR5IA0KPiByZWFzb24u
DQo+IA0KPiBZZXQsIGlmIEkgYW0gbm90IG1pc3Rha2VuLCBbXSBpcyBub3QgZXF1aXZhbGVu
dCB0byBbMV0uIFNvIGFyZW4ndCB5b3UgDQo+IGVmZmVjdGl2ZWx5IGJyZWFraW5nIHRoZSBj
b21wYXRpYmlsaXR5Pw0KDQpPaCwgdGhhbmtzIGZvciBjYXRjaGluZyB0aGlzIG9uZSENCg0K
SSBhZ3JlZSwgdGhpcyBzaG91bGQgYmUgWEVOX0ZMRVhfQVJSQVlfRElNIGluc3RlYWQuDQoN
Cg0KSnVlcmdlbg0K
--------------nNk0UkHr5Pi5RUDTcD6WE58b
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nNk0UkHr5Pi5RUDTcD6WE58b--

--------------ZCkCqFpWSncdtyYsn4upYerD--

--------------VjeQGyjLBSGYFiZRbmOmFEH3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB4BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVodFkFAwAAAAAACgkQsN6d1ii/Ey/B
jQf1Ewloo1T9Igt2QtoHQLXg6G4dpKd2ly2owmx0HSMMnq5a/P2Yh6zXbA4SOwnXxLKBKFmHAqkk
waqxSHmvtLPCV4nzCZW7GqNzzEIIYORfAv9tH6oTjXZ7LBoxw8bhQft/rI/rChB4R6apl3sqXk7H
LhO0Ac9lHiUrWpkpWtxFtT7Um1PUycuuyf/Fy6ADdiS4iYjxfSCcam5WF3qKHPACFr+xeFceNQ17
KYnCpjBJnVEGc8aSVbk2EXX34tSotwOB3hnyqZpJz0FlmQiT63J5e2p4g1JJCNiMGiTSz/cvwkVR
RVTttb5SZGWuOyGHhlDk/jOirbTmCNi6AmDFmZgM
=T2vu
-----END PGP SIGNATURE-----

--------------VjeQGyjLBSGYFiZRbmOmFEH3--

