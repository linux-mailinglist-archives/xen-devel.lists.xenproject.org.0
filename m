Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6547EEC9A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 08:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634848.990396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3tAh-0003vh-9o; Fri, 17 Nov 2023 07:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634848.990396; Fri, 17 Nov 2023 07:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3tAh-0003tI-6D; Fri, 17 Nov 2023 07:21:47 +0000
Received: by outflank-mailman (input) for mailman id 634848;
 Fri, 17 Nov 2023 07:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFzC=G6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r3tAg-0003tC-2r
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 07:21:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f52b4f2a-8519-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 08:21:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C1291F892;
 Fri, 17 Nov 2023 07:21:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2814B1341F;
 Fri, 17 Nov 2023 07:21:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eBryB4YUV2XiCwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Nov 2023 07:21:42 +0000
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
X-Inumbo-ID: f52b4f2a-8519-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700205702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XqJJCcaOxi8EZnK0eUZ0U8e2Znkt2ZE8S5yu5zscoNc=;
	b=dhnNKaap6DJmP64lVB61cEO2V/SnY2onmCNvtJDAP9Wqv9nUbfX73LoJb67z24IXLOuVQS
	zv+7tar8wxCJy/1NJRLkcA1hd2p2fDK6vgXf3zDKoXN4i8cMviWO8t8XgKD+r+/zMUrxtS
	UmIHlcheqTbFfiFpxem+ru+0GYF0ye8=
Message-ID: <c4fa979d-30a2-4a19-a5da-f76fe02e4597@suse.com>
Date: Fri, 17 Nov 2023 08:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: fix sched_move_domain()
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231114133003.20887-1-jgross@suse.com>
 <CA+zSX=YW4ezSGD_Wf8LiOznTxQgdjLaQddzV7G7Udi5qayVDUA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=YW4ezSGD_Wf8LiOznTxQgdjLaQddzV7G7Udi5qayVDUA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PfjC06I3ih72BinweI7GZPl0"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.17
X-Spamd-Result: default: False [-6.17 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-0.98)[-0.980];
	 BAYES_HAM(-3.00)[100.00%];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PfjC06I3ih72BinweI7GZPl0
Content-Type: multipart/mixed; boundary="------------KYY3zIdq4IA2EpDEIDbWoRof";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
 Henry Wang <Henry.Wang@arm.com>
Message-ID: <c4fa979d-30a2-4a19-a5da-f76fe02e4597@suse.com>
Subject: Re: [PATCH v2] xen/sched: fix sched_move_domain()
References: <20231114133003.20887-1-jgross@suse.com>
 <CA+zSX=YW4ezSGD_Wf8LiOznTxQgdjLaQddzV7G7Udi5qayVDUA@mail.gmail.com>
In-Reply-To: <CA+zSX=YW4ezSGD_Wf8LiOznTxQgdjLaQddzV7G7Udi5qayVDUA@mail.gmail.com>

--------------KYY3zIdq4IA2EpDEIDbWoRof
Content-Type: multipart/mixed; boundary="------------v6OyaVXpcpK9jPvQRHiiacYA"

--------------v6OyaVXpcpK9jPvQRHiiacYA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTEuMjMgMTc6NDgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIFR1ZSwgTm92
IDE0LCAyMDIzIGF0IDE6MzDigK9QTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IFdoZW4gbW92aW5nIGEgZG9tYWluIG91dCBvZiBhIGNwdXBvb2wg
cnVubmluZyB3aXRoIHRoZSBjcmVkaXQyDQo+PiBzY2hlZHVsZXIgYW5kIGhhdmluZyBtdWx0
aXBsZSBydW4tcXVldWVzLCB0aGUgZm9sbG93aW5nIEFTU0VSVCgpIGNhbg0KPj4gYmUgb2Jz
ZXJ2ZWQ6DQo+Pg0KPj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+PiAoWEVOKSAgICBbPGZm
ZmY4MmQwNDAyM2E3MDA+XSBSIGNyZWRpdDIuYyNjc2NoZWQyX3VuaXRfcmVtb3ZlKzB4ZTMv
MHhlNw0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjQ2YWRiPl0gUyBzY2hlZF9tb3ZlX2Rv
bWFpbisweDJmMy8weDViMQ0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjM0Y2Y3Pl0gUyBj
cHVwb29sLmMjY3B1cG9vbF9tb3ZlX2RvbWFpbl9sb2NrZWQrMHgxZC8weDNiDQo+PiAoWEVO
KSAgICBbPGZmZmY4MmQwNDAyMzYwMjU+XSBTIGNwdXBvb2xfbW92ZV9kb21haW4rMHgyNC8w
eDM1DQo+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMDY1MTM+XSBTIGRvbWFpbl9raWxsKzB4
YTUvMHgxMTYNCj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIzMmIxMj5dIFMgZG9fZG9tY3Rs
KzB4ZTVmLzB4MTk1MQ0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjI3NmJhPl0gUyB0aW1l
ci5jI3RpbWVyX2xvY2srMHg2OS8weDE0Mw0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMmRj
NzFiPl0gUyBwdl9oeXBlcmNhbGwrMHg0NGUvMHg0YTkNCj4+IChYRU4pICAgIFs8ZmZmZjgy
ZDA0MDIwMTJiNz5dIFMgbHN0YXJfZW50ZXIrMHgxMzcvMHgxNDANCj4+IChYRU4pDQo+PiAo
WEVOKQ0KPj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KPj4gKFhFTikgUGFuaWMgb24gQ1BVIDE6DQo+PiAoWEVOKSBBc3NlcnRpb24gJ3N2Yy0+
cnFkID09IGMycnFkKHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpKScgZmFpbGVkIGF0IGNvbW1v
bi9zY2hlZC9jcmVkaXQyLmM6MTE1OQ0KPj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKg0KPj4NCj4+IFRoaXMgaXMgaGFwcGVuaW5nIGFzIHNjaGVk
X21vdmVfZG9tYWluKCkgaXMgc2V0dGluZyBhIGRpZmZlcmVudCBjcHUNCj4+IGZvciBhIHNj
aGVkdWxpbmcgdW5pdCB3aXRob3V0IHRlbGxpbmcgdGhlIHNjaGVkdWxlci4gV2hlbiB0aGlz
IHVuaXQgaXMNCj4+IHJlbW92ZWQgZnJvbSB0aGUgc2NoZWR1bGVyLCB0aGUgQVNTRVJUKCkg
d2lsbCB0cmlnZ2VyLg0KPj4NCj4+IEluIG5vbi1kZWJ1ZyBidWlsZHMgdGhlIHJlc3VsdCBp
cyB1c3VhbGx5IGEgY2xvYmJlcmVkIHBvaW50ZXIsIGxlYWRpbmcNCj4+IHRvIGFub3RoZXIg
Y3Jhc2ggYSBzaG9ydCB0aW1lIGxhdGVyLg0KPj4NCj4+IEZpeCB0aGF0IGJ5IHN3YXBwaW5n
IHRoZSB0d28gaW52b2x2ZWQgYWN0aW9ucyAoc2V0dGluZyBhbm90aGVyIGNwdSBhbmQNCj4+
IHJlbW92aW5nIHRoZSB1bml0IGZyb20gdGhlIHNjaGVkdWxlcikuDQo+Pg0KPj4gQ2M6IEhl
bnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4+IExpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9EYXNoYXJvL2Rhc2hhcm8taXNzdWVzL2lzc3Vlcy80ODgNCj4+IEZpeGVzOiA3MGZh
ZGM0MTYzNWIgKCJ4ZW4vY3B1cG9vbDogc3VwcG9ydCBtb3ZpbmcgZG9tYWluIGJldHdlZW4g
Y3B1cG9vbHMgd2l0aCBkaWZmZXJlbnQgZ3JhbnVsYXJpdHkiKQ0KPj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+
IC0gYWRkZWQgTGluazogKHJlcG9ydGVyIGRpZG4ndCB3YW50IHRvIGJlIGFkZGVkIGJ5IG5h
bWUpDQo+PiAtLS0NCj4+ICAgeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgfCA3ICsrKystLS0N
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYw0KPj4gaW5kZXggMTJkZWVmYTc0NS4uZTlmNzQ4NjE5NyAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiArKysgYi94ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYw0KPj4gQEAgLTczOCwxMiArNzM4LDEzIEBAIGludCBzY2hlZF9t
b3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykNCj4+ICAg
ICAgIG5ld19wID0gY3B1bWFza19maXJzdChkLT5jcHVwb29sLT5jcHVfdmFsaWQpOw0KPiAN
Cj4gVGhlcmUncyBhIGNvbW1lbnQganVzdCBhYm92ZSBoZXJlIHdoaWNoIHNob3VsZCBwcm9i
YWJseSBiZSB1cGRhdGVkOw0KPiBzb21ldGhpbmcgbGlrZSAiUmVtb3ZlIGFsbCB1bml0cyBm
cm9tIHRoZSBvbGQgc2NoZWR1bGVyLCBhbmQNCj4gdGVtcG9yYXJpbHkgbW92ZSB0aGVtIHRv
IHRoZSBzYW1lIHByb2Nlc3NvciB0byBtYWtlIGxvY2tpbmcgZWFzaWVyDQo+IHdoZW4gbW92
aW5nIHRoZSBuZXcgdW5pdHMgdG8gbndlIHByb2Nlc3NvcnMuIg0KPiANCj4gV2l0aCB0aGF0
IGNoYW5nZToNCj4gDQo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNsb3VkLmNvbT4NCj4gDQo+IEkgY291bGQgY2hhbmdlIHRoYXQgb24gY2hlY2staWYg
eW91J2QgbGlrZS4NCg0KWWVzLCBwbGVhc2UgKHdpdGggcy9ud2UvbmV3LykuDQoNCj4gDQo+
IEkgdGFrZSBpdCBhdCB0aGlzIHBvaW50IHRoaXMgaXMganVzdCBmb3IgdGhlIDQuMTkgYnJh
bmNoLCBhbmQgdGhpcw0KPiB3aWxsIGJlIGEgY2FuZGlkYXRlIGZvciBiYWNrcG9ydCB0byA0
LjE4LjE/DQoNCkNvcnJlY3QuDQoNCg0KSnVlcmdlbg0KDQo=
--------------v6OyaVXpcpK9jPvQRHiiacYA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------v6OyaVXpcpK9jPvQRHiiacYA--

--------------KYY3zIdq4IA2EpDEIDbWoRof--

--------------PfjC06I3ih72BinweI7GZPl0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVXFIYFAwAAAAAACgkQsN6d1ii/Ey9W
Kwf/XCZ4lqX/qVaAfb6pcL+5ts4+kPiHUleJ8trwsJggDm4qgG8Bjw3gAUjUzBBUERNhvU7kJzME
ruPnBykU3JAa+rEshay2SlXqWBFVwD8+9Cpg8+GCGgSt/z3jVsWz7j35L6TKf+wMQ0jgegXIHNP5
YpZDZwVaapNSsmG7Ze/xLHckNDUO4ipCPxLaF8zgXRX0cmNV2TNEGawibM1k1BnLDbBJIoY3ehpR
+w7us5GMXIcEn/unrsXHr35xMnr3zoUAx4dopLfhvYRZrDZM0HTrV0KNX2O3xQ2djkv1izdV6JzQ
ZQdAGDOZowfbhEqB5Vu28KXWvXfop9P3aAfXpkreiw==
=N6Dv
-----END PGP SIGNATURE-----

--------------PfjC06I3ih72BinweI7GZPl0--

