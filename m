Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331C30B7A
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 11:28:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWdoT-0002QA-8Z; Fri, 31 May 2019 09:27:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j8gS=T7=amazon.com=prvs=0471da2b5=graf@srs-us1.protection.inumbo.net>)
 id 1hWdoR-0002Q0-9X
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:26:59 +0000
X-Inumbo-ID: 3c8a12ec-8386-11e9-8980-bc764e045a96
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c8a12ec-8386-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1559294818; x=1590830818;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MKgsQte0z/+s2YR2gzMjXo/CzMEGKlYzKLUQS4Ze4mM=;
 b=oR478629w6Imwu7hg7ux+JfaSCxih8MJkC0XydJaa7J9MCv9wbQV39Xw
 Ely8naw+v7F+5R10SSnR/e3vZQeqFpXytQR98jMFYEPiHevIda66UFHaC
 9ZS8krb8btZvZPcOo/vm39T4UeCYHp+OW9ooBlXZ+TtxkeVQcH/TYZO7N o=;
X-IronPort-AV: E=Sophos;i="5.60,534,1549929600"; d="scan'208";a="807789661"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 31 May 2019 09:26:56 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2FC14A25F0; Fri, 31 May 2019 09:26:55 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 09:26:54 +0000
Received: from 38f9d3867b82.ant.amazon.com (10.43.161.89) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 09:26:51 +0000
To: "Raslan, KarimAllah" <karahmed@amazon.de>, "Sironi, Filippo"
 <sironi@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
 <3D2C4EE3-1C2E-4032-9964-31A066E542AA@amazon.de>
 <6b3dadf9-6240-6440-b784-50bec605bf2c@amazon.com>
 <1559293922.14762.2.camel@amazon.de>
From: Alexander Graf <graf@amazon.com>
Message-ID: <2d056a1c-1763-127d-b957-0e519a8e56cd@amazon.com>
Date: Fri, 31 May 2019 11:26:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559293922.14762.2.camel@amazon.de>
Content-Language: en-US
X-Originating-IP: [10.43.161.89]
X-ClientProxiedBy: EX13D22UWC002.ant.amazon.com (10.43.162.29) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "Marc.Zyngier@arm.com" <Marc.Zyngier@arm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDMxLjA1LjE5IDExOjEyLCBSYXNsYW4sIEthcmltQWxsYWggd3JvdGU6Cj4gT24gRnJpLCAy
MDE5LTA1LTMxIGF0IDExOjA2ICswMjAwLCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPj4gT24gMTcu
MDUuMTkgMTc6NDEsIFNpcm9uaSwgRmlsaXBwbyB3cm90ZToKPj4+PiBPbiAxNi4gTWF5IDIwMTks
IGF0IDE1OjUwLCBHcmFmLCBBbGV4YW5kZXIgPGdyYWZAYW1hem9uLmNvbT4gd3JvdGU6Cj4+Pj4K
Pj4+PiBPbiAxNC4wNS4xOSAwODoxNiwgRmlsaXBwbyBTaXJvbmkgd3JvdGU6Cj4+Pj4+IFN0YXJ0
IHBvcHVsYXRpbmcgL3N5cy9oeXBlcnZpc29yIHdpdGggS1ZNIGVudHJpZXMgd2hlbiB3ZSdyZSBy
dW5uaW5nIG9uCj4+Pj4+IEtWTS4gVGhpcyBpcyB0byByZXBsaWNhdGUgZnVuY3Rpb25hbGl0eSB0
aGF0J3MgYXZhaWxhYmxlIHdoZW4gd2UncmUKPj4+Pj4gcnVubmluZyBvbiBYZW4uCj4+Pj4+Cj4+
Pj4+IFN0YXJ0IHdpdGggL3N5cy9oeXBlcnZpc29yL3V1aWQsIHdoaWNoIHVzZXJzIHByZWZlciBv
dmVyCj4+Pj4+IC9zeXMvZGV2aWNlcy92aXJ0dWFsL2RtaS9pZC9wcm9kdWN0X3V1aWQgYXMgYSB3
YXkgdG8gcmVjb2duaXplIGEgdmlydHVhbAo+Pj4+PiBtYWNoaW5lLCBzaW5jZSBpdCdzIGFsc28g
YXZhaWxhYmxlIHdoZW4gcnVubmluZyBvbiBYZW4gSFZNIGFuZCBvbiBYZW4gUFYKPj4+Pj4gYW5k
LCBvbiB0b3Agb2YgdGhhdCBkb2Vzbid0IHJlcXVpcmUgcm9vdCBwcml2aWxlZ2VzIGJ5IGRlZmF1
bHQuCj4+Pj4+IExldCdzIGNyZWF0ZSBhcmNoLXNwZWNpZmljIGhvb2tzIHNvIHRoYXQgZGlmZmVy
ZW50IGFyY2hpdGVjdHVyZXMgY2FuCj4+Pj4+IHByb3ZpZGUgZGlmZmVyZW50IGltcGxlbWVudGF0
aW9ucy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkgPHNpcm9uaUBh
bWF6b24uZGU+Cj4+Pj4gSSB0aGluayB0aGlzIG5lZWRzIHNvbWV0aGluZyBha2luIHRvCj4+Pj4K
Pj4+PiAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL0FCSS9zdGFi
bGUvc3lzZnMtaHlwZXJ2aXNvci14ZW4KPj4+Pgo+Pj4+IHRvIGRvY3VtZW50IHdoaWNoIGZpbGVz
IGFyZSBhdmFpbGFibGUuCj4+Pj4KPj4+Pj4gLS0tCj4+Pj4+IHYyOgo+Pj4+PiAqIG1vdmUgdGhl
IHJldHJpZXZhbCBvZiB0aGUgVk0gVVVJRCBvdXQgb2YgdXVpZF9zaG93IGFuZCBpbnRvCj4+Pj4+
ICAgIGt2bV9wYXJhX2dldF91dWlkLCB3aGljaCBpcyBhIHdlYWsgZnVuY3Rpb24gdGhhdCBjYW4g
YmUgb3ZlcndyaXR0ZW4KPj4+Pj4KPj4+Pj4gZHJpdmVycy9LY29uZmlnICAgICAgICAgICAgICB8
ICAyICsrCj4+Pj4+IGRyaXZlcnMvTWFrZWZpbGUgICAgICAgICAgICAgfCAgMiArKwo+Pj4+PiBk
cml2ZXJzL2t2bS9LY29uZmlnICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPj4+Pj4gZHJp
dmVycy9rdm0vTWFrZWZpbGUgICAgICAgICB8ICAxICsKPj4+Pj4gZHJpdmVycy9rdm0vc3lzLWh5
cGVydmlzb3IuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiA1IGZp
bGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMva3ZtL0tjb25maWcKPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMva3ZtL01h
a2VmaWxlCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9zeXMtaHlwZXJ2aXNv
ci5jCj4+Pj4+Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+PiArCj4+Pj4+ICtfX3dlYWsgY29uc3QgY2hh
ciAqa3ZtX3BhcmFfZ2V0X3V1aWQodm9pZCkKPj4+Pj4gK3sKPj4+Pj4gKwlyZXR1cm4gTlVMTDsK
Pj4+Pj4gK30KPj4+Pj4gKwo+Pj4+PiArc3RhdGljIHNzaXplX3QgdXVpZF9zaG93KHN0cnVjdCBr
b2JqZWN0ICpvYmosCj4+Pj4+ICsJCQkgc3RydWN0IGtvYmpfYXR0cmlidXRlICphdHRyLAo+Pj4+
PiArCQkJIGNoYXIgKmJ1ZikKPj4+Pj4gK3sKPj4+Pj4gKwljb25zdCBjaGFyICp1dWlkID0ga3Zt
X3BhcmFfZ2V0X3V1aWQoKTsKPj4+Pj4gKwlyZXR1cm4gc3ByaW50ZihidWYsICIlc1xuIiwgdXVp
ZCk7Cj4+Pj4gVGhlIHVzdWFsIHJldHVybiB2YWx1ZSBmb3IgdGhlIFhlbiAvc3lzL2h5cGVydmlz
b3IgaW50ZXJmYWNlIGlzCj4+Pj4gIjxkZW5pZWQ+Ii4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0
byBmb2xsb3cgdGhhdCBwYXR0ZXJuIGZvciB0aGUgS1ZNCj4+Pj4gb25lIHRvbz8gQ3VycmVudGx5
LCBpZiB3ZSBjYW4gbm90IGRldGVybWluZSB0aGUgVVVJRCB0aGlzIHdpbGwganVzdAo+Pj4+IHJl
dHVybiAobnVsbCkuCj4+Pj4KPj4+PiBPdGhlcndpc2UsIGxvb2tzIGdvb2QgdG8gbWUuIEFyZSB5
b3UgYXdhcmUgb2YgYW55IG90aGVyIGZpbGVzIHdlIHNob3VsZAo+Pj4+IHByb3ZpZGU/IEFsc28s
IGlzIHRoZXJlIGFueSByZWFzb24gbm90IHRvIGltcGxlbWVudCBBUk0gYXMgd2VsbCB3aGlsZSBh
dCBpdD8KPj4+Pgo+Pj4+IEFsZXgKPj4+IFRoaXMgb3JpZ2luYXRlZCBmcm9tIGEgY3VzdG9tZXIg
cmVxdWVzdCB0aGF0IHdhcyB1c2luZyAvc3lzL2h5cGVydmlzb3IvdXVpZC4KPj4+IE15IGd1ZXNz
IGlzIHRoYXQgd2Ugd291bGQgd2FudCB0byBleHBvc2UgInR5cGUiIGFuZCAidmVyc2lvbiIgbW92
aW5nCj4+PiBmb3J3YXJkIGFuZCB0aGF0J3Mgd2hlbiB3ZSBoeXBlcnZpc29yIGhvb2tzIHdpbGwg
YmUgdXNlZnVsIG9uIHRvcAo+Pj4gb2YgYXJjaCBob29rcy4KPj4+Cj4+PiBPbiBhIGRpZmZlcmVu
dCBub3RlLCBhbnkgaWRlYSBob3cgdG8gY2hlY2sgd2hldGhlciB0aGUgT1MgaXMgcnVubmluZwo+
Pj4gdmlydHVhbGl6ZWQgb24gS1ZNIG9uIEFSTSBhbmQgQVJNNjQ/ICBrdm1fcGFyYV9hdmFpbGFi
bGUoKSBpc24ndCBhbgo+Pgo+PiBZZWFoLCBBUk0gZG9lc24ndCBoYXZlIGFueSBLVk0gUFYgRldJ
Vy4gSSBhbHNvIGNhbid0IGZpbmQgYW55IGV4cGxpY2l0Cj4+IGhpbnQgcGFzc2VkIGludG8gZ3Vl
c3RzIHRoYXQgd2UgYXJlIGluZGVlZCBydW5uaW5nIGluIEtWTS4gVGhlIGNsb3Nlc3QKPj4gdGhp
bmcgSSBjYW4gc2VlIGlzIHRoZSBTTUJJT1MgcHJvZHVjdCBpZGVudGlmaWVyIGluIFFFTVUgd2hp
Y2ggZ2V0cwo+PiBwYXRjaGVkIHRvICJLVk0gVmlydHVhbCBNYWNoaW5lIi4gTWF5YmUgd2UnbGwg
aGF2ZSB0byBkbyB3aXRoIHRoYXQgZm9yCj4+IHRoZSBzYWtlIG9mIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5IC4uLgo+IEhvdyBhYm91dCAicHNjaV9vcHMuY29uZHVpdCIgKFBTQ0lfQ09ORFVJVF9I
VkMgdnMgUFNDSV9DT05EVUlUX1NNQyk/CgoKVGhpcyB3b24ndCB3b3JrIGZvciAyIHJlYXNvbnM6
CgogwqAgYSkgWW91IGRvbid0IGtub3cgaXQncyBLVk0uIFlvdSBvbmx5IGtub3cgeW91IG1pZ2h0
IGJlIHJ1bm5pbmcgaW4gRUwxLgogwqAgYikgS1ZNIG1heSBjaG9vc2UgdG8ganVzdCB1c2UgU01D
IGZvciBQU0NJIGdvaW5nIGZvcndhcmQgYW5kIHRyYXAgb24gaXQuCgoKQWxleAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
