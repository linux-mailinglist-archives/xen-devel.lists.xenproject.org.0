Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F834998038
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815796.1230002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syohf-00048b-Cg; Thu, 10 Oct 2024 08:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815796.1230002; Thu, 10 Oct 2024 08:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syohf-000461-9s; Thu, 10 Oct 2024 08:39:23 +0000
Received: by outflank-mailman (input) for mailman id 815796;
 Thu, 10 Oct 2024 08:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syohd-0003qs-Lo
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:39:21 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ddbef2-86e3-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 10:39:20 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43055b43604so5834235e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 01:39:20 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4311835c4fbsm8847405e9.39.2024.10.10.01.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 01:39:19 -0700 (PDT)
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
X-Inumbo-ID: 24ddbef2-86e3-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728549560; x=1729154360; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCZuBk9Z9qNS8HU0hjwMIMOrDWce7O1Fl/3I1ZHY9To=;
        b=E2Ldu2AErEL3FcZ/sfsarzf63qWHP2s7E6Ln5UHBymHbsj719Ac+YadL8nxBub1Bzz
         BNm/EmAZeePOX37dBI8XStkt19BGpUyah42jN1xEhg3mAbOxyAc8EZqrig3/G3XHc0UR
         vxhYpAU1stELfn0JB1/TjLwktTc7BzuITAov63029iVlqGE+E8bNIH03aBsubm9cAdb7
         gkIWeURxnPzlDvjqNSJ+RaNLw4kqcKP0M39i5baax7GUdSgVIqZhxLEgShQfwjiR+D1E
         EyGmCAYeHSDBNyvdd6FOFcc3yI7u86Jld/hixYvbBkezMFn+DmWxlBs6HZJFmisIO4kN
         hYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549560; x=1729154360;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCZuBk9Z9qNS8HU0hjwMIMOrDWce7O1Fl/3I1ZHY9To=;
        b=oC/MPt6MtvcdJY+RwJkNZwi5cVHOIiX7BDeiwdd1G7aL4T/tZOypAMdjGzVru1ZzwT
         U2m3HyvTm0tpoOC4aMy0q+dAXiP/bqOVuDCJdoGSNAmiueBe2kQiJNSwPwkvoLF1h+mq
         2HjUf9mp7249OjK6nQjbke4vwIQEisI5Sk1t2bQvIAwh0kFfyVRjlEy3Pp/b163oNzOI
         CMVpDl1Jwxkxc3wcW+mfrXuN8VhGT/1Uvy8x8byFCrEbUbq4b+KGP7XKlHDTvRiQESjb
         cwrYyvI0pIlLWK1UgvFzMfegE3cKdvaWLj0dQktEkZLZqZs60qfDQK/gbGDjdkSB/W4F
         KcIg==
X-Gm-Message-State: AOJu0YzzcKTowa2esYzJyBAunUnnL/C5zftN7Iw8bKuSRqwM9ZHyIXgr
	aQwqZ8cok6gFqMsTOIDO1I7stkubJ03iqWpvIua9AZEmb7+1ZhxHYzRs++Hu4Wc=
X-Google-Smtp-Source: AGHT+IEGiVX4Qqrts3FDxq9q5ihtW24ru2VKa3ERbgHsOb0DhYJmQfXCuIngoIoHbbbce+zNT71UTg==
X-Received: by 2002:a05:600c:3543:b0:430:699b:7d22 with SMTP id 5b1f17b1804b1-430d6facb53mr46326005e9.26.1728549560033;
        Thu, 10 Oct 2024 01:39:20 -0700 (PDT)
Message-ID: <e7b98fbf-ee28-4083-a4c5-7dc122252e07@suse.com>
Date: Thu, 10 Oct 2024 10:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5JLKjz3mUhBs0KD9nsYdqmCO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5JLKjz3mUhBs0KD9nsYdqmCO
Content-Type: multipart/mixed; boundary="------------nKIDyJ1Fqtsi3Zi7CZrTsZD0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <e7b98fbf-ee28-4083-a4c5-7dc122252e07@suse.com>
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
In-Reply-To: <20241010075848.1002891-1-Jiqian.Chen@amd.com>

--------------nKIDyJ1Fqtsi3Zi7CZrTsZD0
Content-Type: multipart/mixed; boundary="------------R64fdqNZBeRN9br6IgVuJq1i"

--------------R64fdqNZBeRN9br6IgVuJq1i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTAuMjQgMDk6NTgsIEppcWlhbiBDaGVuIHdyb3RlOg0KPiBDb21taXQgMmZhZTZi
YjdiZTMyICgieGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbCB0byBnZXQgZ3NpIGZyb20g
ZGV2IikNCj4gYWRkcyBhIHdlYWsgcmV2ZXJzZSBkZXBlbmRlbmN5IHRvIHRoZSBjb25maWcg
WEVOX1BSSVZDTUQgZGVmaW5pdGlvbiwgdGhhdA0KPiBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4t
cHJpdmNtZCBjYW4ndCBiZSBsb2FkZWQgb24gZG9tVSwgYmVjYXVzZQ0KPiBkZXBlbmRlbnQg
eGVuLXBjaWJhY2sgaXMgYWx3YXlzIG5vdCBiZSBsb2FkZWQgc3VjY2Vzc2Z1bGx5IG9uIGRv
bVUuDQo+IA0KPiBUbyBzb2x2ZSBhYm92ZSBwcm9ibGVtLCByZW1vdmUgdGhhdCBkZXBlbmRl
bmN5LCBhbmQgZG8gbm90IGNhbGwNCj4gcGNpc3R1Yl9nZXRfZ3NpX2Zyb21fc2JkZigpIGRp
cmVjdGx5LCBpbnN0ZWFkIGFkZCBhIGhvb2sgaW4NCj4gZHJpdmVycy94ZW4vYXBjaS5jLCB4
ZW4tcGNpYmFjayByZWdpc3RlciB0aGUgcmVhbCBjYWxsIGZ1bmN0aW9uLCB0aGVuIGluDQo+
IHByaXZjbWRfaW9jdGxfcGNpZGV2X2dldF9nc2kgY2FsbCB0aGF0IGhvb2suDQo+IA0KPiBG
aXhlczogMmZhZTZiYjdiZTMyICgieGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbCB0byBn
ZXQgZ3NpIGZyb20gZGV2IikNCj4gUmVwb3J0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1H
w7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+IC0tLQ0KPiB2MS0+
djIgY2hhbmdlczoNCj4gQWRkZWQgaG9vayB4ZW5fYWNwaV9nZXRfZ3NpX2Zyb21fc2JkZi4N
Cj4gQ2hhbmdlZCBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmIHRvIHN0YXRpYyBhbmQgcGNp
YmFjayByZWdpc3RlciBpdCBhcyB0aGUgcmVhbCBob29rIGZ1bmN0aW9uLg0KPiAtLS0NCj4g
ICBkcml2ZXJzL3hlbi9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZl
cnMveGVuL2FjcGkuYyAgICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKw0K
PiAgIGRyaXZlcnMveGVuL3ByaXZjbWQuYyAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4g
ICBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jIHwgIDQgKystLQ0KPiAgIGlu
Y2x1ZGUveGVuL2FjcGkuaCAgICAgICAgICAgICAgICAgfCAxMiArKysrLS0tLS0tLS0NCj4g
ICA1IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL0tjb25maWcgYi9kcml2ZXJzL3hlbi9L
Y29uZmlnDQo+IGluZGV4IDcyZGRlZTRjMTU0NC4uZjdkNmY0Nzk3MWZkIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3hlbi9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMveGVuL0tjb25maWcN
Cj4gQEAgLTI2MSw3ICsyNjEsNiBAQCBjb25maWcgWEVOX1NDU0lfQkFDS0VORA0KPiAgIGNv
bmZpZyBYRU5fUFJJVkNNRA0KPiAgIAl0cmlzdGF0ZSAiWGVuIGh5cGVyY2FsbCBwYXNzdGhy
b3VnaCBkcml2ZXIiDQo+ICAgCWRlcGVuZHMgb24gWEVODQo+IC0JaW1wbHkgWEVOX1BDSURF
Vl9CQUNLRU5EDQo+ICAgCWRlZmF1bHQgbQ0KPiAgIAloZWxwDQo+ICAgCSAgVGhlIGh5cGVy
Y2FsbCBwYXNzdGhyb3VnaCBkcml2ZXIgYWxsb3dzIHByaXZpbGVnZWQgdXNlciBwcm9ncmFt
cyB0bw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYWNwaS5jIGIvZHJpdmVycy94ZW4v
YWNwaS5jDQo+IGluZGV4IDllMjA5NjUyNGZiYy4uMGJmZjJmM2E4N2QyIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3hlbi9hY3BpLmMNCj4gKysrIGIvZHJpdmVycy94ZW4vYWNwaS5jDQo+
IEBAIC0xMjUsMyArMTI1LDIwIEBAIGludCB4ZW5fYWNwaV9nZXRfZ3NpX2luZm8oc3RydWN0
IHBjaV9kZXYgKmRldiwNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1C
T0xfR1BMKHhlbl9hY3BpX2dldF9nc2lfaW5mbyk7DQo+ICsNCj4gK2dldF9nc2lfZnJvbV9z
YmRmX3QgZ2V0X2dzaV9mcm9tX3NiZGYgPSBOVUxMOw0KPiArDQo+ICt2b2lkIHhlbl9hY3Bp
X3JlZ2lzdGVyX2dldF9nc2lfZnVuYyhnZXRfZ3NpX2Zyb21fc2JkZl90IGZ1bmMpDQo+ICt7
DQo+ICsJZ2V0X2dzaV9mcm9tX3NiZGYgPSBmdW5jOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJP
TF9HUEwoeGVuX2FjcGlfcmVnaXN0ZXJfZ2V0X2dzaV9mdW5jKTsNCj4gKw0KPiAraW50IHhl
bl9hY3BpX2dldF9nc2lfZnJvbV9zYmRmKHUzMiBzYmRmKQ0KPiArew0KPiArCWlmIChnZXRf
Z3NpX2Zyb21fc2JkZikNCj4gKwkJcmV0dXJuIGdldF9nc2lfZnJvbV9zYmRmKHNiZGYpOw0K
PiArDQo+ICsJcmV0dXJuIC1FSU5WQUw7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MX0dQTCh4
ZW5fYWNwaV9nZXRfZ3NpX2Zyb21fc2JkZik7DQo+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2Yg
ZmlsZQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vcHJpdmNtZC5jIGIvZHJpdmVycy94
ZW4vcHJpdmNtZC5jDQo+IGluZGV4IDMyNzNjYjhjMmE2Ni4uNGY3NWJjODc2NDU0IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3hlbi9wcml2Y21kLmMNCj4gKysrIGIvZHJpdmVycy94ZW4v
cHJpdmNtZC5jDQo+IEBAIC04NTAsMTUgKzg1MCwxMyBAQCBzdGF0aWMgbG9uZyBwcml2Y21k
X2lvY3RsX21tYXBfcmVzb3VyY2Uoc3RydWN0IGZpbGUgKmZpbGUsDQo+ICAgc3RhdGljIGxv
bmcgcHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9p
ZCBfX3VzZXIgKnVkYXRhKQ0KPiAgIHsNCj4gICAjaWYgZGVmaW5lZChDT05GSUdfWEVOX0FD
UEkpDQo+IC0JaW50IHJjID0gLUVJTlZBTDsNCj4gKwlpbnQgcmM7DQo+ICAgCXN0cnVjdCBw
cml2Y21kX3BjaWRldl9nZXRfZ3NpIGtkYXRhOw0KPiAgIA0KPiAgIAlpZiAoY29weV9mcm9t
X3VzZXIoJmtkYXRhLCB1ZGF0YSwgc2l6ZW9mKGtkYXRhKSkpDQo+ICAgCQlyZXR1cm4gLUVG
QVVMVDsNCj4gICANCj4gLQlpZiAoSVNfUkVBQ0hBQkxFKENPTkZJR19YRU5fUENJREVWX0JB
Q0tFTkQpKQ0KPiAtCQlyYyA9IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYoa2RhdGEuc2Jk
Zik7DQo+IC0NCj4gKwlyYyA9IHhlbl9hY3BpX2dldF9nc2lfZnJvbV9zYmRmKGtkYXRhLnNi
ZGYpOw0KPiAgIAlpZiAocmMgPCAwKQ0KPiAgIAkJcmV0dXJuIHJjOw0KPiAgIA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyBiL2RyaXZlcnMv
eGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMNCj4gaW5kZXggMmYzZGE1YWM2MmNkLi45MDBl
NjE5OWVlYzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9z
dHViLmMNCj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYw0KPiBA
QCAtMjI3LDcgKzIyNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqcGNpc3R1Yl9kZXZp
Y2VfZ2V0X3BjaV9kZXYoc3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXYsDQo+ICAgfQ0K
PiAgIA0KPiAgICNpZmRlZiBDT05GSUdfWEVOX0FDUEkNCj4gLWludCBwY2lzdHViX2dldF9n
c2lfZnJvbV9zYmRmKHVuc2lnbmVkIGludCBzYmRmKQ0KPiArc3RhdGljIGludCBwY2lzdHVi
X2dldF9nc2lfZnJvbV9zYmRmKHVuc2lnbmVkIGludCBzYmRmKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IHBjaXN0dWJfZGV2aWNlICpwc2RldjsNCj4gICAJaW50IGRvbWFpbiA9IChzYmRmID4+
IDE2KSAmIDB4ZmZmZjsNCj4gQEAgLTI0Miw3ICsyNDIsNiBAQCBpbnQgcGNpc3R1Yl9nZXRf
Z3NpX2Zyb21fc2JkZih1bnNpZ25lZCBpbnQgc2JkZikNCj4gICANCj4gICAJcmV0dXJuIHBz
ZGV2LT5nc2k7DQo+ICAgfQ0KPiAtRVhQT1JUX1NZTUJPTF9HUEwocGNpc3R1Yl9nZXRfZ3Np
X2Zyb21fc2JkZik7DQo+ICAgI2VuZGlmDQo+ICAgDQo+ICAgc3RydWN0IHBjaV9kZXYgKnBj
aXN0dWJfZ2V0X3BjaV9kZXZfYnlfc2xvdChzdHJ1Y3QgeGVuX3BjaWJrX2RldmljZSAqcGRl
diwNCj4gQEAgLTQ4NCw2ICs0ODMsNyBAQCBzdGF0aWMgaW50IHBjaXN0dWJfaW5pdF9kZXZp
Y2Uoc3RydWN0IHBjaXN0dWJfZGV2aWNlICpwc2RldikNCj4gICAJCWlmIChlcnIpDQo+ICAg
CQkJZ290byBjb25maWdfcmVsZWFzZTsNCj4gICAJCXBzZGV2LT5nc2kgPSBnc2k7DQo+ICsJ
CXhlbl9hY3BpX3JlZ2lzdGVyX2dldF9nc2lfZnVuYyhwY2lzdHViX2dldF9nc2lfZnJvbV9z
YmRmKTsNCg0KSSBkb24ndCB0aGluayB0aGlzIGlzIHRoZSByaWdodCBwbGFjZSBmb3IgcmVn
aXN0ZXJpbmcgdGhlIGZ1bmN0aW9uLg0KDQpJdCBzaG91bGQgYmUgZG9uZSBhdCB0aGUgZW5k
IG9mIHhlbl9wY2lia19pbml0KCkgKGd1YXJkZWQgd2l0aCBDT05GSUdfWEVOX0FDUEkpLg0K
DQpBZGRpdGlvbmFsbHkgeW91IHNob3VsZCByZXNldCB0aGUgZnVuY3Rpb24gcG9pbnRlciBO
VUxMIGluIHhlbl9wY2lia19jbGVhbnVwKCkuDQoNCg0KSnVlcmdlbg0K
--------------R64fdqNZBeRN9br6IgVuJq1i
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------R64fdqNZBeRN9br6IgVuJq1i--

--------------nKIDyJ1Fqtsi3Zi7CZrTsZD0--

--------------5JLKjz3mUhBs0KD9nsYdqmCO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcHkrcFAwAAAAAACgkQsN6d1ii/Ey+B
2ggAkacemurpyKS7QfXQWS6HcxfbEYySl/oVABB6Ol7WbSR5sFe+jUr1uCwOJXeakJ5JFBm1juPw
UT7wOqITr0eoozgKKwUzOZKy+M3PFXlD/xCHC+bPuGGRfl5VCkJsWIkMy+d0yA/rDVoOb6PPuc1S
m33OyHtAJTJl3m0JjNSp99iZ5oSXzfD6G/w/cQokjXP7tokktc9J4Yq/Ft+n9WF7Gr5HAxwy9TqA
yFz7uIV3Sk8afUYJTrYBK1l+i4obVvSjq4wJYDGQ3vvR2/aWRfKjv5t/WWFWwbezKYjdh4/XQfHT
6pOzUAVcuJCpLvQPtfa53cvVPYc5XDcLpETPjU2aCg==
=3R75
-----END PGP SIGNATURE-----

--------------5JLKjz3mUhBs0KD9nsYdqmCO--

