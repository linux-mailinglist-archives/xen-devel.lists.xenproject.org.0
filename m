Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F969983E9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 12:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815984.1230161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqYM-0001VI-P4; Thu, 10 Oct 2024 10:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815984.1230161; Thu, 10 Oct 2024 10:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqYM-0001Th-MC; Thu, 10 Oct 2024 10:37:54 +0000
Received: by outflank-mailman (input) for mailman id 815984;
 Thu, 10 Oct 2024 10:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syqYK-0001OG-QQ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 10:37:52 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b33d38c3-86f3-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 12:37:51 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-431137d12a5so6860235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 03:37:51 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf51753sm44330695e9.23.2024.10.10.03.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 03:37:50 -0700 (PDT)
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
X-Inumbo-ID: b33d38c3-86f3-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728556671; x=1729161471; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nbevQACE1nYmW4FL5nEQASZ4CZJcHmlbpUUmeKvAk0Y=;
        b=EuBEnGz1ld6npqMCpWnc4GO6bdUEiNUXG4TGyK6sNSaToGuXNyreEl/UvrgFKoYEWL
         85mardV4608g9ll19U8fgK/yPs1FoGzEOj3j1wA81PsWQATBPzR91XDc9MCE14zja5nG
         SYBAg5KQhbqC6Wh1gqdPD5X62ZpefeVqzMFLC3Yuc8pOSqSXhLaMLDiy5QxxLlKXteG+
         MCwzwh5+EucvBZ32TUauQMEa9xqWcbYtImUA451Pr4IifVjXc83W6RPFUWIyl9RK3EU6
         FVPEEV5XKCr9Wxcx7giJCmNuUVAMvLddf71UOQwL9xjl5Hu2YAKUG90dKjRxNz4Mv6BZ
         5Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728556671; x=1729161471;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbevQACE1nYmW4FL5nEQASZ4CZJcHmlbpUUmeKvAk0Y=;
        b=lYka7nbB29Gcm6bU5/tjsN2kwbw282U99fth+BMvrC6+KGTzjKSsQ8h9TTdyI6DxhS
         BQQtC3dTYmlPHAPeGR4JEByddK+q8i4C3ZkjzNjkv6WJ6AmvxCR9YCNOkfncQpR23EbP
         nBqiOqJ+X3PxC6whBBykTt2Qre8QAoKOAogiZ5iiilq215qB1u5RhuVmikpbQee54cNA
         n2OeXplU4gOoZIaLZaIHQogHCXsd0RS1k1cY3pUV2hfJv0XWuDa4LSvdtzKl14bxUkGU
         wwJGm2uuoI+WEK5DmONW677jdssLtWkBA4xOcbPd85coF2QeZqPRYEgg7c3x6q2OGU6a
         bpJw==
X-Gm-Message-State: AOJu0Yx5H9P4VzvKKMQd8Q5g8fP40UJa5+UT9mgw+56ngIZudKdCOUny
	Czg8zAG5D0+ODIUvAkp3vNk0A42VVZBe0rc/BDrqj9k9TGu+8LQ+CoX/7dxPCrI=
X-Google-Smtp-Source: AGHT+IE/+XWIRPg9shWWcQFz/+p9lEf/NuZONpfPeIayVQIyCiF4bbmquG84ontWw8hyoiKOiRCT9g==
X-Received: by 2002:a05:600c:1c1f:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-430d7488700mr51702465e9.32.1728556670906;
        Thu, 10 Oct 2024 03:37:50 -0700 (PDT)
Message-ID: <ce672391-5c32-45ee-8f83-2a92aa454bd4@suse.com>
Date: Thu, 10 Oct 2024 12:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
 <e7b98fbf-ee28-4083-a4c5-7dc122252e07@suse.com>
 <BL1PR12MB58490A1ED940EFFF12A4FB38E7782@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58490A1ED940EFFF12A4FB38E7782@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0QEKRA8Qs3ovK0YyLju36Fhd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0QEKRA8Qs3ovK0YyLju36Fhd
Content-Type: multipart/mixed; boundary="------------LTsx08Gsgf08HuO32WuE1Z4m";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <ce672391-5c32-45ee-8f83-2a92aa454bd4@suse.com>
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
 <e7b98fbf-ee28-4083-a4c5-7dc122252e07@suse.com>
 <BL1PR12MB58490A1ED940EFFF12A4FB38E7782@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB58490A1ED940EFFF12A4FB38E7782@BL1PR12MB5849.namprd12.prod.outlook.com>

--------------LTsx08Gsgf08HuO32WuE1Z4m
Content-Type: multipart/mixed; boundary="------------50skecAAKDfGZlCJ3x20CLbJ"

--------------50skecAAKDfGZlCJ3x20CLbJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTAuMjQgMTA6NDMsIENoZW4sIEppcWlhbiB3cm90ZToNCj4gT24gMjAyNC8xMC8x
MCAxNjozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDEwLjEwLjI0IDA5OjU4LCBK
aXFpYW4gQ2hlbiB3cm90ZToNCj4+PiBDb21taXQgMmZhZTZiYjdiZTMyICgieGVuL3ByaXZj
bWQ6IEFkZCBuZXcgc3lzY2FsbCB0byBnZXQgZ3NpIGZyb20gZGV2IikNCj4+PiBhZGRzIGEg
d2VhayByZXZlcnNlIGRlcGVuZGVuY3kgdG8gdGhlIGNvbmZpZyBYRU5fUFJJVkNNRCBkZWZp
bml0aW9uLCB0aGF0DQo+Pj4gZGVwZW5kZW5jeSBjYXVzZXMgeGVuLXByaXZjbWQgY2FuJ3Qg
YmUgbG9hZGVkIG9uIGRvbVUsIGJlY2F1c2UNCj4+PiBkZXBlbmRlbnQgeGVuLXBjaWJhY2sg
aXMgYWx3YXlzIG5vdCBiZSBsb2FkZWQgc3VjY2Vzc2Z1bGx5IG9uIGRvbVUuDQo+Pj4NCj4+
PiBUbyBzb2x2ZSBhYm92ZSBwcm9ibGVtLCByZW1vdmUgdGhhdCBkZXBlbmRlbmN5LCBhbmQg
ZG8gbm90IGNhbGwNCj4+PiBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmKCkgZGlyZWN0bHks
IGluc3RlYWQgYWRkIGEgaG9vayBpbg0KPj4+IGRyaXZlcnMveGVuL2FwY2kuYywgeGVuLXBj
aWJhY2sgcmVnaXN0ZXIgdGhlIHJlYWwgY2FsbCBmdW5jdGlvbiwgdGhlbiBpbg0KPj4+IHBy
aXZjbWRfaW9jdGxfcGNpZGV2X2dldF9nc2kgY2FsbCB0aGF0IGhvb2suDQo+Pj4NCj4+PiBG
aXhlczogMmZhZTZiYjdiZTMyICgieGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbCB0byBn
ZXQgZ3NpIGZyb20gZGV2IikNCj4+PiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tp
LUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+IC0tLQ0K
Pj4+IHYxLT52MiBjaGFuZ2VzOg0KPj4+IEFkZGVkIGhvb2sgeGVuX2FjcGlfZ2V0X2dzaV9m
cm9tX3NiZGYuDQo+Pj4gQ2hhbmdlZCBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmIHRvIHN0
YXRpYyBhbmQgcGNpYmFjayByZWdpc3RlciBpdCBhcyB0aGUgcmVhbCBob29rIGZ1bmN0aW9u
Lg0KPj4+IC0tLQ0KPj4+ICDCoCBkcml2ZXJzL3hlbi9LY29uZmlnwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAxIC0NCj4+PiAgwqAgZHJpdmVycy94ZW4vYWNwaS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNyArKysrKysrKysrKysrKysrKw0K
Pj4+ICDCoCBkcml2ZXJzL3hlbi9wcml2Y21kLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNiArKy0tLS0NCj4+PiAgwqAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0
dWIuYyB8wqAgNCArKy0tDQo+Pj4gIMKgIGluY2x1ZGUveGVuL2FjcGkuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIgKysrKy0tLS0tLS0tDQo+Pj4gIMKgIDUgZmls
ZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vS2NvbmZpZyBiL2RyaXZlcnMveGVuL0tjb25m
aWcNCj4+PiBpbmRleCA3MmRkZWU0YzE1NDQuLmY3ZDZmNDc5NzFmZCAxMDA2NDQNCj4+PiAt
LS0gYS9kcml2ZXJzL3hlbi9LY29uZmlnDQo+Pj4gKysrIGIvZHJpdmVycy94ZW4vS2NvbmZp
Zw0KPj4+IEBAIC0yNjEsNyArMjYxLDYgQEAgY29uZmlnIFhFTl9TQ1NJX0JBQ0tFTkQNCj4+
PiAgwqAgY29uZmlnIFhFTl9QUklWQ01EDQo+Pj4gIMKgwqDCoMKgwqAgdHJpc3RhdGUgIlhl
biBoeXBlcmNhbGwgcGFzc3Rocm91Z2ggZHJpdmVyIg0KPj4+ICDCoMKgwqDCoMKgIGRlcGVu
ZHMgb24gWEVODQo+Pj4gLcKgwqDCoCBpbXBseSBYRU5fUENJREVWX0JBQ0tFTkQNCj4+PiAg
wqDCoMKgwqDCoCBkZWZhdWx0IG0NCj4+PiAgwqDCoMKgwqDCoCBoZWxwDQo+Pj4gIMKgwqDC
oMKgwqDCoMKgIFRoZSBoeXBlcmNhbGwgcGFzc3Rocm91Z2ggZHJpdmVyIGFsbG93cyBwcml2
aWxlZ2VkIHVzZXIgcHJvZ3JhbXMgdG8NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
YWNwaS5jIGIvZHJpdmVycy94ZW4vYWNwaS5jDQo+Pj4gaW5kZXggOWUyMDk2NTI0ZmJjLi4w
YmZmMmYzYTg3ZDIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy94ZW4vYWNwaS5jDQo+Pj4g
KysrIGIvZHJpdmVycy94ZW4vYWNwaS5jDQo+Pj4gQEAgLTEyNSwzICsxMjUsMjAgQEAgaW50
IHhlbl9hY3BpX2dldF9nc2lfaW5mbyhzdHJ1Y3QgcGNpX2RldiAqZGV2LA0KPj4+ICDCoMKg
wqDCoMKgIHJldHVybiAwOw0KPj4+ICDCoCB9DQo+Pj4gIMKgIEVYUE9SVF9TWU1CT0xfR1BM
KHhlbl9hY3BpX2dldF9nc2lfaW5mbyk7DQo+Pj4gKw0KPj4+ICtnZXRfZ3NpX2Zyb21fc2Jk
Zl90IGdldF9nc2lfZnJvbV9zYmRmID0gTlVMTDsNCj4+PiArDQo+Pj4gK3ZvaWQgeGVuX2Fj
cGlfcmVnaXN0ZXJfZ2V0X2dzaV9mdW5jKGdldF9nc2lfZnJvbV9zYmRmX3QgZnVuYykNCj4+
PiArew0KPj4+ICvCoMKgwqAgZ2V0X2dzaV9mcm9tX3NiZGYgPSBmdW5jOw0KPj4+ICt9DQo+
Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKHhlbl9hY3BpX3JlZ2lzdGVyX2dldF9nc2lfZnVuYyk7
DQo+Pj4gKw0KPj4+ICtpbnQgeGVuX2FjcGlfZ2V0X2dzaV9mcm9tX3NiZGYodTMyIHNiZGYp
DQo+Pj4gK3sNCj4+PiArwqDCoMKgIGlmIChnZXRfZ3NpX2Zyb21fc2JkZikNCj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGdldF9nc2lfZnJvbV9zYmRmKHNiZGYpOw0KPj4+ICsNCj4+
PiArwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+ICt9DQo+Pj4gK0VYUE9SVF9TWU1CT0xf
R1BMKHhlbl9hY3BpX2dldF9nc2lfZnJvbV9zYmRmKTsNCj4+PiBcIE5vIG5ld2xpbmUgYXQg
ZW5kIG9mIGZpbGUNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vcHJpdmNtZC5jIGIv
ZHJpdmVycy94ZW4vcHJpdmNtZC5jDQo+Pj4gaW5kZXggMzI3M2NiOGMyYTY2Li40Zjc1YmM4
NzY0NTQgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy94ZW4vcHJpdmNtZC5jDQo+Pj4gKysr
IGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jDQo+Pj4gQEAgLTg1MCwxNSArODUwLDEzIEBAIHN0
YXRpYyBsb25nIHByaXZjbWRfaW9jdGxfbW1hcF9yZXNvdXJjZShzdHJ1Y3QgZmlsZSAqZmls
ZSwNCj4+PiAgwqAgc3RhdGljIGxvbmcgcHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaShz
dHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCBfX3VzZXIgKnVkYXRhKQ0KPj4+ICDCoCB7DQo+Pj4g
IMKgICNpZiBkZWZpbmVkKENPTkZJR19YRU5fQUNQSSkNCj4+PiAtwqDCoMKgIGludCByYyA9
IC1FSU5WQUw7DQo+Pj4gK8KgwqDCoCBpbnQgcmM7DQo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0
IHByaXZjbWRfcGNpZGV2X2dldF9nc2kga2RhdGE7DQo+Pj4gIMKgIMKgwqDCoMKgwqAgaWYg
KGNvcHlfZnJvbV91c2VyKCZrZGF0YSwgdWRhdGEsIHNpemVvZihrZGF0YSkpKQ0KPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+Pj4gIMKgIC3CoMKgwqAgaWYg
KElTX1JFQUNIQUJMRShDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EKSkNCj4+PiAtwqDCoMKg
wqDCoMKgwqAgcmMgPSBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmKGtkYXRhLnNiZGYpOw0K
Pj4+IC0NCj4+PiArwqDCoMKgIHJjID0geGVuX2FjcGlfZ2V0X2dzaV9mcm9tX3NiZGYoa2Rh
dGEuc2JkZik7DQo+Pj4gIMKgwqDCoMKgwqAgaWYgKHJjIDwgMCkNCj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByYzsNCj4+PiAgwqAgZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVu
L3hlbi1wY2liYWNrL3BjaV9zdHViLmMgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lf
c3R1Yi5jDQo+Pj4gaW5kZXggMmYzZGE1YWM2MmNkLi45MDBlNjE5OWVlYzcgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYw0KPj4+ICsrKyBi
L2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMNCj4+PiBAQCAtMjI3LDcgKzIy
Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqcGNpc3R1Yl9kZXZpY2VfZ2V0X3BjaV9k
ZXYoc3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXYsDQo+Pj4gIMKgIH0NCj4+PiAgwqAg
wqAgI2lmZGVmIENPTkZJR19YRU5fQUNQSQ0KPj4+IC1pbnQgcGNpc3R1Yl9nZXRfZ3NpX2Zy
b21fc2JkZih1bnNpZ25lZCBpbnQgc2JkZikNCj4+PiArc3RhdGljIGludCBwY2lzdHViX2dl
dF9nc2lfZnJvbV9zYmRmKHVuc2lnbmVkIGludCBzYmRmKQ0KPj4+ICDCoCB7DQo+Pj4gIMKg
wqDCoMKgwqAgc3RydWN0IHBjaXN0dWJfZGV2aWNlICpwc2RldjsNCj4+PiAgwqDCoMKgwqDC
oCBpbnQgZG9tYWluID0gKHNiZGYgPj4gMTYpICYgMHhmZmZmOw0KPj4+IEBAIC0yNDIsNyAr
MjQyLDYgQEAgaW50IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYodW5zaWduZWQgaW50IHNi
ZGYpDQo+Pj4gIMKgIMKgwqDCoMKgwqAgcmV0dXJuIHBzZGV2LT5nc2k7DQo+Pj4gIMKgIH0N
Cj4+PiAtRVhQT1JUX1NZTUJPTF9HUEwocGNpc3R1Yl9nZXRfZ3NpX2Zyb21fc2JkZik7DQo+
Pj4gIMKgICNlbmRpZg0KPj4+ICDCoCDCoCBzdHJ1Y3QgcGNpX2RldiAqcGNpc3R1Yl9nZXRf
cGNpX2Rldl9ieV9zbG90KHN0cnVjdCB4ZW5fcGNpYmtfZGV2aWNlICpwZGV2LA0KPj4+IEBA
IC00ODQsNiArNDgzLDcgQEAgc3RhdGljIGludCBwY2lzdHViX2luaXRfZGV2aWNlKHN0cnVj
dCBwY2lzdHViX2RldmljZSAqcHNkZXYpDQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
ZXJyKQ0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGNvbmZpZ19yZWxl
YXNlOw0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcHNkZXYtPmdzaSA9IGdzaTsNCj4+PiAr
wqDCoMKgwqDCoMKgwqAgeGVuX2FjcGlfcmVnaXN0ZXJfZ2V0X2dzaV9mdW5jKHBjaXN0dWJf
Z2V0X2dzaV9mcm9tX3NiZGYpOw0KPj4NCj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUg
cmlnaHQgcGxhY2UgZm9yIHJlZ2lzdGVyaW5nIHRoZSBmdW5jdGlvbi4NCj4+DQo+PiBJdCBz
aG91bGQgYmUgZG9uZSBhdCB0aGUgZW5kIG9mIHhlbl9wY2lia19pbml0KCkgKGd1YXJkZWQg
d2l0aCBDT05GSUdfWEVOX0FDUEkpLg0KPj4NCj4+IEFkZGl0aW9uYWxseSB5b3Ugc2hvdWxk
IHJlc2V0IHRoZSBmdW5jdGlvbiBwb2ludGVyIE5VTEwgaW4geGVuX3BjaWJrX2NsZWFudXAo
KS4NCj4gU2hvdWxkIEkgbmVlZCB0byBhZGQgYSBuZXcgdW5yZWdpc3RlciBmdW5jdGlvbiB0
byByZXNldCwgb3IganVzdCBwYXNzIE5VTEwgdG8geGVuX2FjcGlfcmVnaXN0ZXJfZ2V0X2dz
aV9mdW5jID8NCg0KSSB0aGluayBwYXNzaW5nIE5VTEwgaXMgZmluZS4NCg0KQnV0IHlvdSds
bCBuZWVkIHNvbWUga2luZCBvZiBsb2NraW5nIHRvIGF2b2lkIGEgcmFjZSBiZXR3ZWVuIGEg
Y2FsbCBvZg0KdGhlIGhvb2sgYW5kIHBhcmFsbGVsIHVubG9hZGluZyB0aGUgcGNpYmFjayBt
b2R1bGUuDQoNCg0KSnVlcmdlbg0K
--------------50skecAAKDfGZlCJ3x20CLbJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------50skecAAKDfGZlCJ3x20CLbJ--

--------------LTsx08Gsgf08HuO32WuE1Z4m--

--------------0QEKRA8Qs3ovK0YyLju36Fhd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcHrn0FAwAAAAAACgkQsN6d1ii/Ey9Q
1Af9EdHze66ELsEiz+RYmMmklSG3vL2oT/WjNSsq2ui9GcwmJheftFZfnKo5fw3ytrZUuQmN4f4l
PVF2qgf94LN5FO9NQmGRCvW9x/mSvqsrW9d8Y7HcB80P4W6T0jYvLMFzVAzJNIh/RabYDgXeGgoJ
pp7FzYC/kLU8fI2majGZ0npSTGsJEbFmC1gZlcuAWGYj15AigWHb0syhmmLg2wCN3o87VGhnHLqW
EoOFwFMKE4Z9ed7AJnL4QMmYiwkpxpi7xutRICB+KPbi8FLNsTnNq98F6F2dlEyOlg2T3UYw8obe
zYgS2rRygOGfpf1S3BJQIL1mOmEt8TXlwU2ybj+WUw==
=E/gk
-----END PGP SIGNATURE-----

--------------0QEKRA8Qs3ovK0YyLju36Fhd--

