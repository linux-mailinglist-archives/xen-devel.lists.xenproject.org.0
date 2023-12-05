Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A38059FB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 17:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648135.1012183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYKm-0006hy-TA; Tue, 05 Dec 2023 16:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648135.1012183; Tue, 05 Dec 2023 16:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYKm-0006g1-Ox; Tue, 05 Dec 2023 16:31:44 +0000
Received: by outflank-mailman (input) for mailman id 648135;
 Tue, 05 Dec 2023 16:31:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAYKl-0006Eh-0c
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 16:31:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4dd1edc-938b-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 17:31:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 61C8921AA8;
 Tue,  5 Dec 2023 16:31:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B263136CF;
 Tue,  5 Dec 2023 16:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WoXmBGxQb2UXfAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 16:31:40 +0000
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
X-Inumbo-ID: c4dd1edc-938b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701793900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AZUyiMLf1cVFVdWtphcOxGdGMKf30yKz7n0/SXzmXAE=;
	b=T0j5JSGAajZTAlvWEYzQra+YsjqJiMEpgOhBh8OZ5X0Od/0BrorLo456nI74Ft/yrPaVHw
	jiw5cz2v7RZ1p+Wfr7JHNGb6bNr6Ik9GhFEuqc0fIGJCrgyLFk5SjYxQj7dQomxXbwphsH
	l4nVqSBWxcKq4N/eyYvl13kBAha6Des=
Message-ID: <c506544c-c277-451f-89b3-44e4bef47d52@suse.com>
Date: Tue, 5 Dec 2023 17:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
To: Julien Grall <julien@xen.org>, Arnd Bergmann <arnd@arndb.de>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
 <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
 <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
 <5a05e194-28d1-409d-9f45-ca4de0fc78c8@app.fastmail.com>
 <fcdab8c1-b0ea-4d7a-943e-2180b13234fd@xen.org>
 <ab8c9daa-9543-4aed-85f7-69febd85aeb9@app.fastmail.com>
 <4e56e585-c5f9-4290-94d3-c0a6789188b4@xen.org>
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
In-Reply-To: <4e56e585-c5f9-4290-94d3-c0a6789188b4@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VHfwC0NKOpbGZ040lQTJbx20"
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: -4.19
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VHfwC0NKOpbGZ040lQTJbx20
Content-Type: multipart/mixed; boundary="------------y6zFTsEx8eUTCRXtzbHzmRU9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Arnd Bergmann <arnd@arndb.de>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <c506544c-c277-451f-89b3-44e4bef47d52@suse.com>
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
 <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
 <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
 <5a05e194-28d1-409d-9f45-ca4de0fc78c8@app.fastmail.com>
 <fcdab8c1-b0ea-4d7a-943e-2180b13234fd@xen.org>
 <ab8c9daa-9543-4aed-85f7-69febd85aeb9@app.fastmail.com>
 <4e56e585-c5f9-4290-94d3-c0a6789188b4@xen.org>
In-Reply-To: <4e56e585-c5f9-4290-94d3-c0a6789188b4@xen.org>

--------------y6zFTsEx8eUTCRXtzbHzmRU9
Content-Type: multipart/mixed; boundary="------------Y554ay3lbu0ieHzJobkXsIHh"

--------------Y554ay3lbu0ieHzJobkXsIHh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTIuMjMgMTc6MjksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgQXJuZCwNCj4g
DQo+IE9uIDA1LzEyLzIwMjMgMTQ6MzcsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+PiBPbiBU
dWUsIERlYyA1LCAyMDIzLCBhdCAxNToxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IE9u
IDA1LzEyLzIwMjMgMTQ6MTAsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4+IE9uIFR1ZSwg
RGVjIDUsIDIwMjMsIGF0IDE1OjAxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBPbiAw
NS8xMi8yMDIzIDEzOjU5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAwNS4xMi4y
MDIzIDE0OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+IFRoaXMgd291bGQgcmVwZWF0
IHRoZSBtaXN0YWtlIHRoYXQgd2UgaGFkIGluIExpbnV4IGluIHRoZQ0KPj4+PiBwYXN0IChh
bmQgc3RpbGwgZG8gaW4gc29tZSBkcml2ZXJzKTogU2ltcGx5IGRlcmVmZXJlbmNpbmcNCj4+
Pj4gYSBtaXNhbGlnbmVkIHBvaW50ZXIgaXMgYWx3YXlzIGEgYnVnLCBldmVuIG9uIGFyY2hp
dGVjdHVyZXMNCj4+Pj4gdGhhdCBoYXZlIGVmZmljaWVudCB1bmFsaWduZWQgbG9hZC9zdG9y
ZSBpbnN0cnVjdGlvbnMsDQo+Pj4+IGJlY2F1c2UgQyBtYWtlcyB0aGlzIHVuZGVmaW5lZCBi
ZWhhdmlvciBhbmQgZ2NjIGhhcw0KPj4+PiBvcHRpbWl6YXRpb25zIHRoYXQgYXNzdW1lIGUu
Zy4gJ2ludCAqJyB0byBuZXZlciBoYXZlDQo+Pj4+IHRoZSBsb3dlciB0d28gYml0cyBzZXQg
WzFdLg0KPj4+DQo+Pj4gSnVzdCB0byBjbGFyaWZ5LCBJIGhhdmVuJ3Qgc3VnZ2VzdGVkIHRv
IHVzZSAnaW50IConLiBNeSBwb2ludCB3YXMgbW9yZQ0KPj4+IHRoYXQgSSBkb24ndCB0aGlu
ayB0aGF0IHRoZSBoZWxwZXJzIHdvdWxkIHdvcmsgYXMtaXMgb24gYXJtMzIgYmVjYXVzZQ0K
Pj4+IGV2ZW4gaWYgdGhlIElTQSBhbGxvd3MgYSBkaXJlY3QgYWNjZXNzLCB3ZSBhcmUgc2V0
dGluZyB0aGUgYml0IGluIFNDVExSDQo+Pj4gdG8gZGlzYWJsZSB1bmFsaWduZWQgYWNjZXNz
Lg0KPj4+DQo+Pj4gQXMgSnVlcmdlbiBpcyBwcm9wb3NpbmcgYSBjb21tb24gaGVhZGVyLCB0
aGVuIEkgY291bGQgYXNrIGhpbSB0byBkbyB0aGUNCj4+PiB3b3JrIHRvIGNvbmZpcm0gdGhh
dCB0aGUgaGVscGVycyBwcm9wZXJseSB3b3JrIG9uIGFybTMyLiBCdXQgSSB0aGluaw0KPj4+
IHRoaXMgaXMgdW5mYWlyLg0KPj4NCj4+IFdoZW4gSSBpbnRyb2R1Y2VkIHRoZSBoZWxwZXJz
IGluIExpbnV4LCBJIHNob3dlZCB0aGF0IHRoZXNlDQo+PiBwcm9kdWNlIHRoZSBiZXN0IG91
dHB1dCBvbiBhbGwgbW9kZXJuIGNvbXBpbGVycyAoYXQgbGVhc3QgZ2NjLTUsDQo+PiBwcm9i
YWJseSBlYXJsaWVyKSBmb3IgYm90aCBhcmNoaXRlY3R1cmVzIHRoYXQgYWxsb3cgdW5hbGln
bmVkDQo+PiBhY2Nlc3MgYW5kIGZvciB0aG9zZSB0aGF0IGRvbid0LiBXZSB1c2VkIHRvIGhh
dmUgYXJjaGl0ZWN0dXJlDQo+PiBzcGVjaWZpYyBoZWxwZXJzIGRlcGVuZGluZyBvbiB3aGF0
IGVhY2ggYXJjaGl0ZWN0dXJlIGNvdWxkDQo+PiBkbywgYnV0IGFsbCB0aGUgb3RoZXIgdmFy
aWFudHMgd2UgaGFkIHdlcmUgZWl0aGVyIHdyb25nIG9yDQo+PiBsZXNzIGVmZmljaWVudC4N
Cj4+DQo+PiBJZiBmb3Igc29tZSByZWFzb24gYW4gQXJtIHN5c3RlbSBpcyBjb25maWd1cmVk
IHRvIHRyYXANCj4+IGFsbCB1bmFsaWduZWQgYWNjZXNzLCB0aGVuIHlvdSBtdXN0IGFscmVh
ZHkgcGFzcw0KPj4gLW1uby11bmFsaWduZWQtYWNjZXNzIHRvIHRoZSBjb21waWxlciB0byBw
cmV2ZW50IGNlcnRhaW4NCj4+IG9wdGltaXphdGlvbnMsIGFuZCB0aGVuIHRoZSBoZWxwZXJz
IHdpbGwgc3RpbGwgYmVoYXZlDQo+PiBjb3JyZWN0bHkgKHRoZSBzYW1lIHdheSB0aGV5IGRv
IG9uIGFybXY1LCB3aGljaCBuZXZlciBoYXMNCj4+IHVuYWxpZ25lZCBhY2Nlc3MpLiBPbiBh
cm12NyB3aXRoIC1tdW5hbGlnbmVkLWFjY2VzcywgdGhlDQo+PiBzYW1lIGZ1bmN0aW9ucyBv
bmx5IHByZXZlbnQgdGhlIHVzZSBvZiBzdG0vbGRtIGFuZCBzdHJkL2xkcmQNCj4+IGJ1dCBz
dGlsbCB1c2UgbGRyL3N0ci4NCj4gDQo+IFVuZm9ydHVuYXRlbHkgd2UgZG9uJ3QgZXhwbGlj
aXRlbHkgZG8uIFRoaXMgd291bGQgZXhwbGFpbiB3aHkgSSBzYXcgc29tZSBpc3N1ZXMgDQo+
IHdpdGggY2VydGFpbiBjb21waWxlciBbMV0uDQo+IA0KPiBTbyBJIGFncmVlIHRoYXQgYWRk
aW5nIC1tbm8tdW5hbGlnbmVkLWFjY2VzcyBmb3IgYXJtMzIgbWFrZXMgc2Vuc2UuDQo+IA0K
PiBASnVlcmdlbiwgZG8geW91IHdhbnQgbWUgdG8gc2VuZCBhIHBhdGNoPw0KDQpZZXMsIHdp
bGwgZG8uDQoNCg0KSnVlcmdlbg0KDQo=
--------------Y554ay3lbu0ieHzJobkXsIHh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Y554ay3lbu0ieHzJobkXsIHh--

--------------y6zFTsEx8eUTCRXtzbHzmRU9--

--------------VHfwC0NKOpbGZ040lQTJbx20
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVvUGsFAwAAAAAACgkQsN6d1ii/Ey/M
EQf+IgIIgB/hR1vyEfm5kKBFIIXhJc7/1UNU2YByy+0eGbaxeIHRIviZ6+7q/5JE8hRYE0ZB4rDp
ri8UYd4eRaL/DKtG62Ph0tn8pHuwRfREulY/Jq3izADPDQiayA5vNfZO9FHO4BGvfrF8+lyKqTHE
CukycKN5sEQTQkw3CSoqowgThCoWYJ8VYtvgUJAKpeHIPIQlVTNfZ6OS8o7OYQzxxGvH5/Uyh6n7
sIQFc7OrKvV5+M4nXRlQmmUTzu5PXVP5wahbXZBM7KeuWsHrdXzr9EYZ+n7v0toANWJ1Hu9Oqtdf
+3mUVmO3GSCeOZk6Yd3esRbBgouhkQfEV+KZ2s3ljA==
=yBkf
-----END PGP SIGNATURE-----

--------------VHfwC0NKOpbGZ040lQTJbx20--

