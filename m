Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D9ADAF6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:15:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KP0-0007cB-C8; Mon, 09 Sep 2019 14:12:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MMG2=XE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i7KOz-0007c3-AQ
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:12:21 +0000
X-Inumbo-ID: d6063e8e-d30b-11e9-b299-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6063e8e-d30b-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 14:12:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a22so12945551ljd.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2019 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=76rQnt42kndgjWXURx3QQ0HWj5N9YRbwqICMYTEddTE=;
 b=lFuiG5QJ8SKBq0sftcuIgGGJDYnxMYuYXTRGZkKO0bWUjJc0jObsjrCNMmBUkDU2Ax
 52QGpEAI+AhMi4l1kYG15+XIrW2adftZQx1pIxeRQwv52TLtvxBe16KOMyd6DQssfRmh
 A2vg+nEHs/z26QUmiRbdT1ER2hYo7ChoVXckLPKqEr2CbghHAgUq07/VnkTT8a/o3SIh
 5VP/ZM57LJG+qXQtLODSBtZBXog5mg7CPng3k4LaOzz3UeV5dZ6wnMrj8f94i7oMjQ7Q
 OZmo/r91OKu3gHW9HpOZTz9rNWPzhrzyi9mIV5vHomYJQnV63KArzC6w0NVErSAxhst6
 +CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=76rQnt42kndgjWXURx3QQ0HWj5N9YRbwqICMYTEddTE=;
 b=BoGJXnUxVQV2Oou2Tz7hRJAPQIeC3uUeQh7q6xWCnoeRmuHEPZbl1IiPnIFrhqevk8
 BBoi2S2arC7Uo/MreNAYqC96U8bmBtTDKFQrQ0Bjgs6mBw+q2t1cRvZtlNOps051pzP/
 ZvBlPzAEivIErjZ94zY0fucIdQU4BJpl/ErSqtHnhm98uf7mJ/UtbhW1tkfHBlPjky0p
 SDJcuonru/3FyvlJR7QGyWVgtGl3icQ0eEuyMiZmxBbIv7w28h85qYZXSBjuK2w7UZzT
 HAbUZgzaAdI3wiRBuPYd5EtU6eizn9BjwH1VzwWoaUTml1TkRfcC+C6Qs4jXLRBWFLRZ
 QyGA==
X-Gm-Message-State: APjAAAUMMZDE31qkHpgeHwX3ljHRPynQ9rojojPEPRW14AH2lINUqX08
 jz3GOCBpC1cIfSgV0J8ErbQ=
X-Google-Smtp-Source: APXvYqzUzveOwQSceK/wzE79BwepTlLcs+XxVprqMYYm/WD94vo7QpWlen38qGj6a7yNTCk3Xqka4g==
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr2403117ljc.138.1568038339501; 
 Mon, 09 Sep 2019 07:12:19 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id 18sm2571442ljd.86.2019.09.09.07.12.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 07:12:18 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-2-git-send-email-olekstysh@gmail.com>
 <899e4076-d47e-a7e6-14e5-dba21124a330@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <48f2d21d-a3b5-c422-59a5-cda9a2b80f91@gmail.com>
Date: Mon, 9 Sep 2019 17:12:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <899e4076-d47e-a7e6-14e5-dba21124a330@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 1/8] iommu/arm: Add iommu_helpers.c file
 to keep common for IOMMUs stuff
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

Ck9uIDA5LjA5LjE5IDE0OjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbgoKCj4KPiBPbiA4LzIwLzE5IDc6MDkgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+Cj4+Cj4+IEludHJvZHVjZSBhIHNlcGFyYXRlIGZpbGUgdG8ga2VlcCB2YXJp
b3VzIGhlbHBlcnMgd2hpY2ggY291bGQgYmUgdXNlZAo+PiBieSBtb3JlIHRoYW4gb25lIElPTU1V
IGRyaXZlciBpbiBvcmRlciBub3QgdG8gZHVwbGljYXRlIGNvZGUuCj4+Cj4+IFRoZSBmaXJzdCBj
YW5kaWRhdGVzIHRvIGJlIG1vdmVkIHRvIHRoZSBuZXcgZmlsZSBhcmUgU01NVSBkcml2ZXIncwo+
PiAibWFwX3BhZ2UvdW5tYXBfcGFnZSIgY2FsbGJhY2tzLiBUaGVyZSBjYWxsYmFja3MgbmVpdGhl
ciBjb250YWluIGFueQo+Cj4gcy9UaGVyZS9UaGVzZS8gSSB0aGluay4KCm9rCgoKPgo+PiDCoCBz
dGF0aWMgX19pbml0IGNvbnN0IHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKmZpbmRfc21tdShjb25z
dCBzdHJ1Y3QgCj4+IGRldmljZSAqZGV2KQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LWFybS9pb21tdS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oCj4+IGluZGV4IDkwNGM5
YWUuLjIwZDg2NWUgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaAo+
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmgKPj4gQEAgLTI2LDYgKzI2LDEzIEBA
IHN0cnVjdCBhcmNoX2lvbW11Cj4+IMKgIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11X2dl
dF9vcHModm9pZCk7Cj4+IMKgIHZvaWQgaW9tbXVfc2V0X29wcyhjb25zdCBzdHJ1Y3QgaW9tbXVf
b3BzICpvcHMpOwo+PiDCoCArLyogbWFwcGluZyBoZWxwZXJzICovCj4KPiBJIHdvdWxkIHNwZWNp
ZnkgdGhpcyBvbmx5IHdvcmtzIHdoZW4gdGhlIFBUIGlzIHNoYXJlZCBiZXR3ZWVuIHRoZSAKPiBJ
T01NVSBhbmQgQ1BVLgoKb2sKCgo+Cj4KPiBXaXRoIHRoZSB0d28gcmVxdWVzdHMgYWRkcmVzc2Vk
Ogo+Cj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGFu
ayB5b3UKCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
