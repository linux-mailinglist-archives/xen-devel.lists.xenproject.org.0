Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D48BC66C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:14:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCihz-0004V1-OL; Tue, 24 Sep 2019 11:10:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCihy-0004UY-Gw
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:10:14 +0000
X-Inumbo-ID: 626321d4-deb1-11e9-ae5c-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by localhost (Halon) with ESMTPS
 id 626321d4-deb1-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 09:55:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v24so1229335ljj.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 02:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dsyZXuTrzchuzcZxMrV9hsuqdQwT+gSQjkKW0BTksJs=;
 b=hJtRGYjg1Pz8R3QV0npS/wWjD8F/e7/sA9ONjK3CuWMYzDyA3p/JregFeqfRpFmykA
 Mj5vJ12hHK7MA8VkyUYFn02mtvtIMels+YKKLrY/hIP34NwoOWOIbNY7pvSqdT/aDtgk
 dSikwTQrBUNhpS1+EPH5p4jIZF50dr8RsAEX3DR9E+Scyx2x7U0Cw5smFyJXyxMLmmyO
 8mFL/xNkher1DHMx89IFkat3gRfGf0An2ZvfJkf5kb+7YRWIIiw1ZgcIoxt4mZ9U/XCq
 W/DBo1jTPw5Ga8nypUO8f3dqkFjlmBfV64IpD/WY8lbgErMq0X/+qK6no9K4F/qcAPg2
 Z3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dsyZXuTrzchuzcZxMrV9hsuqdQwT+gSQjkKW0BTksJs=;
 b=ojl7jVfOk5xLRj70JqC7pFmdshFZef1qkzUJkZXUDsy8qfdVXLnHKp8IcM2OhwBGfw
 0RDrFMNtjs+6fOVX/Rw0Zff3LCsMs1qyl7wFIzmGUdzpa85ufDiErqibh2SrqX2pwvaX
 75TL8ENsTGyjztVOdLSIZXcGaFpe1u3gzfKBnN7S3Fkmr8znxZ4BrH0DBKLBgwfXKUfg
 Kl77LqT07v0nNQrpHELO1JIYYTiTazUVdn3b08e5CcNA4zp8zNp/GE5o5zs8f4dZYoQW
 1XMiXttlVVUjOJIe9gO62k4kJJBHtGx1UQ0PjVE+TVqfx6gy+D9QCEavxR6Dq6xb+p3j
 m4jQ==
X-Gm-Message-State: APjAAAWWSIbI7VKeyibEVQsrBJm6sCdD7qd7+uV2WtpKoN5bC83QeNwX
 syx7RZVP+xmiy6lu7HaGY34=
X-Google-Smtp-Source: APXvYqyypCiDDnZ+EyoYlpqzRzri7lHySaI53zzE9gepLwHtZfrKzXzfoEfZ9RBH8udiQ3Z0UCROAw==
X-Received: by 2002:a2e:58a:: with SMTP id 132mr1323685ljf.132.1569318904703; 
 Tue, 24 Sep 2019 02:55:04 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id o5sm336271lfn.42.2019.09.24.02.55.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 02:55:04 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568224770-25402-1-git-send-email-olekstysh@gmail.com>
 <f328bc9a-8466-c87e-a00c-223172823ac3@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b901ff2d-0697-ee83-b929-da1832d365b4@gmail.com>
Date: Tue, 24 Sep 2019 12:55:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f328bc9a-8466-c87e-a00c-223172823ac3@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH V3] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI0LjA5LjE5IDEyOjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgoKSGksIEp1bGll
bgoKCj4KPiBPbiAxMS8wOS8yMDE5IDE4OjU5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToK
Pj4gLS0tCj4+IMKgIHhlbi9hcmNoL2FybS9wMm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgNDEgCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tCj4+IMKgIHhlbi9hcmNoL2FybS9zZXR1cC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgOSArKysrKy0tCj4+IMKgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9pcG1tdS12bXNhLmMgfCAxOCArKy0tLS0tLS0tLS0tLQo+PiDCoCB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS5jwqDCoMKgwqDCoMKgIHwgMTEgKysrLS0tLS0tCj4+IMKgIHhl
bi9pbmNsdWRlL2FzbS1hcm0vcDJtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDkgKysrKysrKwo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDMwIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2Fy
Y2gvYXJtL3AybS5jCj4+IGluZGV4IDIzNzRlOTIuLmQ1ZTI1MzkgMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9wMm0uYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPj4gQEAgLTM0LDcg
KzM0LDExIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBtYXhfdm1pZCA9IAo+
PiBNQVhfVk1JRF84X0JJVDsKPj4gwqAgwqAgI2RlZmluZSBQMk1fUk9PVF9QQUdFU8KgwqDCoCAo
MTw8UDJNX1JPT1RfT1JERVIpCj4+IMKgIC11bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBwMm1f
aXBhX2JpdHM7Cj4+ICsvKgo+PiArICogU2V0IGxhcmdlciB0aGFuIGFueSBwb3NzaWJsZSB2YWx1
ZSwgc28gdGhlIG51bWJlciBvZiBJUEEgYml0cyBjYW4gYmUKPj4gKyAqIHJlc3RyaWN0ZWQgYnkg
ZXh0ZXJuYWwgZW50aXR5IChlLmcuIElPTU1VKS4KPj4gKyAqLwo+PiArdW5zaWduZWQgaW50IF9f
cmVhZF9tb3N0bHkgcDJtX2lwYV9iaXRzID0gNjQ7Cj4+IMKgIMKgIC8qIEhlbHBlcnMgdG8gbG9v
a3VwIHRoZSBwcm9wZXJ0aWVzIG9mIGVhY2ggbGV2ZWwgKi8KPj4gwqAgc3RhdGljIGNvbnN0IHBh
ZGRyX3QgbGV2ZWxfbWFza3NbXSA9Cj4+IEBAIC0xOTEyLDYgKzE5MTYsMTYgQEAgc3RydWN0IHBh
Z2VfaW5mbyAqZ2V0X3BhZ2VfZnJvbV9ndmEoc3RydWN0IAo+PiB2Y3B1ICp2LCB2YWRkcl90IHZh
LAo+PiDCoMKgwqDCoMKgIHJldHVybiBwYWdlOwo+PiDCoCB9Cj4+IMKgICt2b2lkIF9faW5pdCBw
Mm1fcmVzdHJpY3RfaXBhX2JpdHModW5zaWduZWQgaW50IGlwYV9iaXRzKQo+PiArewo+PiArwqDC
oMKgIC8qCj4+ICvCoMKgwqDCoCAqIENhbGN1bGF0ZSB0aGUgbWluaW11bSBvZiB0aGUgbWF4aW11
bSBJUEEgYml0cyB0aGF0IGFueSAKPj4gZXh0ZXJuYWwgZW50aXR5Cj4+ICvCoMKgwqDCoCAqIGNh
biBzdXBwb3J0Lgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBpZiAoIGlwYV9iaXRzIDwgcDJt
X2lwYV9iaXRzICkKPj4gK8KgwqDCoMKgwqDCoMKgIHAybV9pcGFfYml0cyA9IGlwYV9iaXRzOwo+
PiArfQo+PiArCj4+IMKgIC8qIFZUQ1IgdmFsdWUgdG8gYmUgY29uZmlndXJlZCBieSBhbGwgQ1BV
cy4gU2V0IG9ubHkgb25jZSBieSB0aGUgCj4+IGJvb3QgQ1BVICovCj4+IMKgIHN0YXRpYyB1aW50
MzJfdCBfX3JlYWRfbW9zdGx5IHZ0Y3I7Cj4+IMKgIEBAIC0xOTY2LDE1ICsxOTgwLDI0IEBAIHZv
aWQgX19pbml0IHNldHVwX3ZpcnRfcGFnaW5nKHZvaWQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBb
N10gPSB7IDAgfcKgIC8qIEludmFsaWQgKi8KPj4gwqDCoMKgwqDCoCB9Owo+PiDCoCAtwqDCoMKg
IHVuc2lnbmVkIGludCBjcHU7Cj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGksIGNwdTsKPj4gwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgcGFfcmFuZ2UgPSAweDEwOyAvKiBMYXJnZXIgdGhhbiBhbnkg
cG9zc2libGUgdmFsdWUgKi8KPj4gwqDCoMKgwqDCoCBib29sIHZtaWRfOF9iaXQgPSBmYWxzZTsK
Pj4gwqAgK8KgwqDCoCBpZiAoIHAybV9pcGFfYml0cyA8IDQwICkKPj4gK8KgwqDCoMKgwqDCoMKg
IHBhbmljKCJQMk0gSVBBIHNpemUgbXVzdCBiZSBhdCBsZWFzdCA0MC1iaXQgCj4+IChwMm1faXBh
X2JpdHM9JXUpXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcDJtX2lwYV9iaXRz
KTsKPgo+IElzbid0IHRoaXMgY2hlY2sgbWVhbnQgdG8gYmUgZm9yIEFybTMyPyBJZiBzbywgdGhp
cyBwYXRoIGlzIG5vdCBjYWxsZWQgCj4gYnkgYXJtMzIuIFNlZSB0aGUgI2lmZGVmIENPTkZJR19B
Uk1fMzIgYWJvdmUuCgpJIHdpbGwgbW92ZSB1bmRlciAjaWZkZWYgQ09ORklHX0FSTV8zMgoKCj4K
Pgo+IEFsc28sIEkgd291bGQgc3VnZ2VzdCB0byByZXdvcmQgdGhlIG1lc3NhZ2UgdG86Cj4KPiAi
UDJNOiBOb3QgYWJsZSB0byBzdXBwb3J0ICXigbtiaXQgSVBBIGF0IHRoZSBtb21lbnQuXG4iCgpv
awoKCj4KPiBUaGUgcmVzdCBvZiB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgoKClNoYWxsIHRo
ZSBub24tUkZDIHBhdGNoIGJlIHNwbGl0IGludG8gImFkZGluZyBwb3NzaWJpbGl0eSB0byByZXN0
cmljdCIgCmFuZCAicmVzdHJpY3QgYnkgdGhlIElPTU1VIGRyaXZlcnMiPwoKCi0tIApSZWdhcmRz
LAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
