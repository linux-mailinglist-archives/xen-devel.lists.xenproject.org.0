Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C70ADA80B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016465.1393359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR36N-0002en-To; Mon, 16 Jun 2025 06:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016465.1393359; Mon, 16 Jun 2025 06:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR36N-0002cK-QS; Mon, 16 Jun 2025 06:13:51 +0000
Received: by outflank-mailman (input) for mailman id 1016465;
 Mon, 16 Jun 2025 06:13:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR36M-0002cE-MY
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:13:50 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10d11d3d-4a79-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:13:48 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-601dfef6a8dso6813500a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:13:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adfb80d6dc4sm358587366b.22.2025.06.15.23.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:13:47 -0700 (PDT)
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
X-Inumbo-ID: 10d11d3d-4a79-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750054428; x=1750659228; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QAzBmuiIef1zA4biE5+aFtJ5DvgQft2xrm39rHrsYkU=;
        b=KxlBATOhcnnGMQYtgt3gq8Npo1s0oMnswworiaVZRPUZliNLNWjG4AYpaOa4DWt8hc
         QEXBGrFFObt4D1lgcX1JOdxODGsR2T81g5Nh2A0OqC2pLojXvUNJPUN4qN3KHiFMx6s2
         Py9UUhPn/qs5W0fUGMSc/DNmnIQAGQoUqBzVin1CuQbNB5Uz2l3OezQzaVCikB+VFSSH
         orm4tvWvCK34bfMWo7quiUH6FvZxA1zMytcdJ4eJh8FPIFLyhjMGoZF6569/NtBNY6rH
         0Y4xRqq/46r54AzUVBzLYbs2SBguzyGQRV41GSOse6KWhQmx0xWTXaU8y3Hw54+xzcSr
         NyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750054428; x=1750659228;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAzBmuiIef1zA4biE5+aFtJ5DvgQft2xrm39rHrsYkU=;
        b=eMjDO27W8qcy2IDg6URPUXx+WDVBS95CY45utPjuSmWVCQD4C1QA1G5MxTJ7iNCwC9
         DOZ9J3DFD6zyAWFz6Q6PZxV5rAff0OxGUkYP+gFbfstyDzOtVgkIvKc3N2+AMyyBz8x1
         U+4gPXJ1o3EHQiHyqbiR3s9I7Z4xvPeW1JXx7qlGw24y0/g5c2CNndzkCWVSJbe/6YYR
         3p1awTobDagf6pizpGxFcrcl6zCfTAQx1cku+lg82Ke/d2l0Oi4t+nW1AWFoourgo5a5
         ZRdwSEOkvAc63zm7xsam2ew+e2colBe0xLiyTUlrciUeB/VYhWl2KOvNIh31ILRidfko
         yRxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAMRn9yW9RnLXEgMRLuETmV9CXn3Wa76GMcs/fSXIeJWMU8exgB80f8Xb+klBwtnbI3//+M/NvHXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdKMKBiTPo5/e61ZnvuZwbL7NhzQmDFEuTLH8wJY+bGly7cMAT
	moSdI9igUumJc2VMwmRnBrBfAo84LOr531BDBEMq+mzQtq9TNy7kbHky9LTs66mLDPE=
X-Gm-Gg: ASbGncv0JKkFUHQS1B1oCCb/1XQcvC/6kSe5T0IN9cTwxU81/oZ4IAU5mlX4AUChrUB
	RBN/r3X7eFnvCZmDf014aMFcQJTKFvhHqfkxSLcBYEyW1sAKum78Ks8jo7IYKdmpTns0sGBVGIA
	j69sSibrEg6z7eb6wU/WS3CBzZiitjnol1FCyJk65d+nQw8AjPGV6sTqHELkKxGdiNMn4u0RiIs
	CgbOA1ZoYCZ04vneCfse3mL5ihHw1ojb76w4HNXhaXplO4+FhYLN+HtkefDwkAH8jQoCOUISxzi
	/5ZeXLNyX25T1JSdZOR+rdkC0R8ztvc4P7oe88UY0x34A8io4KzSGokJ82hsNr8IExgbBn1hzG3
	z4Z+6KxkzyYWYklnW5k4x4v/xzCHkv9OwSoGBDFpVJxZVctvJ3lLct0NaxKfHucrRpsSDww/4dV
	00W6hca49ZgjQ=
X-Google-Smtp-Source: AGHT+IEsoHdPHs2GbHpJGfUiGgmexR2PZ6Zvdk+XC1uIxahYob5BezXWFK2gKm+98V4dM3aeloeTfQ==
X-Received: by 2002:a17:907:7248:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-adfad48c061mr660330366b.39.1750054427628;
        Sun, 15 Jun 2025 23:13:47 -0700 (PDT)
Message-ID: <468294fd-8804-4099-866c-8ca98436e29a@suse.com>
Date: Mon, 16 Jun 2025 08:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 02/12] kexec: add final kexec stage
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-3-jgross@suse.com>
 <CAKf6xpv+KQx7ESdeXRvMfCj0KfY60yMgc8YU9bXZ2-K4Vv8OZg@mail.gmail.com>
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
In-Reply-To: <CAKf6xpv+KQx7ESdeXRvMfCj0KfY60yMgc8YU9bXZ2-K4Vv8OZg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NhHe0hrQN32VlncWTXtpMlTE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NhHe0hrQN32VlncWTXtpMlTE
Content-Type: multipart/mixed; boundary="------------o04JBRKygnJKUQJx7M3oXwZV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
Message-ID: <468294fd-8804-4099-866c-8ca98436e29a@suse.com>
Subject: Re: [MINI-OS PATCH 02/12] kexec: add final kexec stage
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-3-jgross@suse.com>
 <CAKf6xpv+KQx7ESdeXRvMfCj0KfY60yMgc8YU9bXZ2-K4Vv8OZg@mail.gmail.com>
In-Reply-To: <CAKf6xpv+KQx7ESdeXRvMfCj0KfY60yMgc8YU9bXZ2-K4Vv8OZg@mail.gmail.com>

--------------o04JBRKygnJKUQJx7M3oXwZV
Content-Type: multipart/mixed; boundary="------------mGWeHJsTq5uDFwWtBfE5XXXM"

--------------mGWeHJsTq5uDFwWtBfE5XXXM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDYuMjUgMTg6NDAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFy
IDIxLCAyMDI1IGF0IDU6MjXigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEFkZCB0aGUgY29kZSBhbmQgZGF0YSBkZWZpbml0aW9ucyBvZiB0
aGUgZmluYWwga2V4ZWMgc3RhZ2UuDQo+Pg0KPj4gUHV0IHRoZSBjb2RlIGFuZCByZWxhdGVk
IGRhdGEgaW50byBhIGRlZGljYXRlZCBzZWN0aW9uIGluIG9yZGVyIHRvIGJlDQo+PiBhYmxl
IHRvIGNvcHkgaXQgdG8gYW5vdGhlciBsb2NhdGlvbi4gRm9yIHRoaXMgcmVhc29uIHRoZXJl
IG11c3QgYmUgbm8NCj4+IGFic29sdXRlIHJlbG9jYXRpb25zIGJlaW5nIHVzZWQgaW4gdGhl
IGNvZGUgb3IgZGF0YS4NCj4+DQo+PiBCZWluZyBmdW5jdGlvbmFsbHkgcmVsYXRlZCwgYWRk
IGEgZnVuY3Rpb24gZm9yIGFkZGluZyBhIGZpbmFsIGtleGVjDQo+PiBhY3Rpb24uDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiAN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2FyY2gveDg2L2tleGVjLmMNCj4+IEBAIC0w
LDAgKzEsMTA5IEBADQo+IA0KPj4gKw0KPj4gKy8qDQo+PiArICogRmluYWwgc3RhZ2Ugb2Yg
a2V4ZWMuIENvcGllcyBhbGwgZGF0YSB0byB0aGUgZmluYWwgZGVzdGluYXRpb25zLCB6ZXJv
ZXMNCj4+ICsgKiAuYnNzIGFuZCBhY3RpdmF0ZXMgbmV3IGtlcm5lbC4NCj4+ICsgKiBNdXN0
IGJlIGNhbGxlZCB3aXRoIGludGVycnVwdHMgb2ZmLiBTdGFjaywgY29kZSBhbmQgZGF0YSBt
dXN0IGJlDQo+PiArICogYWNjZXNzaWJsZSB2aWEgaWRlbnRpdHkgbWFwcGVkIHZpcnR1YWwg
YWRkcmVzc2VzICh2aXJ0ID09IHBoeXMpLiBDb3B5aW5nDQo+PiArICogYW5kIHplcm9pbmcg
aXMgZG9uZSB1c2luZyB2aXJ0dWFsIGFkZHJlc3Nlcy4NCj4+ICsgKiBObyByZWxvY2F0aW9u
cyBpbnNpZGUgdGhlIGZ1bmN0aW9uIGFyZSBhbGxvd2VkLCBhcyBpdCBpcyBjb3BpZWQgdG8g
YW4NCj4+ICsgKiBhbGxvY2F0ZWQgcGFnZSBiZWZvcmUgYmVpbmcgZXhlY3V0ZWQuDQo+IA0K
PiAicGFnZSIgaXMgc3RhdGVkIGhlcmUuICBEbyB3ZSBuZWVkIGFuIEFTU0VSVCBsYXRlcj8N
Cg0KR29vZCBpZGVhLiBJJ2xsIGFkIGFuIEFTU0VSVCgpIHRvIHRoZSBsaW5rZXIgc2NyaXB0
IGluIG9yZGVyIHRvIGNhdGNoDQpzdWNoIGFuIGlzc3VlIGF0IGJ1aWxkIHRpbWUuDQoNCj4g
DQo+PiArICovDQo+IA0KPj4gK3ZvaWQgZG9fa2V4ZWModm9pZCAqa2V4ZWNfcGFnZSkNCj4+
ICt7DQo+PiArICAgIHVuc2lnbmVkIGxvbmcgYWN0aW9uczsNCj4+ICsgICAgdW5zaWduZWQg
bG9uZyBzdGFjazsNCj4+ICsgICAgdW5zaWduZWQgbG9uZyBmaW5hbDsNCj4+ICsgICAgdW5z
aWduZWQgbG9uZyBwaHlzOw0KPj4gKw0KPj4gKyAgICBhY3Rpb25zID0gZ2V0X2tleGVjX2Fk
ZHIoa2V4ZWNfcGFnZSwga2V4ZWNfYWN0aW9ucyk7DQo+PiArICAgIHN0YWNrID0gZ2V0X2tl
eGVjX2FkZHIoa2V4ZWNfcGFnZSwga2V4ZWNfc3RhY2sgKyBLRVhFQ19TVEFDS19MT05HUyk7
DQo+PiArICAgIGZpbmFsID0gZ2V0X2tleGVjX2FkZHIoa2V4ZWNfcGFnZSwga2V4ZWNfZmlu
YWwpOw0KPj4gKyAgICBwaHlzID0gZ2V0X2tleGVjX2FkZHIoa2V4ZWNfcGFnZSwga2V4ZWNf
cGh5cyk7DQo+PiArDQo+PiArICAgIG1lbWNweShrZXhlY19wYWdlLCBfa2V4ZWNfc3RhcnQs
IEtFWEVDX1NFQ1NJWkUpOw0KPj4gKyAgICBhc20oImNsaVxuXHQiDQo+PiArICAgICAgICAi
bW92ICUwLCAlJSJBU01fU1AiXG5cdCINCj4+ICsgICAgICAgICJtb3YgJTEsICUlIkFTTV9B
UkcxIlxuXHQiDQo+PiArICAgICAgICAibW92ICUyLCAlJSJBU01fQVJHMiJcblx0Ig0KPj4g
KyAgICAgICAgImptcCAqJTMiDQo+PiArICAgICAgICA6Ij1tIiAoc3RhY2spLCAiPW0iIChh
Y3Rpb25zKSwgIj1tIiAocGh5cykNCj4gDQo+IEFyZW4ndCB0aGVzZSBpbnB1dHMgYW5kIG5v
dCBvdXRwdXRzPw0KDQpPaCwgb2YgY291cnNlIHRoZXkgYXJlLg0KDQo+IA0KPj4gKyAgICAg
ICAgOiJtIiAoZmluYWwpKTsNCj4+ICt9DQo+PiArDQo+PiArI2VuZGlmIC8qIENPTkZJR19L
RVhFQyAqLw0KPiANCj4gDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9rZXhlYy5oIGIvaW5j
bHVkZS9rZXhlYy5oDQo+PiBpbmRleCA2ZmQ5Njc3NC4uNzIyYmU0NTYgMTAwNjQ0DQo+PiAt
LS0gYS9pbmNsdWRlL2tleGVjLmgNCj4+ICsrKyBiL2luY2x1ZGUva2V4ZWMuaA0KPj4gQEAg
LTEsNyArMSwzNCBAQA0KPiANCj4+ICsNCj4+ICtpbnQga2V4ZWNfYWRkX2FjdGlvbihpbnQg
YWN0aW9uLCB2b2lkICpkZXN0LCB2b2lkICpzcmMsIHVuc2lnbmVkIGludCBsZW4pOw0KPj4g
Kw0KPj4gKyNkZWZpbmUgS0VYRUNfU0VDU0laRSAoKHVuc2lnbmVkIGxvbmcpX2tleGVjX2Vu
ZCAtICh1bnNpZ25lZCBsb25nKV9rZXhlY19zdGFydCkNCj4gDQo+IEFkZCBhIGJ1aWxkIGFz
c2VydGlvbiBoZXJlPyAgT3IgbWF5YmUgdGhlIGNvcnJlY3QgYW1vdW50IGlzIGFsbG9jYXRl
ZA0KPiBhbmQgaXQgZG9lc24ndCBtYXR0ZXIuDQo+IA0KPiBHZW5lcmFsbHkgbG9va3MgZ29v
ZC4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg==
--------------mGWeHJsTq5uDFwWtBfE5XXXM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mGWeHJsTq5uDFwWtBfE5XXXM--

--------------o04JBRKygnJKUQJx7M3oXwZV--

--------------NhHe0hrQN32VlncWTXtpMlTE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhPthoFAwAAAAAACgkQsN6d1ii/Ey9x
vQf9FHWDZhZbXkRCBZMbeoNTDAo65rsG7pjRV4Jut6NnlgdtFuSA97IKaSGu1b0uGr3/+NwgXUjF
3wczE0qltxMtjLP2R6ecMGAMvDLVlZYfQWHNzDj6AxAEkt+/pVsrerFxLLP05bSjl5x/bEsrg1kI
VnQaGFgUSgv+Ck94T7WJ63eqMOFRsH+WDloAStyUP7CUbfQYdf4I/0p02XGuDy2kcXx3H9wzTfno
4LnJwQhcQWr0gWKdadVNher6kUxAy7n6tiyFqEiy8rS+nyIRk8d1TmurpWcuCT8sb1Qu2p59N1+s
jUM2ybi8bjkPTdWVn3Vz+vLrr44UV2pCQonY/mYYFg==
=sbpA
-----END PGP SIGNATURE-----

--------------NhHe0hrQN32VlncWTXtpMlTE--

