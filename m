Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A708778071B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 10:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585845.917037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWunW-0006E7-5g; Fri, 18 Aug 2023 08:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585845.917037; Fri, 18 Aug 2023 08:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWunW-0006C0-38; Fri, 18 Aug 2023 08:25:34 +0000
Received: by outflank-mailman (input) for mailman id 585845;
 Fri, 18 Aug 2023 08:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZyU=ED=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qWunU-0006Bu-H4
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 08:25:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cabb5838-3da0-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 10:25:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A7D61F893;
 Fri, 18 Aug 2023 08:25:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5114A138F0;
 Fri, 18 Aug 2023 08:25:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wxswEvkq32RqCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 18 Aug 2023 08:25:29 +0000
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
X-Inumbo-ID: cabb5838-3da0-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692347129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+FPa9krCW/PTTrpGN+WdauEG28GM2pGBHxgkKSRG/Eg=;
	b=NZvjjXmupGWeXrALBRf7kF+ADZ58EHr4ytXDMS8ZZbBLbX0/t8JyLAFnV/WaOxDFVli9eS
	+M9FNcKCXI9LRyUM5bzC97ubwQZTvgUCFhHBn2WezaHJ8miqfxan3GBs8r9rek5Yl9ynQt
	oHS+pXLHgbpY8+u/CuKJ3G5SYvi5ZZo=
Message-ID: <8a463a31-0bbd-414f-91ea-7d5342cbc148@suse.com>
Date: Fri, 18 Aug 2023 10:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
 <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
 <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
 <857a72e2-4716-4419-9955-ad044e73151d@suse.com>
 <cb383251-3c90-4579-b6c5-19662d828969@xen.org>
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
In-Reply-To: <cb383251-3c90-4579-b6c5-19662d828969@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D0wAdHhzLL1G270b4XLSs8XC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------D0wAdHhzLL1G270b4XLSs8XC
Content-Type: multipart/mixed; boundary="------------ift2KQ9DbulT9LlM9Qwfq0Sw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Message-ID: <8a463a31-0bbd-414f-91ea-7d5342cbc148@suse.com>
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
 <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
 <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
 <857a72e2-4716-4419-9955-ad044e73151d@suse.com>
 <cb383251-3c90-4579-b6c5-19662d828969@xen.org>
In-Reply-To: <cb383251-3c90-4579-b6c5-19662d828969@xen.org>

--------------ift2KQ9DbulT9LlM9Qwfq0Sw
Content-Type: multipart/mixed; boundary="------------yXcf1N2WGcR28JGrYVVqH2R3"

--------------yXcf1N2WGcR28JGrYVVqH2R3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjMgMTA6MDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxOC8wOC8yMDIzIDA5OjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTguMDgu
MjMgMDk6MzksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKYW4sDQo+Pj4NCj4+PiBP
biAxOC8wOC8yMDIzIDA3OjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMTcuMDgu
MjAyMyAyMzo0MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2FyY2gtYXJtLmgNCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9h
cmNoLWFybS5oDQo+Pj4+PiBAQCAtMzM5LDM2ICszMzksMzYgQEAgdHlwZWRlZiB1aW50NjRf
dCB4ZW5fY2FsbGJhY2tfdDsNCj4+Pj4+IMKgIC8qIFBTUiBiaXRzIChDUFNSLCBTUFNSKSAq
Lw0KPj4+Pj4gLSNkZWZpbmUgUFNSX1RIVU1CwqDCoMKgwqDCoMKgICgxPDw1KcKgwqDCoMKg
wqDCoMKgIC8qIFRodW1iIE1vZGUgZW5hYmxlICovDQo+Pj4+PiAtI2RlZmluZSBQU1JfRklR
X01BU0vCoMKgwqAgKDE8PDYpwqDCoMKgwqDCoMKgwqAgLyogRmFzdCBJbnRlcnJ1cHQgbWFz
ayAqLw0KPj4+Pj4gLSNkZWZpbmUgUFNSX0lSUV9NQVNLwqDCoMKgICgxPDw3KcKgwqDCoMKg
wqDCoMKgIC8qIEludGVycnVwdCBtYXNrICovDQo+Pj4+PiAtI2RlZmluZSBQU1JfQUJUX01B
U0vCoMKgwqAgKDE8PDgpwqDCoMKgwqDCoMKgwqAgLyogQXN5bmNocm9ub3VzIEFib3J0IG1h
c2sgKi8NCj4+Pj4+IC0jZGVmaW5lIFBTUl9CSUdfRU5ESUFOwqAgKDE8PDkpwqDCoMKgwqDC
oMKgwqAgLyogYXJtMzI6IEJpZyBFbmRpYW4gTW9kZSAqLw0KPj4+Pj4gLSNkZWZpbmUgUFNS
X0RCR19NQVNLwqDCoMKgICgxPDw5KcKgwqDCoMKgwqDCoMKgIC8qIGFybTY0OiBEZWJ1ZyBF
eGNlcHRpb24gbWFzayAqLw0KPj4+Pj4gLSNkZWZpbmUgUFNSX0lUX01BU0vCoMKgwqDCoCAo
MHgwNjAwZmMwMCnCoCAvKiBUaHVtYiBJZi1UaGVuIE1hc2sgKi8NCj4+Pj4+IC0jZGVmaW5l
IFBTUl9KQVpFTExFwqDCoMKgwqAgKDE8PDI0KcKgwqDCoMKgwqDCoCAvKiBKYXplbGxlIE1v
ZGUgKi8NCj4+Pj4+IC0jZGVmaW5lIFBTUl9awqDCoMKgwqDCoMKgwqDCoMKgwqAgKDE8PDMw
KcKgwqDCoMKgwqDCoCAvKiBaZXJvIGNvbmRpdGlvbiBmbGFnICovDQo+Pj4+PiArI2RlZmlu
ZSBQU1JfVEhVTULCoMKgwqDCoMKgwqAgKDFVIDw8NSnCoMKgwqDCoMKgIC8qIFRodW1iIE1v
ZGUgZW5hYmxlICovDQo+Pj4+PiArI2RlZmluZSBQU1JfRklRX01BU0vCoMKgwqAgKDFVIDw8
NinCoMKgwqDCoMKgIC8qIEZhc3QgSW50ZXJydXB0IG1hc2sgKi8NCj4+Pj4+ICsjZGVmaW5l
IFBTUl9JUlFfTUFTS8KgwqDCoCAoMVUgPDw3KcKgwqDCoMKgwqAgLyogSW50ZXJydXB0IG1h
c2sgKi8NCj4+Pj4+ICsjZGVmaW5lIFBTUl9BQlRfTUFTS8KgwqDCoCAoMVUgPDw4KcKgwqDC
oMKgwqAgLyogQXN5bmNocm9ub3VzIEFib3J0IG1hc2sgKi8NCj4+Pj4NCj4+Pj4gTml0OiBE
aWQgeW91IG1lYW4gdG8gaW5zZXJ0IGJsYW5rcyBhbHNvIG9uIHRoZSByaHMgb2YgdGhlIDw8
LCBsaWtlIHlvdSAuLi4NCj4+Pj4NCj4+Pj4+ICsjZGVmaW5lIFBTUl9CSUdfRU5ESUFOwqAg
KDFVIDw8IDkpwqDCoMKgwqAgLyogYXJtMzI6IEJpZyBFbmRpYW4gTW9kZSAqLw0KPj4+Pj4g
KyNkZWZpbmUgUFNSX0RCR19NQVNLwqDCoMKgICgxVSA8PCA5KcKgwqDCoMKgIC8qIGFybTY0
OiBEZWJ1ZyBFeGNlcHRpb24gbWFzayAqLw0KPj4+Pj4gKyNkZWZpbmUgUFNSX0lUX01BU0vC
oMKgwqDCoCAoMHgwNjAwZmMwMFUpIC8qIFRodW1iIElmLVRoZW4gTWFzayAqLw0KPj4+Pj4g
KyNkZWZpbmUgUFNSX0pBWkVMTEXCoMKgwqDCoCAoMVUgPDwgMjQpwqDCoMKgIC8qIEphemVs
bGUgTW9kZSAqLw0KPj4+Pj4gKyNkZWZpbmUgUFNSX1rCoMKgwqDCoMKgwqDCoMKgwqDCoCAo
MVUgPDwgMzApwqDCoMKgIC8qIFplcm8gY29uZGl0aW9uIGZsYWcgKi8NCj4+Pj4NCj4+Pj4g
Li4uIGRpZCBldmVyeXdoZXJlIGhlcmU/DQo+Pj4NCj4+PiBZZXMgSSBkaWQuIEkgd2lsbCB1
cGRhdGUgdGhlIHBhdGNoLg0KPj4+DQo+Pj4+DQo+Pj4+IEFzIGFuIGFzaWRlIEkgd29uZGVy
IHdoeSB0aGV5J3JlIGhlcmU6IFRoZXkgbG9vayBsaWtlIGRlZmluaXRpb25zIG9mDQo+Pj4+
IHByb2Nlc3NvciByZWdpc3RlcnMsIHdoaWNoIGFyZW4ndCB1bmRlciBvdXIgKFhlbidzKSBj
b250cm9sLg0KPj4+DQo+Pj4gSSBhZ3JlZSB0aGV5IGFyZSBub3QgdW5kZXIgWGVuJ3MgY29u
dHJvbC4gSG93ZXZlciwgdGhleSBhcmUgdXNlZCBieSB0aGUgDQo+Pj4gdG9vbHN0YWNrIGFu
ZCBJSVJDIGJhY2sgdGhlbiB0aGV5IHdlcmUgbm90IGF2YWlsYWJsZSBpbiBhbnkgb3RoZXIg
aGVhZGVycy4NCj4+Pg0KPj4+IE5vdGUgdGhhdCB0aGV5IGFyZSBvbmx5IGF2YWlsYWJsZSBi
eSB0aGUgdG9vbHMgYW5kIHRoZSBoeXBlcnZpc29yIChzZWUgI2lmZGVmIA0KPj4+IGFib3Zl
KS4NCj4+Pg0KPj4+PiBJIGFzayBpbg0KPj4+PiBwYXJ0IGJlY2F1c2UgdGhlIHByZXNlbmNl
IG9mIHN1Y2ggY29uc3RhbnRzIG1heSB0aGVuIGJlIHRha2VuIGFzDQo+Pj4+IGp1c3RpZmlj
YXRpb24gdG8gYWRkIHNpbWlsYXIgdGhpbmdzIGluIG5ldyBwb3J0cy4gWWV0IHN1Y2ggZGVm
aW5pdGlvbnMNCj4+Pj4gc2hvdWxkbid0IGJlIHB1dCBoZXJlLg0KPj4+DQo+Pj4gwqBGcm9t
IG15IHVuZGVyc3RhbmRpbmcgd2UgYXJlIHVzaW5nIHRoZSBwdWJsaWMgaGVhZGVycyB0byBw
cm92aWRlIA0KPj4+IG1hY3Jvcy9kZWZpbmVzIHRoYXQgYXJlIHVzZWQgYnkgYm90aCB0aGUg
dG9vbHN0YWNrIGFuZCB0aGUgaHlwZXJ2aXNvci4gSWYgDQo+Pj4gdGhleSBhcmUgbm90IG1l
YW50IHRvIGJlIGV4cG9zZWQgdG8gdGhlIGd1ZXN0LCB0aGVuIHRoZXkgd2lsbCBiZSBwcm90
ZWN0ZWQgDQo+Pj4gd2l0aCAiI2lmIGRlZmluZWQoX19YRU5fXykgfHwgZGVmaW5lZChfX1hF
Tl9UT09MU19fKSIuDQo+Pj4NCj4+PiBJIHRoaW5rIHdlIGFyZSBpbiBhIHNpbWlsYXIgc2l0
dWF0aW9uIGhlcmUuIFNvIGl0IGlzIG5vdCBjbGVhciB3aGVyZSB0aGV5IA0KPj4+IHNob3Vs
ZCBiZSBwdXQgaWYgd2UgbmVlZCB0byBzaGFyZSB0aGVtIGJldHdlZW4gdGhlIGh5cGVydmlz
b3IgYW5kIHRoZSB0b29sc3RhY2suDQo+Pg0KPj4gV2hhdCBhYm91dCBpbmNsdWRlL3hlbi9s
aWI/IFRoZXJlIGFyZSBoZWFkZXJzIGJlbG93IHRoYXQgbGlua2VkIGF0IGJ1aWxkIHRpbWUN
Cj4+IHZpYSB0b29scy9pbmNsdWRlL01ha2VmaWxlIHRvIHRvb2xzL2luY2x1ZGUveGVuL2xp
Yi4NCj4gDQo+IFRvIG1lLCB0aGUgcXVlc3Rpb24gaXMgd2h5IHdvdWxkIHdlIHdhbnQgdG8g
bW92ZSBQU1JfKiBpbiB4ZW4vbGliIChvciB3aGF0ZXZlciANCj4gbmFtZSB3ZSBkZWNpZGUp
IGJ1dCBhbGwgdGhlIG90aGVyIGRlZmluZXMgdGhhdCBhcmUgb25seSB1c2VkIGJ5IHRoZSB0
b29sc3RhY2sgDQo+IHdvdWxkIHN0aWxsIGJlIGluIHB1YmxpYy8uDQo+IA0KPiBTbyBhcmUg
eW91IHN1Z2dlc3RpbmcgdG8gbW92ZSBhbGwgdGhlIHRvb2xzIG9ubHkgaW5mb3JtYXRpb24g
aW4geGVuL2xpYj8NCg0KSSBkaWRuJ3Qgd2FudCB0byBzdWdnZXN0IHRoYXQsIGVzcGVjaWFs
bHkgd2l0aCBvdXIgZ2VuZXJhbCBkZXNpcmUgdG8gc3dpdGNoIHRoZQ0KdG9vbHMnIGludGVy
ZmFjZXMgdG8gc3RhYmxlIG9uZXMuDQoNCkkganVzdCB3YW50ZWQgdG8gcG9pbnQgb3V0IHRo
YXQgdGhlcmUgYXJlIG90aGVyIGxvY2F0aW9ucyBhdmFpbGFibGUgYWxyZWFkeQ0Kd2hlcmUg
c3VjaCBpbmZvcm1hdGlvbiBjb3VsZCBiZSBzaGFyZWQgYmV0d2VlbiBoeXBlcnZpc29yIGFu
ZCB0b29scy4gRXNwZWNpYWxseQ0KaW5mb3JtYXRpb24gcmVsYXRlZCB0byBoYXJkd2FyZSAo
c28gbm90IGFuIGludGVyZmFjZSB3ZSBhcmUgZGVmaW5pbmcpIG1pZ2h0IGJlDQphIGdvb2Qg
Y2FuZGlkYXRlIGZvciBzdWNoIGFuIGFsdGVybmF0aXZlIGxvY2F0aW9uLg0KDQpCdXQgaW4g
dGhlIGVuZCBpdCBpcyBub3QgbWUgdG8gZGVjaWRlIHdoYXQgdG8gdXNlLiBJIHdhcyBqdXN0
IGdpdmluZyBhIGhpbnQuIDotKQ0KDQoNCkp1ZXJnZW4NCg==
--------------yXcf1N2WGcR28JGrYVVqH2R3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yXcf1N2WGcR28JGrYVVqH2R3--

--------------ift2KQ9DbulT9LlM9Qwfq0Sw--

--------------D0wAdHhzLL1G270b4XLSs8XC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTfKvgFAwAAAAAACgkQsN6d1ii/Ey8I
GQf6A4hGGt4FPbE6AWVdAbrKbdoayuZDBO1grvYAVJx7MyMGyIXzy0ijc+NpfWvLqehGAq83S1Gr
qNWPCNA+gYEYLjfv8oZ5piRWcgp1K7F4YiwJC9ZMi7O3I+OFaAffmip2+z+tfyc3fQTDojXcBBNd
HN6E0kXdSAA44HiYXCsaTFIFz6NNzzLlfsI12SwKeA6wnzAOhBg6ji9KNDCNOY5Fwt0ZIDE0sHMQ
yIczjaFd9gfi6YCn+DpO7AU5Mp6VZmrz/qlNFbDvY4PI6K+BV2BcwUYJxeBZfholh8iJdJrmDfBi
yQKR18tf1T8Qnhq+kHvSRu1DP8qjZD7XY0j5YFa6Eg==
=MQ1+
-----END PGP SIGNATURE-----

--------------D0wAdHhzLL1G270b4XLSs8XC--

