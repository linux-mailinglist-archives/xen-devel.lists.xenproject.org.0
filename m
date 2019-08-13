Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3088BE48
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 18:21:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxZVD-0005MF-QM; Tue, 13 Aug 2019 16:18:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hxZVC-0005MA-Lb
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 16:18:26 +0000
X-Inumbo-ID: f98f57c2-bde5-11e9-8d1a-b3889ca63b8d
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f98f57c2-bde5-11e9-8d1a-b3889ca63b8d;
 Tue, 13 Aug 2019 16:18:25 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e27so6947781ljb.7
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2019 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KjNi2tejUKIfWG/alam1LjkYvGAxtkpXVhhmoMxcwzs=;
 b=S84vu+u54h4GzayLVhicevhEfHU/P6tGCGNdbGkLKwS60wXrYcTWcUuNz9mPMSMqzk
 G108rnzp1AyCT5h/D8QW4xRhYLcTFmaPAnBCgEhmbNPYEsioHhmSmdQl7L7NzlQyyAYJ
 AjHyJLkTiGA0tXTlYawQWGqp9q+uf5ArVNc2ckh3ychw+eF+o7Ewh4wX6zfpVVTvRWPi
 49pZC0cEt9arkrH2vyJfUJPDuQSCpoFGAMuk0clwqWvhajDerFDdwh1pluptqWP++AlN
 46v8NZltKQ9leq5obsWSai18D1hwWeCl+X1xgWYsM5u1+pfwlZuEeEVbonMcE0IsHa+E
 9ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KjNi2tejUKIfWG/alam1LjkYvGAxtkpXVhhmoMxcwzs=;
 b=LJZL0JLvLU4qiYNN/6U0wVUBnrhadGj5iYcy3TNFyhmIIvzXT7teP2PdGK5s8mdiRQ
 1Ld+TM+lguPOj3VdTgsbYMBDT3fgbn4oeJG+V0jwY9+0IcNI6EL/0Jps/lh+mcBIjF63
 04bTHgCDcTlygGs9APfrxXdjwZFZWDiacufXsszOKulZ0aAF1GmOXFRkCb9x5EVRo5xK
 VGhf+A7ZSsB6tulRrZWzunxTIX8dzymwrGs/kAuPKWO2yEJTqsR9fVMyvBVU4KAEjYs6
 2qsal8O2sN6V5rbc1gRA1CQphX6SWEJ6l/rbdeGN8kuQis28LtM9q4VwlYIYmWg8URtL
 wPww==
X-Gm-Message-State: APjAAAVIvYTUEngoQY9ax9DNNEhcc9swXICTWPRMcsGASITcD77indzP
 84x7E0JR5nOseuIFOq4eLd8=
X-Google-Smtp-Source: APXvYqxUuLeZOJFXN7wIdjqqFM6FARlAofuwHqt/cNUFcw3l6fNgsyrAZt/EcwEnuxzNqaqxxCGSDw==
X-Received: by 2002:a2e:c51:: with SMTP id o17mr22415542ljd.157.1565713103925; 
 Tue, 13 Aug 2019 09:18:23 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n18sm3345191lfe.13.2019.08.13.09.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 09:18:23 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-5-git-send-email-olekstysh@gmail.com>
 <33ac8ed2-572f-a7d8-ddfa-17f6dd50f0f8@arm.com>
 <72b1672a-8774-add8-a9f9-216fbd872b83@gmail.com>
 <c67d5da9-2d76-1730-5948-a9bfbfabe5eb@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <74f658be-ad06-3925-aaca-b8925a3e159b@gmail.com>
Date: Tue, 13 Aug 2019 19:18:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c67d5da9-2d76-1730-5948-a9bfbfabe5eb@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 4/6] iommu/arm: Add lightweight
 iommu_fwspec support
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEzLjA4LjE5IDE4OjI4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gOC8xMy8xOSA0OjE3IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4+Cj4+IE9uIDEzLjA4
LjE5IDE1OjM5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pgo+Pj4geGZyZWUgaXMgYWJsZSB0byBk
ZWFsIHdpdGggTlVMTCBwb2ludGVyLCBzbyB0aGUgY2hlY2sgaXMgbm90IG5lY2Vzc2FyeS4KPj4K
Pj4gWWVzLCB0aGUgcmVhc29uIEkgbGVmdCB0aGlzIGNoZWNrIGlzIHRvIG5vdCBwZXJmb3JtIGFu
IGV4dHJhIAo+PiBvcGVyYXRpb24gKGRldl9pb21tdV9md3NwZWNfc2V0KS4gU2hhbGwgSSBkcm9w
IHRoaXMgY2hlY2sgYW55d2F5Pwo+Cj4gSSBjYW4ndCBzZWUgYW55IGlzc3VlIHRvIGRvIHRoZSBl
eHRyYSBvcGVyYXRpb24uIFRoaXMgaXMgbm90IGhvdHBhdGggCj4gYW5kIGl0IGlzIGhhcm1sZXNz
LgoKb2ssIHdpbGwgZHJvcC4KCgo+Cj4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LWFybS9pb21tdS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oCj4+Pj4gaW5kZXggMjBk
ODY1ZS4uMTg1M2JkOSAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11
LmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmgKPj4+PiBAQCAtMTQsNiAr
MTQsOCBAQAo+Pj4+IMKgICNpZm5kZWYgX19BUkNIX0FSTV9JT01NVV9IX18KPj4+PiDCoCAjZGVm
aW5lIF9fQVJDSF9BUk1fSU9NTVVfSF9fCj4+Pj4gwqAgKyNpbmNsdWRlIDxhc20vaW9tbXVfZndz
cGVjLmg+Cj4+Pgo+Pj4gaW9tbXUuaCBkb2VzIG5vdCBzZWVtIHRvIHVzZSBhbnl0aGluZyBkZWZp
bmVkIGluIGlvbW11X2Z3c3BlYy5oLiBTbyAKPj4+IHdoeSBkbyB5b3UgaW5jbHVkZSBpdCBoZXJl
Pwo+Pgo+PiBJIHdhcyB0aGlua2luZyB0aGF0IGV2ZXJ5IHNvdXJjZSB3aGljaCBpbmNsdWRlcyBp
b21tdS5oIHdpbGwgZ2V0IAo+PiBpb21tdV9md3NwZWMuaCBpbmNsdWRlZCBpbmRpcmVjdGx5LiBO
byBuZWVkIHRvIGluY2x1ZGUgaW9tbXVfZndzcGVjLmggCj4+IGluIG1hbnkgc291cmNlcy4KPj4K
Pj4gVGhpcyB3YXMgYSByZWFzb24uIFNoYWxsIEkgaW5jbHVkZWQgaXQgZGlyZWN0bHkgd2hlcmUg
bmVlZGVkPwo+Cj4gVGhlcmUgYXJlIGEgZmV3IGNhc2VzIHdoZXJlIGlvbW11LmggaXMgcmVxdWly
ZWQgYnV0IG5vdCAKPiBpb21tdV9md3NwZWMuaC4gSW4gZ2VuZXJhbCwgSSB3b3VsZCBwcmVmZXIg
aWYgaGVhZGVycyBhcmUgb25seSAKPiBpbmNsdWRlZCB3aGVuIHN0cmljdGx5IG5lY2Vzc2FyeS4K
CmdvdCBpdCwgd2lsbCBkcm9wIGZyb20gaGVyZSBhbmQgaW5jbHVkZSB3aGVyZSBuZWNlc3Nhcnku
CgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
