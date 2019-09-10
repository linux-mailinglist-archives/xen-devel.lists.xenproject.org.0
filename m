Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33408AF155
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 20:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7lIy-0004xK-1O; Tue, 10 Sep 2019 18:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7lIx-0004xF-2i
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 18:55:55 +0000
X-Inumbo-ID: 9c89d96c-d3fc-11e9-ac21-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9c89d96c-d3fc-11e9-ac21-12813bfff9fa;
 Tue, 10 Sep 2019 18:55:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A90828;
 Tue, 10 Sep 2019 11:55:52 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BD6B3F59C;
 Tue, 10 Sep 2019 11:55:50 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1566588892-5305-1-git-send-email-olekstysh@gmail.com>
 <d844f8b1-380d-0aed-785c-d889050b62c5@arm.com>
 <e7520ee5-2a31-d129-d736-7ce56589cb3e@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cec380f6-daf6-242f-3b57-2b08b3140248@arm.com>
Date: Tue, 10 Sep 2019 19:55:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e7520ee5-2a31-d129-d736-7ce56589cb3e@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] [RFC V2] xen/arm: Restrict "p2m_ipa_bits"
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

SGksCgpPbiA5LzEwLzE5IDU6MjQgUE0sIE9sZWtzYW5kciB3cm90ZToKPiAKPiBPbiAxMC4wOS4x
OSAxODoxMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBPbGVrc2FuZHIsCj4gCj4gSGksIEp1
bGllbgo+IAo+IAo+Pgo+PiBPbiA4LzIzLzE5IDg6MzQgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOgo+Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+Pj4KPj4+IFRoZXJlIGlzIGEgc3RyaWN0IHJlcXVpcmVtZW50IGZvciB0
aGUgSU9NTVUgd2hpY2ggd2FudHMgdG8gc2hhcmUKPj4+IHRoZSBQMk0gdGFibGUgd2l0aCB0aGUg
Q1BVLiBUaGUgSU9NTVUncyBTdGFnZS0yIGlucHV0IHNpemUgbXVzdCBiZSBlcXVhbAo+Pj4gdG8g
dGhlIFAyTSBJUEEgc2l6ZS4gSXQgaXMgbm90IGEgcHJvYmxlbSB3aGVuIHRoZSBJT01NVSBjYW4g
c3VwcG9ydAo+Pj4gYWxsIHZhbHVlcyB0aGUgQ1BVIHN1cHBvcnRzLiBJbiB0aGF0IGNhc2UsIHRo
ZSBJT01NVSBkcml2ZXIgd291bGQganVzdAo+Pj4gdXNlIGFueSAicDJtX2lwYV9iaXRzIiB2YWx1
ZSBhcyBpcy4gQnV0LCB0aGVyZSBhcmUgY2FzZXMgd2hlbiBub3QuCj4+Pgo+Pj4gSW4gb3JkZXIg
dG8gbWFrZSBQMk0gc2hhcmluZyBwb3NzaWJsZSBvbiB0aGUgcGxhdGZvcm1zIHdoaWNoCj4+PiBJ
UE1NVXMgaGF2ZSBhIGxpbWl0YXRpb24gaW4gbWF4aW11bSBTdGFnZS0yIGlucHV0IHNpemUgaW50
cm9kdWNlCj4+PiB0aGUgZm9sbG93aW5nIGxvZ2ljLgo+Pj4KPj4+IEZpcnN0IGluaXRpYWxpemUg
dGhlIElPTU1VIHN1YnN5c3RlbSBhbmQgZ2F0aGVyIHJlcXVpcmVtZW50cyByZWdhcmRpbmcKPj4+
IHRoZSBtYXhpbXVtIElQQSBiaXRzIHN1cHBvcnRlZCBieSBlYWNoIElPTU1VIGRldmljZSB0byBm
aWd1cmUgb3V0Cj4+PiB0aGUgbWluaW11bSB2YWx1ZSBhbW9uZyB0aGVtLiBJbiB0aGUgUDJNIGNv
ZGUsIHRha2UgaW50byB0aGUgYWNjb3VudAo+Pj4gdGhlIElPTU1VIHJlcXVpcmVtZW50cyBhbmQg
Y2hvb3NlIHN1aXRhYmxlICJwYV9yYW5nZSIgYWNjb3JkaW5nCj4+PiB0byB0aGUgcmVzdHJpY3Rl
ZCAicDJtX2lwYV9iaXRzIi4KPj4KPj4gQXMgSSBwb2ludGVkIGluIHRoZSBwcmV2aW91cyB2ZXJz
aW9uLCBhbGwgdGhlIGNvZGUgeW91IG1vZGlmeSBpcyBhcm02NCAKPj4gc3BlY2lmaWMuIEZvciBh
cm0zMiwgdGhlIG51bWJlciBvZiBJUEEgYml0cyBpcwo+PiBoYXJkY29kZWQuIFNvIGlmIHlvdSBt
b2RpZnkgcDJtX2lwYV9iaXRzLCB5b3Ugd291bGQgZW5kIHVwIHRvIAo+PiBtaXNjb25maWd1cmUg
VlRDUi4KPj4gSW4gb3RoZXIgd29yZHMsIGZvciBBcm0zMiwgeW91IG5lZWQgdG8gY2hlY2sgcDJt
X2lwYV9iaXRzIGlzIGF0IGxlYXN0IAo+PiA0MC1iaXRzIGJlZm9yZSBvdmVycmlkaW5nIGl0Lgo+
IAo+IEJ1dCwgYWxsIG1vZGlmaWNhdGlvbnMgd2l0aCBwMm1faXBhX2JpdHMgYXJlIGRvbmUgYmVm
b3JlIAo+IHNldHVwX3ZpcnRfcGFnaW5nKCksIHdoZXJlLCBhY3R1YWxseSwgdGhlIHAybV9pcGFf
Yml0cyBpcyBoYXJkLWNvZGVkIHRvIAo+IDQwIGJpdHMuIEhvdyBjYW4gd2UgZW5kIHVwIG1pc2Nv
bmZpZ3VyaW5nIFZUQ1IgZm9yIEFSTTMyPyBPciBJIHJlYWxseSAKPiBtaXNzZWQgc29tZXRoaW5n
PwoKU29ycnkgaWYgSSB3YXNuJ3QgY2xlYXJlZCwgSSBtZWFudCB0aGUgVlRDUiBmb3IgdGhlIElP
TU1VLiBZb3Ugd291bGQgZW5kIAp1cCB0byBjb25maWd1cmUgd2l0aCBhIHZhbHVlIHRoYXQgaXMg
YmlnZ2VyIHRoYW4gd2hhdCBpdCBjYW4gc3VwcG9ydC4KCkkgYW0gb2sgaWYgeW91IGRvbid0IHJl
c3RyaWN0IHRoZSBwMm1faXBhX2JpdHMgYW5kIGp1c3QgZmFpbC4gVGhlIHBvaW50IAppcyB0byBu
b3RpZnkgdGhlIHVzZXIgQVNBUCByYXRoZXIgdGhhbiBhbGxvd2luZyB0byBjb250aW51ZS4KClRo
aXMgd291bGQgbWFrZSB0aGUgYmVoYXZpb3Igc2ltaWxhciB0byB0aGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbiAKKGFsdGhvdWdoIHRoZSBlcnJvciB3b3VsZCBiZSBkaWZmZXJlbnQpLgoKWy4uLl0K
Cj4+PiArewo+Pj4gK8KgwqDCoCAvKgo+Pj4gK8KgwqDCoMKgICogQ2FsY3VsYXRlIHRoZSBtaW5p
bXVtIG9mIHRoZSBtYXhpbXVtIElQQSBiaXRzIHRoYXQgYW55IElPTU1VCj4+PiArwqDCoMKgwqAg
KiBjYW4gc3VwcG9ydC4KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCBpZiAoIGlvbW11X2lw
YV9iaXRzIDwgcDJtX2lwYV9iaXRzICkKPj4+ICvCoMKgwqDCoMKgwqDCoCBwMm1faXBhX2JpdHMg
PSBpb21tdV9pcGFfYml0czsKPj4+ICt9Cj4+PiArCj4+PiDCoCAvKiBWVENSIHZhbHVlIHRvIGJl
IGNvbmZpZ3VyZWQgYnkgYWxsIENQVXMuIFNldCBvbmx5IG9uY2UgYnkgdGhlIAo+Pj4gYm9vdCBD
UFUgKi8KPj4+IMKgIHN0YXRpYyB1aW50MzJfdCBfX3JlYWRfbW9zdGx5IHZ0Y3I7Cj4+PiDCoCBA
QCAtMTk2NiwxMCArMTk3NywyOCBAQCB2b2lkIF9faW5pdCBzZXR1cF92aXJ0X3BhZ2luZyh2b2lk
KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIFs3XSA9IHsgMCB9wqAgLyogSW52YWxpZCAqLwo+Pj4g
wqDCoMKgwqDCoCB9Owo+Pj4gwqAgLcKgwqDCoCB1bnNpZ25lZCBpbnQgY3B1Owo+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBpbnQgaSwgY3B1Owo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgcGFfcmFu
Z2UgPSAweDEwOyAvKiBMYXJnZXIgdGhhbiBhbnkgcG9zc2libGUgdmFsdWUgKi8KPj4+IMKgwqDC
oMKgwqAgYm9vbCB2bWlkXzhfYml0ID0gZmFsc2U7Cj4+PiDCoCArwqDCoMKgIGlmICggaW9tbXVf
ZW5hYmxlZCApCj4+Cj4+IENvdWxkIHdlIG1ha2UgdGhpcyBJT01NVS1hZ25vc3RpYz8gVGhlIG1h
aW4gcmVhc29uIHRvIGNvbnZlcnQgZnJvbSAKPj4gcDJtX2lwYV9iaXRzIHRvIHBhX3JhbmdlIGlz
IHRvIGNhdGVyIHRoZSByZXN0IG9mIHRoZSBjb2RlLgo+Pgo+PiBCdXQgd2UgY291bGQgcmV3b3Jr
IHRoZSBjb2RlIHRvIGRvIHRoZSBjb21wdXRhdGlvbiB3aXRoIHAybV9pcGFfYml0cyAKPj4gYW5k
IHRoZW4gbG9vay11cCBmb3IgdGhlIHBhX3JhbmdlLiAKPiAKPiBJIGFtIGFmcmFpZCwgSSBkb24n
dCBjb21wbGV0ZWx5IHVuZGVyc3RhbmQgeW91ciBpZGVhIG9mIG1ha2luZyB0aGlzIAo+IElPTU1V
LWFnbm9zdGljIGFuZCB3aGF0IEkgc2hvdWxkIGRvLi4uCgpSb3VnaGx5IHdoYXQgeW91IGFyZSBk
b2luZyB0b2RheSBpczoKCmlmICggaW9tbXVfZW5hYmxlZCApCiAgICBwYV9yYW5nZSA9IGZpbmRf
cGFfcmFuZ2VfZnJvbV9wMm1fYml0cygpLgoKZm9yX2VhY2hfY3B1KCkKICAgIGlmICggY3B1LnBh
X3JhbmdlIDwgcGFfcmFuZ2UgKQogICAgICBwYV9yYW5nZSA9IGNwdS5wYV9yYW5nZQoKLi4uLgoK
V2hhdCB5b3UgY291bGQgZG8gaXM6Cgpmb3JfZWNoX2NwdSgpCiAgICBpZiAoIHAybV9pcGFfYml0
cyA8IHBhX3JhbmdlX2luZm9bY3B1LnBhX3JhbmdlXS5wYWJpdHMgKQogICAgICBwMm1faXBhX2Jp
dHMgPSBwYV9yYW5nZV9pbmZvW2NwdS5wYV9yYW5nZV0ucGFiaXRzOwoKcGFfcmFuZ2UgPSBmaW5k
X3BhX3JhbmdlX2Zyb21fcDJtX2JpdHMoKTsKLyogQ2hlY2sgdmFsaWRpdHkgKi8KLi4uCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
