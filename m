Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DFDBD0B5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoe5-0004kY-Ju; Tue, 24 Sep 2019 17:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCoe3-0004kS-So
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:30:35 +0000
X-Inumbo-ID: 03f066e4-def1-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by localhost (Halon) with ESMTPS
 id 03f066e4-def1-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 17:30:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v24so2769170ljj.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hEhHjNrUEwe6ph/Cxwx95HapK6qfSR5aO5dYXkwr8Nk=;
 b=C+R3GD5BT14AP2XYXnw5dRjCXH9TXLSnLdoinNtlIpRFGTpyNiwe7U2olumzt4aeK1
 sy1pH9eusRmIk50LLqiefbZxYHwYgsQxFYO1Uef76Qti3ziJk7xJvSB5BJyigikfOTlA
 gzrdX8Dg0zqj0D0pYjpnaauFpfGvhfK8PxdNS2bbNkZN90DP8Qb3Pfb9+hoolxvxjsjd
 PqaEFPgq+QQHbpoEaNCpHEZfAgl3ZsGPvUmBfJ3ZGLRcVJH8n2xSsT860jdtSLWu0L2p
 JcW0TzCqJtUG6xEJEY9jG8o4JRxR5oEn3i5gTIys9mc8VsmSYRmjvRXNCQCSjg0vW0Vu
 45Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hEhHjNrUEwe6ph/Cxwx95HapK6qfSR5aO5dYXkwr8Nk=;
 b=WYVznuabuyuibA2qRSsAKSMQxLvk3siAmYB4I8qJ5vkpw4QZ1y38JkWMWCQ7mNP1Us
 9QsOA/vhfwzyYtNMMi1mVoc/W/IPRnYjba8XdUI0w+YmQXllJbQdYyD1O05RGTavcvTW
 3EgI1rulkoFL8pDNlaP3r4Cfm2/BnH1GCp7Uf4sgst7G3ak5jflfYkU2LksVBIFQROKy
 Tfy6C0Sy33UY9sabZkK3y4kLqkRDhW9U38JTAWhHOdrpFs9bU7wiHBmc81Un5O2A8Rz/
 QgBgHNfNgH1ySTA60h1u0tOqCZf1GxgYTQg2ouIusHzZubt4L/b7mLDdayoG3Xmqz3XV
 RFDA==
X-Gm-Message-State: APjAAAUzb1ZW0nybeqtmUR4p7OX9Mzh973gkS5gEGGUAKjJq7yooOGeH
 3LeGCU7m8GU6PQHkXoLjBto=
X-Google-Smtp-Source: APXvYqxtNmXXUn1oAyPTdvY1/s9ptMH2YGzXZWIGQm4Ya0zjXKKqGHD5e46F6GIXW3onT/f2cNhVkg==
X-Received: by 2002:a2e:b60b:: with SMTP id r11mr2804915ljn.117.1569346234175; 
 Tue, 24 Sep 2019 10:30:34 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id 77sm613947ljf.85.2019.09.24.10.30.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 10:30:33 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
 <1569339027-19484-8-git-send-email-olekstysh@gmail.com>
 <27781495-c097-f0a3-6c75-d8cb2aa6f523@arm.com>
 <a16bf417-5e85-46e8-0ec4-167323384c8b@gmail.com>
 <f006d373-c759-938a-707a-33cfa0f0e338@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2c7b99c9-e1b5-9d1d-f7b0-fe5d084c9e4f@gmail.com>
Date: Tue, 24 Sep 2019 20:30:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f006d373-c759-938a-707a-33cfa0f0e338@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
 sstabellini@kernel.org, volodymyr_babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI0LjA5LjE5IDIwOjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuLgoKCj4KPj4+Cj4+Pgo+Pj4gWy4uLl0KPj4+Cj4+Pj4gwqAgaW50IGlvbW11X2Rv
X2R0X2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLAo+
Pj4+IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKPj4+PiDC
oCB7Cj4+Pj4gQEAgLTE3Nyw2ICsyNDEsMTMgQEAgaW50IGlvbW11X2RvX2R0X2RvbWN0bChzdHJ1
Y3QgeGVuX2RvbWN0bCAKPj4+PiAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4gwqAgK8KgwqDCoMKgwqDCoMKgIGlvbW11X2FkZF9kdF9kZXZpY2UoZGV2KTsKPj4+Cj4+PiBT
YW1lIGhlcmUuCj4+Cj4+IFllcywgSSB0aGluaywgd2UgZG9uJ3QgbmVlZCB0byBjaGVjayBmb3Ig
cmV0dXJuIHZhbHVlLCBiZWNhdXNlIHRoZSAKPj4gb25seSBvbmUgcG9zaXRpdmUgcmVzdWx0ICJo
ZXJlIiBpcyB0aGUgZmFjdCB0aGF0ICJkZXZpY2UgaXMgCj4+IHByb3RlY3RlZCIgKHdoaWNoIGlz
IGNoZWNrZWQgYmVsb3cpLgo+Pgo+PiBXaGF0IGlzIG1vcmUsIGlmIHdlIGFkZCBhIGNoZWNrIGZv
ciB0aGUgcmV0dXJuIHZhbHVlIHRvIGJlIHN0cmljdGx5IAo+PiAwLCB3ZSB3aWxsIGdldCBhbiBl
cnJvciBhZnRlciBndWVzdCdzIHJlYm9vdCAoc2luY2UgCj4+IGlvbW11X2FkZF9kdF9kZXZpY2Uo
KSB3aWxsIHJldHVybiAtRUVYSVNUKS4KPj4KPj4gU28sIEkgd2lsbCBhZGQgYSBjb21tZW50IGV4
cGxhaW5pbmcgd2h5IHdlIGRvbid0IGNoZWNrLiBXaGF0IGRvIHlvdSAKPj4gdGhpbms/Cj4KPiBX
aHkgZG9uJ3QgeW91IGRvIHRoZSBmb2xsb3dpbmcgY29kZT8KPgo+IGlmICggcmV0IDwgMCAmJiBy
ZXQgIT0gLUVFWElTVCApCj4KPiBUaGlzIHdvdWxkIGFsbG93IHRoZSBjb2RlIHRvIHJldHVybiB0
aGUgY29ycnJlY3QgZXJyb3IgdG8gdGhlIHVwcGVyIAo+IGxheWVyLiBBIHN1aXRhYmxlIGNvbW1l
bnQgb24gdG9wIGV4cGxhaW5nIHRoZSBjaGVjayB3b3VsZCBhbHNvIGJlIHVzZWZ1bC4KCkJlaW5n
IGhvbmVzdCwgSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhlIHNpbWlsYXIsIGJ1dCByZWplY3RlZCB0
aGlzLiBJIAp0aG91Z2h0LCBhbGwgd2hhdCB3ZSB3YW50ZWQgdG8ga25vdyAiaGVyZSIgd2FzIHdo
ZXRoZXIgdGhlIHBhcnRpY3VsYXIgCmRldmljZSBwcm90ZWN0ZWQgb3Igbm90LiBCdXQsIEkgYWdy
ZWUgbm93LCB0aGUgdXBwZXIgbGF5ZXIgc2hvdWxkIGJlIAppbmZvcm1lZCBhYm91dCB0aGUgZXhh
Y3QgZXJyb3IgcmVhc29uLgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
