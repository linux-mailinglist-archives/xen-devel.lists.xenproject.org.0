Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBD1DE94D
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 16:46:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc8ve-0005fW-Kj; Fri, 22 May 2020 14:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/N6j=7E=amazon.co.uk=prvs=4046e5fc3=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jc8vd-0005ew-F4
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 14:45:41 +0000
X-Inumbo-ID: e84aca26-9c3a-11ea-abe8-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e84aca26-9c3a-11ea-abe8-12813bfff9fa;
 Fri, 22 May 2020 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1590158740; x=1621694740;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=kJ3G5h5R9joMKLzin3L9d4K2HP8nBlD8g5ghuL/Bd64=;
 b=m+3EztwoSEPZSLxbPXYCGIpYgyL8deaIwp5zr0wZ63nTL1+aWezjaeDB
 bcwqRlB7QINkA3FTUX/qAr+FPBtyT06vXdJVR0laKvSbaqjM/tIePGTWd
 NnxKc1iEBnU+1l4XXbG5xobytqa/5tCfvaQbItLE1bAvK99yMqQIJLYmj Y=;
IronPort-SDR: jiMOppQ1yMgSPtqEVMYZsmrQNzIynvVqEpNBpwySO1L4nivtzQh0bLusrPZKj+wFKaDQRwzgq8
 YkvQw8g1vFnA==
X-IronPort-AV: E=Sophos;i="5.73,422,1583193600"; d="scan'208";a="33102427"
Subject: RE: [PATCH v5 4/5] common/domain: add a domain context record for
 shared_info...
Thread-Topic: [PATCH v5 4/5] common/domain: add a domain context record for
 shared_info...
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 22 May 2020 14:45:26 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2CD90A27F7; Fri, 22 May 2020 14:45:25 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 22 May 2020 14:45:24 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 22 May 2020 14:45:23 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 22 May 2020 14:45:23 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Index: AQHWL4u/5V4oBl6iUEe2r7qYlan7rai0LReAgAAA1EA=
Date: Fri, 22 May 2020 14:45:23 +0000
Message-ID: <2981a3e0608840bc8c41723c7f71fc39@EX13D32EUC003.ant.amazon.com>
References: <20200521161939.4508-1-paul@xen.org>
 <20200521161939.4508-5-paul@xen.org>
 <6090d080-e771-81fe-0b64-e25c7a8c52eb@suse.com>
In-Reply-To: <6090d080-e771-81fe-0b64-e25c7a8c52eb@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIyIE1heSAyMDIwIDE1OjM0DQo+IFRvOiBQYXVsIER1cnJh
bnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgSWFuIEphY2tzb24NCj4gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZQ0KPiBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVm
YW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJF
OiBbRVhURVJOQUxdIFtQQVRDSCB2NSA0LzVdIGNvbW1vbi9kb21haW46IGFkZCBhIGRvbWFpbiBj
b250ZXh0IHJlY29yZCBmb3Igc2hhcmVkX2luZm8uLi4NCj4gDQo+IENBVVRJT046IFRoaXMgZW1h
aWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0
aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9u
IDIxLjA1LjIwMjAgMTg6MTksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBAQCAtMTY0OSw2ICsx
NjUwLDcwIEBAIGludCBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KA0KPiA+ICAgICAgcmV0dXJu
IDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IHNhdmVfc2hhcmVkX2luZm8oY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbl9jb250ZXh0ICpjLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBkcnlfcnVuKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1
Y3QgZG9tYWluX3NoYXJlZF9pbmZvX2NvbnRleHQgY3R4dCA9IHsNCj4gPiArI2lmZGVmIENPTkZJ
R19DT01QQVQNCj4gPiArICAgICAgICAuZmxhZ3MgPSBoYXNfMzJiaXRfc2hpbmZvKGQpID8gRE9N
QUlOX1NBVkVfMzJCSVRfU0hJTkZPIDogMCwNCj4gPiArI2VuZGlmDQo+ID4gKyAgICAgICAgLmJ1
ZmZlcl9zaXplID0gc2l6ZW9mKHNoYXJlZF9pbmZvX3QpLA0KPiANCj4gQnV0IHRoaXMgc2l6ZSB2
YXJpZXMgYmV0d2VlbiBuYXRpdmUgYW5kIGNvbXBhdC4NCj4gDQo+ID4gK3N0YXRpYyBpbnQgbG9h
ZF9zaGFyZWRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluX2NvbnRleHQgKmMp
DQo+ID4gK3sNCj4gPiArICAgIHN0cnVjdCBkb21haW5fc2hhcmVkX2luZm9fY29udGV4dCBjdHh0
Ow0KPiA+ICsgICAgc2l6ZV90IGhkcl9zaXplID0gb2Zmc2V0b2YodHlwZW9mKGN0eHQpLCBidWZm
ZXIpOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gKyAgICBpbnQgcmM7DQo+ID4gKw0K
PiA+ICsgICAgcmMgPSBET01BSU5fTE9BRF9CRUdJTihTSEFSRURfSU5GTywgYywgJmkpOw0KPiA+
ICsgICAgaWYgKCByYyApDQo+ID4gKyAgICAgICAgcmV0dXJuIHJjOw0KPiA+ICsNCj4gPiArICAg
IGlmICggaSApIC8qIGV4cGVjdCBvbmx5IGEgc2luZ2xlIGluc3RhbmNlICovDQo+ID4gKyAgICAg
ICAgcmV0dXJuIC1FTlhJTzsNCj4gPiArDQo+ID4gKyAgICByYyA9IGRvbWFpbl9sb2FkX2RhdGEo
YywgJmN0eHQsIGhkcl9zaXplKTsNCj4gPiArICAgIGlmICggcmMgKQ0KPiA+ICsgICAgICAgIHJl
dHVybiByYzsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGN0eHQuYnVmZmVyX3NpemUgIT0gc2l6ZW9m
KHNoYXJlZF9pbmZvX3QpICkNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+IFdo
aWxlIG9uIHRoZSBzYXZlIHNpZGUgdGhpbmdzIGNvdWxkIGJlIGxlZnQgYXMgdGhleSBhcmUgKHll
dA0KPiBJJ2QgcHJlZmVyIGEgY2hhbmdlKSwgdGhpcyBzaG91bGQgYmUgZmxleGlibGUgZW5vdWdo
IHRvIGFsbG93DQo+IGF0IGxlYXN0IHRoZSBzbWFsbGVyIGNvbXBhdCBzaXplIGFzIHdlbGwgaW4g
dGhlIGNvbXBhdCBjYXNlLg0KDQpPaywgSSBndWVzcyB3ZSBjYW4gb3B0aW1pemUgdGhlIGJ1ZmZl
ciBzaXplIGRvd24gaWYgb25seSB0aGUgY29tcGF0IHZlcnNpb24gaXMgbmVlZGVkLiBTZWVtcyBs
aWtlIHNsaWdodGx5IHBvaW50bGVzcyBjb21wbGV4aXR5IHRob3VnaC4NCg0KPiBJIHdvbmRlciB3
aGV0aGVyIGFueSBzbWFsbGVyIHNpemVzIG1pZ2h0IGJlIGFjY2VwdGFibGUsIG9uY2UNCj4gYWdh
aW4gd2l0aCB0aGUgcmVzdCBnZXR0aW5nIHplcm8tcGFkZGVkLg0KPiANCg0KSWYgdGhlIG5lZWQg
YXJpc2VzIHRvIHplcm8gZXh0ZW5kIGFuIG9sZGVyIHNoYXJlZF9pbmZvIHZhcmlhbnQgdGhlbiB0
aGF0IGNhbiBiZSBkb25lIGluIGZ1dHVyZS4NCg0KPiA+ICsgICAgaWYgKCBjdHh0LmZsYWdzICYg
RE9NQUlOX1NBVkVfMzJCSVRfU0hJTkZPICkNCj4gPiArI2lmZGVmIENPTkZJR19DT01QQVQNCj4g
PiArICAgICAgICBoYXNfMzJiaXRfc2hpbmZvKGQpID0gdHJ1ZTsNCj4gPiArI2Vsc2UNCj4gPiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArI2VuZGlmDQo+IA0KPiBBbSBJIG1pcy1yZW1l
bWJlcmluZyBvciB3YXMgYSBjaGVjayBsb3N0IG9mIHRoZSByZW1haW5pbmcNCj4gZmxhZ3MgYmVp
bmcgemVybz8gSWYgSSBhbSwgb25lIG5lZWRzIGFkZGluZyBpbiBhbnkgY2FzZSwgaW1vLg0KPiAN
Cg0KSXQgd2Fzbid0IGZsYWdzIGJlZm9yZSwgYnV0IHlvdSdyZSBxdWl0ZSByaWdodDsgdGhleSBz
aG91bGQgYmUgemVyby1jaGVja2VkLg0KDQogIFBhdWwNCg0KPiBKYW4NCg==

