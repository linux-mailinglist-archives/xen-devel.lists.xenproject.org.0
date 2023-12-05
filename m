Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C73D80563D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647881.1011573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVfo-00010K-9q; Tue, 05 Dec 2023 13:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647881.1011573; Tue, 05 Dec 2023 13:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVfo-0000yg-6A; Tue, 05 Dec 2023 13:41:16 +0000
Received: by outflank-mailman (input) for mailman id 647881;
 Tue, 05 Dec 2023 13:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAVfn-0000yK-8J
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:41:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f45e975d-9373-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 14:41:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E7C11F8BE;
 Tue,  5 Dec 2023 13:41:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DDA5A1386E;
 Tue,  5 Dec 2023 13:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CDDBNHcob2VFOgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 13:41:11 +0000
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
X-Inumbo-ID: f45e975d-9373-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701783672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+y8XUWNf7xOIEJZbYM72amkPH7x7C6Hzt6Zdl/smweI=;
	b=FtL+cZr1VraSYWrMXjfWasSc0H2MB1WNRid+8PPAMZrg4CqVQnatzsT2CF8GAo0VNLabOH
	xzOY/14qLx1BX2zdbHBRNBlxediwVWIKKr+F4kkpFoCyU/LnVkqNzqrpn19WBVGyoRRCXo
	OVKZ0bb8Psq6e7/SXxxbJcSiuArjf2I=
Message-ID: <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
Date: Tue, 5 Dec 2023 14:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
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
In-Reply-To: <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FP7WiuE8V9g9xlZoydSa2664"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.15
X-Spamd-Result: default: False [-4.15 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.16)[-0.803];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
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
--------------FP7WiuE8V9g9xlZoydSa2664
Content-Type: multipart/mixed; boundary="------------XjY4muYZW3IALh5t0V096L6x";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>
Message-ID: <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
In-Reply-To: <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>

--------------XjY4muYZW3IALh5t0V096L6x
Content-Type: multipart/mixed; boundary="------------0jKTJDYJx0e3bJRYUXf1ol4e"

--------------0jKTJDYJx0e3bJRYUXf1ol4e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTIuMjMgMTQ6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA1LzEyLzIwMjMgMTI6MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwNS4xMi4yMyAxMjo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAwNS8xMi8yMDIzIDEwOjA3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBJbnN0ZWFkIG9mIGRlZmluaW5nIGdldF91bmFsaWduZWQoKSBhbmQgcHV0X3VuYWxp
Z25lZCgpIGluIGEgd2F5IHRoYXQNCj4+Pj4gaXMgb25seSBzdXBwb3J0aW5nIGFyY2hpdGVj
dHVyZXMgYWxsb3dpbmcgdW5hbGlnbmVkIGFjY2Vzc2VzLCB1c2UgdGhlDQo+Pj4+IHNhbWUg
YXBwcm9hY2ggYXMgdGhlIExpbnV4IGtlcm5lbCBhbmQgbGV0IHRoZSBjb21waWxlciBkbyB0
aGUNCj4+Pj4gZGVjaXNpb24gaG93IHRvIGdlbmVyYXRlIHRoZSBjb2RlIGZvciBwcm9iYWJs
eSB1bmFsaWduZWQgZGF0YSBhY2Nlc3Nlcy4NCj4+Pj4NCj4+Pj4gVXBkYXRlIGluY2x1ZGUv
eGVuL3VuYWxpZ25lZC5oIGZyb20gaW5jbHVkZS9hc20tZ2VuZXJpYy91bmFsaWduZWQuaCBv
Zg0KPj4+PiB0aGUgTGludXgga2VybmVsLg0KPj4+Pg0KPj4+PiBUaGUgZ2VuZXJhdGVkIGNv
ZGUgaGFzIGJlZW4gY2hlY2tlZCB0byBiZSB0aGUgc2FtZSBvbiB4ODYuDQo+Pj4+DQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+Pj4+IE9y
aWdpbjogZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdCANCj4+Pj4gODAzZjRlMWVhYjdhDQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pg0KPj4+IENhbiB5b3Ug
b3V0bGluZSB5b3VyIGVuZCBnb2FsPyBBdCBsZWFzdCBvbiBhcm0zMiwgSSBiZWxpZXZlIHRo
aXMgd2lsbCByZXN1bHQgDQo+Pj4gdG8gYWJvcnQgYmVjYXVzZSBldmVudCBpZiB0aGUgYXJj
aGl0ZWN0dXJlIHN1cHBvcnQgdW5hbGlnbmVkIGFjY2Vzcywgd2UgYXJlIA0KPj4+IHByZXZl
bnRpbmcgdGhlbSBvbiBBcm0zMi4NCj4+DQo+PiBJIG5lZWQgc29tZXRoaW5nIGxpa2UgdGhh
dCBpbiBYZW4gdG9vbHMgZm9yIHN1cHBvcnRpbmcgcGFja2VkIGRhdGEgYWNjZXNzZXMNCj4+
IG9uIHRoZSA5cGZzIHJpbmcgcGFnZSwgc28gSSBsb29rZWQgaW50byB0aGUgaHlwZXJ2aXNv
ciBmb3IgcmVsYXRlZCBzdXBwb3J0Lg0KPiANCj4gRGlkIHdlIHJlYWxseSBpbnRyb2R1Y2Ug
YW4gQUJJIHJlcXVpcmluZyB1bmFsaWduZWQgYWNjZXNzPz8/IE9yIGlzIHRoaXMgDQo+IHNv
bWV0aGluZyB5b3UgYXJlIGNvbWluZyB1cCB3aXRoPw0KDQpUaGlzIGlzIHRoZSA5cGZzIHBy
b3RvY29sIChzZWUgWzFdKS4NCg0KPiBBbnl3YXksIElJUkMgTGludXggYWxsb3dzIHVuYWxp
Z25lZCBhY2Nlc3MuIFNvIHRoZSBwcm9ibGVtIEkgYW0gZGVzY3JpYmluZyBpcyANCj4gb25s
eSBmb3IgdGhlIGh5cGVydmlzb3IuIEFsdGhvdWdoLCBJIHdvdWxkIGxpa2UgdG8gcG9pbnQg
b3V0IHRoYXQgdW5hbGlnbmVkIA0KPiBhY2Nlc3MgaGFzIG5vIGF0b21pY2l0eSBndWFyYW50
ZWUuIEkgYXNzdW1lIHRoaXMgaXMgbm90IGdvaW5nIHRvIGJlIGEgY29uY2VybiANCj4gZm9y
IHlvdT8NCg0KQ29ycmVjdC4NCg0KPiANCj4+IEkgZ3Vlc3MgZm9yIGFybTMyIHVzaW5nIC1t
bm8tdW5hbGlnbmVkLWFjY2VzcyB3aGVuIGJ1aWxkaW5nIHNob3VsZCBhdm9pZCBhbnkNCj4+
IHVuYWxpZ25lZCBhY2Nlc3Nlcz8NCj4gDQo+IEkgYW0gbm90IHN1cmUuIFRoaXMgaXMgaW1w
bGllcyB0aGUgY29tcGlsZXIgd2lsbCBiZSBhYmxlIHRvIGluZmVyIHRoYXQgdGhlIA0KPiBh
Y2Nlc3Mgd2lsbCBiZSB1bmFsaWduZWQuIElzIHRoaXMgYWx3YXlzIHRoZSBjYXNlPw0KDQpU
aGlzIHNob3VsZCBoYXBwZW4gdGhyb3VnaCB0aGUgIl9fcGFja2VkIiBhdHRyaWJ1dGUgb24g
dGhlIGFjY2VzcyBtYWNyb3MuIEFzDQplLmcuIE1JUFMgZG9lc24ndCBzdXBwb3J0IHVuYWxp
Z25lZCBhY2Nlc3NlcywgYnV0IGlzIHdvcmtpbmcgd2l0aCB0aG9zZSBhY2Nlc3MNCm1hY3Jv
cyBpbiB0aGUgTGludXgga2VybmVsLCBJIHN1c3BlY3QgdGhlIGF0dHJpYnV0ZSBpcyBkb2lu
ZyBpdHMgam9iLg0KDQo+IEFueXdheSwgZ2l2ZW4geW91IGRvbid0IHNlZW0gdG8gaGF2ZSBh
IHVzZS1jYXNlIHlldCwgSSB3b3VsZCBzaW1wbHkgdG8gY29uc2lkZXIgDQo+IHRvIHN1cnJv
dW5kIHRoZSBkZWNsYXJhdGlvbiB3aXRoIGFuIGEgY29uZmlnIHdoaWNoIGNhbiBiZSBzZWxl
Y3RlZCBpZiB1bmFsaWduZWQgDQo+IGFjY2VzcyBpcyBzdXBwb3J0ZWQuDQoNCkxpa2UgaW4g
eGVuL2NvbW1vbi9sem8uYyBldCBhbD8gVGhvc2UgYXJlIGNvbXBpbGVkIHdpdGggQ09ORklH
X1g4NiBvbmx5IHRvZGF5LA0KYnV0IEkgZ3Vlc3Mgb3RoZXIgYXJjaHMgbWlnaHQgbmVlZCB0
aGUgZGVjb21wcmVzc29ycyBpbiBmdXR1cmUsIHRvby4NCg0KDQpKdWVyZ2VuDQoNClsxXTog
aHR0cDovL2VyaWN2aC5naXRodWIuaW8vOXAtcmZjL3JmYzlwMjAwMC5odG1sDQo=
--------------0jKTJDYJx0e3bJRYUXf1ol4e
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0jKTJDYJx0e3bJRYUXf1ol4e--

--------------XjY4muYZW3IALh5t0V096L6x--

--------------FP7WiuE8V9g9xlZoydSa2664
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVvKHcFAwAAAAAACgkQsN6d1ii/Ey8U
mAf9HzBoCEbP8iWxhaceGsFWdDboVmto7Z8+0GMjtFZzlykijhOSssZywD0ih04aCkmYqCzz5g0d
XdCWGBGYa1a9ueLjVDYItxmhHSL8UO34ipvReYJ5qhRnJqwAOIpgOc1r2lOcx0ksU3u2WRZZJuMz
qNgIzeIU3fdMdUOTiKmCPYuyR6ewyV9eR2ix6rcPSGxUTLrUVg5vBq6vqeZhddLVczGAXIDsGbqF
gIvssRvKbghBQOWa0Fl78uQROLStN5REoOejX1hVdGSrIbp+dOvp7uxsKlAJ1AywMAp15tCy2f5w
aNPY6I0+YBNCRNs7UjF/ompG3W8Xo+fLR1tefvZBgw==
=zdFx
-----END PGP SIGNATURE-----

--------------FP7WiuE8V9g9xlZoydSa2664--

