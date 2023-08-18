Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBC47806CE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 10:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585820.917008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWuPK-0002K3-Oe; Fri, 18 Aug 2023 08:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585820.917008; Fri, 18 Aug 2023 08:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWuPK-0002I8-Ln; Fri, 18 Aug 2023 08:00:34 +0000
Received: by outflank-mailman (input) for mailman id 585820;
 Fri, 18 Aug 2023 08:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZyU=ED=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qWuPI-0002I1-HI
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 08:00:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cf6399b-3d9d-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 10:00:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A7B31F893;
 Fri, 18 Aug 2023 08:00:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7297138F0;
 Fri, 18 Aug 2023 08:00:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +HjmLh0l32SjewAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 18 Aug 2023 08:00:29 +0000
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
X-Inumbo-ID: 4cf6399b-3d9d-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692345630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mdotYSzjAVCcYOSAM4tLj0J/xk7pq4ld4UVI3X1MVOE=;
	b=YcPS5z6cMp8/sUEfART6sTO0KesO2bHGFS88SB0BLxuz1QngMH0GNnzIzopXvQ10VtHtBn
	zzD1YcClNjk+p7B1NnIIslmCabz64qceHHxUxA29+uLwZjT5vMYgthH7gyLE2NvOHjeSg0
	KADZzcFdEIQmG+aaRGqrh8yJWQp3vxM=
Message-ID: <857a72e2-4716-4419-9955-ad044e73151d@suse.com>
Date: Fri, 18 Aug 2023 10:00:29 +0200
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
In-Reply-To: <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uWQXWDORZJaVXTSgcjnMz5FN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uWQXWDORZJaVXTSgcjnMz5FN
Content-Type: multipart/mixed; boundary="------------9vsib90BERXL67BDf7UyxhLv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Message-ID: <857a72e2-4716-4419-9955-ad044e73151d@suse.com>
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
 <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
 <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
In-Reply-To: <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>

--------------9vsib90BERXL67BDf7UyxhLv
Content-Type: multipart/mixed; boundary="------------r1oVt7cEPJSz8oYhFFAhV0Vr"

--------------r1oVt7cEPJSz8oYhFFAhV0Vr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjMgMDk6MzksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSmFuLA0KPiAN
Cj4gT24gMTgvMDgvMjAyMyAwNzozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNy4w
OC4yMDIzIDIzOjQzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2FyY2gtYXJtLmgNCj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJj
aC1hcm0uaA0KPj4+IEBAIC0zMzksMzYgKzMzOSwzNiBAQCB0eXBlZGVmIHVpbnQ2NF90IHhl
bl9jYWxsYmFja190Ow0KPj4+IMKgIC8qIFBTUiBiaXRzIChDUFNSLCBTUFNSKSAqLw0KPj4+
IC0jZGVmaW5lIFBTUl9USFVNQsKgwqDCoMKgwqDCoCAoMTw8NSnCoMKgwqDCoMKgwqDCoCAv
KiBUaHVtYiBNb2RlIGVuYWJsZSAqLw0KPj4+IC0jZGVmaW5lIFBTUl9GSVFfTUFTS8KgwqDC
oCAoMTw8NinCoMKgwqDCoMKgwqDCoCAvKiBGYXN0IEludGVycnVwdCBtYXNrICovDQo+Pj4g
LSNkZWZpbmUgUFNSX0lSUV9NQVNLwqDCoMKgICgxPDw3KcKgwqDCoMKgwqDCoMKgIC8qIElu
dGVycnVwdCBtYXNrICovDQo+Pj4gLSNkZWZpbmUgUFNSX0FCVF9NQVNLwqDCoMKgICgxPDw4
KcKgwqDCoMKgwqDCoMKgIC8qIEFzeW5jaHJvbm91cyBBYm9ydCBtYXNrICovDQo+Pj4gLSNk
ZWZpbmUgUFNSX0JJR19FTkRJQU7CoCAoMTw8OSnCoMKgwqDCoMKgwqDCoCAvKiBhcm0zMjog
QmlnIEVuZGlhbiBNb2RlICovDQo+Pj4gLSNkZWZpbmUgUFNSX0RCR19NQVNLwqDCoMKgICgx
PDw5KcKgwqDCoMKgwqDCoMKgIC8qIGFybTY0OiBEZWJ1ZyBFeGNlcHRpb24gbWFzayAqLw0K
Pj4+IC0jZGVmaW5lIFBTUl9JVF9NQVNLwqDCoMKgwqAgKDB4MDYwMGZjMDApwqAgLyogVGh1
bWIgSWYtVGhlbiBNYXNrICovDQo+Pj4gLSNkZWZpbmUgUFNSX0pBWkVMTEXCoMKgwqDCoCAo
MTw8MjQpwqDCoMKgwqDCoMKgIC8qIEphemVsbGUgTW9kZSAqLw0KPj4+IC0jZGVmaW5lIFBT
Ul9awqDCoMKgwqDCoMKgwqDCoMKgwqAgKDE8PDMwKcKgwqDCoMKgwqDCoCAvKiBaZXJvIGNv
bmRpdGlvbiBmbGFnICovDQo+Pj4gKyNkZWZpbmUgUFNSX1RIVU1CwqDCoMKgwqDCoMKgICgx
VSA8PDUpwqDCoMKgwqDCoCAvKiBUaHVtYiBNb2RlIGVuYWJsZSAqLw0KPj4+ICsjZGVmaW5l
IFBTUl9GSVFfTUFTS8KgwqDCoCAoMVUgPDw2KcKgwqDCoMKgwqAgLyogRmFzdCBJbnRlcnJ1
cHQgbWFzayAqLw0KPj4+ICsjZGVmaW5lIFBTUl9JUlFfTUFTS8KgwqDCoCAoMVUgPDw3KcKg
wqDCoMKgwqAgLyogSW50ZXJydXB0IG1hc2sgKi8NCj4+PiArI2RlZmluZSBQU1JfQUJUX01B
U0vCoMKgwqAgKDFVIDw8OCnCoMKgwqDCoMKgIC8qIEFzeW5jaHJvbm91cyBBYm9ydCBtYXNr
ICovDQo+Pg0KPj4gTml0OiBEaWQgeW91IG1lYW4gdG8gaW5zZXJ0IGJsYW5rcyBhbHNvIG9u
IHRoZSByaHMgb2YgdGhlIDw8LCBsaWtlIHlvdSAuLi4NCj4+DQo+Pj4gKyNkZWZpbmUgUFNS
X0JJR19FTkRJQU7CoCAoMVUgPDwgOSnCoMKgwqDCoCAvKiBhcm0zMjogQmlnIEVuZGlhbiBN
b2RlICovDQo+Pj4gKyNkZWZpbmUgUFNSX0RCR19NQVNLwqDCoMKgICgxVSA8PCA5KcKgwqDC
oMKgIC8qIGFybTY0OiBEZWJ1ZyBFeGNlcHRpb24gbWFzayAqLw0KPj4+ICsjZGVmaW5lIFBT
Ul9JVF9NQVNLwqDCoMKgwqAgKDB4MDYwMGZjMDBVKSAvKiBUaHVtYiBJZi1UaGVuIE1hc2sg
Ki8NCj4+PiArI2RlZmluZSBQU1JfSkFaRUxMRcKgwqDCoMKgICgxVSA8PCAyNCnCoMKgwqAg
LyogSmF6ZWxsZSBNb2RlICovDQo+Pj4gKyNkZWZpbmUgUFNSX1rCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoMVUgPDwgMzApwqDCoMKgIC8qIFplcm8gY29uZGl0aW9uIGZsYWcgKi8NCj4+DQo+
PiAuLi4gZGlkIGV2ZXJ5d2hlcmUgaGVyZT8NCj4gDQo+IFllcyBJIGRpZC4gSSB3aWxsIHVw
ZGF0ZSB0aGUgcGF0Y2guDQo+IA0KPj4NCj4+IEFzIGFuIGFzaWRlIEkgd29uZGVyIHdoeSB0
aGV5J3JlIGhlcmU6IFRoZXkgbG9vayBsaWtlIGRlZmluaXRpb25zIG9mDQo+PiBwcm9jZXNz
b3IgcmVnaXN0ZXJzLCB3aGljaCBhcmVuJ3QgdW5kZXIgb3VyIChYZW4ncykgY29udHJvbC4N
Cj4gDQo+IEkgYWdyZWUgdGhleSBhcmUgbm90IHVuZGVyIFhlbidzIGNvbnRyb2wuIEhvd2V2
ZXIsIHRoZXkgYXJlIHVzZWQgYnkgdGhlIA0KPiB0b29sc3RhY2sgYW5kIElJUkMgYmFjayB0
aGVuIHRoZXkgd2VyZSBub3QgYXZhaWxhYmxlIGluIGFueSBvdGhlciBoZWFkZXJzLg0KPiAN
Cj4gTm90ZSB0aGF0IHRoZXkgYXJlIG9ubHkgYXZhaWxhYmxlIGJ5IHRoZSB0b29scyBhbmQg
dGhlIGh5cGVydmlzb3IgKHNlZSAjaWZkZWYgDQo+IGFib3ZlKS4NCj4gDQo+PiBJIGFzayBp
bg0KPj4gcGFydCBiZWNhdXNlIHRoZSBwcmVzZW5jZSBvZiBzdWNoIGNvbnN0YW50cyBtYXkg
dGhlbiBiZSB0YWtlbiBhcw0KPj4ganVzdGlmaWNhdGlvbiB0byBhZGQgc2ltaWxhciB0aGlu
Z3MgaW4gbmV3IHBvcnRzLiBZZXQgc3VjaCBkZWZpbml0aW9ucw0KPj4gc2hvdWxkbid0IGJl
IHB1dCBoZXJlLg0KPiANCj4gIEZyb20gbXkgdW5kZXJzdGFuZGluZyB3ZSBhcmUgdXNpbmcg
dGhlIHB1YmxpYyBoZWFkZXJzIHRvIHByb3ZpZGUgbWFjcm9zL2RlZmluZXMgDQo+IHRoYXQg
YXJlIHVzZWQgYnkgYm90aCB0aGUgdG9vbHN0YWNrIGFuZCB0aGUgaHlwZXJ2aXNvci4gSWYg
dGhleSBhcmUgbm90IG1lYW50IHRvIA0KPiBiZSBleHBvc2VkIHRvIHRoZSBndWVzdCwgdGhl
biB0aGV5IHdpbGwgYmUgcHJvdGVjdGVkIHdpdGggIiNpZiBkZWZpbmVkKF9fWEVOX18pIA0K
PiB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pIi4NCj4gDQo+IEkgdGhpbmsgd2UgYXJlIGlu
IGEgc2ltaWxhciBzaXR1YXRpb24gaGVyZS4gU28gaXQgaXMgbm90IGNsZWFyIHdoZXJlIHRo
ZXkgc2hvdWxkIA0KPiBiZSBwdXQgaWYgd2UgbmVlZCB0byBzaGFyZSB0aGVtIGJldHdlZW4g
dGhlIGh5cGVydmlzb3IgYW5kIHRoZSB0b29sc3RhY2suDQoNCldoYXQgYWJvdXQgaW5jbHVk
ZS94ZW4vbGliPyBUaGVyZSBhcmUgaGVhZGVycyBiZWxvdyB0aGF0IGxpbmtlZCBhdCBidWls
ZCB0aW1lDQp2aWEgdG9vbHMvaW5jbHVkZS9NYWtlZmlsZSB0byB0b29scy9pbmNsdWRlL3hl
bi9saWIuDQoNCg0KSnVlcmdlbg0K
--------------r1oVt7cEPJSz8oYhFFAhV0Vr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------r1oVt7cEPJSz8oYhFFAhV0Vr--

--------------9vsib90BERXL67BDf7UyxhLv--

--------------uWQXWDORZJaVXTSgcjnMz5FN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTfJR0FAwAAAAAACgkQsN6d1ii/Ey/R
xAf/Wq2odtt7V+nwSkE0yhH92IgkeOW0vV0hRgpTs7PRZHEvZGoaihGy3Klw2LDH0xuwBQhefrBo
P0u7InrCI0scfjbNcU68I3wAfRut8PLWc/mCsrWGuep2DwxlY87gva4xlS2DkZlP+uTtgpZUcTX1
FETS6GL2DH6ebh6Gxn18LWzwEEsvhMoB6CDuuMpPIaRkxEBHD7JEv4I/6KN4ZqZ5HKUKJrq7zIaz
cmjgO+rCqdWV3/bo8EXllF0BYxVceIO3z2bhzOChHBJJTOozXcmf4rI6tJefLe6CbzraCDyUsTAB
WJBuWRuIGcmoGz2WOn/VBOlp4MhsTh2ZbmevLgSshA==
=SNcG
-----END PGP SIGNATURE-----

--------------uWQXWDORZJaVXTSgcjnMz5FN--

