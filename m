Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99A803735
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647063.1009754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAABG-0005ZB-5m; Mon, 04 Dec 2023 14:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647063.1009754; Mon, 04 Dec 2023 14:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAABG-0005Ws-34; Mon, 04 Dec 2023 14:44:18 +0000
Received: by outflank-mailman (input) for mailman id 647063;
 Mon, 04 Dec 2023 14:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAABE-0005WU-GE
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:44:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98873654-92b3-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 15:44:15 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBA311FCE2;
 Mon,  4 Dec 2023 14:44:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9BEA21398A;
 Mon,  4 Dec 2023 14:44:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IdPhI77lbWV6QAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 14:44:14 +0000
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
X-Inumbo-ID: 98873654-92b3-11ee-98e5-6d05b1d4d9a1
Message-ID: <cd4b8857-ad69-489b-9a4f-63d53c4d360e@suse.com>
Date: Mon, 4 Dec 2023 15:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
 <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
 <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
 <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com>
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
In-Reply-To: <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YkEuqfNQLPu8IPFdH4kn8LWo"
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.00 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: CBA311FCE2
X-Spam-Flag: YES
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YkEuqfNQLPu8IPFdH4kn8LWo
Content-Type: multipart/mixed; boundary="------------VFTwj0KbDRYEmcqDxIGxGhdy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Message-ID: <cd4b8857-ad69-489b-9a4f-63d53c4d360e@suse.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
 <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
 <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
 <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com>
In-Reply-To: <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com>

--------------VFTwj0KbDRYEmcqDxIGxGhdy
Content-Type: multipart/mixed; boundary="------------bccwx5pm9XoIgQ0qyZm3oSQB"

--------------bccwx5pm9XoIgQ0qyZm3oSQB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjMgMTU6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4xMi4yMDIz
IDE1OjE4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gT24gTW9uLCBEZWMgNCwgMjAyMyBh
dCAyOjEw4oCvUE0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+
Pg0KPj4+IE9uIDA0LjEyLjIzIDE0OjAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+PiBP
biBNb24sIERlYyA0LCAyMDIzIGF0IDEwOjU34oCvQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+DQo+Pj4+PiBJdCBpcyBvbmx5IGluIHRoZSBlcnJv
ciBjYXNlIHRoYXQgd2Ugd2FudCB0byBjbGVhbiB1cCB0aGUgbmV3IHBvb2wncw0KPj4+Pj4g
c2NoZWR1bGVyIGRhdGE7IGluIHRoZSBzdWNjZXNzIGNhc2UgaXQncyByYXRoZXIgdGhlIG9s
ZCBzY2hlZHVsZXIncw0KPj4+Pj4gZGF0YSB3aGljaCBuZWVkcyBjbGVhbmluZyB1cC4NCj4+
Pj4+DQo+Pj4+PiBSZXBvcnRlZC1ieTogUmVuw6kgV2ludGhlciBIw7hqZ2FhcmQgPHJlbmV3
aW5AcHJvdG9uLm1lPg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPj4+Pj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCj4+Pj4+DQo+Pj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
Yw0KPj4+Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+Pj4+IEBAIC04MTAs
NyArODEwLDcgQEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsDQo+
Pj4+PiAgICAgICAgZm9yICggdW5pdCA9IG9sZF91bml0czsgdW5pdDsgKQ0KPj4+Pj4gICAg
ICAgIHsNCj4+Pj4+ICAgICAgICAgICAgaWYgKCB1bml0LT5wcml2ICkNCj4+Pj4+IC0gICAg
ICAgICAgICBzY2hlZF9mcmVlX3VkYXRhKGMtPnNjaGVkLCB1bml0LT5wcml2KTsNCj4+Pj4+
ICsgICAgICAgICAgICBzY2hlZF9mcmVlX3VkYXRhKHJldCA/IGMtPnNjaGVkIDogb2xkX29w
cywgdW5pdC0+cHJpdik7DQo+Pj4+PiAgICAgICAgICAgIG9sZF91bml0ID0gdW5pdDsNCj4+
Pj4+ICAgICAgICAgICAgdW5pdCA9IHVuaXQtPm5leHRfaW5fbGlzdDsNCj4+Pj4+ICAgICAg
ICAgICAgeGZyZWUob2xkX3VuaXQpOw0KPj4+Pg0KPj4+PiBUaGlzIGNvZGUgaXMgdW5mb3J0
dW5hdGVseSB3cml0dGVuIGluIGEgImNsZXZlciIgd2F5IHdoaWNoIHNlZW1zIHRvDQo+Pj4+
IGhhdmUgaW50cm9kdWNlZCBzb21lIGNvbmZ1c2lvbi4gIFRoZSBvbmUgcGxhY2Ugd2hpY2gg
Y2FsbHMgImdvdG8NCj4+Pj4gb3V0X2ZyZWUiIGdvZXMgdGhyb3VnaCBhbmQgcmVwbGFjZXMg
Km1vc3QqIG9mIHRoZSAib2xkXyoiIHZhcmlhYmxlcw0KPj4+PiB3aXRoIHRoZSAibmV3IiBl
cXVpdmFsZW50cy4gIFRoYXQncyB3aHkgd2UncmUgaXRlcmF0aW5nIG92ZXINCj4+Pj4gYG9s
ZF91bml0c2AgZXZlbiBvbiB0aGUgZmFpbHVyZSBwYXRoLg0KPj4+Pg0KPj4+PiBUaGUgcmVz
dWx0IGlzIHRoYXQgdGhpcyBjaGFuZ2UgZG9lc24ndCBjYXRjaCBhbm90aGVyIGJ1ZyBvbiB0
aGUNCj4+Pj4gZm9sbG93aW5nIGxpbmUsIGluIHRoZSBlcnJvciBjYXNlOg0KPj4+Pg0KPj4+
PiBzY2hlZF9mcmVlX2RvbWRhdGEob2xkX29wcywgb2xkX2RvbWRhdGEpOw0KPj4+Pg0KPj4+
PiBBdCB0aGlzIHBvaW50LCBvbGRfb3BzIGlzIHN0aWxsIHRoZSBvbGQgb3BzLCBidXQgb2xk
X2RvbWRhdGEgaXMgdGhlDQo+Pj4+ICpuZXcqIGRvbWRhdGEuDQo+Pj4+DQo+Pj4+IEEgcGF0
Y2ggbGlrZSB0aGUgZm9sbG93aW5nIChjb21waWxlIHRlc3RlZCBvbmx5KSB3b3VsZCBmaXgg
aXQgYWxvbmcNCj4+Pj4gdGhlIGxpbmVzIG9mIHRoZSBvcmlnaW5hbCBpbnRlbnQ6DQo+Pj4+
IDg8LS0tLS0tLQ0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMg
Yi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4+PiBpbmRleCBlYmEwY2VhNGJiLi43OGYy
MTgzOWQzIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4+PiBAQCAtNzIwLDYgKzcyMCw3
IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1
cG9vbCAqYykNCj4+Pj4gICAgICAgICAgICB7DQo+Pj4+ICAgICAgICAgICAgICAgIG9sZF91
bml0cyA9IG5ld191bml0czsNCj4+Pj4gICAgICAgICAgICAgICAgb2xkX2RvbWRhdGEgPSBk
b21kYXRhOw0KPj4+PiArICAgICAgICAgICAgb2xkX29wcyA9IGMtPnNjaGVkOw0KPj4+PiAg
ICAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOw0KPj4+PiAgICAgICAgICAgICAgICBnb3Rv
IG91dF9mcmVlOw0KPj4+PiAgICAgICAgICAgIH0NCj4+Pj4gQEAgLTgwOSwxMCArODEwLDE1
IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1
cG9vbCAqYykNCj4+Pj4gICAgICAgIGRvbWFpbl91bnBhdXNlKGQpOw0KPj4+Pg0KPj4+PiAg
ICAgb3V0X2ZyZWU6DQo+Pj4+ICsgICAgLyoNCj4+Pj4gKyAgICAgKiBOQiBpZiB3ZSd2ZSBq
dW1wZWQgaGVyZSwgIm9sZF91bml0cyIsICJvbGRfb3BzIiwgYW5kIHNvIG9uIHdpbGwNCj4+
Pj4gKyAgICAgKiBhY3R1YWxseSBiZSBwb2ludGluZyB0byB0aGUgbmV3IG9wcywgc2luY2Ug
d2hlbiBhYm9ydGluZyBpdCdzDQo+Pj4+ICsgICAgICogdGhlIG5ldyBvcHMgd2Ugd2FudCB0
byBmcmVlLg0KPj4+PiArICAgICAqLw0KPj4+PiAgICAgICAgZm9yICggdW5pdCA9IG9sZF91
bml0czsgdW5pdDsgKQ0KPj4+PiAgICAgICAgew0KPj4+PiAgICAgICAgICAgIGlmICggdW5p
dC0+cHJpdiApDQo+Pj4+IC0gICAgICAgICAgICBzY2hlZF9mcmVlX3VkYXRhKGMtPnNjaGVk
LCB1bml0LT5wcml2KTsNCj4+Pj4gKyAgICAgICAgICAgIHNjaGVkX2ZyZWVfdWRhdGEob2xk
X29wcywgdW5pdC0+cHJpdik7DQo+Pj4+ICAgICAgICAgICAgb2xkX3VuaXQgPSB1bml0Ow0K
Pj4+PiAgICAgICAgICAgIHVuaXQgPSB1bml0LT5uZXh0X2luX2xpc3Q7DQo+Pj4+ICAgICAg
ICAgICAgeGZyZWUob2xkX3VuaXQpOw0KPj4+PiAtLS0tPjgNCj4+Pj4NCj4+Pj4gQnV0IGdp
dmVuIHRoYXQgdGhpcyBraW5kIG9mIGNsZXZlcm5lc3MgaGFzIGFscmVhZHkgZm9vbGVkIHR3
byBvZiBvdXINCj4+Pj4gbW9zdCBzZW5pb3IgZGV2ZWxvcGVycywgSSdkIHN1Z2dlc3QgbWFr
aW5nIHRoZSB3aG9sZSB0aGluZyBtb3JlDQo+Pj4+IGV4cGxpY2l0OyBzb21ldGhpbmcgbGlr
ZSB0aGUgYXR0YWNoZWQgKGFnYWluIGNvbXBpbGUtdGVzdGVkIG9ubHkpPw0KPj4+DQo+Pj4g
QW5kIEkgaGF2ZSBhZ2FpbiBhIHRoaXJkIGFwcHJvYWNoLCBtYWtpbmcgaXQgY3J5c3RhbCBj
bGVhciB3aGF0IGlzIGhhcHBlbmluZw0KPj4+IHdpdGggd2hpY2ggZGF0YS4gTm8gbmVlZCB0
byBleHBsYWluIHdoYXQgaXMgZnJlZWQgdmlhIHdoaWNoIHZhcmlhYmxlcy4gU2VlDQo+Pj4g
YXR0YWNoZWQgcGF0Y2ggKHRoaXMgdGltZSBpdCBzaG91bGQgYmUgcmVhbGx5IHRoZXJlKS4N
Cj4+DQo+PiBZZXMsIEkgdGhvdWdodCBhYm91dCBtYWtpbmcgYSBmdW5jdGlvbiBhcyB3ZWxs
IC0tIHRoYXQgd29ya3MgZm9yIG1lIHRvby4NCj4+DQo+PiBQZXJzb25hbGx5IEkgcHJlZmVy
IHRvIGtlZXAgdGhlICJnb3RvIG91dCIsIHJhdGhlciB0aGFuIGR1cGxpY2F0aW5nDQo+PiB0
aGUgcmN1X3JlYWRfdW5sb2NrKCkuICBJJ2QgeWllbGQgaWYgSmFuIHNhaWQgaGUgcHJlZmVy
cmVkDQo+PiBkdXBsaWNhdGlvbiwgaG93ZXZlci4NCj4gDQo+IEknbSBvbiB0aGUgZWRnZSB0
aGVyZSBhY3R1YWxseS4NCg0KSW4gdGhpcyBjYXNlIEknZCBwcmVmZXIgaXQgbXkgd2F5LCBh
cyBpdCBhdm9pZHMgaGF2aW5nIHRvIHNjcm9sbCBkb3duIHRvIHRoZQ0Kb3V0OiBsYWJlbCB0
byBzZWUgd2hhdCBpcyBoYXBwZW5pbmcgdGhlcmUuIEFkZGl0aW9uYWxseSBpdCBlbmFibGVz
IHRvIGdldCByaWQNCm9mIHRoZSByZXQgdmFyaWFibGUuDQoNCkluIHRoZSBlbmQgdGhlIG1h
aW4gcGFydCBvZiB0aGUgcGF0Y2ggaXMgdGhlIG5ldyBmdW5jdGlvbiwgc28gSSdtIG5vdCBy
ZWFsbHkNCmZlZWxpbmcgc3Ryb25nIHJlZ2FyZGluZyB0aGUgZHJvcHBpbmcgb2YgImdvdG8g
b3V0Ii4NCg0KDQpKdWVyZ2VuDQo=
--------------bccwx5pm9XoIgQ0qyZm3oSQB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bccwx5pm9XoIgQ0qyZm3oSQB--

--------------VFTwj0KbDRYEmcqDxIGxGhdy--

--------------YkEuqfNQLPu8IPFdH4kn8LWo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVt5b4FAwAAAAAACgkQsN6d1ii/Ey//
XAf/Tv+j2UjTtEt8/Prr8AsFYoij4tmsxr2fLYuFNDVku272IKo2MriJmW1O1wmdQMU2+LQql3yh
LS/NqXS5zghL1To6J+P4yfh6xSSP+921BS+JMTznO93v5h23DVAJQ+5TIz6M73HZZ3A5wgVhGkOi
Rv8UPwms0YCRWBxo65RofHmkP/AzvAegLHLhqXQan4yIHPpdv4qaUY+xkYlB5U2xUSUATTIXbXpb
KXVW6raoe5yUGPfZPMUZQKAdu3Sn2KdEjM21Tbkj1YrvDlD/W7FUyOZPq4fPPolAoDl9P6nRMmI+
m5rdvcCAY8FtBe3RZj/Dp+6SgK+fpj70TIg+I/f7Pw==
=Qe/H
-----END PGP SIGNATURE-----

--------------YkEuqfNQLPu8IPFdH4kn8LWo--

