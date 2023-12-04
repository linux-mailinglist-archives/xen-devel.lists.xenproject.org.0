Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8595803617
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647004.1009675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9f0-0000ix-Uo; Mon, 04 Dec 2023 14:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647004.1009675; Mon, 04 Dec 2023 14:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9f0-0000hd-Qx; Mon, 04 Dec 2023 14:10:58 +0000
Received: by outflank-mailman (input) for mailman id 647004;
 Mon, 04 Dec 2023 14:10:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rA9ez-0000Xk-K7
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:10:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f08df3c5-92ae-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:10:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8708D1FE65;
 Mon,  4 Dec 2023 14:10:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50310139AA;
 Mon,  4 Dec 2023 14:10:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QW3JEe7dbWWVMQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 14:10:54 +0000
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
X-Inumbo-ID: f08df3c5-92ae-11ee-9b0f-b553b5be7939
Message-ID: <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
Date: Mon, 4 Dec 2023 15:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
To: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
Content-Language: en-US
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
In-Reply-To: <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yC5bohNtndtBwCMpIwyzed7v"
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
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:+,6:~];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain,text/x-patch];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: 8708D1FE65
X-Spam-Flag: YES
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yC5bohNtndtBwCMpIwyzed7v
Content-Type: multipart/mixed; boundary="------------5Q6MPXTMRZgh0wXh2d0DQ00c";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Message-ID: <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
In-Reply-To: <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>

--------------5Q6MPXTMRZgh0wXh2d0DQ00c
Content-Type: multipart/mixed; boundary="------------hNd3SMThRn7y6eGbr0bmCqA0"

--------------hNd3SMThRn7y6eGbr0bmCqA0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjMgMTQ6MDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIE1vbiwgRGVj
IDQsIDIwMjMgYXQgMTA6NTfigK9BTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEl0IGlzIG9ubHkgaW4gdGhlIGVycm9yIGNhc2UgdGhhdCB3ZSB3
YW50IHRvIGNsZWFuIHVwIHRoZSBuZXcgcG9vbCdzDQo+PiBzY2hlZHVsZXIgZGF0YTsgaW4g
dGhlIHN1Y2Nlc3MgY2FzZSBpdCdzIHJhdGhlciB0aGUgb2xkIHNjaGVkdWxlcidzDQo+PiBk
YXRhIHdoaWNoIG5lZWRzIGNsZWFuaW5nIHVwLg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBSZW7D
qSBXaW50aGVyIEjDuGpnYWFyZCA8cmVuZXdpbkBwcm90b24ubWU+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4NCj4+IC0tLSBhL3hlbi9jb21t
b24vc2NoZWQvY29yZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4g
QEAgLTgxMCw3ICs4MTAsNyBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFp
biAqZCwNCj4+ICAgICAgIGZvciAoIHVuaXQgPSBvbGRfdW5pdHM7IHVuaXQ7ICkNCj4+ICAg
ICAgIHsNCj4+ICAgICAgICAgICBpZiAoIHVuaXQtPnByaXYgKQ0KPj4gLSAgICAgICAgICAg
IHNjaGVkX2ZyZWVfdWRhdGEoYy0+c2NoZWQsIHVuaXQtPnByaXYpOw0KPj4gKyAgICAgICAg
ICAgIHNjaGVkX2ZyZWVfdWRhdGEocmV0ID8gYy0+c2NoZWQgOiBvbGRfb3BzLCB1bml0LT5w
cml2KTsNCj4+ICAgICAgICAgICBvbGRfdW5pdCA9IHVuaXQ7DQo+PiAgICAgICAgICAgdW5p
dCA9IHVuaXQtPm5leHRfaW5fbGlzdDsNCj4+ICAgICAgICAgICB4ZnJlZShvbGRfdW5pdCk7
DQo+IA0KPiBUaGlzIGNvZGUgaXMgdW5mb3J0dW5hdGVseSB3cml0dGVuIGluIGEgImNsZXZl
ciIgd2F5IHdoaWNoIHNlZW1zIHRvDQo+IGhhdmUgaW50cm9kdWNlZCBzb21lIGNvbmZ1c2lv
bi4gIFRoZSBvbmUgcGxhY2Ugd2hpY2ggY2FsbHMgImdvdG8NCj4gb3V0X2ZyZWUiIGdvZXMg
dGhyb3VnaCBhbmQgcmVwbGFjZXMgKm1vc3QqIG9mIHRoZSAib2xkXyoiIHZhcmlhYmxlcw0K
PiB3aXRoIHRoZSAibmV3IiBlcXVpdmFsZW50cy4gIFRoYXQncyB3aHkgd2UncmUgaXRlcmF0
aW5nIG92ZXINCj4gYG9sZF91bml0c2AgZXZlbiBvbiB0aGUgZmFpbHVyZSBwYXRoLg0KPiAN
Cj4gVGhlIHJlc3VsdCBpcyB0aGF0IHRoaXMgY2hhbmdlIGRvZXNuJ3QgY2F0Y2ggYW5vdGhl
ciBidWcgb24gdGhlDQo+IGZvbGxvd2luZyBsaW5lLCBpbiB0aGUgZXJyb3IgY2FzZToNCj4g
DQo+IHNjaGVkX2ZyZWVfZG9tZGF0YShvbGRfb3BzLCBvbGRfZG9tZGF0YSk7DQo+IA0KPiBB
dCB0aGlzIHBvaW50LCBvbGRfb3BzIGlzIHN0aWxsIHRoZSBvbGQgb3BzLCBidXQgb2xkX2Rv
bWRhdGEgaXMgdGhlDQo+ICpuZXcqIGRvbWRhdGEuDQo+IA0KPiBBIHBhdGNoIGxpa2UgdGhl
IGZvbGxvd2luZyAoY29tcGlsZSB0ZXN0ZWQgb25seSkgd291bGQgZml4IGl0IGFsb25nDQo+
IHRoZSBsaW5lcyBvZiB0aGUgb3JpZ2luYWwgaW50ZW50Og0KPiA4PC0tLS0tLS0NCj4gZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9j
b3JlLmMNCj4gaW5kZXggZWJhMGNlYTRiYi4uNzhmMjE4MzlkMyAxMDA2NDQNCj4gLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3Jl
LmMNCj4gQEAgLTcyMCw2ICs3MjAsNyBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4oc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpDQo+ICAgICAgICAgICB7DQo+ICAgICAg
ICAgICAgICAgb2xkX3VuaXRzID0gbmV3X3VuaXRzOw0KPiAgICAgICAgICAgICAgIG9sZF9k
b21kYXRhID0gZG9tZGF0YTsNCj4gKyAgICAgICAgICAgIG9sZF9vcHMgPSBjLT5zY2hlZDsN
Cj4gICAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOw0KPiAgICAgICAgICAgICAgIGdvdG8g
b3V0X2ZyZWU7DQo+ICAgICAgICAgICB9DQo+IEBAIC04MDksMTAgKzgxMCwxNSBAQCBpbnQg
c2NoZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMp
DQo+ICAgICAgIGRvbWFpbl91bnBhdXNlKGQpOw0KPiANCj4gICAgb3V0X2ZyZWU6DQo+ICsg
ICAgLyoNCj4gKyAgICAgKiBOQiBpZiB3ZSd2ZSBqdW1wZWQgaGVyZSwgIm9sZF91bml0cyIs
ICJvbGRfb3BzIiwgYW5kIHNvIG9uIHdpbGwNCj4gKyAgICAgKiBhY3R1YWxseSBiZSBwb2lu
dGluZyB0byB0aGUgbmV3IG9wcywgc2luY2Ugd2hlbiBhYm9ydGluZyBpdCdzDQo+ICsgICAg
ICogdGhlIG5ldyBvcHMgd2Ugd2FudCB0byBmcmVlLg0KPiArICAgICAqLw0KPiAgICAgICBm
b3IgKCB1bml0ID0gb2xkX3VuaXRzOyB1bml0OyApDQo+ICAgICAgIHsNCj4gICAgICAgICAg
IGlmICggdW5pdC0+cHJpdiApDQo+IC0gICAgICAgICAgICBzY2hlZF9mcmVlX3VkYXRhKGMt
PnNjaGVkLCB1bml0LT5wcml2KTsNCj4gKyAgICAgICAgICAgIHNjaGVkX2ZyZWVfdWRhdGEo
b2xkX29wcywgdW5pdC0+cHJpdik7DQo+ICAgICAgICAgICBvbGRfdW5pdCA9IHVuaXQ7DQo+
ICAgICAgICAgICB1bml0ID0gdW5pdC0+bmV4dF9pbl9saXN0Ow0KPiAgICAgICAgICAgeGZy
ZWUob2xkX3VuaXQpOw0KPiAtLS0tPjgNCj4gDQo+IEJ1dCBnaXZlbiB0aGF0IHRoaXMga2lu
ZCBvZiBjbGV2ZXJuZXNzIGhhcyBhbHJlYWR5IGZvb2xlZCB0d28gb2Ygb3VyDQo+IG1vc3Qg
c2VuaW9yIGRldmVsb3BlcnMsIEknZCBzdWdnZXN0IG1ha2luZyB0aGUgd2hvbGUgdGhpbmcg
bW9yZQ0KPiBleHBsaWNpdDsgc29tZXRoaW5nIGxpa2UgdGhlIGF0dGFjaGVkIChhZ2FpbiBj
b21waWxlLXRlc3RlZCBvbmx5KT8NCg0KQW5kIEkgaGF2ZSBhZ2FpbiBhIHRoaXJkIGFwcHJv
YWNoLCBtYWtpbmcgaXQgY3J5c3RhbCBjbGVhciB3aGF0IGlzIGhhcHBlbmluZw0Kd2l0aCB3
aGljaCBkYXRhLiBObyBuZWVkIHRvIGV4cGxhaW4gd2hhdCBpcyBmcmVlZCB2aWEgd2hpY2gg
dmFyaWFibGVzLiBTZWUNCmF0dGFjaGVkIHBhdGNoICh0aGlzIHRpbWUgaXQgc2hvdWxkIGJl
IHJlYWxseSB0aGVyZSkuDQoNClRob3VnaHRzPw0KDQoNCkp1ZXJnZW4NCg==
--------------hNd3SMThRn7y6eGbr0bmCqA0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hNd3SMThRn7y6eGbr0bmCqA0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-sched_move_domain.patch"
Content-Disposition: attachment;
 filename="0001-xen-sched-fix-sched_move_domain.patch"
Content-Transfer-Encoding: base64

RnJvbSBiODMxM2Q3MDYwZTk0OTlmYTc1ODAyNjViZGE3MDNjY2UwNWZlNDZhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IE1vbiwgNCBEZWMgMjAyMyAxNDoxNTo0NSArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IHhlbi9zY2hlZDogZml4IHNjaGVkX21vdmVfZG9tYWluKCkKTUlNRS1WZXJzaW9uOiAxLjAK
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNm
ZXItRW5jb2Rpbmc6IDhiaXQKCkRvIGNsZWFudXAgaW4gc2NoZWRfbW92ZV9kb21haW4oKSBp
biBhIGRlZGljYXRlZCBzZXJ2aWNlIGZ1bmN0aW9uLAp3aGljaCBpcyBjYWxsZWQgZWl0aGVy
IGluIGVycm9yIGNhc2Ugd2l0aCBuZXdseSBhbGxvY2F0ZWQgZGF0YSwgb3IgaW4Kc3VjY2Vz
cyBjYXNlIHdpdGggdGhlIG9sZCBkYXRhIHRvIGJlIGZyZWVkLgoKVGhpcyB3aWxsIGF0IG9u
Y2UgZml4IHNvbWUgc3VidGxlIGJ1Z3Mgd2hpY2ggc25lYWtlZCBpbiBkdWUgdG8KZm9yZ2V0
dGluZyB0byBvdmVyd3JpdGUgc29tZSBwb2ludGVycyBpbiB0aGUgZXJyb3IgY2FzZS4KCkZp
eGVzOiA3MGZhZGM0MTYzNWIgKCJ4ZW4vY3B1cG9vbDogc3VwcG9ydCBtb3ZpbmcgZG9tYWlu
IGJldHdlZW4gY3B1cG9vbHMgd2l0aCBkaWZmZXJlbnQgZ3JhbnVsYXJpdHkiKQpSZXBvcnRl
ZC1ieTogUmVuw6kgV2ludGhlciBIw7hqZ2FhcmQgPHJlbmV3aW5AcHJvdG9uLm1lPgpJbml0
aWFsLWZpeC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpJbml0aWFsLWZp
eC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjbG91ZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9u
L3NjaGVkL2NvcmUuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9u
L3NjaGVkL2NvcmUuYwppbmRleCBlYmEwY2VhNGJiLi5mZDkyZTliMTNhIDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
YwpAQCAtNjQ3LDYgKzY0NywyNCBAQCBzdGF0aWMgdm9pZCBzY2hlZF9tb3ZlX2lycXMoY29u
c3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgICAgIHZjcHVfbW92ZV9pcnFzKHYp
OwogfQogCitzdGF0aWMgdm9pZCBzY2hlZF9tb3ZlX2RvbWFpbl9jbGVhbnVwKHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXRzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkb21kYXRhKQoreworICAgIHN0cnVjdCBzY2hlZF91bml0ICp1
bml0LCAqb2xkX3VuaXQ7CisKKyAgICBmb3IgKCB1bml0ID0gdW5pdHM7IHVuaXQ7ICkKKyAg
ICB7CisgICAgICAgIGlmICggdW5pdC0+cHJpdiApCisgICAgICAgICAgICBzY2hlZF9mcmVl
X3VkYXRhKG9wcywgdW5pdC0+cHJpdik7CisgICAgICAgIG9sZF91bml0ID0gdW5pdDsKKyAg
ICAgICAgdW5pdCA9IHVuaXQtPm5leHRfaW5fbGlzdDsKKyAgICAgICAgeGZyZWUob2xkX3Vu
aXQpOworICAgIH0KKworICAgIHNjaGVkX2ZyZWVfZG9tZGF0YShvcHMsIGRvbWRhdGEpOwor
fQorCiAvKgogICogTW92ZSBhIGRvbWFpbiBmcm9tIG9uZSBjcHVwb29sIHRvIGFub3RoZXIu
CiAgKgpAQCAtNjg2LDcgKzcwNCw2IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICB2b2lkICpvbGRfZG9tZGF0YTsK
ICAgICB1bnNpZ25lZCBpbnQgZ3JhbiA9IGNwdXBvb2xfZ2V0X2dyYW51bGFyaXR5KGMpOwog
ICAgIHVuc2lnbmVkIGludCBuX3VuaXRzID0gZC0+dmNwdVswXSA/IERJVl9ST1VORF9VUChk
LT5tYXhfdmNwdXMsIGdyYW4pIDogMDsKLSAgICBpbnQgcmV0ID0gMDsKIAogICAgIGZvcl9l
YWNoX3ZjcHUgKCBkLCB2ICkKICAgICB7CkBAIC02OTksOCArNzE2LDkgQEAgaW50IHNjaGVk
X21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKQogICAg
IGRvbWRhdGEgPSBzY2hlZF9hbGxvY19kb21kYXRhKGMtPnNjaGVkLCBkKTsKICAgICBpZiAo
IElTX0VSUihkb21kYXRhKSApCiAgICAgewotICAgICAgICByZXQgPSBQVFJfRVJSKGRvbWRh
dGEpOwotICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hl
ZF9yZXNfcmN1bG9jayk7CisKKyAgICAgICAgcmV0dXJuIFBUUl9FUlIoZG9tZGF0YSk7CiAg
ICAgfQogCiAgICAgZm9yICggdW5pdF9pZHggPSAwOyB1bml0X2lkeCA8IG5fdW5pdHM7IHVu
aXRfaWR4KysgKQpAQCAtNzE4LDEwICs3MzYsMTAgQEAgaW50IHNjaGVkX21vdmVfZG9tYWlu
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKQogCiAgICAgICAgIGlmICgg
IXVuaXQgfHwgIXVuaXQtPnByaXYgKQogICAgICAgICB7Ci0gICAgICAgICAgICBvbGRfdW5p
dHMgPSBuZXdfdW5pdHM7Ci0gICAgICAgICAgICBvbGRfZG9tZGF0YSA9IGRvbWRhdGE7Ci0g
ICAgICAgICAgICByZXQgPSAtRU5PTUVNOwotICAgICAgICAgICAgZ290byBvdXRfZnJlZTsK
KyAgICAgICAgICAgIHNjaGVkX21vdmVfZG9tYWluX2NsZWFudXAoYy0+c2NoZWQsIG5ld191
bml0cywgZG9tZGF0YSk7CisgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jl
c19yY3Vsb2NrKTsKKworICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAgICAgICAgIH0K
IAogICAgICAgICB1bml0X3B0ciA9ICZ1bml0LT5uZXh0X2luX2xpc3Q7CkBAIC04MDgsMjIg
KzgyNiwxMSBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IGNwdXBvb2wgKmMpCiAKICAgICBkb21haW5fdW5wYXVzZShkKTsKIAotIG91dF9mcmVl
OgotICAgIGZvciAoIHVuaXQgPSBvbGRfdW5pdHM7IHVuaXQ7ICkKLSAgICB7Ci0gICAgICAg
IGlmICggdW5pdC0+cHJpdiApCi0gICAgICAgICAgICBzY2hlZF9mcmVlX3VkYXRhKGMtPnNj
aGVkLCB1bml0LT5wcml2KTsKLSAgICAgICAgb2xkX3VuaXQgPSB1bml0OwotICAgICAgICB1
bml0ID0gdW5pdC0+bmV4dF9pbl9saXN0OwotICAgICAgICB4ZnJlZShvbGRfdW5pdCk7Ci0g
ICAgfQotCi0gICAgc2NoZWRfZnJlZV9kb21kYXRhKG9sZF9vcHMsIG9sZF9kb21kYXRhKTsK
KyAgICBzY2hlZF9tb3ZlX2RvbWFpbl9jbGVhbnVwKG9sZF9vcHMsIG9sZF91bml0cywgb2xk
X2RvbWRhdGEpOwogCi0gb3V0OgogICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3Jj
dWxvY2spOwogCi0gICAgcmV0dXJuIHJldDsKKyAgICByZXR1cm4gMDsKIH0KIAogdm9pZCBz
Y2hlZF9kZXN0cm95X3ZjcHUoc3RydWN0IHZjcHUgKnYpCi0tIAoyLjM1LjMKCg==

--------------hNd3SMThRn7y6eGbr0bmCqA0--

--------------5Q6MPXTMRZgh0wXh2d0DQ00c--

--------------yC5bohNtndtBwCMpIwyzed7v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVt3e0FAwAAAAAACgkQsN6d1ii/Ey8X
Owf/RXfpzUuoPmhDqLdkBIZ8xan1fvUtH8d6J7k/Ol8p2JY2ApYFjlaVdBjktjHXIn3grazR4LXu
Mz9KZ3P4pTAfOfNqydXqnYSiLM2Nb/5pIXof7nm9cRtjXOaOk1IBNdsvoXJq08UObsad8eHgocRr
aTpKX61zpzALCqotam8fuWXSs1NgiPSIrIkouXaqOeEB4XfGj+upfCp39dYCThsFKJB2TK5XN4xA
zxXchPzODqi5wSwhygWDT/qvjbZq41tKIReZeEcW6stQC3jBkpEArnIrs/eQEB4OKJuJfsSnKxrX
5qdArXbF9bjZCedRz/ZIZIpkTcetxbcB3PDWgQ7pOQ==
=fMtZ
-----END PGP SIGNATURE-----

--------------yC5bohNtndtBwCMpIwyzed7v--

