Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913458BCE3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:19:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYYB-0006xF-Et; Tue, 13 Aug 2019 15:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hxYY9-0006wm-Pg
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:17:25 +0000
X-Inumbo-ID: 73dc8026-bddd-11e9-a298-873daada3013
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73dc8026-bddd-11e9-a298-873daada3013;
 Tue, 13 Aug 2019 15:17:24 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f9so3382188ljc.13
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2019 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VK4BtIzhDsbvDC8WEuC3nVwLRqCkr9qrwyKoC7YNhog=;
 b=EdvavpWoOx7fZEZ6KnCmQziUGRqG5ew1LFH/vigl3J4THixtJCrVwgsCe+HTNKLX7T
 cvkFCObEnMMu8Fl0jBrQiZV4T4zVH05gM/M/HLBP9b/6VJJJg+VcilsXYhxYwl80we3C
 BzOoUlyhFE/3Q9DUAxnaXrTDkvv04brZHaJsNbxTJSZLii4DptDWYhV/cf3ia1STSkTQ
 JahHTG3VZLSTz6zwPqYe9vW1tbosOrYR3FT/P5XqsE1b4H7H1PWcLPW7q2yslRfrCaP6
 z/Gjt6j7ItISJt+Gh+PL8t/4fM/5Hu/6YiZw9nlYXLCUpCU9l6Zw+4L95BPA6bmpCXqZ
 lHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VK4BtIzhDsbvDC8WEuC3nVwLRqCkr9qrwyKoC7YNhog=;
 b=d3il0wxNF207yNlUFTp9DLz1wqApWh0Q0/6JVm1RcD4uIwoNqvZfm2NDXCvIgKZ71C
 Z7xw6s8OgqnaTqw3pQlunTC8JoLra5rDYqjVXmCd0QWIdhE1ro0yaIEVV5KiP13ZHz2G
 5vJDHc5U8YE8M+jITG0SM/uco33gVXPvhPS3dvhzDk6xx5JsXvuMlwoFLW7TXWpZeSO/
 /kv5/9Okd8qR9bD7Y+K6QJZqt/NRLwIBNlmDna9ILKxp+C35hnGpwxbP+Yj3G1O3I4nF
 TlQuwBELagqnkvL+y8RmH4CkyRBk+2S4e36/50299mSioai7mN22GCosZzfRsFxSgR6N
 xZ8w==
X-Gm-Message-State: APjAAAXoQWb3OMBFcb/NUPcNLo5luBOdHBS9XAO72AiBmOAc6B6TveBJ
 qT7fe4zkTZa4YvFCrm/iQvQ=
X-Google-Smtp-Source: APXvYqz9fPmZns3CT4oaW7F0smgKxSLfo6kcy6FFRPzUEZUVryyPKTxYUTbZm0p8DAKFsDeOuyd7zA==
X-Received: by 2002:a2e:94cb:: with SMTP id r11mr20975809ljh.212.1565709443603; 
 Tue, 13 Aug 2019 08:17:23 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id h1sm19725899lfj.21.2019.08.13.08.17.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 08:17:23 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-5-git-send-email-olekstysh@gmail.com>
 <33ac8ed2-572f-a7d8-ddfa-17f6dd50f0f8@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <72b1672a-8774-add8-a9f9-216fbd872b83@gmail.com>
Date: Tue, 13 Aug 2019 18:17:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <33ac8ed2-572f-a7d8-ddfa-17f6dd50f0f8@arm.com>
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

Ck9uIDEzLjA4LjE5IDE1OjM5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuLgoKCj4KPiBPbiA4LzIvMTkgNTozOSBQTSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4KPj4KPj4gV2UgbmVlZCB0byBoYXZlIHNvbWUgYWJzdHJhY3Qgd2F5IHRvIGFk
ZCBuZXcgZGV2aWNlIHRvIHRoZSBJT01NVQo+PiBiYXNlZCBvbiB0aGUgZ2VuZXJpYyBJT01NVSBE
VCBiaW5kaW5nIFsxXSB3aGljaCBjYW4gYmUgdXNlZCBmb3IKPj4gYm90aCBEVCAocmlnaHQgbm93
KSBhbmQgQUNQSSAoaW4gZnV0dXJlKS4KPj4KPj4gRm9yIHRoYXQgcmVhc29uIHdlIGNhbiBib3Jy
b3cgdGhlIGlkZWEgdXNlZCBpbiBMaW51eCB0aGVzZSBkYXlzCj4+IGNhbGxlZCAiaW9tbXVfZndz
cGVjIi4gSGF2aW5nIHRoaXMgaW4sIGl0IHdpbGwgYmUgcG9zc2libGUKPj4gdG8gY29uZmlndXJl
IElPTU1VIG1hc3RlciBpbnRlcmZhY2VzIG9mIHRoZSBkZXZpY2UgKGRldmljZSBJRHMpCj4+IGZy
b20gYSBzaW5nbGUgY29tbW9uIHBsYWNlIGFuZCBhdm9pZCBrZWVwaW5nIGFsbW9zdCBpZGVudGlm
aWNhbCBsb29rLXVwCj4KPiBzL2lkZW50aWZpY2FsL2lkZW50aWNhbC8KCm9rCgoKPgo+PiBpbXBs
ZW1lbnRhdGlvbnMgaW4gZWFjaCBJT01NVSBkcml2ZXIuCj4+Cj4+IFRoZXJlIGlzIG5vIG5lZWQg
dG8gcG9ydCB0aGUgd2hvbGUgaW1wbGVtZW50YXRpb24gb2YgImlvbW11X2Z3c3BlYyIKPj4gdG8g
WGVuLCB3ZSBjb3VsZCwgcHJvYmFibHksIGVuZCB1cCB3aXRoIGEgbXVjaCBzaW1wbGVyIHNvbHV0
aW9uLAo+PiBzb21lICJzdHJpcHBlZCBkb3duIiB2ZXJzaW9uIHdoaWNoIGZpdHMgb3VyIHJlcXVp
cm1lbnRzLgo+Cj4gcy9yZXF1aXJtZW50cy9yZXF1aXJlbWVudHMvCgpvawoKCj4KPj4gKyAqLwo+
PiArCj4+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPgo+PiArI2luY2x1ZGUgPHhlbi9pb21tdS5oPgo+
Cj4gUGxlYXNlIG9yZGVyIHRoZSBoZWFkZXJzIGFscGhhYmV0aWNhbGx5Lgo+Cj4gTklUOiBDYW4g
eW91IGEgbmV3bGluZSBiZXR3ZWVuIHhlbiBhbmQgYXNtIGhlYWRlcnM/CgpXaWxsIGRvCgoKPgo+
PiArI2luY2x1ZGUgPGFzbS9kZXZpY2UuaD4KPj4gKyNpbmNsdWRlIDxhc20vaW9tbXVfZndzcGVj
Lmg+Cj4KPj4gKwo+PiAraW50IGlvbW11X2Z3c3BlY19pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZSAqaW9tbXVfZGV2KQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBpb21tdV9m
d3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0KGRldik7Cj4+ICsKPj4gK8KgwqDC
oCBpZiAoIGZ3c3BlYyApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gKwo+PiArwqDC
oMKgIGZ3c3BlYyA9IHh6YWxsb2Moc3RydWN0IGlvbW11X2Z3c3BlYyk7Cj4+ICvCoMKgwqAgaWYg
KCAhZndzcGVjICkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiArCj4+ICvC
oMKgwqAgZndzcGVjLT5pb21tdV9kZXYgPSBpb21tdV9kZXY7Cj4+ICvCoMKgwqAgZGV2X2lvbW11
X2Z3c3BlY19zZXQoZGV2LCBmd3NwZWMpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9
Cj4+ICsKPj4gK3ZvaWQgaW9tbXVfZndzcGVjX2ZyZWUoc3RydWN0IGRldmljZSAqZGV2KQo+PiAr
ewo+PiArwqDCoMKgIHN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3Nw
ZWNfZ2V0KGRldik7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIGZ3c3BlYyApCj4KPiB4ZnJlZSBpcyBh
YmxlIHRvIGRlYWwgd2l0aCBOVUxMIHBvaW50ZXIsIHNvIHRoZSBjaGVjayBpcyBub3QgbmVjZXNz
YXJ5LgoKWWVzLCB0aGUgcmVhc29uIEkgbGVmdCB0aGlzIGNoZWNrIGlzIHRvIG5vdCBwZXJmb3Jt
IGFuIGV4dHJhIG9wZXJhdGlvbiAKKGRldl9pb21tdV9md3NwZWNfc2V0KS4gU2hhbGwgSSBkcm9w
IHRoaXMgY2hlY2sgYW55d2F5PwoKPgo+PiArwqDCoMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHhm
cmVlKGZ3c3BlYyk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfaW9tbXVfZndzcGVjX3NldChkZXYs
IE5VTEwpOwo+PiArwqDCoMKgIH0KPj4gK30KPj4gKwo+PiAraW50IGlvbW11X2Z3c3BlY19hZGRf
aWRzKHN0cnVjdCBkZXZpY2UgKmRldiwgdWludDMyX3QgKmlkcywgaW50IAo+PiBudW1faWRzKQo+
Cj4gV2hpbGUgSSByZWFsaXplIHRoZSBwcm90b3R5cGUgaXMgY29taW5nIGZyb20gTGludXgsIG51
bV9pZHMgY2Fubm90IGJlIAo+IG5lZ2F0aXZlICh0aGUgY29kZSBiZWxvdyB3b3VsZCBub3Qgd29y
ayBwcm9wZXJseSkuIFNvIHRoZSBwYXJhbWV0ZXIgCj4gc2hvdWxkIGJlIHVuc2lnbmVkLgoKQWdy
ZWUsIHdpbGwgdXNlIHVuc2lnbmVkLgoKCj4KPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgaW9tbXVf
ZndzcGVjICpmd3NwZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldChkZXYpOwo+PiArwqDCoMKgIHNp
emVfdCBzaXplOwo+PiArwqDCoMKgIGludCBpOwo+Cj4gQW55IHZhcmlhYmxlIHRoYXQgY2FuJ3Qg
YmUgbmVnYXRpdmUgc2hvdWxkIGJlIHVuc2lnbmVkLgoKWWVzLCB3aWxsIGZvbGxvdy4KCgo+PiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9pb21tdS5oCj4+IGluZGV4IDIwZDg2NWUuLjE4NTNiZDkgMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2lv
bW11LmgKPj4gQEAgLTE0LDYgKzE0LDggQEAKPj4gwqAgI2lmbmRlZiBfX0FSQ0hfQVJNX0lPTU1V
X0hfXwo+PiDCoCAjZGVmaW5lIF9fQVJDSF9BUk1fSU9NTVVfSF9fCj4+IMKgICsjaW5jbHVkZSA8
YXNtL2lvbW11X2Z3c3BlYy5oPgo+Cj4gaW9tbXUuaCBkb2VzIG5vdCBzZWVtIHRvIHVzZSBhbnl0
aGluZyBkZWZpbmVkIGluIGlvbW11X2Z3c3BlYy5oLiBTbyAKPiB3aHkgZG8geW91IGluY2x1ZGUg
aXQgaGVyZT8KCkkgd2FzIHRoaW5raW5nIHRoYXQgZXZlcnkgc291cmNlIHdoaWNoIGluY2x1ZGVz
IGlvbW11Lmggd2lsbCBnZXQgCmlvbW11X2Z3c3BlYy5oIGluY2x1ZGVkIGluZGlyZWN0bHkuIE5v
IG5lZWQgdG8gaW5jbHVkZSBpb21tdV9md3NwZWMuaCBpbiAKbWFueSBzb3VyY2VzLgoKVGhpcyB3
YXMgYSByZWFzb24uIFNoYWxsIEkgaW5jbHVkZWQgaXQgZGlyZWN0bHkgd2hlcmUgbmVlZGVkPwoK
Cj4KPj4gKwo+PiDCoCBzdHJ1Y3QgYXJjaF9pb21tdQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgLyog
UHJpdmF0ZSBpbmZvcm1hdGlvbiBmb3IgdGhlIElPTU1VIGRyaXZlcnMgKi8KPj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXVfZndzcGVjLmggCj4+IGIveGVuL2luY2x1ZGUv
YXNtLWFybS9pb21tdV9md3NwZWMuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAw
MDAwMDAwLi4wNjc2Mjg1Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9pb21tdV9md3NwZWMuaAo+PiBAQCAtMCwwICsxLDY1IEBACj4+ICsvKgo+PiArICogeGVu
L2luY2x1ZGUvYXNtLWFybS9pb21tdV9md3NwZWMuaAo+PiArICoKPj4gKyAqIENvbnRhaW5zIGEg
Y29tbW9uIHN0cnVjdHVyZSB0byBob2xkIHRoZSBwZXItZGV2aWNlIGZpcm13YXJlIGRhdGEgYW5k
Cj4+ICsgKiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbnMgdXNlZCB0byBtYWludGFpbiB0aGF0IGRh
dGEKPj4gKyAqCj4+ICsgKiBCYXNlZCBvbiBMaW51eCdzIGlvbW11X2Z3c3BlYyBzdXBwb3J0IHlv
dSBjYW4gZmluZCBhdDoKPj4gKyAqwqDCoMKgIGluY2x1ZGUvbGludXgvaW9tbXUuaAo+PiArICoK
Pj4gKyAqIENvcHlyaWdodCAoQykgMjAxOSBFUEFNIFN5c3RlbXMgSW5jLgo+PiArICoKPj4gKyAq
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKPj4gKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYwo+PiArICogTGljZW5zZSwgdmVyc2lvbiAyLCBhcyBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KPj4gKyAqCj4+ICsgKiBUaGlz
IHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1
bCwKPj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBs
aWVkIHdhcnJhbnR5IG9mCj4+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuwqAgU2VlIHRoZSBHTlUKPj4gKyAqIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPj4gKyAqCj4+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPj4gKyAqIExpY2Vuc2UgYWxv
bmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIAo+PiA8aHR0cDovL3d3dy5nbnUub3Jn
L2xpY2Vuc2VzLz4uCj4+ICsgKi8KPj4gKwo+PiArI2lmbmRlZiBfX0FSQ0hfQVJNX0lPTU1VX0ZX
U1BFQ19IX18KPj4gKyNkZWZpbmUgX19BUkNIX0FSTV9JT01NVV9GV1NQRUNfSF9fCj4+ICsKPj4g
Ky8qIHBlci1kZXZpY2UgSU9NTVUgaW5zdGFuY2UgZGF0YSAqLwo+PiArc3RydWN0IGlvbW11X2Z3
c3BlYyB7Cj4+ICvCoMKgwqAgLyogZGV2aWNlIHdoaWNoIHJlcHJlc2VudHMgdGhpcyBJT01NVSBI
L1cgKi8KPgo+IERpZCB5b3UgaW50ZW5kIHRvIHNheSAidGhpcyBkZXZpY2UncyBJT01NVSI/CgpF
eGFjdGx5KQoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
