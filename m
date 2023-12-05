Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B628056FF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:17:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647938.1011733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWEO-0003Fr-PY; Tue, 05 Dec 2023 14:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647938.1011733; Tue, 05 Dec 2023 14:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWEO-0003EB-Md; Tue, 05 Dec 2023 14:17:00 +0000
Received: by outflank-mailman (input) for mailman id 647938;
 Tue, 05 Dec 2023 14:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAWEN-00039M-6b
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:16:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f25d4b08-9378-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:16:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6AB41FB3F;
 Tue,  5 Dec 2023 14:16:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7869E136CF;
 Tue,  5 Dec 2023 14:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KEsYHNYwb2XuTAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 14:16:54 +0000
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
X-Inumbo-ID: f25d4b08-9378-11ee-9b0f-b553b5be7939
Message-ID: <2ea05b0a-94b6-456a-bc3d-515471efa5aa@suse.com>
Date: Tue, 5 Dec 2023 15:16:53 +0100
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
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
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
In-Reply-To: <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XgQliq0SwO2etWWuYa8YV6bd"
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 NEURAL_HAM_SHORT(-0.05)[-0.275];
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
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: B6AB41FB3F
X-Spam-Flag: YES
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XgQliq0SwO2etWWuYa8YV6bd
Content-Type: multipart/mixed; boundary="------------d0pebPDkZljMXoZL2TAd0EIL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>
Message-ID: <2ea05b0a-94b6-456a-bc3d-515471efa5aa@suse.com>
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
In-Reply-To: <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>

--------------d0pebPDkZljMXoZL2TAd0EIL
Content-Type: multipart/mixed; boundary="------------EuHe299Q0QxFU6JztJZzOWWT"

--------------EuHe299Q0QxFU6JztJZzOWWT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTIuMjMgMTQ6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAw
NS8xMi8yMDIzIDEzOjQxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDUuMTIuMjMg
MTQ6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+Pj4g
T24gMDUvMTIvMjAyMyAxMjozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMDUu
MTIuMjMgMTI6NTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpIEp1ZXJnZW4sDQo+
Pj4+Pg0KPj4+Pj4gT24gMDUvMTIvMjAyMyAxMDowNywgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+Pj4+PiBJbnN0ZWFkIG9mIGRlZmluaW5nIGdldF91bmFsaWduZWQoKSBhbmQgcHV0X3Vu
YWxpZ25lZCgpIGluIGEgd2F5IHRoYXQNCj4+Pj4+PiBpcyBvbmx5IHN1cHBvcnRpbmcgYXJj
aGl0ZWN0dXJlcyBhbGxvd2luZyB1bmFsaWduZWQgYWNjZXNzZXMsIHVzZSB0aGUNCj4+Pj4+
PiBzYW1lIGFwcHJvYWNoIGFzIHRoZSBMaW51eCBrZXJuZWwgYW5kIGxldCB0aGUgY29tcGls
ZXIgZG8gdGhlDQo+Pj4+Pj4gZGVjaXNpb24gaG93IHRvIGdlbmVyYXRlIHRoZSBjb2RlIGZv
ciBwcm9iYWJseSB1bmFsaWduZWQgZGF0YSBhY2Nlc3Nlcy4NCj4+Pj4+Pg0KPj4+Pj4+IFVw
ZGF0ZSBpbmNsdWRlL3hlbi91bmFsaWduZWQuaCBmcm9tIGluY2x1ZGUvYXNtLWdlbmVyaWMv
dW5hbGlnbmVkLmggb2YNCj4+Pj4+PiB0aGUgTGludXgga2VybmVsLg0KPj4+Pj4+DQo+Pj4+
Pj4gVGhlIGdlbmVyYXRlZCBjb2RlIGhhcyBiZWVuIGNoZWNrZWQgdG8gYmUgdGhlIHNhbWUg
b24geDg2Lg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4NCj4+Pj4+PiBPcmlnaW46IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQgDQo+Pj4+Pj4gODAz
ZjRlMWVhYjdhDQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPg0KPj4+Pj4NCj4+Pj4+IENhbiB5b3Ugb3V0bGluZSB5b3VyIGVuZCBnb2Fs
PyBBdCBsZWFzdCBvbiBhcm0zMiwgSSBiZWxpZXZlIHRoaXMgd2lsbCANCj4+Pj4+IHJlc3Vs
dCB0byBhYm9ydCBiZWNhdXNlIGV2ZW50IGlmIHRoZSBhcmNoaXRlY3R1cmUgc3VwcG9ydCB1
bmFsaWduZWQgYWNjZXNzLCANCj4+Pj4+IHdlIGFyZSBwcmV2ZW50aW5nIHRoZW0gb24gQXJt
MzIuDQo+Pj4+DQo+Pj4+IEkgbmVlZCBzb21ldGhpbmcgbGlrZSB0aGF0IGluIFhlbiB0b29s
cyBmb3Igc3VwcG9ydGluZyBwYWNrZWQgZGF0YSBhY2Nlc3Nlcw0KPj4+PiBvbiB0aGUgOXBm
cyByaW5nIHBhZ2UsIHNvIEkgbG9va2VkIGludG8gdGhlIGh5cGVydmlzb3IgZm9yIHJlbGF0
ZWQgc3VwcG9ydC4NCj4+Pg0KPj4+IERpZCB3ZSByZWFsbHkgaW50cm9kdWNlIGFuIEFCSSBy
ZXF1aXJpbmcgdW5hbGlnbmVkIGFjY2Vzcz8/PyBPciBpcyB0aGlzIA0KPj4+IHNvbWV0aGlu
ZyB5b3UgYXJlIGNvbWluZyB1cCB3aXRoPw0KPj4NCj4+IFRoaXMgaXMgdGhlIDlwZnMgcHJv
dG9jb2wgKHNlZSBbMV0pLg0KPiANCj4gVXJnaCA6KC4NCj4gDQo+Pg0KPj4+IEFueXdheSwg
SUlSQyBMaW51eCBhbGxvd3MgdW5hbGlnbmVkIGFjY2Vzcy4gU28gdGhlIHByb2JsZW0gSSBh
bSBkZXNjcmliaW5nIGlzIA0KPj4+IG9ubHkgZm9yIHRoZSBoeXBlcnZpc29yLiBBbHRob3Vn
aCwgSSB3b3VsZCBsaWtlIHRvIHBvaW50IG91dCB0aGF0IHVuYWxpZ25lZCANCj4+PiBhY2Nl
c3MgaGFzIG5vIGF0b21pY2l0eSBndWFyYW50ZWUuIEkgYXNzdW1lIHRoaXMgaXMgbm90IGdv
aW5nIHRvIGJlIGEgY29uY2VybiANCj4+PiBmb3IgeW91Pw0KPj4NCj4+IENvcnJlY3QuDQo+
Pg0KPj4+DQo+Pj4+IEkgZ3Vlc3MgZm9yIGFybTMyIHVzaW5nIC1tbm8tdW5hbGlnbmVkLWFj
Y2VzcyB3aGVuIGJ1aWxkaW5nIHNob3VsZCBhdm9pZCBhbnkNCj4+Pj4gdW5hbGlnbmVkIGFj
Y2Vzc2VzPw0KPj4+DQo+Pj4gSSBhbSBub3Qgc3VyZS4gVGhpcyBpcyBpbXBsaWVzIHRoZSBj
b21waWxlciB3aWxsIGJlIGFibGUgdG8gaW5mZXIgdGhhdCB0aGUgDQo+Pj4gYWNjZXNzIHdp
bGwgYmUgdW5hbGlnbmVkLiBJcyB0aGlzIGFsd2F5cyB0aGUgY2FzZT8NCj4+DQo+PiBUaGlz
IHNob3VsZCBoYXBwZW4gdGhyb3VnaCB0aGUgIl9fcGFja2VkIiBhdHRyaWJ1dGUgb24gdGhl
IGFjY2VzcyBtYWNyb3MuIEFzDQo+PiBlLmcuIE1JUFMgZG9lc24ndCBzdXBwb3J0IHVuYWxp
Z25lZCBhY2Nlc3NlcywgYnV0IGlzIHdvcmtpbmcgd2l0aCB0aG9zZSBhY2Nlc3MNCj4+IG1h
Y3JvcyBpbiB0aGUgTGludXgga2VybmVsLCBJIHN1c3BlY3QgdGhlIGF0dHJpYnV0ZSBpcyBk
b2luZyBpdHMgam9iLg0KPiANCj4gU29tZW9uZSB3aWxsIG5lZWQgdG8gZGlnIGEgYml0IGRl
ZXBlciB0byBjb25maXJtIGFuZCBhbHNvIHRoZSBpbXBhY3Qgb24gdGhlIHJlc3QgDQo+IG9m
IHRoZSBoeXBlcnZpc29yLg0KPiANCj4+DQo+Pj4gQW55d2F5LCBnaXZlbiB5b3UgZG9uJ3Qg
c2VlbSB0byBoYXZlIGEgdXNlLWNhc2UgeWV0LCBJIHdvdWxkIHNpbXBseSB0byANCj4+PiBj
b25zaWRlciB0byBzdXJyb3VuZCB0aGUgZGVjbGFyYXRpb24gd2l0aCBhbiBhIGNvbmZpZyB3
aGljaCBjYW4gYmUgc2VsZWN0ZWQgDQo+Pj4gaWYgdW5hbGlnbmVkIGFjY2VzcyBpcyBzdXBw
b3J0ZWQuDQo+Pg0KPj4gTGlrZSBpbiB4ZW4vY29tbW9uL2x6by5jIGV0IGFsPw0KPiANCj4g
SnVzdCB0byBjbGFyaWZ5LCBJIGFtIHN1Z2dlc3RpbmcgdG8gYWRkIGluIHVuYWxpZ25lZC5o
Og0KPiANCj4gI2lmZGVmIENPTkZJR19IQVNfVU5BTElHTkVEX0FDQ0VTUw0KPiANCj4geW91
ciBkZWZpbml0aW9ucw0KPiANCj4gI2VuZGlmDQo+IA0KPiBBbmQgdGhlbiBmb3IgWDg2LCBz
ZWxlY3QgQ09ORklHX0hBU19VTkFMSUdORURfQUNDRVNTLg0KPiANCj4gIMKgVGhvc2UgYXJl
IGNvbXBpbGVkIHdpdGggQ09ORklHX1g4NiBvbmx5DQo+PiB0b2RheSwNCj4+IGJ1dCBJIGd1
ZXNzIG90aGVyIGFyY2hzIG1pZ2h0IG5lZWQgdGhlIGRlY29tcHJlc3NvcnMgaW4gZnV0dXJl
LCB0b28uDQo+IFBvc3NpYmx5IHllcy4gQnV0IG15IHBvaW50IGlzIHRoYXQgeW91IGRvbid0
IGhhdmUgdG8gc29sdmUgdGhlIHByb2JsZW0gdG9kYXkuIA0KPiBZZXQgSSBkb24ndCB0aGlu
ayBpdCBpcyB3aXNlIHRvIGFsbG93IHRoZSBoZWFkZXIgdG8gYmUgdXNlZCBvbiBhcm0zMiB1
bnRpbCB3ZSANCj4gaGF2ZSBkb25lIHNvbWUgaW52ZXN0aWdhdGlvbi4NCj4gDQo+IEFuZCB0
byBjbGFyaWZ5LCBJIGFtIG5vdCBhc2tpbmcgeW91IHRvIGRvIHRoZSBpbnZlc3RpZ2F0aW9u
Lg0KDQpJJ3ZlIGRvbmUgYSBxdWljayB2ZXJpZmljYXRpb24gdXNpbmcgZ2NjIDcuNS4NCg0K
VXNpbmcgLW1uby11bmFsaWduZWQtYWNjZXNzIGZvciAzMi1iaXQgQXJtIHNlZW1zIHRvIGRv
IHRoZSBqb2I6DQoNCiNpbmNsdWRlIDx4ZW4vdW5hbGlnbmVkLmg+DQppbnQgdHN0KGNvbnN0
IHVuc2lnbmVkIHNob3J0ICppbikNCnsNCiAgICAgcmV0dXJuIGdldF91bmFsaWduZWQoaW4p
Ow0KfQ0KDQpyZXN1bHRzIGluOg0KDQowMDAwMDAwMCA8dHN0PjoNCiAgICAwOiAgIGU1MmRi
MDA0ICAgICAgICBwdXNoICAgIHtmcH0gICAgICAgICAgICBAIChzdHIgZnAsIFtzcCwgIy00
XSEpDQogICAgNDogICBlMjhkYjAwMCAgICAgICAgYWRkICAgICBmcCwgc3AsICMwDQogICAg
ODogICBlNWQwMzAwMCAgICAgICAgbGRyYiAgICByMywgW3IwXQ0KICAgIGM6ICAgZTVkMDAw
MDEgICAgICAgIGxkcmIgICAgcjAsIFtyMCwgIzFdDQogICAxMDogICBlMTgzMDQwMCAgICAg
ICAgb3JyICAgICByMCwgcjMsIHIwLCBsc2wgIzgNCiAgIDE0OiAgIGUyOGJkMDAwICAgICAg
ICBhZGQgICAgIHNwLCBmcCwgIzANCiAgIDE4OiAgIGU0OWRiMDA0ICAgICAgICBwb3AgICAg
IHtmcH0gICAgICAgICAgICBAIChsZHIgZnAsIFtzcF0sICM0KQ0KICAgMWM6ICAgZTEyZmZm
MWUgICAgICAgIGJ4ICAgICAgbHINCg0KV2l0aG91dCB0aGUgLW1uby11bmFsaWduZWQtYWNj
ZXNzIEknbSBnZXR0aW5nOg0KDQowMDAwMDAwMCA8dHN0PjoNCiAgICAwOiAgIGU1MmRiMDA0
ICAgICAgICBwdXNoICAgIHtmcH0gICAgICAgICAgICBAIChzdHIgZnAsIFtzcCwgIy00XSEp
DQogICAgNDogICBlMjhkYjAwMCAgICAgICAgYWRkICAgICBmcCwgc3AsICMwDQogICAgODog
ICBlMWQwMDBiMCAgICAgICAgbGRyaCAgICByMCwgW3IwXQ0KICAgIGM6ICAgZTI4YmQwMDAg
ICAgICAgIGFkZCAgICAgc3AsIGZwLCAjMA0KICAgMTA6ICAgZTQ5ZGIwMDQgICAgICAgIHBv
cCAgICAge2ZwfSAgICAgICAgICAgIEAgKGxkciBmcCwgW3NwXSwgIzQpDQogICAxNDogICBl
MTJmZmYxZSAgICAgICAgYnggICAgICBscg0KDQoNCkp1ZXJnZW4NCg==
--------------EuHe299Q0QxFU6JztJZzOWWT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------EuHe299Q0QxFU6JztJZzOWWT--

--------------d0pebPDkZljMXoZL2TAd0EIL--

--------------XgQliq0SwO2etWWuYa8YV6bd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVvMNYFAwAAAAAACgkQsN6d1ii/Ey8y
rgf+JwbBYrfGoEOXM9KFjExvvMG8C/GzhOQ+Jf/eYWYfr/CsDFLVa61CWOztMpCW+qzl6xs+KCHx
t+cHTiZIAkcU82IQObdH4JlD+n/3kfONKPDwza8dKbZRxEkOXsEbTTORxyEg4xepa6qvdtFJKErC
QEq1LwmXnj3LjYIh2pgLh74/W1iXwgJNeesZmIzqdMnFV+pJv9430MvTVi+o/czw7DytyV/Hs8v0
NGsvDLWtrJ79fsL9tdTDHx052hXsUmf86kYBiAek4MRSjevjsXs64IYf+RjbViOdUFtq/D0Yj6zs
dewOSm+z8MopEECNOwFkQ6jm1MkwdiEmMxCzEfIV5w==
=Kj7s
-----END PGP SIGNATURE-----

--------------XgQliq0SwO2etWWuYa8YV6bd--

