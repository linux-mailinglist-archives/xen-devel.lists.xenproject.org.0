Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83885803557
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 14:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646948.1009635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9IE-0000ny-8q; Mon, 04 Dec 2023 13:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646948.1009635; Mon, 04 Dec 2023 13:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9IE-0000mH-55; Mon, 04 Dec 2023 13:47:26 +0000
Received: by outflank-mailman (input) for mailman id 646948;
 Mon, 04 Dec 2023 13:47:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rA9IC-0000ko-4J
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 13:47:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a349ccd5-92ab-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 14:47:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BED111FE65;
 Mon,  4 Dec 2023 13:47:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E2DD139AA;
 Mon,  4 Dec 2023 13:47:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7kgsIWTYbWUvJwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 13:47:16 +0000
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
X-Inumbo-ID: a349ccd5-92ab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701697636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M2Vk4y3Oo1U2EMkoE57mje0B9hMZ4tS+eZ2bsv0DZno=;
	b=AR7qjyZsVTT1OzdUxw/OgK8U63kbSF0oQ+LpyMyXYY8QyGbNUSLsfeyFdXwNaGnJC5jUCj
	kOZazSgIg477coGm6nA51CPADIou49cdxATFPG/L4H1nTCMEShZmSUA0H52xsuyKF96GH0
	fjQgRgmLG38srxOM+Dqk61wY742wA0A=
Message-ID: <7a3afb15-b7af-4fdc-bb16-bea46db6d3ed@suse.com>
Date: Mon, 4 Dec 2023 14:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
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
In-Reply-To: <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RIaMgdHfSJYWtb2GyHERhOVZ"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.99
X-Spamd-Result: default: False [-5.99 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RIaMgdHfSJYWtb2GyHERhOVZ
Content-Type: multipart/mixed; boundary="------------0K0HfKvtoeB0dZB5J2uByl4z";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Message-ID: <7a3afb15-b7af-4fdc-bb16-bea46db6d3ed@suse.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
In-Reply-To: <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>

--------------0K0HfKvtoeB0dZB5J2uByl4z
Content-Type: multipart/mixed; boundary="------------1mb3w4dsbCGInveQUpWUWf6O"

--------------1mb3w4dsbCGInveQUpWUWf6O
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
dmFyaWFibGVzLiBTZWUNCmF0dGFjaGVkIHBhdGNoLg0KDQpUaG91Z2h0cz8NCg0KDQpKdWVy
Z2VuDQo=
--------------1mb3w4dsbCGInveQUpWUWf6O
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1mb3w4dsbCGInveQUpWUWf6O--

--------------0K0HfKvtoeB0dZB5J2uByl4z--

--------------RIaMgdHfSJYWtb2GyHERhOVZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVt2GQFAwAAAAAACgkQsN6d1ii/Ey+M
DwgAm6g4zPNY7ZGa447+cjVklu6rmqiMLSOez9tnXM9TretY4GoHp7mr9ysjIpvbOEke5/Q/wX2r
XkqYOXokyTmuQAAhRCY+QDPgsbQ513h62+F3dea5h4CNArVusIREOFiwHJSjd3rir3Fd0tIwzEPS
Iu7SgQYVkoGCS5BRYj86ECR95WXIo4da9QtDeu8vh4Qb0i1l0udAxNXTbJLVkKgBnLNlrtFmoQGA
X8bF7OSr9+D/JeCRUGRJR0SgemBpj/EJCXa4OxjEDPAqu1WhF/yvCj1wCaCo7HhWd8DwZkRutZ22
4x0KPmf95AwHXcEjwD7FkGsCxE9c82nKPE5DPARd8w==
=RlN4
-----END PGP SIGNATURE-----

--------------RIaMgdHfSJYWtb2GyHERhOVZ--

