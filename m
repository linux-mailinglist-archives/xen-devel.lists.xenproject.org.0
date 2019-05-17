Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C821AEB
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 17:46:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRezT-00076C-QR; Fri, 17 May 2019 15:41:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E7c9=TR=amazon.de=prvs=033652423=sironi@srs-us1.protection.inumbo.net>)
 id 1hRezS-000767-Km
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 15:41:46 +0000
X-Inumbo-ID: 45ea817b-78ba-11e9-8980-bc764e045a96
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45ea817b-78ba-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1558107704; x=1589643704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=5PwOvUa2QeUYezBMIw7pLuLH7aeDi9x8dxh6Bcuj1T0=;
 b=pkPNEBpTfId2pSiHw35G46whRha12mw7LuOjkWbLFW2QpZWK7Pd+iACu
 O9gxMfRMILX+TNuS8NM+T6gt8jmnEgS3RVQZ97Z/RbsbLBTnGrfhWnprs
 fGsVAVV/HQWJ2e/faBWiCUigmoPh2x/kKqHIgD7t1w41Cx5QIu+r9lcCa c=;
X-IronPort-AV: E=Sophos;i="5.60,480,1549929600"; d="scan'208";a="402579638"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 17 May 2019 15:41:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4HFffwv037521
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 17 May 2019 15:41:42 GMT
Received: from EX13D02EUC004.ant.amazon.com (10.43.164.117) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 May 2019 15:41:41 +0000
Received: from EX13D02EUC001.ant.amazon.com (10.43.164.92) by
 EX13D02EUC004.ant.amazon.com (10.43.164.117) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 May 2019 15:41:40 +0000
Received: from EX13D02EUC001.ant.amazon.com ([10.43.164.92]) by
 EX13D02EUC001.ant.amazon.com ([10.43.164.92]) with mapi id 15.00.1367.000;
 Fri, 17 May 2019 15:41:40 +0000
From: "Sironi, Filippo" <sironi@amazon.de>
To: "Graf, Alexander" <graf@amazon.com>
Thread-Topic: [PATCH v2 1/2] KVM: Start populating /sys/hypervisor with KVM
 entries
Thread-Index: AQHVCmguTMwTmVyYP0+tMrT8Z/dQMaZtx8qAgAGxboA=
Date: Fri, 17 May 2019 15:41:39 +0000
Message-ID: <3D2C4EE3-1C2E-4032-9964-31A066E542AA@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
In-Reply-To: <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.155]
Content-ID: <10D2265497ECB941BB8FCEB5614DF2F7@amazon.com>
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
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMTYuIE1heSAyMDE5LCBhdCAxNTo1MCwgR3JhZiwgQWxleGFuZGVyIDxncmFmQGFtYXpv
bi5jb20+IHdyb3RlOgo+IAo+IE9uIDE0LjA1LjE5IDA4OjE2LCBGaWxpcHBvIFNpcm9uaSB3cm90
ZToKPj4gU3RhcnQgcG9wdWxhdGluZyAvc3lzL2h5cGVydmlzb3Igd2l0aCBLVk0gZW50cmllcyB3
aGVuIHdlJ3JlIHJ1bm5pbmcgb24KPj4gS1ZNLiBUaGlzIGlzIHRvIHJlcGxpY2F0ZSBmdW5jdGlv
bmFsaXR5IHRoYXQncyBhdmFpbGFibGUgd2hlbiB3ZSdyZQo+PiBydW5uaW5nIG9uIFhlbi4KPj4g
Cj4+IFN0YXJ0IHdpdGggL3N5cy9oeXBlcnZpc29yL3V1aWQsIHdoaWNoIHVzZXJzIHByZWZlciBv
dmVyCj4+IC9zeXMvZGV2aWNlcy92aXJ0dWFsL2RtaS9pZC9wcm9kdWN0X3V1aWQgYXMgYSB3YXkg
dG8gcmVjb2duaXplIGEgdmlydHVhbAo+PiBtYWNoaW5lLCBzaW5jZSBpdCdzIGFsc28gYXZhaWxh
YmxlIHdoZW4gcnVubmluZyBvbiBYZW4gSFZNIGFuZCBvbiBYZW4gUFYKPj4gYW5kLCBvbiB0b3Ag
b2YgdGhhdCBkb2Vzbid0IHJlcXVpcmUgcm9vdCBwcml2aWxlZ2VzIGJ5IGRlZmF1bHQuCj4+IExl
dCdzIGNyZWF0ZSBhcmNoLXNwZWNpZmljIGhvb2tzIHNvIHRoYXQgZGlmZmVyZW50IGFyY2hpdGVj
dHVyZXMgY2FuCj4+IHByb3ZpZGUgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucy4KPj4gCj4+IFNp
Z25lZC1vZmYtYnk6IEZpbGlwcG8gU2lyb25pIDxzaXJvbmlAYW1hem9uLmRlPgo+IAo+IEkgdGhp
bmsgdGhpcyBuZWVkcyBzb21ldGhpbmcgYWtpbiB0bwo+IAo+ICBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtaHlwZXJ2aXNvci14ZW4KPiAK
PiB0byBkb2N1bWVudCB3aGljaCBmaWxlcyBhcmUgYXZhaWxhYmxlLgo+IAo+PiAtLS0KPj4gdjI6
Cj4+ICogbW92ZSB0aGUgcmV0cmlldmFsIG9mIHRoZSBWTSBVVUlEIG91dCBvZiB1dWlkX3Nob3cg
YW5kIGludG8KPj4gIGt2bV9wYXJhX2dldF91dWlkLCB3aGljaCBpcyBhIHdlYWsgZnVuY3Rpb24g
dGhhdCBjYW4gYmUgb3ZlcndyaXR0ZW4KPj4gCj4+IGRyaXZlcnMvS2NvbmZpZyAgICAgICAgICAg
ICAgfCAgMiArKwo+PiBkcml2ZXJzL01ha2VmaWxlICAgICAgICAgICAgIHwgIDIgKysKPj4gZHJp
dmVycy9rdm0vS2NvbmZpZyAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4+IGRyaXZlcnMv
a3ZtL01ha2VmaWxlICAgICAgICAgfCAgMSArCj4+IGRyaXZlcnMva3ZtL3N5cy1oeXBlcnZpc29y
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gNSBmaWxlcyBjaGFuZ2Vk
LCA0OSBpbnNlcnRpb25zKCspCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9LY29u
ZmlnCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9NYWtlZmlsZQo+PiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYwo+PiAKPiAKPiBbLi4uXQo+
IAo+PiArCj4+ICtfX3dlYWsgY29uc3QgY2hhciAqa3ZtX3BhcmFfZ2V0X3V1aWQodm9pZCkKPj4g
K3sKPj4gKwlyZXR1cm4gTlVMTDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHNzaXplX3QgdXVpZF9z
aG93KHN0cnVjdCBrb2JqZWN0ICpvYmosCj4+ICsJCQkgc3RydWN0IGtvYmpfYXR0cmlidXRlICph
dHRyLAo+PiArCQkJIGNoYXIgKmJ1ZikKPj4gK3sKPj4gKwljb25zdCBjaGFyICp1dWlkID0ga3Zt
X3BhcmFfZ2V0X3V1aWQoKTsKPj4gKwlyZXR1cm4gc3ByaW50ZihidWYsICIlc1xuIiwgdXVpZCk7
Cj4gCj4gVGhlIHVzdWFsIHJldHVybiB2YWx1ZSBmb3IgdGhlIFhlbiAvc3lzL2h5cGVydmlzb3Ig
aW50ZXJmYWNlIGlzCj4gIjxkZW5pZWQ+Ii4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBmb2xs
b3cgdGhhdCBwYXR0ZXJuIGZvciB0aGUgS1ZNCj4gb25lIHRvbz8gQ3VycmVudGx5LCBpZiB3ZSBj
YW4gbm90IGRldGVybWluZSB0aGUgVVVJRCB0aGlzIHdpbGwganVzdAo+IHJldHVybiAobnVsbCku
Cj4gCj4gT3RoZXJ3aXNlLCBsb29rcyBnb29kIHRvIG1lLiBBcmUgeW91IGF3YXJlIG9mIGFueSBv
dGhlciBmaWxlcyB3ZSBzaG91bGQKPiBwcm92aWRlPyBBbHNvLCBpcyB0aGVyZSBhbnkgcmVhc29u
IG5vdCB0byBpbXBsZW1lbnQgQVJNIGFzIHdlbGwgd2hpbGUgYXQgaXQ/Cj4gCj4gQWxleAoKVGhp
cyBvcmlnaW5hdGVkIGZyb20gYSBjdXN0b21lciByZXF1ZXN0IHRoYXQgd2FzIHVzaW5nIC9zeXMv
aHlwZXJ2aXNvci91dWlkLgpNeSBndWVzcyBpcyB0aGF0IHdlIHdvdWxkIHdhbnQgdG8gZXhwb3Nl
ICJ0eXBlIiBhbmQgInZlcnNpb24iIG1vdmluZwpmb3J3YXJkIGFuZCB0aGF0J3Mgd2hlbiB3ZSBo
eXBlcnZpc29yIGhvb2tzIHdpbGwgYmUgdXNlZnVsIG9uIHRvcApvZiBhcmNoIGhvb2tzLgoKT24g
YSBkaWZmZXJlbnQgbm90ZSwgYW55IGlkZWEgaG93IHRvIGNoZWNrIHdoZXRoZXIgdGhlIE9TIGlz
IHJ1bm5pbmcKdmlydHVhbGl6ZWQgb24gS1ZNIG9uIEFSTSBhbmQgQVJNNjQ/ICBrdm1fcGFyYV9h
dmFpbGFibGUoKSBpc24ndCBhbgpvcHRpb24gYW5kIHRoZSBzYW1lIGlzIHRydWUgZm9yIFMzOTAg
d2hlcmUga3ZtX3BhcmFfYXZhaWxhYmxlKCkKYWx3YXlzIHJldHVybnMgdHJ1ZSBhbmQgaXQgd291
bGQgZXZlbiBpZiBhIEtWTSBlbmFibGVkIGtlcm5lbCB3b3VsZApiZSBydW5uaW5nIG9uIGJhcmUg
bWV0YWwuCgpJIHRoaW5rIHdlIHdpbGwgbmVlZCBhbm90aGVyIGFyY2ggaG9vayB0byBjYWxsIGEg
ZnVuY3Rpb24gdGhhdCBzYXlzCndoZXRoZXIgdGhlIE9TIGlzIHJ1bm5pbmcgdmlydHVhbGl6ZWQg
b24gS1ZNLgoKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSB1dWlk
ID0gX19BVFRSX1JPKHV1aWQpOwo+PiArCj4+ICtzdGF0aWMgaW50IF9faW5pdCB1dWlkX2luaXQo
dm9pZCkKPj4gK3sKPj4gKwlpZiAoIWt2bV9wYXJhX2F2YWlsYWJsZSgpKQo+PiArCQlyZXR1cm4g
MDsKPj4gKwlyZXR1cm4gc3lzZnNfY3JlYXRlX2ZpbGUoaHlwZXJ2aXNvcl9rb2JqLCAmdXVpZC5h
dHRyKTsKPj4gK30KPj4gKwo+PiArZGV2aWNlX2luaXRjYWxsKHV1aWRfaW5pdCk7CgoKCgpBbWF6
b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBC
ZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJp
Y2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFy
bG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
