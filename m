Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0918B25C9A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080830.1441018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS1m-00029o-IW; Thu, 14 Aug 2025 07:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080830.1441018; Thu, 14 Aug 2025 07:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS1m-00026n-FE; Thu, 14 Aug 2025 07:05:34 +0000
Received: by outflank-mailman (input) for mailman id 1080830;
 Thu, 14 Aug 2025 07:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ep8Y=22=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1umS1k-0001du-NZ
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:05:32 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112f93e7-78dd-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 09:05:32 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so94652466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:05:32 -0700 (PDT)
Received: from ?IPV6:2003:e5:8707:1600:914:c962:d2a8:524e?
 (p200300e5870716000914c962d2a8524e.dip0.t-ipconnect.de.
 [2003:e5:8707:1600:914:c962:d2a8:524e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af99518bfedsm1564401766b.105.2025.08.14.00.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:05:31 -0700 (PDT)
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
X-Inumbo-ID: 112f93e7-78dd-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755155131; x=1755759931; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eWddV2EZ2/YGe5+QEST1UDhAfqoCs+GBJ+Dkkq+nLYQ=;
        b=IoGWIDINFbvatK1G5iBlFqqob49zB70Fr24eb38JNbd3nL3R3WSeOdQ0cvxuxy6y8p
         p7N6ppf/ldcXkBc1GDXXL6OCYWOx1h/ge1Sy8t4qbgv/DfXyJqlraZ1NPoOuVb5UjYGV
         VZgHtGtkRtbE5m71b4n6f25d/EXcEWY4soWIQu23Hz1tMIzKXYyyKro2WBXtS8jGcpQO
         nXrcVM25Fl7Bb0f0/Q7LaDKP3D8JZ7jVCMb1KOMERLN8zyK0d6O32jdJdNH3+Z6ACKq9
         SNVxwVbh+0RxdzWQ76aUSjTdf2ti94Bvr4N7dyBoWQVuI2HD1Zph8ftmRQ4Kedf8pbcO
         11pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155131; x=1755759931;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWddV2EZ2/YGe5+QEST1UDhAfqoCs+GBJ+Dkkq+nLYQ=;
        b=tMtBm3R1ocDM1d6ztT93io/BkopVnTWp3VNLllVzFSNRz+1PlBWRqGRC/+rWLijX1h
         tTvDznQ3kJQYKPXvVOswUbPgK77kpqI0hDdrLwBKiOa58JMcYJxAFeP3Z8088I1PJBXl
         K8roVgjiGMtH/A+A9Lvj3i3x3cai6llB47XlKd6xwlfI18rf4qW7SiMmVxIlRcmv/0dO
         8hkFGlByGEtJlhWmgXICddPdhF8l5Z6TLFz4+jPpPqtCUyk+dJpNPZU+MQf7trRdkFPD
         7ojyjH1r5BmJJMKwJKcAnJZ4FNFdZ1iz3wjcZyXVCLMWIyU3TdWIq8P498MgZQWV1Gx5
         r5dw==
X-Forwarded-Encrypted: i=1; AJvYcCUQO4R0mUJSLhY2G81PKgVA4lTUgX9m6uBVQ6csD76JNuvA+XTBesJ2siL3jFYThW/+NlU8qiQjOAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOyRII/HSGY+uZ8fCDTmD7ICzN4GRNYEHbihSCT05JSCWs8wjl
	GUXZeKkTSygKUzzSByuVrwpK1DLj6v9raiiniu1FGyXyULZnFaUmwOfF7s3xScB4y3M=
X-Gm-Gg: ASbGncs+3GPZj4dTtl9b5gcRUnkbSg5lSG9RS3+qGC0WzOvheWSh5OmHiPNBw5GN/iP
	uUWGRvUdcw+769L/FWXm8mZsSGmDRvEC85UQxdMprNNc8GnypOrQeU7JYb/LPkx5dosxKy/K4dO
	yrYCNApJ0fYO3m9PNiVFwUnS3H0XeOULO11tcXBtaSvDZ2avICAt1CLpDMX1EVQQ99RROz49vU9
	y0uCMxzb3nOuWuweSHurlwOAYzebCQM5VZD1EyL/ZnMWp1/XcEZNu7cLCyjt9g8QlD/+WoDgEcC
	g+iZs5ioJYLX28iaybes7EFNl8gXj/i9qvMMr9ZfwL6V91nRdIv66If4ZBhevut0mWK3lj5C7F8
	fz6B1qbFFc/eDKwMO0BkTcutKc6EupU8fMRM3PV3ntPFsRGtBNsU2OX2YJ36XTPeKW6Yk6LTcnf
	x/MNryU9YANEJTtgoRJfDN/BNTTxkJQvaf8B7I2fi9NWb8Ye64Ppy6TzlmA2sXOZJKOA==
X-Google-Smtp-Source: AGHT+IHg12R9C+kLY7lUSfkpHkqWYowYCW2UNXcMx6+EvIMip4yrK9CwnPJlXOIR8B6Lc1phO+8IoA==
X-Received: by 2002:a17:907:2d21:b0:af1:f259:254d with SMTP id a640c23a62f3a-afcb93a24b1mr151824466b.8.1755155131402;
        Thu, 14 Aug 2025 00:05:31 -0700 (PDT)
Message-ID: <6bf9bac0-a394-4064-bb5d-924f5a920e7e@suse.com>
Date: Thu, 14 Aug 2025 09:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Chris Wright <chrisw@sous-sol.org>,
 Jeremy Fitzhardinge <jeremy@xensource.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20250812190041.23276-1-jason.andryuk@amd.com>
 <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>
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
In-Reply-To: <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n01cz0qzsiIkjS64c0EV3BZz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n01cz0qzsiIkjS64c0EV3BZz
Content-Type: multipart/mixed; boundary="------------4ze0d0sDBVaNHHe93x0xGSVt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Chris Wright <chrisw@sous-sol.org>,
 Jeremy Fitzhardinge <jeremy@xensource.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <6bf9bac0-a394-4064-bb5d-924f5a920e7e@suse.com>
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
References: <20250812190041.23276-1-jason.andryuk@amd.com>
 <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>
In-Reply-To: <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>

--------------4ze0d0sDBVaNHHe93x0xGSVt
Content-Type: multipart/mixed; boundary="------------W3LIP514FcistQgDFAHvxPxq"

--------------W3LIP514FcistQgDFAHvxPxq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDguMjUgMTc6MDMsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDgt
MTIgMTU6MDAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+PiBWSVJRcyBjb21lIGluIDMgZmxh
dm9ycywgcGVyLVZQVSwgcGVyLWRvbWFpbiwgYW5kIGdsb2JhbC7CoCBUaGUgZXhpc3RpbmcN
Cj4+IHRyYWNraW5nIG9mIFZJUlFzIGlzIGhhbmRsZWQgYnkgcGVyLWNwdSB2YXJpYWJsZXMg
dmlycV90b19pcnEuDQo+Pg0KPj4gVGhlIGlzc3VlIGlzIHRoYXQgYmluZF92aXJxX3RvX2ly
cSgpIHNldHMgdGhlIHBlcl9jcHUgdmlycV90b19pcnEgYXQNCj4+IHJlZ2lzdHJhdGlvbiB0
aW1lIC0gdHlwaWNhbGx5IENQVSAwLsKgIExhdGVyLCB0aGUgaW50ZXJydXB0IGNhbiBtaWdy
YXRlLA0KPj4gYW5kIGluZm8tPmNwdSBpcyB1cGRhdGVkLsKgIFdoZW4gY2FsbGluZyB1bmJp
bmRfZnJvbV9pcnEoKSwgdGhlIHBlci1jcHUNCj4+IHZpcnFfdG9faXJxIGlzIGNsZWFyZWQg
Zm9yIGEgZGlmZmVyZW50IGNwdS7CoCBJZiBiaW5kX3ZpcnFfdG9faXJxKCkgaXMNCg0KVGhp
cyBpcyB3aGF0IG5lZWRzIHRvIGJlIGZpeGVkLiBBdCBtaWdyYXRpb24gdGhlIHBlcl9jcHUg
dmlycV90b19pcnEgb2YgdGhlDQpzb3VyY2UgYW5kIHRoZSB0YXJnZXQgY3B1IG5lZWQgdG8g
YmUgdXBkYXRlZCB0byByZWZsZWN0IHRoYXQgbWlncmF0aW9uLg0KDQo+PiBjYWxsZWQgYWdh
aW4gd2l0aCBDUFUgMCwgdGhlIHN0YWxlIGlycSBpcyByZXR1cm5lZC4NCj4+DQo+PiBDaGFu
Z2UgdGhlIHZpcnFfdG9faXJxIHRyYWNraW5nIHRvIHVzZSBDUFUgMCBmb3IgcGVyLWRvbWFp
biBhbmQgZ2xvYmFsDQo+PiBWSVJRcy7CoCBBcyB0aGVyZSBjYW4gYmUgYXQgbW9zdCBvbmUg
b2YgZWFjaCwgdGhlcmUgaXMgbm8gbmVlZCBmb3INCj4+IHBlci12Y3B1IHRyYWNraW5nLsKg
IEFsc28sIHBlci1kb21haW4gYW5kIGdsb2JhbCBWSVJRcyBuZWVkIHRvIGJlDQo+PiByZWdp
c3RlcmVkIG9uIENQVSAwIGFuZCBjYW4gbGF0ZXIgbW92ZSwgc28gdGhpcyBtYXRjaGVzIHRo
ZSBleHBlY3RhdGlvbi4NCj4+DQo+PiBGaXhlczogZTQ2Y2RiNjZjOGZjICgieGVuOiBldmVu
dCBjaGFubmVscyIpDQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4gU2lnbmVk
LW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KPj4gLS0t
DQo+PiBGaXhlcyBpcyB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSB2aXJxX3RvX2lycSBwZXIt
Y3B1IGFycmF5Lg0KPj4NCj4+IFRoaXMgd2FzIGZvdW5kIHdpdGggdGhlIG91dC1vZi10cmVl
IGFyZ28gZHJpdmVyIGR1cmluZyBzdXNwZW5kL3Jlc3VtZS4NCj4+IE9uIHN1c3BlbmQsIHRo
ZSBwZXItZG9tYWluIFZJUlFfQVJHTyBpcyB1bmJvdW5kLsKgIE9uIHJlc3VtZSwgdGhlIGRy
aXZlcg0KPj4gYXR0ZW1wdHMgdG8gYmluZCBWSVJRX0FSR08uwqAgVGhlIHN0YWxlIGlycSBp
cyByZXR1cm5lZCwgYnV0IHRoZQ0KPj4gV0FSTl9PTihpbmZvID09IE5VTEwgfHwgaW5mby0+
dHlwZSAhPSBJUlFUX1ZJUlEpIGluIGJpbmRfdmlycV90b19pcnEoKQ0KPj4gdHJpZ2dlcnMg
Zm9yIE5VTEwgaW5mby7CoCBUaGUgYmluZCBmYWlscyBhbmQgZXhlY3V0aW9uIGNvbnRpbnVl
cyB3aXRoIHRoZQ0KPj4gZHJpdmVyIHRyeWluZyB0byBjbGVhbiB1cCBieSB1bmJpbmRpbmcu
wqAgVGhpcyBldmVudHVhbGx5IGZhdWx0cyBvdmVyIHRoZQ0KPj4gTlVMTCBpbmZvLg0KPj4g
LS0tDQo+PiDCoCBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8IDE3ICsrKysr
KysrKysrKysrKystDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ldmVudHMv
ZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jDQo+PiBp
bmRleCA0MTMwOWQzOGY3OGMuLmEyN2U0ZDdmMDYxZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jDQo+PiArKysgYi9kcml2ZXJzL3hlbi9ldmVu
dHMvZXZlbnRzX2Jhc2UuYw0KPj4gQEAgLTE1OSw3ICsxNTksMTkgQEAgc3RhdGljIERFRklO
RV9NVVRFWChpcnFfbWFwcGluZ191cGRhdGVfbG9jayk7DQo+PiDCoCBzdGF0aWMgTElTVF9I
RUFEKHhlbl9pcnFfbGlzdF9oZWFkKTsNCj4+IC0vKiBJUlEgPC0+IFZJUlEgbWFwcGluZy4g
Ki8NCj4+ICtzdGF0aWMgYm9vbCBpc19wZXJfdmNwdV92aXJxKGludCB2aXJxKSB7DQo+PiAr
wqDCoMKgIHN3aXRjaCAodmlycSkgew0KPj4gK8KgwqDCoCBjYXNlIFZJUlFfVElNRVI6DQo+
PiArwqDCoMKgIGNhc2UgVklSUV9ERUJVRzoNCj4+ICvCoMKgwqAgY2FzZSBWSVJRX1hFTk9Q
Uk9GOg0KPj4gK8KgwqDCoCBjYXNlIFZJUlFfWEVOUE1VOg0KPj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiB0cnVlOw0KPj4gK8KgwqDCoCBkZWZhdWx0Og0KPj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiBmYWxzZTsNCj4+ICvCoMKgwqAgfQ0KPj4gK30NCj4+ICsNCj4+ICsvKiBJUlEg
PC0+IFZJUlEgbWFwcGluZy7CoCBHbG9iYWwvRG9tYWluIHZpcnFzIGFyZSB0cmFja2VkIGlu
IGNwdSAwLsKgICovDQo+PiDCoCBzdGF0aWMgREVGSU5FX1BFUl9DUFUoaW50IFtOUl9WSVJR
U10sIHZpcnFfdG9faXJxKSA9IHtbMCAuLi4gTlJfVklSUVMtMV0gPSAtMX07DQo+PiDCoCAv
KiBJUlEgPC0+IElQSSBtYXBwaW5nICovDQo+PiBAQCAtOTc0LDYgKzk4Niw5IEBAIHN0YXRp
YyB2b2lkIF9fdW5iaW5kX2Zyb21faXJxKHN0cnVjdCBpcnFfaW5mbyAqaW5mbywgDQo+PiB1
bnNpZ25lZCBpbnQgaXJxKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAoaW5mby0+
dHlwZSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgSVJRVF9WSVJROg0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpc19wZXJfdmNwdV92aXJxKHZpcnFfZnJvbV9p
cnEoaW5mbykpKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcHUgPSAw
Ow0KPj4gKw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGVyX2NwdSh2aXJxX3Rv
X2lycSwgY3B1KVt2aXJxX2Zyb21faXJxKGluZm8pXSA9IC0xOw0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBJUlFU
X0lQSToNCj4gDQo+IFRoaW5raW5nIGFib3V0IGl0IGEgbGl0dGxlIG1vcmUsIGJpbmRfdmly
cV90b19pcnEoKSBzaG91bGQgZW5zdXJlIGNwdSA9PSAwIGZvciANCj4gcGVyLWRvbWFpbiBh
bmQgZ2xvYmFsIFZJUlFzIHRvIGVuc3VyZSB0aGUgcHJvcGVydHkgaG9sZHMuwqAgQWxzbyB2
aXJxX3RvX2lycSANCg0KSW4gWGVuJ3MgZXZ0Y2huX2JpbmRfdmlycSgpIHRoZXJlIGlzOg0K
DQogICAgIGlmICggdHlwZSAhPSBWSVJRX1ZDUFUgJiYgdmNwdSAhPSAwICkNCiAgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KDQpNYWtpbmcgc3VyZSBpbiBMaW51eCB0aGF0IHRoZXJlIGlz
IG5ldmVyIGEgdmlvbGF0aW9uIG9mIHRoYXQgcmVzdHJpY3Rpb24gd291bGQNCnJlcXVpcmUg
dG8gYWx3YXlzIGhhdmUgYW4gdXAtdG8tZGF0ZSB0YWJsZSBvZiBhbGwgcG9zc2libGUgVklS
UXMgYW5kIHRoZWlyDQp0eXBlLCB3aGljaCBJJ2QgbGlrZSB0byBhdm9pZC4NCg0KSSB0aGlu
ayBpdCBpcyB0aGUgdXNlciBvZiB0aGUgVklSUSB3aG8gaXMgcmVzcG9uc2libGUgdG8gZW5z
dXJlIGNwdSAwIGlzIHBhc3NlZA0KdG8gYmluZF92aXJxX3RvX2lycSgpLCBhcyB0aGlzIHVz
ZXIga25vd3MgdGhhdCBzdWNoIGEgcmVzdHJpY3Rpb24gYXBwbGllcyB0bw0KdGhlIFZJUlEg
aW4gcXVlc3Rpb24gKGF0IGxlYXN0IGhlIHNob3VsZCBrbm93IHRoYXQpLg0KDQpTcGVjaWFs
IGhhbmRsaW5nIGZvciByZWFsbHkgdXNlZCBWSVJRcyBpbiB0aGUga2VybmVsIGNhbiBoYXZl
IHNvbWUgc3BlY2lhbA0KaGFuZGxpbmcsIG9mIGNvdXJzZSwgYXMgdGhleSBhcmUga25vd24g
YWxyZWFkeSBhbmQgc2hvdWxkIGJlIHVzZWQgY29ycmVjdGx5Lg0KDQoNCkp1ZXJnZW4NCg==

--------------W3LIP514FcistQgDFAHvxPxq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------W3LIP514FcistQgDFAHvxPxq--

--------------4ze0d0sDBVaNHHe93x0xGSVt--

--------------n01cz0qzsiIkjS64c0EV3BZz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmidiroFAwAAAAAACgkQsN6d1ii/Ey9b
qAf9E5eeox1eGx/zAvXtyXAucZh5lxVcoaexNIbYW/Vy7VJIZEOzGHXoOts7nYdRP14l0orHkdWT
d+uoVOhBUhaqeMaVzWUDSV4wxAuxradDQTDKBz1mXI16J29sJMjuzcFr9Fn3H3eHpEwD/bUJPtVt
BJnBRufRFCXtsVWnyHV1hO5A/khTUJlTZhEjooz62jgiC/uWeIEdoHRKLc1IPJBRxYfJtdfmjwEk
P7zdjbLheGdNXibd2u19fvHUHCOB7Z4W+rqMYsTWT6e2VhKTm2ZxgZk8bQceT2KvP9GxEapOCwSq
o3bYN5TV0A6JmbsywDs+ZDU9TZ3VFS9n4RSduO6b7g==
=teqQ
-----END PGP SIGNATURE-----

--------------n01cz0qzsiIkjS64c0EV3BZz--

