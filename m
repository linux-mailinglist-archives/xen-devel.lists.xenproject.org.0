Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01F7E9A46
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 11:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631491.984852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2U9u-0000Pc-DH; Mon, 13 Nov 2023 10:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631491.984852; Mon, 13 Nov 2023 10:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2U9u-0000MZ-9R; Mon, 13 Nov 2023 10:27:10 +0000
Received: by outflank-mailman (input) for mailman id 631491;
 Mon, 13 Nov 2023 10:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2U9t-0000L4-A0
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 10:27:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 318bcc47-820f-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 11:27:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C161E218FA;
 Mon, 13 Nov 2023 10:27:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D5681358C;
 Mon, 13 Nov 2023 10:27:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EYAVIfb5UWW3KgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 10:27:02 +0000
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
X-Inumbo-ID: 318bcc47-820f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699871222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v+/nvteBuYFi59fjIzi9qH0wrwAF1apYeSpDzlXuOIA=;
	b=mhk+82DKupJf92MJubXPaJHo8rs7HI3qCvS0WTp6SEXNJVqSibzWCNMPLDwk9Z8Zn0ndyn
	2vbLO5DoqpbTCksTf661KTLzTFXXeQ3Vvv7SwuIOhVVFl/2uBusYzyn8mwOgnQoRd9dh/G
	MjEUsKgwJQw9JqAvsv23WlzpjP8dYjM=
Message-ID: <9b45b52e-498a-42fd-ae11-710521d1dead@suse.com>
Date: Mon, 13 Nov 2023 11:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/29] tools/xenstored: add early_init() function
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-22-jgross@suse.com>
 <adc25dc4-9ba6-41d4-87a0-cf6ad5777b1f@xen.org>
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
In-Reply-To: <adc25dc4-9ba6-41d4-87a0-cf6ad5777b1f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------azc5D8RBkiIFvuRnG21WIadq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------azc5D8RBkiIFvuRnG21WIadq
Content-Type: multipart/mixed; boundary="------------lUjC1jv8J3Km3wJpSTtV0bqp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <9b45b52e-498a-42fd-ae11-710521d1dead@suse.com>
Subject: Re: [PATCH v2 21/29] tools/xenstored: add early_init() function
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-22-jgross@suse.com>
 <adc25dc4-9ba6-41d4-87a0-cf6ad5777b1f@xen.org>
In-Reply-To: <adc25dc4-9ba6-41d4-87a0-cf6ad5777b1f@xen.org>

--------------lUjC1jv8J3Km3wJpSTtV0bqp
Content-Type: multipart/mixed; boundary="------------vQIG14DFIA7jhynAa0TmL0OH"

--------------vQIG14DFIA7jhynAa0TmL0OH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjMgMTg6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzExLzIwMjMgMTY6MDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBT
b21lIHhlbnN0b3JlZCBpbml0aWFsaXphdGlvbiBuZWVkcyB0byBiZSBkb25lIGluIHRoZSBk
YWVtb24gY2FzZSBvbmx5LA0KPj4gc28gc3BsaXQgaXQgb3V0IGludG8gYSBuZXcgZWFybHlf
aW5pdCgpIGZ1bmN0aW9uIGJlaW5nIGEgc3R1YiBpbiB0aGUNCj4+IHN0dWJkb20gY2FzZS4N
Cj4gDQo+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB0byBtZSBob3cgeW91IGRlY2lkZWQg
dGhlIHNwbGl0LiBGb3IgZXhhbXBsZS4uLg0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogSmFzb24g
QW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+IC0gcmVu
YW1lIGZ1bmN0aW9uDQo+PiAtIG1vdmUgcGF0Y2ggZWFybGllciBpbiB0aGUgc2VyaWVzDQo+
PiAtLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9jb3JlLmPCoMKgIHzCoCA2ICstLS0tLQ0K
Pj4gwqAgdG9vbHMveGVuc3RvcmVkL2NvcmUuaMKgwqAgfMKgIDMgKysrDQo+PiDCoCB0b29s
cy94ZW5zdG9yZWQvbWluaW9zLmMgfMKgIDMgKysrDQo+PiDCoCB0b29scy94ZW5zdG9yZWQv
cG9zaXguY8KgIHwgMTEgKysrKysrKysrKysNCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMveGVuc3RvcmVkL2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+IGluZGV4
IGVkZDA3NzExZGIuLjBjMTQ4MjNmYjAgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9y
ZWQvY29yZS5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+PiBAQCAtMjkz
MywxMSArMjkzMyw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pDQo+PiDC
oMKgwqDCoMKgIGlmIChvcHRpbmQgIT0gYXJnYykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBi
YXJmKCIlczogTm8gYXJndW1lbnRzIGRlc2lyZWQiLCBhcmd2WzBdKTsNCj4+IC3CoMKgwqAg
cmVvcGVuX2xvZygpOw0KPj4gLQ0KPj4gLcKgwqDCoCAvKiBNYWtlIHN1cmUgeGVuc3RvcmVk
IGRpcmVjdG9yeSBleGlzdHMuICovDQo+PiAtwqDCoMKgIC8qIEVycm9ycyBpZ25vcmVkIGhl
cmUsIHdpbGwgYmUgcmVwb3J0ZWQgd2hlbiB3ZSBvcGVuIGZpbGVzICovDQo+PiAtwqDCoMKg
IG1rZGlyKHhlbnN0b3JlX2RhZW1vbl9ydW5kaXIoKSwgMDc1NSk7DQo+PiArwqDCoMKgIGVh
cmx5X2luaXQoKTsNCj4+IMKgwqDCoMKgwqAgaWYgKGRvZm9yaykgew0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIG9wZW5sb2coInhlbnN0b3JlZCIsIDAsIExPR19EQUVNT04pOw0KPiANCj4g
Rm9yIHN0dWJkb20gd2Ugd291bGQgbm90IGZvcmssIHNvIEkgd291bGQgZXhwZWN0IHRoZSBj
YWxsIHRvIG9wZW5sb2coKSBub3QgDQo+IG5lY2Vzc2FyeS4gU2FtZSBmb3IgdGhlIGluaXRf
cGlwZSgpIGJlbG93Lg0KDQpUaGUgbWFpbiBnb2FsIHdhcyB0byBtb3ZlIHRoZSAibWtkaXIo
eGVuc3RvcmVfZGFlbW9uX3J1bmRpcigpLCAwNzU1KTsiIG91dCBvZg0KdGhlIHdheSBmb3Ig
c3R1YmRvbS4NCg0KSSdsbCBtYWtlIHRoaXMgbW9yZSBjbGVhciBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UsIC4uLg0KDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9jb3Jl
LmggYi90b29scy94ZW5zdG9yZWQvY29yZS5oDQo+PiBpbmRleCA0ODBiMGY1ZjdiLi5kMGFj
NTg3ZjhmIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuaA0KPj4gKysr
IGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuaA0KPj4gQEAgLTM1LDYgKzM1LDggQEANCj4+IMKg
ICNpbmNsdWRlICJsaXN0LmgiDQo+PiDCoCAjaW5jbHVkZSAiaGFzaHRhYmxlLmgiDQo+PiAr
I2RlZmluZSBYRU5TVE9SRV9MSUJfRElSwqDCoMKgIFhFTl9MSUJfRElSICIveGVuc3RvcmUi
DQo+PiArDQo+PiDCoCAjaWZuZGVmIE9fQ0xPRVhFQw0KPj4gwqAgI2RlZmluZSBPX0NMT0VY
RUMgMA0KPj4gwqAgLyogT19DTE9FWEVDIHN1cHBvcnQgaXMgbmVlZGVkIGZvciBMaXZlIFVw
ZGF0ZSBpbiB0aGUgZGFlbW9uIGNhc2UuICovDQo+PiBAQCAtMzg0LDYgKzM4Niw3IEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBkb21haW5faXNfdW5wcml2aWxlZ2VkKGNvbnN0IHN0cnVjdCAN
Cj4+IGNvbm5lY3Rpb24gKmNvbm4pDQo+PiDCoCAvKiBSZXR1cm4gdGhlIGV2ZW50IGNoYW5u
ZWwgdXNlZCBieSB4ZW5idXMuICovDQo+PiDCoCBldnRjaG5fcG9ydF90IGdldF94ZW5idXNf
ZXZ0Y2huKHZvaWQpOw0KPj4gK3ZvaWQgZWFybHlfaW5pdCh2b2lkKTsNCj4+IMKgIC8qIFdy
aXRlIG91dCB0aGUgcGlkZmlsZSAqLw0KPj4gwqAgdm9pZCB3cml0ZV9waWRmaWxlKGNvbnN0
IGNoYXIgKnBpZGZpbGUpOw0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9taW5p
b3MuYyBiL3Rvb2xzL3hlbnN0b3JlZC9taW5pb3MuYw0KPj4gaW5kZXggMDc3OWVmYmY5MS4u
MGNkZWMzYWU1MSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9taW5pb3MuYw0K
Pj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL21pbmlvcy5jDQo+PiBAQCAtNTQsMyArNTQsNiBA
QCB2b2lkIHVubWFwX3hlbmJ1cyh2b2lkICppbnRlcmZhY2UpDQo+PiDCoMKgwqDCoMKgIHhl
bmdudHRhYl91bm1hcCgqeGd0X2hhbmRsZSwgaW50ZXJmYWNlLCAxKTsNCj4+IMKgIH0NCj4+
ICt2b2lkIGVhcmx5X2luaXQodm9pZCkNCj4+ICt7DQo+PiArfQ0KPj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3hlbnN0b3JlZC9wb3NpeC5jIGIvdG9vbHMveGVuc3RvcmVkL3Bvc2l4LmMNCj4+
IGluZGV4IDdlMDNkZDk4MmQuLmZjYjc3OTFiZDcgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94
ZW5zdG9yZWQvcG9zaXguYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL3Bvc2l4LmMNCj4+
IEBAIC0yMiw2ICsyMiw3IEBADQo+PiDCoCAjaW5jbHVkZSA8ZmNudGwuaD4NCj4+IMKgICNp
bmNsdWRlIDxzdGRsaWIuaD4NCj4+IMKgICNpbmNsdWRlIDxzeXMvbW1hbi5oPg0KPj4gKyNp
bmNsdWRlIDx4ZW4tdG9vbHMveGVuc3RvcmUtY29tbW9uLmg+DQo+PiDCoCAjaW5jbHVkZSAi
dXRpbHMuaCINCj4+IMKgICNpbmNsdWRlICJjb3JlLmgiDQo+PiBAQCAtMTU3LDMgKzE1OCwx
MyBAQCB2b2lkICp4ZW5idXNfbWFwKHZvaWQpDQo+PiDCoMKgwqDCoMKgIHJldHVybiBhZGRy
Ow0KPj4gwqAgfQ0KPj4gKw0KPj4gK3ZvaWQgZWFybHlfaW5pdCh2b2lkKQ0KPj4gK3sNCj4+
ICvCoMKgwqAgcmVvcGVuX2xvZygpOw0KPj4gKw0KPj4gK8KgwqDCoCAvKiBNYWtlIHN1cmUg
eGVuc3RvcmVkIGRpcmVjdG9yaWVzIGV4aXN0LiAqLw0KPj4gK8KgwqDCoCAvKiBFcnJvcnMg
aWdub3JlZCBoZXJlLCB3aWxsIGJlIHJlcG9ydGVkIHdoZW4gd2Ugb3BlbiBmaWxlcyAqLw0K
Pj4gK8KgwqDCoCBta2Rpcih4ZW5zdG9yZV9kYWVtb25fcnVuZGlyKCksIDA3NTUpOw0KPj4g
K8KgwqDCoCBta2RpcihYRU5TVE9SRV9MSUJfRElSLCAwNzU1KTsNCj4gDQo+IFRoZSBhZGRp
dGlvbiBvZiB0aGUgc2Vjb25kIG1rZGlyKCkgZG9lc24ndCBzZWVtIHRvIGJlIGV4cGxhaW5l
ZCBpbiB0aGUgY29tbWl0IA0KPiBtZXNzYWdlLg0KDQouLi4gbW92aW5nIHRoaXMgY2hhbmdl
IGludG8gY29udGV4dC4NCg0KSSdsbCBsb29rIGludG8gbW92aW5nIG1vcmUgbm9uLXN0dWJk
b20gZnVuY3Rpb24gY2FsbHMgaW50byBlYXJseV9pbml0KCkgaW4NCnBvc2l4LmMuDQoNCg0K
SnVlcmdlbg0K
--------------vQIG14DFIA7jhynAa0TmL0OH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vQIG14DFIA7jhynAa0TmL0OH--

--------------lUjC1jv8J3Km3wJpSTtV0bqp--

--------------azc5D8RBkiIFvuRnG21WIadq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVR+fYFAwAAAAAACgkQsN6d1ii/Ey8m
DAf/bG+zdvRNFMCUVL6r5SU3Yy1YWinVfv3FfGGvi5IrjhnDok3V10vfzNnNs5hz5zKShnVI6Bk+
Hcwkt+KFCIY+jOOYAYXhunWIfOz7+08DIE/IVZt6bL7VdEnkfw5uCdGLrei+KV7Eaovie8ZKuYYj
4NG5wbM7pbwQvOA23z5QNyFr0HflKtDLq3IZMklzWKpaDVLzUzmB+R7vAXItnlUjZQ9PiHMYenx+
nNIhq5MNas1XdCyvW2nvBhNZiRFrkeW+zCS5FQkQi+36m27GleH3+4yRYjHj/VE6HzNpXig+DOXD
1kPCrIrnPLM2mzSMDnZ46evyXpgPiFzfBHN2JWVmfg==
=/9co
-----END PGP SIGNATURE-----

--------------azc5D8RBkiIFvuRnG21WIadq--

