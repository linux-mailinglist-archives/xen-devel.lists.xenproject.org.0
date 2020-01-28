Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761A14B7CA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:18:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRer-00014T-1J; Tue, 28 Jan 2020 14:16:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwReq-00014K-5l
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:16:00 +0000
X-Inumbo-ID: b4bf83c0-41d8-11ea-8396-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4bf83c0-41d8-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580220959; x=1611756959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jecrNVJb4FVrKRzaQ2G+gq/m4UxaNiZxNbiNZP5D1vg=;
 b=eYSgEmMdnjJPQ5/yoodegcaslPk1myDBEc0LLX2ZH9s6/3tfRIdvzCfb
 1SVGS4qd17kxRajJBAF/xc/Bak3kyzwCeevnANml+okwsUOGnTrvUT34h
 txajJB7G8Vb/uftb2RhSxlC4E47YjoX2C/ewcHKej8vJ+LNqbZqhwf8K4 E=;
IronPort-SDR: wint9s8kLRUnE5h2k27l5aEQnq8b5p/ULHQAqPiyBkeYUrcqYJgt+QGDCqA2QJggBpVdefIUni
 eu68oyf9jsYw==
X-IronPort-AV: E=Sophos;i="5.70,374,1574121600"; d="scan'208";a="22925167"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 28 Jan 2020 14:15:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id A8E47A1E99; Tue, 28 Jan 2020 14:15:45 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 14:15:45 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 14:15:44 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 28 Jan 2020 14:15:44 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>
Thread-Topic: [Xen-devel] [PATCH v3 2/2] docs/designs: Add a design document
 for migration of xenstore data
Thread-Index: AQHV1dZ3TShEBUoOd0SzRCxqU6JPRagAFvaAgAAICZA=
Date: Tue, 28 Jan 2020 14:15:44 +0000
Message-ID: <4e78bb4f37354fa1b0e32cdebb569ac3@EX13D32EUC003.ant.amazon.com>
References: <20200128122823.12920-1-pdurrant@amazon.com>
 <20200128122823.12920-3-pdurrant@amazon.com>
 <20200128134618.dqhluq5od4gapihx@debian>
In-Reply-To: <20200128134618.dqhluq5od4gapihx@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyOCBKYW51YXJ5IDIwMjAgMTM6NDYNCj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1IDx3
bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMgMi8yXSBkb2NzL2Rlc2lnbnM6
IEFkZCBhIGRlc2lnbg0KPiBkb2N1bWVudCBmb3IgbWlncmF0aW9uIG9mIHhlbnN0b3JlIGRhdGEN
Cj4gDQo+IE9uIFR1ZSwgSmFuIDI4LCAyMDIwIGF0IDEyOjI4OjIzUE0gKzAwMDAsIFBhdWwgRHVy
cmFudCB3cm90ZToNCj4gPiArYGBgDQo+ID4gKzAgICAgIDEgICAgIDIgICAgIDMgICAgIDQgICAg
IDUgICAgIDYgICAgIDcgb2N0ZXQNCj4gPiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gK3wgdHlwZSAgICAgICAgICAgICAgICAgICB8IHJl
Y29yZCBzcGVjaWZpYyBkYXRhICAgfA0KPiA+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAg
ICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiArLi4uDQo+ID4gKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ICtgYGANCj4gPiArDQo+ID4g
Kw0KPiA+ICt8IEZpZWxkIHwgRGVzY3JpcHRpb24gfA0KPiA+ICt8LS0tfC0tLXwNCj4gPiArfCBg
dHlwZWAgfCAweDAwMDAwMDAwOiBpbnZhbGlkIHwNCj4gPiArfCAgICAgICAgfCAweDAwMDAwMDAx
OiBub2RlIGRhdGEgfA0KPiA+ICt8ICAgICAgICB8IDB4MDAwMDAwMDI6IHdhdGNoIGRhdGEgfA0K
PiA+ICt8ICAgICAgICB8IDB4MDAwMDAwMDMgLSAweEZGRkZGRkZGOiByZXNlcnZlZCBmb3IgZnV0
dXJlIHVzZSB8DQo+ID4gKw0KPiA+ICsNCj4gPiArd2hlcmUgZGF0YSBpcyBhbHdheXMgaW4gdGhl
IGZvcm0gb2YgYSBOVUwgc2VwYXJhdGVkIGFuZCB0ZXJtaW5hdGVkDQo+IHR1cGxlDQo+ID4gK2Fz
IGZvbGxvd3MNCj4gPiArDQo+IA0KPiBJcyB0aGVyZSBhbnkgcGFkZGluZyByZXF1aXJlbWVudCBm
b3IgYSByZWNvcmQ/IEkgdGFrZSBpdCB0aGVyZSBpc24ndD8NCj4gDQoNCk5vLCB0aGUgcGFkZGlu
ZyBpcyBhdCB0aGUgZ2VuZXJpYyByZWNvcmQgbGV2ZWwgKGFscmVhZHkgcGFydCBvZiB0aGUgc3Bl
YykuDQoNCiAgUGF1bA0KDQo+IFdlaS4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
