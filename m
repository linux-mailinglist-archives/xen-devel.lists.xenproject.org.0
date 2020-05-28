Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE01E5C5D
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 11:48:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeF9J-0005pd-BX; Thu, 28 May 2020 09:48:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSBr=7K=amazon.co.uk=prvs=410b74a99=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jeF9H-0005pY-Dv
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:48:27 +0000
X-Inumbo-ID: 6072bfb8-a0c8-11ea-a7ac-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6072bfb8-a0c8-11ea-a7ac-12813bfff9fa;
 Thu, 28 May 2020 09:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1590659307; x=1622195307;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=o0UFG3pl7XEkMkP8r44DQuMwfgbM2785FkdZEEJOPWE=;
 b=Ao9qGbONXFRsSkmMHLZ7JdhqAbzoAqidd9Sq3FRulwxhwpfIePdkWrsV
 WH0xZp4gpaSaCVmnZrrDP+wjdUqRMBcMT+qQS1mIAyteqgatVI8OvDn/f
 2etyXaqx5a4FdZ6cNNXa+X+nUTD1EZFJRYBZCgPS4PEXReRz9rC/YpygF I=;
IronPort-SDR: iRib3XpA0i/UkuiWYnulzSgMRNeTU2AxONsVGfpOUd7uEDvuHZBBReGV9nXwEcKH3xcEl3Dg5c
 69T3l7IvCVYA==
X-IronPort-AV: E=Sophos;i="5.73,444,1583193600"; d="scan'208";a="46801652"
Subject: RE: [PATCH v6 4/5] common/domain: add a domain context record for
 shared_info...
Thread-Topic: [PATCH v6 4/5] common/domain: add a domain context record for
 shared_info...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 28 May 2020 09:48:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 670C4A26D5; Thu, 28 May 2020 09:48:23 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 28 May 2020 09:48:23 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 28 May 2020 09:48:21 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 28 May 2020 09:48:21 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Index: AQHWNE0m0J0mZmLrdk2DDG4EFRRFkKi9P/oAgAABYQA=
Date: Thu, 28 May 2020 09:48:21 +0000
Message-ID: <d1b21c8c9be24425abef57f394722c9a@EX13D32EUC003.ant.amazon.com>
References: <20200527173407.1398-1-paul@xen.org>
 <20200527173407.1398-5-paul@xen.org>
 <5589a800-a40a-5534-d2e8-09df78072b02@suse.com>
In-Reply-To: <5589a800-a40a-5534-d2e8-09df78072b02@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.118]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI4IE1heSAyMDIwIDEwOjQyDQo+IFRvOiBQYXVsIER1cnJh
bnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgSWFuIEphY2tzb24NCj4gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZQ0KPiBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVm
YW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJF
OiBbRVhURVJOQUxdIFtQQVRDSCB2NiA0LzVdIGNvbW1vbi9kb21haW46IGFkZCBhIGRvbWFpbiBj
b250ZXh0IHJlY29yZCBmb3Igc2hhcmVkX2luZm8uLi4NCj4gDQo+IENBVVRJT046IFRoaXMgZW1h
aWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0
aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9u
IDI3LjA1LjIwMjAgMTk6MzQsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBAQCAtMTY0OSw2ICsx
NjUwLDc1IEBAIGludCBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KA0KPiA+ICAgICAgcmV0dXJu
IDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IHNhdmVfc2hhcmVkX2luZm8oY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbl9jb250ZXh0ICpjLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBkcnlfcnVuKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1
Y3QgZG9tYWluX3NoYXJlZF9pbmZvX2NvbnRleHQgY3R4dCA9IHsNCj4gPiArI2lmZGVmIENPTkZJ
R19DT01QQVQNCj4gPiArICAgICAgICAuZmxhZ3MgPSBoYXNfMzJiaXRfc2hpbmZvKGQpID8gRE9N
QUlOX1NBVkVfMzJCSVRfU0hJTkZPIDogMCwNCj4gPiArICAgICAgICAuYnVmZmVyX3NpemUgPSBo
YXNfMzJiaXRfc2hpbmZvKGQpID8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
c3RydWN0IGNvbXBhdF9zaGFyZWRfaW5mbykgOg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihzdHJ1Y3Qgc2hhcmVkX2luZm8pLA0KPiA+ICsjZWxzZQ0KPiA+ICsgICAgICAgIC5i
dWZmZXJfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qgc2hhcmVkX2luZm8pLA0KPiA+ICsjZW5kaWYNCj4g
DQo+IFRvIHByZXZlbnQgZGlzY29ubmVjdCBiZXR3ZWVuIHRoZSB0eXBlcyB1c2VkIGhlcmUgYW5k
IHRoZSBhY3R1YWwNCj4gcG9pbnRlciBjb3BpZWQgZnJvbSwgSSdkIGhhdmUgcHJlZmVycmVkDQo+
IA0KPiAjaWZkZWYgQ09ORklHX0NPTVBBVA0KPiAgICAgICAgIC5mbGFncyA9IGhhc18zMmJpdF9z
aGluZm8oZCkgPyBET01BSU5fU0FWRV8zMkJJVF9TSElORk8gOiAwLA0KPiAgICAgICAgIC5idWZm
ZXJfc2l6ZSA9IGhhc18zMmJpdF9zaGluZm8oZCkgPw0KPiAgICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihkLT5zaGFyZWRfaW5mby0+Y29tcGF0KSA6DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKGQtPnNoYXJlZF9pbmZvLT5uYXRpdmUpLA0KPiAjZWxzZQ0KPiAgICAgICAgIC5i
dWZmZXJfc2l6ZSA9IHNpemVvZigqZC0+c2hhcmVkX2luZm8pLA0KPiAjZW5kaWYNCj4gDQo+IEJ1
dCB0aGlzIGlzIHNlY29uZGFyeSwgYXMgdGhlIHR5cGVzIGluZGVlZCBhcmUgdmVyeSB1bmxpa2Vs
eSB0byBnbw0KPiBvdXQgb2Ygc3luYy4gV2hhdCdzIG1vcmUgaW1wb3J0YW50IGlzIC4uLg0KPiAN
Cj4gPiArc3RhdGljIGludCBsb2FkX3NoYXJlZF9pbmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBkb21haW5fY29udGV4dCAqYykNCj4gPiArew0KPiA+ICsgICAgc3RydWN0IGRvbWFpbl9zaGFy
ZWRfaW5mb19jb250ZXh0IGN0eHQ7DQo+ID4gKyAgICBzaXplX3QgaGRyX3NpemUgPSBvZmZzZXRv
Zih0eXBlb2YoY3R4dCksIGJ1ZmZlcik7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiAr
ICAgIGludCByYzsNCj4gPiArDQo+ID4gKyAgICByYyA9IERPTUFJTl9MT0FEX0JFR0lOKFNIQVJF
RF9JTkZPLCBjLCAmaSk7DQo+ID4gKyAgICBpZiAoIHJjICkNCj4gPiArICAgICAgICByZXR1cm4g
cmM7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBpICkgLyogZXhwZWN0IG9ubHkgYSBzaW5nbGUgaW5z
dGFuY2UgKi8NCj4gPiArICAgICAgICByZXR1cm4gLUVOWElPOw0KPiA+ICsNCj4gPiArICAgIHJj
ID0gZG9tYWluX2xvYWRfZGF0YShjLCAmY3R4dCwgaGRyX3NpemUpOw0KPiA+ICsgICAgaWYgKCBy
YyApDQo+ID4gKyAgICAgICAgcmV0dXJuIHJjOw0KPiA+ICsNCj4gPiArICAgIGlmICggY3R4dC5i
dWZmZXJfc2l6ZSA+IHNpemVvZihzaGFyZWRfaW5mb190KSB8fA0KPiA+ICsgICAgICAgICAoY3R4
dC5mbGFncyAmIH5ET01BSU5fU0FWRV8zMkJJVF9TSElORk8pICkNCj4gPiArICAgICAgICByZXR1
cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGN0eHQuZmxhZ3MgJiBET01BSU5fU0FW
RV8zMkJJVF9TSElORk8gKQ0KPiA+ICsjaWZkZWYgQ09ORklHX0NPTVBBVA0KPiA+ICsgICAgICAg
IGhhc18zMmJpdF9zaGluZm8oZCkgPSB0cnVlOw0KPiA+ICsjZWxzZQ0KPiA+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gKyAgICByYyA9IGRvbWFpbl9s
b2FkX2RhdGEoYywgZC0+c2hhcmVkX2luZm8sIHNpemVvZihzaGFyZWRfaW5mb190KSk7DQo+ID4g
KyAgICBpZiAoIHJjICkNCj4gPiArICAgICAgICByZXR1cm4gcmM7DQo+IA0KPiAuLi4gdGhlIHN0
aWxsIGluc3VmZmljaWVudCBjaGVja2luZyBoZXJlLiBZb3Ugc2hvdWxkbid0IGFjY2VwdCBtb3Jl
DQo+IHRoYW4gc2l6ZW9mKGQtPnNoYXJlZF9pbmZvLT5jb21wYXQpIHdvcnRoIG9mIGRhdGEgaW4g
dGhlIGNvbXBhdCBjYXNlDQo+IGlmIHlvdSBhbHNvIGRvbid0IGFjY2VwdCBtb3JlIHRoYW4gc2l6
ZW9mKHNoYXJlZF9pbmZvX3QpIGluIHRoZQ0KPiBuYXRpdmUgY2FzZS4gVG8gc2F2ZSBhbm90aGVy
IHJvdW5kIHRyaXAgSSdsbCBvZmZlciB0byBtYWtlIHRoZQ0KPiBhZGp1c3RtZW50cyB3aGlsZSBj
b21taXR0aW5nLCBidXQgcGF0Y2hlcyAzIGFuZCA1IHdhbnQgQW5kcmV3J3MgYWNrDQo+IGZpcnN0
IGFueXdheS4NCg0KT2ssIHRoYW5rcy4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0K

