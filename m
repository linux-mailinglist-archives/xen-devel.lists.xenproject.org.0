Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93145B2B8CE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 07:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086311.1444493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoF4v-0004wr-R9; Tue, 19 Aug 2025 05:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086311.1444493; Tue, 19 Aug 2025 05:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoF4v-0004uJ-OY; Tue, 19 Aug 2025 05:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1086311;
 Tue, 19 Aug 2025 05:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zj8/=27=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uoF4u-0004uB-8S
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 05:40:12 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f88b9b94-7cbe-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 07:40:10 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so27574745e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 22:40:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6bc85csm198591615e9.5.2025.08.18.22.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 22:40:09 -0700 (PDT)
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
X-Inumbo-ID: f88b9b94-7cbe-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755582010; x=1756186810; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i4K5icz5EC90tEuLPM9J3PWFhld4r0aAf0MBVPc4jcU=;
        b=RgZzjkqvJaMv/L+z+S5uMj/WooAWX+GR/A0JDWjZXyN+H3u25GsK09y0xN0jCVsrIu
         /nYKIKv60qz+Htz+tWut4OzQ2wkNC30Frsnz5SZlJ2SKRnba/6uijn4gB5ke7dPB2CyU
         QoAxZlg3SdBA6qw9hF6XVBBZHY7Eb10CtD/oRaSk6kZJBn2GDEAu8DfIyZ13+IUVCBhy
         QPekFkFa9exGuS2ihvOO/A8uMGC7e3mRV7vF10upFMRNuHp10b3HO0pzrRwmQ9mePiy1
         oKyxKAL8ClEvlHHsXTxMhFnQvtwn8KmTriGnKe1Uot+cOZDolRIFQcf3DI7iFQqxlMae
         /HsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755582010; x=1756186810;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4K5icz5EC90tEuLPM9J3PWFhld4r0aAf0MBVPc4jcU=;
        b=EBsbi7jIvVJQ0Pqi6ma4a+iyXSZUQdJXKfRnEEMclf4LitGXBY/QfIKuQkEFWDvSNx
         yuFxBh8usPKcbOIMDtSwuga1LrRGwR8yEpcV9fw9faja6s519hR28cMYQOC6cQgEf0Yf
         cj3Deo4QksKAIQF7uwL8Bx+h1c5ryYoDztLeUHm8pXck0ijUiVoFeuZSfpdj3zWOx//5
         46fss2+8YmWs81voP+KWghgTtbfWQa31/SQNaeR5LxpFLAbZ9kyA3/n30RRTSBB4FWZ3
         LFmU76RW1OkxQOLFlQnKQXJ+qqHCLfVoA+oSugJnESVMjas1CEYEkFMkwmQGPdWQ7GQy
         q7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUA9a/WqOzWoQVaQTfvf01g8GJyI52KdYPP0j+FAOuQW88ET0E215czDyIfI1NipXXhHJ15k8IQ4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQCUnHtneXe1zWmc4F+s0WeKeOjRuazI8SdOitjCzqdcrpZlsa
	Zd79SM3FaVgzJ7sLPhs3yB0EROlm48zWM8aM4TsWuzww4kd/gEt49yulm+VlbkwVY44=
X-Gm-Gg: ASbGncutUzs8LHsUpThW7cRqOE/1Avm63740/y7W2tUYJRvgfpJtk866GA6CooXvX1B
	iG0YWgj0viCDPzQRWVjkw1Ie7d0Q+U8yiH3xx6+7JwUYtwGOZuy75BHrCKNLYLDvvUlbz5J2fw6
	qsPyPYzeuTbTI+JG8xVk1t7Vezvws9ipaGZGH1Ra01nmFeZMIobxaFB5EgNtHasm1w5qEFcy4+J
	ePDlh8y2xOHMc86temLGposkSwlVV672wJ9xP6aWtRQq9aj7+l7VyaCWwZOq3UXxmATCzNs9FPv
	eGHj8SwZmaf81TJIFvdhQsYyH3UcVo/Wiws5m2fADbtJCCcc3NzphUoAbxV2u9h6jzd5EW/Z24F
	YgibQzuQcufTr/lj4K3lJLXyha45H31xCCpo+NdMcmDM6LGJPncdeod4nl+cy0oPenoXQgT5cIM
	43/jEMf7cC6SyKRYk3+i21RrfpeqCRS0HTpR/6wuBIIYeV/j6YKpy0rFSflg==
X-Google-Smtp-Source: AGHT+IF9IG38gaoK9qWSb3c0FdOk1oLLCr7Tpj2E+q5XPxAC+cDBctjq6eygZwRZJ5oYuptypLs0Og==
X-Received: by 2002:a05:600c:8592:b0:456:15be:d113 with SMTP id 5b1f17b1804b1-45b446eb150mr2783135e9.1.1755582009684;
        Mon, 18 Aug 2025 22:40:09 -0700 (PDT)
Message-ID: <beedc75e-81d0-4029-9956-6478c0a6dee8@suse.com>
Date: Tue, 19 Aug 2025 07:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xenconsole: Add connected flag
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 "Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>
References: <20250807015606.4427-1-jason.andryuk@amd.com>
 <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
 <8e1efc16-2d82-4d7b-8fad-6af223d1fb6f@amd.com>
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
In-Reply-To: <8e1efc16-2d82-4d7b-8fad-6af223d1fb6f@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vyvJE4Zl7HwyuJ4g1Dde9TYW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vyvJE4Zl7HwyuJ4g1Dde9TYW
Content-Type: multipart/mixed; boundary="------------0q19FfnDfT0wDhn4Z0osTFlz";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 "Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>
Message-ID: <beedc75e-81d0-4029-9956-6478c0a6dee8@suse.com>
Subject: Re: [PATCH v1] xenconsole: Add connected flag
References: <20250807015606.4427-1-jason.andryuk@amd.com>
 <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
 <8e1efc16-2d82-4d7b-8fad-6af223d1fb6f@amd.com>
In-Reply-To: <8e1efc16-2d82-4d7b-8fad-6af223d1fb6f@amd.com>

--------------0q19FfnDfT0wDhn4Z0osTFlz
Content-Type: multipart/mixed; boundary="------------msmeh7Dvc7Cp1i00BLS2LKLo"

--------------msmeh7Dvc7Cp1i00BLS2LKLo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjUgMTg6MzUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDgt
MDcgMDM6MDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAwNy4wOC4yNSAwMzo1Niwg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBXaXRoIGh5cGVybGF1bmNoLCBhIGRvbVUgY2Fu
IHN0YXJ0IGJlZm9yZSBpdHMgY29uc29sZSByaW5nIGlzIGNvbm5lY3RlZA0KPj4+IGJ5IHhl
bmNvbnNvbGVkLsKgIFdpdGggbm90aGluZyBlbXB0eWluZyB0aGUgcmluZywgaXQgY2FuIHF1
aWNrbHkgZmlsbA0KPj4+IGR1cmluZyBib290LsKgIEluIGRvbVVfd3JpdGVfY29uc29sZSgp
LCBfX3dyaXRlX2NvbnNvbGUoKSByZXR1cm5zIDAgd2hlbg0KPj4+IHRoZSByaW5nIGlzIGZ1
bGwuwqAgVGhpcyBsb29wcyBzcGlucyB1bnRpbCB4ZW5jb25zb2xlZCBzdGFydHMgZW1wdHlp
bmcNCj4+PiB0aGUgcmluZzoNCj4+Pg0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgd2hpbGUgKGxl
bikgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNzaXplX3Qgc2Vu
dCA9IF9fd3JpdGVfY29uc29sZShjb25zLCBkYXRhLCBsZW4pOw0KPj4+DQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNlbnQgPCAwKQ0KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gc2VudDsN
Cj4+Pg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEgKz0gc2Vu
dDsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZW4gLT0gc2VudDsN
Cj4+Pg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2Vs
eShsZW4pKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBIWVBFUlZJU09SX3NjaGVkX29wKFNDSEVET1BfeWllbGQsIE5VTEwpOw0KPj4+
IMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+DQo+Pj4gVGhlIGdvYWwgb2YgdGhpcyBwYXRjaCBp
cyB0byBhZGQgYSB3YXkgZm9yIHRoZSBmcm9udGVuZCB0byBrbm93IHdoZW4gYQ0KPj4+IGNv
bnNvbGUgaXMgY29ubmVjdGVkLsKgIFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBmbGFnIHRvIHRo
ZSBlbmQgb2YgdGhlDQo+Pj4gY29uc29sZSByaW5nIHN0cnVjdHVyZS7CoCBJdCBpcyB1c2Vk
IGZvciB0aGUgYmFja2VuZCB0byBpbmRpY2F0ZSB0aGF0IGl0DQo+Pj4gaGFzIGNvbm5lY3Rl
ZCBhbmQgc3RhcnRlZCBzZXJ2aWNpbmcgdGhlIHBhZ2UuDQo+Pj4NCj4+PiBUaGUgdHdvIHZh
bHVlcyBhcmUNCj4+PiBYRU5DT05TT0xFX0RJU0NPTk5FQ1RFRCAxDQo+Pj4gWEVOQ09OU09M
RV9DT05ORUNURUTCoMKgwqAgMA0KPj4+DQo+Pj4gWEVOQ09OU09MRV9ESVNDT05ORUNURUQg
aW5kaWNhdGVzIHRvIHRoZSBndWVzdCB0aGF0IHJpbmcgaXMNCj4+PiBkaXNjb25uZWN0ZWQs
IHNvIGl0IHdpbGwgbm90IGJlIHNlcnZpY2VkLsKgIFRoZSBndWVzdCBjYW4gYXZvaWQgd3Jp
dGluZw0KPj4+IGludG8gaXQgaW4gdGhhdCBjYXNlLsKgIEEgZG9tVSBjYW4gdXNlIGNvbnNv
bGUgaHlwZXJjYWxscyBhbmQgb25seQ0KPj4+IHRyYW5zaXRpb24gdG8gdGhlIHJpbmcgd2hl
biBpdCBpcyBjb25uZWN0ZWQgYW5kIHdvbid0IGZpbGwgYW5kIGJsb2NrLg0KPj4+DQo+Pj4g
T25jZSB0aGUgYmFja2VuZCAoeGVuY29uc29sZWQpIG1hcHMgYW5kIHN0YXJ0cyBzZXJ2aWNp
bmcgdGhlDQo+Pj4gY29uc29sZSwgdGhlIGZsYWcgd2lsbCBiZSBzZXQgdG8gWEVOQ09OU09M
RV9DT05ORUNURUQgKDApIHRvIGluZGljYXRlDQo+Pj4gdGhlIGJhY2tlbmQgc3RhdGUgdG8g
dGhlIGZyb250ZW5kLg0KPj4+DQo+Pj4gVGhlIGNvbm5lY3RlZCB2YWx1ZSBhcyAwIHdpbGwg
YmUgbWF0Y2ggdGhlIGRlZmF1bHQgb2YgYSB6ZXJvLWVkIGNvbnNvbGUNCj4+PiBwYWdlLsKg
IEh5cGVybGF1bmNoIGNhbiBzZXQgdGhlIGZsYWcgdG8gWEVOQ09OU09MRV9ESVNDT05ORUNU
RUQgYW5kIGxldA0KPj4+IHhlbmNvbnNvbGVkIHNldCB0byBYRU5DT05TT0xFX0NPTk5FQ1RF
RC4NCj4+DQo+PiBJIHRoaW5rIGxpYnhlbmd1ZXN0IHNob3VsZCBzZXQgWEVOQ09OU09MRV9E
SVNDT05ORUNURUQgYXMgd2VsbCAoc2VlIGJlbG93KS4NCj4+DQo+Pj4NCj4+PiBPbGQgZG9t
VSBodmNfeGVuIGRyaXZlcnMgd29uJ3QgY2hlY2sgdGhlIGZsYWcuDQo+Pj4gTmV3IGRvbVUg
aHZjX3hlbiBydW5uaW5nIG9uIGEgbmV3IHhlbi94ZW5jb25zb2xlZCB3aWxsIHdvcmsgcHJv
cGVybHkuDQo+Pj4gTmV3IGRvbVUgaHZjX3hlbiBvbiBvbGQgeGVuL3hlbmNvbnNvbGVkIHNo
b3VsZCBvbmx5IHNlZSBhIDAgZm9yIHRoZSBmbGFnDQo+Pj4gYW5kIGJlaGF2ZSBhcyBpZiBj
b25uZWN0ZWQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNv
bi5hbmRyeXVrQGFtZC5jb20+DQo+Pg0KPj4gQWRhcHQgdGhlIHRpdGxlIG9mIHRoZSBwYXRj
aD8NCj4+DQo+Pj4gLS0tDQo+Pj4gdjE6DQo+Pj4gUmVtb3ZlIGV2dGNobiBub3RpZnkgY2Fs
bA0KPj4+IFNldCBjb25uZWN0ZWQgbGF0ZXIgd2hlbiB0aGVyZSBpcyBubyBlcnJvcg0KPj4+
DQo+Pj4gUkZDIHYzOg0KPj4+IEZsaXAgZmxhZyB2YWx1ZXMgc28gMCBpcyBjb25uZWN0ZWQu
DQo+Pj4NCj4+PiBUaGUgb3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGFkZDoNCj4+PiB1aW50
MzJfdCBmZWF0dXJlcw0KPj4+IHVpbnQzMl90IGNvbm5lY3RlZA0KPj4+DQo+Pj4gTmV3IGRv
bVVzIHdvdWxkIGNoZWNrIGZlYXR1cmVzIGZvciBhIG1hZ2ljIHZhbHVlIGFuZC9vciBmbGFn
IHRvIGtub3cNCj4+PiB0aGV5IGNhbiByZWx5IG9uIGNvbm5lY3RlZCB0cmFuc2l0aW9uaW5n
Lg0KPj4+DQo+Pj4gSSB0aGluayBtYWtpbmcgWEVOQ09OU09MRV9DT05ORUNURUQgPT0gMCBz
aWRlIHN0ZXBzIHRoZSBuZWVkIGZvcg0KPj4+IGFuIGFkZGl0aW9uYWwgZmVhdHVyZXMgZmll
bGQuwqAgQXMgbG9uZyBhcyBhc3N1bWluZyB6ZXJvLWVkIG1lbW9yeSBpcw0KPj4+IGFjY2Vw
dGFibGUuwqAgSG93ZXZlciwgdGhpcyBvbmx5IG1hdHRlcnMgZm9yIGEgaHlwZXJsYXVuY2hl
ZCBndWVzdCAtDQo+Pj4geGVuY29uc29sZWQgd2lsbCBub3JtYWxseSByZWFkaWx5IGNvbm5l
Y3QgdGhlIGNvbnNvbGUgYW5kIHNldCB0aGUgdmFsdWUuDQo+Pg0KPj4gSSdkIGxpa2UgdG8g
Y29uc2lkZXIgb3RoZXIgY2FzZXMgYXMgd2VsbCwgZS5nLiBhIGNvbnNvbGUgZHJpdmVyIGRv
bWFpbi4NCj4+IFNvIGFueSBpbnN0YW5jZSBjcmVhdGluZyBhIGRvbWFpbiB3aXRoIGEgY29u
c29sZSByaW5nIHBhZ2Ugc2hvdWxkIHNldCB0aGUNCj4+IGZsYWcgaW5pdGlhbGx5IHRvICJk
aXNjb25uZWN0ZWQiLg0KPiANCj4gU2V0dGluZyBkaXNjb25uZWN0ZWQgZm9yIGRvbWFpbiBj
cmVhdGlvbiBpcyBmaW5lLsKgIExvb2tpbmcgYXQgbGlieGVuZ3Vlc3QsIHRoZXJlIA0KPiBp
cyBhbHNvIGRvbWFpbiByZXN0b3JlLsKgIFRoZXJlIHRoZSBjb25zb2xlIGNvdWxkIGJlIHNl
dCB0byBkaXNjb25uZWN0ZWQgYWdhaW4gDQo+IGJlZm9yZSBkb21haW4gcmVzdG9yZS7CoCBB
Z2FpbiwgdGhpcyBzaG91bGQgd29yayBhbmQgeGVuY29uc29sZWQgd291bGQgc2V0IGl0IA0K
PiBjb25uZWN0ZWQgYWdhaW4uwqAgSSBvcmlnaW5hbGx5IGludGVuZGVkIGZvciBhIHNpbmds
ZSBvbmUgd2F5IHRyYW5zaXRpb24gDQo+IGRpc2Nvbm5lY3RlZCAtPiBjb25uZWN0ZWQuDQo+
IA0KPiBBbHRlcm5hdGl2ZWx5LCByZXN0b3JlIGNvdWxkIHNraXAgc2V0dGluZyBkaXNjb25u
ZWN0ZWQgYW5kIGp1c3QgYXNzdW1lIA0KPiB4ZW5jb25zb2xlZCB3aWxsIHByb21wdGx5IGF0
dGFjaC7CoCBSZXN0b3JlIGltcGxpZXMgYSB0b29sc3RhY2sgaXMgcnVubmluZywgc28gDQo+
IHRoZXJlIGlzbid0IHRoZSBpbmRlZmluaXRlIHRpbWUgcGVyaW9kIHRoYXQgaXMgaW52b2x2
ZWQgd2l0aCBoeXBlcmxhdW5jaC8gDQo+IGRvbTBsZXNzLsKgIEJ1dCBJIGd1ZXNzIGFuIGFj
dGl2ZWx5IGNoYW5naW5nIGZsYWcgYWNjdXJhdGVseSBzaG93cyB0aGUgc3RhdGUsIHNvIA0K
PiB0aGF0IGlzIHByZWZlcmFibGUuDQoNCkkgYWdyZWUuDQoNCj4gDQo+Pj4gVGhpcyBhc3N1
bWVzIHRoYXQgZXhpc3RpbmcgZnJvbnRlbmRzIGFyZSBub3QgdXNpbmcgdGhlIGZsYWcgc3Bh
Y2UgZm9yDQo+Pj4gc29tZSBvdGhlciB1c2UuDQo+Pj4NCj4+PiBSZW1vdmVkIGlkZWE6DQo+
Pj4gU2VuZCBhbiBldmVudCBjaGFubmVsIG5vdGlmaWNhdGlvbiB0byBsZXQgdGhlIGRvbVUg
a25vdyB0aGF0IHhlbmNvbnNvbGVkDQo+Pj4gaXMgY29ubmVjdGVkLsKgIFhlbnN0b3JlZCBk
b2VzIHNpbWlsYXIsIGJ1dCBmb3IgeGVuc3RvcmUsIHRoZSB4ZW5zdG9yZQ0KPj4+IGRyaXZl
ciBvd25zIHRoZSBldmVudCBjaGFubmVsL2lycSBhbmQgY2FuIHJlYmluZCBpdC7CoCBGb3Ig
aHZjX3hlbiwgdGhlDQo+Pj4gaHZjIHN1YnN5c3RlbSBvd25zIHRoZSBpcnEsIHNvIGl0IGlz
bid0IHJlYWRpbHkgYXZhaWxhYmxlIGZvciByZWJpbmRpbmcuDQo+Pj4gVGhpcyBpcyBub3Qg
aW1wbGVtZW50ZWQuDQo+Pj4NCj4+PiBJIGhhZCB0aGUgaWRlYSBmb3IgdGhlIGtlcm5lbCB0
byB1c2UgYSBzdGF0aWMga2V5IGFuZCBzd2l0Y2ggd3JpdGluZw0KPj4+IGZyb20gdGhlIGh5
cGVyY2FsbCB0byB0aGUgUFYgcmluZyBvbmNlIGNvbm5lY3RlZC7CoCBJdCBkaWRuJ3QgYWN0
dWFsbHkNCj4+PiB3b3JrIGluIG15IHNob3J0IGF0dGVtcHQgLSBJIHRoaW5rIGNoYW5naW5n
IHRoZSBzdGF0aWMga2V5IGZyb20gd2l0aGluDQo+Pj4gYW4gaW50ZXJ1cHQgd2FzIHdyb25n
LsKgIEkgZmVsbCBiYWNrIHRvIGp1c3QgY2hlY2tpbmcgdGhlIGZsYWcgZGlyZWN0bHkNCj4+
DQo+PiBZb3UnZCBuZWVkIHRvIGRvIHRoZSBzdGF0aWMga2V5IGNoYW5naW5nIGZyb20gYSB3
b3JrZXIgdGhyZWFkIGluc3RlYWQuDQo+IA0KPiBNeSBzdGF0aWMga2V5IGlkZWEgaGFzIGFu
IGlzc3VlLsKgIFRoZSBmbGFnIG5lZWRzIHRvIGJlIHBlci1pbnN0YW5jZSwgcHJpbWFyeSAN
Cj4gY29uc29sZSBhbmQgYW55IGFkZGl0aW9uYWwgUFYgY29uc29sZXMsIGJ1dCB0aGUga2Vy
bmVsIGhhcyBvbmx5IGEgc2luZ2xlIA0KPiBmdW5jdGlvbiB0byBoYW5kbGUgYWxsIG9mIHRo
ZW0uwqAgRWl0aGVyIHRoZSBwcmltYXJ5IGNvbnNvbGUgbmVlZHMgZGVkaWNhdGVkIG9wcywg
DQo+IG9yIHRoZSB0aGUgZmxhZyB3b3VsZCBuZWVkIHRvIGJlIGNoZWNrZWQgaW4gdGhlIGZ1
bmN0aW9uLsKgIElmIHRoZSBmbGFnIHdpbGwgDQo+IHRvZ2dsZSBiYWNrIGFuZCBmb3J0aCwg
dGhlbiBhIHN0YXRpYyBrZXkgbWF5IG5vdCBiZSBhcHByb3ByaWF0ZS4NCg0KSXRzIG5vdCBh
cyBpZiBjb25zb2xlcyBhcmUgaGlnaCB0aHJvdWdocHV0IGRldmljZXMuIFNvIHRlc3Rpbmcg
dGhlIGZsYWcNCmluc3RlYWQgb2YgdXNpbmcgYSBzdGF0aWMga2V5IHNob3VsZG4ndCBiZSBh
IGJpZyBpc3N1ZS4NCg0KDQpKdWVyZ2VuDQo=
--------------msmeh7Dvc7Cp1i00BLS2LKLo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------msmeh7Dvc7Cp1i00BLS2LKLo--

--------------0q19FfnDfT0wDhn4Z0osTFlz--

--------------vyvJE4Zl7HwyuJ4g1Dde9TYW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmikDjcFAwAAAAAACgkQsN6d1ii/Ey8R
Owf/dDJXadCwjft9jsX83NZ+ZDu6fnwcxQc7sQDTGs3ZGab23RiKDnN4S/ssHb9STdaBYCVscEKw
9D51rxz8m3nvGjHVg2aNgUrMHWwUjN+Ac3g883qGVsb8+JJr5mZlwhd8Wx3+pGDBxv0o94ysxXCW
MaJV4YP5g2fPqqGSWj1xbsd/TrGNWGYZVXw2NpLO64R71v/Nfd7VeHeBMP3Py3JYTNBEJjKu+M2j
/BYA9/hro/5m7fyNrCogbc6oYtU+wsmNR595Y3p3Zvqm0GXYuRYqioBNE8tCK6eku33pqZZZ/pVH
uUKfou2rwecjBJxu5CVWeX4fN9yQrgOPpFjqsJ3KYg==
=Q5PB
-----END PGP SIGNATURE-----

--------------vyvJE4Zl7HwyuJ4g1Dde9TYW--

