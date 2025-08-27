Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC59B3866B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096368.1451099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHxl-0006ON-TX; Wed, 27 Aug 2025 15:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096368.1451099; Wed, 27 Aug 2025 15:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHxl-0006Ms-Qd; Wed, 27 Aug 2025 15:21:25 +0000
Received: by outflank-mailman (input) for mailman id 1096368;
 Wed, 27 Aug 2025 15:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1urHxj-0006Mj-UE
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:21:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cc4627d-8359-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 17:21:21 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3c79f0a606eso2484557f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 08:21:21 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70e4ba390sm22239966f8f.12.2025.08.27.08.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 08:21:20 -0700 (PDT)
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
X-Inumbo-ID: 7cc4627d-8359-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756308081; x=1756912881; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZJ4Lyh9S68n97ZQMBN60BvENdELiq1GBSuRV257pKsw=;
        b=Fo2ehHX/b0rFk5nRx/sCMQhzCi73TwTylzRbERVW/xW/gpbeUV1aaDyTbA1lydirom
         A8Cic33H+PXWNDG0JVQFwY769dvqKaGZE2iQftH/m+8RqUZt3x+75sWNNX3WuadJOXE4
         pUS3NJF8wCBIpODO1Ag8u7ORG36jHScYVAOOtB8CMRGcN+JDdJnkBhMn8HFMe2B1g+IV
         6+RXQ2GRy51bBYyh1pw+XO3NcMAJGcxBphREZ+1qi4C2yIUV8/G0NGA4CUDvgGXISSvk
         z8hQl4NBWUPfFfx8MIn+OHOXPs0d4Y/CGoXXO5WrfYKuLGkoQBGXJsaQeKW0mlqUNk6E
         P8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756308081; x=1756912881;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJ4Lyh9S68n97ZQMBN60BvENdELiq1GBSuRV257pKsw=;
        b=QA60bpk6byq3MOSKJTb7c3Lp2zSZCRcHRYKB98YCN8CNogpVXlBmcBjE+lH57Va625
         OkYSKOWbEQ7U+4X50E+dblxCFxYge/guE/4VtmggfPnU0vlZfJY+s3qIhZI2QTxneZzE
         +nOfx+7tCbb9v/Jtm/a39kQYwZRAU+mYlnGryoC5djWl+InO2fai1DNkYMPP+9Vxcsyg
         mpMjifr78GaoANDC2ufNdJsNfADhc9XIqX8LrpaXbzSUTn8LlVNgx28jBIYo6Y1x/jaW
         5UVAXxBjScOxJPZP2JqbuExZNOfdfWcGzl+UCqJWW5erwNAii2aZ4C+PxAJxNuCs/8VH
         R07g==
X-Gm-Message-State: AOJu0YyJLHsqHsP7YSLLB0XpuYixIxd/BWp8AaAPF1mjPr94idE0UfXV
	KYyYgXZkZOGCfo/p4Shdwb7YYXgLnVaYyu1TliGO7N77KuA3hJANGOztFIMddCcUaHY=
X-Gm-Gg: ASbGncv7yq29+n/GgYf4qpGS9tejnNmCVi8miLEacvyePtmdn9hNsCkUWSSqBvWS6CF
	+J52DMBHp6+DFRlUfWeHSZlTlCd2fR+aemcdc6uC1lFuPkbkmZ97l6uLtQepZ3qaHrMdnPiFVIC
	DbgdhTx0wl04cIW7gTZ4J4oD1AYWB2lIlCPbuspr0XLWgzcI+nMjsfj1bMQJp8ZDqMtJJ2o/etz
	yvLw/dDAOJM6QsCTtniHPRuNrN9nbeNAjInovDWHEN7/GSlkfsno8U4n+bneqCgtLkh5zMzoIQM
	PD1OQDE0CsuR256PRpK/VlWH6pOtQ+9INmzGEof7VRaJc6h9mElSSypIy+4CQgoJcQmkIC03bZm
	hnBpsyGgdJsfF5IY6qzEF/Rg+8LexJPzP7CdAl3x7kpBLoJILpzXgh4/A+lAexfsYyJJBgX3EWQ
	WtHaYmsZY54zxQWDE7zn1XL7JScHYO6gEdhqTBdEzzpZVu3tsF/lkWgoAC+A==
X-Google-Smtp-Source: AGHT+IFKXKZ8cN3iLWN6n8+GBiZKGmyEDPex9uDRHeEYZf4mmSeyQ5c4G4NvKVn2qSQawBYHsXZ4CQ==
X-Received: by 2002:a05:6000:1ac8:b0:3ca:99ad:5191 with SMTP id ffacd0b85a97d-3ca99ad5743mr5990663f8f.8.1756308081046;
        Wed, 27 Aug 2025 08:21:21 -0700 (PDT)
Message-ID: <2d7bceff-d70f-4f17-b833-380ffc06577e@suse.com>
Date: Wed, 27 Aug 2025 17:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/events: Return -EEXIST for bound VIRQs
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-3-jason.andryuk@amd.com>
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
In-Reply-To: <20250826005517.41547-3-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yVAY1BcNylNoOBfWz0aii7DJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yVAY1BcNylNoOBfWz0aii7DJ
Content-Type: multipart/mixed; boundary="------------0ny5680ISBnZo4aAVwoi2CT4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <2d7bceff-d70f-4f17-b833-380ffc06577e@suse.com>
Subject: Re: [PATCH v2 2/3] xen/events: Return -EEXIST for bound VIRQs
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-3-jason.andryuk@amd.com>
In-Reply-To: <20250826005517.41547-3-jason.andryuk@amd.com>

--------------0ny5680ISBnZo4aAVwoi2CT4
Content-Type: multipart/mixed; boundary="------------lcecfKkKjQpW638uz1722be8"

--------------lcecfKkKjQpW638uz1722be8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDguMjUgMDI6NTUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IENoYW5nZSBmaW5k
X3ZpcnEoKSB0byByZXR1cm4gLUVFWElTVCB3aGVuIGEgVklSUSBpcyBib3VuZCB0byBhDQo+
IGRpZmZlcmVudCBDUFUgdGhhbiB0aGUgb25lIHBhc3NlZCBpbi4gIFdpdGggdGhhdCwgcmVt
b3ZlIHRoZSBCVUdfT04oKQ0KPiBmcm9tIGJpbmRfdmlycV90b19pcnEoKSB0byBwcm9wb2dh
dGUgdGhlIGVycm9yIHVwd2FyZHMuDQo+IA0KPiBTb21lIFZJUlFzIGFyZSBwZXItY3B1LCBi
dXQgb3RoZXJzIGFyZSBwZXItZG9tYWluIG9yIGdsb2JhbC4gIFRob3NlIG11c3QNCj4gYmUg
Ym91bmQgdG8gQ1BVMCBhbmQgY2FuIHRoZW4gbWlncmF0ZSBlbHNld2hlcmUuICBUaGUgbG9v
a3VwIGZvcg0KPiBwZXItZG9tYWluIGFuZCBnbG9iYWwgd2lsbCBwcm9iYWJseSBmYWlsIHdo
ZW4gbWlncmF0ZWQgb2ZmIENQVSAwLA0KPiBlc3BlY2lhbGx5IHdoZW4gdGhlIGN1cnJlbnQg
Q1BVIGlzIHRyYWNrZWQuICBUaGlzIG5vdyByZXR1cm5zIC1FRVhJU1QNCj4gaW5zdGVhZCBv
ZiBCVUdfT04oKS4NCj4gDQo+IEEgc2Vjb25kIGNhbGwgdG8gYmluZCBhIHBlci1kb21haW4g
b3IgZ2xvYmFsIFZJUlEgaXMgbm90IGV4cGVjdGVkLCBidXQNCj4gbWFrZSBpdCBub24tZmF0
YWwgdG8gYXZvaWQgdHJ5aW5nIHRvIGxvb2sgdXAgdGhlIGlycSwgc2luY2Ugd2UgZG9uJ3QN
Cj4ga25vdyB3aGljaCBwZXJfY3B1KHZpcnFfdG9faXJxKSBpdCB3aWxsIGJlIGluLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29t
Pg0KPiAtLS0NCj4gVjI6DQo+IE5ldw0KPiAtLS0NCj4gICBkcml2ZXJzL3hlbi9ldmVudHMv
ZXZlbnRzX2Jhc2UuYyB8IDE3ICsrKysrKysrKysrKy0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgYi9kcml2ZXJzL3hlbi9ldmVu
dHMvZXZlbnRzX2Jhc2UuYw0KPiBpbmRleCAxOTlhZmU1OWYzNTcuLmE4NWJjNDNmNDM0NCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMNCj4gKysr
IGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMNCj4gQEAgLTEzMTQsMTAgKzEz
MTQsMTIgQEAgaW50IGJpbmRfaW50ZXJkb21haW5fZXZ0Y2huX3RvX2lycV9sYXRlZW9pKHN0
cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsDQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0xfR1BM
KGJpbmRfaW50ZXJkb21haW5fZXZ0Y2huX3RvX2lycV9sYXRlZW9pKTsNCj4gICANCj4gLXN0
YXRpYyBpbnQgZmluZF92aXJxKHVuc2lnbmVkIGludCB2aXJxLCB1bnNpZ25lZCBpbnQgY3B1
LCBldnRjaG5fcG9ydF90ICpldnRjaG4pDQo+ICtzdGF0aWMgaW50IGZpbmRfdmlycSh1bnNp
Z25lZCBpbnQgdmlycSwgdW5zaWduZWQgaW50IGNwdSwgZXZ0Y2huX3BvcnRfdCAqZXZ0Y2hu
LA0KPiArCQkgICAgIGJvb2wgcGVyY3B1KQ0KPiAgIHsNCj4gICAJc3RydWN0IGV2dGNobl9z
dGF0dXMgc3RhdHVzOw0KPiAgIAlldnRjaG5fcG9ydF90IHBvcnQ7DQo+ICsJYm9vbCBleGlz
dHMgPSBmYWxzZTsNCj4gICAJaW50IHJjOw0KPiAgIA0KPiAgIAltZW1zZXQoJnN0YXR1cywg
MCwgc2l6ZW9mKHN0YXR1cykpOw0KPiBAQCAtMTMyOSwxMiArMTMzMSwxNiBAQCBzdGF0aWMg
aW50IGZpbmRfdmlycSh1bnNpZ25lZCBpbnQgdmlycSwgdW5zaWduZWQgaW50IGNwdSwgZXZ0
Y2huX3BvcnRfdCAqZXZ0Y2huKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAgIAkJaWYgKHN0YXR1
cy5zdGF0dXMgIT0gRVZUQ0hOU1RBVF92aXJxKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAtCQlp
ZiAoc3RhdHVzLnUudmlycSA9PSB2aXJxICYmIHN0YXR1cy52Y3B1ID09IHhlbl92Y3B1X25y
KGNwdSkpIHsNCj4gKwkJaWYgKHN0YXR1cy51LnZpcnEgIT0gdmlycSkNCj4gKwkJCWNvbnRp
bnVlOw0KPiArCQlpZiAoc3RhdHVzLnZjcHUgPT0geGVuX3ZjcHVfbnIoY3B1KSkgew0KPiAg
IAkJCSpldnRjaG4gPSBwb3J0Ow0KPiAgIAkJCXJldHVybiAwOw0KPiArCQl9IGVsc2UgaWYg
KCFwZXJjcHUpIHsNCj4gKwkJCWV4aXN0cyA9IHRydWU7DQo+ICAgCQl9DQo+ICAgCX0NCj4g
LQlyZXR1cm4gLUVOT0VOVDsNCj4gKwlyZXR1cm4gZXhpc3RzID8gLUVFWElTVCA6IC1FTk9F
TlQ7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtMTM4MSw4ICsxMzg3LDkgQEAgaW50
IGJpbmRfdmlycV90b19pcnEodW5zaWduZWQgaW50IHZpcnEsIHVuc2lnbmVkIGludCBjcHUs
IGJvb2wgcGVyY3B1KQ0KPiAgIAkJCWV2dGNobiA9IGJpbmRfdmlycS5wb3J0Ow0KPiAgIAkJ
ZWxzZSB7DQo+ICAgCQkJaWYgKHJldCA9PSAtRUVYSVNUKQ0KPiAtCQkJCXJldCA9IGZpbmRf
dmlycSh2aXJxLCBjcHUsICZldnRjaG4pOw0KPiAtCQkJQlVHX09OKHJldCA8IDApOw0KPiAr
CQkJCXJldCA9IGZpbmRfdmlycSh2aXJxLCBjcHUsICZldnRjaG4sIHBlcmNwdSk7DQo+ICsJ
CQlpZiAocmV0KQ0KPiArCQkJCWdvdG8gb3V0Ow0KDQpJIHRoaW5rIHlvdSBhcmUgbGVha2lu
ZyBpbmZvIGhlcmUuIEkgZ3Vlc3MgYSBjYWxsIG9mIF9fdW5iaW5kX2Zyb21faXJxKCkgaXMN
CndhbnRlZCBsaWtlIGluIHRoZSBlcnJvciBjYXNlIGJlbG93IChub3RlIHRoYXQgdGhlIGNh
c2Ugb2Ygbm8gdmFsaWQgZXZ0Y2huIGlzDQpoYW5kbGVkIHRoZXJlIGp1c3QgZmluZSkuDQoN
Cg0KSnVlcmdlbg0K
--------------lcecfKkKjQpW638uz1722be8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lcecfKkKjQpW638uz1722be8--

--------------0ny5680ISBnZo4aAVwoi2CT4--

--------------yVAY1BcNylNoOBfWz0aii7DJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmivInAFAwAAAAAACgkQsN6d1ii/Ey9u
nQf/d2Dv3yKWrLHyL84Dft14w1Ylc/XDu3j8B2EBCbORfuQGnulpJHpA3Bf/C67kluGYPk4U3SvT
GWs7HyWg6xQB73aG9pw4No4UbvNdWrFR9YHYPZ57D4icpbMyb0e0xREjeDT5FogUXUL0Y6NUnH+R
qR37bGsxlvLkCQ6FPMs73UJiSWZgRL7hy1KkC9FSiQnTkrI1/Ju7dtyD8boYs6Pzhj5yLQjpm78V
Ev6HA8Zeoe0VDvhbX1o6/0WjeCtWKYE4GRHEUnCGoNRzN422HR6jj38iOuVmRARrMKI/n2Br18it
NjMp+X/TIiAgeIXxz506MnbPv77aD8aZwSVBx/3d5w==
=ygjV
-----END PGP SIGNATURE-----

--------------yVAY1BcNylNoOBfWz0aii7DJ--

