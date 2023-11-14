Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC07EAA9A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 07:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632144.986209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2nAn-00034h-6C; Tue, 14 Nov 2023 06:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632144.986209; Tue, 14 Nov 2023 06:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2nAn-00032D-37; Tue, 14 Nov 2023 06:45:21 +0000
Received: by outflank-mailman (input) for mailman id 632144;
 Tue, 14 Nov 2023 06:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2nAk-000327-UD
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 06:45:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ef22c8d-82b9-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 07:45:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB15D2189A;
 Tue, 14 Nov 2023 06:45:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 83EB413460;
 Tue, 14 Nov 2023 06:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /nuiHnwXU2VCQwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 06:45:16 +0000
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
X-Inumbo-ID: 5ef22c8d-82b9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699944316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CVMncut3/9cuc8Nn7Lz05k8mLOBLL/l0VWOn5Zo75Vw=;
	b=XQfwV8lk7mjw9xJn80/6t3pwC9f8lnso4l+qRT8DTLQdBQBOefB0cyRKRzh47s6YFBiEGJ
	hRMFmReulb+PA1IKvJ+GIBGowu/5uIllBzxL3S1myY7YdkehC6o616M0iVUpEeduCnKHyz
	PgT/cwWCAZAKlW1O/eZnBx4JuIuwoZM=
Message-ID: <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
Date: Tue, 14 Nov 2023 07:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
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
In-Reply-To: <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mFzGogDe38gTa6ReiA9V9JQe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mFzGogDe38gTa6ReiA9V9JQe
Content-Type: multipart/mixed; boundary="------------H9aHn5lsRIo3fAM6VqUvi3As";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename
 handling
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>
In-Reply-To: <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org>

--------------H9aHn5lsRIo3fAM6VqUvi3As
Content-Type: multipart/mixed; boundary="------------GcE3M0x3N04BGHiekB0uog8D"

--------------GcE3M0x3N04BGHiekB0uog8D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjMgMjM6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzExLzIwMjMgMTY6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgc29tZSBoZWxwZXJzIGZvciBoYW5kbGluZyBmaWxlbmFtZXMgd2hpY2ggbWlnaHQgbmVl
ZCBkaWZmZXJlbnQNCj4+IGltcGxlbWVudGF0aW9ucyBiZXR3ZWVuIHN0dWJkb20gYW5kIGRh
ZW1vbiBlbnZpcm9ubWVudHM6DQo+Pg0KPj4gLSBleHBhbnNpb24gb2YgcmVsYXRpdmUgZmls
ZW5hbWVzICh0aG9zZSBhcmUgbm90IHJlYWxseSBkZWZpbmVkIHRvZGF5LA0KPj4gwqDCoCBq
dXN0IGV4cGFuZCB0aGVtIHRvIGJlIHJlbGF0aXZlIHRvIC92YXIvbGliL3hlbi94ZW5zdG9y
ZSkNCj4+IC0gZXhwYW5zaW9uIG9mIHhlbnN0b3JlX2RhZW1vbl9ydW5kaXIoKSAodXNlZCBl
LmcuIGZvciBzYXZpbmcgdGhlIHN0YXRlDQo+PiDCoMKgIGZpbGUgaW4gY2FzZSBvZiBsaXZl
IHVwZGF0ZSAtIG5lZWRzIHRvIGJlIHVuY2hhbmdlZCBpbiB0aGUgZGFlbW9uDQo+PiDCoMKg
IGNhc2UsIGJ1dCBzaG91bGQgcmVzdWx0IGluIC92YXIvbGliL3hlbi94ZW5zdG9yZSBmb3Ig
c3R1YmRvbSkNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21h
aWwuY29tPg0KPj4gLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvY29yZS5jwqDCoMKgwqDC
oCB8IDkgKysrKysrKystDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvY29yZS5owqDCoMKgwqDC
oCB8IDMgKysrDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvbHVfZGFlbW9uLmMgfCA0ICsrLS0N
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9taW5pb3MuY8KgwqDCoCB8IDUgKysrKysNCj4+IMKg
IHRvb2xzL3hlbnN0b3JlZC9wb3NpeC5jwqDCoMKgwqAgfCA1ICsrKysrDQo+PiDCoCA1IGZp
bGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMgYi90b29scy94ZW5zdG9yZWQv
Y29yZS5jDQo+PiBpbmRleCA0YTlkODc0ZjE3Li43N2JlZmQyNGM5IDEwMDY0NA0KPj4gLS0t
IGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2Nv
cmUuYw0KPj4gQEAgLTE1OCw2ICsxNTgsMTMgQEAgdm9pZCB0cmFjZV9kZXN0cm95KGNvbnN0
IHZvaWQgKmRhdGEsIGNvbnN0IGNoYXIgKnR5cGUpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
dHJhY2UoIm9iajogREVTVFJPWSAlcyAlcFxuIiwgdHlwZSwgZGF0YSk7DQo+PiDCoCB9DQo+
PiArY2hhciAqYWJzb2x1dGVfZmlsZW5hbWUoY29uc3Qgdm9pZCAqY3R4LCBjb25zdCBjaGFy
ICpmaWxlbmFtZSkNCj4gDQo+IENhbiB0aGUgcmV0dXJuIGJlIGNvbnN0Pw0KDQpJJ2xsIGhh
dmUgYSBsb29rLg0KDQo+IA0KPj4gK3sNCj4+ICvCoMKgwqAgaWYgKGZpbGVuYW1lWzBdICE9
ICcvJykNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gdGFsbG9jX2FzcHJpbnRmKGN0eCwg
WEVOU1RPUkVfTElCX0RJUiAiLyVzIiwgZmlsZW5hbWUpOw0KPiANCj4gTG9va2luZyBhdCB0
aGUgcmVzdCBvZiBwYXRjaCwgeW91IHdpbGwgYmUgdXNpbmcgeGVuc3RvcmVfcnVuZGlyKCku
IEkgd29uZGVyIA0KPiB3aGV0aGVyIGl0IHdvdWxkIG5vdCBiZSBiZXR0ZXIgdG8gc3dpdGNo
IHRvIHhlbnN0b3JlX3J1bmRpcigpIHNvLi4uDQo+IA0KPj4gK8KgwqDCoCByZXR1cm4gdGFs
bG9jX3N0cmR1cChjdHgsIGZpbGVuYW1lKTsNCj4+ICt9DQo+PiArDQo+PiDCoCAvKioNCj4+
IMKgwqAgKiBTaWduYWwgaGFuZGxlciBmb3IgU0lHSFVQLCB3aGljaCByZXF1ZXN0cyB0aGF0
IHRoZSB0cmFjZSBsb2cgaXMgcmVvcGVuZWQNCj4+IMKgwqAgKiAoaW4gdGhlIG1haW4gbG9v
cCkuwqAgQSBzaW5nbGUgYnl0ZSBpcyB3cml0dGVuIHRvIHJlb3Blbl9sb2dfcGlwZSwgdG8g
YXdha2VuDQo+PiBAQCAtMjk4Myw3ICsyOTkwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSkNCj4+IMKgwqDCoMKgwqAgc2lnbmFsKFNJR0hVUCwgdHJpZ2dlcl9yZW9w
ZW5fbG9nKTsNCj4+IMKgwqDCoMKgwqAgaWYgKHRyYWNlZmlsZSkNCj4+IC3CoMKgwqDCoMKg
wqDCoCB0cmFjZWZpbGUgPSB0YWxsb2Nfc3RyZHVwKE5VTEwsIHRyYWNlZmlsZSk7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgdHJhY2VmaWxlID0gYWJzb2x1dGVfZmlsZW5hbWUoTlVMTCwgdHJh
Y2VmaWxlKTsNCj4+IMKgICNpZm5kZWYgTk9fTElWRV9VUERBVEUNCj4+IMKgwqDCoMKgwqAg
LyogUmVhZCBzdGF0ZSBpbiBjYXNlIG9mIGxpdmUgdXBkYXRlLiAqLw0KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmggYi90b29scy94ZW5zdG9yZWQvY29yZS5oDQo+
PiBpbmRleCBhMGQzNTkyOTYxLi41MWUxZGRkYjIyIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMv
eGVuc3RvcmVkL2NvcmUuaA0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuaA0KPj4g
QEAgLTM5Myw2ICszOTMsOSBAQCB2b2lkIGVhcmx5X2luaXQodm9pZCk7DQo+PiDCoCB2b2lk
IG1vdW50XzlwZnModm9pZCk7DQo+PiDCoCAjZW5kaWYNCj4+ICtjb25zdCBjaGFyICp4ZW5z
dG9yZV9ydW5kaXIodm9pZCk7DQo+PiArY2hhciAqYWJzb2x1dGVfZmlsZW5hbWUoY29uc3Qg
dm9pZCAqY3R4LCBjb25zdCBjaGFyICpmaWxlbmFtZSk7DQo+PiArDQo+PiDCoCAvKiBXcml0
ZSBvdXQgdGhlIHBpZGZpbGUgKi8NCj4+IMKgIHZvaWQgd3JpdGVfcGlkZmlsZShjb25zdCBj
aGFyICpwaWRmaWxlKTsNCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvbHVfZGFl
bW9uLmMgYi90b29scy94ZW5zdG9yZWQvbHVfZGFlbW9uLmMNCj4+IGluZGV4IDcxYmNhYmFk
ZDMuLjYzNTExMTFhYjAgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvbHVfZGFl
bW9uLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9sdV9kYWVtb24uYw0KPj4gQEAgLTI0
LDcgKzI0LDcgQEAgdm9pZCBsdV9nZXRfZHVtcF9zdGF0ZShzdHJ1Y3QgbHVfZHVtcF9zdGF0
ZSAqc3RhdGUpDQo+PiDCoMKgwqDCoMKgIHN0YXRlLT5zaXplID0gMDsNCj4+IMKgwqDCoMKg
wqAgc3RhdGUtPmZpbGVuYW1lID0gdGFsbG9jX2FzcHJpbnRmKE5VTEwsICIlcy9zdGF0ZV9k
dW1wIiwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
eGVuc3RvcmVfZGFlbW9uX3J1bmRpcigpKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuc3RvcmVfcnVuZGlyKCkpOw0KPiANCj4gLi4uIGNh
bGwgYW5kIC4uLg0KPiANCj4+IMKgwqDCoMKgwqAgaWYgKCFzdGF0ZS0+ZmlsZW5hbWUpDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgYmFyZigiQWxsb2NhdGlvbiBmYWlsdXJlIik7DQo+PiBA
QCAtNjUsNyArNjUsNyBAQCBGSUxFICpsdV9kdW1wX29wZW4oY29uc3Qgdm9pZCAqY3R4KQ0K
Pj4gwqDCoMKgwqDCoCBpbnQgZmQ7DQo+PiDCoMKgwqDCoMKgIGZpbGVuYW1lID0gdGFsbG9j
X2FzcHJpbnRmKGN0eCwgIiVzL3N0YXRlX2R1bXAiLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW5zdG9yZV9kYWVtb25fcnVuZGlyKCkpOw0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW5zdG9yZV9ydW5kaXIoKSk7
DQo+IA0KPiAuLi4gdGhpcyBvbmUgY291bGQgYmUgcmVwbGFjZWQgd2l0aCBhYnNvbHV0ZV9m
aWxlbmFtZSgpLg0KDQpObywgSSBkb24ndCB0aGluayB0aGlzIGlzIGEgZ29vZCBpZGVhLg0K
DQpJIGRvbid0IHdhbnQgdGhlIGRhZW1vbiB0byBzdG9yZSB0cmFjZSBmaWxlcyBzcGVjaWZp
ZWQgYXMgcmVsYXRpdmUgZmlsZXMNCnRvIGJlIHN0b3JlZCBpbiAvdmFyL3J1bi94ZW4sIHdo
aWxlIEkgd2FudCBhbGwgZmlsZXMgb2YgdGhlIHN0dWJkb20gdG8gYmUNCnN0b3JlZCB1bmRl
ciAvdmFyL2xpYi94ZW4uDQoNCg0KSnVlcmdlbg0K
--------------GcE3M0x3N04BGHiekB0uog8D
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GcE3M0x3N04BGHiekB0uog8D--

--------------H9aHn5lsRIo3fAM6VqUvi3As--

--------------mFzGogDe38gTa6ReiA9V9JQe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTF3wFAwAAAAAACgkQsN6d1ii/Ey/z
YAf/ZMEUB4iVGjr3eGUAWGRU+pUQeMrL5904HLkO6jyj2DDjffmA3uSzNmPmwlOIlABMLTdOjhOb
ZXbCS1VopAKFT7Qp3IdMLntNB1R0Ey2jQtlHseXtHG2L6f2ohoPywXxASYjAqaiGewqK+OMJY9ze
/iU5QmFSpIw3zrCm6gLKoAa1YPCWQTuayf86s5I5ifxQW0+aLRoByvOSaqSCc5CiwtTSYdSAbIMo
ehAM1lD4KH4SLGGioX28gqjpOCTVGWyB4t2LUajKU9FI1vGRezr1NZnozq/+yFVq9NXq2V0XP2eo
yO4M4ibot5RBYyO2zsfiPtJpbW4YGRtehK1Suf+mPg==
=YeDR
-----END PGP SIGNATURE-----

--------------mFzGogDe38gTa6ReiA9V9JQe--

