Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580661E44C
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 00:10:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQfaz-0004zT-G2; Tue, 14 May 2019 22:08:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=riyJ=TO=amazon.de=prvs=030cd7570=sironi@srs-us1.protection.inumbo.net>)
 id 1hQfay-0004zL-26
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 22:08:24 +0000
X-Inumbo-ID: c93b8b55-7694-11e9-8980-bc764e045a96
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c93b8b55-7694-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 22:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1557871702; x=1589407702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=PRP1xBxuo+1R+ttuKDucVSYxEcz5wPNDFETPGhUhDeg=;
 b=CA3xDJPsstWM6ps97zvPRZeQ2QRrkBTlmlRn1fdqUiKYR4lHz0YtPAVV
 Nqj4wGuyZsNHEd0FjfPIZTPct4RxSDKx797AgBIcrhzRALTG1/KiI4Srf
 xambrC4Nia3nzigqQUkZfc3nBospm+r9Eau6vvyMYDtJniq28doNQE4vJ 8=;
X-IronPort-AV: E=Sophos;i="5.60,470,1549929600"; d="scan'208";a="799668867"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 May 2019 22:08:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4EM8F2O129758
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 14 May 2019 22:08:19 GMT
Received: from EX13D02EUC003.ant.amazon.com (10.43.164.10) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 May 2019 22:08:18 +0000
Received: from EX13D02EUC001.ant.amazon.com (10.43.164.92) by
 EX13D02EUC003.ant.amazon.com (10.43.164.10) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 May 2019 22:08:17 +0000
Received: from EX13D02EUC001.ant.amazon.com ([10.43.164.92]) by
 EX13D02EUC001.ant.amazon.com ([10.43.164.92]) with mapi id 15.00.1367.000;
 Tue, 14 May 2019 22:08:17 +0000
From: "Sironi, Filippo" <sironi@amazon.de>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Thread-Topic: [PATCH v2 1/2] KVM: Start populating /sys/hypervisor with KVM
 entries
Thread-Index: AQHVCmguTMwTmVyYP0+tMrT8Z/dQMaZqvgUAgAAL5ICAAGRWAA==
Date: Tue, 14 May 2019 22:08:16 +0000
Message-ID: <0E82B8C2-5169-4788-B1C0-1668D1F74204@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <d03f6be5-d8dc-4389-e14c-295f36a68827@de.ibm.com>
 <56DAB9BD-2543-49DA-9886-C9C8F2B814F9@amazon.de>
In-Reply-To: <56DAB9BD-2543-49DA-9886-C9C8F2B814F9@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.102]
Content-ID: <D4A90837FC6EEB479DA8881876B210DF@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: KVM list <kvm@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE0LiBNYXkgMjAxOSwgYXQgMTg6MDksIFNpcm9uaSwgRmlsaXBwbyA8c2lyb25pQGFt
YXpvbi5kZT4gd3JvdGU6Cj4gCj4+IE9uIDE0LiBNYXkgMjAxOSwgYXQgMTc6MjYsIENocmlzdGlh
biBCb3JudHJhZWdlciA8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4gd3JvdGU6Cj4+IAo+Pj4gT24g
MTQuMDUuMTkgMTc6MTYsIEZpbGlwcG8gU2lyb25pIHdyb3RlOgo+Pj4gU3RhcnQgcG9wdWxhdGlu
ZyAvc3lzL2h5cGVydmlzb3Igd2l0aCBLVk0gZW50cmllcyB3aGVuIHdlJ3JlIHJ1bm5pbmcgb24K
Pj4+IEtWTS4gVGhpcyBpcyB0byByZXBsaWNhdGUgZnVuY3Rpb25hbGl0eSB0aGF0J3MgYXZhaWxh
YmxlIHdoZW4gd2UncmUKPj4+IHJ1bm5pbmcgb24gWGVuLgo+Pj4gCj4+PiBTdGFydCB3aXRoIC9z
eXMvaHlwZXJ2aXNvci91dWlkLCB3aGljaCB1c2VycyBwcmVmZXIgb3Zlcgo+Pj4gL3N5cy9kZXZp
Y2VzL3ZpcnR1YWwvZG1pL2lkL3Byb2R1Y3RfdXVpZCBhcyBhIHdheSB0byByZWNvZ25pemUgYSB2
aXJ0dWFsCj4+PiBtYWNoaW5lLCBzaW5jZSBpdCdzIGFsc28gYXZhaWxhYmxlIHdoZW4gcnVubmlu
ZyBvbiBYZW4gSFZNIGFuZCBvbiBYZW4gUFYKPj4+IGFuZCwgb24gdG9wIG9mIHRoYXQgZG9lc24n
dCByZXF1aXJlIHJvb3QgcHJpdmlsZWdlcyBieSBkZWZhdWx0Lgo+Pj4gTGV0J3MgY3JlYXRlIGFy
Y2gtc3BlY2lmaWMgaG9va3Mgc28gdGhhdCBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyBjYW4KPj4+
IHByb3ZpZGUgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucy4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1i
eTogRmlsaXBwbyBTaXJvbmkgPHNpcm9uaUBhbWF6b24uZGU+Cj4+PiAtLS0KPj4+IHYyOgo+Pj4g
KiBtb3ZlIHRoZSByZXRyaWV2YWwgb2YgdGhlIFZNIFVVSUQgb3V0IG9mIHV1aWRfc2hvdyBhbmQg
aW50bwo+Pj4ga3ZtX3BhcmFfZ2V0X3V1aWQsIHdoaWNoIGlzIGEgd2VhayBmdW5jdGlvbiB0aGF0
IGNhbiBiZSBvdmVyd3JpdHRlbgo+Pj4gCj4+PiBkcml2ZXJzL0tjb25maWcgICAgICAgICAgICAg
IHwgIDIgKysKPj4+IGRyaXZlcnMvTWFrZWZpbGUgICAgICAgICAgICAgfCAgMiArKwo+Pj4gZHJp
dmVycy9rdm0vS2NvbmZpZyAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4+PiBkcml2ZXJz
L2t2bS9NYWtlZmlsZSAgICAgICAgIHwgIDEgKwo+Pj4gZHJpdmVycy9rdm0vc3lzLWh5cGVydmlz
b3IuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gNSBmaWxlcyBjaGFu
Z2VkLCA0OSBpbnNlcnRpb25zKCspCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9rdm0v
S2NvbmZpZwo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMva3ZtL01ha2VmaWxlCj4+PiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYwo+Pj4gCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9LY29uZmlnIGIvZHJpdmVycy9LY29uZmlnCj4+PiBpbmRleCA0
NWY5ZGVjYjk4NDguLjkwZWI4MzVmZTk1MSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvS2NvbmZp
Zwo+Pj4gKysrIGIvZHJpdmVycy9LY29uZmlnCj4+PiBAQCAtMTQ2LDYgKzE0Niw4IEBAIHNvdXJj
ZSAiZHJpdmVycy9odi9LY29uZmlnIgo+Pj4gCj4+PiBzb3VyY2UgImRyaXZlcnMveGVuL0tjb25m
aWciCj4+PiAKPj4+ICtzb3VyY2UgImRyaXZlcnMva3ZtL0tjb25maWciCj4+PiArCj4+PiBzb3Vy
Y2UgImRyaXZlcnMvc3RhZ2luZy9LY29uZmlnIgo+Pj4gCj4+PiBzb3VyY2UgImRyaXZlcnMvcGxh
dGZvcm0vS2NvbmZpZyIKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL01ha2VmaWxlIGIvZHJpdmVy
cy9NYWtlZmlsZQo+Pj4gaW5kZXggYzYxY2RlNTU0MzQwLi43OWNjOTJhM2Y2YmYgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL01ha2VmaWxlCj4+PiArKysgYi9kcml2ZXJzL01ha2VmaWxlCj4+PiBA
QCAtNDQsNiArNDQsOCBAQCBvYmoteQkJCQkrPSBzb2MvCj4+PiBvYmotJChDT05GSUdfVklSVElP
KQkJKz0gdmlydGlvLwo+Pj4gb2JqLSQoQ09ORklHX1hFTikJCSs9IHhlbi8KPj4+IAo+Pj4gK29i
ai0kKENPTkZJR19LVk1fR1VFU1QpCQkrPSBrdm0vCj4+PiArCj4+PiAjIHJlZ3VsYXRvcnMgZWFy
bHksIHNpbmNlIHNvbWUgc3Vic3lzdGVtcyByZWx5IG9uIHRoZW0gdG8gaW5pdGlhbGl6ZQo+Pj4g
b2JqLSQoQ09ORklHX1JFR1VMQVRPUikJCSs9IHJlZ3VsYXRvci8KPj4+IAo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMva3ZtL0tjb25maWcgYi9kcml2ZXJzL2t2bS9LY29uZmlnCj4+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zZmMwNDFkZjdjMTEKPj4+IC0t
LSAvZGV2L251bGwKPj4+ICsrKyBiL2RyaXZlcnMva3ZtL0tjb25maWcKPj4+IEBAIC0wLDAgKzEs
MTQgQEAKPj4+ICttZW51ICJLVk0gZHJpdmVyIHN1cHBvcnQiCj4+PiArICAgICAgICBkZXBlbmRz
IG9uIEtWTV9HVUVTVAo+Pj4gKwo+Pj4gK2NvbmZpZyBLVk1fU1lTX0hZUEVSVklTT1IKPj4+ICsg
ICAgICAgIGJvb2wgIkNyZWF0ZSBLVk0gZW50cmllcyB1bmRlciAvc3lzL2h5cGVydmlzb3IiCj4+
PiArICAgICAgICBkZXBlbmRzIG9uIFNZU0ZTCj4+PiArICAgICAgICBzZWxlY3QgU1lTX0hZUEVS
VklTT1IKPj4+ICsgICAgICAgIGRlZmF1bHQgeQo+Pj4gKyAgICAgICAgaGVscAo+Pj4gKyAgICAg
ICAgICBDcmVhdGUgS1ZNIGVudHJpZXMgdW5kZXIgL3N5cy9oeXBlcnZpc29yIChlLmcuLCB1dWlk
KS4gV2hlbiBydW5uaW5nCj4+PiArICAgICAgICAgIG5hdGl2ZSBvciBvbiBhbm90aGVyIGh5cGVy
dmlzb3IsIC9zeXMvaHlwZXJ2aXNvciBtYXkgc3RpbGwgYmUKPj4+ICsgICAgICAgICAgcHJlc2Vu
dCwgYnV0IGl0IHdpbGwgaGF2ZSBubyBLVk0gZW50cmllcy4KPj4+ICsKPj4+ICtlbmRtZW51Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9rdm0vTWFrZWZpbGUgYi9kcml2ZXJzL2t2bS9NYWtlZmls
ZQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzNhNDNm
Yzk5NGI5Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9kcml2ZXJzL2t2bS9NYWtlZmlsZQo+
Pj4gQEAgLTAsMCArMSBAQAo+Pj4gK29iai0kKENPTkZJR19LVk1fU1lTX0hZUEVSVklTT1IpICs9
IHN5cy1oeXBlcnZpc29yLm8KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2t2bS9zeXMtaHlwZXJ2
aXNvci5jIGIvZHJpdmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYwo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDNiMWQxYTA5ODA3Cj4+PiAtLS0gL2Rldi9u
dWxsCj4+PiArKysgYi9kcml2ZXJzL2t2bS9zeXMtaHlwZXJ2aXNvci5jCj4+PiBAQCAtMCwwICsx
LDMwIEBACj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4+ICsK
Pj4+ICsjaW5jbHVkZSA8YXNtL2t2bV9wYXJhLmg+Cj4+PiArCj4+PiArI2luY2x1ZGUgPGxpbnV4
L2tvYmplY3QuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvc3lzZnMuaD4KPj4+ICsKPj4+ICtfX3dl
YWsgY29uc3QgY2hhciAqa3ZtX3BhcmFfZ2V0X3V1aWQodm9pZCkKPj4+ICt7Cj4+PiArCXJldHVy
biBOVUxMOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgc3NpemVfdCB1dWlkX3Nob3coc3RydWN0
IGtvYmplY3QgKm9iaiwKPj4+ICsJCQkgc3RydWN0IGtvYmpfYXR0cmlidXRlICphdHRyLAo+Pj4g
KwkJCSBjaGFyICpidWYpCj4+PiArewo+Pj4gKwljb25zdCBjaGFyICp1dWlkID0ga3ZtX3BhcmFf
Z2V0X3V1aWQoKTsKPj4gCj4+IEkgd291bGQgcHJlZmVyIHRvIGhhdmUga3ZtX3BhcmFfZ2V0X3V1
aWQgcmV0dXJuIGEgdXVpZF90Cj4+IGJ1dCBjaGFyICogd2lsbCBwcm9iYWJseSB3b3JrIG91dCBh
cyB3ZWxsLgo+IAo+IExldCBtZSBnaXZlIHRoaXMgYSBxdWljayBzcGluLgoKSSBsb29rZWQgaW50
byBnZXR0aW5nIGEgdXVpZF90LgoKQXQgbGVhc3QgZm9yIGFyY2hpdGVjdHVyZXMgd2hlcmUgd2Ug
cmV0cmlldmUgdGhhdCBiaXQgb2YKaW5mb3JtYXRpb24gZnJvbSBETUkgdGFibGVzLCB0aGlzIGlz
IHVuZGVzaXJhYmxlIHNpbmNlCnRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGUgVVVJRCBjaGFuZ2Vk
IHdpdGggRE1JIDIuNgoodGhlIGZpcnN0IDMgZmllbGRzIGFyZSBub3cgZW5jb2RlZCBpbiBsaXR0
bGUtZW5kaWFuKS4KVGhpcyBtZWFucyB0aGF0IHdlIHdvdWxkbid0IGtub3cgaG93IHRvIHByaW50
IGl0IGluIHRoaXMKZ2VuZXJpYyBjb2RlLgoKSSB0aGluayB0aGF0IGl0J3MgYmVzdCBpZiB0aGUg
YXJjaGl0ZWN0dXJlIHNwZWNpZmljIGNvZGUKdHVybnMgdGhlIFVVSUQgaW50byB0aGUgc3RyaW5n
IHJlcHJlc2VudGF0aW9uLgoKPj4+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJXNcbiIsIHV1aWQp
Owo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgc3RydWN0IGtvYmpfYXR0cmlidXRlIHV1aWQgPSBf
X0FUVFJfUk8odXVpZCk7Cj4+PiArCj4+PiArc3RhdGljIGludCBfX2luaXQgdXVpZF9pbml0KHZv
aWQpCj4+PiArewo+Pj4gKwlpZiAoIWt2bV9wYXJhX2F2YWlsYWJsZSgpKQo+PiAKPj4gSXNudCBr
dm1fcGFyYV9hdmFpbGFibGUgYSBmdW5jdGlvbiB0aGF0IGlzIGRlZmluZWQgaW4gdGhlIGNvbnRl
eHQgb2YgdGhlIEhPU1QKPj4gYW5kIG5vdCBvZiB0aGUgZ3Vlc3Q/Cj4gCj4gTm8sIGt2bV9wYXJh
X2F2YWlsYWJsZSBpcyBkZWZpbmVkIGluIHRoZSBndWVzdCBjb250ZXh0Lgo+IE9uIHg4NiwgaXQg
Y2hlY2tzIGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlIEtWTSBDUFVJRCBsZWFmcy4KPiAKPj4+ICsJ
CXJldHVybiAwOwo+Pj4gKwlyZXR1cm4gc3lzZnNfY3JlYXRlX2ZpbGUoaHlwZXJ2aXNvcl9rb2Jq
LCAmdXVpZC5hdHRyKTsKPj4+ICt9Cj4+PiArCj4+PiArZGV2aWNlX2luaXRjYWxsKHV1aWRfaW5p
dCk7CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3Ry
LiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIs
IFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRz
Z2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
