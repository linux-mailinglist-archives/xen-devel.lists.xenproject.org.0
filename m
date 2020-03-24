Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B877619133A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 15:31:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGkXL-0008Af-DH; Tue, 24 Mar 2020 14:28:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWCa=5J=amazon.co.uk=prvs=345581a90=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jGkXK-0008Aa-M0
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 14:28:10 +0000
X-Inumbo-ID: af681070-6ddb-11ea-841e-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af681070-6ddb-11ea-841e-12813bfff9fa;
 Tue, 24 Mar 2020 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1585060090; x=1616596090;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=J6WB7u45gC0IRS2XMxSwzfqxCirhISmZPi5TplWjz/U=;
 b=LrS8EPJkZ5jJGw47cw1XL8Gq7kBO0QbIEZq8YuJU3Ik63C0fWE6t3FL7
 U6SS3gmzKoiaTNY9L/LcbVsubsxSlpCmzQDVZronUw2TAea074FusG1zO
 NH0gyTDfTaPhGvGapNMYrXbXDNP0Sm7R2whHJUTTIfyTJw+vJpRLdI93Z A=;
IronPort-SDR: cy5T3Ize7B5iZWrK3uyIiyMc53d/yKQEYpcMi+cBXPJvmnOc1i/DUQEBMfrzaf7bzXsjzhKIBX
 hyiPNRQCrV0Q==
X-IronPort-AV: E=Sophos;i="5.72,300,1580774400"; d="scan'208";a="24794106"
Thread-Topic: [PATCH v6 5/5] domain: use PGC_extra domheap page for shared_info
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 24 Mar 2020 14:28:08 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com (Postfix) with ESMTPS
 id 07133A2786; Tue, 24 Mar 2020 14:28:06 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 24 Mar 2020 14:28:06 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 24 Mar 2020 14:28:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 24 Mar 2020 14:28:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "paul@xen.org" <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQHWAefNkz0pzx/YO02nstJylfW4r6hXzF7w
Date: Tue, 24 Mar 2020 14:28:05 +0000
Message-ID: <5d37f2834d384188a37dd7b98b4b7a22@EX13D32EUC003.ant.amazon.com>
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-6-paul@xen.org>
 <65cb0423-09c3-209a-85dc-63b07085d7ac@xen.org>
In-Reply-To: <65cb0423-09c3-209a-85dc-63b07085d7ac@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.198]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 5/5] domain: use PGC_extra domheap page
 for shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4gQ3VycmVudGx5IHNoYXJl
ZF9pbmZvIGlzIGEgc2hhcmVkIHhlbmhlYXAgcGFnZSBidXQgc2hhcmVkIHhlbmhlYXAgcGFnZXMN
Cj4gPiBjb21wbGljYXRlIGZ1dHVyZSBwbGFucyBmb3IgbGl2ZS11cGRhdGUgb2YgWGVuIHNvIGl0
IGlzIGRlc2lyYWJsZSB0bywNCj4gPiB3aGVyZSBwb3NzaWJsZSwgbm90IHVzZSB0aGVtIFsxXS4g
VGhpcyBwYXRjaCB0aGVyZWZvcmUgY29udmVydHMgc2hhcmVkX2luZm8NCj4gPiBpbnRvIGEgUEdD
X2V4dHJhIGRvbWhlYXAgcGFnZS4gVGhpcyBkb2VzIGVudGFpbCBmcmVlaW5nIHNoYXJlZF9pbmZv
IGR1cmluZw0KPiA+IGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIHJhdGhlciB0aGFuIGRv
bWFpbl9kZXN0cm95KCkgc28gY2FyZSBpcw0KPiA+IG5lZWRlZCB0byBhdm9pZCBkZS1yZWZlcmVu
Y2luZyBhIE5VTEwgc2hhcmVkX2luZm8gcG9pbnRlciBoZW5jZSBzb21lDQo+ID4gZXh0cmEgY2hl
Y2tzIG9mICdpc19keWluZycgYXJlIG5lZWRlZC4NCj4gPg0KPiA+IE5PVEU6IEZvciBBcm0sIHRo
ZSBjYWxsIHRvIGZyZWVfc2hhcmVkX2luZm8oKSBpbiBhcmNoX2RvbWFpbl9kZXN0cm95KCkgaXMN
Cj4gPiAgICAgICAgbGVmdCBpbiBwbGFjZSBzaW5jZSBpdCBpcyBpZGVtcG90ZW50IGFuZCBjYWxs
ZWQgaW4gdGhlIGVycm9yIHBhdGggZm9yDQo+ID4gICAgICAgIGFyY2hfZG9tYWluX2NyZWF0ZSgp
Lg0KPiANCj4gVGhlIGFwcHJvYWNoIGxvb2tzIGdvb2QgdG8gbWUuIEkgaGF2ZSBvbmUgY29tbWVu
dCBiZWxvdy4NCj4gDQoNClRoYW5rcy4NCg0KPiBbLi4uXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPiBpbmRleCA0ZWYw
ZDNiMjFlLi40ZjMyNjY0NTRmIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMN
Cj4gPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4gQEAgLTE2NTEsMjQgKzE2NTEsNDQg
QEAgaW50IGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoDQo+ID4NCj4gPiAgIGludCBhbGxvY19z
aGFyZWRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpDQo+ID4g
ICB7DQo+ID4gLSAgICBpZiAoIChkLT5zaGFyZWRfaW5mby52aXJ0ID0gYWxsb2NfeGVuaGVhcF9w
YWdlcygwLCBtZW1mbGFncykpID09IE5VTEwgKQ0KPiA+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAq
cGc7DQo+ID4gKw0KPiA+ICsgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19y
ZWZjb3VudCB8IG1lbWZsYWdzKTsNCj4gPiArICAgIGlmICggIXBnICkNCj4gPiAgICAgICAgICAg
cmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAtICAgIGQtPnNoYXJlZF9pbmZvLm1mbiA9IHZpcnRf
dG9fbWZuKGQtPnNoYXJlZF9pbmZvLnZpcnQpOw0KPiA+ICsgICAgaWYgKCAhZ2V0X3BhZ2VfYW5k
X3R5cGUocGcsIGQsIFBHVF93cml0YWJsZV9wYWdlKSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAg
ICAgLyoNCj4gPiArICAgICAgICAgKiBUaGUgZG9tYWluIHNob3VsZCBub3QgYmUgcnVubmluZyBh
dCB0aGlzIHBvaW50IHNvIHRoZXJlIGlzDQo+ID4gKyAgICAgICAgICogbm8gd2F5IHdlIHNob3Vs
ZCByZWFjaCB0aGlzIGVycm9yIHBhdGguDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAgICAg
QVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FTk9EQVRBOw0KPiA+
ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGQtPnNoYXJlZF9pbmZvLm1mbiA9IHBhZ2VfdG9fbWZu
KHBnKTsNCj4gPiArICAgIGQtPnNoYXJlZF9pbmZvLnZpcnQgPSBfX21hcF9kb21haW5fcGFnZV9n
bG9iYWwocGcpOw0KPiANCj4gX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKCkgaXMgbm90IGd1YXJh
bnRlZWQgdG8gc3VjY2VlZC4gRm9yIGluc3RhbmNlLA0KPiBvbiBBcm0zMiB0aGlzIHdpbGwgYmUg
YSBjYWxsIHRvIHZtYXAoKS4NCj4gDQo+IFNvIHlvdSB3YW50IHRvIGNoZWNrIHRoZSByZXR1cm4u
DQo+IA0KDQpPaywgSSdsbCBhZGQgYSBjaGVjay4NCg0KQXMgSmFuIGRpc2NvdmVyZWQsIEkgbWVz
c2VkIHVwIHRoZSB2ZXJzaW9uIG51bWJlcmluZyBzbyB0aGVyZSBpcyBhbHJlYWR5IGEgdjcgc2Vy
aWVzIHdoZXJlIEkgZHJvcHBlZCB0aGlzIHBhdGNoICh1bnRpbCBJIGNhbiBncm91cCBpdCB3aXRo
IGNvbnZlcnNpb24gb2Ygb3RoZXIgc2hhcmVkIHhlbmhlYXAgcGFnZXMpLg0KDQogIFBhdWwNCg0K
PiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

