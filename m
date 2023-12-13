Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50149810A3A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 07:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653723.1020198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDIea-0006T4-9G; Wed, 13 Dec 2023 06:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653723.1020198; Wed, 13 Dec 2023 06:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDIea-0006RP-5e; Wed, 13 Dec 2023 06:23:32 +0000
Received: by outflank-mailman (input) for mailman id 653723;
 Wed, 13 Dec 2023 06:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7vuN=HY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rDIeY-0006RJ-K4
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 06:23:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20fd1715-9980-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 07:23:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 907281FD3B;
 Wed, 13 Dec 2023 06:23:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 546CC137E8;
 Wed, 13 Dec 2023 06:23:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8b1ME99NeWVWEgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Dec 2023 06:23:27 +0000
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
X-Inumbo-ID: 20fd1715-9980-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702448607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KDFeuLJyTK5PzLLtE5vASfd0/tLQd+ki6juLzbRUZ98=;
	b=NA2v0uvnOLqyuOjPT7/dKdgV00vnIvRlswKdRe9OIVPUoWti4/59lfYfyYwpDr3AkFmnYr
	GVU/HzKI5woBOEFDzFiZmrSnZcxw5YYlyu5O5zltXkOCHnbyil88e4KFRDb0zSUeUS1B8M
	H2grGz7zd4V769SO3xlI6R9EmZrKMGo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702448607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KDFeuLJyTK5PzLLtE5vASfd0/tLQd+ki6juLzbRUZ98=;
	b=NA2v0uvnOLqyuOjPT7/dKdgV00vnIvRlswKdRe9OIVPUoWti4/59lfYfyYwpDr3AkFmnYr
	GVU/HzKI5woBOEFDzFiZmrSnZcxw5YYlyu5O5zltXkOCHnbyil88e4KFRDb0zSUeUS1B8M
	H2grGz7zd4V769SO3xlI6R9EmZrKMGo=
Message-ID: <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
Date: Wed, 13 Dec 2023 07:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
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
In-Reply-To: <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WKk2qVpHJXSxLz1Z52Et2iE2"
X-Spam-Level: 
X-Spam-Score: -6.19
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-5.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: -5.99

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WKk2qVpHJXSxLz1Z52Et2iE2
Content-Type: multipart/mixed; boundary="------------iWUSR0tWUQi01lXyqFCaeIuu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
In-Reply-To: <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>

--------------iWUSR0tWUQi01lXyqFCaeIuu
Content-Type: multipart/mixed; boundary="------------FcIac008lxzNOZ00rjX5usD0"

--------------FcIac008lxzNOZ00rjX5usD0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjMgMjA6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEyLzEyLzIwMjMgMDk6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgYW5vdGhlciBmdW5jdGlvbiBsZXZlbCBpbiBzcGlubG9jay5jIGhpZGluZyB0aGUgc3Bp
bmxvY2tfdCBsYXlvdXQNCj4+IGZyb20gdGhlIGxvdyBsZXZlbCBsb2NraW5nIGNvZGUuDQo+
Pg0KPj4gVGhpcyBpcyBkb25lIGluIHByZXBhcmF0aW9uIG9mIGludHJvZHVjaW5nIHJzcGlu
bG9ja190IGZvciByZWN1cnNpdmUNCj4+IGxvY2tzIHdpdGhvdXQgaGF2aW5nIHRvIGR1cGxp
Y2F0ZSBhbGwgb2YgdGhlIGxvY2tpbmcgY29kZS4NCj4gDQo+IFNvIGFsbCB0aGUgZmllbGRz
IHlvdSBwYXNzIGFyZSB0aGUgb25lIGZyb20gc3BpbmxvY2suDQo+IA0KPiBMb29raW5nIGF0
IHBhaG9sZSBhZnRlciB0aGlzIHNlcmllcyBpcyBhcHBsaWQsIHdlIGhhdmU6DQo+IA0KPiA9
PT09IERlYnVnICsgTG9jayBwcm9maWxlID09PT0NCj4gDQo+IHN0cnVjdCBzcGlubG9jayB7
DQo+ICDCoMKgwqDCoMKgwqDCoCBzcGlubG9ja190aWNrZXRzX3TCoMKgwqDCoMKgwqDCoMKg
IHRpY2tldHM7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCAwwqDCoMKg
wqAgNCAqLw0KPiAgwqDCoMKgwqDCoMKgwqAgdW5pb24gbG9ja19kZWJ1Z8KgwqDCoMKgwqDC
oMKgwqDCoMKgIGRlYnVnO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDC
oMKgIDTCoMKgwqDCoCA0ICovDQo+ICDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbG9ja19wcm9m
aWxlICrCoMKgwqDCoMKgIHByb2ZpbGU7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyrC
oMKgwqDCoCA4wqDCoMKgwqAgOCAqLw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIC8qIHNpemU6
IDE2LCBjYWNoZWxpbmVzOiAxLCBtZW1iZXJzOiAzICovDQo+ICDCoMKgwqDCoMKgwqDCoCAv
KiBsYXN0IGNhY2hlbGluZTogMTYgYnl0ZXMgKi8NCj4gfTsNCj4gc3RydWN0IHJzcGlubG9j
ayB7DQo+ICDCoMKgwqDCoMKgwqDCoCBzcGlubG9ja190aWNrZXRzX3TCoMKgwqDCoMKgwqDC
oMKgIHRpY2tldHM7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCAwwqDC
oMKgwqAgNCAqLw0KPiAgwqDCoMKgwqDCoMKgwqAgdWludDE2X3TCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjdXJzZV9jcHU7wqDCoMKgwqDCoMKgwqDCoMKgIC8q
wqDCoMKgwqAgNMKgwqDCoMKgIDIgKi8NCj4gIMKgwqDCoMKgwqDCoMKgIHVpbnQ4X3TCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWN1cnNlX2NudDvCoMKgwqDC
oMKgwqDCoMKgwqAgLyrCoMKgwqDCoCA2wqDCoMKgwqAgMSAqLw0KPiANCj4gIMKgwqDCoMKg
wqDCoMKgIC8qIFhYWCAxIGJ5dGUgaG9sZSwgdHJ5IHRvIHBhY2sgKi8NCj4gDQo+ICDCoMKg
wqDCoMKgwqDCoCB1bmlvbiBsb2NrX2RlYnVnwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVidWc7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgOMKgwqDCoMKgIDQg
Ki8NCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCAvKiBYWFggNCBieXRlcyBob2xlLCB0cnkgdG8g
cGFjayAqLw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsb2NrX3Byb2ZpbGUgKsKg
wqDCoMKgwqAgcHJvZmlsZTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoCAx
NsKgwqDCoMKgIDggKi8NCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCAvKiBzaXplOiAyNCwgY2Fj
aGVsaW5lczogMSwgbWVtYmVyczogNSAqLw0KPiAgwqDCoMKgwqDCoMKgwqAgLyogc3VtIG1l
bWJlcnM6IDE5LCBob2xlczogMiwgc3VtIGhvbGVzOiA1ICovDQo+ICDCoMKgwqDCoMKgwqDC
oCAvKiBsYXN0IGNhY2hlbGluZTogMjQgYnl0ZXMgKi8NCj4gfTsNCj4gDQo+IA0KPiA9PT09
IERlYnVnID09PT0NCj4gDQo+IHN0cnVjdCBzcGlubG9jayB7DQo+ICDCoMKgwqDCoMKgwqDC
oCBzcGlubG9ja190aWNrZXRzX3TCoMKgwqDCoMKgwqDCoMKgIHRpY2tldHM7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCAwwqDCoMKgwqAgNCAqLw0KPiAgwqDCoMKg
wqDCoMKgwqAgdW5pb24gbG9ja19kZWJ1Z8KgwqDCoMKgwqDCoMKgwqDCoMKgIGRlYnVnO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDTCoMKgwqDCoCA0ICov
DQo+IA0KPiAgwqDCoMKgwqDCoMKgwqAgLyogc2l6ZTogOCwgY2FjaGVsaW5lczogMSwgbWVt
YmVyczogMiAqLw0KPiAgwqDCoMKgwqDCoMKgwqAgLyogbGFzdCBjYWNoZWxpbmU6IDggYnl0
ZXMgKi8NCj4gfTsNCj4gc3RydWN0IHJzcGlubG9jayB7DQo+ICDCoMKgwqDCoMKgwqDCoCBz
cGlubG9ja190aWNrZXRzX3TCoMKgwqDCoMKgwqDCoMKgIHRpY2tldHM7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCAwwqDCoMKgwqAgNCAqLw0KPiAgwqDCoMKgwqDC
oMKgwqAgdWludDE2X3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVj
dXJzZV9jcHU7wqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNMKgwqDCoMKgIDIgKi8N
Cj4gIMKgwqDCoMKgwqDCoMKgIHVpbnQ4X3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWN1cnNlX2NudDvCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCA2
wqDCoMKgwqAgMSAqLw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIC8qIFhYWCAxIGJ5dGUgaG9s
ZSwgdHJ5IHRvIHBhY2sgKi8NCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCB1bmlvbiBsb2NrX2Rl
YnVnwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVidWc7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC8qwqDCoMKgwqAgOMKgwqDCoMKgIDQgKi8NCj4gDQo+ICDCoMKgwqDCoMKgwqDC
oCAvKiBzaXplOiAxMiwgY2FjaGVsaW5lczogMSwgbWVtYmVyczogNCAqLw0KPiAgwqDCoMKg
wqDCoMKgwqAgLyogc3VtIG1lbWJlcnM6IDExLCBob2xlczogMSwgc3VtIGhvbGVzOiAxICov
DQo+ICDCoMKgwqDCoMKgwqDCoCAvKiBsYXN0IGNhY2hlbGluZTogMTIgYnl0ZXMgKi8NCj4g
fTsNCj4gDQo+ID09PT0gUHJvZCA9PT09DQo+IA0KPiBzdHJ1Y3Qgc3BpbmxvY2sgew0KPiAg
wqDCoMKgwqDCoMKgwqAgc3BpbmxvY2tfdGlja2V0c190wqDCoMKgwqDCoMKgwqDCoCB0aWNr
ZXRzO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgMMKgwqDCoMKgIDQg
Ki8NCj4gIMKgwqDCoMKgwqDCoMKgIHVuaW9uIGxvY2tfZGVidWfCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkZWJ1ZzvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCA0
wqDCoMKgwqAgMCAqLw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIC8qIHNpemU6IDQsIGNhY2hl
bGluZXM6IDEsIG1lbWJlcnM6IDIgKi8NCj4gIMKgwqDCoMKgwqDCoMKgIC8qIGxhc3QgY2Fj
aGVsaW5lOiA0IGJ5dGVzICovDQo+IH07DQo+IHN0cnVjdCByc3BpbmxvY2sgew0KPiAgwqDC
oMKgwqDCoMKgwqAgc3BpbmxvY2tfdGlja2V0c190wqDCoMKgwqDCoMKgwqDCoCB0aWNrZXRz
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgMMKgwqDCoMKgIDQgKi8N
Cj4gIMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJlY3Vyc2VfY3B1O8KgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDTC
oMKgwqDCoCAyICovDQo+ICDCoMKgwqDCoMKgwqDCoCB1aW50OF90wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjdXJzZV9jbnQ7wqDCoMKgwqDCoMKgwqDCoMKg
IC8qwqDCoMKgwqAgNsKgwqDCoMKgIDEgKi8NCj4gIMKgwqDCoMKgwqDCoMKgIHVuaW9uIGxv
Y2tfZGVidWfCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWJ1ZzvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLyrCoMKgwqDCoCA3wqDCoMKgwqAgMCAqLw0KPiANCj4gIMKgwqDCoMKg
wqDCoMKgIC8qIHNpemU6IDgsIGNhY2hlbGluZXM6IDEsIG1lbWJlcnM6IDQgKi8NCj4gIMKg
wqDCoMKgwqDCoMKgIC8qIHBhZGRpbmc6IDEgKi8NCj4gIMKgwqDCoMKgwqDCoMKgIC8qIGxh
c3QgY2FjaGVsaW5lOiA4IGJ5dGVzICovDQo+IH07DQo+IA0KPiANCj4gSSB0aGluayB3ZSBj
b3VsZCBlbWJlZCBzcGlubG9ja190IGluIHJzcGlubG9ja190IHdpdGhvdXQgaW5jcmVhc2lu
ZyByc3BpbmxvY2tfdC4gDQo+IEhhdmUgeW91IGNvbnNpZGVyZWQgaXQ/IFRoaXMgY291bGQg
cmVkdWNlIHRoZSBudW1iZXIgb2YgZnVuY3Rpb24gbGV2ZWwgDQo+IGludHJvZHVjZWQgaW4g
dGhpcyBzZXJpZXMuDQoNClRoYXQgd2FzIHRoZSBsYXlvdXQgaW4gdGhlIGZpcnN0IHZlcnNp
b24gb2YgdGhpcyBzZXJpZXMuIEphbiByZXF1ZXN0ZWQgdG8gY2hhbmdlDQppdCB0byB0aGUg
Y3VycmVudCBsYXlvdXQgWzFdLg0KDQoNCkp1ZXJnZW4NCg0KWzFdOiBodHRwczovL2xpc3Rz
Lnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMi0xMi9tc2cwMTA1NC5odG1s
DQo=
--------------FcIac008lxzNOZ00rjX5usD0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------FcIac008lxzNOZ00rjX5usD0--

--------------iWUSR0tWUQi01lXyqFCaeIuu--

--------------WKk2qVpHJXSxLz1Z52Et2iE2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV5Td8FAwAAAAAACgkQsN6d1ii/Ey+d
IAf/ZcBVzHXWES0UNnwBxuJ0NRe+EHROcRUBB5j6Jrk1lSl7GsDfnlJBydyIjm5g67313HHVt+bU
LTDFGgc7lADFj0aq44rKyh8qhVcoengA4M1jnrJBmg0PsTgdT02EslLaUfTtM3CDDk3C5CnaDuuW
HAvrKaCjnqBBQAeAxqPKP/IC7ban9oiGj1bXtR5pG04hf687Qq9uJvMr76M2t+9u08NErnZWRftp
YmYrgoG+ebM4ByLGvRDUr3DdHmwOakeXRX+QnzXdm0ZXv1XR2rZ9Np56c2omuVBDgWDA8H6AGZ0l
LmFY84Gd7UgBfvCbE91Qn7zXUTl68L4e2hi4fDS7JQ==
=D3av
-----END PGP SIGNATURE-----

--------------WKk2qVpHJXSxLz1Z52Et2iE2--

