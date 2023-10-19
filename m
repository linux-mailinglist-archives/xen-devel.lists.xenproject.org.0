Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709B97CF806
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 14:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619286.964103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRkp-0006Iz-5Y; Thu, 19 Oct 2023 12:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619286.964103; Thu, 19 Oct 2023 12:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRkp-0006Gh-2V; Thu, 19 Oct 2023 12:03:55 +0000
Received: by outflank-mailman (input) for mailman id 619286;
 Thu, 19 Oct 2023 12:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yz61=GB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qtRkn-0006Gb-AO
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 12:03:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91d1c613-6e77-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 14:03:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 091FD21A59;
 Thu, 19 Oct 2023 12:03:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7E5F139C2;
 Thu, 19 Oct 2023 12:03:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id axZzMiYbMWW5MQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 19 Oct 2023 12:03:50 +0000
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
X-Inumbo-ID: 91d1c613-6e77-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697717031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9h5B858bAWry/8oNBNcVnj0nixdWb98VmSWHQtHhdlw=;
	b=Fs5Xl3nIP5xoaHrqs94xKN3yPTXYvdzkNrPaQquJu3cGtQjIXESAc6q7KFapcr848ZMsFS
	QwOW8UkjHiljf+Rf6kmpxhiY2WdtNfpg7TeaKpc3csyAKum2Mil61w1HY+w35KJy5U8jh6
	07mYNiBKnC8SpOdudlhxbyFlov4erm8=
Message-ID: <9a82244d-6d6b-4676-8050-a4aeb0747071@suse.com>
Date: Thu, 19 Oct 2023 14:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20231019112314.22665-1-jgross@suse.com>
 <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>
 <1f8183eb-65cc-41b6-bd91-d1075757b366@suse.com>
 <83E6DCF6-926C-43A6-94D2-EB3B2C444309@arm.com>
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
In-Reply-To: <83E6DCF6-926C-43A6-94D2-EB3B2C444309@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kiI4HuJ8YBLu9qlyVV32ofvf"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kiI4HuJ8YBLu9qlyVV32ofvf
Content-Type: multipart/mixed; boundary="------------0z0As0vBNDnK3NLKJ031PDF7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <9a82244d-6d6b-4676-8050-a4aeb0747071@suse.com>
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
References: <20231019112314.22665-1-jgross@suse.com>
 <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>
 <1f8183eb-65cc-41b6-bd91-d1075757b366@suse.com>
 <83E6DCF6-926C-43A6-94D2-EB3B2C444309@arm.com>
In-Reply-To: <83E6DCF6-926C-43A6-94D2-EB3B2C444309@arm.com>

--------------0z0As0vBNDnK3NLKJ031PDF7
Content-Type: multipart/mixed; boundary="------------bI7h4ETJgGYHVzgaq1f9116L"

--------------bI7h4ETJgGYHVzgaq1f9116L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTAuMjMgMTM6NDksIEhlbnJ5IFdhbmcgd3JvdGU6DQo+IEhpIEp1ZXJnZW4sDQo+
IA0KPj4gT24gT2N0IDE5LCAyMDIzLCBhdCAxOTozOCwgSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToNCj4+DQo+PiBPbiAxOS4xMC4yMyAxMzozMSwgSGVucnkgV2Fu
ZyB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+PiBPbiBPY3QgMTksIDIwMjMsIGF0IDE5
OjIzLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+
PiBXaGVuIG1vdmluZyBhIGRvbWFpbiBvdXQgb2YgYSBjcHVwb29sIHJ1bm5pbmcgd2l0aCB0
aGUgY3JlZGl0Mg0KPj4+PiBzY2hlZHVsZXIgYW5kIGhhdmluZyBtdWx0aXBsZSBydW4tcXVl
dWVzLCB0aGUgZm9sbG93aW5nIEFTU0VSVCgpIGNhbg0KPj4+PiBiZSBvYnNlcnZlZDoNCj4+
Pj4NCj4+Pj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+Pj4+IChYRU4pICAgIFs8ZmZmZjgy
ZDA0MDIzYTcwMD5dIFIgY3JlZGl0Mi5jI2NzY2hlZDJfdW5pdF9yZW1vdmUrMHhlMy8weGU3
DQo+Pj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDI0NmFkYj5dIFMgc2NoZWRfbW92ZV9kb21h
aW4rMHgyZjMvMHg1YjENCj4+Pj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjM0Y2Y3Pl0gUyBj
cHVwb29sLmMjY3B1cG9vbF9tb3ZlX2RvbWFpbl9sb2NrZWQrMHgxZC8weDNiDQo+Pj4+IChY
RU4pICAgIFs8ZmZmZjgyZDA0MDIzNjAyNT5dIFMgY3B1cG9vbF9tb3ZlX2RvbWFpbisweDI0
LzB4MzUNCj4+Pj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjA2NTEzPl0gUyBkb21haW5fa2ls
bCsweGE1LzB4MTE2DQo+Pj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIzMmIxMj5dIFMgZG9f
ZG9tY3RsKzB4ZTVmLzB4MTk1MQ0KPj4+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMjc2YmE+
XSBTIHRpbWVyLmMjdGltZXJfbG9jaysweDY5LzB4MTQzDQo+Pj4+IChYRU4pICAgIFs8ZmZm
ZjgyZDA0MDJkYzcxYj5dIFMgcHZfaHlwZXJjYWxsKzB4NDRlLzB4NGE5DQo+Pj4+IChYRU4p
ICAgIFs8ZmZmZjgyZDA0MDIwMTJiNz5dIFMgbHN0YXJfZW50ZXIrMHgxMzcvMHgxNDANCj4+
Pj4gKFhFTikNCj4+Pj4gKFhFTikNCj4+Pj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKg0KPj4+PiAoWEVOKSBQYW5pYyBvbiBDUFUgMToNCj4+Pj4g
KFhFTikgQXNzZXJ0aW9uICdzdmMtPnJxZCA9PSBjMnJxZChzY2hlZF91bml0X21hc3Rlcih1
bml0KSknIGZhaWxlZCBhdCBjb21tb24vc2NoZWQvY3JlZGl0Mi5jOjExNTkNCj4+Pj4gKFhF
TikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPj4+Pg0KPj4+
PiBUaGlzIGlzIGhhcHBlbmluZyBhcyBzY2hlZF9tb3ZlX2RvbWFpbigpIGlzIHNldHRpbmcg
YSBkaWZmZXJlbnQgY3B1DQo+Pj4+IGZvciBhIHNjaGVkdWxpbmcgdW5pdCB3aXRob3V0IHRl
bGxpbmcgdGhlIHNjaGVkdWxlci4gV2hlbiB0aGlzIHVuaXQgaXMNCj4+Pj4gcmVtb3ZlZCBm
cm9tIHRoZSBzY2hlZHVsZXIsIHRoZSBBU1NFUlQoKSB3aWxsIHRyaWdnZXIuDQo+Pj4+DQo+
Pj4+IEluIG5vbi1kZWJ1ZyBidWlsZHMgdGhlIHJlc3VsdCBpcyB1c3VhbGx5IGEgY2xvYmJl
cmVkIHBvaW50ZXIsIGxlYWRpbmcNCj4+Pj4gdG8gYW5vdGhlciBjcmFzaCBhIHNob3J0IHRp
bWUgbGF0ZXIuDQo+Pj4+DQo+Pj4+IEZpeCB0aGF0IGJ5IHN3YXBwaW5nIHRoZSB0d28gaW52
b2x2ZWQgYWN0aW9ucyAoc2V0dGluZyBhbm90aGVyIGNwdSBhbmQNCj4+Pj4gcmVtb3Zpbmcg
dGhlIHVuaXQgZnJvbSB0aGUgc2NoZWR1bGVyKS4NCj4+Pj4NCj4+Pj4gQ2M6IEhlbnJ5IFdh
bmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4+PiBFbW1tLCBJIHRoaW5rIF4gdGhpcyBDQyBp
cyBiZXR0ZXIgdG8gbWUgbW92ZWQgdG8gdGhlIHNjaXNzb3JzIGxpbmUsIG90aGVyd2lzZQ0K
Pj4+IGlmIHRoaXMgcGF0Y2ggaXMgY29tbWl0dGVkLCB0aGlzIGxpbmUgd2lsbCBiZSBzaG93
biBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuLi4NCj4+Pj4gRml4ZXM6IDcwZmFkYzQxNjM1YiAo
Inhlbi9jcHVwb29sOiBzdXBwb3J0IG1vdmluZyBkb21haW4gYmV0d2VlbiBjcHVwb29scyB3
aXRoIGRpZmZlcmVudCBncmFudWxhcml0eSIpDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFRoaXMgZml4ZXMg
YSByZWdyZXNzaW9uIGludHJvZHVjZWQgaW4gWGVuIDQuMTUuIFRoZSBmaXggaXMgdmVyeSBz
aW1wbGUNCj4+Pj4gYW5kIGl0IHdpbGwgYWZmZWN0IG9ubHkgY29uZmlndXJhdGlvbnMgd2l0
aCBtdWx0aXBsZSBjcHVwb29scy4gSSB0aGluaw0KPj4+PiB3aGV0aGVyIHRvIGluY2x1ZGUg
aXQgaW4gNC4xOCBzaG91bGQgYmUgZGVjaWRlZCBieSB0aGUgcmVsZWFzZSBtYW5hZ2VyDQo+
Pj4+IGJhc2VkIG9uIHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSByZWxlYXNlIChJIHRoaW5r
IEkgd291bGRuJ3QgaGF2ZQ0KPj4+PiBhZGRlZCBpdCB0aGF0IGxhdGUgaW4gdGhlIHJlbGVh
c2Ugd2hpbGUgYmVpbmcgdGhlIHJlbGVhc2UgbWFuYWdlcikuDQo+Pj4gVGhhbmtzIGZvciB0
aGUgcmVtaW5kZXIgOikNCj4+PiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLCBp
ZiB0aGlzIGlzIGZpeGluZyB0aGUgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGluDQo+Pj4gNC4x
NSwgc2hvdWxkbuKAmXQgdGhpcyBwYXRjaCBiZWluZyBiYWNrcG9ydGVkIHRvIDQuMTUsIDQu
MTYsIDQuMTcgYW5kIHNvb24NCj4+PiA0LjE4PyBTbyBob25lc3RseSBJIHRoaW5rIGF0IGxl
YXN0IGZvciA0LjE4IGVpdGhlciBhZGQgdGhpcyBwYXRjaCBub3cgb3INCj4+PiBsYXRlciB3
b27igJl0IG1ha2UgbXVjaCBkaWZmZXJlbmNl4oCmSSBhbSBvayBlaXRoZXIgd2F5IEkgZ3Vl
c3MuDQo+Pg0KPj4gWW91IGFyZSByaWdodCwgdGhlIHBhdGNoIG5lZWRzIHRvIGJlIGJhY2tw
b3J0ZWQuDQo+Pg0KPj4gT1RPSCBub2JvZHkgbm90aWNlZCB0aGUgcmVncmVzc2lvbiB1bnRp
bCBhIGZldyBkYXlzIGFnby4gU28gZGVsYXlpbmcgdGhlIGZpeA0KPj4gZm9yIGEgZmV3IHdl
ZWtzIHdvdWxkIHByb2JhYmx5IG5vdCBodXJ0IHRvbyBtYW55IHBlb3BsZS4NCj4gDQo+IEkg
YW0gcGxhbm5pbmcgdG8gYnJhbmNoIG5leHQgd2Vlaywgc28gSSB3b3VsZCBzYXkgdGhpcyBw
YXRjaCBwcm9iYWJseSB3aWxsIGJlDQo+IGRlbGF5ZWQgbWF4IDEgd2VlayBJIGd1ZXNzLg0K
PiANCj4+IEVhY2ggcGF0Y2ggY2hhbmdpbmcNCj4+IGNvZGUgaXMgYSByaXNrIHRvIGludHJv
ZHVjZSBhbm90aGVyIHJlZ3Jlc3Npb24sIHNvIGl0cyB5b3VyIGRlY2lzaW9uIHdoZXRoZXIN
Cj4+IHlvdSB3YW50IHRvIHRha2UgdGhpcyByaXNrLiBFc3BlY2lhbGx5IGNoYW5nZXMgbGlr
ZSB0aGlzIG9uZSB0b3VjaGluZyB0aGUNCj4+IGNvcmUgc2NoZWR1bGluZyBjb2RlIGFsd2F5
cyBoYXZlIGEgbGF0ZW50IHJpc2sgdG8gb3BlbiB1cCBhIHNtYWxsIHJhY2Ugd2luZG93DQo+
PiAodGhpcyBjb3VsZCBiZSBzYWlkIGZvciB0aGUgb3JpZ2luYWwgcGF0Y2ggSSdtIGZpeGlu
ZyBoZXJlLCB0b28gOi0pICkuDQo+IA0KPiBUaGF0IHNhaWQsIGdpdmVuIHRoZSBmYWN0IHRo
YXQgdGhpcyBwYXRjaCBpcyBmaXhpbmcgYSByZWdyZXNzaW9uIHllYXJzIGFnbyBhbmQNCj4g
d2lsbCBiZSBiYWNrcG9ydGVkIHRvIHRoZSBzdGFibGUgcmVsZWFzZXMsIEkgYW0gbW9yZSBs
ZWFuaW5nIHRvd2FyZHMgbWVyZ2luZw0KPiB0aGlzIHBhdGNoIHdoZW4gdGhlIHRyZWUgcmVv
cGVucyAodW5sZXNzIG90aGVycyBzdHJvbmdseSBvYmplY3QpLCBzbyB0aGF0IHRoaXMNCj4g
cGF0Y2ggd2lsbCBnZXQgdGhlIG9wcG9ydHVuaXR5IHRvIGJlIHRlc3RlZCBwcm9wZXJseSwg
YW5kIHdlIHdvbuKAmXQgdGFrZSB0b28gbXVjaA0KPiByaXNrIHRvIGRlbGF5IHRoZSA0LjE4
IHJlbGVhc2UuIEFsc28gdGhpcyBkZWNpc2lvbiBpcyBjb25zaXN0ZW50IHdpdGggeW91ciAo
YW4NCj4gZXggcmVsZWFzZSBtYW5hZ2VyKSBhYm92ZSB3b3JkcyBpbiB0aGUgc2Npc3NvcnMg
bGluZSA6KQ0KPiANCj4gSG9wZWZ1bGx5IHlvdSB3aWxsIGFsc28gYmUgb2sgd2l0aCB0aGF0
Lg0KDQpPZiBjb3Vyc2UgSSBhbS4NCg0KDQpKdWVyZ2VuDQo=
--------------bI7h4ETJgGYHVzgaq1f9116L
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------bI7h4ETJgGYHVzgaq1f9116L--

--------------0z0As0vBNDnK3NLKJ031PDF7--

--------------kiI4HuJ8YBLu9qlyVV32ofvf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUxGyYFAwAAAAAACgkQsN6d1ii/Ey/w
AggAlF+a4p48ui81LgS//JXeDf8WwhBcZcqKYEavv8g0gaUxPlUry16Ul9zwfq+pgZ8OXDL33YU+
/CDv6u0Ha/9utnfBCp2H9ersYkjy1FDknoPZvUUpPjjFtdfb7EveiGU/E+orPxA53wynL8FRKxit
naNjIC8JIIYyo97ZPTIwWhOn+JJEDNsHnVdMGd1FJIQ9+Qu/Spf3wYBg8uQRRD2AVYIhvwUps9ak
kelxhWNpeHfF9ktRc3LxZLmBQxhBf8GJhYyviEUrGkaJw/cENtv0haBAh2EuPt7zOIRhkuXnoWdT
hsyNGAeD1yqygc+kF8qXe1NRliqPsqcfC6lxfkbZTQ==
=TDX5
-----END PGP SIGNATURE-----

--------------kiI4HuJ8YBLu9qlyVV32ofvf--

