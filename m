Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA1234261
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 11:22:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1REv-0001i7-P7; Fri, 31 Jul 2020 09:22:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXbV=BK=amazon.co.uk=prvs=4749be70b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k1REu-0001i0-N9
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 09:22:08 +0000
X-Inumbo-ID: 4dddf39e-d30f-11ea-8e1f-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dddf39e-d30f-11ea-8e1f-bc764e2007e4;
 Fri, 31 Jul 2020 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596187328; x=1627723328;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=hqb9Ru6P4OkJF5q16qJJmtAlLQTi/lbwbWAdxeSqxP8=;
 b=iXzafmxvz8gePJiJkK7XdpELjvlVUP7mGk7vpY359cWKVToS+klZS8hY
 iBROnoAJsUbJzU157hQWPYln32tKfH7mIxg7unQcsLeQjL5SgKE+lO/M0
 F3V19PXNyc5LKtlyMt4eM/r4w+lPJdNGs+Nl2hss1CD/0an8OttrF1VkA c=;
IronPort-SDR: QnSz88uG4O7oScxGzDs8yBhXe6YcDygdado8zqmzkRCsbyDMmZ4oiRp4lgRJe5LH1+MEna5tVF
 cQ4rkG5n2Atg==
X-IronPort-AV: E=Sophos;i="5.75,417,1589241600"; d="scan'208";a="63241284"
Subject: RE: [PATCH v2 08/10] remove remaining uses of iommu_legacy_map/unmap
Thread-Topic: [PATCH v2 08/10] remove remaining uses of iommu_legacy_map/unmap
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 31 Jul 2020 09:22:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id A8351A1DDE; Fri, 31 Jul 2020 09:22:00 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 09:22:00 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 09:21:59 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 31 Jul 2020 09:21:59 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQEfdnyAAr67l4isBdEg8WCGHUeFkAH+vB2Yqn9TdzA=
Date: Fri, 31 Jul 2020 09:21:58 +0000
Message-ID: <ccd1e0d3ba334dc5b1ba37734f581b3b@EX13D32EUC003.ant.amazon.com>
References: <20200730142926.6051-1-paul@xen.org>
 <20200730142926.6051-9-paul@xen.org>
In-Reply-To: <20200730142926.6051-9-paul@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBhdWxA
eGVuLm9yZz4NCj4gU2VudDogMzAgSnVseSAyMDIwIDE1OjI5DQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5j
by51az47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBp
bnRlbC5jb20+Ow0KPiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gU3ViamVj
dDogW0VYVEVSTkFMXSBbUEFUQ0ggdjIgMDgvMTBdIHJlbW92ZSByZW1haW5pbmcgdXNlcyBvZiBp
b21tdV9sZWdhY3lfbWFwL3VubWFwDQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0
ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuDQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBh
bmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0KPiBGcm9tOiBQYXVsIER1
cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IA0KPiBUaGUgJ2xlZ2FjeScgZnVuY3Rpb25z
IGRvIGltcGxpY2l0IGZsdXNoaW5nIHNvIGFtZW5kIHRoZSBjYWxsZXJzIHRvIGRvIHRoZQ0KPiBh
cHByb3ByaWF0ZSBmbHVzaGluZy4NCj4gDQo+IFVuZm9ydHVuYXRlbHksIGJlY2F1c2Ugb2YgdGhl
IHN0cnVjdHVyZSBvZiB0aGUgUDJNIGNvZGUsIHdlIGNhbm5vdCByZW1vdmUNCj4gdGhlIHBlci1D
UFUgJ2lvbW11X2RvbnRfZmx1c2hfaW90bGInIGdsb2JhbCBhbmQgdGhlIG9wdGltaXphdGlvbiBp
dA0KPiBmYWNpbGl0YXRlcy4gSXQgaXMgbm93IGNoZWNrZWQgZGlyZWN0bHkgaW9tbXVfaW90bGJf
Zmx1c2goKS4gQWxzbywgaXQgaXMNCj4gbm93IGRlY2xhcmVkIGFzIGJvb2wgKHJhdGhlciB0aGFu
IGJvb2xfdCkgYW5kIHNldHRpbmcvY2xlYXJpbmcgaXQgYXJlIG5vDQo+IGxvbmdlciBwb2ludGxl
c3NseSBnYXRlZCBvbiBpc19pb21tdV9lbmFibGVkKCkgcmV0dXJuaW5nIHRydWUuIChBcmd1YWJs
eQ0KPiBpdCBpcyBhbHNvIHBvaW50bGVzcyB0byBnYXRlIHRoZSBjYWxsIHRvIGlvbW11X2lvdGxi
X2ZsdXNoKCkgb24gdGhhdA0KPiBjb25kaXRpb24gLSBzaW5jZSBpdCBpcyBhIG5vLW9wIGluIHRo
YXQgY2FzZSAtIGJ1dCB0aGUgaWYgY2xhdXNlIGFsbG93cw0KPiB0aGUgc2NvcGUgb2YgYSBzdGFj
ayB2YXJpYWJsZSB0byBiZSByZXN0cmljdGVkKS4NCj4gDQo+IE5PVEU6IFRoZSBjb2RlIGluIG1l
bW9yeV9hZGQoKSBub3cgZmFpbHMgaWYgdGhlIG51bWJlciBvZiBwYWdlcyBwYXNzZWQgdG8NCj4g
ICAgICAgYSBzaW5nbGUgY2FsbCBvdmVyZmxvd3MgYW4gdW5zaWduZWQgaW50LiBJIGRvbid0IGJl
bGlldmUgdGhpcyB3aWxsDQo+ICAgICAgIGV2ZXIgaGFwcGVuIGluIHByYWN0aWNlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KDQpJIHJl
YWxpc2Ugbm93IHRoYXQgSSBjb21wbGV0ZWx5IGZvcmdvdCB0byBhZGRyZXNzIEphbidzIGNvbW1l
bnRzIG9uIGdyYW50IHRhYmxlIGxvY2tpbmcgYW5kIGZsdXNoIGJhdGNoaW5nLCBzbyB0aGVyZSB3
aWxsIGJlIGEgdjMgb2YgYXQgbGVhc3QgdGhpcyBwYXRjaC4NCg0KICBQYXVsDQo=

